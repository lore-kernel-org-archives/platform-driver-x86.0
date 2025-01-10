Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61AB2135DF;
	Fri, 10 Jan 2025 22:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736548433; cv=none; b=ac0ZJiRH8RrGAwGXm1VgEgWSE7M+gOGro5BhlEDN82/RLDygUToly8Mq2xZgTZ9uWl1LCV3umbrN+dL0CFpr6pHPr0oxvqG7tndmqwkIl9VM761/IngklRatT6Ax6Rnwp79ZC1/JN3FJ6qvxTb1Gc/OZcij3HzUco4b0EMnoauU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736548433; c=relaxed/simple;
	bh=49E6ZrqALUedT9+USldA18t4dx/TXa0PGJnoh8EuzlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEh4IMbJuDWxJEGWWm5ZKyMGrY4RNvrGrHB10mk5oi2QPUvXpF88NiM4yuH0ZwvQuk45qjUhV37KA0Rh9xxrlx7eeUPFq6Ky+0m2Yg2M7K9N0v28b4QwTmFxq3GkD1e8WdmsKxuKd4hDAW1YlIn2pqAE2n8wbdpH84jLWBB1SUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WN3Qd+oA; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WN3Qd+oA"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d8ece4937fso19987606d6.2;
        Fri, 10 Jan 2025 14:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736548430; x=1737153230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaDVotKJBe8ZBrqhrvF8Sv2vCNlUwog7bmZh9vrExCo=;
        b=WN3Qd+oAZvHejLafbZOfZGYNSEdVHj0lnaqZvUAGtQizD4O4U63v2pC0B/wh4UWzoz
         s+QqIv3qBuJ/Elvv0aeKr0icIyWHysA58y8WPMkR2O9/1BtisXRQqYvTRhwyvYKmU8I0
         Q2zLP/LN7NY9u//3rZ3MX2yFN60VJPNrYiNrzd9dLMb4nLWhqDj6/IUfQsizYVZjC5LV
         Wr4B6QSu+WFqJ3gmvS8jt5wjw/TGLH7mqzteofs4ahj9QffGYnrX5iu3ABj6GOydVJwq
         tJJk8ZVn+HIzRCKW0fzxC9G2rtXBMsvqC0HDrKOV0kg23xYJzODXigUtI6JpCXXmhsTD
         06eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736548430; x=1737153230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaDVotKJBe8ZBrqhrvF8Sv2vCNlUwog7bmZh9vrExCo=;
        b=uaXbYC8mjZZXH9CT/bWmsxEeQxpUyT8GOK8ZIQ9uwK+GfNCLt4F83hCPDeFb1y7Byb
         UbJRy60LFkv0mBQEtIDWU/lMjkl+2E0j/RnIHV2DG9N+XFt5WfX5jXpJVGGUlc4DuIja
         d7fxUyvnRFag4Ar7ljdeHyUI+k+5auDI60ol2tUuM2iDfTibpi1GaQzOBg8Mw31F+uVI
         T72k0Jlmj2rbGERm+udC+d+73RQJUvQi5bTBCeAN0OREX1kaeHz2k3ryYVuBbjzmBfSG
         17l93+ZDPv/jh+ZGK120Io2bJHYoGTq9HjlI61xPD3ZaX8Z5uHIA/k05mURU2jpWiNsc
         wOUw==
X-Forwarded-Encrypted: i=1; AJvYcCX8ESzPuXs525aIrgQD4oy7fKGM2cicE9XFmrEzTfS/cDHcVUnWgI3x6oIneEPqSjocwz+ywnJKA0Y=@vger.kernel.org, AJvYcCXC1ZFo4eqm+Wwxef2DWxpepgOj+L5z1Kqb7powsY9j20zyAABrRCltWA3Fl1LtrXS1ed54cR6fwxpMrLSHAVmHPRLSjQ==@vger.kernel.org, AJvYcCXOoiXcZyjo4oST/XEytSokfCxTd1DkYoSrOhyI3oRd9UlPYJX+h70MU4Y28J8U7aI4BYAknrsTRm/0uk6u@vger.kernel.org
X-Gm-Message-State: AOJu0YzGYlZRDMcRzOSLFY+ivB7vKm1yrKXwec6fKAzwBuOS1au1a+FS
	4m/0zXudxLxls2GOcj8QM95tLizB4vyZE3Dul8bEnCIyM/aNN9ZfiywhjXWYVZfIrHmOKGFwIEO
	FQCTj5ViwLV1mXnx9gPTl7TFKtYE=
X-Gm-Gg: ASbGnctyZSvm+sv2eaquft4atJ4HYEKbtiPnDsg/kWrp0MPTCIzkd80XkNTHoL+Gl9U
	JvFCf6TFzPPwFNnLZK7Br/nOyU8GG/7GCGTZCBeI=
X-Google-Smtp-Source: AGHT+IH5MeymZ6N1RqFFlpz3+kUiSu7JWd9wow8jBoXZLvXpQ4BqNYZ3baPnMwtupmDg+NG97HtrGoFvyp5URpJGPCU=
X-Received: by 2002:a05:6214:53c6:b0:6d4:586:6291 with SMTP id
 6a1803df08f44-6df9b232c31mr215303416d6.25.1736548429469; Fri, 10 Jan 2025
 14:33:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-5-derekjohn.clark@gmail.com> <333019ec-524d-4933-aa6e-459cd1f7b10f@gmx.de>
In-Reply-To: <333019ec-524d-4933-aa6e-459cd1f7b10f@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Fri, 10 Jan 2025 14:33:38 -0800
X-Gm-Features: AbW1kvZjN2Pk3LFaJmd8NqgZSU5-YcAaq3b0DnlDiG8I09oH1D7VUnWfcTXLdVc
Message-ID: <CAFqHKTnM6Bs6AdPFisRZ1d3yFx_eFZap4Y-42=kSth9VSoAU0A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] platform/x86: Add Lenovo Other Mode WMI Driver
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

On Thu, Jan 9, 2025 at 3:00=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 02.01.25 um 01:47 schrieb Derek J. Clark:
>
> > Adds lenovo-wmi-other.c which provides a driver for the Lenovo
> > "Other Mode" WMI interface that comes on some Lenovo "Gaming
> > Series" hardware. Provides a firmware-attributes class which
> > enables the use of tunable knobs for SPL, SPPT, and FPPT.
> >
> > v2:
> > - Use devm_kzalloc to ensure driver can be instanced, remove global
> >    reference.
> > - Ensure reverse Christmas tree for all variable declarations.
> > - Remove extra whitespace.
> > - Use guard(mutex) in all mutex instances, global mutex.
> > - Use pr_fmt instead of adding the driver name to each pr_err.
> > - Remove noisy pr_info usage.
> > - Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv.
> > - Use list to get the lenovo_wmi_om_priv instance in some macro
> >    called functions as the data provided by the macros that use it
> >    doesn't pass a member of the struct for use in container_of.
> > - Do not rely on GameZone interface to grab the current fan mode.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> >   MAINTAINERS                             |   1 +
> >   drivers/platform/x86/Kconfig            |  12 +
> >   drivers/platform/x86/Makefile           |   1 +
> >   drivers/platform/x86/lenovo-wmi-other.c | 385 +++++++++++++++++++++++=
+
> >   drivers/platform/x86/lenovo-wmi.h       | 116 +++++++
> >   5 files changed, 515 insertions(+)
> >   create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c9374c395905..318e1e517eed 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13040,6 +13040,7 @@ L:    platform-driver-x86@vger.kernel.org
> >   S:  Maintained
> >   F:  drivers/platform/x86/lenovo-wmi-capdata01.c
> >   F:  drivers/platform/x86/lenovo-wmi-gamezone.c
> > +F:   drivers/platform/x86/lenovo-wmi-other.c
> >   F:  drivers/platform/x86/lenovo-wmi.h
> >
> >   LETSKETCH HID TABLET DRIVER
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
> > index a2c1ab47ad9e..e2285ab987c5 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -481,6 +481,18 @@ config LENOVO_WMI_DATA01
> >         To compile this driver as a module, choose M here: the module w=
ill
> >         be called lenovo_wmi_capdata01.
> >
> > +config LENOVO_WMI_TUNING
> > +     tristate "Lenovo Other Method WMI Driver"
> > +     depends on LENOVO_WMI_DATA01
>
> I think we should use "select LENOVO_WMI_DATA01" here. Ideally CONFIG_LEN=
OVO_WMI_DATA01
> will automatically be enabled/disabled if users enable/disable CONFIG_LEN=
OVO_WMI_TUNING.
>

Makes sense with the other change. Will do.

> > +     select FW_ATTR_CLASS
> > +     help
> > +       Say Y here if you have a WMI aware Lenovo Legion device and wou=
ld like to use the
> > +       firmware_attributes API to control various tunable settings typ=
ically exposed by
> > +       Lenovo software in Windows.
> > +
> > +       To compile this driver as a module, choose M here: the module w=
ill
> > +       be called lenovo_wmi_other.
>
> Check the module name again.
>
> > +
> >   config IDEAPAD_LAPTOP
> >       tristate "Lenovo IdeaPad Laptop Extras"
> >       depends on ACPI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
> > index 6c96cc3f3855..3e059b3c3647 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -70,6 +70,7 @@ obj-$(CONFIG_YT2_1380)              +=3D lenovo-yoga-=
tab2-pro-1380-fastcharger.o
> >   obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-camera.o
> >   obj-$(CONFIG_LENOVO_WMI_GAMEZONE)   +=3D lenovo-wmi-gamezone.o
> >   obj-$(CONFIG_LENOVO_WMI_DATA01)     +=3D lenovo-wmi-capdata01.o
> > +obj-$(CONFIG_LENOVO_WMI_TUNING)      +=3D lenovo-wmi-other.o
> >
> >   # Intel
> >   obj-y                               +=3D intel/
> > diff --git a/drivers/platform/x86/lenovo-wmi-other.c b/drivers/platform=
/x86/lenovo-wmi-other.c
> > new file mode 100644
> > index 000000000000..2392faa74973
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-other.c
> > @@ -0,0 +1,385 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Lenovo Other Method WMI interface driver. This driver uses the fw_a=
ttributes
> > + * class to expose the various WMI functions provided by the "Other Me=
thod" WMI
> > + * interface. This enables CPU and GPU power limit as well as various =
other
> > + * attributes for devices that fall under the "Gaming Series" of Lenov=
o laptop
> > + * devices. Each attribute exposed by the "Other Method"" interface ha=
s a
> > + * corresponding LENOVO_CAPABILITY_DATA_01 struct that allows the driv=
er to
> > + * probe details about the attribute such as set/get support, step, mi=
n, max,
> > + * and default value. Each attibute has multiple pages, one for each o=
f the
> > + * fan profiles managed by the GameZone interface, so it must be probe=
d prior
> > + * to returning the current_value.
> > + *
> > + * These attributes typically don't fit anywhere else in the sysfs and=
 are set
> > + * in Windows using one of Lenovo's multiple user applications.
> > + *
> > + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> > + */
> > +
> > +#include <linux/list.h>
> > +#include "lenovo-wmi.h"
> > +#include "firmware_attributes_class.h"
> > +
> > +#define FW_ATTR_FOLDER "lenovo-wmi-other"
> > +#define LENOVO_OTHER_METHOD_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B=
"
> > +
> > +/* Device IDs */
> > +#define WMI_DEVICE_ID_CPU 0x01
> > +
> > +/* WMI_DEVICE_ID_CPU feature IDs */
> > +#define WMI_FEATURE_ID_CPU_SPPT 0x01 /* Short Term Power Limit */
> > +#define WMI_FEATURE_ID_CPU_FPPT 0x03 /* Long Term Power Limit */
> > +#define WMI_FEATURE_ID_CPU_SPL 0x02 /* Peak Power Limit */
> > +#define WMI_FEATURE_ID_CPU_FPPT_BAD 0x03 /* Long Term Power Limit */
> > +
> > +/* Method IDs */
> > +#define WMI_METHOD_ID_VALUE_GET 17 /* Other Method Getter */
> > +#define WMI_METHOD_ID_VALUE_SET 18 /* Other Method Setter */
> > +
> > +static DEFINE_MUTEX(call_mutex);
>
> Is this mutex really necessary? If not then remove it please.
>

Same as other drivers, will remove.

> > +static DEFINE_MUTEX(om_list_mutex);
> > +static LIST_HEAD(om_wmi_list);
> > +
> > +struct lenovo_wmi_om_priv {
> > +     struct wmi_device *wdev;
> > +     struct device *fw_attr_dev;
> > +     struct kset *fw_attr_kset;
> > +     struct list_head list;
> > +};
> > +
> > +static inline struct lenovo_wmi_om_priv *get_first_wmi_priv(void)
> > +{
> > +     guard(mutex)(&om_list_mutex);
> > +     return list_first_entry_or_null(&om_wmi_list, struct lenovo_wmi_o=
m_priv,
> > +                                     list);
> > +}
> > +
> > +static const struct wmi_device_id lenovo_wmi_other_id_table[] =3D {
> > +     { LENOVO_OTHER_METHOD_GUID, NULL },
> > +     {}
> > +};
>
> Please move the list of device ids closer to the driver struct.
>

Will do.

> > +
> > +/* Tunable Attributes */
> > +struct tunable_attr_01 ppt_pl1_spl =3D { .device_id =3D WMI_DEVICE_ID_=
CPU,
> > +                                    .feature_id =3D WMI_FEATURE_ID_CPU=
_SPL };
> > +struct tunable_attr_01 ppt_pl2_sppt =3D { .device_id =3D WMI_DEVICE_ID=
_CPU,
> > +                                     .feature_id =3D WMI_FEATURE_ID_CP=
U_SPPT };
> > +struct tunable_attr_01 ppt_pl3_fppt =3D { .device_id =3D WMI_DEVICE_ID=
_CPU,
> > +                                     .feature_id =3D WMI_FEATURE_ID_CP=
U_FPPT };
> > +
> > +struct capdata01_attr_group {
> > +     const struct attribute_group *attr_group;
> > +     struct tunable_attr_01 *tunable_attr;
>
> Would it make sense to do something similar with each attribute, so that =
each attribute
> can use container_of() to access lenovo_wmi_om_priv without having to use=
 a list lookup?
>
> This would of course mean that each attribute as to be allocated dynamica=
lly.
>
> Heep in mind that we are currently working on a new API for registering f=
irmware-atrtibute class
> devices which should fix this.
>

I'm not sure I understand what you mean exactly. I think what you're
saying is, instead of an attr_group, allocate each attribute as a
struct in priv?

> > +};
> > +
> > +static const struct class *fw_attr_class;
> > +
> > +/**
> > + * attr_capdata01_setup() - Get the data of the specified attribute
> > + * from LENOVO_CAPABILITY_DATA_01 and store it.
> > + * @tunable_attr: The attribute to be populated.
> > + *
> > + * Returns: Either 0 or an error.
> > + */
> > +static int attr_capdata01_setup(struct tunable_attr_01 *tunable_attr)
> > +{
> > +     struct capability_data_01 cap_data;
> > +     int mode =3D SMARTFAN_MODE_CUSTOM;
> > +     int err;
> > +
> > +     struct lenovo_wmi_attr_id attr_id =3D { mode << 8,
> > +                                           tunable_attr->feature_id,
> > +                                           tunable_attr->device_id };
>
> Please use FIELD_GET()/FIELD_PREP() here.
>

Can do.

> > +
> > +     err =3D lenovo_wmi_capdata01_get(attr_id, &cap_data);
> > +     if (err) {
> > +             pr_err("Failed to get capability data: %u\n", err);
> > +             return err;
> > +     }
> > +
> > +     if (cap_data.supported < 1)
> > +             return -EOPNOTSUPP;
> > +
> > +     tunable_attr->capdata =3D cap_data;
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * attr_capdata01_show() - Get the value of the specified attribute pr=
operty
> > + * from LENOVO_CAPABILITY_DATA_01.
> > + * @kobj: Pointer to the driver object.
> > + * @kobj_attribute: Pointer to the attribute calling this function.
> > + * @buf: The buffer to write to.
> > + * @tunable_attr: The attribute to be read.
> > + * @prop: The property of this attribute to be read.
> > + *
> > + * This function is intended to be generic so it can be called from an=
y "_show"
> > + * attribute which works only with integers.
> > + *
> > + * If the WMI is success, then the sysfs attribute is notified.
> > + *
> > + * Returns: Either count, or an error.
> > + */
> > +ssize_t attr_capdata01_show(struct kobject *kobj, struct kobj_attribut=
e *attr,
> > +                         char *buf, struct tunable_attr_01 *tunable_at=
tr,
> > +                         enum attribute_property prop)
> > +{
> > +     struct capability_data_01 cap_data;
> > +     int retval;
> > +
> > +     cap_data =3D tunable_attr->capdata;
> > +
> > +     switch (prop) {
> > +     case DEFAULT_VAL:
> > +             retval =3D cap_data.default_value;
> > +             break;
> > +     case MAX_VAL:
> > +             retval =3D cap_data.max_value;
> > +             break;
> > +     case MIN_VAL:
> > +             retval =3D cap_data.min_value;
> > +             break;
> > +     case STEP_VAL:
> > +             retval =3D cap_data.step;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +     return sysfs_emit(buf, "%u\n", retval);
> > +}
> > +
> > +/* Simple attribute creation */
> > +
> > +/*
> > + * att_current_value_store() - Set the current value of the given attr=
ibute
> > + * @kobj: Pointer to the driver object.
> > + * @kobj_attribute: Pointer to the attribute calling this function.
> > + * @buf: The buffer to read from, this is parsed to `int` type.
> > + * @count: Required by sysfs attribute macros, pass in from the callee=
 attr.
> > + * @tunable_attr: The attribute to be stored.
> > + *
> > + * This function is intended to be generic so it can be called from an=
y
> > + * attribute's "current_value_store" which works only with integers. T=
he
> > + * integer to be sent to the WMI method is range checked and an error =
returned
> > + * if out of range.
> > + *
> > + * If the value is valid and WMI is success, then the sysfs attribute =
is
> > + * notified.
> > + *
> > + * Returns: Either count, or an error.
> > + */
> > +ssize_t attr_current_value_store(struct kobject *kobj,
> > +                              struct kobj_attribute *attr, const char =
*buf,
> > +                              size_t count,
> > +                              struct tunable_attr_01 *tunable_attr)
> > +{
> > +     struct capability_data_01 cap_data;
> > +     struct lenovo_wmi_om_priv *priv;
> > +     int mode =3D SMARTFAN_MODE_CUSTOM;
> > +     u32 value;
> > +     int err;
> > +
> > +     struct lenovo_wmi_attr_id attr_id =3D { mode << 8,
> > +                                           tunable_attr->feature_id,
> > +                                           tunable_attr->device_id };
> > +
> > +     err =3D kstrtouint(buf, 10, &value);
> > +     if (err) {
> > +             pr_err("Error converting value to int: %u\n", err);
> > +             return err;
> > +     }
> > +
> > +     cap_data =3D tunable_attr->capdata;
> > +
> > +     if (value < cap_data.min_value || value > cap_data.max_value)
> > +             return -EINVAL;
> > +
> > +     priv =3D get_first_wmi_priv();
> > +     if (!priv)
> > +             return -ENODEV;
> > +
> > +     guard(mutex)(&call_mutex);
> > +     err =3D lenovo_wmidev_evaluate_method_2(priv->wdev, 0x0,
> > +                                           WMI_METHOD_ID_VALUE_SET,
> > +                                           *(int *)&attr_id, value, NU=
LL);
> > +
> > +     if (err) {
> > +             pr_err("Error setting attribute: %u\n", err);
>
> This error message is unnecessary, please drop it.
>

Ack

> > +             return err;
> > +     }
> > +
> > +     tunable_attr->store_value =3D value;
>
> Is this value used anywhere? If no then please drop it.
>
It isn't, will do.
> > +
> > +     sysfs_notify(kobj, NULL, attr->attr.name);
>
> AFAIK this is unnecessary since userspace already expects the attribute v=
alue to
> change after an write access. This is only meant to be used should the va=
lue be
> changed by for example the underlying hardware without user intervention.
>

I can drop this too.

> > +
> > +     return count;
> > +};
> > +
> > +/*
> > + * attr_current_value_show() - Get the current value of the given attr=
ibute
> > + * @kobj: Pointer to the driver object.
> > + * @kobj_attribute: Pointer to the attribute calling this function.
> > + * @buf: The buffer to write to.
> > + * @tunable_attr: The attribute to be read.
> > + *
> > + * This function is intended to be generic so it can be called from an=
y "_show"
> > + * attribute which works only with integers.
> > + *
> > + * If the WMI is success, then the sysfs attribute is notified.
> > + *
> > + * Returns: Either count, or an error.
> > + */
> > +ssize_t attr_current_value_show(struct kobject *kobj,
> > +                             struct kobj_attribute *attr, char *buf,
> > +                             struct tunable_attr_01 *tunable_attr)
> > +{
> > +     struct lenovo_wmi_om_priv *priv;
> > +     int mode =3D SMARTFAN_MODE_CUSTOM;
> > +     int retval;
> > +     int err;
> > +
> > +     struct lenovo_wmi_attr_id attr_id =3D { mode << 8,
> > +                                           tunable_attr->feature_id,
> > +                                           tunable_attr->device_id };
> > +
> > +     priv =3D get_first_wmi_priv();
> > +     if (!priv)
> > +             return -ENODEV;
> > +
> > +     guard(mutex)(&call_mutex);
> > +     err =3D lenovo_wmidev_evaluate_method_1(priv->wdev, 0x0,
> > +                                           WMI_METHOD_ID_VALUE_GET,
> > +                                           *(int *)&attr_id, &retval);
> > +
> > +     if (err) {
> > +             pr_err("Error getting attribute: %u\n", err);
> > +             return err;
> > +     }
> > +
> > +     return sysfs_emit(buf, "%u\n", retval);
> > +}
> > +
> > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
> > +                         "Set the CPU sustained power limit");
> > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
> > +                         "Set the CPU slow package power tracking limi=
t");
> > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
> > +                         "Set the CPU fast package power tracking limi=
t");
> > +
> > +static const struct capdata01_attr_group capdata01_attr_groups[] =3D {
> > +     { &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
> > +     { &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
> > +     { &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
> > +     {},
> > +};
> > +
> > +static int other_method_fw_attr_add(struct lenovo_wmi_om_priv *priv)
> > +{
> > +     int err, i;
> > +
> > +     err =3D fw_attributes_class_get(&fw_attr_class);
> > +     if (err) {
> > +             pr_err("Failed to get firmware_attributes_class: %u\n", e=
rr);
> > +             return err;
> > +     }
> > +
> > +     priv->fw_attr_dev =3D device_create(fw_attr_class, NULL, MKDEV(0,=
 0),
> > +                                       NULL, "%s", FW_ATTR_FOLDER);
> > +     if (IS_ERR(priv->fw_attr_dev)) {
> > +             err =3D PTR_ERR(priv->fw_attr_dev);
> > +             pr_err("Failed to create firmware_attributes_class device=
: %u\n",
> > +                    err);
> > +             goto fail_class_get;
> > +     }
> > +
> > +     priv->fw_attr_kset =3D kset_create_and_add("attributes", NULL,
> > +                                              &priv->fw_attr_dev->kobj=
);
> > +     if (!priv->fw_attr_kset) {
> > +             err =3D -ENOMEM;
> > +             pr_err("Failed to create firmware_attributes_class kset: =
%u\n",
> > +                    err);
> > +             goto err_destroy_classdev;
> > +     }
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(capdata01_attr_groups) - 1; i++) {
> > +             err =3D attr_capdata01_setup(
> > +                     capdata01_attr_groups[i].tunable_attr);
> > +             if (err) {
> > +                     pr_err("Failed to populate capability data for %s=
: %u\n",
> > +                            capdata01_attr_groups[i].attr_group->name,=
 err);
> > +                     continue;
> > +             }
> > +
> > +             err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> > +                                      capdata01_attr_groups[i].attr_gr=
oup);
>
> AFAIK there exists sysfs_create_groups(). Together with the *_is_visible =
callbacks this
> should simplify this part of your code a lot.
>

Part of this code is caching the capability data so it doesn't need to
be called after probe. If I can get the cached list working in that
driver I can drop storing it here and use _is_visible as a macro
component.

> > +             if (err) {
> > +                     pr_err("Failed to create sysfs-group for %s: %u\n=
",
> > +                            capdata01_attr_groups[i].attr_group->name,=
 err);
> > +                     goto err_remove_groups;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +
> > +err_remove_groups:
> > +     while (i-- > 0) {
> > +             sysfs_remove_group(&priv->fw_attr_kset->kobj,
> > +                                capdata01_attr_groups[i].attr_group);
> > +     }
> > +
> > +     return err;
>
> Please remove this return statement, since the other resources need to be=
 cleaned up too.

Agree. Ilpo noted these as well.

> Also where do you clean up the kset?

I'll add it here.

> > +
> > +err_destroy_classdev:
> > +     device_destroy(fw_attr_class, MKDEV(0, 0));
>
> Please use device_unregister() instead.
>

Ack

> > +
> > +     return err;
> ...
> > +
> > +fail_class_get:
> > +     fw_attributes_class_put();
> > +
> > +     return err;
> > +}
> > +
> > +static int lenovo_wmi_other_probe(struct wmi_device *wdev, const void =
*context)
> > +{
> > +     struct lenovo_wmi_om_priv *priv;
> > +
> > +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->wdev =3D wdev;
>
> Missing dev_set_drvdata().
>

Ack

> > +
> > +     guard(mutex)(&om_list_mutex);
> > +     list_add_tail(&priv->list, &om_wmi_list);
> > +
> > +     return other_method_fw_attr_add(priv);
> > +}
> > +
> > +static void lenovo_wmi_other_remove(struct wmi_device *wdev)
> > +{
> > +     struct lenovo_wmi_om_priv *priv =3D dev_get_drvdata(&wdev->dev);
> > +
> > +     guard(mutex)(&om_list_mutex);
> > +     list_del(&priv->list);
> > +     kset_unregister(priv->fw_attr_kset);
> > +     device_destroy(fw_attr_class, MKDEV(0, 0));
> > +     fw_attributes_class_put();
> > +}
> > +
> > +static struct wmi_driver lenovo_wmi_other_driver =3D {
> > +     .driver =3D { .name =3D "lenovo_wmi_other" },
>
> .probe_type =3D PROBE_PREFER_ASYNCHRONOUS
>

Ack

> > +     .id_table =3D lenovo_wmi_other_id_table,
> > +     .probe =3D lenovo_wmi_other_probe,
> > +     .remove =3D lenovo_wmi_other_remove,
>
> .no_singleton =3D true
>

Ack

> In this case please make sure that the name of the firmware-attributes cl=
ass device is unique.
> You can use an IDA (https://docs.kernel.org/core-api/idr.html) for this.

Will do, thanks.

> > +};
> > +
> > +module_wmi_driver(lenovo_wmi_other_driver);
> > +
> > +MODULE_IMPORT_NS("CAPDATA_WMI");
> > +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_other_id_table);
> > +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > +MODULE_DESCRIPTION("Lenovo Other Method WMI Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86/l=
enovo-wmi.h
> > index 53cea84a956b..1c8358551ba6 100644
> > --- a/drivers/platform/x86/lenovo-wmi.h
> > +++ b/drivers/platform/x86/lenovo-wmi.h
> > @@ -42,6 +42,14 @@ struct lenovo_wmi_attr_id {
> >       u32 device_id : 8; /* CPU/GPU/... */
> >   } __packed;
> >
> > +enum attribute_property {
> > +     DEFAULT_VAL,
> > +     MAX_VAL,
> > +     MIN_VAL,
> > +     STEP_VAL,
> > +     SUPPORTED,
> > +};
> > +
> >   /* Data struct for LENOVO_CAPABILITY_DATA_01 */
> >   struct capability_data_01 {
> >       u32 id;
> > @@ -52,6 +60,14 @@ struct capability_data_01 {
> >       u32 max_value;
> >   };
> >
> > +/* Tunable attribute that uses LENOVO_CAPABILITY_DATA_01 */
> > +struct tunable_attr_01 {
> > +     struct capability_data_01 capdata;
> > +     u32 device_id;
> > +     u32 feature_id;
> > +     u32 store_value;
> > +};
> > +
> >   /* General Use functions */
> >   static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev, u8 =
instance,
> >                                        u32 method_id, struct acpi_buffe=
r *in,
> > @@ -122,4 +138,104 @@ int lenovo_wmidev_evaluate_method_1(struct wmi_de=
vice *wdev, u8 instance,
> >   int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
> >                            struct capability_data_01 *cap_data);
> >
> > +/* Other Method attribute functions */
> > +ssize_t attr_capdata01_show(struct kobject *kobj, struct kobj_attribut=
e *attr,
> > +                         char *buf, struct tunable_attr_01 *tunable_at=
tr,
> > +                         enum attribute_property prop);
> > +
> > +ssize_t attr_current_value_store(struct kobject *kobj,
> > +                              struct kobj_attribute *attr, const char =
*buf,
> > +                              size_t count,
> > +                              struct tunable_attr_01 *tunable_attr);
> > +
> > +ssize_t attr_current_value_show(struct kobject *kobj,
> > +                             struct kobj_attribute *attr, char *buf,
> > +                             struct tunable_attr_01 *tunable_attr);
> > +
> > +ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *att=
r,
> > +                   char *buf);
> > +
> > +ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *att=
r,
> > +                   char *buf)
> > +{
> > +     return sysfs_emit(buf, "integer\n");
> > +}
> > +
> > +/* Other Method attribute macros */
> > +#define __LL_ATTR_RO(_func, _name)                                    =
\
> > +     {                                                             \
> > +             .attr =3D { .name =3D __stringify(_name), .mode =3D 0444 =
}, \
> > +             .show =3D _func##_##_name##_show,                       \
> > +     }
> > +
> > +#define __LL_ATTR_RO_AS(_name, _show)                                 =
\
> > +     {                                                             \
> > +             .attr =3D { .name =3D __stringify(_name), .mode =3D 0444 =
}, \
> > +             .show =3D _show,                                        \
> > +     }
> > +
> > +#define __LL_ATTR_RW(_func, _name) \
> > +     __ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_sto=
re)
> > +
> > +/* Shows a formatted static variable */
> > +#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)                 =
        \
> > +     static ssize_t _attrname##_##_prop##_show(                       =
     \
> > +             struct kobject *kobj, struct kobj_attribute *attr, char *=
buf) \
> > +     {                                                                =
     \
> > +             return sysfs_emit(buf, _fmt, _val);                      =
     \
> > +     }                                                                =
     \
> > +     static struct kobj_attribute attr_##_attrname##_##_prop =3D      =
       \
> > +             __LL_ATTR_RO(_attrname, _prop)
> > +
> > +/* Attribute current_value show/store */
> > +#define __LL_TUNABLE_RW_CAP01(_attrname)                              =
        \
> > +     static ssize_t _attrname##_current_value_store(                  =
     \
> > +             struct kobject *kobj, struct kobj_attribute *attr,       =
     \
> > +             const char *buf, size_t count)                           =
     \
> > +     {                                                                =
     \
> > +             return attr_current_value_store(kobj, attr, buf, count,  =
     \
> > +                                             &_attrname);             =
     \
> > +     }                                                                =
     \
> > +     static ssize_t _attrname##_current_value_show(                   =
     \
> > +             struct kobject *kobj, struct kobj_attribute *attr, char *=
buf) \
> > +     {                                                                =
     \
> > +             return attr_current_value_show(kobj, attr, buf, &_attrnam=
e);  \
> > +     }                                                                =
     \
> > +     static struct kobj_attribute attr_##_attrname##_current_value =3D=
       \
> > +             __LL_ATTR_RW(_attrname, current_value)
> > +
> > +/* Attribute property show only */
> > +#define __LL_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)           =
        \
> > +     static ssize_t _attrname##_##_prop##_show(                       =
     \
> > +             struct kobject *kobj, struct kobj_attribute *attr, char *=
buf) \
> > +     {                                                                =
     \
> > +             return attr_capdata01_show(kobj, attr, buf, &_attrname,  =
     \
> > +                                        _prop_type);                  =
     \
> > +     }                                                                =
     \
> > +     static struct kobj_attribute attr_##_attrname##_##_prop =3D      =
       \
> > +             __LL_ATTR_RO(_attrname, _prop)
> > +
> > +#define ATTR_GROUP_LL_TUNABLE_CAP01(_attrname, _fsname, _dispname)    =
 \
> > +     __LL_TUNABLE_RW_CAP01(_attrname);                              \
> > +     __LL_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);  \
> > +     __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);   \
> > +     __LL_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);          \
> > +     __LL_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);          \
> > +     __LL_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);  \
> > +     static struct kobj_attribute attr_##_attrname##_type =3D         =
\
> > +             __LL_ATTR_RO_AS(type, int_type_show);                  \
> > +     static struct attribute *_attrname##_attrs[] =3D {               =
\
> > +             &attr_##_attrname##_current_value.attr,                \
> > +             &attr_##_attrname##_default_value.attr,                \
> > +             &attr_##_attrname##_display_name.attr,                 \
> > +             &attr_##_attrname##_max_value.attr,                    \
> > +             &attr_##_attrname##_min_value.attr,                    \
> > +             &attr_##_attrname##_scalar_increment.attr,             \
> > +             &attr_##_attrname##_type.attr,                         \
> > +             NULL,                                                  \
> > +     };                                                             \
> > +     static const struct attribute_group _attrname##_attr_group =3D { =
\
> > +             .name =3D _fsname, .attrs =3D _attrname##_attrs          =
  \
> > +     }
>
> Is there a reason why this needs to be put inside the header? If no then =
please put this
> inside the driver.

To clarify, you mean the macros? I was under the impression they
belonged in headers but I can move them. I will move some of the
enums/structs as well which are referenced here and the driver only.

> Thanks,
> Armin Wolf
>
> > +
> >   #endif /* !_LENOVO_WMI_H_ */
