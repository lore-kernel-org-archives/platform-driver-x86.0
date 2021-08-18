Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFEBC4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 13:36:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66FF7610A7
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 13:36:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236629AbhHRNgp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 09:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbhHRNgn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 09:36:43 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D041C061764
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 06:36:08 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id x11so5222365ejv.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 06:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=BC8uJBmPm/9b80mpCiDxkLJLf6qK8UUC7wJfxi9XzgY=;
        b=sjM4t+/QLgym13ganbFGXMbtWhcsC8uzd6/zMs2OU7blKCqqODBUyEBu2eLebliPNA
         U57CFGYO+MeJyGMZNBh94ayZmkA0sFHWRega5NoMWhIbqu1vzbFwaBm4HEkIkJi6xW22
         YvNULm5VnDh0ml3Te8sB54rey3dYB1MFj+FLniW2QgxoiYqt4kUQIxZ1RCaoiOwA2jrW
         eWrNDkh4yNFbEb/tVlrwk7x/uKqvTCDtBygHQIFUtQSmQG6QrZUaEl4WMZegUmJdCeCX
         LUVYiaGjd6OFTTKXPJqkWDWjzvL+aoii16jdU68jbiX3p+aH+W4oKWGnjYyQQYv1Qk59
         7LNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=BC8uJBmPm/9b80mpCiDxkLJLf6qK8UUC7wJfxi9XzgY=;
        b=N2UfsOXyx+Sr5iJNVBJ/dP/4x8/KWrGuwqawLgDtJRbV/j59Tf5+qyzTCbD/NTqapD
         /0mWGeyMmGI0aMCAt7aXpVNEbeW/g7JNmSiKaaGovuT/KXExsV6OPXyULAuKp3h8yAi+
         cOv1RETYLcU4eU/+x5uI3/88+3L68/pscuLKsSg0Z67PU19Yev/mVLiyr/XMtb6YzGqe
         DssiG7y9ZpoR7C5uIdKKvsyYk7uXeIGm9vkrYCKPBzo8ZWnASiE3fInDmeWqxy2+TAP+
         ZRROuYvmTKvQWBELmI1uHd4Nr6Cne6ZIdFGeF5x5USNTzttxcfAzOHBJvORGNFm4873p
         qKDg==
X-Gm-Message-State: AOAM533yiVzctvmeq5Del7UoNssJHnMJeQ6KSEVPeYGGRZ4huUtOP3HL
        +BGxFseOyzPbaZMgnyirXkvYNDUjsuEp4uc=
X-Google-Smtp-Source: ABdhPJzzT+q4vFgPkZdqQtvH4AKkS0VeL7VsjR0t+cagsrt09t0p7DNioO1Dgd3cqZidvWvTFLpfbw==
X-Received: by 2002:a17:906:a195:: with SMTP id s21mr9809439ejy.181.1629293766977;
        Wed, 18 Aug 2021 06:36:06 -0700 (PDT)
Received: from localhost ([2a00:a040:195:275f:ad44:6808:2596:8580])
        by smtp.gmail.com with ESMTPSA id de12sm4107edb.37.2021.08.18.06.36.06
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 06:36:06 -0700 (PDT)
Received: from 127.0.0.1 (ident=unknown) by matan.home with esmtp
 (masqmail 0.2.21) id 1mGLje-1DU-00; Wed, 18 Aug 2021 16:36:02 +0300
Date:   Wed, 18 Aug 2021 16:36:02 +0300 (IDT)
From:   Matan Ziv-Av <matan@svgalib.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: lg-laptop: Support for battery charge
 limit on newer models
In-Reply-To: <7d2ea9fc-6942-d7c9-c6cf-61072dc13ba9@redhat.com>
Message-ID: <d8f5fb50-68d5-b331-3a56-e638e423d269@svgalib.org>
References: <9338b0b1-e76e-68f5-36de-a642745ba6ad@svgalib.org> <7d2ea9fc-6942-d7c9-c6cf-61072dc13ba9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 18 Aug 2021, Hans de Goede wrote:

> Hi,
> 
> On 8/14/21 12:11 AM, Matan Ziv-Av wrote:
> > 
> > Add support for the difference between various models:
> > 
> > - Use dmi to detect laptop model.
> > - 2019 and newer models use _wmbb method to set battery charge limit.
> > 
> > Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
> 
> Thank you for the patch, some small comments inline.
> 
> 
> Please drop the ! from the if condition and swap the 2 branches.

Fixed.

> > +	product = dmi_get_system_info(DMI_PRODUCT_NAME);
> > +	if (strlen(product) > 4)
> > +		switch (product[4]) {
> > +		case '5':
> > +		case '6':
> > +			year = 2016;
> > +			break;
> > +		case '7':
> > +			year = 2017;
> > +			break;
> > +		case '8':
> > +			year = 2018;
> > +			break;
> > +		case '9':
> > +			year = 2019;
> > +			break;
> > +		case '0':
> > +			if (strlen(product) > 5)
> > +				switch (product[5]) {
> > +				case 'N':
> > +					year = 2020;
> > +					break;
> > +				case 'P':
> > +					year = 2021;
> > +					break;
> > +				default:
> > +					year = 2022;
> > +				}
> > +			break;
> > +		default:
> > +			year = 2019;
> > +		}
> > +	pr_info("product: %s  year: %d\n", product, year);
> > +
> > +	if (year >= 2019)
> > +		battery_limit_use_wmbb = 1;
> 
> This does not feel very robust how about doing a strstr for "201" and if that
> fails for "202" to find the year ?

Unfortunately, this is not so simple.

Some example model numbers:

15Z960-A.AA75U1
15Z980-R.AAS9U1
14T990-U.AAS8U1
17Z90P-K.AAB8U1

First two digits represent screen size. Third letter device type. Fifth 
digit is the last digit of the model year (up to 2021, where it is 0 and 
the sixth letter indicates the model year).

> Regards,
> 
> Hans
> 
> p.s.
> 
> While reviewing this I also took a quick look at the existing lg-laptop.c
> and the wmi_keymap stood out to me, specifically:
> 
>         {KE_KEY, 0x74, {KEY_F13} },      /* Touchpad toggle (F5) */
> 
> If that key just sends this event and does not actually change the
> touchpad settings, IOW userspace is supposed to react this (e.g.
> filter out touchpad events in software after the toggle), then the
> correct key to send here would be KEY_F21, this has been the standard
> key-code to send for this for a while now and GNOME and KDE will
> automatically do the right thing when sending that, including a
> nice on-screen-display (OSD)notifcation (like when changing the volume)
> indicating the new (software) state (on or off) of the touchpad.
> 
> If the hw does actually handle the touchpad on/off itself
> (I see there also is a touchpad-led?) then the right thing to do
> would be to send f22 (Touchpad toggle off-to-on) and f23
> (Touchpad toggle on-to-off). This assumes that you can figure
> out the new touchpad state. When receiving f22 / f23 GNOME will
> display the OSD without making any other settings changes.
>
> Also see: /lib/udev/hwdb.d/60-keyboard.hwdb
> 
> 
>         {KE_KEY, 0x10000000, {KEY_F16} },/* Keyboard backlight (F8) - pressing
>                                           * this key both sends an event and
>                                           * changes backlight level.
>                                           */
> 
> If this hotkey changes the kbd-backlight level "in hardware"
> then it should not send a key-press instead you should specify
> 
> led_classdev.flags = LED_BRIGHT_HW_CHANGED
> 
> For the kbd-backlight led_classdev and then call:
> 
> 	led_classdev_notify_brightness_hw_changed(&kbd_backlight, new_backlight_level);
> 
> When receiving the event. upower will pick the event send by this up
> and then notify interested parties such as e.g. gnome-settings-daemon
> which will then show a nice OSD with the new backlight level similar
> to how it is done for e.g. volume controls.
> 
> 
> If you can also send patches to change these 2 things, so that lg-laptop
> conforms with the standard userspace APIs used for this that would be great.

I sent patches for this (in a separate thread). But in my testing, this 
does not happen automatically and I did not find yet how to configure 
udev/upower/kde to display this notification.




-- 
Matan.

