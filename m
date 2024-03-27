Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3231D4F208
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 20:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569624; cv=none; b=TzcdUY1mVVvtlfb0DDmRam4/5LQZtDEEqgDrQSwkJMPsEmrCkXVbbB/GACBd5lkXCSTasxLlQ590ra1FVT74EZL/WikAnbEcw2WeMTHNScUSsuIAQ8ZpiDc5WUulnDcjYMARz4yk5czALvEG8Mx0ItTRzl+wTZ9ou67k5B89hXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569624; c=relaxed/simple;
	bh=o8khsrSKiPwxkdeuSPwY98AOiejaFKf3hJUcmQsJU1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Qssdq0b2r62ozVqFjYt105C0rxnILnS6o+vEIq8Wjl4Z+0Y4MXvG/ihAt2G1SNgsPDui96LvylJCvi4L3PoTi06w1+I8qiCVQqdpWGGb2eZa4ejY1a+t4+CseeYWKhFZrMSI4ORFTvlUQBqZ2ibw3+w8PWgNgs7nCsobMUVoi2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ti4vKqB0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ti4vKqB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711569621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jg5+/giTEtOl/lQX11+0TrhWUmZtMrysiBpPClfvB1s=;
	b=Ti4vKqB0MpY4g1BF2TXQk8H6cj+dIKGXvw8sGngXwVu/fSc1LcRSVyLQTOjEz+cRQ+tkDZ
	SWE91F5S86rdMPALnvOPt+XFBX300FnqM3SF9t3OkUD7XcHPY3bLxYfZnwnUqBcBOynJhI
	IfASLNpIADi/4AGNOjt+rcx/eNsrV7I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-pZxiNCBrPle2BalkSm5j_Q-1; Wed, 27 Mar 2024 16:00:15 -0400
X-MC-Unique: pZxiNCBrPle2BalkSm5j_Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a474ee91f00so8258866b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 13:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569614; x=1712174414;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jg5+/giTEtOl/lQX11+0TrhWUmZtMrysiBpPClfvB1s=;
        b=Ab+T/G1bWiA3foc556mr5sNNg/lHH6zedG5QMRTfsf14/cUxnHwQxtHGxnexBPr8U1
         czlQWMQ61rIDJPnOknFbT+6lp75rzG9jwf4uyF/fUQ8w0O+KYYXQf14Tef5IwaeMc7n4
         Kd1Pb1cP7ibFayQXD69eUg8tq8jrH5W6xsUPWh8faNbTG6pz8X7P+MBldVTXnxvcJUtZ
         djz3xAnSRkEWu2qVQpf7S5pQ5MJtOdClThr5EaIm7rHelnWyQOGhUR1ueH2a6sF5MEBA
         jS2kmH9sC5jAR0NCOk4JrhV8p3nEFec3hDwcnjfRR6qOSt5m6BeKP4gjyfpxfaqqLYVM
         glTg==
X-Forwarded-Encrypted: i=1; AJvYcCVSxGDLQdNuHbEMaaa+yjSze/4U8Bj7NPg78QRBg113/L+i6p8Ec+jH8ajaDzu6SXYkrfzzGqx/j964hZVWDZ+zVvvOmLnt8XNE0BLSNZr7d1u/1Q==
X-Gm-Message-State: AOJu0Yyo3AqGE7lZiclZnAdGOe/xcMvjgH+dGUya7YXGkt6z5e6p9XmT
	Hc+HWvSgId8gVSmjn0SBOIs+b6YFtjlmFyVHlnjqJFCohTINfFSDSG+vVwTtvObEphAAxYkmfcb
	fGijLTLwUxUyLsO15LOpks2B3wGQ4Di41h4CrOE5SFt+XzbEfjfX3IxS8c5BreWUQREqlL560DH
	GhsO0=
X-Received: by 2002:a17:906:fa16:b0:a47:34b2:ca4b with SMTP id lo22-20020a170906fa1600b00a4734b2ca4bmr273769ejb.50.1711569613968;
        Wed, 27 Mar 2024 13:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0Uj4tZcG9O7d0n7WeGej/8PQeesRoK7rhzDeNTvCkXAh3hON2XkT12wTNKE7Avlw1iDU94A==
X-Received: by 2002:a17:906:fa16:b0:a47:34b2:ca4b with SMTP id lo22-20020a170906fa1600b00a4734b2ca4bmr273758ejb.50.1711569613605;
        Wed, 27 Mar 2024 13:00:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ao18-20020a170907359200b00a46aba003eesm5777483ejc.215.2024.03.27.13.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 13:00:13 -0700 (PDT)
Message-ID: <d278e96e-6efe-46f3-802d-7d24adfa4175@redhat.com>
Date: Wed, 27 Mar 2024 21:00:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] platform/x86: add lenovo WMI camera button driver
Content-Language: en-US, nl
To: Ai Chao <aichao@kylinos.cn>, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20240327082737.336992-1-aichao@kylinos.cn>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240327082737.336992-1-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/27/24 9:27 AM, Ai Chao wrote:
> Add lenovo WMI camera button driver to support camera button.
> The Camera button is a GPIO device. This driver receives ACPI notifyi
> when the camera button is switched on/off. This driver is used in
> Lenovo A70, it is a Computer integrated machine.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

Thank you for the new version. I've replaced your v11 in
my review-hans branch with this version now, keeping
Armin Wolf's Reviewed-by from v11.

Regards,

Hans



> ---
> v12: Remove useless parentheses and unneeded blank line.
> v11: Remove input_unregister_device.
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
>  drivers/platform/x86/lenovo-wmi-camera.c | 127 +++++++++++++++++++++++
>  3 files changed, 140 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-wmi-camera.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 7e9251fc3341..b8c806506423 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -996,6 +996,18 @@ config INSPUR_PLATFORM_PROFILE
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
> index 000000000000..0c0bedaf7407
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-camera.c
> @@ -0,0 +1,127 @@
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
> +#include <linux/types.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/wmi.h>
> +
> +#define WMI_LENOVO_CAMERABUTTON_EVENT_GUID "50C76F1F-D8E4-D895-0A3D-62F4EA400013"
> +
> +struct lenovo_wmi_priv {
> +	struct input_dev *idev;
> +	struct mutex notify_lock;	/* lenovo WMI camera button notify lock */
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
> +	/*
> +	 * obj->buffer.pointer[0] is camera mode:
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
> +	keycode = camera_mode == SW_CAMERA_ON ?
> +		   KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE;
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
> +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_id_table);
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
> +module_wmi_driver(lenovo_wmi_driver);
> +
> +MODULE_AUTHOR("Ai Chao <aichao@kylinos.cn>");
> +MODULE_DESCRIPTION("Lenovo WMI Camera Button Driver");
> +MODULE_LICENSE("GPL");

