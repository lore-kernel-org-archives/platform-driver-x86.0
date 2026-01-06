Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0783B28D;
	Tue,  6 Jan 2026 15:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715003; cv=none; b=Ps4uToqkCqzrS5vID+sDE8j06v/fGbdCSmReXY3jj42cXORLSAuB81mtRCooZI3rVZn9Kt8EFpeLlr5vXc3AIU/j2VHo24fmIfOexwR6nsdkQeL9hlR255UvvOo4buX07tneFqHjJitddIualukBMMDsnFA8Z7VAKOA6x9OjdKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715003; c=relaxed/simple;
	bh=JQ0OfJ+y1DU1JWVlwnaEVumXGaUju7WY7uFuRHs+JTc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EWV04h48MrfxfpTFwAVO9V8U9olfi8Rm21iWnmP59xVMdVoa6uQM/mil/hTjI2qhelKh07bvIUjkPVmM/FrPYo2o6lRhL8sUSZBTQcZVPPO2pekWnJatuFEuH4pdVJHwqv3GoZAF62dEkHpz6mxCWrFFUhF9hwr5wOHVZsXp5jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEWx8MiQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEWx8MiQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767715002; x=1799251002;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JQ0OfJ+y1DU1JWVlwnaEVumXGaUju7WY7uFuRHs+JTc=;
  b=UEWx8MiQcYpmqfVnKlS3RB1XiLt/0pYDLAFKcb2wQT/qj6QyyufpDVeH
   BWFQzbFpoRbGojHTbKlmFoliCdacMpSAABngDhAM5gmG6iKkapYBNcURJ
   vHVfJAFn9WpZkl5OL01WycNK0qs9KC3qNa8Qslbx9d4Q+3cJ0LmnnBPkr
   vY5ha0AojWa4f7JmPCl4K66DMV0hJSSBJSG9RWhFP1KIUFbCM1dbvHvZL
   nllwKFJXMNnELl8F/mUW72ZW6ovW0mie50RIvLT8fgWIU4aYW2UrHOEWW
   swgALSVqlgBcdsAz//p0KJo8RRzzaJwGqfXD3wPfpRLN2DbdOtUdo4n4+
   A==;
X-CSE-ConnectionGUID: zvMlTtdsQl27EvG0Ei1z8w==
X-CSE-MsgGUID: J93bYwJDREu1D0meVW/oDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68823813"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="68823813"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 07:56:41 -0800
X-CSE-ConnectionGUID: wvV+OfPBQeup8t0cB44wDQ==
X-CSE-MsgGUID: 5+To6kQ9SNybE9WSGej6bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202933240"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.6])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 07:56:38 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 Jan 2026 17:56:36 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux@weissschuh.net, 
    Dell.Client.Kernel@dell.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/9] platform/wmi: Introduce marshalling support
In-Reply-To: <20251220204622.3541-2-W_Armin@gmx.de>
Message-ID: <bc985391-8b0e-aed8-5d0e-0e1ad07f593e@linux.intel.com>
References: <20251220204622.3541-1-W_Armin@gmx.de> <20251220204622.3541-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1660125898-1767714996=:1051"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1660125898-1767714996=:1051
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

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
>   the Windows driver replaces non-ascii characters (=C3=A4 -> a, & -> ?)
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

These currently depends on the includes in the C file including this as=20
you do not introduce these types beforehand.

--=20
 i.

--8323328-1660125898-1767714996=:1051--
