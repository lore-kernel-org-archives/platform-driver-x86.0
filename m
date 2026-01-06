Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487C733A71C;
	Tue,  6 Jan 2026 15:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767713728; cv=none; b=DRwx7pOZ/XUnT1fVOmkoy3DqGf9Fh2k6BMMle8ZnFbFSSvwaRv/6oMdDrCWTo0J3dlaBFegFWrShNHK8mTC21N1GR7GYLH/sbYUbpqE+KaTHPAYKf7HgpVwsa9Klje9oqVuSWCfj7i1jwN6xGUmoQThkRYsnaB2QgK7RVL9D6+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767713728; c=relaxed/simple;
	bh=/33ZTKnj2UqJ+UensJ1VsEkQPIO8aoplTTiFuQaNSmQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qKl9EFTfI/48ka92QQyFyVTytD6Zx67a83Eo6/eko1+iIWEan6RIC9oIZl61WH2gX+aouOqAkLPTq2XHok2xC8Q22QjBehFhx8tDH24uuXUQaRepO/SyPEXDriWqRu7eE5tCdZhEwdbGD524EZMNgtGuHcQf8yBq7q1CYVX28Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ifsu6UFj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ifsu6UFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767713726; x=1799249726;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=/33ZTKnj2UqJ+UensJ1VsEkQPIO8aoplTTiFuQaNSmQ=;
  b=Ifsu6UFj7yRROHQgXwH+NDOgzWAKGk+vuFbfgUJ9RWLRbpTI5odExmZB
   dhVqLYy2nEDolRJCka/epx0slLfPnbGZ/iojByCUgWZTa7UI5f/lgsKUx
   xctwHSe2OHbwv4lIxx7eM0QTDn17vscC80b1AYjpyax2KcA1Hk9a2u7N6
   /9IS0hiahO0FKIvHXkDb+YdCrC0FkQY+MlGUw+dE43xC69FDXY5+Qso5s
   MOJJ7z808eAX/DYO4fFMWDoLHOsN0St1h6SiT6lJgQDCCSRT+LX21pt6a
   TlnyEL35QGnnvUQf1f/KdcUgjuzSQ45xl2B+NPj28T76fp96FYRO4a3q2
   Q==;
X-CSE-ConnectionGUID: v9e6EyiZSVeZPa8BuT3x8A==
X-CSE-MsgGUID: VXQAqhlZQwaSZcbLqiCTSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69060606"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="69060606"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 07:35:26 -0800
X-CSE-ConnectionGUID: UmW3yBRQT9uuf+PecoQE+A==
X-CSE-MsgGUID: 1/y+zSbyRgiaooP/+Uu6fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="201899409"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.6])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 07:35:22 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 Jan 2026 17:35:19 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux@weissschuh.net, 
    Dell.Client.Kernel@dell.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/9] platform/wmi: Introduce marshalling support
In-Reply-To: <20251220204622.3541-2-W_Armin@gmx.de>
Message-ID: <ad784ac8-c287-7a01-5f30-100cc26f9786@linux.intel.com>
References: <20251220204622.3541-1-W_Armin@gmx.de> <20251220204622.3541-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-630177795-1767710779=:1051"
Content-ID: <09974efc-5714-c204-8c0c-cc4f934750f2@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-630177795-1767710779=:1051
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <7760fe3a-d095-c08f-a0c3-072822c13c2b@linux.intel.com>

On Sat, 20 Dec 2025, Armin Wolf wrote:

> The Windows WMI-ACPI driver likely uses wmilib [1] to interact with
> the WMI service in userspace. Said library uses plain byte buffers
> for exchanging data, so the WMI-ACPI driver has to convert between
> those byte buffers and ACPI objects returned by the ACPI firmware.
>=20
> The format of the byte buffer is publicly documented [2], and after
> some reverse eingineering of the WMI-ACPI driver using a set of custom
> ACPI tables, the following conversion rules have been discovered:
>=20
> - ACPI integers are always converted into a uint32
> - ACPI strings are converted into special WMI strings
> - ACPI buffers are copied as-is
> - ACPI packages are unpacked
>=20
> Extend the ACPI-WMI driver to also perform this kind of marshalling
> for WMI data blocks, methods and events. During so gives us a number

Doing so ?

> of benefits:
>=20
> - WMI drivers are not restricted to a fixed set of supported ACPI data
>   types anymore, see dell-wmi-aio (integer vs buffer) and
>   hp-wmi-sensors (string vs buffer)
>=20
> - correct marshalling of WMI strings when data blocks are marked
>   as requiring ACPI strings instead of ACPI buffers
>=20
> - development of WMI drivers without having to understand ACPI
>=20
> This eventually should result in better compatibility with some
> ACPI firmware implementations and in simpler WMI drivers. There are
> however some differences between the original Windows driver and
> the ACPI-WMI driver when it comes to ACPI object conversions:
>=20
> - the Windows driver copies internal _ACPI_METHOD_ARGUMENT_V1 data
>   structures into the output buffer when encountering nested ACPI
>   packages. This is very likely an error inside the driver itself, so
>   we do not support nested ACPI packages.
>=20
> - when converting WMI strings (UTF-16LE) into ACPI strings (ASCII),
>   the Windows driver replaces non-ascii characters (=E4 -> a, & -> ?)
>   instead of returning an error. This behavior is not documented
>   anywhere and might lead to severe errors in some cases (like
>   setting BIOS passwords over WMI), so we simply return an error.
>=20
> As the current bus-based WMI API is based on ACPI buffers, a new
> API is necessary. The legacy GUID-based WMI API is not extended to
> support marshalling, as WMI drivers using said API are expected to
> move to the bus-based WMI API in the future.
>=20
> [1] https://learn.microsoft.com/de-de/windows-hardware/drivers/ddi/wmilib=
/
> [2] https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/
>     driver-defined-wmi-data-items
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/wmi/Makefile      |   2 +-
>  drivers/platform/wmi/core.c        | 160 +++++++++++++++++++-
>  drivers/platform/wmi/internal.h    |  14 ++
>  drivers/platform/wmi/marshalling.c | 233 +++++++++++++++++++++++++++++
>  include/linux/wmi.h                |  39 ++++-
>  5 files changed, 441 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/platform/wmi/internal.h
>  create mode 100644 drivers/platform/wmi/marshalling.c
>=20
> diff --git a/drivers/platform/wmi/Makefile b/drivers/platform/wmi/Makefil=
e
> index 98393d7391ec..6f2bf8cc709e 100644
> --- a/drivers/platform/wmi/Makefile
> +++ b/drivers/platform/wmi/Makefile
> @@ -4,5 +4,5 @@
>  # ACPI WMI core
>  #
> =20
> -wmi-y=09=09=09:=3D core.o
> +wmi-y=09=09=09:=3D core.o marshalling.o
>  obj-$(CONFIG_ACPI_WMI)=09+=3D wmi.o
> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
> index 6878c4fcb0b5..1601bf9fe135 100644
> --- a/drivers/platform/wmi/core.c
> +++ b/drivers/platform/wmi/core.c
> @@ -23,6 +23,7 @@
>  #include <linux/idr.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/limits.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/rwsem.h>
> @@ -33,6 +34,8 @@
>  #include <linux/wmi.h>
>  #include <linux/fs.h>
> =20
> +#include "internal.h"
> +
>  MODULE_AUTHOR("Carlos Corbacho");
>  MODULE_DESCRIPTION("ACPI-WMI Mapping Driver");
>  MODULE_LICENSE("GPL");
> @@ -302,7 +305,7 @@ acpi_status wmi_evaluate_method(const char *guid_stri=
ng, u8 instance, u32 method
>  EXPORT_SYMBOL_GPL(wmi_evaluate_method);
> =20
>  /**
> - * wmidev_evaluate_method - Evaluate a WMI method
> + * wmidev_evaluate_method - Evaluate a WMI method (deprecated)
>   * @wdev: A wmi bus device from a driver
>   * @instance: Instance index
>   * @method_id: Method ID to call
> @@ -360,6 +363,70 @@ acpi_status wmidev_evaluate_method(struct wmi_device=
 *wdev, u8 instance, u32 met
>  }
>  EXPORT_SYMBOL_GPL(wmidev_evaluate_method);
> =20
> +/**
> + * wmidev_invoke_method - Invoke a WMI method
> + * @wdev: A wmi bus device from a driver
> + * @instance: Instance index
> + * @method_id: Method ID to call
> + * @in: Mandatory WMI buffer containing input for the method call
> + * @out: Optional WMI buffer to return the method results
> + *
> + * Invoke a WMI method, the caller must free the resulting data inside @=
out.
> + * Said data is guaranteed to be aligned on a 8-byte boundary.
> + *
> + * Return: 0 on success or negative error code on failure.
> + */
> +int wmidev_invoke_method(struct wmi_device *wdev, u8 instance, u32 metho=
d_id,
> +=09=09=09 const struct wmi_buffer *in, struct wmi_buffer *out)
> +{
> +=09struct wmi_block *wblock =3D container_of(wdev, struct wmi_block, dev=
);
> +=09struct acpi_buffer aout =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +=09struct acpi_buffer ain;
> +=09union acpi_object *obj;
> +=09acpi_status status;
> +=09int ret;
> +
> +=09if (wblock->gblock.flags & ACPI_WMI_STRING) {
> +=09=09ret =3D wmi_marshal_string(in, &ain);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +=09} else {
> +=09=09if (in->length > U32_MAX)
> +=09=09=09return -E2BIG;
> +
> +=09=09ain.length =3D in->length;
> +=09=09ain.pointer =3D in->data;
> +=09}
> +
> +=09if (out)
> +=09=09status =3D wmidev_evaluate_method(wdev, instance, method_id, &ain,=
 &aout);
> +=09else
> +=09=09status =3D wmidev_evaluate_method(wdev, instance, method_id, &ain,=
 NULL);
> +
> +=09if (wblock->gblock.flags & ACPI_WMI_STRING)
> +=09=09kfree(ain.pointer);
> +
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +
> +=09if (!out)
> +=09=09return 0;
> +
> +=09obj =3D aout.pointer;
> +=09if (!obj) {
> +=09=09out->length =3D 0;
> +=09=09out->data =3D ZERO_SIZE_PTR;
> +
> +=09=09return 0;
> +=09}
> +
> +=09ret =3D wmi_unmarshal_acpi_object(obj, out);
> +=09kfree(obj);
> +
> +=09return ret;
> +}
> +EXPORT_SYMBOL_GPL(wmidev_invoke_method);
> +
>  static acpi_status __query_block(struct wmi_block *wblock, u8 instance,
>  =09=09=09=09 struct acpi_buffer *out)
>  {
> @@ -432,7 +499,7 @@ acpi_status wmi_query_block(const char *guid_string, =
u8 instance,
>  EXPORT_SYMBOL_GPL(wmi_query_block);
> =20
>  /**
> - * wmidev_block_query - Return contents of a WMI block
> + * wmidev_block_query - Return contents of a WMI block (deprectated)
>   * @wdev: A wmi bus device from a driver
>   * @instance: Instance index
>   *
> @@ -452,6 +519,33 @@ union acpi_object *wmidev_block_query(struct wmi_dev=
ice *wdev, u8 instance)
>  }
>  EXPORT_SYMBOL_GPL(wmidev_block_query);
> =20
> +/**
> + * wmidev_query_block - Return contents of a WMI data block
> + * @wdev: A wmi bus device from a driver
> + * @instance: Instance index
> + * @out: WMI buffer to fill
> + *
> + * Query a WMI data block, the caller must free the resulting data insid=
e @out.
> + * Said data is guaranteed to be aligned on a 8-byte boundary.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int wmidev_query_block(struct wmi_device *wdev, u8 instance, struct wmi_=
buffer *out)
> +{
> +=09union acpi_object *obj;
> +=09int ret;
> +
> +=09obj =3D wmidev_block_query(wdev, instance);
> +=09if (!obj)
> +=09=09return -EIO;
> +
> +=09ret =3D wmi_unmarshal_acpi_object(obj, out);
> +=09kfree(obj);
> +
> +=09return ret;
> +}
> +EXPORT_SYMBOL_GPL(wmidev_query_block);
> +
>  /**
>   * wmi_set_block - Write to a WMI block (deprecated)
>   * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-6541=
7f2f49ba
> @@ -486,7 +580,7 @@ acpi_status wmi_set_block(const char *guid_string, u8=
 instance, const struct acp
>  EXPORT_SYMBOL_GPL(wmi_set_block);
> =20
>  /**
> - * wmidev_block_set - Write to a WMI block
> + * wmidev_block_set - Write to a WMI block (deprecated)
>   * @wdev: A wmi bus device from a driver
>   * @instance: Instance index
>   * @in: Buffer containing new values for the data block
> @@ -535,6 +629,46 @@ acpi_status wmidev_block_set(struct wmi_device *wdev=
, u8 instance, const struct
>  }
>  EXPORT_SYMBOL_GPL(wmidev_block_set);
> =20
> +/**
> + * wmidev_set_block - Write to a WMI data block
> + * @wdev: A wmi bus device from a driver
> + * @instance: Instance index
> + * @in: WMI buffer containing new values for the data block
> + *
> + * Write the content of @in into a WMI data block.
> + *
> + * Return: 0 on success or negative error code on failure.
> + */
> +int wmidev_set_block(struct wmi_device *wdev, u8 instance, const struct =
wmi_buffer *in)
> +{
> +=09struct wmi_block *wblock =3D container_of(wdev, struct wmi_block, dev=
);
> +=09struct acpi_buffer buffer;
> +=09acpi_status status;
> +=09int ret;
> +
> +=09if (wblock->gblock.flags & ACPI_WMI_STRING) {
> +=09=09ret =3D wmi_marshal_string(in, &buffer);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +=09} else {
> +=09=09if (in->length > U32_MAX)
> +=09=09=09return -E2BIG;
> +
> +=09=09buffer.length =3D in->length;
> +=09=09buffer.pointer =3D in->data;
> +=09}
> +
> +=09status =3D wmidev_block_set(wdev, instance, &buffer);
> +=09if (wblock->gblock.flags & ACPI_WMI_STRING)
> +=09=09kfree(buffer.pointer);
> +
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(wmidev_set_block);
> +
>  /**
>   * wmi_install_notify_handler - Register handler for WMI events (depreca=
ted)
>   * @guid: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49b=
a
> @@ -862,7 +996,7 @@ static int wmi_dev_probe(struct device *dev)
>  =09=09return -ENODEV;
>  =09}
> =20
> -=09if (wdriver->notify) {
> +=09if (wdriver->notify || wdriver->notify_new) {
>  =09=09if (test_bit(WMI_NO_EVENT_DATA, &wblock->flags) && !wdriver->no_no=
tify_data)
>  =09=09=09return -ENODEV;
>  =09}
> @@ -1221,6 +1355,8 @@ static int wmi_get_notify_data(struct wmi_block *wb=
lock, union acpi_object **obj
>  static void wmi_notify_driver(struct wmi_block *wblock, union acpi_objec=
t *obj)
>  {
>  =09struct wmi_driver *driver =3D to_wmi_driver(wblock->dev.dev.driver);
> +=09struct wmi_buffer buffer;
> +=09int ret;
> =20
>  =09if (!obj && !driver->no_notify_data) {
>  =09=09dev_warn(&wblock->dev.dev, "Event contains no event data\n");
> @@ -1229,6 +1365,22 @@ static void wmi_notify_driver(struct wmi_block *wb=
lock, union acpi_object *obj)
> =20
>  =09if (driver->notify)
>  =09=09driver->notify(&wblock->dev, obj);
> +
> +=09if (driver->notify_new) {
> +=09=09if (!obj) {
> +=09=09=09driver->notify_new(&wblock->dev, NULL);
> +=09=09=09return;
> +=09=09}
> +
> +=09=09ret =3D wmi_unmarshal_acpi_object(obj, &buffer);
> +=09=09if (ret < 0) {
> +=09=09=09dev_warn(&wblock->dev.dev, "Failed to unmarshal event data: %d\=
n", ret);
> +=09=09=09return;
> +=09=09}
> +
> +=09=09driver->notify_new(&wblock->dev, &buffer);
> +=09=09kfree(buffer.data);
> +=09}
>  }
> =20
>  static int wmi_notify_device(struct device *dev, void *data)
> diff --git a/drivers/platform/wmi/internal.h b/drivers/platform/wmi/inter=
nal.h
> new file mode 100644
> index 000000000000..707d1a4711e0
> --- /dev/null
> +++ b/drivers/platform/wmi/internal.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Internal interfaces used by the WMI core.
> + *
> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
> + */
> +
> +#ifndef _WMI_INTERNAL_H_
> +#define _WMI_INTERNAL_H_
> +
> +int wmi_unmarshal_acpi_object(const union acpi_object *obj, struct wmi_b=
uffer *buffer);
> +int wmi_marshal_string(const struct wmi_buffer *buffer, struct acpi_buff=
er *out);
> +
> +#endif /* _WMI_INTERNAL_H_ */
> diff --git a/drivers/platform/wmi/marshalling.c b/drivers/platform/wmi/ma=
rshalling.c
> new file mode 100644
> index 000000000000..476b87b145e3
> --- /dev/null
> +++ b/drivers/platform/wmi/marshalling.c
> @@ -0,0 +1,233 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * ACPI-WMI buffer marshalling.
> + *
> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/overflow.h>
> +#include <linux/slab.h>
> +#include <linux/unaligned.h>
> +#include <linux/wmi.h>
> +
> +#include <kunit/visibility.h>
> +
> +#include "internal.h"
> +
> +static int wmi_adjust_buffer_length(size_t *length, const union acpi_obj=
ect *obj)
> +{
> +=09size_t alignment, size;
> +
> +=09switch (obj->type) {
> +=09case ACPI_TYPE_INTEGER:
> +=09=09/*
> +=09=09 * Integers are threated as 32 bit even if the ACPI DSDT
> +=09=09 * declares 64 bit integer width.
> +=09=09 */
> +=09=09alignment =3D 4;
> +=09=09size =3D sizeof(u32);
> +=09=09break;
> +=09case ACPI_TYPE_STRING:
> +=09=09/*
> +=09=09 * Strings begin with a single little-endian 16-bit field containi=
ng
> +=09=09 * the string length in bytes and are encoded as UTF-16LE with a t=
erminating
> +=09=09 * nul character.
> +=09=09 */
> +=09=09if (obj->string.length + 1 > U16_MAX / 2)
> +=09=09=09return -EOVERFLOW;
> +
> +=09=09alignment =3D 2;
> +=09=09size =3D struct_size_t(struct wmi_string, chars, obj->string.lengt=
h + 1);
> +=09=09break;
> +=09case ACPI_TYPE_BUFFER:
> +=09=09/*
> +=09=09 * Buffers are copied as-is.
> +=09=09 */
> +=09=09alignment =3D 1;
> +=09=09size =3D obj->buffer.length;
> +=09=09break;
> +=09default:
> +=09=09return -EPROTO;
> +=09}
> +
> +=09*length =3D size_add(ALIGN(*length, alignment), size);

Include for ALIGN()

> +
> +=09return 0;
> +}
> +
> +static int wmi_obj_get_buffer_length(const union acpi_object *obj, size_=
t *length)
> +{
> +=09size_t total =3D 0;
> +=09int ret;
> +
> +=09if (obj->type =3D=3D ACPI_TYPE_PACKAGE) {
> +=09=09for (int i =3D 0; i < obj->package.count; i++) {
> +=09=09=09ret =3D wmi_adjust_buffer_length(&total, &obj->package.elements=
[i]);
> +=09=09=09if (ret < 0)
> +=09=09=09=09return ret;
> +=09=09}
> +=09} else {
> +=09=09ret =3D wmi_adjust_buffer_length(&total, obj);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +=09}
> +
> +=09*length =3D total;
> +
> +=09return 0;
> +}
> +
> +static int wmi_obj_transform_simple(const union acpi_object *obj, u8 *bu=
ffer, size_t *consumed)
> +{
> +=09struct wmi_string *string;
> +=09size_t length;
> +=09__le32 value;
> +=09u8 *aligned;
> +
> +=09switch (obj->type) {
> +=09case ACPI_TYPE_INTEGER:
> +=09=09aligned =3D PTR_ALIGN(buffer, 4);
> +=09=09length =3D sizeof(value);
> +
> +=09=09value =3D cpu_to_le32(obj->integer.value);
> +=09=09memcpy(aligned, &value, length);
> +=09=09break;
> +=09case ACPI_TYPE_STRING:
> +=09=09aligned =3D PTR_ALIGN(buffer, 2);
> +=09=09string =3D (struct wmi_string *)aligned;
> +=09=09length =3D struct_size(string, chars, obj->string.length + 1);
> +
> +=09=09/* We do not have to worry about unaligned accesses here as the WM=
I
> +=09=09 * string will already be aligned on a two-byte boundary.
> +=09=09 */
> +=09=09string->length =3D cpu_to_le16((obj->string.length + 1) * 2);
> +=09=09for (int i =3D 0; i < obj->string.length; i++)
> +=09=09=09string->chars[i] =3D cpu_to_le16(obj->string.pointer[i]);
> +
> +=09=09/*
> +=09=09 * The Windows WMI-ACPI driver always emits a terminating nul char=
acter,
> +=09=09 * so we emulate this behavior here as well.
> +=09=09 */
> +=09=09string->chars[obj->string.length] =3D '\0';
> +=09=09break;
> +=09case ACPI_TYPE_BUFFER:
> +=09=09aligned =3D buffer;
> +=09=09length =3D obj->buffer.length;
> +
> +=09=09memcpy(aligned, obj->buffer.pointer, length);
> +=09=09break;
> +=09default:
> +=09=09return -EPROTO;
> +=09}
> +
> +=09*consumed =3D (aligned - buffer) + length;
> +
> +=09return 0;
> +}
> +
> +static int wmi_obj_transform(const union acpi_object *obj, u8 *buffer)
> +{
> +=09size_t consumed;
> +=09int ret;
> +
> +=09if (obj->type =3D=3D ACPI_TYPE_PACKAGE) {
> +=09=09for (int i =3D 0; i < obj->package.count; i++) {
> +=09=09=09ret =3D wmi_obj_transform_simple(&obj->package.elements[i], buf=
fer,
> +=09=09=09=09=09=09       &consumed);
> +=09=09=09if (ret < 0)
> +=09=09=09=09return ret;
> +
> +=09=09=09buffer +=3D consumed;
> +=09=09}
> +=09} else {
> +=09=09ret =3D wmi_obj_transform_simple(obj, buffer, &consumed);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +=09}
> +
> +=09return 0;
> +}
> +
> +int wmi_unmarshal_acpi_object(const union acpi_object *obj, struct wmi_b=
uffer *buffer)
> +{
> +=09ssize_t length;
> +=09u8 *data;
> +=09int ret;
> +
> +=09ret =3D wmi_obj_get_buffer_length(obj, &length);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09data =3D kzalloc(length, GFP_KERNEL);
> +=09if (!data)
> +=09=09return -ENOMEM;
> +
> +=09ret =3D wmi_obj_transform(obj, data);
> +=09if (ret < 0) {
> +=09=09kfree(data);
> +=09=09return ret;
> +=09}
> +
> +=09buffer->length =3D length;
> +=09buffer->data =3D data;
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_IF_KUNIT(wmi_unmarshal_acpi_object);
> +
> +int wmi_marshal_string(const struct wmi_buffer *buffer, struct acpi_buff=
er *out)
> +{
> +=09const struct wmi_string *string;
> +=09u16 length, value;
> +=09size_t chars;
> +=09char *str;
> +
> +=09if (buffer->length < sizeof(*string))
> +=09=09return -ENODATA;
> +
> +=09string =3D buffer->data;
> +=09length =3D get_unaligned_le16(&string->length);
> +=09if (buffer->length < sizeof(*string) + length)
> +=09=09return -ENODATA;
> +
> +=09/* Each character needs to be 16 bits long */
> +=09if (length % 2)
> +=09=09return -EINVAL;
> +
> +=09chars =3D length / 2;
> +=09str =3D kmalloc(chars + 1, GFP_KERNEL);
> +=09if (!str)
> +=09=09return -ENOMEM;
> +
> +=09for (int i =3D 0; i < chars; i++) {
> +=09=09value =3D get_unaligned_le16(&string->chars[i]);
> +
> +=09=09/* ACPI only accepts ASCII strings */
> +=09=09if (value > 0x7F) {
> +=09=09=09kfree(str);
> +=09=09=09return -EINVAL;
> +=09=09}
> +
> +=09=09str[i] =3D value & 0xFF;
> +
> +=09=09/*
> +=09=09 * ACPI strings should only contain a single nul character at the =
end.
> +=09=09 * Because of this we must not copy any padding from the WMI strin=
g.
> +=09=09 */
> +=09=09if (!value) {
> +=09=09=09/* ACPICA wants the length of the string without the nul charac=
ter */
> +=09=09=09out->length =3D i;
> +=09=09=09out->pointer =3D str;
> +=09=09=09return 0;
> +=09=09}
> +=09}
> +
> +=09str[chars] =3D '\0';
> +
> +=09out->length =3D chars;
> +=09out->pointer =3D str;
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_IF_KUNIT(wmi_marshal_string);
> diff --git a/include/linux/wmi.h b/include/linux/wmi.h
> index 665ea7dc8a92..4c2fc3c1f0de 100644
> --- a/include/linux/wmi.h
> +++ b/include/linux/wmi.h
> @@ -11,6 +11,7 @@
>  #include <linux/device.h>
>  #include <linux/acpi.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/types.h>
> =20
>  /**
>   * struct wmi_device - WMI device structure
> @@ -36,6 +37,37 @@ struct wmi_device {
>   */
>  #define to_wmi_device(device)=09container_of_const(device, struct wmi_de=
vice, dev)
> =20
> +/**
> + * struct wmi_buffer - WMI data buffer
> + * @length: Buffer length in bytes
> + * @data: Pointer to the buffer content
> + *
> + * This structure is used to exchange data with the WMI driver core.
> + */
> +struct wmi_buffer {
> +=09size_t length;
> +=09void *data;
> +};
> +
> +/**
> + * struct wmi_string - WMI string representation
> + * @length: Size of @chars in bytes
> + * @chars: UTF16-LE characters with optional nul termination and padding
> + *
> + * This structure is used when exchanging string data over the WMI inter=
face.
> + */
> +struct wmi_string {
> +=09__le16 length;
> +=09__le16 chars[];
> +} __packed;

+ include for __packed.

> +
> +int wmidev_invoke_method(struct wmi_device *wdev, u8 instance, u32 metho=
d_id,
> +=09=09=09 const struct wmi_buffer *in, struct wmi_buffer *out);
> +
> +int wmidev_query_block(struct wmi_device *wdev, u8 instance, struct wmi_=
buffer *out);
> +
> +int wmidev_set_block(struct wmi_device *wdev, u8 instance, const struct =
wmi_buffer *in);
> +
>  acpi_status wmidev_evaluate_method(struct wmi_device *wdev, u8 instance,=
 u32 method_id,
>  =09=09=09=09   const struct acpi_buffer *in, struct acpi_buffer *out);
> =20
> @@ -54,9 +86,11 @@ u8 wmidev_instance_count(struct wmi_device *wdev);
>   * @probe: Callback for device binding
>   * @remove: Callback for device unbinding
>   * @shutdown: Callback for device shutdown
> - * @notify: Callback for receiving WMI events
> + * @notify: Callback for receiving WMI events (deprecated)
> + * @notify_new: Callback for receiving WMI events
>   *
> - * This represents WMI drivers which handle WMI devices.
> + * This represents WMI drivers which handle WMI devices. The data inside=
 the buffer
> + * passed to the @notify_new callback is guaranteed to be aligned on a 8=
-byte boundary.
>   */
>  struct wmi_driver {
>  =09struct device_driver driver;
> @@ -68,6 +102,7 @@ struct wmi_driver {
>  =09void (*remove)(struct wmi_device *wdev);
>  =09void (*shutdown)(struct wmi_device *wdev);
>  =09void (*notify)(struct wmi_device *device, union acpi_object *data);
> +=09void (*notify_new)(struct wmi_device *device, const struct wmi_buffer=
 *data);
>  };
> =20
>  /**
>=20

--=20
 i.
--8323328-630177795-1767710779=:1051--
