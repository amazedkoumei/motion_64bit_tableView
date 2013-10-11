# -*- coding: utf-8 -*-
class MainTableViewController < UITableViewController

  def viewDidLoad()
    super
    navigationItem.title = "Setting"
  end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    menus.count
  end

  CELLID = "menus"
  def tableView(tableView, cellForRowAtIndexPath:indexPath)

    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELLID)
      cell
    end

    cell.selectionStyle = UITableViewCellSelectionStyleBlue
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator

    # I want to do this but app will crash
    #cell.textLabel.text = menus[indexPath.row]

    # print-debug but app will crash
    #p indexPath
    
    # success when indexPath is not referred
    cell.textLabel.text = "hoge"
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
  end

  def menus
    @menus = [
      "Github Account"
    ]
  end

end
