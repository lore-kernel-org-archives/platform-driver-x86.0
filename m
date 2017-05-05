From: Darren Hart <dvhart@infradead.org>
Subject: Regression: airplane mode led is not working anymore on Asus UX31A ,
 UX305FA and UX330 4.11-rc2 kernel
Date: Fri, 5 May 2017 14:23:39 -0700
Message-ID: <20170505212339.GA25865@fury>
References: <bug-195563-5380@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:38469 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751600AbdEEVXr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 May 2017 17:23:47 -0400
Content-Disposition: inline
In-Reply-To: <bug-195563-5380@https.bugzilla.kernel.org/>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jprvita@gmail.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net
Cc: tasev.stefanoska@skynet.be, platform-driver-x86@vger.kernel.org

We appear to have suffered a regression in the Asus WMI/Wireless drivers for the
UX330. Tasev already supplied the DSDT and dmesg. I've requested dmidecode, but
the dmesg may be sufficient:

[    0.000000] DMI: ASUSTeK COMPUTER INC. UX330UA/UX330UA, BIOS UX330UA.301 12/16/2016

The expectation that asus-wireless would drive the LED appears not to hold up on
Tasev's UX330:

71050ae platform/x86: asus-wmi: Detect quirk_no_rfkill from the DSDT
(and related patches)

The system does have the asus-nb-wmi WMI GUID and the ASHS device (ATK4002)
listed in the DSDT. It also has the OWGD (IIA1) fragment mentioned in the commit
above.

Also by inspection of the DSDT, the DSTS2 (0x53545344) status for the
DEVID_WIRELESS_LED (0x10002) returns 0x50002), which *excludes* the USER_BIT
(0x20000) if I'm parsing this all correctly, meaning wlan_ctrl_by_user will not
be set to 1 in asus_wmi_add(), and despite ashs_present() being true, we will
still call asus_wmi_rfkill_init(asus) on this system.

The asus-wireless driver is loading:
[    3.656432] input: Asus Wireless Radio Control as /devices/LNXSYSTM:00/LNXSYBUS:00/ATK4002:00/input/input5

And that is as far as I got this afternoon without hardware. I'd appreciate any
insight from Corentin or João Paulo.

I'd like to get this fixed in 4.12 and backported to 4.11 and 4.10. I don't have
such a machine, so we'll need assistance testing from anyone who does.

Tasev reported the issue on bugzilla, below:

On Mon, Apr 24, 2017 at 01:42:08PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=195563
> 
>             Bug ID: 195563
>            Summary: airplane mode led is not working anymore on  Asus
>                     UX31A , UX305FA and UX330 4.11-rc2 kernel
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 4.11-rc2  4.10.10
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: Platform_x86
>           Assignee: drivers_platform_x86@kernel-bugs.osdl.org
>           Reporter: tasev.stefanoska@skynet.be
>         Regression: No
> 
> Created attachment 255985
>   --> https://bugzilla.kernel.org/attachment.cgi?id=255985&action=edit
> dmesg kernel 4.10.10 Asus UX330 after pressing fn+f2 to switch on/off the
> airplane mode
> 
> Hi,
> 
> Sorry to not reporting this sooner but I just noticed yesterday that the 
> airplane mode led is not working anymore on my Asus UX31A , UX305FA and UX330 
> starting from kernel 4.11-rc2.
> 
> In the stable 4.10 kernel the led is not working starting from version 4.10.10.
> Probably related to the patches to asus-wmi from João Paulo Rechi Vita?
> 
> I have also only in my UX330 one pcie related error in dmesg every time i press
> the fn+f2 key's to switch on/off the airplane mode with the not working
> kernel's.The erroris not present with the working kernels.
> 
> [   62.888355] pcieport 0000:00:1c.6: AER: Corrected error received: id=00e6
> [   62.888363] pcieport 0000:00:1c.6: PCIe Bus Error: severity=Corrected,
> type=Physical Layer, id=00e6(Receiver ID)
> [   62.888367] pcieport 0000:00:1c.6:   device [8086:9d16] error
> status/mask=00000001/00002000
> [   62.888369] pcieport 0000:00:1c.6:    [ 0] Receiver Error         (First)
> 
> Full dmesg from kernel 4.10.10 is attached, also is the dsdt from the UX330.
> 
> Tasev
> 
> -- 
> You are receiving this mail because:
> You are watching the assignee of the bug.

-- 
Darren Hart
VMware Open Source Technology Center
