class ItemsController < UITableViewController

  def init
    initWithStyle(nil)
  end

  def initWithStyle(style)
    # Always use a specific style, regardless of param passed.
    super(UITableViewStyleGrouped)

    5.times do
      ItemStore.sharedStore.createItem
    end

    self
  end

  def tableView(tableView, numberOfRowsInSection:section)
    ItemStore.sharedStore.items.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    # Check for a reusable cell first, and use that if it exists.
    cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")

    # If there is no reuable cell of this type, create a new one.
    cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:"UITableViewCell") unless cell

    # Set the text of the cell with the description of the item
    # that is the nth index of items, where n = row that this cell
    # will appear in on the tableview.
    p = ItemStore.sharedStore.items[indexPath.row]
    cell.textLabel.setText(p.to_s)

    cell
  end

end