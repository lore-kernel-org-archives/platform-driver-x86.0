From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Sun, 13 Mar 2011 09:18:23 -0700
Message-ID: <20110313161823.GD10718@kroah.com>
References: <20110310211519.GA11862@kroah.com>
 <4D79CB47.2030405@gmail.com>
 <20110311170313.GA10202@kroah.com>
 <4D7A72E3.1050407@gmail.com>
 <20110311193433.GB14204@kroah.com>
 <4D7A8419.6080107@gmail.com>
 <20110311203032.GA14384@kroah.com>
 <4D7C9668.3000902@gmail.com>
 <4D7CA2A8.4010700@t-online.de>
 <4D7CC048.805@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D7CC048.805@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Richard =?iso-8859-1?Q?Sch=FCtz?= <r.schtz@t-online.de>, Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Mar 13, 2011 at 03:02:00PM +0200, Nikolai Kondrashov wrote:
> On 03/13/2011 12:55 PM, Richard Sch=FCtz wrote:
> >That sounds like the driver is interfering with the ACPI video drive=
r.
> >Add "acpi_backlight=3Dvendor" to your kernel boot parameters and try=
 again.
> Thank you, this helped :)
>=20
> Greg, is it OK that both 0 and 1 backlight values have the same effec=
t on
> brightness?

I really don't know, sorry.  Try messing with the actual_brightness fil=
e
instead, that's the one to use.

thanks,

greg k-h
