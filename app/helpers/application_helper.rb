module ApplicationHelper

    # Activar el link con routa y class is-active
    def current_class?(test_path)
        return 'is-active' if request.path == test_path
        ''
    end

    def page_title(separador = " - ")
        [content_for(:title), 'M']
    end
end
