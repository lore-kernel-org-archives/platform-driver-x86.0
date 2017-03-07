From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v2 0/4] fujitsu_init() cleanup
Date: Tue, 7 Mar 2017 14:20:16 +1030
Message-ID: <20170307035016.GY23178@marvin.atrad.com.au>
References: <20170301081044.12141-1-kernel@kempniu.pl>
 <20170304014723.GA7944@marvin.atrad.com.au>
 <20170305234854.GG28473@marvin.atrad.com.au>
 <20170306044905.GA3845@kmp-mobile.hq.kempniu.pl>
 <20170306050104.GT28473@marvin.atrad.com.au>
 <20170306081030.GA30975@marvin.atrad.com.au>
 <20170306093350.GB1372@ozzy.nask.waw.pl>
 <20170306184723.GA795@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:36218 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753171AbdCGDvG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Mar 2017 22:51:06 -0500
Content-Disposition: inline
In-Reply-To: <20170306184723.GA795@kmp-mobile.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michael

On Mon, Mar 06, 2017 at 07:47:23PM +0100, Micha?? K??pie?? wrote:
> > > In light of the above findings, what would you like to do?
> > 
> > Thanks for testing, good that we caught this before the patch series was
> > applied.  I think it is reasonable to skip applying this version of the
> > series as at least patch 2/4 is faulty and breaks a working feature.
> > 
> > Moving on, though, as I do not have access to Fujitsu hardware on which
> > this feature works, I was hoping you could help me verify whether my
> > assumptions were reasonable in the first place.  
> > 
> > I attached a crude patch to this message.  I would like to understand
> > how the underlying ACPI variables behave when the FEXT interface is
> > used, so please apply this patch on top of dvhart/testing (i.e. without
> > this series applied).  After compiling, please load the module with
> > debugging enabled, then test backlight control once again by writing 4
> > and then 0 to bl_power (this should work).  Then please send me all the
> > messages spit out by the driver into dmesg.  This should shed some light
> > on the matter.

I have done this.  Writing 4 to bl_power did indeed turn the backlight off,
and 0 restored it.  Annotated output from dmesg is at the end of this
message.

> Actually, scratch that.  I just ordered a banged up S7020 for ???15 to
> avoid pestering you with experimental patches and hopefully make the
> whole driver cleanup process a bit smoother.

Ok, no problem.  Obviously I'm still happy to test as required.

> Darren, Andy, please ignore this whole series for now.  I will post v3
> once I figure out how to clean things up without breaking working
> features.

To clarify, I see no reason why the earlier 2-patch cleanup series can't go
in at this stage.  It's only this 4-part patch which needs revision in light
of recent findings.

Regards
  jonathan

Module loading

[ 3292.204366] input: Fujitsu FUJ02B1 as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A03:00/device:05/FUJ02B1:00/input/input19
[ 3292.208512] fujitsu_laptop: ACPI: Fujitsu FUJ02B1 [FJEX] (on)
[ 3292.209653] fujitsu_laptop: acpi_fujitsu_bl_add: auto-detected usealt as 0
[ 3292.209654] fujitsu_laptop: acpi_fujitsu_bl_add: config: [alt interface: 0], [adjust disable: 0]
[ 3292.209655] fujitsu_laptop: get_max_brightness: get max lcd level via RBLL
[ 3292.209701] fujitsu_laptop: get_lcd_level: get lcd level via GBLL
[ 3292.212086] input: Fujitsu FUJ02E3 as /devices/LNXSYSTM:00/LNXSYBUS:00/FUJ02E3:00/input/input20
[ 3292.213483] fujitsu_laptop: ACPI: Fujitsu FUJ02E3 [FEXT] (on)
[ 3292.214627] fujitsu_laptop: acpi_fujitsu_laptop_add: Invoking _INI
[ 3292.214740] fujitsu_laptop: call_fext_func: FUNC 0x1002 (args 0x1, 0x0, 0x0) returned 0x0
[ 3292.214741] fujitsu_laptop: acpi_fujitsu_laptop_add: Discarded 0 ringbuffer entries
[ 3292.214770] fujitsu_laptop: call_fext_func: FUNC 0x1000 (args 0x0, 0x0, 0x0) returned 0x80000000
[ 3292.214819] fujitsu_laptop: call_fext_func: FUNC 0x1002 (args 0x0, 0x0, 0x0) returned 0xf0001
[ 3292.214820] fujitsu_laptop: BTNI: [0xf0001]
[ 3292.216523] fujitsu_laptop: call_fext_func: FUNC 0x1001 (args 0x0, 0x0, 0x0) returned 0x0
[ 3292.216567] fujitsu_laptop: call_fext_func: FUNC 0x1001 (args 0x0, 0x0, 0x0) returned 0x0
[ 3292.216616] fujitsu_laptop: call_fext_func: FUNC 0x1002 (args 0x0, 0x0, 0x0) returned 0xf0001
[ 3292.216658] fujitsu_laptop: call_fext_func: FUNC 0x1001 (args 0x0, 0x0, 0x0) returned 0x0
[ 3292.216964] fujitsu_laptop: call_fext_func: FUNC 0x1004 (args 0x2, 0x4, 0x0) returned 0x0
[ 3292.216965] fujitsu_laptop: driver 0.6.0 successfully loaded

echo 4 > /sys/devices/virtual/backlight/fujitsu-laptop/bl_power

[ 3320.168775] fujitsu_laptop: call_fext_func: FUNC 0x1004 (args 0x1, 0x4, 0x3) returned 0x0
[ 3320.168779] fujitsu_laptop: bl_update_status: Backlight power set to 4
[ 3320.168793] fujitsu_laptop: bl_update_status: BLCT = 1
[ 3320.168800] fujitsu_laptop: bl_update_status: NGTM = 3
[ 3320.168805] fujitsu_laptop: bl_update_status: Got ACPI handle for SBLC
[ 3320.168808] fujitsu_laptop: set_lcd_level: set lcd level via SBLL [7]

echo 4 > /sys/devices/virtual/backlight/fujitsu-laptop/bl_power

[ 3322.774773] fujitsu_laptop: call_fext_func: FUNC 0x1004 (args 0x1, 0x4, 0x0) returned 0x0
[ 3322.774776] fujitsu_laptop: bl_update_status: Backlight power set to 0
[ 3322.774790] fujitsu_laptop: bl_update_status: BLCT = 0
[ 3322.774798] fujitsu_laptop: bl_update_status: NGTM = 0
[ 3322.774802] fujitsu_laptop: bl_update_status: Got ACPI handle for SBLC
[ 3322.774804] fujitsu_laptop: set_lcd_level: set lcd level via SBLL [7]
