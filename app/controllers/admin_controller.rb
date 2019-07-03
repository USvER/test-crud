class AdminController < ActionController::Base

  protected
    def add_breadcrumb(name, path = nil)
      @breadcrumbs ||= []
      @breadcrumbs << {name: name, path: path}
    end

    def self.add_breadcrumb(name, path = nil, options = {})
      before_action options do |controller|
        path = controller.send(path) if path.is_a? Symbol
        controller.send(:add_breadcrumb, name, path)
      end
    end
  end
