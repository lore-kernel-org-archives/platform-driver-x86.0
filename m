Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4171DA100
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jan 2025 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736160475; cv=none; b=IyZ0SgUe8RqRVX3hbHQmlRyPrf60lMEjSm4mtJc4NND9AkrkCTsO0eabyUamF83710c/GRCcWZWQlwuf4jz+XtTlwMY5WaI8dU8WAUemsvAdiJWcbHrequ3hUH42s6rqsgnBdN9YqvkqrUvzk3sDnVXd/EZdyRYxh202FZ5Sy8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736160475; c=relaxed/simple;
	bh=Wky9+XUdARAMbjh8ONUbF5pCfdL4gfA5dGX7vwaaW74=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UHvJz8YaxXvP/0KkHRsP+yZV56W9MeXWVERnj4JHoy6MPAfSnTtHTo2L9YNHCq26777VdjJJtLE4GYUudzenANLbnUdQQblrLvKjdINuU+woSoEfLQBwzfvG5/mSBFDf7X6HDNeIxXutQX/fw3f+cUZehgQj7KXohUVZpNB6XN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MaU2VVS7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MaU2VVS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736160472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htdVuyNJm1X6JysjMBjvXPql+8ZoPAOHWh4gNUaKIDg=;
	b=MaU2VVS7hfjsj1b/I0IKgQpkzkADG09FcbADOP5RreNIqON1jOhjgTAH4UoLeZpJJjIvP6
	rFdTEiDstk0lYkZBWvdLUPyI4LtdNXOULVutxr+sd0akmWuMdX1NehVSWjmlcnR5TIngZQ
	APVeMES5Hb5hVlR8rbSVRVxmcGa1vWo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-w7CRgEGsOPakdJgp4ps_Og-1; Mon, 06 Jan 2025 05:47:51 -0500
X-MC-Unique: w7CRgEGsOPakdJgp4ps_Og-1
X-Mimecast-MFC-AGG-ID: w7CRgEGsOPakdJgp4ps_Og
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa6704ffcaeso397553266b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jan 2025 02:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736160469; x=1736765269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=htdVuyNJm1X6JysjMBjvXPql+8ZoPAOHWh4gNUaKIDg=;
        b=UDDu9d7cTNojXppF97btpUV/6V9ngirjYUKKhJ2x8f2AAl2IkNYPBuIwopc79ltZif
         /eDksGC9dNcgAtZRVAuXAT8EDmAA2ScvdD6826N3Pge4QsZ846dOsMiE+FfRWZuyFE9n
         g/a2CI3B80B8hg6j7sABRataKORIuEkcVD/gK/mKIc+vXSOO8WkG7VnHC+YwKBK+Fz7k
         QibeZWuXGDiGhYKo5D75Ve+5Z4glpx5BZMHOYbdf3qM6VMqDOK2XqQ1EviCtTjR1vVbX
         5r4Y/lf3iLEa6WsQvOs4MiGAy8g1e4G3MD/BGkzt4KUqCqhVOg1JaoZm/2BeiV4prjjR
         u3qg==
X-Forwarded-Encrypted: i=1; AJvYcCW1tkIVUPalWm3oQsFV2lGHiUrxAf+nC7Q7uacdvNsEkCpROs+iCIvt0//0w0L5zWPjlYusZCQpA9zu3ap6TAzaN9u4@vger.kernel.org
X-Gm-Message-State: AOJu0YwzhmASEOLE/wC0AIvXvh8UfYm8geyxgVot6APYZZ+Skl/44VAP
	WgdQCULyQbb9tNlqUnaEtBVY7Pc7yTNvTnQCzbnNAs/dx9Zlf7dJNBgG4dt5a58tLdpv0e9W1ov
	4+HLT9SpHZNmfGihqcobJPiF2OeOunu43h07lq7biezTNCAo7q49+h2esjaUjWh3zctxD0s8B+8
	HNFrodww==
X-Gm-Gg: ASbGnctqg3lu3IbRHmVt8zEIQBJnt1mEO+4wy+UQMMQSAfZ67JcQ10G1EjG+WTojg9I
	KGKsm31zR8GYnn4JZ9dcVqN3JzNQom5SypLmNxErg5FTapMM3urFttFXBufXQ60vMzRcEfN1aEo
	jpNdi1w+5iVzhpAnp0TfGAIVHRT0/phl6m1qIIoYV+gIgUJWj8W4444DHQRtAEOD3h37lZWUryJ
	BlO3+mK5DDhZgLQtR0qzMNEWv4hLrERp1jP35o2jq+OrMJTLP3RpFKNcBIi
X-Received: by 2002:a17:907:9722:b0:aa6:668b:2733 with SMTP id a640c23a62f3a-aac2cc722acmr5736817366b.33.1736160469543;
        Mon, 06 Jan 2025 02:47:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5OcAwk135evknQckwdyRKPq0l7QNHFXu4Dn43DuSttcHm8a75xgip8A7lrnKyZ5X1njC1yQ==
X-Received: by 2002:a17:907:9722:b0:aa6:668b:2733 with SMTP id a640c23a62f3a-aac2cc722acmr5736814566b.33.1736160469068;
        Mon, 06 Jan 2025 02:47:49 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f90esm2226471966b.4.2025.01.06.02.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 02:47:48 -0800 (PST)
Message-ID: <ffb876f9-ddee-49f8-8a9a-2f2fba6005ad@redhat.com>
Date: Mon, 6 Jan 2025 11:47:47 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] platform/x86: lenovo-wmi-camera: Use
 SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS
To: Ai Chao <aichao@kylinos.cn>, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250101102922.1784551-1-aichao@kylinos.cn>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250101102922.1784551-1-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1-Jan-25 11:29 AM, Ai Chao wrote:
> Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS_ENABLE and
> KEY_CAMERA_ACESS_DISABLE. When the camera toggle switch was hit,
> the lenovo-wmi-camera driver would report an event code.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
> change for v5
> -Add input_report_switch before input_register_device.
> change for v4
> -Add mutex_unlock and report a switch state of 0 if SW_CAMERA_ON.
> change for v3
> -Used input_register_device and input_allocate_device.
> change for v2
> -Only delays the input-device registration and switches to reporting SW_CAMERA_LENS_COVER.

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





> 
>  drivers/platform/x86/lenovo-wmi-camera.c | 67 ++++++++++++++++--------
>  1 file changed, 44 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform/x86/lenovo-wmi-camera.c
> index 0c0bedaf7407..ceed441a0161 100644
> --- a/drivers/platform/x86/lenovo-wmi-camera.c
> +++ b/drivers/platform/x86/lenovo-wmi-camera.c
> @@ -26,10 +26,38 @@ enum {
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
> @@ -55,11 +83,18 @@ static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
>  
>  	mutex_lock(&priv->notify_lock);
>  
> -	keycode = camera_mode == SW_CAMERA_ON ?
> -		   KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE;
> -	input_report_key(priv->idev, keycode, 1);
> -	input_sync(priv->idev);
> -	input_report_key(priv->idev, keycode, 0);
> +	if (!priv->idev) {
> +		if (camera_shutter_input_setup(wdev, camera_mode))
> +			dev_warn(&wdev->dev, "Failed to register input device\n");
> +
> +		mutex_unlock(&priv->notify_lock);
> +		return;
> +	}
> +
> +	if (camera_mode == SW_CAMERA_ON)
> +		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 0);
> +	else
> +		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 1);
>  	input_sync(priv->idev);
>  
>  	mutex_unlock(&priv->notify_lock);
> @@ -68,29 +103,12 @@ static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
>  static int lenovo_wmi_probe(struct wmi_device *wdev, const void *context)
>  {
>  	struct lenovo_wmi_priv *priv;
> -	int ret;
>  
>  	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  
>  	dev_set_drvdata(&wdev->dev, priv);
> -
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
> @@ -100,6 +118,9 @@ static void lenovo_wmi_remove(struct wmi_device *wdev)
>  {
>  	struct lenovo_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
>  
> +	if (priv->idev)
> +		input_unregister_device(priv->idev);
> +
>  	mutex_destroy(&priv->notify_lock);
>  }
>  

