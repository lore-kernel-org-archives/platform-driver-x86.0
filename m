Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B3E1F76A8;
	Tue,  7 Jan 2025 23:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736294117; cv=none; b=oohfcbfm9OSUCf7tYxp3GnodQAIGXFss+hBqi5A54Pc8rVwFXXjq8gKLtjpbu7qpww3AiT6KwIgkn9FInMqLRVWIX9GDk+MdJ1wMrkJ3WsLgPqyFDK1kZ/pUEEVG0Ni2DOPNBC1iLitrU25Jam7SBT1bXEdjQ/geO2i+58Mv2MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736294117; c=relaxed/simple;
	bh=uMtUYAqxQDgqpIc/Hjz3UnsxXnf+BM8qGUJeZ1cHS/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArB8F2dJqtzftC0YZUrmwCiVvN0DOGpmB8uGsfcjCtYYt2d2oIgFyFd/y8xl77n1Ku5dCSPb+XMBG1tPOq7rUKNpzj+31/UHTMBtparJ+Whu9nASQG/lVYr416KbOUJLToOKZg8Swx/AyLhhBotWLZ1eTAaTrQj+jbFxiQdtRto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UU4H+Ev3; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UU4H+Ev3"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso123111286d6.0;
        Tue, 07 Jan 2025 15:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736294113; x=1736898913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afxiL3/8NT1GSMrJFZTMQ6QXDG8WcVzRxjsk157gtUc=;
        b=UU4H+Ev3DYgZgV2Ay5PiqNIntWMbzBhToJ+MMsQ92eiba4b9GHur7s94Ch29UB12oV
         4y+/oyNBa2IaWLR8nMcIoDyeQjIio+nMIhOTrNvuuj/Kh8YH52iHgC+S/CK0nuBLTJxT
         2FsvXK2FhUPw4SixpPGyX/OpzeJtanTwhxbS6LVUSkMdKvnyJ9NeQlLAdvL5pLLa/cNU
         +7XqZth8sxCARnIWbfuGlNRupcQB4Np3E6r4i62itDeZ9rLhlDED/VuFAFvKcg8IHEGk
         NHrvNXxV15AGqYuT2AS4hLAIcz90r4zVfY2waXSmAqyLf6wk5xJ5ckAYf4rfi1MJjkvL
         MJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736294113; x=1736898913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=afxiL3/8NT1GSMrJFZTMQ6QXDG8WcVzRxjsk157gtUc=;
        b=IQSpnFEpnquL3veXqnXd3CIAsOoMJkv7yvogt+n/hCqCnsLnkqzxPxE68T/cz1lu3G
         /arYyY9pnwJ0+sANv2oqY2S//l87Im67mJDsl49WbrYeoiWzkjxYPMtJAVUpy8S6nsgv
         A3KNQjnzgyBZlJcHHe4LVGCqVqaHNB4qhB9nY2MQNmtFULN/bUDnQ+/YjXQ+qKJxri+o
         22FlZfkXAwEGRtq6bA0qXHwKe09ItEfBQZtHkihrVlyE0QzZgXqoynUNGhma5A4415e7
         0y3pKcV6bCuS6oGzo1TyTjMAENlFKw3ycsyECkX28B2wI6KiEvYvlWAUyZC/P89O/FpH
         ADKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3/V9Kbx+UOMqj8axZ84Sp/cRQRcP8D6mQ2offDXEFNXQ1p6jpJEUYjVp0YDxGYDO4mAkxXBJL46U=@vger.kernel.org, AJvYcCUoaSWtYD4lb/G9NWm2zqdM4NJz+vfYxsFnfoQx2l9TD/nQZ9zKflEDpn0F04J0w8u0ciKykYCFjdcwi+VqhG6mXgPuwA==@vger.kernel.org, AJvYcCXiXsQIM92NgjJNARkNz9oQSozOXgu2r+E7nhm1wANhML7+wVSmnZxIavGayDlfusSt8rdNPTrYkztHxbSU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9sErs5l2nZWG1AJ2aA4tApMVq3z7Kq3NWAGMJfH7SmOyCRBaK
	MsTN5zqYaK6P2h8ydCsQ0zzcvNbNvVNVlVYOQBv75wP46j4z+JGtJO9at3P+3/SV364t1Kw7bGB
	jdkLR9X9o2Shmyd0PLyMUxMjkvRU=
X-Gm-Gg: ASbGncuNM77+dZ+3F3zMdisZwZvFl6VSTA3kEjSlmij/+TeOHatzTzinrhEQbBU193C
	qq+Uqdwhng7R5kuqYEK/Z61vPWv2V3V7zl3VGndM=
X-Google-Smtp-Source: AGHT+IHpC0AwqxjvhgRZQ32bkGVXep8yGLUlOTbBUWkNu8FtX+9rNeDZAGemcXEDW590wEfFd7F/sOjZ1DPbo52Egpk=
X-Received: by 2002:a05:6214:1249:b0:6d8:b371:6a0f with SMTP id
 6a1803df08f44-6df9b2d5c50mr17842066d6.31.1736294113167; Tue, 07 Jan 2025
 15:55:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-5-derekjohn.clark@gmail.com> <8620c791-4cf0-44fe-9869-18be4baed465@kernel.org>
 <CAFqHKTmd12wZdCK_-+SbGNdvwzXTawmu9ob3_k1cHoy0XBVS-Q@mail.gmail.com> <5914557f-ba32-825a-a483-8ffe0311a61f@linux.intel.com>
In-Reply-To: <5914557f-ba32-825a-a483-8ffe0311a61f@linux.intel.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Tue, 7 Jan 2025 15:55:01 -0800
X-Gm-Features: AbW1kvbBgs3KKtAXIZJeeuKSVbfb2t42OW7sSEjfDKPdWcCtNlRB_5z5vNduILs
Message-ID: <CAFqHKTnJwpgABhkGH6Z=AFC5=YzMLPb7qzX5p-V+tHzsW6RHOg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] platform/x86: Add Lenovo Other Mode WMI Driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mario Limonciello <superm1@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
	Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H . Chiu" <codyit@gmail.com>, 
	John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 10:21=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 2 Jan 2025, Derek John Clark wrote:
> > On Wed, Jan 1, 2025 at 7:40=E2=80=AFPM Mario Limonciello <superm1@kerne=
l.org> wrote:
> > > On 1/1/25 18:47, Derek J. Clark wrote:
> > > > Adds lenovo-wmi-other.c which provides a driver for the Lenovo
> > > > "Other Mode" WMI interface that comes on some Lenovo "Gaming
> > > > Series" hardware. Provides a firmware-attributes class which
> > > > enables the use of tunable knobs for SPL, SPPT, and FPPT.
> > > >
> > > > v2:
> > > > - Use devm_kzalloc to ensure driver can be instanced, remove global
> > > >    reference.
> > > > - Ensure reverse Christmas tree for all variable declarations.
> > > > - Remove extra whitespace.
> > > > - Use guard(mutex) in all mutex instances, global mutex.
> > > > - Use pr_fmt instead of adding the driver name to each pr_err.
> > > > - Remove noisy pr_info usage.
> > > > - Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv.
> > > > - Use list to get the lenovo_wmi_om_priv instance in some macro
> > > >    called functions as the data provided by the macros that use it
> > > >    doesn't pass a member of the struct for use in container_of.
> > > > - Do not rely on GameZone interface to grab the current fan mode.
> > > >
> > > > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > > ---
> > > >   MAINTAINERS                             |   1 +
> > > >   drivers/platform/x86/Kconfig            |  12 +
> > > >   drivers/platform/x86/Makefile           |   1 +
> > > >   drivers/platform/x86/lenovo-wmi-other.c | 385 +++++++++++++++++++=
+++++
> > > >   drivers/platform/x86/lenovo-wmi.h       | 116 +++++++
> > > >   5 files changed, 515 insertions(+)
> > > >   create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index c9374c395905..318e1e517eed 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -13040,6 +13040,7 @@ L:    platform-driver-x86@vger.kernel.org
> > > >   S:  Maintained
> > > >   F:  drivers/platform/x86/lenovo-wmi-capdata01.c
> > > >   F:  drivers/platform/x86/lenovo-wmi-gamezone.c
> > > > +F:   drivers/platform/x86/lenovo-wmi-other.c
> > > >   F:  drivers/platform/x86/lenovo-wmi.h
> > > >
> > > >   LETSKETCH HID TABLET DRIVER
> > > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kc=
onfig
> > > > index a2c1ab47ad9e..e2285ab987c5 100644
> > > > --- a/drivers/platform/x86/Kconfig
> > > > +++ b/drivers/platform/x86/Kconfig
> > > > @@ -481,6 +481,18 @@ config LENOVO_WMI_DATA01
> > > >         To compile this driver as a module, choose M here: the modu=
le will
> > > >         be called lenovo_wmi_capdata01.
> > > >
> > > > +config LENOVO_WMI_TUNING
> > > > +     tristate "Lenovo Other Method WMI Driver"
> > > > +     depends on LENOVO_WMI_DATA01
> > > > +     select FW_ATTR_CLASS
> > > > +     help
> > > > +       Say Y here if you have a WMI aware Lenovo Legion device and=
 would like to use the
> > > > +       firmware_attributes API to control various tunable settings=
 typically exposed by
> > > > +       Lenovo software in Windows.
> > > > +
> > > > +       To compile this driver as a module, choose M here: the modu=
le will
> > > > +       be called lenovo_wmi_other.
> > > > +
> > > >   config IDEAPAD_LAPTOP
> > > >       tristate "Lenovo IdeaPad Laptop Extras"
> > > >       depends on ACPI
> > > > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/M=
akefile
> > > > index 6c96cc3f3855..3e059b3c3647 100644
> > > > --- a/drivers/platform/x86/Makefile
> > > > +++ b/drivers/platform/x86/Makefile
> > > > @@ -70,6 +70,7 @@ obj-$(CONFIG_YT2_1380)              +=3D lenovo-y=
oga-tab2-pro-1380-fastcharger.o
> > > >   obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-camera.o
> > > >   obj-$(CONFIG_LENOVO_WMI_GAMEZONE)   +=3D lenovo-wmi-gamezone.o
> > > >   obj-$(CONFIG_LENOVO_WMI_DATA01)     +=3D lenovo-wmi-capdata01.o
> > > > +obj-$(CONFIG_LENOVO_WMI_TUNING)      +=3D lenovo-wmi-other.o
> > > >
> > > >   # Intel
> > > >   obj-y                               +=3D intel/
> > > > diff --git a/drivers/platform/x86/lenovo-wmi-other.c b/drivers/plat=
form/x86/lenovo-wmi-other.c
> > > > new file mode 100644
> > > > index 000000000000..2392faa74973
> > > > --- /dev/null
> > > > +++ b/drivers/platform/x86/lenovo-wmi-other.c
> > > > @@ -0,0 +1,385 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > +/*
> > > > + * Lenovo Other Method WMI interface driver. This driver uses the =
fw_attributes
> > > > + * class to expose the various WMI functions provided by the "Othe=
r Method" WMI
> > > > + * interface. This enables CPU and GPU power limit as well as vari=
ous other
> > > > + * attributes for devices that fall under the "Gaming Series" of L=
enovo laptop
> > > > + * devices. Each attribute exposed by the "Other Method"" interfac=
e has a
> > > > + * corresponding LENOVO_CAPABILITY_DATA_01 struct that allows the =
driver to
> > > > + * probe details about the attribute such as set/get support, step=
, min, max,
> > > > + * and default value. Each attibute has multiple pages, one for ea=
ch of the
> > > > + * fan profiles managed by the GameZone interface, so it must be p=
robed prior
> > > > + * to returning the current_value.
> > > > + *
> > > > + * These attributes typically don't fit anywhere else in the sysfs=
 and are set
> > > > + * in Windows using one of Lenovo's multiple user applications.
> > > > + *
> > > > + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> > > > + */
> > > > +
> > > > +#include <linux/list.h>
> > > > +#include "lenovo-wmi.h"
> > > > +#include "firmware_attributes_class.h"
> > > > +
> > > > +#define FW_ATTR_FOLDER "lenovo-wmi-other"
> > > > +#define LENOVO_OTHER_METHOD_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089=
CD3B"
> > > > +
> > > > +/* Device IDs */
> > > > +#define WMI_DEVICE_ID_CPU 0x01
> > > > +
> > > > +/* WMI_DEVICE_ID_CPU feature IDs */
> > > > +#define WMI_FEATURE_ID_CPU_SPPT 0x01 /* Short Term Power Limit */
> > > > +#define WMI_FEATURE_ID_CPU_FPPT 0x03 /* Long Term Power Limit */
> > > > +#define WMI_FEATURE_ID_CPU_SPL 0x02 /* Peak Power Limit */
> > > > +#define WMI_FEATURE_ID_CPU_FPPT_BAD 0x03 /* Long Term Power Limit =
*/
> > >
> > > What exactly is WMI_FEATURE_ID_CPU_FPPT_BAD?  I don't see it used in =
the
> > > code at all.
> > >
> >
> > Something I was going to add a quirk for based on some bad gouge but
> > missed in my cleanup. I'll remove.
> >
> > > > +
> > > > +/* Method IDs */
> > > > +#define WMI_METHOD_ID_VALUE_GET 17 /* Other Method Getter */
> > > > +#define WMI_METHOD_ID_VALUE_SET 18 /* Other Method Setter */
> > > > +
> > > > +static DEFINE_MUTEX(call_mutex);
> > > > +static DEFINE_MUTEX(om_list_mutex);
> > > > +static LIST_HEAD(om_wmi_list);
> > > > +
> > > > +struct lenovo_wmi_om_priv {
> > > > +     struct wmi_device *wdev;
> > > > +     struct device *fw_attr_dev;
> > > > +     struct kset *fw_attr_kset;
> > > > +     struct list_head list;
> > > > +};
> > > > +
> > > > +static inline struct lenovo_wmi_om_priv *get_first_wmi_priv(void)
> > > > +{
> > > > +     guard(mutex)(&om_list_mutex);
> > > > +     return list_first_entry_or_null(&om_wmi_list, struct lenovo_w=
mi_om_priv,
> > > > +                                     list);
> > > > +}
> > > > +
> > > > +static const struct wmi_device_id lenovo_wmi_other_id_table[] =3D =
{
> > > > +     { LENOVO_OTHER_METHOD_GUID, NULL },
> > > > +     {}
> > > > +};
> > > > +
> > > > +/* Tunable Attributes */
> > > > +struct tunable_attr_01 ppt_pl1_spl =3D { .device_id =3D WMI_DEVICE=
_ID_CPU,
> > > > +                                    .feature_id =3D WMI_FEATURE_ID=
_CPU_SPL };
> > > > +struct tunable_attr_01 ppt_pl2_sppt =3D { .device_id =3D WMI_DEVIC=
E_ID_CPU,
> > > > +                                     .feature_id =3D WMI_FEATURE_I=
D_CPU_SPPT };
> > > > +struct tunable_attr_01 ppt_pl3_fppt =3D { .device_id =3D WMI_DEVIC=
E_ID_CPU,
> > > > +                                     .feature_id =3D WMI_FEATURE_I=
D_CPU_FPPT };
> > > > +
> > > > +struct capdata01_attr_group {
> > > > +     const struct attribute_group *attr_group;
> > > > +     struct tunable_attr_01 *tunable_attr;
> > > > +};
> > > > +
> > > > +static const struct class *fw_attr_class;
> > > > +
> > > > +/**
> > > > + * attr_capdata01_setup() - Get the data of the specified attribut=
e
> > > > + * from LENOVO_CAPABILITY_DATA_01 and store it.
> > > > + * @tunable_attr: The attribute to be populated.
> > > > + *
> > > > + * Returns: Either 0 or an error.
> > > > + */
> > > > +static int attr_capdata01_setup(struct tunable_attr_01 *tunable_at=
tr)
> > > > +{
> > > > +     struct capability_data_01 cap_data;
> > > > +     int mode =3D SMARTFAN_MODE_CUSTOM;
> > > > +     int err;
> > > > +
> > >
> > > Why the whitespace here?  Seems unnecessary.
> > >
> > > > +     struct lenovo_wmi_attr_id attr_id =3D { mode << 8,
> > >
> > > As mode is only used here, I would just do:
> > >
> > > { SMARTFAN_MODE_CUSTOM << 8,
> > >
> > > To avoid the extra variable.
> > >
> >
> > Acked.
>
> Where does that << 8 come from? It smells like a field inside mode_id? If
> that's the case, FIELD_PREP() should be used instead of the open-coded
> shift.
>

This was another thing that was accidentally dropped when I was
preparing v2. There is a fourth u8 field, "type_id", that can be used
at the end of the u32. It is used in some features that aren't yet
implemented and is 0x00 for most attributes. An example of a feature
that uses the type ID would be getting the fan speed on a laptop that
has two fans, you can select which fan to get with the type ID. I've
already fixed this in my working branch for the next version.

> > > > +                                           tunable_attr->feature_i=
d,
> > > > +                                           tunable_attr->device_id=
 };
> > > > +
> > > > +     err =3D lenovo_wmi_capdata01_get(attr_id, &cap_data);
> > > > +     if (err) {
> > > > +             pr_err("Failed to get capability data: %u\n", err);
> > > > +             return err;
> > > > +     }
> > > > +
> > > > +     if (cap_data.supported < 1)
> > > > +             return -EOPNOTSUPP;
> > > > +
> > > > +     tunable_attr->capdata =3D cap_data;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * attr_capdata01_show() - Get the value of the specified attribut=
e property
> > > > + * from LENOVO_CAPABILITY_DATA_01.
> > > > + * @kobj: Pointer to the driver object.
> > > > + * @kobj_attribute: Pointer to the attribute calling this function=
.
> > > > + * @buf: The buffer to write to.
> > > > + * @tunable_attr: The attribute to be read.
> > > > + * @prop: The property of this attribute to be read.
> > > > + *
> > > > + * This function is intended to be generic so it can be called fro=
m any "_show"
> > > > + * attribute which works only with integers.
> > > > + *
> > > > + * If the WMI is success, then the sysfs attribute is notified.
> > > > + *
> > > > + * Returns: Either count, or an error.
> > > > + */
> > > > +ssize_t attr_capdata01_show(struct kobject *kobj, struct kobj_attr=
ibute *attr,
> > > > +                         char *buf, struct tunable_attr_01 *tunabl=
e_attr,
> > > > +                         enum attribute_property prop)
> > > > +{
> > > > +     struct capability_data_01 cap_data;
> > > > +     int retval;
> > > > +
> > > > +     cap_data =3D tunable_attr->capdata;
> > > > +
> > > > +     switch (prop) {
> > > > +     case DEFAULT_VAL:
> > > > +             retval =3D cap_data.default_value;
> > > > +             break;
> > > > +     case MAX_VAL:
> > > > +             retval =3D cap_data.max_value;
> > > > +             break;
> > > > +     case MIN_VAL:
> > > > +             retval =3D cap_data.min_value;
> > > > +             break;
> > > > +     case STEP_VAL:
> > > > +             retval =3D cap_data.step;
> > > > +             break;
> > > > +     default:
> > > > +             return -EINVAL;
> > > > +     }
> > > > +     return sysfs_emit(buf, "%u\n", retval);
> > > > +}
> > > > +
> > > > +/* Simple attribute creation */
> > > > +
> > > > +/*
> > > > + * att_current_value_store() - Set the current value of the given =
attribute
> > > > + * @kobj: Pointer to the driver object.
> > > > + * @kobj_attribute: Pointer to the attribute calling this function=
.
> > > > + * @buf: The buffer to read from, this is parsed to `int` type.
> > > > + * @count: Required by sysfs attribute macros, pass in from the ca=
llee attr.
> > > > + * @tunable_attr: The attribute to be stored.
> > > > + *
> > > > + * This function is intended to be generic so it can be called fro=
m any
> > > > + * attribute's "current_value_store" which works only with integer=
s. The
> > > > + * integer to be sent to the WMI method is range checked and an er=
ror returned
> > > > + * if out of range.
> > > > + *
> > > > + * If the value is valid and WMI is success, then the sysfs attrib=
ute is
> > > > + * notified.
> > > > + *
> > > > + * Returns: Either count, or an error.
> > > > + */
> > > > +ssize_t attr_current_value_store(struct kobject *kobj,
> > > > +                              struct kobj_attribute *attr, const c=
har *buf,
> > > > +                              size_t count,
> > > > +                              struct tunable_attr_01 *tunable_attr=
)
> > > > +{
> > > > +     struct capability_data_01 cap_data;
> > > > +     struct lenovo_wmi_om_priv *priv;
> > > > +     int mode =3D SMARTFAN_MODE_CUSTOM;
> > > > +     u32 value;
> > > > +     int err;
> > > > +
> > > > +     struct lenovo_wmi_attr_id attr_id =3D { mode << 8,
> > >
> > > Similar comment about the mode here too.
> > >
> > > > +                                           tunable_attr->feature_i=
d,
> > > > +                                           tunable_attr->device_id=
 };
> > > > +
> > > > +     err =3D kstrtouint(buf, 10, &value);
> > > > +     if (err) {
> > > > +             pr_err("Error converting value to int: %u\n", err);
> > > > +             return err;
> > > > +     }
> > > > +
> > > > +     cap_data =3D tunable_attr->capdata;
> > > > +
> > > > +     if (value < cap_data.min_value || value > cap_data.max_value)
> > > > +             return -EINVAL;
> > > > +
> > > > +     priv =3D get_first_wmi_priv();
> > > > +     if (!priv)
> > > > +             return -ENODEV;
> > > > +
> > > > +     guard(mutex)(&call_mutex);
> > > > +     err =3D lenovo_wmidev_evaluate_method_2(priv->wdev, 0x0,
> > > > +                                           WMI_METHOD_ID_VALUE_SET=
,
> > > > +                                           *(int *)&attr_id, value=
, NULL);
> > > > +
> > > > +     if (err) {
> > > > +             pr_err("Error setting attribute: %u\n", err);
> > > > +             return err;
> > > > +     }
> > > > +
> > > > +     tunable_attr->store_value =3D value;
> > > > +
> > > > +     sysfs_notify(kobj, NULL, attr->attr.name);
> > > > +
> > > > +     return count;
> > > > +};
> > > > +
> > > > +/*
> > > > + * attr_current_value_show() - Get the current value of the given =
attribute
> > > > + * @kobj: Pointer to the driver object.
> > > > + * @kobj_attribute: Pointer to the attribute calling this function=
.
> > > > + * @buf: The buffer to write to.
> > > > + * @tunable_attr: The attribute to be read.
> > > > + *
> > > > + * This function is intended to be generic so it can be called fro=
m any "_show"
> > > > + * attribute which works only with integers.
> > > > + *
> > > > + * If the WMI is success, then the sysfs attribute is notified.
> > > > + *
> > > > + * Returns: Either count, or an error.
> > > > + */
> > > > +ssize_t attr_current_value_show(struct kobject *kobj,
> > > > +                             struct kobj_attribute *attr, char *bu=
f,
> > > > +                             struct tunable_attr_01 *tunable_attr)
> > > > +{
> > > > +     struct lenovo_wmi_om_priv *priv;
> > > > +     int mode =3D SMARTFAN_MODE_CUSTOM;
> > > > +     int retval;
> > > > +     int err;
> > > > +
> > > > +     struct lenovo_wmi_attr_id attr_id =3D { mode << 8,
> > >
> > > Same comment about SMARTFAN_MODE_CUSTOM here.
> > >
> >
> > In this case it may be needed, discussion ongoing in thread 0/4.
> >
> > > > +                                           tunable_attr->feature_i=
d,
> > > > +                                           tunable_attr->device_id=
 };
> > > > +
> > > > +     priv =3D get_first_wmi_priv();
> > > > +     if (!priv)
> > > > +             return -ENODEV;
> > > > +
> > > > +     guard(mutex)(&call_mutex);
> > > > +     err =3D lenovo_wmidev_evaluate_method_1(priv->wdev, 0x0,
> > > > +                                           WMI_METHOD_ID_VALUE_GET=
,
> > > > +                                           *(int *)&attr_id, &retv=
al);
> > > > +
> > > > +     if (err) {
> > > > +             pr_err("Error getting attribute: %u\n", err);
> > > > +             return err;
> > > > +     }
> > > > +
> > > > +     return sysfs_emit(buf, "%u\n", retval);
> > > > +}
> > > > +
> > > > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
> > > > +                         "Set the CPU sustained power limit");
> > > > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
> > > > +                         "Set the CPU slow package power tracking =
limit");
> > > > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
> > > > +                         "Set the CPU fast package power tracking =
limit");
> > > > +
> > > > +static const struct capdata01_attr_group capdata01_attr_groups[] =
=3D {
> > > > +     { &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
> > > > +     { &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
> > > > +     { &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
> > > > +     {},
> > > > +};
> > > > +
> > > > +static int other_method_fw_attr_add(struct lenovo_wmi_om_priv *pri=
v)
> > > > +{
> > > > +     int err, i;
> > > > +
> > > > +     err =3D fw_attributes_class_get(&fw_attr_class);
> > > > +     if (err) {
> > > > +             pr_err("Failed to get firmware_attributes_class: %u\n=
", err);
> > > > +             return err;
> > > > +     }
> > > > +
> > > > +     priv->fw_attr_dev =3D device_create(fw_attr_class, NULL, MKDE=
V(0, 0),
> > > > +                                       NULL, "%s", FW_ATTR_FOLDER)=
;
> > > > +     if (IS_ERR(priv->fw_attr_dev)) {
> > > > +             err =3D PTR_ERR(priv->fw_attr_dev);
> > > > +             pr_err("Failed to create firmware_attributes_class de=
vice: %u\n",
> > > > +                    err);
> > > > +             goto fail_class_get;
> > > > +     }
> > > > +
> > > > +     priv->fw_attr_kset =3D kset_create_and_add("attributes", NULL=
,
> > > > +                                              &priv->fw_attr_dev->=
kobj);
> > > > +     if (!priv->fw_attr_kset) {
> > > > +             err =3D -ENOMEM;
> > > > +             pr_err("Failed to create firmware_attributes_class ks=
et: %u\n",
> > > > +                    err);
> > > > +             goto err_destroy_classdev;
> > > > +     }
> > > > +
> > > > +     for (i =3D 0; i < ARRAY_SIZE(capdata01_attr_groups) - 1; i++)=
 {
> > > > +             err =3D attr_capdata01_setup(
> > > > +                     capdata01_attr_groups[i].tunable_attr);
> > > > +             if (err) {
> > > > +                     pr_err("Failed to populate capability data fo=
r %s: %u\n",
> > > > +                            capdata01_attr_groups[i].attr_group->n=
ame, err);
> > >
> > > This specific error could be a bit noisy because it's a dependency on
> > > the other driver in case one attribute returns not supported.
> > >
> > > Could you instead detect EOPNOTSUPP specifically and only show error =
if
> > > not EOPNOTSUPP?
> > >
> >
> > Easy fix, will do. I'll also add a wmi_dev_exists() here before the
> > loop to exit early.
> >
> > > > +                     continue;
> > > > +             }
> > > > +
> > > > +             err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> > > > +                                      capdata01_attr_groups[i].att=
r_group);
> > > > +             if (err) {
> > > > +                     pr_err("Failed to create sysfs-group for %s: =
%u\n",
> > > > +                            capdata01_attr_groups[i].attr_group->n=
ame, err);
> > > > +                     goto err_remove_groups;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +
> > > > +err_remove_groups:
> > > > +     while (i-- > 0) {
> > > > +             sysfs_remove_group(&priv->fw_attr_kset->kobj,
> > > > +                                capdata01_attr_groups[i].attr_grou=
p);
> > > > +     }
> > > > +
> > > > +     return err;
> > > > +
> > > > +err_destroy_classdev:
> > > > +     device_destroy(fw_attr_class, MKDEV(0, 0));
> > > > +
> > > > +     return err;
> > > > +
> > > > +fail_class_get:
> > > > +     fw_attributes_class_put();
> > > > +
> > > > +     return err;
>
> I highly suspect the intermediate return errs in the previous labels will
> cause leaks. Don't you want to rollback everything on error?

To clarify, you mean remove the returns in each fail case before
fail_class_get so they will fall through? That would make more sense,
yeah.

> --
>  i.
>
>

Thanks Ilpo,
Derek

> > > > +}
> > > > +
> > > > +static int lenovo_wmi_other_probe(struct wmi_device *wdev, const v=
oid *context)
> > > > +{
> > > > +     struct lenovo_wmi_om_priv *priv;
> > > > +
> > > > +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > > > +     if (!priv)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     priv->wdev =3D wdev;
> > > > +
> > > > +     guard(mutex)(&om_list_mutex);
> > > > +     list_add_tail(&priv->list, &om_wmi_list);
> > > > +
> > > > +     return other_method_fw_attr_add(priv);
> > > > +}
> > > > +
> > > > +static void lenovo_wmi_other_remove(struct wmi_device *wdev)
> > > > +{
> > > > +     struct lenovo_wmi_om_priv *priv =3D dev_get_drvdata(&wdev->de=
v);
> > > > +
> > > > +     guard(mutex)(&om_list_mutex);
> > > > +     list_del(&priv->list);
> > > > +     kset_unregister(priv->fw_attr_kset);
> > > > +     device_destroy(fw_attr_class, MKDEV(0, 0));
> > > > +     fw_attributes_class_put();
> > > > +}
> > > > +
> > > > +static struct wmi_driver lenovo_wmi_other_driver =3D {
> > > > +     .driver =3D { .name =3D "lenovo_wmi_other" },
> > > > +     .id_table =3D lenovo_wmi_other_id_table,
> > > > +     .probe =3D lenovo_wmi_other_probe,
> > > > +     .remove =3D lenovo_wmi_other_remove,
> > > > +};
> > > > +
> > > > +module_wmi_driver(lenovo_wmi_other_driver);
> > > > +
> > > > +MODULE_IMPORT_NS("CAPDATA_WMI");
> > > > +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_other_id_table);
> > > > +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > > > +MODULE_DESCRIPTION("Lenovo Other Method WMI Driver");
> > > > +MODULE_LICENSE("GPL");
> > > > diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x=
86/lenovo-wmi.h
> > > > index 53cea84a956b..1c8358551ba6 100644
> > > > --- a/drivers/platform/x86/lenovo-wmi.h
> > > > +++ b/drivers/platform/x86/lenovo-wmi.h
> > > > @@ -42,6 +42,14 @@ struct lenovo_wmi_attr_id {
> > > >       u32 device_id : 8; /* CPU/GPU/... */
> > > >   } __packed;
> > > >
> > > > +enum attribute_property {
> > > > +     DEFAULT_VAL,
> > > > +     MAX_VAL,
> > > > +     MIN_VAL,
> > > > +     STEP_VAL,
> > > > +     SUPPORTED,
> > > > +};
> > > > +
> > > >   /* Data struct for LENOVO_CAPABILITY_DATA_01 */
> > > >   struct capability_data_01 {
> > > >       u32 id;
> > > > @@ -52,6 +60,14 @@ struct capability_data_01 {
> > > >       u32 max_value;
> > > >   };
> > > >
> > > > +/* Tunable attribute that uses LENOVO_CAPABILITY_DATA_01 */
> > > > +struct tunable_attr_01 {
> > > > +     struct capability_data_01 capdata;
> > > > +     u32 device_id;
> > > > +     u32 feature_id;
> > > > +     u32 store_value;
> > > > +};
> > > > +
> > > >   /* General Use functions */
> > > >   static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev,=
 u8 instance,
> > > >                                        u32 method_id, struct acpi_b=
uffer *in,
> > > > @@ -122,4 +138,104 @@ int lenovo_wmidev_evaluate_method_1(struct wm=
i_device *wdev, u8 instance,
> > > >   int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
> > > >                            struct capability_data_01 *cap_data);
> > > >
> > > > +/* Other Method attribute functions */
> > > > +ssize_t attr_capdata01_show(struct kobject *kobj, struct kobj_attr=
ibute *attr,
> > > > +                         char *buf, struct tunable_attr_01 *tunabl=
e_attr,
> > > > +                         enum attribute_property prop);
> > > > +
> > > > +ssize_t attr_current_value_store(struct kobject *kobj,
> > > > +                              struct kobj_attribute *attr, const c=
har *buf,
> > > > +                              size_t count,
> > > > +                              struct tunable_attr_01 *tunable_attr=
);
> > > > +
> > > > +ssize_t attr_current_value_show(struct kobject *kobj,
> > > > +                             struct kobj_attribute *attr, char *bu=
f,
> > > > +                             struct tunable_attr_01 *tunable_attr)=
;
> > > > +
> > > > +ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute =
*attr,
> > > > +                   char *buf);
> > > > +
> > > > +ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute =
*attr,
> > > > +                   char *buf)
> > > > +{
> > > > +     return sysfs_emit(buf, "integer\n");
> > > > +}
> > > > +
> > > > +/* Other Method attribute macros */
> > > > +#define __LL_ATTR_RO(_func, _name)                                =
    \
> > > > +     {                                                            =
 \
> > > > +             .attr =3D { .name =3D __stringify(_name), .mode =3D 0=
444 }, \
> > > > +             .show =3D _func##_##_name##_show,                    =
   \
> > > > +     }
> > > > +
> > > > +#define __LL_ATTR_RO_AS(_name, _show)                             =
    \
> > > > +     {                                                            =
 \
> > > > +             .attr =3D { .name =3D __stringify(_name), .mode =3D 0=
444 }, \
> > > > +             .show =3D _show,                                     =
   \
> > > > +     }
> > > > +
> > > > +#define __LL_ATTR_RW(_func, _name) \
> > > > +     __ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##=
_store)
> > > > +
> > > > +/* Shows a formatted static variable */
> > > > +#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)             =
            \
> > > > +     static ssize_t _attrname##_##_prop##_show(                   =
         \
> > > > +             struct kobject *kobj, struct kobj_attribute *attr, ch=
ar *buf) \
> > > > +     {                                                            =
         \
> > > > +             return sysfs_emit(buf, _fmt, _val);                  =
         \
> > > > +     }                                                            =
         \
> > > > +     static struct kobj_attribute attr_##_attrname##_##_prop =3D  =
           \
> > > > +             __LL_ATTR_RO(_attrname, _prop)
> > > > +
> > > > +/* Attribute current_value show/store */
> > > > +#define __LL_TUNABLE_RW_CAP01(_attrname)                          =
            \
> > > > +     static ssize_t _attrname##_current_value_store(              =
         \
> > > > +             struct kobject *kobj, struct kobj_attribute *attr,   =
         \
> > > > +             const char *buf, size_t count)                       =
         \
> > > > +     {                                                            =
         \
> > > > +             return attr_current_value_store(kobj, attr, buf, coun=
t,       \
> > > > +                                             &_attrname);         =
         \
> > > > +     }                                                            =
         \
> > > > +     static ssize_t _attrname##_current_value_show(               =
         \
> > > > +             struct kobject *kobj, struct kobj_attribute *attr, ch=
ar *buf) \
> > > > +     {                                                            =
         \
> > > > +             return attr_current_value_show(kobj, attr, buf, &_att=
rname);  \
> > > > +     }                                                            =
         \
> > > > +     static struct kobj_attribute attr_##_attrname##_current_value=
 =3D       \
> > > > +             __LL_ATTR_RW(_attrname, current_value)
> > > > +
> > > > +/* Attribute property show only */
> > > > +#define __LL_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)       =
            \
> > > > +     static ssize_t _attrname##_##_prop##_show(                   =
         \
> > > > +             struct kobject *kobj, struct kobj_attribute *attr, ch=
ar *buf) \
> > > > +     {                                                            =
         \
> > > > +             return attr_capdata01_show(kobj, attr, buf, &_attrnam=
e,       \
> > > > +                                        _prop_type);              =
         \
> > > > +     }                                                            =
         \
> > > > +     static struct kobj_attribute attr_##_attrname##_##_prop =3D  =
           \
> > > > +             __LL_ATTR_RO(_attrname, _prop)
> > > > +
> > > > +#define ATTR_GROUP_LL_TUNABLE_CAP01(_attrname, _fsname, _dispname)=
     \
> > > > +     __LL_TUNABLE_RW_CAP01(_attrname);                            =
  \
> > > > +     __LL_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);=
  \
> > > > +     __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname); =
  \
> > > > +     __LL_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);        =
  \
> > > > +     __LL_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);        =
  \
> > > > +     __LL_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);=
  \
> > > > +     static struct kobj_attribute attr_##_attrname##_type =3D     =
    \
> > > > +             __LL_ATTR_RO_AS(type, int_type_show);                =
  \
> > > > +     static struct attribute *_attrname##_attrs[] =3D {           =
    \
> > > > +             &attr_##_attrname##_current_value.attr,              =
  \
> > > > +             &attr_##_attrname##_default_value.attr,              =
  \
> > > > +             &attr_##_attrname##_display_name.attr,               =
  \
> > > > +             &attr_##_attrname##_max_value.attr,                  =
  \
> > > > +             &attr_##_attrname##_min_value.attr,                  =
  \
> > > > +             &attr_##_attrname##_scalar_increment.attr,           =
  \
> > > > +             &attr_##_attrname##_type.attr,                       =
  \
> > > > +             NULL,                                                =
  \
> > > > +     };                                                           =
  \
> > > > +     static const struct attribute_group _attrname##_attr_group =
=3D { \
> > > > +             .name =3D _fsname, .attrs =3D _attrname##_attrs      =
      \
> > > > +     }
> > > > +
> > > >   #endif /* !_LENOVO_WMI_H_ */
> > >
> >
