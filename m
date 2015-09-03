From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] [v4] surface pro 3: Add support driver for Surface Pro 3
 buttons
Date: Thu, 3 Sep 2015 12:19:57 -0700
Message-ID: <20150903191957.GA55382@vmdeb7>
References: <1439911825-23536-1-git-send-email-yu.c.chen@intel.com>
 <20150826072221.GD50910@vmdeb7>
 <1440590641.2670.187.camel@perches.com>
 <20150828175645.GC33809@vmdeb7>
 <CA+5PVA7a6adkEA=MApM5o=ohu47kh_srKQq27O5RoT5TOg8_1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47904 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750851AbbICTUM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 Sep 2015 15:20:12 -0400
Content-Disposition: inline
In-Reply-To: <CA+5PVA7a6adkEA=MApM5o=ohu47kh_srKQq27O5RoT5TOg8_1Q@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Josh Boyer <jwboyer@fedoraproject.org>
Cc: Joe Perches <joe@perches.com>, Chen Yu <yu.c.chen@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, mchehab@osg.samsung.com, David Miller <davem@davemloft.net>, Jiri Slaby <jslaby@suse.com>, Tejun Heo <tj@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Zhang Rui <rui.zhang@intel.com>, platform-driver-x86@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>

On Tue, Sep 01, 2015 at 01:30:27PM -0400, Josh Boyer wrote:
> On Fri, Aug 28, 2015 at 1:56 PM, Darren Hart <dvhart@infradead.org> wrote:
> > On Wed, Aug 26, 2015 at 05:04:01AM -0700, Joe Perches wrote:
> >> On Wed, 2015-08-26 at 00:22 -0700, Darren Hart wrote:
> >> > On Tue, Aug 18, 2015 at 11:30:25PM +0800, Chen Yu wrote:
> >> > > Since Surface Pro 3 does not follow the specs of "Windows ACPI Design
> >> > > Guide for SoC Platform", code in drivers/input/misc/soc_array.c can
> >> > > not detect these buttons on it. According to bios implementation,
> >> > > Surface Pro 3 encapsulates these buttons in a device named "VGBI",
> >> > > with _HID "MSHW0028". When any of the buttons is pressed, a specify
> >> > > ACPI notification code for this button will be delivered to "VGBI". For
> >> > > example, if power button is pressed down, ACPI notification code of 0xc6
> >> > > will be sent by Notify(VGBI, 0xc6).
> >> []
> >> > Joe, you provided a lot of review, are you happy with this version?
> >>
> >> It looks fine.
> >>
> >> Thanks for picking the other little nits too Darren.
> >
> > This is not queued for next.
> 
> Not or now?  If not, why not?

Sorry, typo :-)

It is queued for next, you'll find it in my "for-next" branch as well as in
linux-next currently.

-- 
Darren Hart
Intel Open Source Technology Center
