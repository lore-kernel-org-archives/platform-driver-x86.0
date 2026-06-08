Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA9631327D;
	Mon,  8 Jun 2026 10:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913351; cv=none; b=QOqf6xSvA5R2vyoae5RfGISVQZz2st5YTf3syKJoIT63TmHBEUM49KIhDR5pqL654whuG4X0n+OBycI4jzVnmao/UWOAGh9pI/e/ynPo22gBsfU/7N7vcavqWMcBSflTS/s7DVi6nUohSBgWw04rQkd2IH9F/TGljZySbZyWrSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913351; c=relaxed/simple;
	bh=wF6G3UXv5UTekA/2EGHDgj+IHxjQIedmwi8IbeYtWIY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZmWrrliPnXYz6d1q0ZLHU+OtNu5ItjWAn+EP63Lz8yZ01klaw61+Y6eu1PABtjZGDk4wn8HuUGRwV9+020l8bbT9v4j4IbS68EijpJFuP+9697lRM+oMA9/y9xAbXNAJuKSLHxwttZJyr1B4lTZJWUXkBckco4IRYmxVCAaWs7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKrBjfpY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKrBjfpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780913349; x=1812449349;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wF6G3UXv5UTekA/2EGHDgj+IHxjQIedmwi8IbeYtWIY=;
  b=bKrBjfpYhM/1Hxbs099aXZ83gNFft2EZrZS9eziIySHxYXwUqLCgsBqr
   Uk1jMpAjFs7n8R2aa+iFwyxJ0eG0EzpfkeXt3SxklnBjS/eyDngC9tPov
   vBobQm47OkUYMxHYuKoliuA+u69ztnTxAZzzeE/i8vYcEw4BX0JPJi9A+
   cDkWXwC2EybLBxaSKrslsTFGAVcJKqlSES3lQcji12KHmxIu5jNLGIDq/
   Yhaq7hg6AVq4Tv5WJSxhFz3AFKbzU/3lN7CuZk8nXtYl9DRuSx4fzXflq
   cwSBX1PE13TNCCajtVYJVZoIzQxKX0rwmQQjS1Sj6Pz/SOtqi5O5Qd0Wv
   g==;
X-CSE-ConnectionGUID: 3/gqQIb/SmuirjI4fncjcQ==
X-CSE-MsgGUID: FyUYLniqTYOxttlsD3rPyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85498358"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="85498358"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 03:09:09 -0700
X-CSE-ConnectionGUID: WMlLxQWPRK6ESv/1FdX/dg==
X-CSE-MsgGUID: diRbm/98SZG0BTvFaXNd3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="250422485"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 03:09:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jun 2026 13:09:02 +0300 (EEST)
To: Lucy Wong <lucywong2778@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86: add Xiaomi WMI key driver
In-Reply-To: <20260601152703.94539-2-lucywong2778@gmail.com>
Message-ID: <ddc819dc-4c5a-ba62-bced-3222e2e60bb7@linux.intel.com>
References: <20260601152703.94539-1-lucywong2778@gmail.com> <20260601152703.94539-2-lucywong2778@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Jun 2026, Lucy Wong wrote:

> Certain Xiaomi laptops expose extra function keys through a single WMI
> event GUID (B74AF83F-8B2F-4069-ACAC-36D176F62FC0). Unlike the existing
> xiaomi-wmi driver where each key has its own GUID, here all keys share
> one GUID and the event buffer encodes both an event type and a keycode:
> 
>   buffer[1] = event type
>     0x02: press/release keys (5 keys with abstract icons)
>     0x03: firmware-handled toggles (touchpad, Fn lock)
>   buffer[2] = keycode within that type
> 
> The keys with abstract icons are mapped to programmable macro keys for
> userspace to bind. The touchpad and Fn lock keys are handled by the EC
> and are reported for notification purposes only.
> 
> Signed-off-by: Lucy Wong <lucywong2778@gmail.com>
> ---
>  MAINTAINERS                            |   6 ++
>  drivers/platform/x86/Kconfig           |  11 ++
>  drivers/platform/x86/Makefile          |   1 +
>  drivers/platform/x86/xiaomi-wmi-keys.c | 139 +++++++++++++++++++++++++
>  4 files changed, 157 insertions(+)
>  create mode 100644 drivers/platform/x86/xiaomi-wmi-keys.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 839e39825455..7969b82c8315 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29124,6 +29124,12 @@ F:	fs/xfs/
>  F:	include/uapi/linux/dqblk_xfs.h
>  F:	include/uapi/linux/fsmap.h
>  
> +XIAOMI WMI KEYS DRIVER
> +M:	Lucy Wong <lucywong2778@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/xiaomi-wmi-keys.c
> +
>  XILINX AMS DRIVER
>  M:	Salih Erim <salih.erim@amd.com>
>  M:	Conall O'Griofa <conall.ogriofa@amd.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index b54b5212b204..541b0a255daa 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -90,6 +90,17 @@ config XIAOMI_WMI
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called xiaomi-wmi.
>  
> +config XIAOMI_WMI_KEYS
> +	tristate "Xiaomi WMI key events driver"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	help
> +	  Say Y here if you want to support WMI-based hotkey events on certain
> +	  Xiaomi laptops.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called xiaomi-wmi-keys.
> +
>  config REDMI_WMI
>  	tristate "Redmibook WMI key driver"
>  	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 872ac3842391..d852bb0bf61b 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
>  obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
>  obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
>  obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
> +obj-$(CONFIG_XIAOMI_WMI_KEYS)		+= xiaomi-wmi-keys.o
>  obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
>  obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
>  obj-$(CONFIG_BITLAND_MIFS_WMI)		+= bitland-mifs-wmi.o
> diff --git a/drivers/platform/x86/xiaomi-wmi-keys.c b/drivers/platform/x86/xiaomi-wmi-keys.c
> new file mode 100644
> index 000000000000..524ede0e64eb
> --- /dev/null
> +++ b/drivers/platform/x86/xiaomi-wmi-keys.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Xiaomi laptop WMI hotkey driver
> + *
> + * Copyright (C) 2026 Lucy Wong <lucywong2778@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +
> +#define XIAOMI_WMI_EVENT_GUID "B74AF83F-8B2F-4069-ACAC-36D176F62FC0"
> +
> +#define XIAOMI_TYPE_BACKLIGHT 0x01 /* keyboard backlight level (EC handled) */
> +#define XIAOMI_TYPE_KEY  0x02 /* press/release keys */
> +#define XIAOMI_TYPE_TOGGLE 0x03 /* firmware toggle keys (notify only) */

Please align values within a "group".

> +
> +#define XIAOMI_KEY_PRESS_MIN 0x01
> +#define XIAOMI_KEY_PRESS_MAX 0x05
> +#define XIAOMI_KEY_RELEASE_OFF 0x05

Ditto.

> +
> +#define XIAOMI_TOGGLE_DEDUP_MS 50
> +
> +struct xiaomi_wmi {
> +	struct input_dev *input_dev;
> +	unsigned long last_toggle;
> +	u8 last_toggle_code;
> +};
> +
> +static const struct key_entry xiaomi_wmi_keymap[] = {
> +	/* type 0x02: programmable keys with abstract icons */
> +	{ KE_KEY, 0x0201, { KEY_MACRO1 } },
> +	{ KE_KEY, 0x0202, { KEY_MACRO2 } },
> +	{ KE_KEY, 0x0203, { KEY_MACRO3 } },
> +	{ KE_KEY, 0x0204, { KEY_MACRO4 } },
> +	{ KE_KEY, 0x0205, { KEY_MACRO5 } },
> +	/* type 0x03: firmware-handled toggles, reported for OSD only */
> +	{ KE_KEY, 0x0300, { KEY_F21 } }, /* touchpad toggle */

There is KEY_TOUCHPAD_TOGGLE.

> +	{ KE_KEY, 0x0301, { KEY_FN_ESC } }, /* Fn lock */

I'm not sure if KEY_FN_ESC is right key for it.

And if these are handled by FW, shouldn't you use KEY_IGNORE?

Since you've space, align the upper comment to the one below for better 
readability.

> +	{ KE_END, 0 },
> +};
> +
> +static int xiaomi_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct xiaomi_wmi *data;
> +	int ret;
> +
> +	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	dev_set_drvdata(&wdev->dev, data);
> +
> +	data->input_dev = devm_input_allocate_device(&wdev->dev);
> +	if (!data->input_dev)
> +		return -ENOMEM;
> +
> +	data->input_dev->name = "Xiaomi WMI keys";
> +	data->input_dev->phys = "wmi/input0";
> +	data->input_dev->id.bustype = BUS_HOST;
> +
> +	ret = sparse_keymap_setup(data->input_dev, xiaomi_wmi_keymap, NULL);

Please add select INPUT_SPARSEKMAP.

> +	if (ret)
> +		return ret;
> +
> +	return input_register_device(data->input_dev);
> +}
> +
> +static void xiaomi_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
> +{
> +	struct xiaomi_wmi *data = dev_get_drvdata(&wdev->dev);
> +	u8 type, code;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER || obj->buffer.length < 3)
> +		return;
> +
> +	type = obj->buffer.pointer[1];
> +	code = obj->buffer.pointer[2];
> +
> +	switch (type) {
> +	case XIAOMI_TYPE_KEY:
> +		if (code >= XIAOMI_KEY_PRESS_MIN &&
> +		    code <= XIAOMI_KEY_PRESS_MAX) {
> +			sparse_keymap_report_event(data->input_dev,
> +						   0x0200 | code, 1, false);

Please name literals.

> +		} else if (code > XIAOMI_KEY_PRESS_MAX &&
> +						code <= XIAOMI_KEY_PRESS_MAX +
> +							XIAOMI_KEY_RELEASE_OFF) {

Please align properly.

I think the defines are not optional as you seem to have two blocks of 
codes, both with n length, one doing press and the other release but your 
defines are not based one the code blocks being of same length.

> +			code -= XIAOMI_KEY_RELEASE_OFF;
> +			sparse_keymap_report_event(data->input_dev,
> +						   0x0200 | code, 0, false);
> +		}
> +		break;
> +
> +	case XIAOMI_TYPE_TOGGLE:
> +		/* deduplicate: each press emits two identical events */
> +		if (data->last_toggle_code == code &&
> +		    time_before(jiffies, data->last_toggle +

Is ->last_toggle initialized to a sensible value?
(found by sashiko.dev)

> +				msecs_to_jiffies(XIAOMI_TOGGLE_DEDUP_MS)))
> +			return;
> +		data->last_toggle_code = code;
> +		data->last_toggle = jiffies;

Locking needed?

Is it guaranteed that the duplicates are always in-order, that is, not two 
different toggles can get interleaved?

> +		sparse_keymap_report_event(data->input_dev,
> +					   0x0300 | code, 1, true);
> +		break;
> +
> +	case XIAOMI_TYPE_BACKLIGHT:
> +		/* keyboard backlight handled by EC, nothing to do */
> +		break;
> +
> +	default:
> +		dev_dbg(&wdev->dev, "unknown event type 0x%02x\n", type);

Add include.

> +		break;
> +	}
> +}
> +
> +static const struct wmi_device_id xiaomi_wmi_id_table[] = {
> +	{ .guid_string = XIAOMI_WMI_EVENT_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, xiaomi_wmi_id_table);
> +
> +static struct wmi_driver xiaomi_wmi_driver = {
> +	.driver = {
> +		.name = "xiaomi-wmi-keys",
> +	},
> +	.id_table = xiaomi_wmi_id_table,
> +	.probe = xiaomi_wmi_probe,
> +	.notify = xiaomi_wmi_notify,

We're transitioning wmi core, so please convert to .notify_new.

You may also consider using .min_event_size.

> +	.no_singleton = true,
> +};
> +module_wmi_driver(xiaomi_wmi_driver);
> +
> +MODULE_AUTHOR("Lucy Wong <lucywong2778@gmail.com>");
> +MODULE_DESCRIPTION("Xiaomi laptop WMI hotkey driver");
> +MODULE_LICENSE("GPL");
> 

-- 
 i.

