From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 0/4] fujitsu_init() cleanup
Date: Mon, 6 Mar 2017 10:33:50 +0100
Message-ID: <20170306093350.GB1372@ozzy.nask.waw.pl>
References: <20170301081044.12141-1-kernel@kempniu.pl>
 <20170304014723.GA7944@marvin.atrad.com.au>
 <20170305234854.GG28473@marvin.atrad.com.au>
 <20170306044905.GA3845@kmp-mobile.hq.kempniu.pl>
 <20170306050104.GT28473@marvin.atrad.com.au>
 <20170306081030.GA30975@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="y0ulUmNC+osPPQO6"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:33615 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754004AbdCFJeX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Mar 2017 04:34:23 -0500
Received: by mail-lf0-f50.google.com with SMTP id a6so69660950lfa.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Mar 2017 01:33:59 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170306081030.GA30975@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

> Hi Michael
> 
> Some quick feedback.
> 
> On Mon, Mar 06, 2017 at 03:31:04PM +1030, Jonathan Woithe wrote:
> > > > I can add that immediately after loading the driver the value returned by a
> > > > read of bl_power is 0.  As noted above, setting to 1 makes no difference to
> > > > the backlight, neither does returning it to 0.
> > > 
> > > Have you tried setting bl_power to 4?  Because that is the value of
> > > FB_BLANK_POWERDOWN, which is the value the patch is supposed to handle.
> > 
> > Oh no, I didn't try 4.  I should have.  I will try to squeeze in a test of
> > this tonight (time is short but the test won't take a lot of time).
> 
> With an unpatched 4.5 kernel, writing 4 (as opposed to 1, which I stupidly
> tried earlier) to bl_power caused the backlight to turn off.  Writing 0
> turned it back on again.
> 
> With patches 1-4/4 applied, writing 4 to bl_power did *NOT* turn the
> backlight off.
> 
> With patch 2 reverted, writing 4 to bl_power turned the backlight off. 
> Writing 0 to bl_power turned it back on again.
> 
> This means that patch 2/4 seems to prevent bl_power from operating as
> expected on the S7020 hardware.  Without this patch (but with all the others
> in place) bl_power works.
> 
> I am unlikely to have any more time to investigate this further tonight. 
> 
> In light of the above findings, what would you like to do?

Thanks for testing, good that we caught this before the patch series was
applied.  I think it is reasonable to skip applying this version of the
series as at least patch 2/4 is faulty and breaks a working feature.

Moving on, though, as I do not have access to Fujitsu hardware on which
this feature works, I was hoping you could help me verify whether my
assumptions were reasonable in the first place.  

I attached a crude patch to this message.  I would like to understand
how the underlying ACPI variables behave when the FEXT interface is
used, so please apply this patch on top of dvhart/testing (i.e. without
this series applied).  After compiling, please load the module with
debugging enabled, then test backlight control once again by writing 4
and then 0 to bl_power (this should work).  Then please send me all the
messages spit out by the driver into dmesg.  This should shed some light
on the matter.

Thanks!

-- 
Best regards,
Michał Kępień

--y0ulUmNC+osPPQO6
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="debug.patch"

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index e12cc3504d48..34bf97d4d463 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -463,7 +463,11 @@ static int bl_get_brightness(struct backlight_device *b)
 
 static int bl_update_status(struct backlight_device *b)
 {
+	unsigned long long blank;
+	acpi_status status;
+	acpi_handle handle;
 	int ret;
+
 	if (b->props.power == FB_BLANK_POWERDOWN)
 		ret = call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x3);
 	else
@@ -473,6 +477,26 @@ static int bl_update_status(struct backlight_device *b)
 			"Unable to adjust backlight power, error code %i\n",
 			ret);
 
+	vdbg_printk(FUJLAPTOP_DBG_INFO, "Backlight power set to %d\n", b->props.power);
+
+	status = acpi_evaluate_integer(NULL, "\\BLCT", NULL, &blank);
+	if (ACPI_SUCCESS(status))
+		vdbg_printk(FUJLAPTOP_DBG_INFO, "BLCT = %llx\n", blank);
+	else
+		vdbg_printk(FUJLAPTOP_DBG_ERROR, "Cannot evaluate BLCT\n");
+
+	status = acpi_evaluate_integer(NULL, "\\NGTM", NULL, &blank);
+	if (ACPI_SUCCESS(status))
+		vdbg_printk(FUJLAPTOP_DBG_INFO, "NGTM = %llx\n", blank);
+	else
+		vdbg_printk(FUJLAPTOP_DBG_ERROR, "Cannot evaluate NGTM\n");
+
+	status = acpi_get_handle(NULL, "\\_SB.FEXT.SBLC", &handle);
+	if (ACPI_SUCCESS(status))
+		vdbg_printk(FUJLAPTOP_DBG_INFO, "Got ACPI handle for SBLC\n");
+	else
+		vdbg_printk(FUJLAPTOP_DBG_ERROR, "Cannot get ACPI handle for SBLC\n");
+
 	if (use_alt_lcd_levels)
 		ret = set_lcd_level_alt(b->props.brightness);
 	else
-- 
2.12.0


--y0ulUmNC+osPPQO6--
