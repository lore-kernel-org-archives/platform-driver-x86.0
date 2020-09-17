Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E09DC43465
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 22:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D02A920665
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 22:29:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=cavoj.net header.i=@cavoj.net header.b="aKPj+ydA";
	dkim=pass (1024-bit key) header.d=cavoj.net header.i=@cavoj.net header.b="aKPj+ydA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgIQW3l (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgIQW3i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 18:29:38 -0400
Received: from mail.sammserver.com (sammserver.com [IPv6:2001:470:5a5b:1::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E00C06174A;
        Thu, 17 Sep 2020 15:29:37 -0700 (PDT)
Received: by mail.sammserver.com (Postfix, from userid 5011)
        id 737C81061E01; Fri, 18 Sep 2020 00:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1600381775; bh=4OkF/ts3VmXxP5ACYAT+Id05Ctul6GucokcbtHMMRsk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aKPj+ydAVvuuF0BK7Rx1VgQkTY+jsgcAOC9T1nT1NX7mmupCksoQrG7d3Wn8PWVGm
         UdUtGJX6YqEzWlAgr44a3NiMcFGhN4BnRQtvlYVVQMD17klRP8tF4j3JVxYpN2p0z1
         VIARE5Aibw7nOXGv3QQ9EwZg56CbTehGISp7hbhY=
Received: from fastboi.localdomain (fastboi.wg [10.32.40.5])
        by mail.sammserver.com (Postfix) with ESMTP id 0F2201061DFE;
        Fri, 18 Sep 2020 00:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1600381775; bh=4OkF/ts3VmXxP5ACYAT+Id05Ctul6GucokcbtHMMRsk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aKPj+ydAVvuuF0BK7Rx1VgQkTY+jsgcAOC9T1nT1NX7mmupCksoQrG7d3Wn8PWVGm
         UdUtGJX6YqEzWlAgr44a3NiMcFGhN4BnRQtvlYVVQMD17klRP8tF4j3JVxYpN2p0z1
         VIARE5Aibw7nOXGv3QQ9EwZg56CbTehGISp7hbhY=
Received: by fastboi.localdomain (Postfix, from userid 1000)
        id ECC8814209C4; Fri, 18 Sep 2020 00:29:34 +0200 (CEST)
Date:   Fri, 18 Sep 2020 00:29:34 +0200
From:   Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
To:     mark gross <mgross@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Add support for SW_TABLET_MODE
 on UX360
Message-ID: <20200917222934.syf5aqgkq5zurq2g@fastboi.localdomain>
References: <20200916191232.1020318-1-samuel@cavoj.net>
 <20200917215606.GF29136@mtg-dev.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200917215606.GF29136@mtg-dev.jf.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 17.09.2020 14:56, mark gross wrote:
> On Wed, Sep 16, 2020 at 09:12:33PM +0200, Samuel Čavoj wrote:
> > The UX360CA has a WMI device id 0x00060062, which reports whether the
> > lid is flipped in tablet mode (1) or in normal laptop mode (0).
> > 
> > This commit adds a quirk (quirk_asus_use_lid_flip_devid) for devices on
> > which this WMI device should be used to figure out the SW_TABLET_MODE
> > state, as opposed to the quirk_asus_use_kbd_dock_devid.
> see Documentation/process/submitting-patches.rst
> section2  the bit about "imperative mood".

Thanks, I will keep that in mind going forward. I don't believe it's
worth submitting a v3 at this point?

Regards,
Samuel

> > 
> > It is assumed other UX360* models have the same WMI device. As such, the
> > quirk is applied to devices with DMI_MATCH(DMI_PRODUCT_NAME, "UX360").
> > More devices with this feature need to be tested and added accordingly.
> > 
> > The reason for using a whitelist via the quirk mechanism is that the new
> > WMI device (0x00060062) is also present on some models which do not have
> > a 360 degree hinge (at least FX503VD and GL503VD from Hans' DSTS
> > collection) and therefore its presence cannot be relied on.
> > 
> > This patch is a followup to "platform/x86: asus-wmi: Fix SW_TABLET_MODE
> > always reporting 1 on many different models" by Hans de Goede.
> > 
> > Signed-off-by: Samuel Čavoj <samuel@cavoj.net>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/platform/x86/asus-nb-wmi.c         | 14 +++++++++++++
> >  drivers/platform/x86/asus-wmi.c            | 23 ++++++++++++++++++++++
> >  drivers/platform/x86/asus-wmi.h            |  1 +
> >  include/linux/platform_data/x86/asus-wmi.h |  1 +
> >  4 files changed, 39 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> > index 345bd224494b..ae5501e07712 100644
> > --- a/drivers/platform/x86/asus-nb-wmi.c
> > +++ b/drivers/platform/x86/asus-nb-wmi.c
> > @@ -119,6 +119,10 @@ static struct quirk_entry quirk_asus_use_kbd_dock_devid = {
> >  	.use_kbd_dock_devid = true,
> >  };
> >  
> > +static struct quirk_entry quirk_asus_use_lid_flip_devid = {
> > +	.use_lid_flip_devid = true,
> > +};
> > +
> >  static int dmi_matched(const struct dmi_system_id *dmi)
> >  {
> >  	pr_info("Identified laptop model '%s'\n", dmi->ident);
> > @@ -520,6 +524,16 @@ static const struct dmi_system_id asus_quirks[] = {
> >  		},
> >  		.driver_data = &quirk_asus_use_kbd_dock_devid,
> >  	},
> > +	{
> > +		.callback = dmi_matched,
> > +		.ident = "ASUS ZenBook Flip UX360",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> > +			/* Match UX360* */
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "UX360"),
> > +		},
> > +		.driver_data = &quirk_asus_use_lid_flip_devid,
> > +	},
> >  	{},
> >  };
> >  
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> > index ae6289d37faf..a628a7d9e066 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -63,6 +63,7 @@ MODULE_LICENSE("GPL");
> >  #define NOTIFY_KBD_BRTTOGGLE		0xc7
> >  #define NOTIFY_KBD_FBM			0x99
> >  #define NOTIFY_KBD_TTP			0xae
> > +#define NOTIFY_LID_FLIP			0xfa
> >  
> >  #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
> >  
> > @@ -375,6 +376,18 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
> >  		}
> >  	}
> >  
> > +	if (asus->driver->quirks->use_lid_flip_devid) {
> > +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP);
> > +		if (result >= 0) {
> > +			input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
> > +			input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
> > +		} else if (result == -ENODEV) {
> > +			pr_err("This device has lid_flip quirk but got ENODEV checking it. This is a bug.");
> > +		} else {
> > +			pr_err("Error checking for lid-flip: %d\n", result);
> > +		}
> > +	}
> > +
> >  	err = input_register_device(asus->inputdev);
> >  	if (err)
> >  		goto err_free_dev;
> > @@ -2127,6 +2140,16 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
> >  		return;
> >  	}
> >  
> > +	if (asus->driver->quirks->use_lid_flip_devid && code == NOTIFY_LID_FLIP) {
> > +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP);
> > +
> > +		if (result >= 0) {
> > +			input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
> > +			input_sync(asus->inputdev);
> > +		}
> > +		return;
> > +	}
> > +
> >  	if (asus->fan_boost_mode_available && code == NOTIFY_KBD_FBM) {
> >  		fan_boost_mode_switch_next(asus);
> >  		return;
> > diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
> > index 1a95c172f94b..b302415bf1d9 100644
> > --- a/drivers/platform/x86/asus-wmi.h
> > +++ b/drivers/platform/x86/asus-wmi.h
> > @@ -34,6 +34,7 @@ struct quirk_entry {
> >  	bool wmi_backlight_set_devstate;
> >  	bool wmi_force_als_set;
> >  	bool use_kbd_dock_devid;
> > +	bool use_lid_flip_devid;
> >  	int wapf;
> >  	/*
> >  	 * For machines with AMD graphic chips, it will send out WMI event
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > index 897b8332a39f..2f274cf52805 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -62,6 +62,7 @@
> >  
> >  /* Misc */
> >  #define ASUS_WMI_DEVID_CAMERA		0x00060013
> > +#define ASUS_WMI_DEVID_LID_FLIP		0x00060062
> >  
> >  /* Storage */
> >  #define ASUS_WMI_DEVID_CARDREADER	0x00080013
> > -- 
> > 2.28.0
> > 
