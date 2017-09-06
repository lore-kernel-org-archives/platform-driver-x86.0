From: Darren Hart <dvhart@infradead.org>
Subject: Re: Fwd: [PATCH] Add driver to force WMI Thunderbolt controller
 power status
Date: Wed, 6 Sep 2017 15:27:30 -0700
Message-ID: <20170906222730.GB8298@fury>
References: <1504720440-24423-1-git-send-email-mario.limonciello@dell.com>
 <CA+CmpXt9EtzObijHT3gmm=xUwFDF3Ec=SFbNnPAk+oRdzAUADQ@mail.gmail.com>
 <1504726863.2677.154.camel@intel.com>
 <b74a2237da254faea0377fdcb93aa3e0@ausx13mpc120.AMER.DELL.COM>
 <20170906200953.GA8298@fury>
 <1504729603.2677.167.camel@intel.com>
 <7edd73cbe3ba4d7b80a6614e93f4d538@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:41622 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932380AbdIFW1d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2017 18:27:33 -0400
Content-Disposition: inline
In-Reply-To: <7edd73cbe3ba4d7b80a6614e93f4d538@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: yehezkel.bernat@intel.com, mika.westerberg@linux.intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com

On Wed, Sep 06, 2017 at 09:40:02PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Bernat, Yehezkel [mailto:yehezkel.bernat@intel.com]
> > Sent: Wednesday, September 6, 2017 3:27 PM
> > To: dvhart@infradead.org; Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: mika.westerberg@linux.intel.com; linux-kernel@vger.kernel.org; platform-
> > driver-x86@vger.kernel.org; hughsient@gmail.com
> > Subject: Re: Fwd: [PATCH] Add driver to force WMI Thunderbolt controller power
> > status
> > 
> > On Wed, 2017-09-06 at 13:09 -0700, Darren Hart wrote:
> > > The other question I had about this was if the typical use case
> > > involves the OS,
> > > or if the firmware update (for example) would be performed as part of
> > > the
> > > general platform firmware update (from the UEFI update utility).
> > 
> > First, there is the use-case of add-in card, where it's impossible to
> > use UEFI-based update, as much as I understand, as the BIOS isn't
> > expected to expose an ESRT entry for it.
> > 
> > Even for built-in controller, my impression is that most OEMs use a FW
> > update application (running on Windows) and are not publishing a UEFI-
> > based solution.
> 
> Yeah I'd agree with that impression.
> 
> Even if an OEM does choose to publish a UEFI based solution, it's still
> useful to present FW information for the TBT controller in fwupd however too.
> 
> Similar to how fwupd displays the information for the ME even though
> the ME is typically updated via UEFI.

So this raises the question: can we come up with a mechanism as part of the tb
driver that will work on both on-board controllers and add on cards? In it's
current form, this driver will only address on-board controllers.

The TB driver could use the WMI method if it exists, or some other method to
power it up, but present the same sysfs interface to userspace...

-- 
Darren Hart
VMware Open Source Technology Center
