class Views::Tattoos::TattoosConfigComponent < ViewComponent::Base
  erb_template <<-ERB
    <div id="masnory-config" class="fixed bottom-0 z-50 flex justify-center w-[90vw] gap-2 pb-4 duration-200 bg-black/15 translate-y-20 duration-300">
      <%= render(Ui::MarkComponent.new(text: "изменить число колонок", id: 'col_count_button', className: 'cursor-pointer text-xl px-3 py-2 bg-black text-white rounded-md hover:opacity-[85%] duration-300')) %>
      <%= render(Ui::MarkComponent.new(text: "изменить размер отступов", id: 'gap_button', className: 'cursor-pointer text-xl px-3 py-2 bg-black text-white rounded-md hover:opacity-[85%] duration-300')) %>
      <%= render(Ui::MarkComponent.new(text: "сбросить", id: 'reset_button', variant: 'secondary', className: 'cursor-pointer text-xl px-3 py-2 ring-2 ring-black bg-white text-black rounded-md hover:opacity-[85%] duration-300')) %>
      <%= render(Ui::MarkComponent.new(text: "закрыть", id: 'close_button', variant: 'secondary', className: 'cursor-pointer text-xl px-3 py-2 ring-2 ring-black bg-white text-black rounded-md hover:opacity-[85%] duration-300')) %>
    </div>
  ERB

  def initialize()
  end
end
