Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3179F7E1;
	Sat, 11 Jan 2025 00:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736553695; cv=none; b=lS/LVFFqq6ohuHwLzfxEERarWlA7XkYdZPB1MqZ9t0AQNu48lfhk5TYjvjuItra0MNLovsSkZu6HJoaDCgH2WxUNp4e/WXKzUh3tbaPax5mS2i+aqs4yOCrXOCZFAzC4Oi/b7OonkOhyckwKKs6TECpySaj15l1WG9fHENszXKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736553695; c=relaxed/simple;
	bh=Y9BfWuQriL7ALcM+x9ClP1LPlysYM4vP/ug8pPVGhyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fh44919MV6lSZErNYKJ/Blat8s3kyf1hiCryfbkw2GJdYDkvB60lb1vmhxQoJO9Zd8b9Hdg2gWNp/XqAYE4oeDSNLJNJ2NUCZ/+GRzq+AVg2HTjj6RKjxEJiVsfo2lN6fcm5Zl49yqoCsvVCXSgusLIBv9fJkKqYiXxASek4jfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ZIs7A3B6; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ZIs7A3B6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736553690; x=1737158490; i=w_armin@gmx.de;
	bh=1Krug0v491F/5PIVgwP8y7jms7gdxRwqD3IgZxgdStQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZIs7A3B6/A4ZPhck9F6U6iOnUY8hQdIpuGel1Ik1TQoZXVw/j215hJR7OqTzHz7d
	 UTxdVPPuX06Y7SEUbdgT6W6HnUEsfUHpy84kTjkJLQoBWl1e9bWMxZ3CZmkt5sw9+
	 ChBYvyecFX4LXbZJ14FLIAP8NiW6yDEcx3E5O6R13Vdj5kN9KQiEWzEglupdWGqgf
	 Sd6nIjOOXZY5mnmTSJpwTKogk1fe544l1x4T0pZDPO079NArrtvToXyWozlvCHKyt
	 GeIzbkdHvlqfMTiC6XC4GlH3BkYVkhs5ZnXViJE7jLYu0heWwjQiPYbcf/eBv97Up
	 FAZ6S5Zdg69eOzwcJA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3bSt-1tNmBt0HEx-011U3C; Sat, 11
 Jan 2025 01:01:30 +0100
Message-ID: <dbaed77b-7fc4-4133-9f03-3d50c93e8b13@gmx.de>
Date: Sat, 11 Jan 2025 01:01:28 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] platform/x86: Add Lenovo Capability Data 01 WMI
 Driver
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-4-derekjohn.clark@gmail.com>
 <7ebb09b7-337d-4a9c-ba5c-bed874209fd4@gmx.de>
 <CAFqHKT=Lx3LbDTY=1YEmn9OmhrkQOnvA5yuJbJi2_8-+N-y-Aw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAFqHKT=Lx3LbDTY=1YEmn9OmhrkQOnvA5yuJbJi2_8-+N-y-Aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RyGHUp6cVoHhsfOgwysyiu6nuPWEvPN0b4qje5DzBEEQoe84TGb
 TwCQ27lTSdciBRa20MJoxPlIUoyRzMHkVkM+Z9WK0JK0Wk2DENK9LsVMr3qi72BuKDDAWlA
 5rZUWfjhAcFT+pFHs+fgC/v+tkeg+H4/KXkHicgjl3VVSQ0OvsrAQ0cI0BFrnseNigiVT1p
 uhNZtvI+zB5WFOT+rJHUg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:y//5FqXAG2o=;zaVDweXslz5oh0+uEGL1ZgtJhTb
 p6NklyuFOqzCkJ39F+OjxhHlfI+E/6V6LGOFhwHzrN494UcpwgWlpzItMkq/CEcbOMsuRPd14
 tjl55xglsa4XRRrUUkts8czlocV99HalkCYL8ngY5VOd9++rIvI2AjLXbPetcrA0QuSMHUi5f
 LBX6A7/DPlWRX+3plWUpYLZVb0kdVXmknoFEwY6ebkvj5iMlW6LJ3UPnALOWGdWouHhSkZV0M
 w2PBC29j2GmJLh+iizyh5PDV4+CJpl5fpJeAbMHVctb7T9pg1qyTu5ufxl+4TcuZrdAgnJJtq
 d33ty9Gz7+UBa6qRN7uxxqgBYIzoKubINp0As1C3t2gS77gh8IUqkUSzGGYAdaH80ezp/87yC
 D9PH4+Ml7PJ3F4js39OiWsknTiL/gIz0lkTC9S6pkoXA8EBG7MB539veHPMVYBCAvqXz+utKX
 VuhJ5rs+L5y8iY3q5koDxPj2GjOTo+TWTSfLP8pxY0xVtQ3nZjSWD7IXWe/d9mRZe3LIiQ5CC
 X1kbOKWKOgpnw88TJEZ8w5F0Idg3p1eNZIYV+NoXDoAtFldRq7lYlzca4/GkizhXmeks0+pqM
 x2R7eNjYnIaqq9if3ISBsbl1tN4rOUV6DwNSyUEgSSPo12aUE3G6QId+VzB1KA2G1rdKe860T
 cOtjdBhAaaUxmSWItdCIYUs4SH+3GnAZnjjgIQvNueiCgrd3EdEQT04oh0LDpO59VEUEK9RIZ
 aZuBGZlqj6j/h265Tnp5eE0Q5iTdASJOu2iAlpTRWeVBKb9s4O1L+p7IP/yVc3iB3BQ1tRU7j
 9YH70qCMynYUwYd1Brjv/oxeNUgP+YhMqSoRvMXMNLfvAn+Z3AvlZcLniJNh7zDCXaI9Ug5He
 tdiFjJulW1NkYqUF9dn85YVVYcYdwVf5tjDz1DdOhr1AaKCNfcJcwcH9xfg4+eDSALae3zRxU
 GeNNwJmPbZrxEEkZlNhKbe8eGA47/QAxrDzVf5lYF8pHKhXlKg6kBhKe68POcu9B8/0D3RxZY
 FOCK9JNe250LVTCt/ZBcUbuLL28TgXKPhP+LlmNivnPsv1c/qtJpJRgQUGq7P4uRbQXTuW4+7
 bJ6Gutupt8ntckrvln110s6h4F7op6

Am 10.01.25 um 23:11 schrieb Derek John Clark:

> On Thu, Jan 9, 2025 at 2:35=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote=
:
>> Am 02.01.25 um 01:47 schrieb Derek J. Clark:
>>
>>> Adds lenovo-wmi-capdata01.c which provides a driver for the
>>> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Method"
>>> enabled hardware. Provides an interface for querying if a given
>>> attribute is supported by the hardware, as well as its default_value,
>>> max_value, min_value, and step increment.
>>>
>>> v2:
>>> - Use devm_kzalloc to ensure driver can be instanced, remove global
>>>     reference.
>>> - Ensure reverse Christmas tree for all variable declarations.
>>> - Remove extra whitespace.
>>> - Use guard(mutex) in all mutex instances, global mutex.
>>> - Use pr_fmt instead of adding the driver name to each pr_err.
>>> - Remove noisy pr_info usage.
>>> - Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv.
>>> - Use list to get the lenovo_wmi_cd01_priv instance in
>>>     lenovo_wmi_capdata01_get as none of the data provided by the macro=
s
>>>     that will use it can pass a member of the struct for use in
>>>     container_of.
>>>
>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> ---
>>>    MAINTAINERS                                 |   1 +
>>>    drivers/platform/x86/Kconfig                |  11 ++
>>>    drivers/platform/x86/Makefile               |   1 +
>>>    drivers/platform/x86/lenovo-wmi-capdata01.c | 131 +++++++++++++++++=
+++
>>>    drivers/platform/x86/lenovo-wmi.h           |  20 +++
>>>    5 files changed, 164 insertions(+)
>>>    create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 8f8a6aec6b92..c9374c395905 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -13038,6 +13038,7 @@ LENOVO WMI drivers
>>>    M:  Derek J. Clark <derekjohn.clark@gmail.com>
>>>    L:  platform-driver-x86@vger.kernel.org
>>>    S:  Maintained
>>> +F:   drivers/platform/x86/lenovo-wmi-capdata01.c
>>>    F:  drivers/platform/x86/lenovo-wmi-gamezone.c
>>>    F:  drivers/platform/x86/lenovo-wmi.h
>>>
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconf=
ig
>>> index 9a6ac7fdec9f..a2c1ab47ad9e 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -470,6 +470,17 @@ config LENOVO_WMI_GAMEZONE
>>>          To compile this driver as a module, choose M here: the module=
 will
>>>          be called lenovo_wmi_gamezone.
>>>
>>> +config LENOVO_WMI_DATA01
>>> +     tristate "Lenovo Legion WMI capability Data 01 Driver"
>>> +     depends on ACPI_WMI
>>> +     help
>>> +       Say Y here if you have a WMI aware Lenovo Legion device in the=
 "Gaming Series"
>>> +       line of hardware. This interface is a dependency for exposing =
tunable power
>>> +       settings.
>>> +
>>> +       To compile this driver as a module, choose M here: the module =
will
>>> +       be called lenovo_wmi_capdata01.
>> Could it be that the resulting module will be called lenovo-wmi-capdata=
01? Also if its a mere
>> dependency without any value when being used alone then it would make s=
ense to hide it from
>> users by removing the help texts:
>>
>>          config LENOVO_WMI_DATA01
>>                  tristate
>>                  depends on ACPI_WMI
>>
> Makes sense, Will do
>
>>> +
>>>    config IDEAPAD_LAPTOP
>>>        tristate "Lenovo IdeaPad Laptop Extras"
>>>        depends on ACPI
>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Make=
file
>>> index 7cb29a480ed2..6c96cc3f3855 100644
>>> --- a/drivers/platform/x86/Makefile
>>> +++ b/drivers/platform/x86/Makefile
>>> @@ -69,6 +69,7 @@ obj-$(CONFIG_YOGABOOK)              +=3D lenovo-yoga=
book.o
>>>    obj-$(CONFIG_YT2_1380)              +=3D lenovo-yoga-tab2-pro-1380-=
fastcharger.o
>>>    obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-camera.o
>>>    obj-$(CONFIG_LENOVO_WMI_GAMEZONE)   +=3D lenovo-wmi-gamezone.o
>>> +obj-$(CONFIG_LENOVO_WMI_DATA01)      +=3D lenovo-wmi-capdata01.o
>>>
>>>    # Intel
>>>    obj-y                               +=3D intel/
>>> diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.c b/drivers/pla=
tform/x86/lenovo-wmi-capdata01.c
>>> new file mode 100644
>>> index 000000000000..b10a6e4b320f
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
>>> @@ -0,0 +1,131 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * LENOVO_CAPABILITY_DATA_01 WMI data block driver. This interface pr=
ovides
>>> + * information on tunable attributes used by the "Other Method" WMI i=
nterface,
>>> + * including if it is supported by the hardware, the default_value, m=
ax_value,
>>> + * min_value, and step increment.
>>> + *
>>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
>>> + */
>>> +
>>> +#include <linux/list.h>
>>> +#include "lenovo-wmi.h"
>>> +
>>> +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3B=
E018154"
>>> +
>>> +static DEFINE_MUTEX(cd01_call_mutex);
>> Does the WMI interface really rely on such mutual exclusion of callers?=
 If no then
>> please remove this mutex.
>>
> As with the other drivers, will remove.
>
>>> +static DEFINE_MUTEX(cd01_list_mutex);
>>> +static LIST_HEAD(cd01_wmi_list);
>>> +
>>> +static const struct wmi_device_id lenovo_wmi_capdata01_id_table[] =3D=
 {
>>> +     { LENOVO_CAPABILITY_DATA_01_GUID, NULL },
>>> +     {}
>>> +};
>>> +
>>> +struct lenovo_wmi_cd01_priv {
>>> +     struct wmi_device *wdev;
>>> +     struct list_head list;
>>> +};
>>> +
>>> +static inline struct lenovo_wmi_cd01_priv *get_first_wmi_priv(void)
>>> +{
>>> +     guard(mutex)(&cd01_list_mutex);
>>> +     return list_first_entry_or_null(&cd01_wmi_list,
>>> +                                     struct lenovo_wmi_cd01_priv, lis=
t);
>> Two things:
>>
>> 1. This will cause issues should a WMI device in this list be removed w=
hile a
>> consumer is using it. In this case you will need extend the scope of th=
e list mutex.
>>
>> 2. Do multiple capdata01 WMI devices exist in any systems? If no then p=
lease consider
>> using the component framework (https://docs.kernel.org/driver-api/compo=
nent.html) which
>> will simplify the interop between the consumer driver of capdata01 and =
this driver.
>>
> I looked into this and struggled with it for a while, do you have any
> good examples I can reference?
> Will this allow me to pass struct lenovo_wmi_cd01_priv *priv to this
> function from the other mode driver? If so, should I avoid calling it
> priv since it will be accessible outside the driver?

You can use the i915 GSC proxy code as a reference.

For the component supplier (capdata01):

- use drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c as an example

1. Register a component with component_add().
2. Use the .bind callback inside struct component_ops to pass a pointer to=
 an array of capdata01 items to the component master.

For the component master (lenovo-wmi-other):

- use drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c as an example

1. Add a match function using component_match_add(). I suggest that you im=
plement a public function inside the capdata01 driver
which does the following (pseudo code):

	int lenovo_wmi_capdata01_match(struct device *dev, void *data)
	{
		return dev->driver =3D=3D &lenovo_wmi_capdata01_driver.driver;
	}
	EXPORT_SYMBOL_GPL(lenovo_wmi_capdata01_match);

This function can then be used to match against the component provided by =
lenovo-wmi-capdata01.

2. Add the component master using component_master_add_with_match(). Use t=
he .bind callback inside
struct component_master_ops to register the firmware attribute class devic=
e. You can use component_bind_all()
to pass a pointer to the bound components. In this case this pointer can b=
e used by the capdata01 driver
to pass an array of capdata01 items to you.

Keep in mind that you cannot use devres inside the .bind callbacks.

>>> +}
>>> +
>>> +int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
>>> +                          struct capability_data_01 *cap_data)
>>> +{
>>> +     u32 attribute_id =3D *(int *)&attr_id;
>> This will cause alignment issues, please use FIELD_GET()/FIELD_PREP() t=
o construct a u32 to
>> pass to this function.
>>
> Can do.
>
>>> +     struct lenovo_wmi_cd01_priv *priv;
>>> +     union acpi_object *ret_obj;
>>> +     int instance_idx;
>>> +     int count;
>>> +
>>> +     priv =3D get_first_wmi_priv();
>>> +     if (!priv)
>>> +             return -ENODEV;
>>> +
>>> +     guard(mutex)(&cd01_call_mutex);
>>> +     count =3D wmidev_instance_count(priv->wdev);
>>> +     pr_info("Got instance count: %u\n", count);
>>> +
>>> +     for (instance_idx =3D 0; instance_idx < count; instance_idx++) {
>>> +             ret_obj =3D wmidev_block_query(priv->wdev, instance_idx)=
;
>>> +             if (!ret_obj) {
>>> +                     pr_err("WMI Data block query failed.\n");
>>> +                     continue;
>>> +             }
>>> +
>>> +             if (ret_obj->type !=3D ACPI_TYPE_BUFFER) {
>>> +                     pr_err("WMI Data block query returned wrong type=
.\n");
>>> +                     kfree(ret_obj);
>>> +                     continue;
>>> +             }
>>> +
>>> +             if (ret_obj->buffer.length !=3D sizeof(*cap_data)) {
>>> +                     pr_err("WMI Data block query returned wrong buff=
er length: %u vice expected %lu.\n",
>>> +                            ret_obj->buffer.length, sizeof(*cap_data)=
);
>>> +                     kfree(ret_obj);
>>> +                     continue;
>>> +             }
>>> +
>>> +             memcpy(cap_data, ret_obj->buffer.pointer,
>>> +                    ret_obj->buffer.length);
>>> +             kfree(ret_obj);
>>> +
>>> +             if (cap_data->id !=3D attribute_id)
>>> +                     continue;
>>> +             break;
>>> +     }
>> Maybe it would make sense to read this data during device initializatio=
n and store it
>> inside an array? This way looking up capability data would be _much_ fa=
ster especially
>> since WMI calls are usually quite slow.
>>
> I was looking into this as I agree that would be preferable but wasn't
> able to get a working version. Since I don't know the array length at
> compile time I tried using krealloc_array after getting
> wmidev_instance_count to resize a capdata array stored in priv, but
> that would result in the driver crashing for some reason. I'll take
> another shot at it.

I suggest you use devm_kmalloc_array(), with the first argument being the =
return value of wmidev_instance_count().
The second parameter will be the size of a capdata01 structure.

Then you just need to fill-in the capdata01 structures using a for-loop.

>> Also this function is way to noisy when it comes to error messages. Ple=
ase leave this
>> to the caller of this function.
> Can do. If I don't get a ret_obj should I quit the loop here?

You can continue the loop in such a case, so that the other attributes are=
 still available to the lenovo-wmi-other driver.
However please print a warning message if you skip an instance so that use=
rs can find out why some attributes are missing.

Thanks,
Armin Wolf

>>> +
>>> +     if (cap_data->id !=3D attribute_id) {
>>> +             pr_err("Unable to find capability data for attribute_id =
%x\n",
>>> +                    attribute_id);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +EXPORT_SYMBOL_NS_GPL(lenovo_wmi_capdata01_get, "CAPDATA_WMI");
>>> +
>>> +static int lenovo_wmi_capdata01_probe(struct wmi_device *wdev,
>>> +                                   const void *context)
>>> +
>>> +{
>>> +     struct lenovo_wmi_cd01_priv *priv;
>>> +
>>> +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>>> +     if (!priv)
>>> +             return -ENOMEM;
>>> +
>>> +     priv->wdev =3D wdev;
>>> +
>>> +     guard(mutex)(&cd01_list_mutex);
>>> +     list_add_tail(&priv->list, &cd01_wmi_list);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void lenovo_wmi_capdata01_remove(struct wmi_device *wdev)
>>> +{
>>> +     struct lenovo_wmi_cd01_priv *priv =3D dev_get_drvdata(&wdev->dev=
);
>>> +
>>> +     guard(mutex)(&cd01_list_mutex);
>>> +     list_del(&priv->list);
>>> +}
>>> +
>>> +static struct wmi_driver lenovo_wmi_capdata01_driver =3D {
>>> +     .driver =3D { .name =3D "lenovo_wmi_capdata01" },
>> Please set ".probe_type =3D PROBE_PREFER_ASYNCHRONOUS".
>>
> Ack
>
>>> +     .id_table =3D lenovo_wmi_capdata01_id_table,
>>> +     .probe =3D lenovo_wmi_capdata01_probe,
>>> +     .remove =3D lenovo_wmi_capdata01_remove,
>> Please set ".no_singleton =3D true".
>>
> Ack
>
> Thanks,
> Derek
>
>> Thanks,
>> Armin Wolf
>>
>>> +};
>>> +
>>> +module_wmi_driver(lenovo_wmi_capdata01_driver);
>>> +
>>> +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_capdata01_id_table);
>>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>>> +MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86/=
lenovo-wmi.h
>>> index 8a302c6c47cb..53cea84a956b 100644
>>> --- a/drivers/platform/x86/lenovo-wmi.h
>>> +++ b/drivers/platform/x86/lenovo-wmi.h
>>> @@ -36,6 +36,22 @@ struct wmi_method_args {
>>>        u32 arg1;
>>>    };
>>>
>>> +struct lenovo_wmi_attr_id {
>>> +     u32 mode_id : 16; /* Fan profile */
>>> +     u32 feature_id : 8; /* Attribute (SPL/SPPT/...) */
>>> +     u32 device_id : 8; /* CPU/GPU/... */
>>> +} __packed;
>>> +
>>> +/* Data struct for LENOVO_CAPABILITY_DATA_01 */
>>> +struct capability_data_01 {
>>> +     u32 id;
>>> +     u32 supported;
>>> +     u32 default_value;
>>> +     u32 step;
>>> +     u32 min_value;
>>> +     u32 max_value;
>>> +};
>>> +
>>>    /* General Use functions */
>>>    static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev, u=
8 instance,
>>>                                         u32 method_id, struct acpi_buf=
fer *in,
>>> @@ -102,4 +118,8 @@ int lenovo_wmidev_evaluate_method_1(struct wmi_dev=
ice *wdev, u8 instance,
>>>                                               0, retval);
>>>    }
>>>
>>> +/* LENOVO_CAPABILITY_DATA_01 exported functions */
>>> +int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
>>> +                          struct capability_data_01 *cap_data);
>>> +
>>>    #endif /* !_LENOVO_WMI_H_ */
