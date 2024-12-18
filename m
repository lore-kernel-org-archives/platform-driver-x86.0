Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2668A27726
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Dec 2024 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734519698; cv=none; b=HcF5LNlPQWkBDF27P9hEE8/PQxB2NP4poGqtJqaggle1rN5R4QzB5ncgFNTe87L5iGJlHOZMzp5XebjHMgyd9uDvMcXp32N/VgmUhtvvoQcel7xkSsf0T/WPMJ6xi+7VYxgr2JixSBwz3uBVgQW6BPcvSwRw4MkoplX1jOAkAUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734519698; c=relaxed/simple;
	bh=lQMAVmwB6rK5eM5mdEh9sK6BhS9Iiruyo6SI7kwC02I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Tny4Nw14nIgtpO5ilm/3VrMEtF4vbQGictubT5HJ7CUSgSGyNZrs+r4YC1te4vqvcjZb+5SxIwbAeAU1+L0EYJualQ98lFdJ1C7+RnxeC8Byd4SOQ3IYX66asDZYfqOG8WxSex1/Ms5JbdN8TZoe5+5P5kAFh+T0Nn9d/tngMfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FskPRKiB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FskPRKiB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734519694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lk0WEf9YqL9xVW3XyRoFYPquJnNn31b2XXGJBKhn6AQ=;
	b=FskPRKiBRs7mCpsnO6wH5tZw1o5jFfH0vIlam/ZyhL0MRGUrJ5ztvB6y06GERwlhN9tFgH
	YNoxTxzx9Napc0RtT8M2lbFQ6Biz/Kk358bodbAU+D2r3nkRhA2MDzNdwo5To95/J+dkzD
	iBUYecYCqZLJegtcR9qQO1czQWQnLew=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-kpCf8sXFMemIupmTeiTCzQ-1; Wed, 18 Dec 2024 06:01:33 -0500
X-MC-Unique: kpCf8sXFMemIupmTeiTCzQ-1
X-Mimecast-MFC-AGG-ID: kpCf8sXFMemIupmTeiTCzQ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385d80576abso4348410f8f.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Dec 2024 03:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734519690; x=1735124490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lk0WEf9YqL9xVW3XyRoFYPquJnNn31b2XXGJBKhn6AQ=;
        b=QCPgiO9o8uYF4+6o3ZWV2ghKst5KBS0HfhcE9y5gpoRgU/2OvoABMJitiJ5PIxmbLr
         SrKIB8a/1exUr5gRpB3XYo/rA6l8AIyjnbZtW5hhYfLqGzLj+0BKOXFychN8Rlc8RKpd
         F03qy2ZRIOVs+PaVzzkb+CcqdT+t9UAw8RoMuBLNlw4FWiHe1ur44T02EeO4ksRnjtSe
         cfq48uz+nfTNZXKwwvXmMJR7+dRabcVzzJtLQxFZ0MVzf1IKZwebSudTS1uhNh7ofHT3
         3ae8bcSjJhzvsRMEeUJcCXnZWyd5lL1bJdrqzeooz3EThhhi66iE6PWPQLX9NGXvHDLP
         AF5g==
X-Forwarded-Encrypted: i=1; AJvYcCXXxjfRN3jLq0FagBXEj2DD1pgK4p+a4xwziug3ExtJ0diEN2VK6/WO1kwbPKsdUCsAXgRJuIvqvBfY/oIuRUROewQS@vger.kernel.org
X-Gm-Message-State: AOJu0YxDiN7zX4H8l3/1WVYsrrJ0F2V2ewiN3Zh83i3rbXFysThRmHLw
	0xN9j8KnsCPdv9DRlPgZQDG5EiJz8p8ohuGl/7HlNLscus5VqoDmY4V4PFMbwDOzl573+vgBRc/
	o+vsd5H0LFMBsDUtY7tJdOUnpo1ou28wZ5IgeV3NgvMrs4aeXVWm096qWWIzAuFf0cywQ+6VrrG
	jmY5FWezfj
X-Gm-Gg: ASbGncsLY7OXOLoKilWLLopftJgUbVqI3cdRlB7Cql9E3hHgHLDLSFoEkWtRM8ju5Oe
	Ymk4D6udMdEy60SOeTfxco34vYuR4aX/ED9kQws4L43UPJM3Bc+1JjzI1aFgfbcBKtIDbpSsOwA
	uK0s3DH8R1CY74KerhfBC6/qpEEhmcz+Vtl7Pz/+/3HrRqQ6V7kaY4SOdkqEVOm4n+NBrnYNCg/
	7v9TYVH/DiHg61sOHyuonRh+rtNihv1hnNfVzGowf2wJUfD3o5KwTh/WnpoGIBF2iV0JWI3MoNd
	+8SiGr4fywAPei6Zt1sZZHCvgZYR5z36QOITPzf1csh7Yv0B/1N67OMMTkwt8sIS5mKPDsEk666
	/a7yQcKIa4MzbPugI6+Ql5A0NM+2Rums=
X-Received: by 2002:a5d:584b:0:b0:382:4b9a:f51f with SMTP id ffacd0b85a97d-388e4db6161mr1874159f8f.47.1734519690367;
        Wed, 18 Dec 2024 03:01:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLwjttjP3bqXCqa1CJQSuBoFHnhe1hWaMPkD9oECBm/y9fK+ZvH6ZL9XDdF/xavxHb7QpdZg==
X-Received: by 2002:a5d:584b:0:b0:382:4b9a:f51f with SMTP id ffacd0b85a97d-388e4db6161mr1874119f8f.47.1734519689879;
        Wed, 18 Dec 2024 03:01:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aabcce1097bsm284563766b.129.2024.12.18.03.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 03:01:29 -0800 (PST)
Message-ID: <f9cd4fb3-520c-4229-a5a1-96d0221f4924@redhat.com>
Date: Wed, 18 Dec 2024 12:01:28 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86:lenovo-wmi-camera: Use SW_CAMERA_LENS_COVER
 instead of KEY_CAMERA_ACESS
To: Ai Chao <aichao@kylinos.cn>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241218060341.2496642-1-aichao@kylinos.cn>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241218060341.2496642-1-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ai,

On 18-Dec-24 7:03 AM, Ai Chao wrote:
> Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS_ENABLE and
> KEY_CAMERA_ACESS_DISABLE. When the camera toggle switch was hit,
> the lenovo-wmi-camera driver would report an event code.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

Thank you for your patch, but this patch does a lot more then
just switching to instantiating the input device on the first
event and reporting SW_CAMERA_LENS_COVER.

You are also switching away from using the new WMI bus /
wmi_driver model to using the old deprecated please WMI
functions.

Please post a new version which keeps the wmi_driver and
only delays the input-device registration and switches
to reporting SW_CAMERA_LENS_COVER.

Regards,

Hans



> ---
>  drivers/platform/x86/lenovo-wmi-camera.c | 139 +++++++++++------------
>  1 file changed, 66 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform/x86/lenovo-wmi-camera.c
> index 0c0bedaf7407..fc9efd5beda8 100644
> --- a/drivers/platform/x86/lenovo-wmi-camera.c
> +++ b/drivers/platform/x86/lenovo-wmi-camera.c
> @@ -16,29 +16,52 @@
>  
>  #define WMI_LENOVO_CAMERABUTTON_EVENT_GUID "50C76F1F-D8E4-D895-0A3D-62F4EA400013"
>  
> -struct lenovo_wmi_priv {
> -	struct input_dev *idev;
> -	struct mutex notify_lock;	/* lenovo WMI camera button notify lock */
> -};
> +static struct input_dev *camera_shutter_input_dev;
> +static struct mutex notify_lock; /* lenovo WMI camera button notify lock */
>  
>  enum {
>  	SW_CAMERA_OFF	= 0,
>  	SW_CAMERA_ON	= 1,
>  };
>  
> -static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
> +static int camera_shutter_input_setup(void)
> +{
> +	int err;
> +
> +	camera_shutter_input_dev = input_allocate_device();
> +	if (!camera_shutter_input_dev)
> +		return -ENOMEM;
> +
> +	camera_shutter_input_dev->name = "Lenovo WMI Camera Button";
> +	camera_shutter_input_dev->phys = "wmi/input0";
> +	camera_shutter_input_dev->id.bustype = BUS_HOST;
> +
> +	__set_bit(EV_SW, camera_shutter_input_dev->evbit);
> +	__set_bit(SW_CAMERA_LENS_COVER, camera_shutter_input_dev->swbit);
> +
> +	err = input_register_device(camera_shutter_input_dev);
> +	if (err) {
> +		input_free_device(camera_shutter_input_dev);
> +		camera_shutter_input_dev = NULL;
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void lenovo_wmi_notify(union acpi_object *obj, void *context)
>  {
> -	struct lenovo_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
> -	unsigned int keycode;
> -	u8 camera_mode;
> +	u32 event_data;
>  
> +	if (!obj)
> +		return;
>  	if (obj->type != ACPI_TYPE_BUFFER) {
> -		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);
> +		pr_info("Unknown response received %d\n", obj->type);
>  		return;
>  	}
>  
>  	if (obj->buffer.length != 1) {
> -		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length);
> +		pr_info("Invalid buffer length %u\n", obj->buffer.length);
>  		return;
>  	}
>  
> @@ -47,80 +70,50 @@ static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
>  	 *      0 camera close
>  	 *      1 camera open
>  	 */
> -	camera_mode = obj->buffer.pointer[0];
> -	if (camera_mode > SW_CAMERA_ON) {
> -		dev_err(&wdev->dev, "Unknown camera mode %u\n", camera_mode);
> -		return;
> -	}
> -
> -	mutex_lock(&priv->notify_lock);
> -
> -	keycode = camera_mode == SW_CAMERA_ON ?
> -		   KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE;
> -	input_report_key(priv->idev, keycode, 1);
> -	input_sync(priv->idev);
> -	input_report_key(priv->idev, keycode, 0);
> -	input_sync(priv->idev);
> -
> -	mutex_unlock(&priv->notify_lock);
> +	event_data = obj->buffer.pointer[0];
> +
> +	mutex_lock(&notify_lock);
> +	if (!camera_shutter_input_dev)
> +		if (camera_shutter_input_setup()) {
> +			pr_err("Failed to setup camera shutter input device\n");
> +			mutex_unlock(&notify_lock);
> +			return;
> +		}
> +
> +	if (event_data == SW_CAMERA_ON)
> +		input_report_switch(camera_shutter_input_dev, SW_CAMERA_LENS_COVER, 1);
> +	else if (event_data == SW_CAMERA_OFF)
> +		input_report_switch(camera_shutter_input_dev, SW_CAMERA_LENS_COVER, 0);
> +	else
> +		pr_info("Unknown camera shutter state - 0x%x\n", event_data);
> +	input_sync(camera_shutter_input_dev);
> +
> +	mutex_unlock(&notify_lock);
>  }
>  
> -static int lenovo_wmi_probe(struct wmi_device *wdev, const void *context)
> +static __init int lenovo_wmi_init(void)
>  {
> -	struct lenovo_wmi_priv *priv;
> -	int ret;
> -
> -	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> -
> -	dev_set_drvdata(&wdev->dev, priv);
> +	int event_capable = wmi_has_guid(WMI_LENOVO_CAMERABUTTON_EVENT_GUID);
> +	acpi_status status;
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
> +	if (!event_capable)
> +		return -ENODEV;
>  
> -	ret = input_register_device(priv->idev);
> -	if (ret)
> -		return ret;
> -
> -	mutex_init(&priv->notify_lock);
> +	status = wmi_install_notify_handler(WMI_LENOVO_CAMERABUTTON_EVENT_GUID,
> +					    lenovo_wmi_notify, NULL);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
>  
>  	return 0;
>  }
> +module_init(lenovo_wmi_init);
>  
> -static void lenovo_wmi_remove(struct wmi_device *wdev)
> +static __exit void lenovo_wmi_exit(void)
>  {
> -	struct lenovo_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
> -
> -	mutex_destroy(&priv->notify_lock);
> +	if (camera_shutter_input_dev)
> +		input_unregister_device(camera_shutter_input_dev);
>  }
> -
> -static const struct wmi_device_id lenovo_wmi_id_table[] = {
> -	{ .guid_string = WMI_LENOVO_CAMERABUTTON_EVENT_GUID },
> -	{  }
> -};
> -MODULE_DEVICE_TABLE(wmi, lenovo_wmi_id_table);
> -
> -static struct wmi_driver lenovo_wmi_driver = {
> -	.driver = {
> -		.name = "lenovo-wmi-camera",
> -		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> -	},
> -	.id_table = lenovo_wmi_id_table,
> -	.no_singleton = true,
> -	.probe = lenovo_wmi_probe,
> -	.notify = lenovo_wmi_notify,
> -	.remove = lenovo_wmi_remove,
> -};
> -module_wmi_driver(lenovo_wmi_driver);
> +module_exit(lenovo_wmi_exit);
>  
>  MODULE_AUTHOR("Ai Chao <aichao@kylinos.cn>");
>  MODULE_DESCRIPTION("Lenovo WMI Camera Button Driver");

