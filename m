Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CEA49C4D0;
	Thu, 17 Sep 2026 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640719; cv=none; b=NuacJkRQ2UXxf02Xv+RJYAqNKNuSR/Z+aFpm7r2NP8OVAM0BUewvoUVTlTmLPkzakiJel4sZj1ww9m53zjnNjGY84gbM0UjGCZJYZfNGv5o5XucG6HWNVSHkNFe9NmmgB6WWSqP9cX6IJlgm02ACCYhWK2G2sUc6I23cAJwPZQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640719; c=relaxed/simple;
	bh=vVyKcEh8bjQKJP85dLU/XivgsTdnME1XvFCpIruUu3Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MC2Mux5ZsfRYeGEulgtM/3odTYs3OVLs/sz2NW7L4hV75Fa2PVrLptGxK7OsM5sA8xAcxGskaOclxgFoTETYWFHnZPuoCftuUKDk69qi2LfOiahevX+D1vKQzFEiNU+rHCbR7B94KTyeRBT+R4zuxC4UU4h+LlAGNsZxBoVxsT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPPVbxZB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPPVbxZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789640717; x=1821176717;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vVyKcEh8bjQKJP85dLU/XivgsTdnME1XvFCpIruUu3Y=;
  b=DPPVbxZBzr+rPkOELDMkfznOsOZEPzNRNbvAB+PaoB4k9KsYivu+7ngf
   S7kNikUo1Q/JNwbYP/GdU6sVLqd0bhP+FLweu383zImBwZb3coyII7M24
   baMzpzmrO21Xx/UOGLfUM8FUw5nEbtctLFEgtj4ky7HsbKQfLk9NDr7AA
   MT5DKWnhrshKYkULEIlQXX/mAoQ5OUyF0MgWtNx7Q9hsqVCgEC2JLLT6p
   wK84oyKpCjpFA4IKab0UQifOrv3xliKghVep2B3qdIumhXMQPlBXzLgmM
   GhunjYKJLN1K0qGGVd7ZC2cI389nM6+qrUiVwSFKH14y3iqI44pszYTbD
   A==;
X-CSE-ConnectionGUID: PvQU7KfkT0adGYFc4TS/fw==
X-CSE-MsgGUID: wksQTF+hTOutZDP5PgltHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93875858"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93875858"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 03:25:16 -0700
X-CSE-ConnectionGUID: O4kPy73wR9qnyZp2HK6oMQ==
X-CSE-MsgGUID: HnMmw6q0TcWPjSHe0ygbyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297191161"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 03:25:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 13:25:11 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: dell-wmi-aio: Convert to use the bus-based
 WMI API
In-Reply-To: <20260802124530.7116-1-W_Armin@gmx.de>
Message-ID: <eaf1521d-f5dd-af7d-a866-1bd6aff9800b@linux.intel.com>
References: <20260802124530.7116-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 2 Aug 2026, Armin Wolf wrote:

> It turns out that some devices like the Dell Inspiron One 2310
> contain multiple WMI event devices with a matching GUID of
> 284A0E6B-380E-472A-921F-E52786257FB4, each handling a separate
> hotkey (volume up, volume down, ...). The dell-wmi-aio driver
> however still uses the legacy GUID-based WMI API and can thus
> only see the first of those WMI event devices, preventing the
> remaining buttons from working.
> 
> Fix this by converting the driver to use the modern bus-based
> WMI API. This also includes replacing the usage of
> union acpi_object with struct wmi_buffer.
> 
> Tested using the ACPI-WMI ASL code from the Dell Inspiron One 2310
> together with some changes to allow injecting events.
> 
> Link: https://linux-hardware.org/?probe=e86d77e44d
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/dell/dell-wmi-aio.c | 198 +++++++++--------------
>  1 file changed, 78 insertions(+), 120 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-aio.c b/drivers/platform/x86/dell/dell-wmi-aio.c
> index 54096495719b..8849ad93480b 100644
> --- a/drivers/platform/x86/dell/dell-wmi-aio.c
> +++ b/drivers/platform/x86/dell/dell-wmi-aio.c
> @@ -5,14 +5,20 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/cleanup.h>
> +#include <linux/compiler_attributes.h>
> +#include <linux/device.h>
> +#include <linux/device/driver.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/overflow.h>
>  #include <linux/init.h>
>  #include <linux/types.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
> -#include <linux/acpi.h>
>  #include <linux/string.h>
> +#include <linux/wmi.h>
>  
>  MODULE_DESCRIPTION("WMI hotkeys driver for Dell All-In-One series");
>  MODULE_LICENSE("GPL");
> @@ -20,22 +26,19 @@ MODULE_LICENSE("GPL");
>  #define EVENT_GUID1 "284A0E6B-380E-472A-921F-E52786257FB4"
>  #define EVENT_GUID2 "02314822-307C-4F66-BF0E-48AEAEB26CC8"
>  
> +struct dell_wmi_aio_data {
> +	struct input_dev *input_device;
> +	/* Protects the input sequence */
> +	struct mutex input_lock;
> +};
> +
>  struct dell_wmi_event {
> -	u16	length;
> +	__le16	length;
>  	/* 0x000: A hot key pressed or an event occurred
>  	 * 0x00F: A sequence of hot keys are pressed */
> -	u16	type;
> -	u16	event[];
> -};
> -
> -static const char *dell_wmi_aio_guids[] = {
> -	EVENT_GUID1,
> -	EVENT_GUID2,
> -	NULL
> -};
> -
> -MODULE_ALIAS("wmi:"EVENT_GUID1);
> -MODULE_ALIAS("wmi:"EVENT_GUID2);
> +	__le16	type;
> +	__le16	event[];
> +} __packed;
>  
>  static const struct key_entry dell_wmi_aio_keymap[] = {
>  	{ KE_KEY, 0xc0, { KEY_VOLUMEUP } },
> @@ -50,137 +53,92 @@ static const struct key_entry dell_wmi_aio_keymap[] = {
>  	{ KE_END, 0 }
>  };
>  
> -static struct input_dev *dell_wmi_aio_input_dev;
> -
>  /*
>   * The new WMI event data format will follow the dell_wmi_event structure
>   * So, we will check if the buffer matches the format
>   */
> -static bool dell_wmi_aio_event_check(u8 *buffer, int length)
> +static bool dell_wmi_aio_event_check(const struct wmi_buffer *buffer)
>  {
> -	struct dell_wmi_event *event = (struct dell_wmi_event *)buffer;
> +	struct dell_wmi_event *event;
> +	u16 length, type;
>  
> -	if (event == NULL || length < 6)
> +	if (buffer->length < struct_size(event, event, 1))
>  		return false;
>  
> -	if ((event->type == 0 || event->type == 0xf) &&
> -			event->length >= 2)
> +	event = buffer->data;
> +	length = le16_to_cpu(event->length);
> +	type = le16_to_cpu(event->type);
> +	if ((type == 0 || type == 0xf) && length >= 2)

Hi Armin,

I've applied this but could you please do another patch which converts 
the first two literals (+ the related comments above) into named defines.

-- 
 i.

>  		return true;
>  
>  	return false;
>  }
>  
> -static void dell_wmi_aio_notify(union acpi_object *obj, void *context)
> +static void dell_wmi_aio_notify(struct wmi_device *wdev, const struct wmi_buffer *data)
>  {
> -	struct dell_wmi_event *event;
> -
> -	if (obj) {
> -		unsigned int scancode = 0;
> -
> -		switch (obj->type) {
> -		case ACPI_TYPE_INTEGER:
> -			/* Most All-In-One correctly return integer scancode */
> -			scancode = obj->integer.value;
> -			sparse_keymap_report_event(dell_wmi_aio_input_dev,
> -				scancode, 1, true);
> -			break;
> -		case ACPI_TYPE_BUFFER:
> -			if (dell_wmi_aio_event_check(obj->buffer.pointer,
> -						obj->buffer.length)) {
> -				event = (struct dell_wmi_event *)
> -					obj->buffer.pointer;
> -				scancode = event->event[0];
> -			} else {
> -				/* Broken machines return the scancode in a
> -				   buffer */
> -				if (obj->buffer.pointer &&
> -						obj->buffer.length > 0)
> -					scancode = obj->buffer.pointer[0];
> -			}
> -			if (scancode)
> -				sparse_keymap_report_event(
> -					dell_wmi_aio_input_dev,
> -					scancode, 1, true);
> -			break;
> -		}
> -	}
> -}
> -
> -static int __init dell_wmi_aio_input_setup(void)
> -{
> -	int err;
> -
> -	dell_wmi_aio_input_dev = input_allocate_device();
> -
> -	if (!dell_wmi_aio_input_dev)
> -		return -ENOMEM;
> -
> -	dell_wmi_aio_input_dev->name = "Dell AIO WMI hotkeys";
> -	dell_wmi_aio_input_dev->phys = "wmi/input0";
> -	dell_wmi_aio_input_dev->id.bustype = BUS_HOST;
> -
> -	err = sparse_keymap_setup(dell_wmi_aio_input_dev,
> -			dell_wmi_aio_keymap, NULL);
> -	if (err) {
> -		pr_err("Unable to setup input device keymap\n");
> -		goto err_free_dev;
> -	}
> -	err = input_register_device(dell_wmi_aio_input_dev);
> -	if (err) {
> -		pr_info("Unable to register input device\n");
> -		goto err_free_dev;
> +	struct dell_wmi_aio_data *drvdata = dev_get_drvdata(&wdev->dev);
> +	const struct dell_wmi_event *new_event;
> +	unsigned int scancode;
> +	const u8 *old_event;
> +
> +	if (dell_wmi_aio_event_check(data)) {
> +		new_event = data->data;
> +		scancode = le16_to_cpu(new_event->event[0]);
> +	} else {
> +		old_event = data->data;
> +		scancode = old_event[0];
>  	}
> -	return 0;
> -
> -err_free_dev:
> -	input_free_device(dell_wmi_aio_input_dev);
> -	return err;
> -}
> -
> -static const char *dell_wmi_aio_find(void)
> -{
> -	int i;
>  
> -	for (i = 0; dell_wmi_aio_guids[i] != NULL; i++)
> -		if (wmi_has_guid(dell_wmi_aio_guids[i]))
> -			return dell_wmi_aio_guids[i];
> +	guard(mutex)(&drvdata->input_lock);
>  
> -	return NULL;
> +	sparse_keymap_report_event(drvdata->input_device, scancode, 1, true);
>  }
>  
> -static int __init dell_wmi_aio_init(void)
> +static int dell_wmi_aio_probe(struct wmi_device *wdev, const void *context)
>  {
> -	int err;
> -	const char *guid;
> +	struct dell_wmi_aio_data *data;
> +	int ret;
>  
> -	guid = dell_wmi_aio_find();
> -	if (!guid) {
> -		pr_warn("No known WMI GUID found\n");
> -		return -ENXIO;
> -	}
> +	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
>  
> -	err = dell_wmi_aio_input_setup();
> -	if (err)
> -		return err;
> +	dev_set_drvdata(&wdev->dev, data);
> +	ret = devm_mutex_init(&wdev->dev, &data->input_lock);
> +	if (ret < 0)
> +		return ret;
>  
> -	err = wmi_install_notify_handler(guid, dell_wmi_aio_notify, NULL);
> -	if (err) {
> -		pr_err("Unable to register notify handler - %d\n", err);
> -		input_unregister_device(dell_wmi_aio_input_dev);
> -		return err;
> -	}
> +	data->input_device = devm_input_allocate_device(&wdev->dev);
> +	if (!data->input_device)
> +		return -ENOMEM;
>  
> -	return 0;
> -}
> +	data->input_device->name = "Dell AIO WMI hotkeys";
> +	data->input_device->phys = "wmi/input0";
> +	data->input_device->id.bustype = BUS_HOST;
>  
> -static void __exit dell_wmi_aio_exit(void)
> -{
> -	const char *guid;
> +	ret = sparse_keymap_setup(data->input_device, dell_wmi_aio_keymap, NULL);
> +	if (ret < 0)
> +		return ret;
>  
> -	guid = dell_wmi_aio_find();
> -	wmi_remove_notify_handler(guid);
> -	input_unregister_device(dell_wmi_aio_input_dev);
> +	return input_register_device(data->input_device);
>  }
>  
> -module_init(dell_wmi_aio_init);
> -module_exit(dell_wmi_aio_exit);
> +static const struct wmi_device_id dell_wmi_aio_id_table[] = {
> +	{ EVENT_GUID1, NULL },
> +	{ EVENT_GUID2, NULL },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, dell_wmi_aio_id_table);
> +
> +static struct wmi_driver dell_wmi_aio_driver = {
> +	.driver = {
> +		.name = "dell-wmi-aio",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table = dell_wmi_aio_id_table,
> +	.probe = dell_wmi_aio_probe,
> +	.notify_new = dell_wmi_aio_notify,
> +	.min_event_size = sizeof(u8),
> +	.no_singleton = true,
> +};
> +module_wmi_driver(dell_wmi_aio_driver);
> 

-- 
 i.

