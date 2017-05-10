From: Darren Hart <dvhart@infradead.org>
Subject: Re: WMI and Kernel:User interface
Date: Wed, 10 May 2017 16:23:26 -0700
Message-ID: <20170510232326.GD11404@fury>
References: <20170509231639.GB11404@fury>
 <20170510051341.GA17835@kroah.com>
 <20170510061026.GA6232@fury>
 <e346b0f0c5684102aa571b166e21a47e@ausx13mpc120.AMER.DELL.COM>
 <CALCETrWDRSScOFMaC+fKFEryUjd3i4t=wsxmjSS+PAiwi6onww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:51121 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753655AbdEJXXj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 May 2017 19:23:39 -0400
Content-Disposition: inline
In-Reply-To: <CALCETrWDRSScOFMaC+fKFEryUjd3i4t=wsxmjSS+PAiwi6onww@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Mario.Limonciello@dell.com, Greg KH <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Wed, May 10, 2017 at 03:50:44PM -0700, Andy Lutomirski wrote:
> On Wed, May 10, 2017 at 3:02 PM,  <Mario.Limonciello@dell.com> wrote:
> > So here's a "more" realistic scenario:
> >
> > OEM has support through a WMI function to control keyboard backlight timeouts
> > and intensity.  That same WMI function also can support turning on/off an individual
> > USB port.  Backlight timeouts are done by setting the first argument to "1" and USB
> > port control is done by setting first argument to "2".
> >
> > Some userspace app is developed that can control both of these functions through
> > the chardev.  Later an enterprising young kernel developer realizes that backlight
> > control should be done through a platform driver instead.
> >
> > They write a platform driver to do it, and add a filter to block "1" arguments from
> > userspace.  Now if the userspace app tries to call the chardev with the "1" argument
> > some error code is returned indicating this request is not supported.
> >
> > The result is the userspace app broke, but it broke because the kernel is supporting
> > the method in a much smarter and more scalable way.
> 
> There's another possibility: the filter could intercept the "1"
> argument and change the brightness.

That would be a good way to deal with regressions if we encounter them after
filtering a call. In general we would want to filter as few calls as possible,
and only if there is a detrimental effect for both userspace and the kernel
using the call. e.g. if the backlight call is stateless, then there is no
problem with both userspace and the kernel using it.

> FWIW, I think that almost anything the kernel did with a real WMI API
> would be better than the ugly things that drivers like dcdbas allow.
> 
> --Andy
> 

-- 
Darren Hart
VMware Open Source Technology Center
