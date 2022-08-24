Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1575FC00140
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Aug 2022 15:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239416AbiHXPOL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Aug 2022 11:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238706AbiHXPOK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 11:14:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABA697D77
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 08:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661354048;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZJEDkuzu9IHJZHMc08jlIqmTDTiinMncF0FEI8o0Qeg=;
        b=U7IgUxbsQ0SVTveqe1nTK3wldSLpZ6kHwNHSD4KmfYUCQf03XCXsMpH1a5IFb09YNKKHa8
        714S0aNG3Hzcbb6YjF6yFLGTPNkIOYJWkzPCTok1LJ7vCJUWekzBjq0P8+c5wsXwTFhcdA
        2u4xB297fAso2mNFcMDoAswK3SDYeAM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-p90nuH_rOuOICPC-OTiZgw-1; Wed, 24 Aug 2022 11:14:07 -0400
X-MC-Unique: p90nuH_rOuOICPC-OTiZgw-1
Received: by mail-ej1-f69.google.com with SMTP id sc3-20020a1709078a0300b0073d77f805b3so3229013ejc.22
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 08:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ZJEDkuzu9IHJZHMc08jlIqmTDTiinMncF0FEI8o0Qeg=;
        b=wWJGEkAZz+d/49+3NPGv+7/XNG1h7l6wQU2++TwpHJykTY52SJZ+pny4nnbIhgg3sX
         Vl8+f/nrlFMD9jABCwuj5XILsAOrJZL6p7YKGAhjOUR0fnjvXK4Ij2jh2Vh7/KtnsBhQ
         k7yq179NENDM9wESjRVZXyuk7cMaRSwSncdEMP+inykjP8yEcicIlNE1igOVF5/P/cLy
         9/nh94Y57UnuJzOcYdMYQsKJ8l7D9NUGUsC59RsGE5DRPV+bx4vZf8XmK/8KM7r9HJgb
         iEZcfcYINl76j4EmOBLrnbPvxMqBmqI1f8UDYvhWWXgyBz/Uz5i7lWAq1aPvxvq3v3jM
         aHSA==
X-Gm-Message-State: ACgBeo33EOJ7Lpkk+WyCXj5HWrFlphTTpIito+P0MQpQLGsHbWvYzMMm
        e8oJwPtYK+IFZ7yIGnKej7rAwIy4lGJiUWlT8wpZJkcfHFRdpARH7cAxxz02xidQArxKmT3Tm3Z
        BHX4Mz+qoEQfG+LP0Z8bDQLVa4KIZCDkeNA==
X-Received: by 2002:a17:906:9b84:b0:73d:8324:487e with SMTP id dd4-20020a1709069b8400b0073d8324487emr3186740ejc.98.1661354045652;
        Wed, 24 Aug 2022 08:14:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7vIXmRTV3Fq7EMUoDGRCWsTAwfJwbCVHvBTfIfGEclmXWJCzndbCOkLl4d4hM2fG7Rx5CV1w==
X-Received: by 2002:a17:906:9b84:b0:73d:8324:487e with SMTP id dd4-20020a1709069b8400b0073d8324487emr3186731ejc.98.1661354045470;
        Wed, 24 Aug 2022 08:14:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id w5-20020a05640234c500b00445b3cab975sm3332267edc.56.2022.08.24.08.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 08:14:04 -0700 (PDT)
Message-ID: <cf4a71bb-58f6-cb43-a90b-34b4842a2a42@redhat.com>
Date:   Wed, 24 Aug 2022 17:14:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] platform/x86: asus-wmi: Simplify tablet-mode-switch
 probing
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        "Luke D . Jones" <luke@ljones.dev>
References: <20220824151145.1448010-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220824151145.1448010-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/24/22 17:11, Hans de Goede wrote:
> The 3 different tablet-mode-switch initialization paths repeat a lot
> of the same code. Add a helper function for this.
> 
> This also makes the error-handling for the kbd_dock_devid case consistent
> with the other 2 cases.
> 
> Cc: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added these 2 patches to my review-hans (soon to be for-next) branch now.

Regards,

Hans




> ---
>  drivers/platform/x86/asus-wmi.c | 55 +++++++++++++--------------------
>  1 file changed, 22 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 5352055848d0..d71daa024752 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -484,13 +484,28 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
>  }
>  
>  /* Input **********************************************************************/
> +static void asus_wmi_tablet_sw_init(struct asus_wmi *asus, u32 dev_id, int event_code)
> +{
> +	struct device *dev = &asus->platform_device->dev;
> +	int result;
> +
> +	result = asus_wmi_get_devstate_simple(asus, dev_id);
> +	if (result < 0)
> +		asus->driver->quirks->tablet_switch_mode = asus_wmi_no_tablet_switch;
> +	if (result >= 0) {
> +		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
> +		input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
> +	} else if (result == -ENODEV) {
> +		dev_err(dev, "This device has tablet-mode-switch quirk but got ENODEV checking it. This is a bug.");
> +	} else {
> +		dev_err(dev, "Error checking for tablet-mode-switch: %d\n", result);
> +	}
> +}
>  
>  static int asus_wmi_input_init(struct asus_wmi *asus)
>  {
> -	struct device *dev;
> -	int err, result;
> -
> -	dev = &asus->platform_device->dev;
> +	struct device *dev = &asus->platform_device->dev;
> +	int err;
>  
>  	asus->inputdev = input_allocate_device();
>  	if (!asus->inputdev)
> @@ -510,39 +525,13 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
>  	case asus_wmi_no_tablet_switch:
>  		break;
>  	case asus_wmi_kbd_dock_devid:
> -		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
> -		if (result >= 0) {
> -			input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
> -			input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
> -		} else if (result != -ENODEV) {
> -			dev_err(dev, "Error checking for keyboard-dock: %d\n", result);
> -		}
> +		asus_wmi_tablet_sw_init(asus, ASUS_WMI_DEVID_KBD_DOCK, NOTIFY_KBD_DOCK_CHANGE);
>  		break;
>  	case asus_wmi_lid_flip_devid:
> -		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP);
> -		if (result < 0)
> -			asus->driver->quirks->tablet_switch_mode = asus_wmi_no_tablet_switch;
> -		if (result >= 0) {
> -			input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
> -			input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
> -		} else if (result == -ENODEV) {
> -			dev_err(dev, "This device has lid_flip quirk but got ENODEV checking it. This is a bug.");
> -		} else {
> -			dev_err(dev, "Error checking for lid-flip: %d\n", result);
> -		}
> +		asus_wmi_tablet_sw_init(asus, ASUS_WMI_DEVID_LID_FLIP, NOTIFY_LID_FLIP);
>  		break;
>  	case asus_wmi_lid_flip_rog_devid:
> -		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP_ROG);
> -		if (result < 0)
> -			asus->driver->quirks->tablet_switch_mode = asus_wmi_no_tablet_switch;
> -		if (result >= 0) {
> -			input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
> -			input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
> -		} else if (result == -ENODEV) {
> -			dev_err(dev, "This device has lid-flip-rog quirk but got ENODEV checking it. This is a bug.");
> -		} else {
> -			dev_err(dev, "Error checking for lid-flip: %d\n", result);
> -		}
> +		asus_wmi_tablet_sw_init(asus, ASUS_WMI_DEVID_LID_FLIP_ROG, NOTIFY_LID_FLIP_ROG);
>  		break;
>  	}
>  

