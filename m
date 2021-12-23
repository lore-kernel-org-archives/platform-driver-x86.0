Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D9AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 23 Dec 2021 16:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349148AbhLWQYc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 23 Dec 2021 11:24:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51618 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349031AbhLWQYc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Dec 2021 11:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640276671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ce8s95Xpo94oUZFkoDBB8Qld5GnPUfFsIOCy0UOtJqE=;
        b=NWiIGbLK+hwrL5+FtB+tGNVn799yvIVi/wlTu5lxdqnm0h/C+XXOagsqNK7bXst8Eo2L0s
        uuQe8gtaobfpAYjYHCcv6C90MwzhTIxk/M1L9MUKCTpF81rvBxPK4AQrYbjnG7gKbWGHfz
        6z+vOu0MBLjq0IzBT1uruROuI5+44Ao=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-d7_Zsy8rN2SWfRJWBIJ74Q-1; Thu, 23 Dec 2021 11:24:30 -0500
X-MC-Unique: d7_Zsy8rN2SWfRJWBIJ74Q-1
Received: by mail-ed1-f72.google.com with SMTP id z8-20020a056402274800b003f8580bfb99so4873360edd.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Dec 2021 08:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ce8s95Xpo94oUZFkoDBB8Qld5GnPUfFsIOCy0UOtJqE=;
        b=WuMod/SfitQl4D1OqSZe8gvT0Hy1HmKU4nIag8JVgpo2kzLBWulExKF2t6LGN/KabW
         uQR7MMtWUVFdyRznfvPN2iztcJgRcvD82LKnDEQIhxmhQU9Dlj/sVFGNKliCU2xihDEB
         ZTHWGcnpFTnB+K72VCBvA9bwWDOXaeELJUB5Ih3svjSAg4vpy/gyXLRkCFFrxe9C/aZI
         g9AMpcsfvByEKLxCIRZaU15+XzSavKQtU7i+YbQ4L7j/yHgysfJ053n4HzbYpWZkPAU9
         RKBLeqbnn6m8r3Y3sV3scSIUhpASSLHLZM3FMnT7kYokpshdHBmOU8PBjJSmTOSe0p2+
         wzfA==
X-Gm-Message-State: AOAM531QoL/6oD5efwR97E79MnSiak8Emf2DkmJ7uXn6Cn+2wPkb3bHY
        EKjU1m7mgUkjrUJNgnqRB3oK+qzp23lAi9GyChHRjq9Py8+umx9+MZ6/lKknton9ld0jGpd+CB3
        lVUBWfwF+pKDapa5ak8G4prmhlKvswbnS2Q==
X-Received: by 2002:a17:907:6092:: with SMTP id ht18mr2464622ejc.175.1640276668823;
        Thu, 23 Dec 2021 08:24:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4i+Y/sGDlLItDaVNm8EjQJGa+HMRxHawRag2A/fxkNNzRTIaP8L6Yu6wrGDkAUXp2Yq0lsg==
X-Received: by 2002:a17:907:6092:: with SMTP id ht18mr2464613ejc.175.1640276668605;
        Thu, 23 Dec 2021 08:24:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id c12sm2251779edx.80.2021.12.23.08.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Dec 2021 08:24:28 -0800 (PST)
Message-ID: <f0735e45-aeb8-e5b9-fea4-807212129c3f@redhat.com>
Date:   Thu, 23 Dec 2021 17:24:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: system76_acpi: Guard System76 EC specific
 functionality
Content-Language: en-US
To:     Tim Crawford <tcrawford@system76.com>,
        platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
References: <20211222185154.4560-1-tcrawford@system76.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211222185154.4560-1-tcrawford@system76.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/22/21 19:51, Tim Crawford wrote:
> Certain functionality or its implementation in System76 EC firmware may
> be different to the proprietary ODM EC firmware. Introduce a new bool,
> `has_open_ec`, to guard our specific logic. Detect the use of this by
> looking for a custom ACPI method name used in System76 firmware.
> 
> Signed-off-by: Tim Crawford <tcrawford@system76.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also add this to the pdx86/fixes branch and send it out
to Linus with the next pdx86 fixes pull-req for Linus (since this
fixes changes introduced in 5.16).

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
>  drivers/platform/x86/system76_acpi.c | 58 ++++++++++++++--------------
>  1 file changed, 30 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
> index 8b292ee95a14..7299ad08c838 100644
> --- a/drivers/platform/x86/system76_acpi.c
> +++ b/drivers/platform/x86/system76_acpi.c
> @@ -35,6 +35,7 @@ struct system76_data {
>  	union acpi_object *nfan;
>  	union acpi_object *ntmp;
>  	struct input_dev *input;
> +	bool has_open_ec;
>  };
>  
>  static const struct acpi_device_id device_ids[] = {
> @@ -279,20 +280,12 @@ static struct acpi_battery_hook system76_battery_hook = {
>  
>  static void system76_battery_init(void)
>  {
> -	acpi_handle handle;
> -
> -	handle = ec_get_handle();
> -	if (handle && acpi_has_method(handle, "GBCT"))
> -		battery_hook_register(&system76_battery_hook);
> +	battery_hook_register(&system76_battery_hook);
>  }
>  
>  static void system76_battery_exit(void)
>  {
> -	acpi_handle handle;
> -
> -	handle = ec_get_handle();
> -	if (handle && acpi_has_method(handle, "GBCT"))
> -		battery_hook_unregister(&system76_battery_hook);
> +	battery_hook_unregister(&system76_battery_hook);
>  }
>  
>  // Get the airplane mode LED brightness
> @@ -673,6 +666,10 @@ static int system76_add(struct acpi_device *acpi_dev)
>  	acpi_dev->driver_data = data;
>  	data->acpi_dev = acpi_dev;
>  
> +	// Some models do not run open EC firmware. Check for an ACPI method
> +	// that only exists on open EC to guard functionality specific to it.
> +	data->has_open_ec = acpi_has_method(acpi_device_handle(data->acpi_dev), "NFAN");
> +
>  	err = system76_get(data, "INIT");
>  	if (err)
>  		return err;
> @@ -718,27 +715,31 @@ static int system76_add(struct acpi_device *acpi_dev)
>  	if (err)
>  		goto error;
>  
> -	err = system76_get_object(data, "NFAN", &data->nfan);
> -	if (err)
> -		goto error;
> +	if (data->has_open_ec) {
> +		err = system76_get_object(data, "NFAN", &data->nfan);
> +		if (err)
> +			goto error;
>  
> -	err = system76_get_object(data, "NTMP", &data->ntmp);
> -	if (err)
> -		goto error;
> +		err = system76_get_object(data, "NTMP", &data->ntmp);
> +		if (err)
> +			goto error;
>  
> -	data->therm = devm_hwmon_device_register_with_info(&acpi_dev->dev,
> -		"system76_acpi", data, &thermal_chip_info, NULL);
> -	err = PTR_ERR_OR_ZERO(data->therm);
> -	if (err)
> -		goto error;
> +		data->therm = devm_hwmon_device_register_with_info(&acpi_dev->dev,
> +			"system76_acpi", data, &thermal_chip_info, NULL);
> +		err = PTR_ERR_OR_ZERO(data->therm);
> +		if (err)
> +			goto error;
>  
> -	system76_battery_init();
> +		system76_battery_init();
> +	}
>  
>  	return 0;
>  
>  error:
> -	kfree(data->ntmp);
> -	kfree(data->nfan);
> +	if (data->has_open_ec) {
> +		kfree(data->ntmp);
> +		kfree(data->nfan);
> +	}
>  	return err;
>  }
>  
> @@ -749,14 +750,15 @@ static int system76_remove(struct acpi_device *acpi_dev)
>  
>  	data = acpi_driver_data(acpi_dev);
>  
> -	system76_battery_exit();
> +	if (data->has_open_ec) {
> +		system76_battery_exit();
> +		kfree(data->nfan);
> +		kfree(data->ntmp);
> +	}
>  
>  	devm_led_classdev_unregister(&acpi_dev->dev, &data->ap_led);
>  	devm_led_classdev_unregister(&acpi_dev->dev, &data->kb_led);
>  
> -	kfree(data->nfan);
> -	kfree(data->ntmp);
> -
>  	system76_get(data, "FINI");
>  
>  	return 0;
> 

