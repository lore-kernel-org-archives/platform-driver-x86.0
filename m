From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Fri, 11 Mar 2011 12:35:15 -0800
Message-ID: <20110311203515.GA21129@kroah.com>
References: <4D790A20.3050105@gmail.com>
 <20110310180959.GA26927@kroah.com>
 <4D793D05.3070908@gmail.com>
 <20110310211519.GA11862@kroah.com>
 <4D79CB47.2030405@gmail.com>
 <20110311170313.GA10202@kroah.com>
 <4D7A72E3.1050407@gmail.com>
 <20110311193433.GB14204@kroah.com>
 <4D7A8419.6080107@gmail.com>
 <4D7A84CD.2060401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D7A84CD.2060401@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 11, 2011 at 10:23:41PM +0200, Nikolai Kondrashov wrote:
> On 03/11/2011 10:20 PM, Nikolai Kondrashov wrote:
> >It fails to insert without "force" with the same message. With force it
> >installs, but doesn't seem to work, at least for brightness buttons.
> Oh, and upon insertion both backlight and WLAN LED turn off and then
> back on again, indeed.

Ah, good, thanks for letting me know, that means it is working properly.

greg k-h
