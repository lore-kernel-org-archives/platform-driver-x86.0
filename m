Received: from mta1.migadu.com (out-49.mta1.migadu.com [95.215.58.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42E53B4E9B
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 20:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787777452; cv=none; b=TGf1vdNomCpKkVCx0FUVYq866gG4xskErS3yZjRlqjJbFwD/tQlZKdL5ZR7pwOWXQflIaCTBblWZtls68RgUNEQL4sncd08HmupXOIiLuVvjrUHf0t7WNMG7mHUtd53oWWLKDhARk28OyM4dfWNR7J3sSEpB142gWxkKD5qMmWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787777452; c=relaxed/simple;
	bh=tlRBaNd4c7LdUEnL8a3fY9ST53hUWPR5pngNeUIicIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gpdd/K8BKO7cd9GPSBA8i2qzUfmOi4J/4GOf76RuIl2oUcfO43nLXAfyD5JKTDwS6HqYQYdA7C5+vY/Myuldm/J+LwnHmEFSCNH3zLLzGZLppHm3HQtuR4Nz9BbFDBc+k41q/zWsPSQc+4mfd6SNW8pclE0s1WyOYKw++1KUlpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OxPkf+ns; arc=none smtp.client-ip=95.215.58.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OxPkf+ns"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tlRBaNd4c7LdUEnL8a3fY9ST53hUWPR5pngNeUIicIQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787777446; v=1; x=1788382246;
 b=OxPkf+nsRvy8358caGwxRlpy9AcvIOFrjeNjKrmYVwyFcDSIKDCZ9RZ13hm8GTYp/2KR7owW
 EpFbuBT7PUHpXeeGIEmruJApOONGW8HCGOquhvn2Q6kNK4S5/pjgpUKXw5UMWMSgo+2cMepjLr3
 mcJu+Yj0vAYi5oPnIlXKze1Q=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: from [10.8.1.6] (107.189.15.163)
	by smtp.migadu.com with ESMTPS id bdfe0f7ab2abe926;
	Wed, 26 Aug 2026 20:50:46 +0000
X-Mizu-Trace-ID: bdfe0f7ab2abe926
X-Migadu-Flow: FLOW_OUT
Message-ID: <c20571fe-8747-4256-86f2-0bfb4656be56@linux.dev>
Date: Wed, 26 Aug 2026 23:50:38 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] platform/x86: redmi-wmi: Drop redmi-wmi driver
To: Mingyou Chen <qby140326@gmail.com>
Cc: W_Armin@gmx.de, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, nika@nikableh.moe,
 platform-driver-x86@vger.kernel.org, vlku.milos.fun@gmail.com, i@rsplwe.com,
 wolf109909@outlook.com, rahulbheda131313@gmail.com
References: <20260816100813.300450-1-qby140326@gmail.com>
 <20260816100813.300450-5-qby140326@gmail.com>
Content-Language: en-US
From: Ilya Gladyshev <ilya.gladyshev@linux.dev>
In-Reply-To: <20260816100813.300450-5-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>

On 8/16/26 13:08, Mingyou Chen wrote:
> The redmi-wmi driver is no longer needed because its functionality
> has been superseded by the new generic bitland platform driver.
> All supported Redmi laptop models are now handled properly via the
> updated WMI interfaces in bitland-mifs-wmi.
> 
> Remove the obsolete code, Kconfig entries, and Makefile references
> to clean up the platform directory.
> 
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>   MAINTAINERS                      |   6 --
>   drivers/platform/x86/Kconfig     |  12 ---
>   drivers/platform/x86/Makefile    |   1 -
>   drivers/platform/x86/redmi-wmi.c | 154 -------------------------------
>   4 files changed, 173 deletions(-)
>   delete mode 100644 drivers/platform/x86/redmi-wmi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index af86b1df1a94..b92bc4816fa6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22768,12 +22768,6 @@ S:	Maintained
>   T:	git https://github.com/pkshih/rtw.git
>   F:	drivers/net/wireless/realtek/rtw89/
>   
> -REDMIBOOK WMI DRIVERS
> -M:	Gladyshev Ilya <foxido@foxido.dev>
> -L:	platform-driver-x86@vger.kernel.org
> -S:	Maintained
> -F:	drivers/platform/x86/redmi-wmi.c
> -
>   BITLAND LAPTOP DRIVER
>   M:	Mingyou Chen <qby140326@gmail.com>
>   M:	Gladyshev Ilya <foxido@foxido.dev>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index b54b5212b204..036fc76f62df 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -90,18 +90,6 @@ config XIAOMI_WMI
>   	  To compile this driver as a module, choose M here: the module will
>   	  be called xiaomi-wmi.
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
>   config GIGABYTE_WMI
>   	tristate "Gigabyte WMI temperature driver"
>   	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 872ac3842391..0da4876f766e 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -12,7 +12,6 @@ obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
>   obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
>   obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
>   obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
> -obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
>   obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
>   obj-$(CONFIG_BITLAND_MIFS_WMI)		+= bitland-mifs-wmi.o
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

