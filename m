From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Sun, 13 Mar 2011 09:17:53 -0700
Message-ID: <20110313161752.GC10718@kroah.com>
References: <20110310180959.GA26927@kroah.com>
 <4D793D05.3070908@gmail.com>
 <20110310211519.GA11862@kroah.com>
 <4D79CB47.2030405@gmail.com>
 <20110311170313.GA10202@kroah.com>
 <4D7A72E3.1050407@gmail.com>
 <20110311193433.GB14204@kroah.com>
 <4D7A8419.6080107@gmail.com>
 <20110311203032.GA14384@kroah.com>
 <4D7C9668.3000902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D7C9668.3000902@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Mar 13, 2011 at 12:03:20PM +0200, Nikolai Kondrashov wrote:
> Sometime ago I've found this hack on some forum, which I use currently
> to set the brightness:
> 
> setpci -s 00:02.0 f4.b="$HEX_BYTE"
> 
> It allows finer control of the brightness, but it seems it operates directly
> on the video card PCI register. I assume there is no sane way to use
> this interface from the platform driver, right?

Yes, do not do this, it causes all sorts of problems in the end, not the
least being the BIOS doesn't know what is going on at all as you are
changing the brightness without it knowing it.

thanks,

greg k-h
