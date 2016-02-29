import UIKit

class CYSMinePlanViewController: CYSBaseViewController,CYCustomSegmentedViewDelegate {
    
    let kMineLblIdentifier : String = "MineLblCell"
    
    var selectIndex : Int = 0
    var tableView = UITableView()
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.translucent = false
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.translucent = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLayoutView()
        self.initNavigationBar()
        self.initLoadingData()
    }
    
    func initLoadingData(){
        
    }
    func initLayoutView(){
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.registerNib(UINib(nibName: "CYMineLblCell", bundle: nil), forCellReuseIdentifier: kMineLblIdentifier)
        let tableViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[tableView]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["tableView" : tableView])
        let layoutVConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[tableView]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["tableView" : tableView])
        
        
        self.view.addConstraints(tableViewHConstraints)
        self.view.addConstraints(layoutVConstraints)
        self.tableViewReloadData()
    }
    func initNavigationBar(){
        
        let segmentedControl : UISegmentedControl = UISegmentedControl(items: [CYNSLocalizedString("热门"),CYNSLocalizedString("筛选")])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: "updateTitleIndex:", forControlEvents: .ValueChanged)
        self.navigationItem.titleView = segmentedControl
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .Plain, target: self, action: "actionSearch:")
    }
    
    
    //MARK:- NavigationEvent
    func updateTitleIndex(segmentedControl : UISegmentedControl){
        if segmentedControl.selectedSegmentIndex == 0{
        }
        else{
            
        }
    }
    
    
    //MARK:- NavigationEvent
    func actionMessage(messageItem : UIBarButtonItem){
        
    }
    func actionAdd(addItem : UIBarButtonItem){
        
    }
    func actionSearch(searchItem : UIBarButtonItem){
        
    }
    //MARK:- CYCustomSegmentedViewDelegate、CYCustomButtons
    func customSegmentedView(segmentedView: CYCustomSegmentedView, selectIndex: Int) {
        self.selectIndex = selectIndex
        self.tableViewReloadData()
    }
    
}

//MARK:- TableViewDelegate
extension CYSMinePlanViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableViewReloadData(){
        if false{
            self.tableView.separatorStyle = .None
        }
        else{
            self.tableView.separatorStyle = .SingleLine
        }
        
        
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return selectIndex == 0 ? 130 : 120
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(kMineLblIdentifier, forIndexPath: indexPath)
        
        if let mineLblCell = cell as? CYMineLblCell{
            
            //mineLblCell.comeLabel.text="昨天"
            mineLblCell.titleLable.text = "＝＝＝＝我我我我我我我我我"
            mineLblCell.contentLabel.text = "qqqq我我我我我我我我"
        }
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if selectIndex == 0{
            
        }else{
            let userDetailedViewController = CYUserDetailedViewController()
            self.navigationController?.pushViewController(userDetailedViewController, animated: true)
        }
    }
    
}
