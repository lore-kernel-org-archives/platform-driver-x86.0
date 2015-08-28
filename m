From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] [v4] surface pro 3: Add support driver for Surface Pro 3
 buttons
Date: Fri, 28 Aug 2015 10:56:45 -0700
Message-ID: <20150828175645.GC33809@vmdeb7>
References: <1439911825-23536-1-git-send-email-yu.c.chen@intel.com>
 <20150826072221.GD50910@vmdeb7>
 <1440590641.2670.187.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54255 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752634AbbH1R45 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Aug 2015 13:56:57 -0400
Content-Disposition: inline
In-Reply-To: <1440590641.2670.187.camel@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Chen Yu <yu.c.chen@intel.com>, akpm@linux-foundation.org, arnd@arndb.de, gregkh@linuxfoundation.org, mchehab@osg.samsung.com, davem@davemloft.net, jslaby@suse.com, tj@kernel.org, rjw@rjwysocki.net, rui.zhang@intel.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Aug 26, 2015 at 05:04:01AM -0700, Joe Perches wrote:
> On Wed, 2015-08-26 at 00:22 -0700, Darren Hart wrote:
> > On Tue, Aug 18, 2015 at 11:30:25PM +0800, Chen Yu wrote:
> > > Since Surface Pro 3 does not follow the specs of "Windows ACPI Design
> > > Guide for SoC Platform", code in drivers/input/misc/soc_array.c can
> > > not detect these buttons on it. According to bios implementation,
> > > Surface Pro 3 encapsulates these buttons in a device named "VGBI",
> > > with _HID "MSHW0028". When any of the buttons is pressed, a specify
> > > ACPI notification code for this button will be delivered to "VGBI". For
> > > example, if power button is pressed down, ACPI notification code of 0xc6
> > > will be sent by Notify(VGBI, 0xc6).
> []
> > Joe, you provided a lot of review, are you happy with this version?
> 
> It looks fine.
> 
> Thanks for picking the other little nits too Darren.

This is not queued for next.

-- 
Darren Hart
Intel Open Source Technology Center
