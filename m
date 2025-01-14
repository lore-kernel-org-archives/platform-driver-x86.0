Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC48822DC28
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jan 2025 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848300; cv=none; b=osqirxNUsDEQTj+k1TU4M1ke+N2w+U+dq8ysChyvORRV5lLEl4LDHS00unhPjWeGhDskxvm9TwvHBP0MoJiQBCYudzHmUMN4xTFRsJOUr2nwbS7fIBx67qkXZzV3B8/tX2CoVTlE0w6HsEMlkg3QXa4fFtcNmv2faBlGYt2ypfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848300; c=relaxed/simple;
	bh=c8kEptDqIhfctp2k0DMZHX8C3rO/3mbLZRb83EdieCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rhetLFUTAyMmbH/uHR4E9JDmPbcAvlDF2wQfQXHIwG7XCqsrFBbGz+cCwdeF81lFVmpVK+/9FDx6iqecDJtpVzjCSnxVCodDSuoUYHOUAMBVb4/O9p4D3U6bmbf0dwS3eJDsproBfcM4TLofQ6oA3SZJP3lz0kYygXrk92TB0lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IDe7Clhi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IDe7Clhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736848296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NT6ivsctiXF9EXeR/3egSHX7+nqbT7O1pDJ1XKOeB18=;
	b=IDe7ClhiJh4Tnn/sAwzOJNU5NUPE+i55p967IrbAUm+SPfi1gdeRcSEfewqNHgtwcdL7jV
	HCJeZF7wN2fcNrFEIKeuz3rYvI8JQ+HhznnNQCeSas78w6mGis7G2gc72iVf3WcdZ1MIcB
	cvKkW3KtN9evLgV/i5jrqOdoTUaVi/I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-vZfRW6X6N46Uvz9GXlA5bw-1; Tue, 14 Jan 2025 04:51:34 -0500
X-MC-Unique: vZfRW6X6N46Uvz9GXlA5bw-1
X-Mimecast-MFC-AGG-ID: vZfRW6X6N46Uvz9GXlA5bw
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa6845cf116so588037166b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jan 2025 01:51:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848293; x=1737453093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NT6ivsctiXF9EXeR/3egSHX7+nqbT7O1pDJ1XKOeB18=;
        b=kANGwwzMCSuMxo1taXIWuszwhGsR7/RUoVZhzN49MHE9Hymd6mYB5wllrmnB+PVXUY
         67HnYLBCObcmWDix4I+bYI1/EgYgzofx+goJ7dBrBStDhvF2e6TjzWWJI6sroXi+WL1P
         Iy/9na59lnQ21R0CsSonI6zYW5iUGoTYgqzDPZYa6UKTnX5257HKm4C/qW8kOmv8cHDp
         sC45SNo2m13zBb7QYeNr3Jj4HrY8ErJtao4aN4ywok14smq3qc8qil5+knqCdPNuVwT/
         oYI0lpqkctuvcl230lC7l5CkXXmSUprOY4brF0WG4h3Qzbr7iDT2766pBldNxyCB7D9D
         P8bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc7PFW+bfJh4JKO3mUV1UGqb6/i7Woyr8g21mqZSLN+oBd4MG5fwqEOAQU6kgleZ1SfCTZ+1EFdp4dRTmIkhi0FkD8@vger.kernel.org
X-Gm-Message-State: AOJu0YyPmIBKZO5ZprMnOiN8n3R2+L7DRAfhp8y5WVVu9UpV6bRQL1MW
	ZP1L6yI4EqDoR0CO3814+Vl3cNToEURDMN0iMd/n1rqSfpmTiABAMu0/kOI8YenPAjTtAMdChhm
	7dcuyASI2zcU4YPiRVMYadZH1pTWMhuDkRM1VADwyVge6W+LVMU7M+EGiIBCvw+h44UY3wFU=
X-Gm-Gg: ASbGncsPSsyx8Kia6AT/OwsG3meE5wmt4D9DrYXdt9MhQp81EHfmcEJbyO3IQh3etc/
	fX911atYoP5hV6IvlkQQv/tW/ZjivpBuqxtmmFT22kz5/pYZg9lmqcqO/IkniY5fkBOWOeTUvqJ
	xijoXTzNfN7Fch0qMG5lwb3kvvbf17TZUMDbLFE8pkBPVWfFyHC8J8BL8zq5QTHcZMaIKiBiiqn
	6Ys046RojP9+0JIyNh5kqPNcniLz+lfK+p/czgblPYTfaa/l51/rjghABJZxWWaqN2BpkHLK0xn
	VY9WxFNW/0a0qKDqj+IUskftSWgo/+6ChF+op5wzoa0kZWEWOaCPBteiqr4heZ12VL9yoM7jtcb
	ECh5HA2adb8nSMzwELPn9bdc++aJEQlw=
X-Received: by 2002:a17:907:c24c:b0:ab2:ca86:cb84 with SMTP id a640c23a62f3a-ab2ca86dd4cmr1753748466b.13.1736848292738;
        Tue, 14 Jan 2025 01:51:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgWkUe6RgwuydkmdJLP3IASo0+AcT+U5MXVaanlcibnju8QhntMJ8aAwso16rgCMt6b6hWXQ==
X-Received: by 2002:a17:907:c24c:b0:ab2:ca86:cb84 with SMTP id a640c23a62f3a-ab2ca86dd4cmr1753747466b.13.1736848292282;
        Tue, 14 Jan 2025 01:51:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b1d5esm613117066b.150.2025.01.14.01.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 01:51:31 -0800 (PST)
Message-ID: <789984c3-42c9-451e-857d-815d53dedd0b@redhat.com>
Date: Tue, 14 Jan 2025 10:51:30 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] platform/x86: lenovo-wmi-camera: Use
 SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS
To: Ai Chao <aichao@kylinos.cn>, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250114063934.3116444-1-aichao@kylinos.cn>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250114063934.3116444-1-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Jan-25 7:39 AM, Ai Chao wrote:
> Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS_ENABLE and
> KEY_CAMERA_ACESS_DISABLE. When the camera toggle switch was hit,
> the lenovo-wmi-camera driver would report an event code.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
> change for v6
> -Change mutex() to guard().

Thank you for the new version, I see that as part of this change
you have also moved the mutex out of struct lenovo_wmi_priv making
it a global variable.

Making the mutex global is not necessary for the use of guard()
and is undesirable.

Please submit a new version where the mutex is kept as part of
struct lenovo_wmi_priv.

Regards,

Hans


> change for v5
> -Add input_report_switch before input_register_device.
> change for v4
> -Add mutex_unlock and report a switch state of 0 if SW_CAMERA_ON.
> change for v3
> -Used input_register_device and input_allocate_device.
> change for v2
> -Only delays the input-device registration and switches to reporting SW_CAMERA_LENS_COVER.
> 
>  drivers/platform/x86/lenovo-wmi-camera.c | 75 +++++++++++++++---------
>  1 file changed, 46 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform/x86/lenovo-wmi-camera.c
> index 0c0bedaf7407..36835cd64758 100644
> --- a/drivers/platform/x86/lenovo-wmi-camera.c
> +++ b/drivers/platform/x86/lenovo-wmi-camera.c
> @@ -13,12 +13,15 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/wmi.h>
> +#include <linux/cleanup.h>
>  
>  #define WMI_LENOVO_CAMERABUTTON_EVENT_GUID "50C76F1F-D8E4-D895-0A3D-62F4EA400013"
>  
> +/* Lenovo WMI camera button notify lock */
> +static DEFINE_MUTEX(notify_lock);
> +
>  struct lenovo_wmi_priv {
>  	struct input_dev *idev;
> -	struct mutex notify_lock;	/* lenovo WMI camera button notify lock */
>  };
>  
>  enum {
> @@ -26,10 +29,38 @@ enum {
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
> @@ -53,22 +84,24 @@ static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
>  		return;
>  	}
>  
> -	mutex_lock(&priv->notify_lock);
> +	guard(mutex)(&notify_lock);
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
> @@ -76,23 +109,6 @@ static int lenovo_wmi_probe(struct wmi_device *wdev, const void *context)
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
> -	mutex_init(&priv->notify_lock);
> -
>  	return 0;
>  }
>  
> @@ -100,7 +116,8 @@ static void lenovo_wmi_remove(struct wmi_device *wdev)
>  {
>  	struct lenovo_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
>  
> -	mutex_destroy(&priv->notify_lock);
> +	if (priv->idev)
> +		input_unregister_device(priv->idev);
>  }
>  
>  static const struct wmi_device_id lenovo_wmi_id_table[] = {

