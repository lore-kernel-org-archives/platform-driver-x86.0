From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH] apple-gmux: Add support for message box interface (as
 found in MBP10,1/Retina MacBook Pro)
Date: Mon, 13 Aug 2012 13:21:16 -0500
Message-ID: <20120813182116.GE24088@thinkpad-t410>
References: <5028CC19.6070003@vmars.tuwien.ac.at>
 <20120813170908.GC24088@thinkpad-t410>
 <502940FD.4090202@vmars.tuwien.ac.at>
 <20120813181344.GA15931@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:53950 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751377Ab2HMSV3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Aug 2012 14:21:29 -0400
Content-Disposition: inline
In-Reply-To: <20120813181344.GA15931@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Bernhard Froemel <froemel@vmars.tuwien.ac.at>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Andreas Heider <andreas@meetr.de>

On Mon, Aug 13, 2012 at 11:13:44AM -0700, Greg KH wrote:
> On Mon, Aug 13, 2012 at 08:01:33PM +0200, Bernhard Froemel wrote:
> > On 08/13/2012 07:09 PM, Seth Forshee wrote:
> > > Matthew also made some progress with this last week, at least
> > > enough to get the backlight working. From what I remember of
> > > looking at his changes these look fairly similar, but I think his
> > > implementation looked cleaner and possibly more complete.
> > Aw.. pity; then I wasted ~8h :/ .. but I had fun anyway.  Is there
> > another (patch) thread where this is already discussed?
> > 
> > >> I see that there is a lot going on concerning and related to the 
> > >> apple-gmux currently: https://lkml.org/lkml/2012/7/9/715 
> > >> https://lkml.org/lkml/2012/8/3/300
> > > 
> > > I'm slowly making progress on the graphics switching stuff. I've
> > > got patches for vga_switcheroo and apple-gmux that make the muxing
> > > itself work fine, the problems now all revolve around making the
> > > graphics drivers deal with difficult behavior from Apple machines.
> > Looking forward to it, although the essential stuff (for Intel GPU
> > operation only) already works well for me.
> > In case you need something tested you can always CC me!
> 
> So with this patch you don't have to boot to os-x to change the graphics
> card and it works properly?

No, this one is only going to get you backlight control. There is a
switching patch ([1], see patch 12), but based on Matthew's comments it
sounds like i915 will need some work before graphics switching will
work.

Seth

[1] http://people.canonical.com/~sforshee/apple-gmux-patches/
