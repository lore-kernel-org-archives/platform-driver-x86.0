Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA1BA2D;
	Thu,  9 Jan 2025 22:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736462087; cv=none; b=ZwhO2WDERB+vi4RA7JZRvOmkKcfWNTZ7ya5YRHRHbYSxS3GVLb+iNeZPm6DdTMuaQe9+U7+Vk9X/QVU7yNqfaBHkIPlfZK9eqLpy59Rrxj2opxYIH9sI7IKUNnWREqbuw/dGSDMZL0xOpKInlFlpPwGxNVJs9swYgXCUe8lYhwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736462087; c=relaxed/simple;
	bh=ax5DhjzSp5vZCkGGK9lhS2+c+XQay6UEiwVc7FyL964=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BRpKz1XMcazED7w4KQQ0L7f86TKrzfL+L3IGrE6Q5/3PXrdLnhIvorS6lR/eTCP0UxUDuIm4dHd4eNRWr24PEx8viOnRRh6xudDapI4jIXfrl4jVd1ZDQSd1AVQjBPfaY2HZDbBkb7Yt8WIixmidtVxKaWRVTeF/OtNoYfsswbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=oGDWgyvK; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="oGDWgyvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736462076; x=1737066876; i=w_armin@gmx.de;
	bh=Q4fVMXrU1y1pBXI/QpEUa5jUIX3KRMCZW+u9Oa6r4lY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oGDWgyvKec+SQOPaAxpK96e3WTtS5vPYkYexUSJK0pV2oL8UL+4jQOFkhweWiymD
	 Kim6rd+01QucB5Z9dSvrff24bLu7rE/2W4hsmr7ffYbOek7oisJOpkkj0DQcCr7x7
	 WYxrw3uwmZInTNc7Tbub73U2IfX3g8lGoNFoCuULRLEpgEU4EAYs7mdW6DQRNKNL2
	 A8WGr7sRJUGlW7d0pWho1EXFtsf4/1c4PSQ6xmi6YdWAMEeyVfJEdBkNoY+rJJkf5
	 OrZDh5zd7RGAMTzI/jcALIiibqT3Q27fFlrK9A+NW2S1wldq4us3+rGmW9nHsVU/M
	 8oeYe9zO2wm6pcWLaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIx3I-1tqHmY1mEk-00XCqA; Thu, 09
 Jan 2025 23:34:36 +0100
Message-ID: <7ebb09b7-337d-4a9c-ba5c-bed874209fd4@gmx.de>
Date: Thu, 9 Jan 2025 23:34:34 +0100
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
Cc: Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-4-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250102004854.14874-4-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FilhQy7/hMbyxtCmrxdekma8zkjAKqBVXSIqRs7lM3MH6653N15
 CVOnBSR5I0ccTYH+ZeYYcLinH7j1UFaloyjkB/67lppHGgMz4htFj0gpzBP9im7tOhRJCxh
 P5fuH+6lKcydQyt1x0eC+2IqxLQUNNNakvsd0hJW7V9VyNMSk6i3AVliFPZZ64gRCOR3HPU
 6RSUjeChqwyticM3D50wA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qCmLZ0RtZCw=;NQP3B9v5APnDHmQ9YSFNx7dy9r+
 gvDYWo3Jx4SPjnpb4xqLwYGd13NFYlIighU7A1kDasNT1dypHF/6eM2d6lXOIcqztu3e/3JdF
 40JPTWfB6rUmwoPwWBMiZ+6QxppyUbdFh8A8mBtqOHQXX62bBTVcb1iyKnwIzuKg8v1omOcBs
 k+yQO5vtqg/zW4ZdFuVxnif3I6pNKyIthPIMOZcIEa9O/IGTSCHbfH/7qKCwLCVRzrVFroo62
 IWYkBwE6K07CYl7jIlqz92WovVIhbkpXWgq0Rjz+VvnVOGemPqevRY9F9qYz+954jvSczicDF
 xJ1QKxfKTMhcxXWhcmQ6os4a5mBpC87MqMzJ3DEMpjRCaMNPUrex0TdQsyWDp0OV929ThuJ/S
 ZElxdR/HjAViXl2L0MqcFCULNShV74zn/BZnHfU7wWNODlkR57kYKf9MB0mu3wDzk6FV6SBn7
 T7kfaCS/wa5Okq9JQM2SnBmFMW5+uXBND6bh8hNsHjWybOyiQJNNTuDE+pS20eN4q7kQNdPg/
 kzcBi9BYxO9aup7wFTP/Zr0ySx0sXsWVZkza9OEzp5Ffv4MA15IICgBQdIzZCZe0UIr0vR2mT
 MIEG0BeWjMGdVSc0T+4aqqaa5TGNdKyDAs9R7JmRurfzkUalCyjvUXvKCU5jXwY0snb+XsSFs
 iAA5X507wBClrJHZHCNRECmfZW5TT4BDdyy8hPtBgujbfVbDJHB6agnpNDpoxUI27NVYI2VvC
 qNASCivUHJ5xtdrCNcHG2z8GEVKhP4nLZsQeBCIuLmUARvxflKo9ndVwWaDyXWAd9t5fPyAdO
 n3vmEMHtRJXa6yWFsFxwVihiXNGU6+m2bJGGy/ugiJOPfU+0DkO0Rm8Moagg1D8fOp8p4xc1P
 RyCG8MBIDSuDIlG5oxsImNcqy/VYWklT9aVcn2UL68kj3jE725ehAH+bFs998NX36opIWUoCd
 ARsofg8i3xuzMvOkHc+5o0MUrc4xk0k01/KXyBduAMxx4Eni70isYODdeZcgxZZEQGWDXKu7e
 EG4QSprDZkq5YmMLBYkUFtgTX7ULoES6aomMLvSGF8kkvC8aMLwuzdjrqgQD6zX7/iPTx93OT
 k1UBq+mYYZsdE8BBOjzFgLZYDdRAIk

Am 02.01.25 um 01:47 schrieb Derek J. Clark:

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
> +	  Say Y here if you have a WMI aware Lenovo Legion device in the "Gami=
ng Series"
> +	  line of hardware. This interface is a dependency for exposing tunabl=
e power
> +	  settings.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo_wmi_capdata01.

Could it be that the resulting module will be called lenovo-wmi-capdata01?=
 Also if its a mere
dependency without any value when being used alone then it would make sens=
e to hide it from
users by removing the help texts:

	config LENOVO_WMI_DATA01
		tristate
		depends on ACPI_WMI

> +
>   config IDEAPAD_LAPTOP
>   	tristate "Lenovo IdeaPad Laptop Extras"
>   	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index 7cb29a480ed2..6c96cc3f3855 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_YOGABOOK)		+=3D lenovo-yogabook.o
>   obj-$(CONFIG_YT2_1380)		+=3D lenovo-yoga-tab2-pro-1380-fastcharger.o
>   obj-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D lenovo-wmi-camera.o
>   obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+=3D lenovo-wmi-gamezone.o
> +obj-$(CONFIG_LENOVO_WMI_DATA01)	+=3D lenovo-wmi-capdata01.o
>
>   # Intel
>   obj-y				+=3D intel/
> diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.c b/drivers/platf=
orm/x86/lenovo-wmi-capdata01.c
> new file mode 100644
> index 000000000000..b10a6e4b320f
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * LENOVO_CAPABILITY_DATA_01 WMI data block driver. This interface prov=
ides
> + * information on tunable attributes used by the "Other Method" WMI int=
erface,
> + * including if it is supported by the hardware, the default_value, max=
_value,
> + * min_value, and step increment.
> + *
> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/list.h>
> +#include "lenovo-wmi.h"
> +
> +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE0=
18154"
> +
> +static DEFINE_MUTEX(cd01_call_mutex);

Does the WMI interface really rely on such mutual exclusion of callers? If=
 no then
please remove this mutex.

> +static DEFINE_MUTEX(cd01_list_mutex);
> +static LIST_HEAD(cd01_wmi_list);
> +
> +static const struct wmi_device_id lenovo_wmi_capdata01_id_table[] =3D {
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

Two things:

1. This will cause issues should a WMI device in this list be removed whil=
e a
consumer is using it. In this case you will need extend the scope of the l=
ist mutex.

2. Do multiple capdata01 WMI devices exist in any systems? If no then plea=
se consider
using the component framework (https://docs.kernel.org/driver-api/componen=
t.html) which
will simplify the interop between the consumer driver of capdata01 and thi=
s driver.

> +}
> +
> +int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
> +			     struct capability_data_01 *cap_data)
> +{
> +	u32 attribute_id =3D *(int *)&attr_id;

This will cause alignment issues, please use FIELD_GET()/FIELD_PREP() to c=
onstruct a u32 to
pass to this function.

> +	struct lenovo_wmi_cd01_priv *priv;
> +	union acpi_object *ret_obj;
> +	int instance_idx;
> +	int count;
> +
> +	priv =3D get_first_wmi_priv();
> +	if (!priv)
> +		return -ENODEV;
> +
> +	guard(mutex)(&cd01_call_mutex);
> +	count =3D wmidev_instance_count(priv->wdev);
> +	pr_info("Got instance count: %u\n", count);
> +
> +	for (instance_idx =3D 0; instance_idx < count; instance_idx++) {
> +		ret_obj =3D wmidev_block_query(priv->wdev, instance_idx);
> +		if (!ret_obj) {
> +			pr_err("WMI Data block query failed.\n");
> +			continue;
> +		}
> +
> +		if (ret_obj->type !=3D ACPI_TYPE_BUFFER) {
> +			pr_err("WMI Data block query returned wrong type.\n");
> +			kfree(ret_obj);
> +			continue;
> +		}
> +
> +		if (ret_obj->buffer.length !=3D sizeof(*cap_data)) {
> +			pr_err("WMI Data block query returned wrong buffer length: %u vice e=
xpected %lu.\n",
> +			       ret_obj->buffer.length, sizeof(*cap_data));
> +			kfree(ret_obj);
> +			continue;
> +		}
> +
> +		memcpy(cap_data, ret_obj->buffer.pointer,
> +		       ret_obj->buffer.length);
> +		kfree(ret_obj);
> +
> +		if (cap_data->id !=3D attribute_id)
> +			continue;
> +		break;
> +	}

Maybe it would make sense to read this data during device initialization a=
nd store it
inside an array? This way looking up capability data would be _much_ faste=
r especially
since WMI calls are usually quite slow.

Also this function is way to noisy when it comes to error messages. Please=
 leave this
to the caller of this function.

> +
> +	if (cap_data->id !=3D attribute_id) {
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
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->wdev =3D wdev;
> +
> +	guard(mutex)(&cd01_list_mutex);
> +	list_add_tail(&priv->list, &cd01_wmi_list);
> +
> +	return 0;
> +}
> +
> +static void lenovo_wmi_capdata01_remove(struct wmi_device *wdev)
> +{
> +	struct lenovo_wmi_cd01_priv *priv =3D dev_get_drvdata(&wdev->dev);
> +
> +	guard(mutex)(&cd01_list_mutex);
> +	list_del(&priv->list);
> +}
> +
> +static struct wmi_driver lenovo_wmi_capdata01_driver =3D {
> +	.driver =3D { .name =3D "lenovo_wmi_capdata01" },

Please set ".probe_type =3D PROBE_PREFER_ASYNCHRONOUS".

> +	.id_table =3D lenovo_wmi_capdata01_id_table,
> +	.probe =3D lenovo_wmi_capdata01_probe,
> +	.remove =3D lenovo_wmi_capdata01_remove,

Please set ".no_singleton =3D true".

Thanks,
Armin Wolf

> +};
> +
> +module_wmi_driver(lenovo_wmi_capdata01_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_capdata01_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86/le=
novo-wmi.h
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
>   static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev, u8 i=
nstance,
>   					 u32 method_id, struct acpi_buffer *in,
> @@ -102,4 +118,8 @@ int lenovo_wmidev_evaluate_method_1(struct wmi_devic=
e *wdev, u8 instance,
>   					       0, retval);
>   }
>
> +/* LENOVO_CAPABILITY_DATA_01 exported functions */
> +int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
> +			     struct capability_data_01 *cap_data);
> +
>   #endif /* !_LENOVO_WMI_H_ */
