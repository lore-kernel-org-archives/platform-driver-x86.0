Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642CD383;
	Thu,  2 Jan 2025 03:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735789469; cv=none; b=hF2wcbJfGzJMpRZ4bW9W3cydYmqgebE5akiTSQZl2+GF5qbh2fvEismb4o4ucx2c+bvAHAwcrj9L5+c5CJwJ5PhEel6Awc13H8nO3BUkqjfyxl/20cc2WbvYwJSCyYzxu5T95aanFMiDiajkqeOdXh3S87fPawYa7UrivK9pIvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735789469; c=relaxed/simple;
	bh=vUBQJ7nrfTuP4YEOaYkwtuRWTl/SlGbCA/+MO1JOees=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2C6PVOK+Q/0tGVATsORCVWqp5Rpqm0mWNsGMzXv5m+Xmathn5INQ5rKECc4mCdeNBpIWRIGVCXVvy9TcrzZM8PsJhuJF/z0u4gyjUv2pXWRc9mv6VVPC/Cy72bZwgsqwSPE+H/sXpX3U7m1ELT6DIAYW3J+VlY7Y5YXEGlBY48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hR5nA6D3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hR5nA6D3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62456C4CED0;
	Thu,  2 Jan 2025 03:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735789468;
	bh=vUBQJ7nrfTuP4YEOaYkwtuRWTl/SlGbCA/+MO1JOees=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hR5nA6D3gwIOtw6qJECy8ZGlMPzX6NeFK54QBwoVWAwvZsz1AvytHnNkHeGzaqUNd
	 4InFlHYQsA8h+Ddzbgrfqljdb/+tZW/AWUZnlZ+U3zSN/VMjJIgQUPq77hj7dzXZtZ
	 x05bMu8eesp03AG+lO6oDWzzFyxqSVeRI7ROFTQHSaWBIMYiY0IVA/9AzUDQwqKntW
	 CqssPTJ/sFidmtzpjNvHC752GgfAMxIcISV6/Svhr7lRLm5r7J4DB/LR2MYz9IqUGr
	 Yjz032HqSY2/ACnPMaXs0WhJTto3840A51fp+ENv3XcO/5u4HR2G0NqniLc4Tq4/qc
	 UpaH6Nw1WCbtA==
Message-ID: <d086937b-a6d8-493d-82f6-4f19609e63cb@kernel.org>
Date: Wed, 1 Jan 2025 21:44:26 -0600
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] platform/x86: Add Lenovo Capability Data 01 WMI
 Driver
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-4-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250102004854.14874-4-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/1/25 18:47, Derek J. Clark wrote:
> Adds lenovo-wmi-capdata01.c which provides a driver for the
> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Method"
> enabled hardware. Provides an interface for querying if a given
> attribute is supported by the hardware, as well as its default_value,
> max_value, min_value, and step increment.
> 
> v2:
> - Use devm_kzalloc to ensure driver can be instanced, remove global
>    reference.
> - Ensure reverse Christmas tree for all variable declarations.
> - Remove extra whitespace.
> - Use guard(mutex) in all mutex instances, global mutex.
> - Use pr_fmt instead of adding the driver name to each pr_err.
> - Remove noisy pr_info usage.
> - Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv.
> - Use list to get the lenovo_wmi_cd01_priv instance in
>    lenovo_wmi_capdata01_get as none of the data provided by the macros
>    that will use it can pass a member of the struct for use in
>    container_of.
> 
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>   MAINTAINERS                                 |   1 +
>   drivers/platform/x86/Kconfig                |  11 ++
>   drivers/platform/x86/Makefile               |   1 +
>   drivers/platform/x86/lenovo-wmi-capdata01.c | 131 ++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi.h           |  20 +++
>   5 files changed, 164 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8f8a6aec6b92..c9374c395905 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13038,6 +13038,7 @@ LENOVO WMI drivers
>   M:	Derek J. Clark <derekjohn.clark@gmail.com>
>   L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
> +F:	drivers/platform/x86/lenovo-wmi-capdata01.c
>   F:	drivers/platform/x86/lenovo-wmi-gamezone.c
>   F:	drivers/platform/x86/lenovo-wmi.h
>   
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 9a6ac7fdec9f..a2c1ab47ad9e 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -470,6 +470,17 @@ config LENOVO_WMI_GAMEZONE
>   	  To compile this driver as a module, choose M here: the module will
>   	  be called lenovo_wmi_gamezone.
>   
> +config LENOVO_WMI_DATA01
> +	tristate "Lenovo Legion WMI capability Data 01 Driver"
> +	depends on ACPI_WMI
> +	help
> +	  Say Y here if you have a WMI aware Lenovo Legion device in the "Gaming Series"
> +	  line of hardware. This interface is a dependency for exposing tunable power
> +	  settings.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo_wmi_capdata01.
> +
>   config IDEAPAD_LAPTOP
>   	tristate "Lenovo IdeaPad Laptop Extras"
>   	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 7cb29a480ed2..6c96cc3f3855 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
>   obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
>   obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
>   obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= lenovo-wmi-gamezone.o
> +obj-$(CONFIG_LENOVO_WMI_DATA01)	+= lenovo-wmi-capdata01.o
>   
>   # Intel
>   obj-y				+= intel/
> diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.c b/drivers/platform/x86/lenovo-wmi-capdata01.c
> new file mode 100644
> index 000000000000..b10a6e4b320f
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * LENOVO_CAPABILITY_DATA_01 WMI data block driver. This interface provides
> + * information on tunable attributes used by the "Other Method" WMI interface,
> + * including if it is supported by the hardware, the default_value, max_value,
> + * min_value, and step increment.
> + *
> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/list.h>
> +#include "lenovo-wmi.h"
> +
> +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
> +
> +static DEFINE_MUTEX(cd01_call_mutex);
> +static DEFINE_MUTEX(cd01_list_mutex);
> +static LIST_HEAD(cd01_wmi_list);
> +
> +static const struct wmi_device_id lenovo_wmi_capdata01_id_table[] = {
> +	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
> +	{}
> +};
> +
> +struct lenovo_wmi_cd01_priv {
> +	struct wmi_device *wdev;
> +	struct list_head list;
> +};
> +
> +static inline struct lenovo_wmi_cd01_priv *get_first_wmi_priv(void)
> +{
> +	guard(mutex)(&cd01_list_mutex);
> +	return list_first_entry_or_null(&cd01_wmi_list,
> +					struct lenovo_wmi_cd01_priv, list);
> +}
> +
> +int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
> +			     struct capability_data_01 *cap_data)
> +{
> +	u32 attribute_id = *(int *)&attr_id;
> +	struct lenovo_wmi_cd01_priv *priv;
> +	union acpi_object *ret_obj;

Rather than all the kfree() paths, could this done with a scoped 
automatic cleanup by using __free?
IE Similar to what you're doing with the mutexes.

You would need to adjust the declaration for the union to be within
the for loop though for this to work.

> +	int instance_idx;
> +	int count;
> +
> +	priv = get_first_wmi_priv();
> +	if (!priv)
> +		return -ENODEV;
> +
> +	guard(mutex)(&cd01_call_mutex);
> +	count = wmidev_instance_count(priv->wdev);
> +	pr_info("Got instance count: %u\n", count);

I don't think you want this to be info level.  Debug at most.

> +
> +	for (instance_idx = 0; instance_idx < count; instance_idx++) {
> +		ret_obj = wmidev_block_query(priv->wdev, instance_idx);
> +		if (!ret_obj) {
> +			pr_err("WMI Data block query failed.\n");
> +			continue;
> +		}
> +
> +		if (ret_obj->type != ACPI_TYPE_BUFFER) {
> +			pr_err("WMI Data block query returned wrong type.\n");
> +			kfree(ret_obj);
> +			continue;
> +		}
> +
> +		if (ret_obj->buffer.length != sizeof(*cap_data)) {
> +			pr_err("WMI Data block query returned wrong buffer length: %u vice expected %lu.\n",
> +			       ret_obj->buffer.length, sizeof(*cap_data));
> +			kfree(ret_obj);
> +			continue;
> +		}
> +
> +		memcpy(cap_data, ret_obj->buffer.pointer,
> +		       ret_obj->buffer.length);
> +		kfree(ret_obj);
> +
> +		if (cap_data->id != attribute_id)
> +			continue;
> +		break;
> +	}
> +
> +	if (cap_data->id != attribute_id) {
> +		pr_err("Unable to find capability data for attribute_id %x\n",
> +		       attribute_id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(lenovo_wmi_capdata01_get, "CAPDATA_WMI");
> +
> +static int lenovo_wmi_capdata01_probe(struct wmi_device *wdev,
> +				      const void *context)
> +
> +{
> +	struct lenovo_wmi_cd01_priv *priv;
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->wdev = wdev;
> +
> +	guard(mutex)(&cd01_list_mutex);
> +	list_add_tail(&priv->list, &cd01_wmi_list);
> +
> +	return 0;
> +}
> +
> +static void lenovo_wmi_capdata01_remove(struct wmi_device *wdev)
> +{
> +	struct lenovo_wmi_cd01_priv *priv = dev_get_drvdata(&wdev->dev);
> +
> +	guard(mutex)(&cd01_list_mutex);
> +	list_del(&priv->list);
> +}
> +
> +static struct wmi_driver lenovo_wmi_capdata01_driver = {
> +	.driver = { .name = "lenovo_wmi_capdata01" },
> +	.id_table = lenovo_wmi_capdata01_id_table,
> +	.probe = lenovo_wmi_capdata01_probe,
> +	.remove = lenovo_wmi_capdata01_remove,
> +};
> +
> +module_wmi_driver(lenovo_wmi_capdata01_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_capdata01_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86/lenovo-wmi.h
> index 8a302c6c47cb..53cea84a956b 100644
> --- a/drivers/platform/x86/lenovo-wmi.h
> +++ b/drivers/platform/x86/lenovo-wmi.h
> @@ -36,6 +36,22 @@ struct wmi_method_args {
>   	u32 arg1;
>   };
>   
> +struct lenovo_wmi_attr_id {
> +	u32 mode_id : 16; /* Fan profile */
> +	u32 feature_id : 8; /* Attribute (SPL/SPPT/...) */
> +	u32 device_id : 8; /* CPU/GPU/... */
> +} __packed;
> +
> +/* Data struct for LENOVO_CAPABILITY_DATA_01 */
> +struct capability_data_01 {
> +	u32 id;
> +	u32 supported;
> +	u32 default_value;
> +	u32 step;
> +	u32 min_value;
> +	u32 max_value;
> +};
> +
>   /* General Use functions */
>   static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev, u8 instance,
>   					 u32 method_id, struct acpi_buffer *in,
> @@ -102,4 +118,8 @@ int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 instance,
>   					       0, retval);
>   }
>   
> +/* LENOVO_CAPABILITY_DATA_01 exported functions */
> +int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
> +			     struct capability_data_01 *cap_data);
> +
>   #endif /* !_LENOVO_WMI_H_ */

