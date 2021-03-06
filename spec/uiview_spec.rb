describe "UIView" do

  it "should convert to a UIImage" do
    test = UIView.alloc.initWithFrame([[0, 0], [10, 10]])
    image = test.uiimage
    image.class.should == UIImage
    CGSizeEqualToSize(image.size, [10, 10]).should == true
    image.scale.should == UIScreen.mainScreen.scale
  end

  it "should convert a UIScrollView to a UIImage" do
    test = UIScrollView.alloc.initWithFrame([[0, 0], [10, 10]])
    test.contentSize = [20, 20]

    image = test.uiimage
    image.class.should == UIImage
    CGSizeEqualToSize(image.size, [10, 10]).should == true
    image.scale.should == UIScreen.mainScreen.scale

    image = test.uiimage(:all)
    image.class.should == UIImage
    CGSizeEqualToSize(image.size, [20, 20]).should == true
    image.scale.should == UIScreen.mainScreen.scale

    image = test.uiimage(true)
    image.class.should == UIImage
    CGSizeEqualToSize(image.size, [20, 20]).should == true
    image.scale.should == UIScreen.mainScreen.scale
  end

  it "should convert bounds" do
    view1 = UIView.alloc.initWithFrame([[0, 0], [100, 100]])
    view2 = UIView.alloc.initWithFrame([[10, 5], [80, 90]])
    view1 << view2
    view3 = UIView.alloc.initWithFrame([[10, 5], [60, 80]])
    view2 << view3
    frame = view3.convert_bounds(view1)
    frame.origin.x.should == 20
    frame.origin.y.should == 10
    frame.size.width.should == 60
    frame.size.height.should == 80
  end

  it "should convert point" do
    view1 = UIView.alloc.initWithFrame([[0, 0], [100, 100]])
    view2 = UIView.alloc.initWithFrame([[10, 5], [80, 90]])
    view1 << view2
    view3 = UIView.alloc.initWithFrame([[10, 5], [60, 80]])
    view2 << view3
    point = view3.convert_origin(view1)
    point.x.should == 20
    point.y.should == 10
  end

end
