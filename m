Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5424ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Sep 2022 17:41:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiIIRla (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Sep 2022 13:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbiIIRl3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Sep 2022 13:41:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13A5979F7
        for <platform-driver-x86@vger.kernel.org>; Fri,  9 Sep 2022 10:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662745287;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9M0kqItM9plhK1KFlZ7clm4OCYC2Cx+YQmfHN1M/8m0=;
        b=IPlnk13S7HiaSOT8+Ys/uoWupRNbRKCInxNX2z0E1dCjDo09fmF+uhxJVvKGOOg+M9HH4P
        0WKOArAm7I6OgQ9Am6+IG3sOwLcKOHSSRurPX233w5k3rSRVDl91fwZOK9e+o6yLShLV9q
        Y6Gx1fGnLrSJDysDuzsgL6tLrgIEtqc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-437-Txv17v8JNH2t0zsPZEiDVw-1; Fri, 09 Sep 2022 13:41:17 -0400
X-MC-Unique: Txv17v8JNH2t0zsPZEiDVw-1
Received: by mail-ej1-f72.google.com with SMTP id hs4-20020a1709073e8400b0073d66965277so1360951ejc.6
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Sep 2022 10:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9M0kqItM9plhK1KFlZ7clm4OCYC2Cx+YQmfHN1M/8m0=;
        b=6dBwpjhPGPnfx04/kAYFbxLPpA0yIT4xWnTx1ki7fqz/9Nyr9IWzL9sHl1WdTheD9e
         CR4/Tmanpl13CkBmxUfA9m3yH2++3HF5ML9wpmI7z/ZBqlmFBknt5mpUOOL81Fu/VFOs
         m5LoOKKqFPYAzt7JZXoMxgxUalL5+w0gwLvmWcYYX3LjGLfKmHJ8hdK1X50BJMXpBcTV
         7UYQEY+K47n9l4ArYmlbPQqRZZ2JW1k2aT1dMPLE3UdcnBJZBYzy017hJUY3/ZKaUarm
         hH0LMTgrva9c1d0Esl/mGy4SldOyaC4Cf5KCjiFn/WlkCkaI63EfOW53oANm4Z5pm1ho
         FHfg==
X-Gm-Message-State: ACgBeo1pZ4eGn37A1fl00Bx2Hnh8xCZEtI4iN0Bj1lzi4fZVDojuUdks
        /HqE7UMqjmWlXGPONdAIn31RoTQAQ2ZGnnRYpeg5u1xm7qCfRgVWDN/JTfqG8lrXiSRso6H1v8L
        cY8//4c/m8ome3GZcJBzsFQA3Kk2l42eAtw==
X-Received: by 2002:a17:907:8686:b0:773:6f77:f110 with SMTP id qa6-20020a170907868600b007736f77f110mr7484567ejc.547.1662745272371;
        Fri, 09 Sep 2022 10:41:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5g51v7A56nWF33hp1ZuydAQ3ObgUmrUx/xmVtZgT9K967VFJqOVfKnbXLU2WP1/VDl9oIEHQ==
X-Received: by 2002:a17:907:8686:b0:773:6f77:f110 with SMTP id qa6-20020a170907868600b007736f77f110mr7484555ejc.547.1662745272116;
        Fri, 09 Sep 2022 10:41:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id b4-20020aa7df84000000b0044dbecdcd29sm729398edy.12.2022.09.09.10.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 10:41:11 -0700 (PDT)
Message-ID: <43c52d4c-3355-6699-7ad9-02a62e63fbd9@redhat.com>
Date:   Fri, 9 Sep 2022 19:41:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] drivers/platform: toshiba_acpi: Call
 HCI_PANEL_POWER_ON on resume on some models
Content-Language: en-US
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Arvid Norlander <lkml@vorpal.se>,
        Mark Gross <mgross@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org, Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20220909153239.34606-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220909153239.34606-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/9/22 17:32, Hans de Goede wrote:
> Some Toshibas have a broken acpi-video interface for brightness control, so
> far these have been using a special workaround in drivers/acpi/acpi_video.c
> which gets activated by the disable_backlight_sysfs_if module-param/quirks.
> 
> The recent x86/acpi backlight refactoring has broken this workaround:
> 1. This workaround relies on acpi_video_get_backlight_type() returning
>    acpi_video so that the acpi_video code actually runs; and
> 2. this relies on the actual native GPU driver to offer the sysfs
>    backlight interface to userspace.
> 
> After the refactor this breaks since the native driver will no
> longer register its backlight-device if acpi_video_get_backlight_type()
> does not return native and making it return native breaks 1.
> 
> Keeping the acpi_video backlight handling on resume active, while not
> using it to set the brightness, is necessary because it does a _BCM
> call on resume which is necessary to turn the panel back on on resume.
> 
> Looking at the DSDT shows that this _BCM call results in a Toshiba
> HCI_SET HCI_LCD_BRIGHTNESS call, which turns the panel back on.
> 
> This commit makes toshiba_acpi do a HCI_SET HCI_PANEL_POWER_ON call
> on resume on the affected models, so that the (now broken)
> acpi_video disable_backlight_sysfs_if workaround will no longer
> be necessary.
> 
> Note this uses HCI_PANEL_POWER_ON instead of HCI_LCD_BRIGHTNESS
> to avoid changing the configured brightness level.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Add a turn_on_panel_on_resume module parameter to allow overriding
>   the DMI quirk based setting

I have added these 2 patches to my review-hans (soon to be for-next)
branch now.

Regards,

Hans




> ---
>  drivers/platform/x86/toshiba_acpi.c | 50 +++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 900ee68a4c0b..aa55ed0d029d 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -23,6 +23,7 @@
>  #define PROC_INTERFACE_VERSION	1
>  
>  #include <linux/compiler.h>
> +#include <linux/dmi.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
> @@ -50,6 +51,11 @@ MODULE_AUTHOR("John Belmonte");
>  MODULE_DESCRIPTION("Toshiba Laptop ACPI Extras Driver");
>  MODULE_LICENSE("GPL");
>  
> +int turn_on_panel_on_resume = -1;
> +module_param(turn_on_panel_on_resume, int, 0644);
> +MODULE_PARM_DESC(turn_on_panel_on_resume,
> +	"Call HCI_PANEL_POWER_ON on resume (-1 = auto, 0 = no, 1 = yes");
> +
>  #define TOSHIBA_WMI_EVENT_GUID "59142400-C6A3-40FA-BADB-8A2652834100"
>  
>  /* Scan code for Fn key on TOS1900 models */
> @@ -100,6 +106,7 @@ MODULE_LICENSE("GPL");
>  #define TOS_NOT_INSTALLED		0x8e00
>  
>  /* Registers */
> +#define HCI_PANEL_POWER_ON		0x0002
>  #define HCI_FAN				0x0004
>  #define HCI_TR_BACKLIGHT		0x0005
>  #define HCI_SYSTEM_EVENT		0x0016
> @@ -3002,6 +3009,43 @@ static const char *find_hci_method(acpi_handle handle)
>  	return NULL;
>  }
>  
> +/*
> + * Some Toshibas have a broken acpi-video interface for brightness control,
> + * these are quirked in drivers/acpi/video_detect.c to use the GPU native
> + * (/sys/class/backlight/intel_backlight) instead.
> + * But these need a HCI_SET call to actually turn the panel back on at resume,
> + * without this call the screen stays black at resume.
> + * Either HCI_LCD_BRIGHTNESS (used by acpi_video's _BCM) or HCI_PANEL_POWER_ON
> + * works. toshiba_acpi_resume() uses HCI_PANEL_POWER_ON to avoid changing
> + * the configured brightness level.
> + */
> +static const struct dmi_system_id turn_on_panel_on_resume_dmi_ids[] = {
> +	{
> +	 /* Toshiba Portégé R700 */
> +	 /* https://bugzilla.kernel.org/show_bug.cgi?id=21012 */
> +	 .matches = {
> +		DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
> +		DMI_MATCH(DMI_PRODUCT_NAME, "PORTEGE R700"),
> +		},
> +	},
> +	{
> +	 /* Toshiba Satellite/Portégé R830 */
> +	 /* Portégé: https://bugs.freedesktop.org/show_bug.cgi?id=82634 */
> +	 /* Satellite: https://bugzilla.kernel.org/show_bug.cgi?id=21012 */
> +	 .matches = {
> +		DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
> +		DMI_MATCH(DMI_PRODUCT_NAME, "R830"),
> +		},
> +	},
> +	{
> +	 /* Toshiba Satellite/Portégé Z830 */
> +	 .matches = {
> +		DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
> +		DMI_MATCH(DMI_PRODUCT_NAME, "Z830"),
> +		},
> +	},
> +};
> +
>  static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>  {
>  	struct toshiba_acpi_dev *dev;
> @@ -3144,6 +3188,9 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>  	ret = get_fan_status(dev, &dummy);
>  	dev->fan_supported = !ret;
>  
> +	if (turn_on_panel_on_resume == -1)
> +		turn_on_panel_on_resume = dmi_check_system(turn_on_panel_on_resume_dmi_ids);
> +
>  	toshiba_wwan_available(dev);
>  	if (dev->wwan_supported)
>  		toshiba_acpi_setup_wwan_rfkill(dev);
> @@ -3260,6 +3307,9 @@ static int toshiba_acpi_resume(struct device *device)
>  			rfkill_set_hw_state(dev->wwan_rfk, !dev->killswitch);
>  	}
>  
> +	if (turn_on_panel_on_resume)
> +		hci_write(dev, HCI_PANEL_POWER_ON, 1);
> +
>  	return 0;
>  }
>  #endif

