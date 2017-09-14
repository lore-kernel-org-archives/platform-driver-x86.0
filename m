From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3] Add driver to force WMI Thunderbolt controller power
 status
Date: Thu, 14 Sep 2017 17:59:19 +0300
Message-ID: <20170914145919.GU2477@lahna.fi.intel.com>
References: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com>
 <20170913172024.GA8782@wunner.de>
 <27f4070678744d0f80761a95579b4cd3@ausx13mpc120.AMER.DELL.COM>
 <20170914091416.GA28049@wunner.de>
 <58820c0d563845659030881cd44cfe97@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:52048 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751318AbdINPDo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Sep 2017 11:03:44 -0400
Content-Disposition: inline
In-Reply-To: <58820c0d563845659030881cd44cfe97@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: lukas@wunner.de, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com, yehezkelshb@gmail.com

On Thu, Sep 14, 2017 at 02:52:27PM +0000, Mario.Limonciello@dell.com wrote:
> > Looking at drivers/platform/x86/wmi.c:wmi_dev_uevent() it seems that
> > a modalias consisting of "wmi:" followed by the GUID is sent to udevd.
> > For udevd to then load the module, I suspect you need to add a
> > MODULE_DEVICE_TABLE(wmi, ...) to your driver.
> 
> Ah, you're looking for this code from the WMI bus driver:
> https://github.com/torvalds/linux/blob/master/drivers/platform/x86/wmi.c#L724
> 
> That happens when the bus is initialized.

That's right you get the uevent and whatnot but Lucas means that if you
don't have MODULE_DEVICE_TABLE(wmi, ...) in the driver, udev cannot load
the module automatically when the device appears.
