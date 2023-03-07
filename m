Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18C1C678D4
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Mar 2023 11:46:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbjCGLqy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Mar 2023 06:46:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbjCGLqa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Mar 2023 06:46:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185F8303F3
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Mar 2023 03:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678189346;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CLhqgCau2ZF6uI0rajlxO7EAL6BSTDvpF0RZmY0H64g=;
        b=WO2ri2PnLJRaZiGRVDf/S5jTsqI0Wo4iSb8lRXsEO+l8/SvNfqEwx6ghuv3HdnfqavouFh
        W45poykKjS5D/+ZJRbMze9FV8Ick2BIVShrhVqL6tshvRryZTOM3DqZr68zyfI4t3dQOJ9
        GcfpLA4hySfOGbeC5PjalVMSaE0lrSw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-SH3fAIcoNCKwXQMkeAj3vA-1; Tue, 07 Mar 2023 06:42:25 -0500
X-MC-Unique: SH3fAIcoNCKwXQMkeAj3vA-1
Received: by mail-ed1-f69.google.com with SMTP id q13-20020a5085cd000000b004af50de0bcfso18766883edh.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Mar 2023 03:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678189344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CLhqgCau2ZF6uI0rajlxO7EAL6BSTDvpF0RZmY0H64g=;
        b=hMg7pRkfqWuU9z0Q+uvlcB5hhXmj2VK/yusJBu1BKSmw7C/s3Nt2FeytUghHuT5Gyz
         O9+U4ezK4qvPrgtGrUKcsdEng7NEpGfjCFKHd1w6ecGnXizmgd3qd8jm3r6RpJgCzQHQ
         n4q6pNJBO8SSd4MzQosy7xUluwWxnvkL3avBI0/VAGiX0BEWIBNuJLQV6WDP2EuOLA2q
         Efk/ci8qlOQNact4WxGXJrx3cF/S6Lic2EMqz89dCAS6fsI4Qk+1Lqst0BP43BZGhrC0
         ZhWeNhr8mssx5nPzjir4I1iSIIsSXZtqKPpDMkJqbgRM7pwYXmBCjbCahXVXwho8rPaE
         fUaA==
X-Gm-Message-State: AO0yUKWuxCTKpjTtyPXHJhOHVh+JWcehvAdsjF/iE5p1gGgadQnC7anM
        vzClbs+jAadw/62ElE6O8UQuUgRf2zmy3HgoDr30HDftpdqdoOOKIr8eMRxzSnCmmP7e75Bweld
        1r7ztwWhfMhHkB8qMe6bDXjEEIpNxNCmm0Q==
X-Received: by 2002:a17:907:6e15:b0:8b1:75a0:e5c6 with SMTP id sd21-20020a1709076e1500b008b175a0e5c6mr18301577ejc.18.1678189343834;
        Tue, 07 Mar 2023 03:42:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9kqX21+krPozcdCGx9yXUF79hIGlVvA4Oa0/yHh0psODmlZJYRRs6nBKPaDRvYJDkxjmc2OA==
X-Received: by 2002:a17:907:6e15:b0:8b1:75a0:e5c6 with SMTP id sd21-20020a1709076e1500b008b175a0e5c6mr18301558ejc.18.1678189343541;
        Tue, 07 Mar 2023 03:42:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v9-20020a17090651c900b008b2e4f88ed7sm6007928ejk.111.2023.03.07.03.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 03:42:23 -0800 (PST)
Message-ID: <6ca9b928-0d16-0e27-8a5f-d0af9a636748@redhat.com>
Date:   Tue, 7 Mar 2023 12:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: apple-gmux: Add
 acpi_video_get_backlight_type() check
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Aditya Garg <gargaditya08@live.com>
References: <20230307113813.359743-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230307113813.359743-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/7/23 12:38, Hans de Goede wrote:
> Make apple-gmux backlight registration honor the acpi_backlight=...
> kernel commandline option which is used to select the backlight
> control method on x86/ACPI devices.
> 
> Reported-and-tested-by: Aditya Garg <gargaditya08@live.com>
> Link: https://lore.kernel.org/platform-driver-x86/BM1PR01MB0931B467250831916F7C55B3B8A59@BM1PR01MB0931.INDPRD01.PROD.OUTLOOK.COM/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/apple-gmux.c | 59 +++++++++++++++++--------------
>  1 file changed, 33 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 757fd71c900f..787cf2a7e268 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -23,6 +23,7 @@
>  #include <linux/pci.h>
>  #include <linux/vga_switcheroo.h>
>  #include <linux/debugfs.h>
> +#include <acpi/video.h>
>  #include <asm/io.h>
>  
>  /**
> @@ -783,6 +784,7 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
>  	struct backlight_properties props;
>  	struct backlight_device *bdev;
>  	u8 ver_major, ver_minor, ver_release;
> +	bool register_bdev = true;
>  	int ret = -ENXIO;
>  	acpi_status status;
>  	unsigned long long gpe;
> @@ -859,33 +861,38 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
>  	props.type = BACKLIGHT_PLATFORM;
>  	props.max_brightness = gmux_read32(gmux_data, GMUX_PORT_MAX_BRIGHTNESS);
>  
> -	/*
> -	 * Currently it's assumed that the maximum brightness is less than
> -	 * 2^24 for compatibility with old gmux versions. Cap the max
> -	 * brightness at this value, but print a warning if the hardware
> -	 * reports something higher so that it can be fixed.
> -	 */
> -	if (WARN_ON(props.max_brightness > GMUX_MAX_BRIGHTNESS))
> -		props.max_brightness = GMUX_MAX_BRIGHTNESS;
> -
> -	bdev = backlight_device_register("gmux_backlight", &pnp->dev,
> -					 gmux_data, &gmux_bl_ops, &props);
> -	if (IS_ERR(bdev)) {
> -		ret = PTR_ERR(bdev);
> -		goto err_unmap;
> -	}
> -
> -	gmux_data->bdev = bdev;
> -	bdev->props.brightness = gmux_get_brightness(bdev);
> -	backlight_update_status(bdev);
> +#if IS_REACHABLE(CONFIG_ACPI_VIDEO)
> +	register_bdev = acpi_video_get_backlight_type() == acpi_backlight_apple_gmux;
> +#endif
> +	if (register_bdev) {
> +		/*
> +		 * Currently it's assumed that the maximum brightness is less than
> +		 * 2^24 for compatibility with old gmux versions. Cap the max
> +		 * brightness at this value, but print a warning if the hardware
> +		 * reports something higher so that it can be fixed.
> +		 */
> +		if (WARN_ON(props.max_brightness > GMUX_MAX_BRIGHTNESS))
> +			props.max_brightness = GMUX_MAX_BRIGHTNESS;
> +
> +		bdev = backlight_device_register("gmux_backlight", &pnp->dev,
> +						 gmux_data, &gmux_bl_ops, &props);
> +		if (IS_ERR(bdev)) {
> +			ret = PTR_ERR(bdev);
> +			goto err_unmap;
> +		}
>  
> -	/*
> -	 * The backlight situation on Macs is complicated. If the gmux is
> -	 * present it's the best choice, because it always works for
> -	 * backlight control and supports more levels than other options.
> -	 * Disable the other backlight choices.
> -	 */
> -	apple_bl_unregister();
> +		gmux_data->bdev = bdev;
> +		bdev->props.brightness = gmux_get_brightness(bdev);
> +		backlight_update_status(bdev);
> +
> +		/*
> +		 * The backlight situation on Macs is complicated. If the gmux is
> +		 * present it's the best choice, because it always works for
> +		 * backlight control and supports more levels than other options.
> +		 * Disable the other backlight choices.
> +		 */
> +		apple_bl_unregister();
> +	}
>  
>  	gmux_data->power_state = VGA_SWITCHEROO_ON;
>  

