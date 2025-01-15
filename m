Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370BF248161
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jan 2025 09:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736933904; cv=none; b=OPOTEBjXVVv3OCL6bjhNqWVsJRl1bwuvJDsg2JbHYfmoPQe2n/rvFolkyDReLjBmHLdcSKJX+GpQ19DMMibnaF5WNHYHjw1waa7YVNut+25A10EKEhlaLppANLg0V0qt5L1JYclyLyRk+ggoXUpDzU7d4rIUK2MO15gWlUVCc7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736933904; c=relaxed/simple;
	bh=YrhTYxEq3woHVQWy0hIjQ/ZFhrayo4qzQ11Arf1LuNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tH2+R5nN6kyu6yiNnSbGT0ptcrOBAiEF4gUOLAocYxp/97zQ2Avg3YDYC9ha7vZ/lEzQFs0rLsBZDvt8ur/YtDw86STbHMNYO8DNS+HjWZ/UjIeGCMCqwp+Wi6A0GPA3TqqGEy/TTND8Ir77RRR1FhgMdQDaUMyNdVgMLWH85Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XGNPD6MY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XGNPD6MY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736933901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QR8LXBb2+udwCPfAfkDkaUZ1FE9swloBgA5WVzX8KME=;
	b=XGNPD6MYEXDwINsSHR0oRlgJUxXGLXOFbUn9qVdvnZ6TKHLb9wUo9EEYgma1V0Tj/cd0nW
	ws29bXd+Nii1x9Ob5hYLl0rGoU9W4cqWVhBlYZrNoPhd0rMdy0/pp1zZp4khIj1A2PKit6
	iuyA51uIB5wND/Du3Df7Ne4Eue+s3PM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-qiqq3_B0Ml2V8bQxC2rJRQ-1; Wed, 15 Jan 2025 04:38:19 -0500
X-MC-Unique: qiqq3_B0Ml2V8bQxC2rJRQ-1
X-Mimecast-MFC-AGG-ID: qiqq3_B0Ml2V8bQxC2rJRQ
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa6b904a886so23923066b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jan 2025 01:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736933898; x=1737538698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QR8LXBb2+udwCPfAfkDkaUZ1FE9swloBgA5WVzX8KME=;
        b=A5LWCWksOLcjJiui8GiMbMwS3e3wsn5dGSRbvY6XWd3Sij/ZTBZsIGCyOekCxfNydG
         fnLKpfN2/IQMyCFtkW6wdfNj4f+x5TkrsSNceq0HrlTDyyYgsh8IbYZZS43wRVUUhOtF
         8pPmpSGDhdmRtTgTsg7B3LTLnm181ZUvJto1bDuYEbq4aVLopgksM1FUQ2uTYL1imYF5
         xqSKJrBhD/CEf559R4Ti27REukYcd2JbrdPHukOyEM5Q1d8cc1j3YFQdMxY93brDOlgB
         UWTYpT1PWBaiEs3RO8dHeprQgPHFFggzxXmrZGIVcCG3XP2jW3joH3TS7/n4JEHv8pw3
         MPEg==
X-Forwarded-Encrypted: i=1; AJvYcCUVBIb1EAStCoZiUuz/W5gTIlvF7qOHxfN9BhKmFUpgzxf4VGoKxWbjsVFB5klAVjoDlIlDe/3vroVzM40sBvswKhAY@vger.kernel.org
X-Gm-Message-State: AOJu0YzRs6c+DoBirfqKDCfGIcVo//q31Wa4T90QrzsPUWBIHpJkNCo8
	uYKJ/XheSpbKPCmtlCvhi3EgQv/PPPQKPF26tjcuyTt2tAJ+aKKYv9QuA4BfTIArlf3m1d1Lv57
	T/VshCtcsUYn65osKU23bm48mJEa5p9gjqrc3XLR4mTZ12xg62xiN6jI+X5M4zSbRyo/iAsM=
X-Gm-Gg: ASbGncuS0qN5tADvm7wczPZuZGqMZH4vfVKgiL61+tH4lYueItQSM7c74vpGs/nz7S2
	OfoRLdk9O7eduRZmN1p9cmWftVEpD3N27YDnbRjZ+sRDl1bYI5bsQcYYFrNErjWaFUKo9Scraxj
	AnUDM9oMYX/ZpCQFi6/jX0XcpS7EakMkIWvInGtyn8amkj1DaBS6eqmFBp58j6iEXD3cyXVdDBh
	n6MVgDtSytgMZv8l9jkohMtah3MIkOdroKDoRjXFyta+8gOymQjAhzA7aA=
X-Received: by 2002:a05:6402:2690:b0:5d2:7199:ae5 with SMTP id 4fb4d7f45d1cf-5d972dfbe9amr27275668a12.5.1736933898637;
        Wed, 15 Jan 2025 01:38:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFU6yTgCQLoQ/vo13eNXKQhw+U8UJ8tvsuUT34xE96x3J6rohoain39TDwm3Q2r1vzRKf/laQ==
X-Received: by 2002:a05:6402:2690:b0:5d2:7199:ae5 with SMTP id 4fb4d7f45d1cf-5d972dfbe9amr27275649a12.5.1736933898174;
        Wed, 15 Jan 2025 01:38:18 -0800 (PST)
Received: from [10.87.0.101] ([145.15.244.217])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a4127sm7252022a12.77.2025.01.15.01.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 01:38:17 -0800 (PST)
Message-ID: <a758d764-aefb-4e19-91e8-45ac9436b742@redhat.com>
Date: Wed, 15 Jan 2025 10:38:13 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] platform/x86: lenovo-wmi-camera: Use
 SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS
To: Ai Chao <aichao@kylinos.cn>, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250115022825.101986-1-aichao@kylinos.cn>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250115022825.101986-1-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Jan-25 3:28 AM, Ai Chao wrote:
> Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS_ENABLE and
> KEY_CAMERA_ACESS_DISABLE. When the camera toggle switch was hit,
> the lenovo-wmi-camera driver would report an event code.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
> change for v7
> -Move notify_lock into lenovo_wmi_priv struct.

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> change for v6
> -Change mutex() to guard().
> change for v5
> -Add input_report_switch before input_register_device.
> change for v4
> -Add mutex_unlock and report a switch state of 0 if SW_CAMERA_ON.
> change for v3
> -Used input_register_device and input_allocate_device.
> change for v2
> -Only delays the input-device registration and switches to reporting SW_CAMERA_LENS_COVER.
> 
>  drivers/platform/x86/lenovo-wmi-camera.c | 69 +++++++++++++++---------
>  1 file changed, 44 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform/x86/lenovo-wmi-camera.c
> index 0c0bedaf7407..eb60fb9a5b3f 100644
> --- a/drivers/platform/x86/lenovo-wmi-camera.c
> +++ b/drivers/platform/x86/lenovo-wmi-camera.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/wmi.h>
> +#include <linux/cleanup.h>
>  
>  #define WMI_LENOVO_CAMERABUTTON_EVENT_GUID "50C76F1F-D8E4-D895-0A3D-62F4EA400013"
>  
> @@ -26,10 +27,38 @@ enum {
>  	SW_CAMERA_ON	= 1,
>  };
>  
> +static int camera_shutter_input_setup(struct wmi_device *wdev, u8 camera_mode)
> +{
> +	struct lenovo_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
> +	int err;
> +
> +	priv->idev = input_allocate_device();
> +	if (!priv->idev)
> +		return -ENOMEM;
> +
> +	priv->idev->name = "Lenovo WMI Camera Button";
> +	priv->idev->phys = "wmi/input0";
> +	priv->idev->id.bustype = BUS_HOST;
> +	priv->idev->dev.parent = &wdev->dev;
> +
> +	input_set_capability(priv->idev, EV_SW, SW_CAMERA_LENS_COVER);
> +
> +	input_report_switch(priv->idev, SW_CAMERA_LENS_COVER,
> +			    camera_mode == SW_CAMERA_ON ? 0 : 1);
> +	input_sync(priv->idev);
> +
> +	err = input_register_device(priv->idev);
> +	if (err) {
> +		input_free_device(priv->idev);
> +		priv->idev = NULL;
> +	}
> +
> +	return err;
> +}
> +
>  static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
>  {
>  	struct lenovo_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
> -	unsigned int keycode;
>  	u8 camera_mode;
>  
>  	if (obj->type != ACPI_TYPE_BUFFER) {
> @@ -53,22 +82,24 @@ static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
>  		return;
>  	}
>  
> -	mutex_lock(&priv->notify_lock);
> +	guard(mutex)(&priv->notify_lock);
>  
> -	keycode = camera_mode == SW_CAMERA_ON ?
> -		   KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE;
> -	input_report_key(priv->idev, keycode, 1);
> -	input_sync(priv->idev);
> -	input_report_key(priv->idev, keycode, 0);
> -	input_sync(priv->idev);
> +	if (!priv->idev) {
> +		if (camera_shutter_input_setup(wdev, camera_mode))
> +			dev_warn(&wdev->dev, "Failed to register input device\n");
> +		return;
> +	}
>  
> -	mutex_unlock(&priv->notify_lock);
> +	if (camera_mode == SW_CAMERA_ON)
> +		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 0);
> +	else
> +		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 1);
> +	input_sync(priv->idev);
>  }
>  
>  static int lenovo_wmi_probe(struct wmi_device *wdev, const void *context)
>  {
>  	struct lenovo_wmi_priv *priv;
> -	int ret;
>  
>  	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -76,21 +107,6 @@ static int lenovo_wmi_probe(struct wmi_device *wdev, const void *context)
>  
>  	dev_set_drvdata(&wdev->dev, priv);
>  
> -	priv->idev = devm_input_allocate_device(&wdev->dev);
> -	if (!priv->idev)
> -		return -ENOMEM;
> -
> -	priv->idev->name = "Lenovo WMI Camera Button";
> -	priv->idev->phys = "wmi/input0";
> -	priv->idev->id.bustype = BUS_HOST;
> -	priv->idev->dev.parent = &wdev->dev;
> -	input_set_capability(priv->idev, EV_KEY, KEY_CAMERA_ACCESS_ENABLE);
> -	input_set_capability(priv->idev, EV_KEY, KEY_CAMERA_ACCESS_DISABLE);
> -
> -	ret = input_register_device(priv->idev);
> -	if (ret)
> -		return ret;
> -
>  	mutex_init(&priv->notify_lock);
>  
>  	return 0;
> @@ -100,6 +116,9 @@ static void lenovo_wmi_remove(struct wmi_device *wdev)
>  {
>  	struct lenovo_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
>  
> +	if (priv->idev)
> +		input_unregister_device(priv->idev);
> +
>  	mutex_destroy(&priv->notify_lock);
>  }
>  

