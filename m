Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FAEC54EBE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 19:03:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbjALTD0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 14:03:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231987AbjALTDA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 14:03:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED13363D29
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673548848;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zs37bHjmE8s93lTXci6sWO2I/m2JZroQwtrvxy4djzQ=;
        b=iWMqsVMpVXeqHJ8IUGARkKoYtT4rHOENERqVUOsj8poQwmttDTp5IhmSOPDbi5joirxA1E
        kW0xEdrIdFX2Z8SK1UMl10lYPWaQy6MyEKhz84F4ePoLZ8AF4mHljkZQQInFrirEUpn14a
        7nkDQgtM98VPzAtHjuMDfdjy6etcQL8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-FDu6dpzXNj27XMQZp_yi6g-1; Thu, 12 Jan 2023 13:40:46 -0500
X-MC-Unique: FDu6dpzXNj27XMQZp_yi6g-1
Received: by mail-ej1-f70.google.com with SMTP id xj11-20020a170906db0b00b0077b6ecb23fcso13321417ejb.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zs37bHjmE8s93lTXci6sWO2I/m2JZroQwtrvxy4djzQ=;
        b=Y62Fn/11fb+oS/P45HIB/0OB7vUcQBC14klDNEHtjNvh+z+Cpn8cLsCzSnQLKsoTF7
         uMU4GJebOHpZheg/ddgu/oIuw30dEH0hmlkkkSk/A6bXPhRiAkVm1QOi/kclznMJbGq+
         6AeqUsI2ztnIv/PzuXmOCamVPMio4QKL9LehhptAkjRM1XCn7TZsgGh3MPmjcSaFnCTm
         rjXKWGVfq9MuN0VTuQHaKgcp1R7wznS4qPWt1JYpDbi8Jx1CPnJhOGAzDUso8mlb8p1D
         gB1H+PX3eDpUa6za0vSmjd1U28vPIRf7lwkJSpizeBXjRaUmj1TgcwOQpzQ51Vub2Lh/
         H/+g==
X-Gm-Message-State: AFqh2krbXz0uuxJrdPFPdtJknjJiva2XG+xaOfMNeziQ1C3L7TM7mfHV
        3jnsXXCRbftCBdE+Kg0zEo/tLw3894/WpTIpg+a+nM6U1AKK3AtVT8SNwDrp99LyxXP5mGDvhbH
        9/1u56oLaMSZpsUqhlv0cZfjir3UBGIwsrA==
X-Received: by 2002:a05:6402:160e:b0:499:8849:5fb3 with SMTP id f14-20020a056402160e00b0049988495fb3mr14333836edv.31.1673548845438;
        Thu, 12 Jan 2023 10:40:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs4kvdCDV8vmj27hgBVdCcfURFEnDP3RqcSg3RVd3AhV2WuZnQysNRSYMUmFdbnrmnoF7z0cQ==
X-Received: by 2002:a05:6402:160e:b0:499:8849:5fb3 with SMTP id f14-20020a056402160e00b0049988495fb3mr14333828edv.31.1673548845281;
        Thu, 12 Jan 2023 10:40:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b3-20020a17090630c300b007c0f90a9cc5sm7751235ejb.105.2023.01.12.10.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 10:40:44 -0800 (PST)
Message-ID: <e5986ec5-7dbe-16e5-a1ef-c81761c365a8@redhat.com>
Date:   Thu, 12 Jan 2023 19:40:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] platform/x86: dell-privacy: Fix SW_CAMERA_LENS_COVER
 reporting
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20221221220724.119594-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221221220724.119594-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/21/22 23:07, Hans de Goede wrote:
> Use KE_VSW instead of KE_SW for the SW_CAMERA_LENS_COVER key_entry
> and get the value of the switch from the status field when handling
> SW_CAMERA_LENS_COVER events, instead of always reporting 0.
> 
> Also correctly set the initial SW_CAMERA_LENS_COVER value.
> 
> Fixes: 8af9fa37b8a3 ("platform/x86: dell-privacy: Add support for Dell hardware privacy")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans (soon to be fixes) branch now.

Regards,

Hans

> ---
>  drivers/platform/x86/dell/dell-wmi-privacy.c | 22 ++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platform/x86/dell/dell-wmi-privacy.c
> index c82b3d6867c5..915d5deeb971 100644
> --- a/drivers/platform/x86/dell/dell-wmi-privacy.c
> +++ b/drivers/platform/x86/dell/dell-wmi-privacy.c
> @@ -61,7 +61,7 @@ static const struct key_entry dell_wmi_keymap_type_0012[] = {
>  	/* privacy mic mute */
>  	{ KE_KEY, 0x0001, { KEY_MICMUTE } },
>  	/* privacy camera mute */
> -	{ KE_SW,  0x0002, { SW_CAMERA_LENS_COVER } },
> +	{ KE_VSW, 0x0002, { SW_CAMERA_LENS_COVER } },
>  	{ KE_END, 0},
>  };
>  
> @@ -115,11 +115,15 @@ bool dell_privacy_process_event(int type, int code, int status)
>  
>  	switch (code) {
>  	case DELL_PRIVACY_AUDIO_EVENT: /* Mic mute */
> -	case DELL_PRIVACY_CAMERA_EVENT: /* Camera mute */
>  		priv->last_status = status;
>  		sparse_keymap_report_entry(priv->input_dev, key, 1, true);
>  		ret = true;
>  		break;
> +	case DELL_PRIVACY_CAMERA_EVENT: /* Camera mute */
> +		priv->last_status = status;
> +		sparse_keymap_report_entry(priv->input_dev, key, !(status & CAMERA_STATUS), false);
> +		ret = true;
> +		break;
>  	default:
>  		dev_dbg(&priv->wdev->dev, "unknown event type 0x%04x 0x%04x\n", type, code);
>  	}
> @@ -304,6 +308,11 @@ static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *context)
>  
>  	dev_set_drvdata(&wdev->dev, priv);
>  	priv->wdev = wdev;
> +
> +	ret = get_current_status(priv->wdev);
> +	if (ret)
> +		return ret;
> +
>  	/* create evdev passing interface */
>  	priv->input_dev = devm_input_allocate_device(&wdev->dev);
>  	if (!priv->input_dev)
> @@ -331,11 +340,12 @@ static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *context)
>  	priv->input_dev->name = "Dell Privacy Driver";
>  	priv->input_dev->id.bustype = BUS_HOST;
>  
> -	ret = input_register_device(priv->input_dev);
> -	if (ret)
> -		return ret;
> +	/* Report initial camera-cover status */
> +	if (priv->features_present & BIT(DELL_PRIVACY_TYPE_CAMERA))
> +		input_report_switch(priv->input_dev, SW_CAMERA_LENS_COVER,
> +				    !(priv->last_status & CAMERA_STATUS));
>  
> -	ret = get_current_status(priv->wdev);
> +	ret = input_register_device(priv->input_dev);
>  	if (ret)
>  		return ret;
>  

