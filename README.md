# 現象
iPhone Retina (4-inchi 64-bit) シミュレータ でこのアプリを実行すると `tableView(tableView, cellForRowAtIndexPath:indexPath)` で indexPath が参照できません。


# 再現方法
この Repository を clone して rake すると、hoge という cell をもった tableView が表示されます。

次に、[main_table_view_controller.rb](https://github.com/amazedkoumei/motion_64bit_tableView/blob/master/app/main_table_view_controller.rb) の L28 あたりの以下のコード


```
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
```

`#p indexPath` のコメントアウトを外して rake すると、tableView は表示されずにアプリが終了します。  
コンソールには文字列 % が吐かれます。

# 環境

+ Xcode
	+ Version 5.0 (5A1413)
	+ Xode->Preference->Downloads から Command Line Tools はインストール済み
+ RubyMotion
	+ [https://github.com/HipByte/RubyMotion](https://github.com/HipByte/RubyMotion) を rake install
+ Ruby
	+ rbenv を使用
	+ ruby 1.9.3dev (2011-09-23 revision 33323) [x86_64-darwin12.2.1]
