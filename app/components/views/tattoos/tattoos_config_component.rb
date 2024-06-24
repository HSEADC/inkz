class Views::Tattoos::TattoosConfigComponent < ViewComponent::Base
  erb_template <<-ERB
    <div id="masnory-config" class="fixed bottom-0 z-50 flex justify-center w-[90vw] gap-2 pb-3 duration-200 bg-black/15">
      <%= render(Ui::MarkComponent.new(text: "Change amount of columns", id: 'col_count_button', className: 'bg-black text-white')) %>
      <%= render(Ui::MarkComponent.new(text: "Change gap size", id: 'gap_button', className: 'bg-black text-white')) %>
      <%= render(Ui::MarkComponent.new(text: "Set max col width", id: 'max_col_width_button', className: 'bg-black text-white')) %>
    </div>
  ERB

  def initialize()
  end
end
