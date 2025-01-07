Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8341D95B3;
	Tue,  7 Jan 2025 18:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736274091; cv=none; b=HYHyj65jFD/OCJVjYqFLqcRQpMkjh1PpVCtschamA5MBhwNr1Ob6RejRwYQsEmCV0jMm0hSeLBFbeko4jad5rulPMxx6WFLm0Y32zdZJ3HcGn0l99F/CXqTox3sP8s1UQwz/RKnE+dENZ8ONrv5xIZ3Xj78xTi9Nl+/WvRbKTpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736274091; c=relaxed/simple;
	bh=Rs2aSfXqzGjyzojHjNmSP7Kdfwhre8qnrP53YnqASmQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZKofPn6zxbQ8YRp3ZOCUHYhQvhauVpX1yPqtLhAxPsOq512vm539azJRNIeA0R/qdud57nZacYv4dhnJVXo8QeoSkh6JyaodMcByLnJcYLoGDq7G0CVJ/r0g2Qny2BKCQr+/0vU3ARsy5mY4aYa+hm5aQCRvXxmDu6+eEy9X1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhQ+Bt8+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhQ+Bt8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736274088; x=1767810088;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Rs2aSfXqzGjyzojHjNmSP7Kdfwhre8qnrP53YnqASmQ=;
  b=PhQ+Bt8+iDIMlYFxVYpZU+YKJZhHooHUzYLv/vlHVrRkifJ2NineZQfl
   eBjaJD86s40dHQG3YECQyYMvm6CtNY0XN+VRBPm5jYYDxmQIQ1fOm4COX
   8MSEqugPvHc0QatXqng29OGL4qPjecO+p3WZ7LdTNkIV+h4mgTzy/7TCM
   PB+cf0Is3PaTZuOvTAv7aABby80AnFDNsHZbkeD6Jje8jmvkjizGn1z4p
   t+oTE9APP4VeHIFchrZ3OMAfDdSkHlL17btLVN+Vsr/1xGha2FXCnLGNM
   FHjmBe6J+W/Otv2s+QglunPSYJwj6SouV4dSZJfMryhn2UqFYU9U4o+SR
   A==;
X-CSE-ConnectionGUID: GwJWUL7JSgqd9uti74mN6g==
X-CSE-MsgGUID: EE7FyB9eRbSlYQKBU+JW6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36358750"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36358750"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:21:27 -0800
X-CSE-ConnectionGUID: c5/7q5VvS92sjVK5FS4ckw==
X-CSE-MsgGUID: jPS2VAkJSMmhYVlWe/BN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="107897325"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.206])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:21:22 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jan 2025 20:21:19 +0200 (EET)
To: Derek John Clark <derekjohn.clark@gmail.com>
cc: Mario Limonciello <superm1@kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
    Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . -H . Chiu" <codyit@gmail.com>, 
    John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] platform/x86: Add Lenovo Other Mode WMI Driver
In-Reply-To: <CAFqHKTmd12wZdCK_-+SbGNdvwzXTawmu9ob3_k1cHoy0XBVS-Q@mail.gmail.com>
Message-ID: <5914557f-ba32-825a-a483-8ffe0311a61f@linux.intel.com>
References: <20250102004854.14874-1-derekjohn.clark@gmail.com> <20250102004854.14874-5-derekjohn.clark@gmail.com> <8620c791-4cf0-44fe-9869-18be4baed465@kernel.org> <CAFqHKTmd12wZdCK_-+SbGNdvwzXTawmu9ob3_k1cHoy0XBVS-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-980477018-1736274079=:1001"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-980477018-1736274079=:1001
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 2 Jan 2025, Derek John Clark wrote:
> On Wed, Jan 1, 2025 at 7:40=E2=80=AFPM Mario Limonciello <superm1@kernel.=
org> wrote:
> > On 1/1/25 18:47, Derek J. Clark wrote:
> > > Adds lenovo-wmi-other.c which provides a driver for the Lenovo
> > > "Other Mode" WMI interface that comes on some Lenovo "Gaming
> > > Series" hardware. Provides a firmware-attributes class which
> > > enables the use of tunable knobs for SPL, SPPT, and FPPT.
> > >
> > > v2:
> > > - Use devm_kzalloc to ensure driver can be instanced, remove global
> > >    reference.
> > > - Ensure reverse Christmas tree for all variable declarations.
> > > - Remove extra whitespace.
> > > - Use guard(mutex) in all mutex instances, global mutex.
> > > - Use pr_fmt instead of adding the driver name to each pr_err.
> > > - Remove noisy pr_info usage.
> > > - Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv.
> > > - Use list to get the lenovo_wmi_om_priv instance in some macro
> > >    called functions as the data provided by the macros that use it
> > >    doesn't pass a member of the struct for use in container_of.
> > > - Do not rely on GameZone interface to grab the current fan mode.
> > >
> > > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > ---
> > >   MAINTAINERS                             |   1 +
> > >   drivers/platform/x86/Kconfig            |  12 +
> > >   drivers/platform/x86/Makefile           |   1 +
> > >   drivers/platform/x86/lenovo-wmi-other.c | 385 +++++++++++++++++++++=
+++
> > >   drivers/platform/x86/lenovo-wmi.h       | 116 +++++++
> > >   5 files changed, 515 insertions(+)
> > >   create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index c9374c395905..318e1e517eed 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -13040,6 +13040,7 @@ L:    platform-driver-x86@vger.kernel.org
> > >   S:  Maintained
> > >   F:  drivers/platform/x86/lenovo-wmi-capdata01.c
> > >   F:  drivers/platform/x86/lenovo-wmi-gamezone.c
> > > +F:   drivers/platform/x86/lenovo-wmi-other.c
> > >   F:  drivers/platform/x86/lenovo-wmi.h
> > >
> > >   LETSKETCH HID TABLET DRIVER
> > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> > > index a2c1ab47ad9e..e2285ab987c5 100644
> > > --- a/drivers/platform/x86/Kconfig
> > > +++ b/drivers/platform/x86/Kconfig
> > > @@ -481,6 +481,18 @@ config LENOVO_WMI_DATA01
> > >         To compile this driver as a module, choose M here: the module=
 will
> > >         be called lenovo_wmi_capdata01.
> > >
> > > +config LENOVO_WMI_TUNING
> > > +     tristate "Lenovo Other Method WMI Driver"
> > > +     depends on LENOVO_WMI_DATA01
> > > +     select FW_ATTR_CLASS
> > > +     help
> > > +       Say Y here if you have a WMI aware Lenovo Legion device and w=
ould like to use the
> > > +       firmware_attributes API to control various tunable settings t=
ypically exposed by
> > > +       Lenovo software in Windows.
> > > +
> > > +       To compile this driver as a module, choose M here: the module=
 will
> > > +       be called lenovo_wmi_other.
> > > +
> > >   config IDEAPAD_LAPTOP
> > >       tristate "Lenovo IdeaPad Laptop Extras"
> > >       depends on ACPI
> > > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
> > > index 6c96cc3f3855..3e059b3c3647 100644
> > > --- a/drivers/platform/x86/Makefile
> > > +++ b/drivers/platform/x86/Makefile
> > > @@ -70,6 +70,7 @@ obj-$(CONFIG_YT2_1380)              +=3D lenovo-yog=
a-tab2-pro-1380-fastcharger.o
> > >   obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-camera.o
> > >   obj-$(CONFIG_LENOVO_WMI_GAMEZONE)   +=3D lenovo-wmi-gamezone.o
> > >   obj-$(CONFIG_LENOVO_WMI_DATA01)     +=3D lenovo-wmi-capdata01.o
> > > +obj-$(CONFIG_LENOVO_WMI_TUNING)      +=3D lenovo-wmi-other.o
> > >
> > >   # Intel
> > >   obj-y                               +=3D intel/
> > > diff --git a/drivers/platform/x86/lenovo-wmi-other.c b/drivers/platfo=
rm/x86/lenovo-wmi-other.c
> > > new file mode 100644
> > > index 000000000000..2392faa74973
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/lenovo-wmi-other.c
> > > @@ -0,0 +1,385 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Lenovo Other Method WMI interface driver. This driver uses the fw=
_attributes
> > > + * class to expose the various WMI functions provided by the "Other =
Method" WMI
> > > + * interface. This enables CPU and GPU power limit as well as variou=
s other
> > > + * attributes for devices that fall under the "Gaming Series" of Len=
ovo laptop
> > > + * devices. Each attribute exposed by the "Other Method"" interface =
has a
> > > + * corresponding LENOVO_CAPABILITY_DATA_01 struct that allows the dr=
iver to
> > > + * probe details about the attribute such as set/get support, step, =
min, max,
> > > + * and default value. Each attibute has multiple pages, one for each=
 of the
> > > + * fan profiles managed by the GameZone interface, so it must be pro=
bed prior
> > > + * to returning the current_value.
> > > + *
> > > + * These attributes typically don't fit anywhere else in the sysfs a=
nd are set
> > > + * in Windows using one of Lenovo's multiple user applications.
> > > + *
> > > + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> > > + */
> > > +
> > > +#include <linux/list.h>
> > > +#include "lenovo-wmi.h"
> > > +#include "firmware_attributes_class.h"
> > > +
> > > +#define FW_ATTR_FOLDER "lenovo-wmi-other"
> > > +#define LENOVO_OTHER_METHOD_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD=
3B"
> > > +
> > > +/* Device IDs */
> > > +#define WMI_DEVICE_ID_CPU 0x01
> > > +
> > > +/* WMI_DEVICE_ID_CPU feature IDs */
> > > +#define WMI_FEATURE_ID_CPU_SPPT 0x01 /* Short Term Power Limit */
> > > +#define WMI_FEATURE_ID_CPU_FPPT 0x03 /* Long Term Power Limit */
> > > +#define WMI_FEATURE_ID_CPU_SPL 0x02 /* Peak Power Limit */
> > > +#define WMI_FEATURE_ID_CPU_FPPT_BAD 0x03 /* Long Term Power Limit */
> >
> > What exactly is WMI_FEATURE_ID_CPU_FPPT_BAD?  I don't see it used in th=
e
> > code at all.
> >
>=20
> Something I was going to add a quirk for based on some bad gouge but
> missed in my cleanup. I'll remove.
>=20
> > > +
> > > +/* Method IDs */
> > > +#define WMI_METHOD_ID_VALUE_GET 17 /* Other Method Getter */
> > > +#define WMI_METHOD_ID_VALUE_SET 18 /* Other Method Setter */
> > > +
> > > +static DEFINE_MUTEX(call_mutex);
> > > +static DEFINE_MUTEX(om_list_mutex);
> > > +static LIST_HEAD(om_wmi_list);
> > > +
> > > +struct lenovo_wmi_om_priv {
> > > +     struct wmi_device *wdev;
> > > +     struct device *fw_attr_dev;
> > > +     struct kset *fw_attr_kset;
> > > +     struct list_head list;
> > > +};
> > > +
> > > +static inline struct lenovo_wmi_om_priv *get_first_wmi_priv(void)
> > > +{
> > > +     guard(mutex)(&om_list_mutex);
> > > +     return list_first_entry_or_null(&om_wmi_list, struct lenovo_wmi=
_om_priv,
> > > +                                     list);
> > > +}
> > > +
> > > +static const struct wmi_device_id lenovo_wmi_other_id_table[] =3D {
> > > +     { LENOVO_OTHER_METHOD_GUID, NULL },
> > > +     {}
> > > +};
> > > +
> > > +/* Tunable Attributes */
> > > +struct tunable_attr_01 ppt_pl1_spl =3D { .device_id =3D WMI_DEVICE_I=
D_CPU,
> > > +                                    .feature_id =3D WMI_FEATURE_ID_C=
PU_SPL };
> > > +struct tunable_attr_01 ppt_pl2_sppt =3D { .device_id =3D WMI_DEVICE_=
ID_CPU,
> > > +                                     .feature_id =3D WMI_FEATURE_ID_=
CPU_SPPT };
> > > +struct tunable_attr_01 ppt_pl3_fppt =3D { .device_id =3D WMI_DEVICE_=
ID_CPU,
> > > +                                     .feature_id =3D WMI_FEATURE_ID_=
CPU_FPPT };
> > > +
> > > +struct capdata01_attr_group {
> > > +     const struct attribute_group *attr_group;
> > > +     struct tunable_attr_01 *tunable_attr;
> > > +};
> > > +
> > > +static const struct class *fw_attr_class;
> > > +
> > > +/**
> > > + * attr_capdata01_setup() - Get the data of the specified attribute
> > > + * from LENOVO_CAPABILITY_DATA_01 and store it.
> > > + * @tunable_attr: The attribute to be populated.
> > > + *
> > > + * Returns: Either 0 or an error.
> > > + */
> > > +static int attr_capdata01_setup(struct tunable_attr_01 *tunable_attr=
)
> > > +{
> > > +     struct capability_data_01 cap_data;
> > > +     int mode =3D SMARTFAN_MODE_CUSTOM;
> > > +     int err;
> > > +
> >
> > Why the whitespace here?  Seems unnecessary.
> >
> > > +     struct lenovo_wmi_attr_id attr_id =3D { mode << 8,
> >
> > As mode is only used here, I would just do:
> >
> > { SMARTFAN_MODE_CUSTOM << 8,
> >
> > To avoid the extra variable.
> >
>=20
> Acked.

Where does that << 8 come from? It smells like a field inside mode_id? If=
=20
that's the case, FIELD_PREP() should be used instead of the open-coded=20
shift.

> > > +                                           tunable_attr->feature_id,
> > > +                                           tunable_attr->device_id }=
;
> > > +
> > > +     err =3D lenovo_wmi_capdata01_get(attr_id, &cap_data);
> > > +     if (err) {
> > > +             pr_err("Failed to get capability data: %u\n", err);
> > > +             return err;
> > > +     }
> > > +
> > > +     if (cap_data.supported < 1)
> > > +             return -EOPNOTSUPP;
> > > +
> > > +     tunable_attr->capdata =3D cap_data;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +/**
> > > + * attr_capdata01_show() - Get the value of the specified attribute =
property
> > > + * from LENOVO_CAPABILITY_DATA_01.
> > > + * @kobj: Pointer to the driver object.
> > > + * @kobj_attribute: Pointer to the attribute calling this function.
> > > + * @buf: The buffer to write to.
> > > + * @tunable_attr: The attribute to be read.
> > > + * @prop: The property of this attribute to be read.
> > > + *
> > > + * This function is intended to be generic so it can be called from =
any "_show"
> > > + * attribute which works only with integers.
> > > + *
> > > + * If the WMI is success, then the sysfs attribute is notified.
> > > + *
> > > + * Returns: Either count, or an error.
> > > + */
> > > +ssize_t attr_capdata01_show(struct kobject *kobj, struct kobj_attrib=
ute *attr,
> > > +                         char *buf, struct tunable_attr_01 *tunable_=
attr,
> > > +                         enum attribute_property prop)
> > > +{
> > > +     struct capability_data_01 cap_data;
> > > +     int retval;
> > > +
> > > +     cap_data =3D tunable_attr->capdata;
> > > +
> > > +     switch (prop) {
> > > +     case DEFAULT_VAL:
> > > +             retval =3D cap_data.default_value;
> > > +             break;
> > > +     case MAX_VAL:
> > > +             retval =3D cap_data.max_value;
> > > +             break;
> > > +     case MIN_VAL:
> > > +             retval =3D cap_data.min_value;
> > > +             break;
> > > +     case STEP_VAL:
> > > +             retval =3D cap_data.step;
> > > +             break;
> > > +     default:
> > > +             return -EINVAL;
> > > +     }
> > > +     return sysfs_emit(buf, "%u\n", retval);
> > > +}
> > > +
> > > +/* Simple attribute creation */
> > > +
> > > +/*
> > > + * att_current_value_store() - Set the current value of the given at=
tribute
> > > + * @kobj: Pointer to the driver object.
> > > + * @kobj_attribute: Pointer to the attribute calling this function.
> > > + * @buf: The buffer to read from, this is parsed to `int` type.
> > > + * @count: Required by sysfs attribute macros, pass in from the call=
ee attr.
> > > + * @tunable_attr: The attribute to be stored.
> > > + *
> > > + * This function is intended to be generic so it can be called from =
any
> > > + * attribute's "current_value_store" which works only with integers.=
 The
> > > + * integer to be sent to the WMI method is range checked and an erro=
r returned
> > > + * if out of range.
> > > + *
> > > + * If the value is valid and WMI is success, then the sysfs attribut=
e is
> > > + * notified.
> > > + *
> > > + * Returns: Either count, or an error.
> > > + */
> > > +ssize_t attr_current_value_store(struct kobject *kobj,
> > > +                              struct kobj_attribute *attr, const cha=
r *buf,
> > > +                              size_t count,
> > > +                              struct tunable_attr_01 *tunable_attr)
> > > +{
> > > +     struct capability_data_01 cap_data;
> > > +     struct lenovo_wmi_om_priv *priv;
> > > +     int mode =3D SMARTFAN_MODE_CUSTOM;
> > > +     u32 value;
> > > +     int err;
> > > +
> > > +     struct lenovo_wmi_attr_id attr_id =3D { mode << 8,
> >
> > Similar comment about the mode here too.
> >
> > > +                                           tunable_attr->feature_id,
> > > +                                           tunable_attr->device_id }=
;
> > > +
> > > +     err =3D kstrtouint(buf, 10, &value);
> > > +     if (err) {
> > > +             pr_err("Error converting value to int: %u\n", err);
> > > +             return err;
> > > +     }
> > > +
> > > +     cap_data =3D tunable_attr->capdata;
> > > +
> > > +     if (value < cap_data.min_value || value > cap_data.max_value)
> > > +             return -EINVAL;
> > > +
> > > +     priv =3D get_first_wmi_priv();
> > > +     if (!priv)
> > > +             return -ENODEV;
> > > +
> > > +     guard(mutex)(&call_mutex);
> > > +     err =3D lenovo_wmidev_evaluate_method_2(priv->wdev, 0x0,
> > > +                                           WMI_METHOD_ID_VALUE_SET,
> > > +                                           *(int *)&attr_id, value, =
NULL);
> > > +
> > > +     if (err) {
> > > +             pr_err("Error setting attribute: %u\n", err);
> > > +             return err;
> > > +     }
> > > +
> > > +     tunable_attr->store_value =3D value;
> > > +
> > > +     sysfs_notify(kobj, NULL, attr->attr.name);
> > > +
> > > +     return count;
> > > +};
> > > +
> > > +/*
> > > + * attr_current_value_show() - Get the current value of the given at=
tribute
> > > + * @kobj: Pointer to the driver object.
> > > + * @kobj_attribute: Pointer to the attribute calling this function.
> > > + * @buf: The buffer to write to.
> > > + * @tunable_attr: The attribute to be read.
> > > + *
> > > + * This function is intended to be generic so it can be called from =
any "_show"
> > > + * attribute which works only with integers.
> > > + *
> > > + * If the WMI is success, then the sysfs attribute is notified.
> > > + *
> > > + * Returns: Either count, or an error.
> > > + */
> > > +ssize_t attr_current_value_show(struct kobject *kobj,
> > > +                             struct kobj_attribute *attr, char *buf,
> > > +                             struct tunable_attr_01 *tunable_attr)
> > > +{
> > > +     struct lenovo_wmi_om_priv *priv;
> > > +     int mode =3D SMARTFAN_MODE_CUSTOM;
> > > +     int retval;
> > > +     int err;
> > > +
> > > +     struct lenovo_wmi_attr_id attr_id =3D { mode << 8,
> >
> > Same comment about SMARTFAN_MODE_CUSTOM here.
> >
>=20
> In this case it may be needed, discussion ongoing in thread 0/4.
>=20
> > > +                                           tunable_attr->feature_id,
> > > +                                           tunable_attr->device_id }=
;
> > > +
> > > +     priv =3D get_first_wmi_priv();
> > > +     if (!priv)
> > > +             return -ENODEV;
> > > +
> > > +     guard(mutex)(&call_mutex);
> > > +     err =3D lenovo_wmidev_evaluate_method_1(priv->wdev, 0x0,
> > > +                                           WMI_METHOD_ID_VALUE_GET,
> > > +                                           *(int *)&attr_id, &retval=
);
> > > +
> > > +     if (err) {
> > > +             pr_err("Error getting attribute: %u\n", err);
> > > +             return err;
> > > +     }
> > > +
> > > +     return sysfs_emit(buf, "%u\n", retval);
> > > +}
> > > +
> > > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
> > > +                         "Set the CPU sustained power limit");
> > > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
> > > +                         "Set the CPU slow package power tracking li=
mit");
> > > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
> > > +                         "Set the CPU fast package power tracking li=
mit");
> > > +
> > > +static const struct capdata01_attr_group capdata01_attr_groups[] =3D=
 {
> > > +     { &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
> > > +     { &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
> > > +     { &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
> > > +     {},
> > > +};
> > > +
> > > +static int other_method_fw_attr_add(struct lenovo_wmi_om_priv *priv)
> > > +{
> > > +     int err, i;
> > > +
> > > +     err =3D fw_attributes_class_get(&fw_attr_class);
> > > +     if (err) {
> > > +             pr_err("Failed to get firmware_attributes_class: %u\n",=
 err);
> > > +             return err;
> > > +     }
> > > +
> > > +     priv->fw_attr_dev =3D device_create(fw_attr_class, NULL, MKDEV(=
0, 0),
> > > +                                       NULL, "%s", FW_ATTR_FOLDER);
> > > +     if (IS_ERR(priv->fw_attr_dev)) {
> > > +             err =3D PTR_ERR(priv->fw_attr_dev);
> > > +             pr_err("Failed to create firmware_attributes_class devi=
ce: %u\n",
> > > +                    err);
> > > +             goto fail_class_get;
> > > +     }
> > > +
> > > +     priv->fw_attr_kset =3D kset_create_and_add("attributes", NULL,
> > > +                                              &priv->fw_attr_dev->ko=
bj);
> > > +     if (!priv->fw_attr_kset) {
> > > +             err =3D -ENOMEM;
> > > +             pr_err("Failed to create firmware_attributes_class kset=
: %u\n",
> > > +                    err);
> > > +             goto err_destroy_classdev;
> > > +     }
> > > +
> > > +     for (i =3D 0; i < ARRAY_SIZE(capdata01_attr_groups) - 1; i++) {
> > > +             err =3D attr_capdata01_setup(
> > > +                     capdata01_attr_groups[i].tunable_attr);
> > > +             if (err) {
> > > +                     pr_err("Failed to populate capability data for =
%s: %u\n",
> > > +                            capdata01_attr_groups[i].attr_group->nam=
e, err);
> >
> > This specific error could be a bit noisy because it's a dependency on
> > the other driver in case one attribute returns not supported.
> >
> > Could you instead detect EOPNOTSUPP specifically and only show error if
> > not EOPNOTSUPP?
> >
>=20
> Easy fix, will do. I'll also add a wmi_dev_exists() here before the
> loop to exit early.
>=20
> > > +                     continue;
> > > +             }
> > > +
> > > +             err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> > > +                                      capdata01_attr_groups[i].attr_=
group);
> > > +             if (err) {
> > > +                     pr_err("Failed to create sysfs-group for %s: %u=
\n",
> > > +                            capdata01_attr_groups[i].attr_group->nam=
e, err);
> > > +                     goto err_remove_groups;
> > > +             }
> > > +     }
> > > +
> > > +     return 0;
> > > +
> > > +err_remove_groups:
> > > +     while (i-- > 0) {
> > > +             sysfs_remove_group(&priv->fw_attr_kset->kobj,
> > > +                                capdata01_attr_groups[i].attr_group)=
;
> > > +     }
> > > +
> > > +     return err;
> > > +
> > > +err_destroy_classdev:
> > > +     device_destroy(fw_attr_class, MKDEV(0, 0));
> > > +
> > > +     return err;
> > > +
> > > +fail_class_get:
> > > +     fw_attributes_class_put();
> > > +
> > > +     return err;

I highly suspect the intermediate return errs in the previous labels will=
=20
cause leaks. Don't you want to rollback everything on error?

--=20
 i.


> > > +}
> > > +
> > > +static int lenovo_wmi_other_probe(struct wmi_device *wdev, const voi=
d *context)
> > > +{
> > > +     struct lenovo_wmi_om_priv *priv;
> > > +
> > > +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > > +     if (!priv)
> > > +             return -ENOMEM;
> > > +
> > > +     priv->wdev =3D wdev;
> > > +
> > > +     guard(mutex)(&om_list_mutex);
> > > +     list_add_tail(&priv->list, &om_wmi_list);
> > > +
> > > +     return other_method_fw_attr_add(priv);
> > > +}
> > > +
> > > +static void lenovo_wmi_other_remove(struct wmi_device *wdev)
> > > +{
> > > +     struct lenovo_wmi_om_priv *priv =3D dev_get_drvdata(&wdev->dev)=
;
> > > +
> > > +     guard(mutex)(&om_list_mutex);
> > > +     list_del(&priv->list);
> > > +     kset_unregister(priv->fw_attr_kset);
> > > +     device_destroy(fw_attr_class, MKDEV(0, 0));
> > > +     fw_attributes_class_put();
> > > +}
> > > +
> > > +static struct wmi_driver lenovo_wmi_other_driver =3D {
> > > +     .driver =3D { .name =3D "lenovo_wmi_other" },
> > > +     .id_table =3D lenovo_wmi_other_id_table,
> > > +     .probe =3D lenovo_wmi_other_probe,
> > > +     .remove =3D lenovo_wmi_other_remove,
> > > +};
> > > +
> > > +module_wmi_driver(lenovo_wmi_other_driver);
> > > +
> > > +MODULE_IMPORT_NS("CAPDATA_WMI");
> > > +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_other_id_table);
> > > +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > > +MODULE_DESCRIPTION("Lenovo Other Method WMI Driver");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86=
/lenovo-wmi.h
> > > index 53cea84a956b..1c8358551ba6 100644
> > > --- a/drivers/platform/x86/lenovo-wmi.h
> > > +++ b/drivers/platform/x86/lenovo-wmi.h
> > > @@ -42,6 +42,14 @@ struct lenovo_wmi_attr_id {
> > >       u32 device_id : 8; /* CPU/GPU/... */
> > >   } __packed;
> > >
> > > +enum attribute_property {
> > > +     DEFAULT_VAL,
> > > +     MAX_VAL,
> > > +     MIN_VAL,
> > > +     STEP_VAL,
> > > +     SUPPORTED,
> > > +};
> > > +
> > >   /* Data struct for LENOVO_CAPABILITY_DATA_01 */
> > >   struct capability_data_01 {
> > >       u32 id;
> > > @@ -52,6 +60,14 @@ struct capability_data_01 {
> > >       u32 max_value;
> > >   };
> > >
> > > +/* Tunable attribute that uses LENOVO_CAPABILITY_DATA_01 */
> > > +struct tunable_attr_01 {
> > > +     struct capability_data_01 capdata;
> > > +     u32 device_id;
> > > +     u32 feature_id;
> > > +     u32 store_value;
> > > +};
> > > +
> > >   /* General Use functions */
> > >   static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev, u=
8 instance,
> > >                                        u32 method_id, struct acpi_buf=
fer *in,
> > > @@ -122,4 +138,104 @@ int lenovo_wmidev_evaluate_method_1(struct wmi_=
device *wdev, u8 instance,
> > >   int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
> > >                            struct capability_data_01 *cap_data);
> > >
> > > +/* Other Method attribute functions */
> > > +ssize_t attr_capdata01_show(struct kobject *kobj, struct kobj_attrib=
ute *attr,
> > > +                         char *buf, struct tunable_attr_01 *tunable_=
attr,
> > > +                         enum attribute_property prop);
> > > +
> > > +ssize_t attr_current_value_store(struct kobject *kobj,
> > > +                              struct kobj_attribute *attr, const cha=
r *buf,
> > > +                              size_t count,
> > > +                              struct tunable_attr_01 *tunable_attr);
> > > +
> > > +ssize_t attr_current_value_show(struct kobject *kobj,
> > > +                             struct kobj_attribute *attr, char *buf,
> > > +                             struct tunable_attr_01 *tunable_attr);
> > > +
> > > +ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *a=
ttr,
> > > +                   char *buf);
> > > +
> > > +ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *a=
ttr,
> > > +                   char *buf)
> > > +{
> > > +     return sysfs_emit(buf, "integer\n");
> > > +}
> > > +
> > > +/* Other Method attribute macros */
> > > +#define __LL_ATTR_RO(_func, _name)                                  =
  \
> > > +     {                                                             \
> > > +             .attr =3D { .name =3D __stringify(_name), .mode =3D 044=
4 }, \
> > > +             .show =3D _func##_##_name##_show,                      =
 \
> > > +     }
> > > +
> > > +#define __LL_ATTR_RO_AS(_name, _show)                               =
  \
> > > +     {                                                             \
> > > +             .attr =3D { .name =3D __stringify(_name), .mode =3D 044=
4 }, \
> > > +             .show =3D _show,                                       =
 \
> > > +     }
> > > +
> > > +#define __LL_ATTR_RW(_func, _name) \
> > > +     __ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_s=
tore)
> > > +
> > > +/* Shows a formatted static variable */
> > > +#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)               =
          \
> > > +     static ssize_t _attrname##_##_prop##_show(                     =
       \
> > > +             struct kobject *kobj, struct kobj_attribute *attr, char=
 *buf) \
> > > +     {                                                              =
       \
> > > +             return sysfs_emit(buf, _fmt, _val);                    =
       \
> > > +     }                                                              =
       \
> > > +     static struct kobj_attribute attr_##_attrname##_##_prop =3D    =
         \
> > > +             __LL_ATTR_RO(_attrname, _prop)
> > > +
> > > +/* Attribute current_value show/store */
> > > +#define __LL_TUNABLE_RW_CAP01(_attrname)                            =
          \
> > > +     static ssize_t _attrname##_current_value_store(                =
       \
> > > +             struct kobject *kobj, struct kobj_attribute *attr,     =
       \
> > > +             const char *buf, size_t count)                         =
       \
> > > +     {                                                              =
       \
> > > +             return attr_current_value_store(kobj, attr, buf, count,=
       \
> > > +                                             &_attrname);           =
       \
> > > +     }                                                              =
       \
> > > +     static ssize_t _attrname##_current_value_show(                 =
       \
> > > +             struct kobject *kobj, struct kobj_attribute *attr, char=
 *buf) \
> > > +     {                                                              =
       \
> > > +             return attr_current_value_show(kobj, attr, buf, &_attrn=
ame);  \
> > > +     }                                                              =
       \
> > > +     static struct kobj_attribute attr_##_attrname##_current_value =
=3D       \
> > > +             __LL_ATTR_RW(_attrname, current_value)
> > > +
> > > +/* Attribute property show only */
> > > +#define __LL_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)         =
          \
> > > +     static ssize_t _attrname##_##_prop##_show(                     =
       \
> > > +             struct kobject *kobj, struct kobj_attribute *attr, char=
 *buf) \
> > > +     {                                                              =
       \
> > > +             return attr_capdata01_show(kobj, attr, buf, &_attrname,=
       \
> > > +                                        _prop_type);                =
       \
> > > +     }                                                              =
       \
> > > +     static struct kobj_attribute attr_##_attrname##_##_prop =3D    =
         \
> > > +             __LL_ATTR_RO(_attrname, _prop)
> > > +
> > > +#define ATTR_GROUP_LL_TUNABLE_CAP01(_attrname, _fsname, _dispname)  =
   \
> > > +     __LL_TUNABLE_RW_CAP01(_attrname);                              =
\
> > > +     __LL_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);  =
\
> > > +     __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);   =
\
> > > +     __LL_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);          =
\
> > > +     __LL_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);          =
\
> > > +     __LL_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);  =
\
> > > +     static struct kobj_attribute attr_##_attrname##_type =3D       =
  \
> > > +             __LL_ATTR_RO_AS(type, int_type_show);                  =
\
> > > +     static struct attribute *_attrname##_attrs[] =3D {             =
  \
> > > +             &attr_##_attrname##_current_value.attr,                =
\
> > > +             &attr_##_attrname##_default_value.attr,                =
\
> > > +             &attr_##_attrname##_display_name.attr,                 =
\
> > > +             &attr_##_attrname##_max_value.attr,                    =
\
> > > +             &attr_##_attrname##_min_value.attr,                    =
\
> > > +             &attr_##_attrname##_scalar_increment.attr,             =
\
> > > +             &attr_##_attrname##_type.attr,                         =
\
> > > +             NULL,                                                  =
\
> > > +     };                                                             =
\
> > > +     static const struct attribute_group _attrname##_attr_group =3D =
{ \
> > > +             .name =3D _fsname, .attrs =3D _attrname##_attrs        =
    \
> > > +     }
> > > +
> > >   #endif /* !_LENOVO_WMI_H_ */
> >
>=20
--8323328-980477018-1736274079=:1001--
