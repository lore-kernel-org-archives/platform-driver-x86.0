From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Sun, 13 Mar 2011 10:58:13 -0700
Message-ID: <20110313175813.GA11702@kroah.com>
References: <20110311170313.GA10202@kroah.com>
 <4D7A72E3.1050407@gmail.com>
 <20110311193433.GB14204@kroah.com>
 <4D7A8419.6080107@gmail.com>
 <20110311203032.GA14384@kroah.com>
 <4D7C9668.3000902@gmail.com>
 <4D7CA2A8.4010700@t-online.de>
 <4D7CC048.805@gmail.com>
 <20110313161823.GD10718@kroah.com>
 <4D7D0390.3000108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D7D0390.3000108@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Richard =?iso-8859-1?Q?Sch=FCtz?= <r.schtz@t-online.de>, Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Mar 13, 2011 at 07:49:04PM +0200, Nikolai Kondrashov wrote:
> On 03/13/2011 06:18 PM, Greg KH wrote:
> >I really don't know, sorry.  Try messing with the actual_brightness file
> >instead, that's the one to use.
> Sure, thank you :)
> 
> Still, what about the wireless on/off button? Is Gnome support required, or
> it should work as is? Because mine doesn't seem to do anything.

It should "just work", as it does on my machine, but I'm running a very
new Gnome, so it might have hooks to look at the rfkill stuff built in.

thanks,

greg k-h
