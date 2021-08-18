Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59427C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 07:33:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A44F6108B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 07:33:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238231AbhHRHeD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 03:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60991 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237348AbhHRHeC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 03:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629272008;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PIcvfCaXeBajh0eD+TBomFpThyGY3aYHbJ8JpsCQnno=;
        b=PVv8krzrlhhbn7PYK2vcYjn3B5mVOS8DnXaAG1ZMSh7H0tVdPI2iL+yigyaM3vSQz9o2j0
        EmNXpZumiyJwJm+wmqXgLfuErJe0RWjwwO/dHqiqDK4Jx/F3XuM+tMT3rFcWV+TX6I1sBb
        Nneha1WKUbY/WkQfW9BOZBxcukk0c8s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-h_gPvu9VP7-dKyDC0WJ4PQ-1; Wed, 18 Aug 2021 03:33:26 -0400
X-MC-Unique: h_gPvu9VP7-dKyDC0WJ4PQ-1
Received: by mail-ej1-f71.google.com with SMTP id r21-20020a1709067055b02904be5f536463so564744ejj.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 00:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PIcvfCaXeBajh0eD+TBomFpThyGY3aYHbJ8JpsCQnno=;
        b=CesJeIw+npHPAvtbBbweOIGKUf+urb7eSrGHfu+AszkejnKuUSqaowaSiDUpeqkxmr
         Yb8oz6gQTGxBY350Z//rcpU/mEjIBsFtL82hlckl7oBA3tDHkCeNM97fRrwO6ANzdpUp
         WeNH80whH7Sjf+LF2XCpYIHT0nI/GznSSqqWnPVX64vUojipOJzF3bzyZGlpEr4pF6N9
         bF8caaT7tcmj9oKs5YzlRDnvdxk9CIrIolzosg7inRZ1Gbt4S7PRM2TVEErtTo944Tyo
         F7FxjWglxM2IlyUloIqpeEzmBg/2zO3TDd2wBo0mYm8OFRUjHsXxJLxtYDt9ocMJ9JEv
         4itQ==
X-Gm-Message-State: AOAM531y6vVvJOTAxuM94LKJDrTZuvtHYS14yCUXpmJYTH2vpgnonyXr
        1kbYmamr1AaG/XX7hJFyJOpo+vGC58vlfY2mqyxRDSwEh6OwLB5S03pjEFndgquX73S0EDK7s9o
        fCP2yiSpV9AnXj3bWt5BGPco9iuz2OaPXaw==
X-Received: by 2002:a17:906:e291:: with SMTP id gg17mr8529287ejb.477.1629272005843;
        Wed, 18 Aug 2021 00:33:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvywahg4UoLCC0dClS8Q069f3CBwn2uR5l/SVzkteTeaqIsaID5WRQ1Uq9qwBoIDP/Q981cA==
X-Received: by 2002:a17:906:e291:: with SMTP id gg17mr8529269ejb.477.1629272005622;
        Wed, 18 Aug 2021 00:33:25 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g10sm1627537ejj.44.2021.08.18.00.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 00:33:25 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: lg-laptop: Support for battery charge limit
 on newer models
To:     Matan Ziv-Av <matan@svgalib.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Andy Shevchenko <andy@infradead.org>
References: <9338b0b1-e76e-68f5-36de-a642745ba6ad@svgalib.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7d2ea9fc-6942-d7c9-c6cf-61072dc13ba9@redhat.com>
Date:   Wed, 18 Aug 2021 09:33:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9338b0b1-e76e-68f5-36de-a642745ba6ad@svgalib.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/14/21 12:11 AM, Matan Ziv-Av wrote:
> 
> Add support for the difference between various models:
> 
> - Use dmi to detect laptop model.
> - 2019 and newer models use _wmbb method to set battery charge limit.
> 
> Signed-off-by: Matan Ziv-Av <matan@svgalib.org>

Thank you for the patch, some small comments inline.


> ---
>  drivers/platform/x86/lg-laptop.c | 75 ++++++++++++++++++++++++++++----
>  1 file changed, 66 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
> index 20145b539335..12b0257c0bdd 100644
> --- a/drivers/platform/x86/lg-laptop.c
> +++ b/drivers/platform/x86/lg-laptop.c
> @@ -8,6 +8,7 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/acpi.h>
> +#include <linux/dmi.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/kernel.h>
> @@ -69,6 +70,8 @@ static u32 inited;
>  #define INIT_INPUT_ACPI         0x04
>  #define INIT_SPARSE_KEYMAP      0x80
>  
> +static int battery_limit_use_wmbb;
> +
>  static const struct key_entry wmi_keymap[] = {
>  	{KE_KEY, 0x70, {KEY_F15} },	 /* LG control panel (F1) */
>  	{KE_KEY, 0x74, {KEY_F13} },	 /* Touchpad toggle (F5) */
> @@ -461,7 +464,10 @@ static ssize_t battery_care_limit_store(struct device *dev,
>  	if (value == 100 || value == 80) {
>  		union acpi_object *r;
>  
> -		r = lg_wmab(WM_BATT_LIMIT, WM_SET, value);
> +		if (!battery_limit_use_wmbb)
> +			r = lg_wmab(WM_BATT_LIMIT, WM_SET, value);
> +		else
> +			r = lg_wmbb(WMBB_BATT_LIMIT, WM_SET, value);

Please drop the ! from the if condition and swap the 2 branches.

>  		if (!r)
>  			return -EIO;
>  
> @@ -479,16 +485,29 @@ static ssize_t battery_care_limit_show(struct device *dev,
>  	unsigned int status;
>  	union acpi_object *r;
>  
> -	r = lg_wmab(WM_BATT_LIMIT, WM_GET, 0);
> -	if (!r)
> -		return -EIO;
> +	if (!battery_limit_use_wmbb) {
> +		r = lg_wmab(WM_BATT_LIMIT, WM_GET, 0);
> +		if (!r)
> +			return -EIO;
>  
> -	if (r->type != ACPI_TYPE_INTEGER) {
> -		kfree(r);
> -		return -EIO;
> -	}
> +		if (r->type != ACPI_TYPE_INTEGER) {
> +			kfree(r);
> +			return -EIO;
> +		}
>  
> -	status = r->integer.value;
> +		status = r->integer.value;
> +	} else {
> +		r = lg_wmbb(WMBB_BATT_LIMIT, WM_GET, 0);
> +		if (!r)
> +			return -EIO;
> +
> +		if (r->type != ACPI_TYPE_BUFFER) {
> +			kfree(r);
> +			return -EIO;
> +		}
> +
> +		status = r->buffer.pointer[0x10];
> +	}

Idem (Please drop the ! from the if condition and swap the 2 branches).

>  	kfree(r);
>  	if (status != 80 && status != 100)
>  		status = 0;
> @@ -602,6 +621,8 @@ static struct platform_driver pf_driver = {
>  static int acpi_add(struct acpi_device *device)
>  {
>  	int ret;
> +	const char *product;
> +	int year = 2017;
>  
>  	if (pf_device)
>  		return 0;
> @@ -619,6 +640,42 @@ static int acpi_add(struct acpi_device *device)
>  		pr_err("unable to register platform device\n");
>  		goto out_platform_registered;
>  	}
> +	product = dmi_get_system_info(DMI_PRODUCT_NAME);
> +	if (strlen(product) > 4)
> +		switch (product[4]) {
> +		case '5':
> +		case '6':
> +			year = 2016;
> +			break;
> +		case '7':
> +			year = 2017;
> +			break;
> +		case '8':
> +			year = 2018;
> +			break;
> +		case '9':
> +			year = 2019;
> +			break;
> +		case '0':
> +			if (strlen(product) > 5)
> +				switch (product[5]) {
> +				case 'N':
> +					year = 2020;
> +					break;
> +				case 'P':
> +					year = 2021;
> +					break;
> +				default:
> +					year = 2022;
> +				}
> +			break;
> +		default:
> +			year = 2019;
> +		}
> +	pr_info("product: %s  year: %d\n", product, year);
> +
> +	if (year >= 2019)
> +		battery_limit_use_wmbb = 1;
>  
>  	ret = sysfs_create_group(&pf_device->dev.kobj, &dev_attribute_group);
>  	if (ret)

This does not feel very robust how about doing a strstr for "201" and if that
fails for "202" to find the year ?

Regards,

Hans

p.s.

While reviewing this I also took a quick look at the existing lg-laptop.c
and the wmi_keymap stood out to me, specifically:

        {KE_KEY, 0x74, {KEY_F13} },      /* Touchpad toggle (F5) */

If that key just sends this event and does not actually change the
touchpad settings, IOW userspace is supposed to react this (e.g.
filter out touchpad events in software after the toggle), then the
correct key to send here would be KEY_F21, this has been the standard
key-code to send for this for a while now and GNOME and KDE will
automatically do the right thing when sending that, including a
nice on-screen-display (OSD)notifcation (like when changing the volume)
indicating the new (software) state (on or off) of the touchpad.

If the hw does actually handle the touchpad on/off itself
(I see there also is a touchpad-led?) then the right thing to do
would be to send f22 (Touchpad toggle off-to-on) and f23
(Touchpad toggle on-to-off). This assumes that you can figure
out the new touchpad state. When receiving f22 / f23 GNOME will
display the OSD without making any other settings changes.

Also see: /lib/udev/hwdb.d/60-keyboard.hwdb


        {KE_KEY, 0x10000000, {KEY_F16} },/* Keyboard backlight (F8) - pressing
                                          * this key both sends an event and
                                          * changes backlight level.
                                          */

If this hotkey changes the kbd-backlight level "in hardware"
then it should not send a key-press instead you should specify

led_classdev.flags = LED_BRIGHT_HW_CHANGED

For the kbd-backlight led_classdev and then call:

	led_classdev_notify_brightness_hw_changed(&kbd_backlight, new_backlight_level);

When receiving the event. upower will pick the event send by this up
and then notify interested parties such as e.g. gnome-settings-daemon
which will then show a nice OSD with the new backlight level similar
to how it is done for e.g. volume controls.


If you can also send patches to change these 2 things, so that lg-laptop
conforms with the standard userspace APIs used for this that would be great.

