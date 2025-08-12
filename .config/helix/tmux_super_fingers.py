import os
from .targets.file_target import FileTarget
from .actions.send_to_vim_in_tmux_pane_action import SendToVimInTmuxPaneAction
from .actions.action import Action
from .targets.target_payload import EditorOpenable
from .cli_adapter import RealCliAdapter, CliAdapter


class SendToHelixAction(Action):
    def __init__(self, target_payload: EditorOpenable, cli_adapter: CliAdapter = RealCliAdapter()):
        self.target_payload = target_payload
        self.cli_adapter = cli_adapter

    def _perform(self):
        path = self.target_payload.file_path

        if self.target_payload.line_number:
            path += f':{self.target_payload.line_number}'

        os.system(f'code -g {path}')
        
    def perform(self) -> None:
        editor_pane = self.cli_adapter.find_tmux_pane_with_running_process(os.environ['EDITOR'])

        if editor_pane:
            self.cli_adapter.select_tmux_window(editor_pane.pane_id)
            self.cli_adapter.tmux_send_keys(editor_pane.pane_id, "Escape")
            self.cli_adapter.tmux_send_keys(editor_pane.pane_id,f":o\ {self._hx_o_args()}")
            self.cli_adapter.tmux_send_keys(editor_pane.pane_id, "Enter")
            self.cli_adapter.select_tmux_pane(editor_pane.pane_id)
        else:
            self.cli_adapter.new_tmux_window(
                os.environ['EDITOR'],
                f" '{os.environ['EDITOR']} {self._hx_o_args()}; {os.environ['SHELL']} -i'"
            )

    def _hx_o_args(self) -> str:
        if self.target_payload.line_number:
            return f'{self.target_payload.file_path}:{self.target_payload.line_number}'

        return f'{self.target_payload.file_path}'


FileTarget.primary_action = SendToHelixAction
FileTarget.secondary_action = SendToVimInTmuxPaneAction
