Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652E1406805;
	Fri, 10 Jul 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679110; cv=none; b=kaZ52oRmyQAKIhSrS4XPKWM3IFMyMXCl951PFZ1zXdagq2Ptgsfv+J+rdBNDznXKr/o2zwNRi5tvTLtLpu/ZtDRzARwfj5vKBf/gmXJho/ZQqsDSt7Wb7Y/ZfdegJod0EYiMeqiGTwJar40Gl7st+3T1anvrF8jW4pH/CMELEqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679110; c=relaxed/simple;
	bh=ksHcdOSh3MThO5VrcJu73T0v6XHcatQD3/50K6hDik4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=O9wCVRHJ9Qb7JWfZc7DV1/sOjB0lz0DKb5V0/qbUjAaXqs296UgAuPwF/FElqqQNTS/awquyqO0LOslAtqSSHIh9GjpC8lWo7ihuMr3nHiIleQ8J3oD/HuvJXbW2ztnAFvgQ44w8lvIOBxw9dSbjk800RVC5jFFVnn9UAkTBzrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cq0pxLY2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cq0pxLY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783679107; x=1815215107;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ksHcdOSh3MThO5VrcJu73T0v6XHcatQD3/50K6hDik4=;
  b=cq0pxLY2xgZNYWvCSu1Fc9WFiT5LGz/i/IYV2dChVjXfvDRqV0wM6/vc
   7baK+mF1KlqroVrxs+yXEv+LwxE9i3GqNhG/1kqbJmg9KdjvI42QvUBCm
   UZLx7XAJcgB33TauQHtDMarQHKgmNikSgsRTIqgSsvKwn8xl9RtNnH65n
   Wu2057VdP+R8BcXn1dM1z2ZXYWEhIs/1N7LyYTqDV2SZ9+KmK7ttRvPJg
   fv8n2tlNTf6CdI9N+XsAh9Cwk5RXmQbo/Ci3HykCgGRRn5YR9C15FIQ6c
   k5v4H+EBnVfx6EgYzGLaiJLPFiDc8TQ/Qu6mVFxR5psvczSuVMR3xytv8
   A==;
X-CSE-ConnectionGUID: xgEGe7OPTWOduGs8tyIAog==
X-CSE-MsgGUID: EmWouwQaSymq+Y+FkRUKRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94981220"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94981220"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 03:25:06 -0700
X-CSE-ConnectionGUID: g+IwrmvrSbuNTivKArj/Sw==
X-CSE-MsgGUID: yO+otBgOTT6oQT+sHbfTGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253115932"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 03:25:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Jul 2026 13:24:59 +0300 (EEST)
To: Mingyou Chen <qby140326@gmail.com>
cc: W_Armin@gmx.de, foxido@foxido.dev, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, nika@nikableh.moe, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v1 1/4] platform/x86: redmi-wmi: Drop redmi-wmi driver
In-Reply-To: <20260709122337.17417-2-qby140326@gmail.com>
Message-ID: <6453528f-4055-2ce8-193e-a266a3ad20c8@linux.intel.com>
References: <20260709122337.17417-1-qby140326@gmail.com> <20260709122337.17417-2-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Jul 2026, Mingyou Chen wrote:

> The redmi-wmi driver is no longer needed because its functionality
> has been superseded by the new generic bitland platform driver.
> All supported Redmi laptop models are now handled properly via the
> updated WMI interfaces in bitland-mifs-wmi.

Are the patches in correct order in this series? Reading the shortlog and 
changelog of patch 2 makes me question if after this patch has been 
applied something might be missing. Why you need to add event handling 
from redmi-wmi into bitland-mifs-wmi after this patch if the functionality 
is there already at this point so you can remove redmi-wmi driver first?

-- 
 i.

> Remove the obsolete code, Kconfig entries, and Makefile references
> to clean up the platform directory.
> 
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>  MAINTAINERS                      |   6 --
>  drivers/platform/x86/Kconfig     |  12 ---
>  drivers/platform/x86/Makefile    |   1 -
>  drivers/platform/x86/redmi-wmi.c | 154 -------------------------------
>  4 files changed, 173 deletions(-)
>  delete mode 100644 drivers/platform/x86/redmi-wmi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f37a81950e25..6d9b69c1df4c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22768,12 +22768,6 @@ S:	Maintained
>  T:	git https://github.com/pkshih/rtw.git
>  F:	drivers/net/wireless/realtek/rtw89/
>  
> -REDMIBOOK WMI DRIVERS
> -M:	Gladyshev Ilya <foxido@foxido.dev>
> -L:	platform-driver-x86@vger.kernel.org
> -S:	Maintained
> -F:	drivers/platform/x86/redmi-wmi.c
> -
>  REDPINE WIRELESS DRIVER
>  L:	linux-wireless@vger.kernel.org
>  S:	Orphan
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index b54b5212b204..036fc76f62df 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -90,18 +90,6 @@ config XIAOMI_WMI
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called xiaomi-wmi.
>  
> -config REDMI_WMI
> -	tristate "Redmibook WMI key driver"
> -	depends on ACPI_WMI
> -	depends on INPUT
> -	select INPUT_SPARSEKMAP
> -	help
> -	  Say Y here if you want support for WMI-based hotkey events on
> -	  Xiaomi Redmibook devices.
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called redmi-wmi.
> -
>  config GIGABYTE_WMI
>  	tristate "Gigabyte WMI temperature driver"
>  	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 872ac3842391..0da4876f766e 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -12,7 +12,6 @@ obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
>  obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
>  obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
>  obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
> -obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
>  obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
>  obj-$(CONFIG_BITLAND_MIFS_WMI)		+= bitland-mifs-wmi.o
>  
> diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
> deleted file mode 100644
> index 58898630eda6..000000000000
> --- a/drivers/platform/x86/redmi-wmi.c
> +++ /dev/null
> @@ -1,154 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/* WMI driver for Xiaomi Redmibooks */
> -
> -#include <linux/acpi.h>
> -#include <linux/bits.h>
> -#include <linux/device.h>
> -#include <linux/input.h>
> -#include <linux/input/sparse-keymap.h>
> -#include <linux/module.h>
> -#include <linux/mutex.h>
> -#include <linux/unaligned.h>
> -#include <linux/wmi.h>
> -
> -#include <uapi/linux/input-event-codes.h>
> -
> -#define WMI_REDMIBOOK_KEYBOARD_EVENT_GUID "46C93E13-EE9B-4262-8488-563BCA757FEF"
> -
> -#define AI_KEY_VALUE_MASK BIT(8)
> -
> -static const struct key_entry redmi_wmi_keymap[] = {
> -	{KE_KEY, 0x00000201,	{KEY_SELECTIVE_SCREENSHOT}},
> -	{KE_KEY, 0x00000301,	{KEY_ALL_APPLICATIONS}},
> -	{KE_KEY, 0x00001b01,	{KEY_CONFIG}},
> -	{KE_KEY, 0x00011b01,	{KEY_CONFIG}},
> -	{KE_KEY, 0x00010101,	{KEY_SWITCHVIDEOMODE}},
> -	{KE_KEY, 0x00001a01,	{KEY_REFRESH_RATE_TOGGLE}},
> -
> -	/* AI button has code for each position */
> -	{KE_KEY, 0x00011801,	{KEY_ASSISTANT}},
> -	{KE_KEY, 0x00011901,	{KEY_ASSISTANT}},
> -
> -	/* Keyboard backlight */
> -	{KE_IGNORE, 0x00000501, {}},
> -	{KE_IGNORE, 0x00800501, {}},
> -	{KE_IGNORE, 0x00050501, {}},
> -	{KE_IGNORE, 0x000a0501, {}},
> -
> -	/* Xiaomi G Command Center */
> -	{KE_KEY, 0x00010a01,	{KEY_VENDOR}},
> -
> -	/* OEM preset power mode */
> -	{KE_IGNORE, 0x00011601, {}},
> -	{KE_IGNORE, 0x00021601, {}},
> -	{KE_IGNORE, 0x00031601, {}},
> -	{KE_IGNORE, 0x00041601, {}},
> -
> -	/* Fn Lock state */
> -	{KE_IGNORE, 0x00000701, {}},
> -	{KE_IGNORE, 0x00010701, {}},
> -
> -	/* Fn+`/1/2/3/4 */
> -	{KE_KEY, 0x00011101, {KEY_F13}},
> -	{KE_KEY, 0x00011201, {KEY_F14}},
> -	{KE_KEY, 0x00011301, {KEY_F15}},
> -	{KE_KEY, 0x00011401, {KEY_F16}},
> -	{KE_KEY, 0x00011501, {KEY_F17}},
> -
> -	{KE_END}
> -};
> -
> -struct redmi_wmi {
> -	struct input_dev *input_dev;
> -	/* Protects the key event sequence */
> -	struct mutex key_lock;
> -};
> -
> -static int redmi_wmi_probe(struct wmi_device *wdev, const void *context)
> -{
> -	struct redmi_wmi *data;
> -	int err;
> -
> -	/* Init dev */
> -	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> -	if (!data)
> -		return -ENOMEM;
> -
> -	dev_set_drvdata(&wdev->dev, data);
> -
> -	err = devm_mutex_init(&wdev->dev, &data->key_lock);
> -	if (err)
> -		return err;
> -
> -	data->input_dev = devm_input_allocate_device(&wdev->dev);
> -	if (!data->input_dev)
> -		return -ENOMEM;
> -
> -	data->input_dev->name = "Redmibook WMI keys";
> -	data->input_dev->phys = "wmi/input0";
> -
> -	err = sparse_keymap_setup(data->input_dev, redmi_wmi_keymap, NULL);
> -	if (err)
> -		return err;
> -
> -	return input_register_device(data->input_dev);
> -}
> -
> -static void redmi_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
> -{
> -	struct key_entry *entry;
> -	struct redmi_wmi *data = dev_get_drvdata(&wdev->dev);
> -	bool autorelease = true;
> -	u32 payload;
> -	int value = 1;
> -
> -	if (obj->type != ACPI_TYPE_BUFFER) {
> -		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);
> -		return;
> -	}
> -
> -	if (obj->buffer.length < 32) {
> -		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length);
> -		return;
> -	}
> -
> -	payload = get_unaligned_le32(obj->buffer.pointer);
> -	entry = sparse_keymap_entry_from_scancode(data->input_dev, payload);
> -
> -	if (!entry) {
> -		dev_dbg(&wdev->dev, "Unknown WMI event with payload %u", payload);
> -		return;
> -	}
> -
> -	/* AI key quirk */
> -	if (entry->keycode == KEY_ASSISTANT) {
> -		value = !(payload & AI_KEY_VALUE_MASK);
> -		autorelease = false;
> -	}
> -
> -	guard(mutex)(&data->key_lock);
> -	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease);
> -}
> -
> -static const struct wmi_device_id redmi_wmi_id_table[] = {
> -	{ WMI_REDMIBOOK_KEYBOARD_EVENT_GUID, NULL },
> -	{ }
> -};
> -
> -static struct wmi_driver redmi_wmi_driver = {
> -	.driver = {
> -		.name = "redmi-wmi",
> -		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> -	},
> -	.id_table = redmi_wmi_id_table,
> -	.min_event_size = 32,
> -	.probe = redmi_wmi_probe,
> -	.notify = redmi_wmi_notify,
> -	.no_singleton = true,
> -};
> -module_wmi_driver(redmi_wmi_driver);
> -
> -MODULE_DEVICE_TABLE(wmi, redmi_wmi_id_table);
> -MODULE_AUTHOR("Gladyshev Ilya <foxido@foxido.dev>");
> -MODULE_DESCRIPTION("Redmibook WMI driver");
> -MODULE_LICENSE("GPL");
> 
