From: Darren Hart <dvhart@infradead.org>
Subject: Re: Fwd: [PATCH] Add driver to force WMI Thunderbolt controller
 power status
Date: Wed, 6 Sep 2017 13:09:53 -0700
Message-ID: <20170906200953.GA8298@fury>
References: <1504720440-24423-1-git-send-email-mario.limonciello@dell.com>
 <CA+CmpXt9EtzObijHT3gmm=xUwFDF3Ec=SFbNnPAk+oRdzAUADQ@mail.gmail.com>
 <1504726863.2677.154.camel@intel.com>
 <b74a2237da254faea0377fdcb93aa3e0@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:48627 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752058AbdIFUJ4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2017 16:09:56 -0400
Content-Disposition: inline
In-Reply-To: <b74a2237da254faea0377fdcb93aa3e0@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: yehezkel.bernat@intel.com, mika.westerberg@linux.intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com

On Wed, Sep 06, 2017 at 07:49:32PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Bernat, Yehezkel [mailto:yehezkel.bernat@intel.com]
> > Sent: Wednesday, September 6, 2017 2:41 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: mika.westerberg@linux.intel.com; linux-kernel@vger.kernel.org; platform-
> > driver-x86@vger.ke; dvhart@infradead.org; hughsient@gmail.com
> > Subject: Re: Fwd: [PATCH] Add driver to force WMI Thunderbolt controller power
> > status
> > 
> > 
> > > Current implementations of Intel Thunderbolt controllers will go
> > > into a low power mode when not in use.
> > >
> > > Many machines containing these controllers also have a GPIO wired up
> > > that can force the controller awake.  This is offered via a ACPI-WMI
> > > interface intended to be manipulated by a userspace utility.
> > 
> > 
> > > This mechanism is provided by Intel to OEMs to include in BIOS.
> > > It uses an industry wide GUID that is populated in a separate _WDG
> > > entry with no binary MOF.
> > >
> > > This interface allow software such as fwupd to wake up thunderbolt
> > > controllers to query the firmware version or flash new firmware.
> > 
> > As this is a Thunderbolt specific function, maybe it's better to be
> > exposed from the Thunderbolt driver?
> > 
> 
> I thought about this too, but the thunderbolt driver won't load if the
> controller doesn't exist in the first place, whereas this is a platform
> BIOS feature.  I'll be interested to hear if Mika has a different perspective
> on if this should live in the TBT driver and the proper way to do it.
> 

The other question I had about this was if the typical use case involves the OS,
or if the firmware update (for example) would be performed as part of the
general platform firmware update (from the UEFI update utility).

> > 
> > > +
> > > +static DEVICE_ATTR_WO(force_power);
> > > +
> > 
> > I'm not sure what is the convention for permissions for this type of
> > attributes but I feel like this worth being root-only writable, as it
> > can be used to power-off the controller in the middle of a FW update,
> > for example.
> 
> Yeah I think you're right.  I'll adjust it in a follow up patch if this is the
> correct way to go afterall.


Ahhhrg, that was something I meant to follow up on as I was discussing using the
macros with Mario previously, and I forgot. Sorry about that Mario.

-- 
Darren Hart
VMware Open Source Technology Center
