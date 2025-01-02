Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA39D528;
	Thu,  2 Jan 2025 18:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735843351; cv=none; b=oEob4xVhRoEEFQBfY64b+mcimjlKrfOaalFBC8aLyr7lLucuWYD4qxPLdTy1GJFIxRfohThZk+IJr5kHMYs9JpV8V2eQkhBSKqWGB3JYOsMrvt1LJix7u9XZnoCQcdDZIP5yTXzZYr4651YyExeDflTWljW2aeRxRGbCRUsBbAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735843351; c=relaxed/simple;
	bh=qNIQ1KjzzXW7IdFOLLB0P03LFiCGtSxj93FH0agfGsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P++FQ33X8obk9F8VSCW0PpmNKlsdxqk43Mw478/CHR32ka3gkoxc1r9VcIH1WYEq3i+AbN/8KvjRxY+I73SbbdtwdIEeSEtXFpw3vQr8+4Q67mLQI/QGxnSt0bArIwTXiIm7Rs9bYjC/QopjpffPwpxMz0AcFGqRR+X40u7rtfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/1ADroT; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/1ADroT"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b6ea711805so1307271685a.1;
        Thu, 02 Jan 2025 10:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735843349; x=1736448149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIj7UIjRRRLA7PFUpk5JsFKkELGWVJ+10y6Oi62BQ8s=;
        b=U/1ADroT3Yy0ioR5h2itRwtFONJs4r56LVstHB+cxSsEPcZYD0ZklGKslagZSho0fL
         UOQIyL5C03KXCpUDsFQ2EFSXbJjuyeEXk7Q2dSHLFjtx4Cy9V63zUwkoyp130dxD0aO6
         a3L+CGuGWZjNxGE17Mekdx0mFpwE4eeN4RCuyPfDvGxhH6llz98dptGyo/4KFALyNa/W
         ZhVHUmjOLmigRwDsSGuTr16Sw3foYb2q4wD9lWeF7Osb0uY6Pw9T8/vGKeTl9D3k5CYf
         98lqW5QZ+NDE9e5NuskpGex+7L0/wCH6Awv2vAV13f2SxfIEXVN1awH1D0JpENycwitM
         pvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735843349; x=1736448149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIj7UIjRRRLA7PFUpk5JsFKkELGWVJ+10y6Oi62BQ8s=;
        b=iLdd2yHlyRjQczoTy1g8BB91Z0mNVabtNkA7NQX522emtTCPmZiLURr+Tfue0vFaoy
         DF/kQls7Ss0sWl7XsuxoCahEjQSkc5SkDJdoUvivy97He/9a56HBsoVOi5yTjcktrhfU
         fUK3flDNjgt3mangBxn17HuF9+95rihH56u4yu7nyJTOFlJYmbAvenzIPyYEaB7ukX7Q
         HPpgUqecgur/lxbEOJOCOi2eXxIR19+6MJjIzUB8rSV+phdz8Lo1LgYqla8DfLAd01EQ
         2Pt1ogtrU8ndI5oOuXQ08XKwx/mFnEzNLSWWAwM9suX82tlGfWDa90FSi3PHXE+WDIbs
         3mrA==
X-Forwarded-Encrypted: i=1; AJvYcCUXRIiigiNl95AXD+TrCLeLfY6rXPBE9foStpZS9elHQ/Om18fun9bQSdSN8bEWWJhSmHgQfjkzhiWBJobPY5noCY33Gg==@vger.kernel.org, AJvYcCVXYY8Cc/olQfDRQVaG1JwVyWhlQYq6pooXujiYTMeUWTQO/J0+gJNeXHugpgrhIcUNEgZhoHI8sF8fKgSp@vger.kernel.org, AJvYcCXsYexGh4nNBbMjJLB+bfqzlqYnBgYZcyeeLwlQdCGrl9rRWRsYVslCzsSxAzftYqhr7RlzxZHDGrw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiDbmmV8TOfKdmiCMTlsfCv0MpaWJkPTTByvxh8WIVc4Mm+zRS
	aXZxk9Zg9ALKn9fqUvbe78QPi2b0eMHRTauaKovF89e+wi7qYlhb/9sLrk8WQaCwIr+cb+s1eWn
	AWbhmdx/0577nxNc8nRJmuxAACNA=
X-Gm-Gg: ASbGncu91u7VwUaBx/mvx2Vt0xQ2VS6oklqrCIY3PNqE8KSTgR6RhbeItPWcBvZRqYx
	AvZQs4k7FUZ8wH9lUkE8XwgRo5/zY16XMZdZ8/HM=
X-Google-Smtp-Source: AGHT+IHEj4gxLUcDXpltFFgDiha1SLAwGwJSwR5wd9vMTVLk8kEUuxF8KdkG8f4bPI2/+dLcR/K+lcC+LQNUPubkASw=
X-Received: by 2002:a05:620a:1a91:b0:7b6:dc4f:887c with SMTP id
 af79cd13be357-7b9ba853127mr6756460185a.57.1735843348812; Thu, 02 Jan 2025
 10:42:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-4-derekjohn.clark@gmail.com> <d086937b-a6d8-493d-82f6-4f19609e63cb@kernel.org>
In-Reply-To: <d086937b-a6d8-493d-82f6-4f19609e63cb@kernel.org>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 2 Jan 2025 10:42:18 -0800
Message-ID: <CAFqHKTkj04Anq=ceYg1RWvzpwNkP5RtyNVtzUn+XZ59ioYdRPw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] platform/x86: Add Lenovo Capability Data 01 WMI Driver
To: Mario Limonciello <superm1@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
	Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H . Chiu" <codyit@gmail.com>, 
	John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 1, 2025 at 7:44=E2=80=AFPM Mario Limonciello <superm1@kernel.or=
g> wrote:
>
>
>
> On 1/1/25 18:47, Derek J. Clark wrote:
> > Adds lenovo-wmi-capdata01.c which provides a driver for the
> > LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Method"
> > enabled hardware. Provides an interface for querying if a given
> > attribute is supported by the hardware, as well as its default_value,
> > max_value, min_value, and step increment.
> >
> > v2:
> > - Use devm_kzalloc to ensure driver can be instanced, remove global
> >    reference.
> > - Ensure reverse Christmas tree for all variable declarations.
> > - Remove extra whitespace.
> > - Use guard(mutex) in all mutex instances, global mutex.
> > - Use pr_fmt instead of adding the driver name to each pr_err.
> > - Remove noisy pr_info usage.
> > - Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv.
> > - Use list to get the lenovo_wmi_cd01_priv instance in
> >    lenovo_wmi_capdata01_get as none of the data provided by the macros
> >    that will use it can pass a member of the struct for use in
> >    container_of.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> >   MAINTAINERS                                 |   1 +
> >   drivers/platform/x86/Kconfig                |  11 ++
> >   drivers/platform/x86/Makefile               |   1 +
> >   drivers/platform/x86/lenovo-wmi-capdata01.c | 131 +++++++++++++++++++=
+
> >   drivers/platform/x86/lenovo-wmi.h           |  20 +++
> >   5 files changed, 164 insertions(+)
> >   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8f8a6aec6b92..c9374c395905 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13038,6 +13038,7 @@ LENOVO WMI drivers
> >   M:  Derek J. Clark <derekjohn.clark@gmail.com>
> >   L:  platform-driver-x86@vger.kernel.org
> >   S:  Maintained
> > +F:   drivers/platform/x86/lenovo-wmi-capdata01.c
> >   F:  drivers/platform/x86/lenovo-wmi-gamezone.c
> >   F:  drivers/platform/x86/lenovo-wmi.h
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
> > index 9a6ac7fdec9f..a2c1ab47ad9e 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -470,6 +470,17 @@ config LENOVO_WMI_GAMEZONE
> >         To compile this driver as a module, choose M here: the module w=
ill
> >         be called lenovo_wmi_gamezone.
> >
> > +config LENOVO_WMI_DATA01
> > +     tristate "Lenovo Legion WMI capability Data 01 Driver"
> > +     depends on ACPI_WMI
> > +     help
> > +       Say Y here if you have a WMI aware Lenovo Legion device in the =
"Gaming Series"
> > +       line of hardware. This interface is a dependency for exposing t=
unable power
> > +       settings.
> > +
> > +       To compile this driver as a module, choose M here: the module w=
ill
> > +       be called lenovo_wmi_capdata01.
> > +
> >   config IDEAPAD_LAPTOP
> >       tristate "Lenovo IdeaPad Laptop Extras"
> >       depends on ACPI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
> > index 7cb29a480ed2..6c96cc3f3855 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -69,6 +69,7 @@ obj-$(CONFIG_YOGABOOK)              +=3D lenovo-yogab=
ook.o
> >   obj-$(CONFIG_YT2_1380)              +=3D lenovo-yoga-tab2-pro-1380-fa=
stcharger.o
> >   obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-camera.o
> >   obj-$(CONFIG_LENOVO_WMI_GAMEZONE)   +=3D lenovo-wmi-gamezone.o
> > +obj-$(CONFIG_LENOVO_WMI_DATA01)      +=3D lenovo-wmi-capdata01.o
> >
> >   # Intel
> >   obj-y                               +=3D intel/
> > diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.c b/drivers/plat=
form/x86/lenovo-wmi-capdata01.c
> > new file mode 100644
> > index 000000000000..b10a6e4b320f
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
> > @@ -0,0 +1,131 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * LENOVO_CAPABILITY_DATA_01 WMI data block driver. This interface pro=
vides
> > + * information on tunable attributes used by the "Other Method" WMI in=
terface,
> > + * including if it is supported by the hardware, the default_value, ma=
x_value,
> > + * min_value, and step increment.
> > + *
> > + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> > + */
> > +
> > +#include <linux/list.h>
> > +#include "lenovo-wmi.h"
> > +
> > +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE=
018154"
> > +
> > +static DEFINE_MUTEX(cd01_call_mutex);
> > +static DEFINE_MUTEX(cd01_list_mutex);
> > +static LIST_HEAD(cd01_wmi_list);
> > +
> > +static const struct wmi_device_id lenovo_wmi_capdata01_id_table[] =3D =
{
> > +     { LENOVO_CAPABILITY_DATA_01_GUID, NULL },
> > +     {}
> > +};
> > +
> > +struct lenovo_wmi_cd01_priv {
> > +     struct wmi_device *wdev;
> > +     struct list_head list;
> > +};
> > +
> > +static inline struct lenovo_wmi_cd01_priv *get_first_wmi_priv(void)
> > +{
> > +     guard(mutex)(&cd01_list_mutex);
> > +     return list_first_entry_or_null(&cd01_wmi_list,
> > +                                     struct lenovo_wmi_cd01_priv, list=
);
> > +}
> > +
> > +int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
> > +                          struct capability_data_01 *cap_data)
> > +{
> > +     u32 attribute_id =3D *(int *)&attr_id;
> > +     struct lenovo_wmi_cd01_priv *priv;
> > +     union acpi_object *ret_obj;
>
> Rather than all the kfree() paths, could this done with a scoped
> automatic cleanup by using __free?
> IE Similar to what you're doing with the mutexes.
>
> You would need to adjust the declaration for the union to be within
> the for loop though for this to work.

Interesting, I'll look into it. Thanks.

> > +     int instance_idx;
> > +     int count;
> > +
> > +     priv =3D get_first_wmi_priv();
> > +     if (!priv)
> > +             return -ENODEV;
> > +
> > +     guard(mutex)(&cd01_call_mutex);
> > +     count =3D wmidev_instance_count(priv->wdev);
> > +     pr_info("Got instance count: %u\n", count);
>
> I don't think you want this to be info level.  Debug at most.
>

Seems I accidentally dropped some changes from my cleanup pass. Will fix.

> > +
> > +     for (instance_idx =3D 0; instance_idx < count; instance_idx++) {
> > +             ret_obj =3D wmidev_block_query(priv->wdev, instance_idx);
> > +             if (!ret_obj) {
> > +                     pr_err("WMI Data block query failed.\n");
> > +                     continue;
> > +             }
> > +
> > +             if (ret_obj->type !=3D ACPI_TYPE_BUFFER) {
> > +                     pr_err("WMI Data block query returned wrong type.=
\n");
> > +                     kfree(ret_obj);
> > +                     continue;
> > +             }
> > +
> > +             if (ret_obj->buffer.length !=3D sizeof(*cap_data)) {
> > +                     pr_err("WMI Data block query returned wrong buffe=
r length: %u vice expected %lu.\n",
> > +                            ret_obj->buffer.length, sizeof(*cap_data))=
;
> > +                     kfree(ret_obj);
> > +                     continue;
> > +             }
> > +
> > +             memcpy(cap_data, ret_obj->buffer.pointer,
> > +                    ret_obj->buffer.length);
> > +             kfree(ret_obj);
> > +
> > +             if (cap_data->id !=3D attribute_id)
> > +                     continue;
> > +             break;
> > +     }
> > +
> > +     if (cap_data->id !=3D attribute_id) {
> > +             pr_err("Unable to find capability data for attribute_id %=
x\n",
> > +                    attribute_id);
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(lenovo_wmi_capdata01_get, "CAPDATA_WMI");
> > +
> > +static int lenovo_wmi_capdata01_probe(struct wmi_device *wdev,
> > +                                   const void *context)
> > +
> > +{
> > +     struct lenovo_wmi_cd01_priv *priv;
> > +
> > +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->wdev =3D wdev;
> > +
> > +     guard(mutex)(&cd01_list_mutex);
> > +     list_add_tail(&priv->list, &cd01_wmi_list);
> > +
> > +     return 0;
> > +}
> > +
> > +static void lenovo_wmi_capdata01_remove(struct wmi_device *wdev)
> > +{
> > +     struct lenovo_wmi_cd01_priv *priv =3D dev_get_drvdata(&wdev->dev)=
;
> > +
> > +     guard(mutex)(&cd01_list_mutex);
> > +     list_del(&priv->list);
> > +}
> > +
> > +static struct wmi_driver lenovo_wmi_capdata01_driver =3D {
> > +     .driver =3D { .name =3D "lenovo_wmi_capdata01" },
> > +     .id_table =3D lenovo_wmi_capdata01_id_table,
> > +     .probe =3D lenovo_wmi_capdata01_probe,
> > +     .remove =3D lenovo_wmi_capdata01_remove,
> > +};
> > +
> > +module_wmi_driver(lenovo_wmi_capdata01_driver);
> > +
> > +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_capdata01_id_table);
> > +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > +MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86/l=
enovo-wmi.h
> > index 8a302c6c47cb..53cea84a956b 100644
> > --- a/drivers/platform/x86/lenovo-wmi.h
> > +++ b/drivers/platform/x86/lenovo-wmi.h
> > @@ -36,6 +36,22 @@ struct wmi_method_args {
> >       u32 arg1;
> >   };
> >
> > +struct lenovo_wmi_attr_id {
> > +     u32 mode_id : 16; /* Fan profile */
> > +     u32 feature_id : 8; /* Attribute (SPL/SPPT/...) */
> > +     u32 device_id : 8; /* CPU/GPU/... */
> > +} __packed;
> > +
> > +/* Data struct for LENOVO_CAPABILITY_DATA_01 */
> > +struct capability_data_01 {
> > +     u32 id;
> > +     u32 supported;
> > +     u32 default_value;
> > +     u32 step;
> > +     u32 min_value;
> > +     u32 max_value;
> > +};
> > +
> >   /* General Use functions */
> >   static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev, u8 =
instance,
> >                                        u32 method_id, struct acpi_buffe=
r *in,
> > @@ -102,4 +118,8 @@ int lenovo_wmidev_evaluate_method_1(struct wmi_devi=
ce *wdev, u8 instance,
> >                                              0, retval);
> >   }
> >
> > +/* LENOVO_CAPABILITY_DATA_01 exported functions */
> > +int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
> > +                          struct capability_data_01 *cap_data);
> > +
> >   #endif /* !_LENOVO_WMI_H_ */
>
