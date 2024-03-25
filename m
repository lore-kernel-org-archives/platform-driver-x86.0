Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33FA83A10
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 15:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711378931; cv=none; b=ok8mKrY5JddPudSKn3x/mU25dOs6F9M0aSPLyxHOK5fNIM4Aro8QQel9APpo43Slundn+B051CKY8ACNf/Wo42P1/blKgQ6t9JMA30HWTZCBmMal2Y41Qx0CREMSnCrO8XtU+3lHv38W0UXGm3LLHJ0v1qYkZ14Iv0mZUxHzqZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711378931; c=relaxed/simple;
	bh=ULZIDNEPoLT4enZWYfUF9Cc6rxjknKhOq3ptWq3zBHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Oli6B8V4C69Y+ayFxltGlUZXl/0WR0AgYCuT5jCoTOrxUcgqecDjNENix4KBSX5fqndObl7jSix9+P6yq1CTNi/AMx3FGiTP5vWeAhNO2rVa1U1fI/zYv7M+4+GqyVIyKueSBSoLU5NP0RHb7vVlqDxyJMXA68buWRZj5/3QXmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bVGBceDg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bVGBceDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711378929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T0DO+AvzBOw0UZsidcFTpY9qhmesJwSzCERmqKN8o4U=;
	b=bVGBceDg9q3oRaxEOQrdY5+KXl704b7F4/BBwrZaGDabOwRQYnnTSKo7HbmQ6BMaB5yd7f
	M6D5DA4UPTntkqrfmTC5PXvEm9Yr1BIEyq0mAsy/ZMsQdutBhhg5S0zdgk0bfv7f5ypao8
	TURTVQUDw0326Hi9QSaRvCahu1OpM8A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-PQzfDxsXNs6dcNDLQQBz_g-1; Mon, 25 Mar 2024 11:01:57 -0400
X-MC-Unique: PQzfDxsXNs6dcNDLQQBz_g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a462e4d8c44so199180966b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 08:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711378916; x=1711983716;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0DO+AvzBOw0UZsidcFTpY9qhmesJwSzCERmqKN8o4U=;
        b=JpO5sgMBuOYwJFArK/PeD+yVUknAc1M38nG933sxA0LRgON6qZDNzDhY66ZahYRhta
         f4PV9dHH6QEdd0nwBAauTxS4BSLJ+yyeZTGa8YzWYRNqg3CCMt+gUvPpHxmPFHMVOsbY
         zhXg8jInXoAdeElJwIhuMn+8/NNe50Qv1aok5v1yQ2rIMf0s6Ks4MRY+b0Df29g/Zzki
         4iwBvUHj6Xba6hgPiv6KDt/nViEkov0Z9U9TNd24wTUXGBf2+OCYswXj0rJKvzeJs1m0
         h6zx4BQHy1GWJoXq1jKZsN+b75iKyxHrDgBsfbVCY3dYIVReO6GH90F9QOm/REUCx/1u
         esVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqmawCu0wWztQO3OxP9Sx/CIKGE6VJgp36HXpACba8jhqGHE9lj4WkguZL4VZ4Pr+0ylxvPzgC62Alns6UV31TrR2V6owds2thxVJ+WZZ2QkL4qw==
X-Gm-Message-State: AOJu0YyUxsgzu1cashmgIjOd92qXE0WZkJObpJLaDXKOpI4xv/901O+E
	3wUqkAPmZRatTxtEIDoj+WQlolEiKdfLnrl+v/L7pHsQBnpiFG7ZX4AZwYwZlPdZ1fuLXnR7S/b
	vZqg4EcNATLEYTb0v4wFtaM+VN5gBbrqzkBViQ6I0TUNQox+hXiGYhF4ubJhssjho43JAJvY=
X-Received: by 2002:a17:906:2b15:b0:a4d:d87b:e04e with SMTP id a21-20020a1709062b1500b00a4dd87be04emr151549ejg.56.1711378916142;
        Mon, 25 Mar 2024 08:01:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr+TpFdHXbyMaCzEUDvbwazZutA7dobYWqACa2oyb0W/pIDAi0SCAChHJHBc13QZ/24JKcMg==
X-Received: by 2002:a17:906:2b15:b0:a4d:d87b:e04e with SMTP id a21-20020a1709062b1500b00a4dd87be04emr151512ejg.56.1711378915605;
        Mon, 25 Mar 2024 08:01:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090671c800b00a46d4e26301sm3117038ejk.27.2024.03.25.08.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 08:01:55 -0700 (PDT)
Message-ID: <8309ebea-69f4-400a-910a-2f1f8838c785@redhat.com>
Date: Mon, 25 Mar 2024 16:01:54 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] platform/x86: add lenovo wmi camera button driver
Content-Language: en-US, nl
To: Ai Chao <aichao@kylinos.cn>, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20240322064750.267422-1-aichao@kylinos.cn>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240322064750.267422-1-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/22/24 7:47 AM, Ai Chao wrote:
> Add lenovo generic wmi driver to support camera button.
> The Camera button is a GPIO device. This driver receives ACPI notifyi
> when the camera button is switched on/off. This driver is used in
> Lenovo A70, it is a Computer integrated machine.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
> v11: remove input_unregister_device.
> v10: Add lenovo_wmi_remove and mutex_destroy.
> v9: Add mutex for wmi notify.
> v8: Dev_deb convert to dev_err.
> v7: Add dev_dbg and remove unused dev in struct.
> v6: Modify SW_CAMERA_LENS_COVER to KEY_CAMERA_ACCESS_ENABLE/KEY_CAMERA_ACCESS_DISABLE.
> v5: Remove camera button groups, modify KEY_CAMERA to SW_CAMERA_LENS_COVER.
> v4: Remove lenovo_wmi_input_setup, move camera_mode into struct lenovo_wmi_priv.
> v3: Remove lenovo_wmi_remove function.
> v2: Adjust GPL v2 to GPL, adjust sprintf to sysfs_emit.
> 
>  drivers/platform/x86/Kconfig             |  12 +++
>  drivers/platform/x86/Makefile            |   1 +
>  drivers/platform/x86/lenovo-wmi-camera.c | 126 +++++++++++++++++++++++
>  3 files changed, 139 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-wmi-camera.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index bdd302274b9a..9506a455b547 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1001,6 +1001,18 @@ config INSPUR_PLATFORM_PROFILE
>  	To compile this driver as a module, choose M here: the module
>  	will be called inspur-platform-profile.
>  
> +config LENOVO_WMI_CAMERA
> +	tristate "Lenovo WMI Camera Button driver"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	help
> +	  This driver provides support for Lenovo camera button. The Camera
> +	  button is a GPIO device. This driver receives ACPI notify when the
> +	  camera button is switched on/off.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called lenovo-wmi-camera.
> +
>  source "drivers/platform/x86/x86-android-tablets/Kconfig"
>  
>  config FW_ATTR_CLASS
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 1de432e8861e..217e94d7c877 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -66,6 +66,7 @@ obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
>  obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
>  obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>  obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
> +obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
>  
>  # Intel
>  obj-y				+= intel/
> diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform/x86/lenovo-wmi-camera.c
> new file mode 100644
> index 000000000000..fda936e2f37c
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-camera.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Lenovo WMI Camera Button Driver
> + *
> + * Author: Ai Chao <aichao@kylinos.cn>
> + * Copyright (C) 2024 KylinSoft Corporation.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/wmi.h>
> +
> +#define WMI_LENOVO_CAMERABUTTON_EVENT_GUID "50C76F1F-D8E4-D895-0A3D-62F4EA400013"
> +
> +struct lenovo_wmi_priv {
> +	struct input_dev *idev;
> +	struct mutex notify_lock;	/* lenovo wmi camera button notify lock */
> +};
> +
> +enum {
> +	SW_CAMERA_OFF	= 0,
> +	SW_CAMERA_ON	= 1,
> +};
> +
> +static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
> +{
> +	struct lenovo_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
> +	unsigned int keycode;
> +	u8 camera_mode;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);
> +		return;
> +	}
> +
> +	if (obj->buffer.length != 1) {
> +		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length);
> +		return;
> +	}
> +
> +	/* obj->buffer.pointer[0] is camera mode:
> +	 *      0 camera close
> +	 *      1 camera open
> +	 */
> +	camera_mode = obj->buffer.pointer[0];
> +	if (camera_mode > SW_CAMERA_ON) {
> +		dev_err(&wdev->dev, "Unknown camera mode %u\n", camera_mode);
> +		return;
> +	}
> +
> +	mutex_lock(&priv->notify_lock);
> +
> +	keycode = (camera_mode == SW_CAMERA_ON ?
> +		   KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE);
> +	input_report_key(priv->idev, keycode, 1);
> +	input_sync(priv->idev);
> +	input_report_key(priv->idev, keycode, 0);
> +	input_sync(priv->idev);
> +
> +	mutex_unlock(&priv->notify_lock);
> +}
> +
> +static int lenovo_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct lenovo_wmi_priv *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	priv->idev = devm_input_allocate_device(&wdev->dev);
> +	if (!priv->idev)
> +		return -ENOMEM;
> +
> +	priv->idev->name = "Lenovo WMI Camera Button";
> +	priv->idev->phys = "wmi/input0";
> +	priv->idev->id.bustype = BUS_HOST;
> +	priv->idev->dev.parent = &wdev->dev;
> +	input_set_capability(priv->idev, EV_KEY, KEY_CAMERA_ACCESS_ENABLE);
> +	input_set_capability(priv->idev, EV_KEY, KEY_CAMERA_ACCESS_DISABLE);
> +
> +	ret = input_register_device(priv->idev);
> +	if (ret)
> +		return ret;
> +
> +	mutex_init(&priv->notify_lock);
> +
> +	return 0;
> +}
> +
> +static void lenovo_wmi_remove(struct wmi_device *wdev)
> +{
> +	struct lenovo_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
> +
> +	mutex_destroy(&priv->notify_lock);
> +}
> +
> +static const struct wmi_device_id lenovo_wmi_id_table[] = {
> +	{ .guid_string = WMI_LENOVO_CAMERABUTTON_EVENT_GUID },
> +	{  }
> +};
> +
> +static struct wmi_driver lenovo_wmi_driver = {
> +	.driver = {
> +		.name = "lenovo-wmi-camera",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table = lenovo_wmi_id_table,
> +	.no_singleton = true,
> +	.probe = lenovo_wmi_probe,
> +	.notify = lenovo_wmi_notify,
> +	.remove = lenovo_wmi_remove,
> +};
> +
> +module_wmi_driver(lenovo_wmi_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_id_table);
> +MODULE_AUTHOR("Ai Chao <aichao@kylinos.cn>");
> +MODULE_DESCRIPTION("Lenovo WMI Camera Button Driver");
> +MODULE_LICENSE("GPL");

