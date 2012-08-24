class ItemsController < UITableViewController

  def init
    initWithStyle(nil)
  end

  def initWithStyle(style)
    # Always use a specific style, regardless of param passed.
    super(UITableViewStyleGrouped)

    20.times do
      ItemStore.sharedStore.createItem
    end

    self
  end

  def numberOfSectionsInTableView(tableView)
    2
  end

  def tableView(tableView, numberOfRowsInSection:section)
    if section == 0
      ItemStore.sharedStore.itemsUnder.size + 1
    elsif section == 1
      ItemStore.sharedStore.itemsOver.size + 1
    end
  end

  def tableView(tableView, titleForHeaderInSection:section)
    if section == 0
      "Items Under"
    elsif section == 1
      "Items Over"
    end
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    # Check for a reusable cell first, and use that if it exists.
    cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")

    # If there is no reuable cell of this type, create a new one.
    cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:"UITableViewCell") unless cell

    # Set the text of the cell with the description of the item
    # that is the nth index of items, where n = row that this cell
    # will appear in on the tableview.
    section = indexPath.section
    row = indexPath.row

    p = nil
    if section == 0
      under = ItemStore.sharedStore.itemsUnder
      p = row == under.size ? "No more items!" : under[row]
    elsif section == 1
      over = ItemStore.sharedStore.itemsOver
      p = row == over.size ? "No more items!" : over[row]
    end

    cell.textLabel.setText(p.to_s)

    cell
  end

end