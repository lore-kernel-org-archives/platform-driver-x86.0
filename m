From: Darren Hart <dvhart@infradead.org>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 10:40:27 -0700
Message-ID: <20170613174027.GL27850@fury>
References: <20170509231639.GB11404@fury>
 <20170613070535.GA13252@infradead.org>
 <20170613153857.GC27850@fury>
 <201706131916.12144@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:46349 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751826AbdFMRkc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 13:40:32 -0400
Content-Disposition: inline
In-Reply-To: <201706131916.12144@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Jun 13, 2017 at 07:16:11PM +0200, Pali Rohár wrote:
> On Tuesday 13 June 2017 17:38:57 Darren Hart wrote:
> > I'll mention this again I suspect in this thread, but rather than a
> > "WMI filter" we can implement a "WMI proxy". If a kernel driver
> > needs to own certain WMI calls for LED or Radio management, for
> > example, all such calls can be proxied through that driver. It can
> > do the necessary work to update its own state, and still perform the
> > requested funtion, transparent to the userspace caller. This should
> > accommodate the addition of new drivers and features to kernel
> > drivers, without precluding the development of userspace management
> > or platform daemons.
> 
> Such WMI proxy implemented in every WMI driver has one design problem:
> 
> There would be two different kernel APIs to configure some firmware 
> settings. E.g. if particular WMI method implements turning on/off radio 
> devices, then functionality would be exported to userspace via:
> 
> 1) standard kernel rfkill interface which is device/driver/firmware 
> neutral (and any rfkill application can control it)
> 
> 2) platform/firmware specific WMI method via newly standard /dev/wmi* 
> interface -- and only vendor specific application could do that and it 
> would work only for this one specific WMI GUID device

Yes, platform specific control is what WMI is for.

> I do not like idea to have two kernel <--> userspace interfaces to 
> control one thing, plus one interface would be platform dependent.
> 
> In my opinion any management application which want to control radio 
> switches should use option 1) rfkill interface.

Agreed, they should.

> And I do not see reason for exporting same duplicate, but platform 
> dependent interface from kernel to userspace.
> 

So this question boils down to: do we export WMI to userspace or not?

The WMI GUIDs and methods will not be divided across convenient Linux
subsystem boundaries allowing us to pick and choose what we export. If
we export WMI to userspace, we will be providing another means of
access. Sometimes, this may cause conflict, and the answer may just be
"don't do that".

There are plenty of other examples of things you can do to screw up the
state of your system if you have the right permissions for which the
answer is "don't do that". Consider MEM(4), SETPCI(8), ... /dev/sda ...
for example.

So we can either export them and possibly offer some means of proxying
where necessary, or we can not export them.

-- 
Darren Hart
VMware Open Source Technology Center
