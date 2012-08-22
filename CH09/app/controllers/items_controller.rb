class ItemsController < UITableViewController

  def init
    initWithStyle(nil)
  end

  def initWithStyle(style)
    # Always use a specific style, regardless of param passed.
    super(UITableViewStyleGrouped)
  end

end