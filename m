Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AD2213E84;
	Fri, 10 Jan 2025 22:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736547080; cv=none; b=FJ1NFlj4apf08ccgeb4uLLPKXa9j+W+Pe0d+X3b/2yjozr+oWihBvQNLIwiReBPY5BO0OOHRixax3q+TaJpQDgy/YgaJnhLt8p/DWB9fyeP6pQ0aguc8C1AuOGH/O6EWlP61JeGzm2DjqILut6cB9G/7Ae2v/pfBF4fAcphBI9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736547080; c=relaxed/simple;
	bh=syTqK8umJqQeTKRbtSNmuWi80l1dxHGMTRF06U9pq0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=em0KmrB+m/XJ12GT7fCnVrrGfEHzhFlJe7bU9E3tiM4aRnlyy7uxMq8FWmSEqUid7l4ejh6txOhtc8SzwfMzwlXxnx67fLIibs4ueeSnVw2nI6CjhYB6L2V1pqB3loi+x147U2F1kRNR1Y9uAV36nUYoochvGWPjrQ7aWNozZfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fU/su+bh; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fU/su+bh"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d8fa32d3d6so31299166d6.2;
        Fri, 10 Jan 2025 14:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736547077; x=1737151877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8d7mL60/9ae/t6MIPlthD0cmdA0DYmThHS6BUmO3vE=;
        b=fU/su+bhvhdONsKYucIHpTFZmEHqs30oKjRZA5RCl84Bici+G9aoGzbFSGSmqWe8xa
         0hVmfqr1NX8u8fdY1QRJ11P/kvu7wXMoa4EKs7mDM2b4piAH//mNyRout/FbwMdDw9r4
         BK3JozTRi09XkAgftDV7G5UDwTWoSITRO//9jk4GqnQGVjvSU5hJhso/lyB6CANccJdd
         g8LU/2hlLtpMASTyoquRPSexxATfvahrxr67UeqibdnkhikO9Fm3VOfd4Yt7xXIr0YVP
         KkOD+0sJogWubZ5XWK+NlMmepA9utpHYfJsMVRC4I7wAYpootzdN8NDVBPIV7tEX8xzy
         TyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736547077; x=1737151877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8d7mL60/9ae/t6MIPlthD0cmdA0DYmThHS6BUmO3vE=;
        b=aGJwkjiKzTTfWJBxgrkWPx/Osy0TxcZPd89h5AFE9h+HeIboS9b98mkRRKxEPcLM0N
         F3G1ex5OrCTP4e2JKsI8y6y4cgW1Kl0aKRPGp4DaFtK/YDN6reAOGvUyOOAx/GpPLw+a
         jRQF5t56vYDANycIn45+ShH7/dH3DSRjr6tLXMurDwAZNDw/wcCuAYkThxVl2gbaXIb5
         FFzAjRsNwRDT/rgisiSVbaSF8FzF07iz9Nc+bpXpXlfJogGncqquvt/gRb7vYhmCXEyw
         nw3sTCuz1a3y9RPc/zZxcrYawhx4heIbO/xDPcJJNBODR8Fao7+xccgd/nIUVByNFPTp
         jhpg==
X-Forwarded-Encrypted: i=1; AJvYcCV8GBO9ciFDKmEdOGUDLIPckYvRiWDWLG73/XMww0U84iRyw2y4wykoFITsMBAq30hLlhgShxdmrJ4JUntl@vger.kernel.org, AJvYcCXE6gH4yd5SqiuhKHCiYlA7ENwtklI7939R2MO8su8EIBGppGkxFbLDBmG4tKwu6CcYlxSn7NxCzTU=@vger.kernel.org, AJvYcCXderl3BBQi2O2YBd+qIPN1Hn2C3BSkx5ZMfV9IJadGfsdLdOGvEH3DdNbNnjrgtHdGLpHT9vWlMAE4fVA4ZXHwMyIoEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBWD+TBUVYG9Z8J55ilDeZLAHmsATAOQ2vTyT9xCL/8yn2oiAb
	7ZEUmDaIwx/9I4aByImcjEJ9iQppR/Y24sJnZFSuiCyNoAEj3ZF7KA0roawYeXnMOwoNsfgUm9F
	mpro5Xx/1zIat0m1A66Tpin+2rMw=
X-Gm-Gg: ASbGncsKqyGgTlbep4Hujks8hp+VJZAaVrXqD/TfHE0+FSmaL6oPfY6Gy0CwTgozo++
	SnirS9kmpvwzzSRbrYOQ0Of/dYU7pnlWkIwoQU0U=
X-Google-Smtp-Source: AGHT+IHbLJ4eGQydNzn9692+/2umlSfb/j0d7d7i2tSk7HVSzouYJVw3J8p7zHmKjCSrKMaYNzGltDmeF83fXmuyU1w=
X-Received: by 2002:a05:6214:daf:b0:6df:9771:978e with SMTP id
 6a1803df08f44-6df9b2ff13amr142909006d6.34.1736547076546; Fri, 10 Jan 2025
 14:11:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-4-derekjohn.clark@gmail.com> <7ebb09b7-337d-4a9c-ba5c-bed874209fd4@gmx.de>
In-Reply-To: <7ebb09b7-337d-4a9c-ba5c-bed874209fd4@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Fri, 10 Jan 2025 14:11:05 -0800
X-Gm-Features: AbW1kvak3yDg4MrMpBbD2u6YRoCMN7IZ3JN5vUZfqIAfXe_571SLumM7fWymlS8
Message-ID: <CAFqHKT=Lx3LbDTY=1YEmn9OmhrkQOnvA5yuJbJi2_8-+N-y-Aw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] platform/x86: Add Lenovo Capability Data 01 WMI Driver
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>, 
	Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H . Chiu" <codyit@gmail.com>, 
	John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 2:35=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 02.01.25 um 01:47 schrieb Derek J. Clark:
>
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
>
> Could it be that the resulting module will be called lenovo-wmi-capdata01=
? Also if its a mere
> dependency without any value when being used alone then it would make sen=
se to hide it from
> users by removing the help texts:
>
>         config LENOVO_WMI_DATA01
>                 tristate
>                 depends on ACPI_WMI
>

Makes sense, Will do

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
>
> Does the WMI interface really rely on such mutual exclusion of callers? I=
f no then
> please remove this mutex.
>

As with the other drivers, will remove.

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
>
> Two things:
>
> 1. This will cause issues should a WMI device in this list be removed whi=
le a
> consumer is using it. In this case you will need extend the scope of the =
list mutex.
>
> 2. Do multiple capdata01 WMI devices exist in any systems? If no then ple=
ase consider
> using the component framework (https://docs.kernel.org/driver-api/compone=
nt.html) which
> will simplify the interop between the consumer driver of capdata01 and th=
is driver.
>

I looked into this and struggled with it for a while, do you have any
good examples I can reference?
Will this allow me to pass struct lenovo_wmi_cd01_priv *priv to this
function from the other mode driver? If so, should I avoid calling it
priv since it will be accessible outside the driver?

> > +}
> > +
> > +int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
> > +                          struct capability_data_01 *cap_data)
> > +{
> > +     u32 attribute_id =3D *(int *)&attr_id;
>
> This will cause alignment issues, please use FIELD_GET()/FIELD_PREP() to =
construct a u32 to
> pass to this function.
>

Can do.

> > +     struct lenovo_wmi_cd01_priv *priv;
> > +     union acpi_object *ret_obj;
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
>
> Maybe it would make sense to read this data during device initialization =
and store it
> inside an array? This way looking up capability data would be _much_ fast=
er especially
> since WMI calls are usually quite slow.
>

I was looking into this as I agree that would be preferable but wasn't
able to get a working version. Since I don't know the array length at
compile time I tried using krealloc_array after getting
wmidev_instance_count to resize a capdata array stored in priv, but
that would result in the driver crashing for some reason. I'll take
another shot at it.

> Also this function is way to noisy when it comes to error messages. Pleas=
e leave this
> to the caller of this function.

Can do. If I don't get a ret_obj should I quit the loop here?

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
>
> Please set ".probe_type =3D PROBE_PREFER_ASYNCHRONOUS".
>

Ack

> > +     .id_table =3D lenovo_wmi_capdata01_id_table,
> > +     .probe =3D lenovo_wmi_capdata01_probe,
> > +     .remove =3D lenovo_wmi_capdata01_remove,
>
> Please set ".no_singleton =3D true".
>

Ack

Thanks,
Derek

> Thanks,
> Armin Wolf
>
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
