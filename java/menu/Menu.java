import java.applet.Applet;

//import java.awt.Cursor;											//JDK 1.1
import java.awt.Event;
//import java.awt.event.MouseAdapter;				//JDK 1.1
//import java.awt.event.MouseEvent;						//JDK 1.1
//import java.awt.event.MouseMotionAdapter;	//JDK 1.1
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.ImageObserver;
import java.awt.image.ImageProducer;
import java.awt.MediaTracker;
import java.awt.Rectangle;

import java.net.MalformedURLException;
import java.net.URL;

/**
  * This class allows to have a grahical menu that changes its look when the
  * user moves the mouse on the menu; if the user press the button on the menu,
  * a URL is look for.<br>
  * The parameters for this applet are:<br>
  * frame : [optional] the frame to use to lunch the URL (default=_SELF)<br>
  * items : [optional] number of items in the image. The default is 1<br>
  * first : [optional] first item to display (default is 1)<br>
  * last  : [optional] last item to display (default is items)<br>
  * pos   : [optional] can be HORIZONTAL or VERTICAL (default is VERTICAL)<br>
  * image : [mandatory] the image (jpg or gif) that represents the menu.<br>
  *         If the applet has a size of (width x height), the image should have,<br>
  *         although this is not checked, the size (2*width x height). The left side<br>
  *         of the image contains the menu in its normal state, and the right side,<br>
  *         in its highlighted state.<br>
  *         If the menu is going to have 3 items, for example, and the applet size is<br>
  *         150 x 120, the developper should generate an image of 300 x 120, with <br>
  *         6 images inside, all with the same size.<br>
  *         If pos=HORIZONTAL, the size should be (2*height,width), and the highlighted<br>
  *					 images are in the down part of the image.<br>
  * For each item, it is also needed to give a parameter called 'dst%', with the<br>
  * destin URL. This is optional, it not given, the image doesn't change when the
  * the mouse moves on<br>
  * FIRST and LAST parameters are useful if two different MENUs can be displayed,
  * therefore is possible to include both in the same image.
  *<br>
  * The implementation of this applet is very simple, but:<br>
  * a) to speed it up, it is needed to load one image only, and not one for each<br>
  *         item in the menu. But to split an image is not directly supported in the<br>
  *         awt, and I have had to develop my own SplitImage class.
  * b) the event model has changed in the JDK 1.1; therefore, my nice 1.1 class didn't <br>
  *         work on any of the current browsers, and I have to use the deprecated API.<br>
  *         That's the reason because some parts of the code are inside comments: is the<br>
  *         JDK 1.1 compliant part.
  *
  * @author (c) LuisM Pena.
  * @version 0.2, September-1997
  */
public class Menu extends Applet implements ImageObserver, Runnable
{
	public void init()
	{
		//init some variables
		error=null;
		urls=null;
		image=null;
		bImagesReady=false;
		bValidImage=false;
		yPos=-1;
		selectedItem=-1;
		height=0;
		width=0;
		images=null;
//		normalCursor=new Cursor(Cursor.DEFAULT_CURSOR);		//JDK1.1
//		selectedCursor=new Cursor(Cursor.HAND_CURSOR);			//JDK1.1

		//get the parameters
		frame=getParameter("frame");
		if (frame==null)
			frame=new String("_self");
		nItemsTotal=getIntParameter("items",1,1,Integer.MAX_VALUE);
		firstItem=getIntParameter("first",1,1,nItemsTotal);
		lastItem=getIntParameter("last",nItemsTotal,firstItem,nItemsTotal);
		bVertical=isVertical();

		nItems=lastItem-firstItem+1;
		urls=getURLs();
		image=getImage();
		
		if (error==null)
			new Thread(this).start();
		else
		{
			showStatus(error);
			System.out.println(error);
		}
//		else
//		{
//			addMouseListener(new MenuMouseListener());								//JDK 1.1
//			addMouseMotionListener(new MenuMouseMotionListener());	//JDK 1.1
//		}
	}
	
	/**
	  * Gets the Pos parameter. If not given or it is VERTICAL, it returns true
	  * If it is HORIZONTAL, it returns false. If the parameter is given, but 
	  * is not a valid value, it sets the error variable
	  * If error is not null, it returns directly the defaultValue (true).
	  */
	boolean isVertical()
	{
		boolean ret=true;
		if (error==null)
		{
			String pos=getParameter("pos");
			if (pos!=null)
				if (pos.equalsIgnoreCase("horizontal"))
					ret=false;
				else if (!pos.equalsIgnoreCase("vertical"))
					error=new String("Error on parameter 'pos'");
		}
		return ret;
	}
	
	/**
	  * Gets the parameter associated to an string.
	  * If the parameter has not been given, it returns the default value.
	  * It is also checked that the value be between a min and a max value.
	  * If any error is produced, the error variable is changed
	  * If error is not null, it returns directly the defaultValue.
	  */
	int getIntParameter(String item, int defaultValue, int minValue, int maxValue)
	{
		int ret=defaultValue;
		if (error==null)
		{
			String retItem=getParameter(item);
			if (retItem!=null)
				try
				{
					ret=Integer.valueOf(retItem).intValue();
					if (ret<minValue)
						error=new String("Par. '"+item+"' must be >="+minValue);
					else if (ret>maxValue)
						error=new String("Par. '"+item+"' must be >="+maxValue);
				}
				catch(NumberFormatException nfe)
				{
					error=new String("Error on parameter '"+item+"'");
				}
		}
		return ret;
	}
	
	/**
	  * Get the URLs. If an error is produced, sets the error variable
	  * If error != null, it doesn't nothing
	  */
	
	URL[] getURLs()
	{
		URL [] urls=null;
		if (error==null)
		{
			urls=new URL[nItems];
			String szBaseURL=getCodeBase().toString();
			for (int i=0;error==null && i<nItems;i++)
			{
				String temp=getParameter("dst"+(i+1));
				if (temp==null)
					urls[i]=null;
				else
					try{urls[i]=new URL(szBaseURL+temp);}
					catch(MalformedURLException ex){error=new String(ex.toString());}
			}
		}
		return urls;
	}
	
	/**
	  * Gets the image given by the 'image' parameter. If an error is produced,
	  * the error variable is set.
	  * If error!=null, it returns false
	  */
	Image getImage()
	{
		Image ret=null;
		if (error==null)
		{
			String img=getParameter("image");
			if (img==null)
				error=new String("Parameter 'image' not found");
			else
				ret=getImage(getCodeBase(),img);
		}
		return ret;
	}
	
	public void paint(Graphics g)
	{
		//Calculate first the possition to draw any error string
		if (yPos==-1)
//			yPos=g.getClipBounds().height/2;				//JDK1.1
			yPos=g.getClipRect().height/2;						//JDK1.0
		if (error!=null)
			g.drawString(error,0,yPos);
		else if (!bImagesReady)
			g.drawString("Loading...",0,yPos);
		else if (bValidImage)
		{
			int pos=0;
			for (int i=0;i<nItems;i++)
			{
				int which=(i==selectedItem)? 1 : 0;
				if (bVertical)
				{
					g.drawImage(images[i][which],0,pos,this);
					pos+=height;
				}
				else
				{
					g.drawImage(images[i][which],pos,0,this);
					pos+=width;
				}
			}
		}
	}
	
	public boolean imageUpdate(Image img, int infoflags, int x, int y, int w, int h)
	{
		boolean ret;
		if ((infoflags&ImageObserver.ERROR)!=0)
		{
			ret=false;
			error=new String("Error drawing images");
			repaint();
		}
		else
			ret=true;
		return ret;
	}
	
	/**
	  * Returns the item where the cursor is positioned, or -1 if it is not
	  * positioned on a valid item (it hasn't an URL destin, for example)
	  * @param pos the y pos (if pos=VERTICAL) or the x pos (if pos=HORIZONTAL)
	  */
	int getCurrentItem(int pos)
	{
		int ret=-1;
		if (bValidImage)
		{
			int relative=pos / (bVertical? height : width);
			if (relative>=0 && relative <nItems)
				if (urls[relative]!=null)
					ret=relative;
		}
		return ret;
	}

	/**
	  * Method called in response to any mouse movement event
	  * @param pos the y pos (if pos=VERTICAL) or the x pos (if pos=HORIZONTAL)
	  */	
	void mouseIn(int pos)
	{
		int newSelectedItem=getCurrentItem(pos);
		if (newSelectedItem==-1)
			noItemsSelected();
		else if(newSelectedItem!=selectedItem)
		{
//			setCursor(selectedCursor);									//JDK1.1
			showStatus(urls[newSelectedItem].toString());
			repaint(selectedItem);
			repaint(newSelectedItem);
			selectedItem=newSelectedItem;
		}
	}
	
	/**
	  * Method called when no menu items are selected.
	  * It also makes selectedItem=-1
	  */
	void noItemsSelected()
	{
		if (selectedItem!=-1)
		{
//			setCursor(normalCursor);										//JDK1.1
			showStatus("");
			repaint(selectedItem);
			selectedItem=-1;
		}
	}
	/**
	  * Method called to repaint the item n
	  */
	void repaint(int item)
	{
		if (bVertical)
			repaint(0,height*item,width,height);
		else
			repaint(width*item,0,width, height);
	}
	
	public boolean mouseMove(Event evt, int x, int y)
	{
		mouseIn(bVertical? y : x);
		return true;
	}
	
	public boolean mouseExit(Event evt, int x, int y)
	{
		if (bImagesReady)
			noItemsSelected();
		return true;
	}
	
	public boolean mouseDown(Event evt, int x, int y)
	{
		if (selectedItem>=0 && selectedItem<nItems)
			getAppletContext().showDocument(urls[selectedItem],frame);
		return true;
	}
	
	public String getAppletInfo()
	{
		return "Menu v0.2, (c) LuisM Pena, September-1997";
	}
	
	public String[][] getParameterInfo()
	{
		String ret[][]=
		{
			{"frame", "String", "frame to be used when URLs are launched"},
			{"items", "int", "Number of items in the image (default is 1)"},
			{"first", "int", "first item to display (default is 1)"},
			{"last",  "int", "last item to display (default is 1)"},
			{"pos",   "String", "HORIZONTAL or VERTICAL (default value)"},
			{"image", "String", "The image that contains the menu items"},
			{"dst%","URL","One of this parameter for each item, giving the destin URL"}
		};
		return ret;
	}

	public void run()
	{
		try
		{
			SplitImage splitter;
			if (bVertical)
				splitter=new SplitImage(image,nItemsTotal,2);
			else
				splitter=new SplitImage(image,2,nItemsTotal);
			images=new Image[nItems][2];
			MediaTracker media=new MediaTracker(this);
			ImageProducer producer;
			for (int i=firstItem;i<=lastItem;i++)
			{
				int row=i-firstItem;
				for (int j=0;j<2;j++)
				{
					if (bVertical)
						producer=splitter.getImageProducer(i-1,j);
					else
						producer=splitter.getImageProducer(j,i-1);
					if (producer==null)
						throw new Exception();
					images[row][j]=createImage(producer);
					media.addImage(images[row][j],2*row+j);
				}
			}
			media.waitForAll();
			height=splitter.getHeight();
			width=splitter.getWidth();
		}
		catch(Exception ex)
		{
			error=new String("Error loading image");
		}
		bValidImage=height>0 && width>0;
		bImagesReady=true;
		repaint();
	}

//	Rest is only valid for JDK 1.1
//	
//	class MenuMouseListener extends MouseAdapter
//	{
//		public void mouseExited(MouseEvent ev)
//		{
//				if (bImagesReady)
//					noItemsSelected();
//				return true;
//		}
//		public void mousePressed(MouseEvent ev)
//		{
//			if (selectedItem>=0 && selectedItem<nItems)
//				getAppletContext().showDocument(urls[selectedItem],frame);
//		}
//	}
//	
//	class MenuMouseMotionListener extends MouseMotionAdapter
//	{
//		public void mouseMoved(MouseEvent ev)
//		{
//			mouseIn(ev.getY());
//		}
//	}
//	

	/**
	  * Variable to store any error
	  */
	String error;
	/**
	  * Frame to use when jumoing to a URL
	  */
	String frame;
	/**
	  * Cursors
	  */
//	Cursor normalCursor,selectedCursor;									//JDK1.1
	/**
	  * nItemsTotal is the number of items in the image
	  * nItems is the number of items to use in the menu
	  * firstItem is the first item of the image to use
	  * lastItem is the last Item of the image to use
	  */
	int nItemsTotal, nItems, firstItem, lastItem;
	/**
	  * selectedItem represents the current selected Item
	  */
	int selectedItem;
	/**
	  * Width and height of each of the menu items
	  */
	int height,width;
	/**
	  * User URLS
	  */
	URL urls[];
	/**
	  * Images aplitted
	  */
	Image images[][];
	/**
	  * yPos is the y coordinate to use when drawing any string
	  */
	int yPos;
	/**
	  * Image to split
	  */
	Image image;
	/**
	  * bImagesReady is true when the image has been successfully splitted
	  */
	boolean bImagesReady;
	/**
	  * bVertical is used to indicate when the menu will be represented in vertical way
	  */
	boolean bVertical;
	/**
	  * bValidImage is true if the height and the width of each of the menu items
	  * are greater than zero.
	  */
	boolean bValidImage;
}