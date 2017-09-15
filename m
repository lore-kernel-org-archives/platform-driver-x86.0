From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3] Add driver to force WMI Thunderbolt controller power
 status
Date: Fri, 15 Sep 2017 09:44:39 +0200
Message-ID: <20170915074439.GA17644@wunner.de>
References: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com>
 <20170913172024.GA8782@wunner.de>
 <27f4070678744d0f80761a95579b4cd3@ausx13mpc120.AMER.DELL.COM>
 <20170914091416.GA28049@wunner.de>
 <58820c0d563845659030881cd44cfe97@ausx13mpc120.AMER.DELL.COM>
 <20170914145919.GU2477@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout1.hostsharing.net ([83.223.95.204]:47583 "EHLO
        mailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750787AbdIOHoN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Sep 2017 03:44:13 -0400
Content-Disposition: inline
In-Reply-To: <20170914145919.GU2477@lahna.fi.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario.Limonciello@dell.com, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com, yehezkelshb@gmail.com

On Thu, Sep 14, 2017 at 05:59:19PM +0300, Mika Westerberg wrote:
> On Thu, Sep 14, 2017 at 02:52:27PM +0000, Mario.Limonciello@dell.com wrote:
> > > Looking at drivers/platform/x86/wmi.c:wmi_dev_uevent() it seems that
> > > a modalias consisting of "wmi:" followed by the GUID is sent to udevd.
> > > For udevd to then load the module, I suspect you need to add a
> > > MODULE_DEVICE_TABLE(wmi, ...) to your driver.
> > 
> > Ah, you're looking for this code from the WMI bus driver:
> > https://github.com/torvalds/linux/blob/master/drivers/platform/x86/wmi.c#L724
> > 
> > That happens when the bus is initialized.
> 
> That's right you get the uevent and whatnot but Lucas means that if you
> don't have MODULE_DEVICE_TABLE(wmi, ...) in the driver, udev cannot load
> the module automatically when the device appears.

Digging a bit deeper I notice the wmi drivers seem to solve this by
directly declaring a MODULE_ALIAS(), which is also present in Mario's
driver.  Mario, have you tested if auto-loading works if compiled as
a module?  If so, sorry for the noise.

Thanks,

Lukas
