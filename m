Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F26331A76;
	Wed,  1 Apr 2026 18:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068369; cv=pass; b=ocPYPZ3Ocqiq/JZWWRVOesyBf1lVTfrXatWnDPLTiBE+FkvijzneJAU2g936EiEWQdv3Hg+deT8TbTrCstsbWu/vWxNPFGT/StPmMGZxlBH9mO7t8FpuVSu3zZyZ4q0sJdpwheDVT6DXucP2QIGStfuNAOqAy+KVQcZE4/ZDjQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068369; c=relaxed/simple;
	bh=y1/3FibiHrPTm5WPJRwjWGfV8iS2nAYKJTtOihvfQLY=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KECZ3ViZg4/Enu9gm6F5VBnimbWTG119pmqv/Xfc00mf7e2JtBhPPU2gUcHmB4EqZhzi1EtWP4XtZsvlTUUqliq9GI3il5d9juzEFEingVB3vmBlFYN4oUxVRWP0vjFWrdHdO5meBl1ekB0G/zZae9CaGAomRs6amWO+nocY2qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=iBD1cVMV; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="iBD1cVMV"
ARC-Seal: i=1; a=rsa-sha256; t=1775068358; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hI7v6+s8uE12kzN2FExM2pi8ky1oCzUsRy0tt0QfyNzj9T86HlepHtrFaD5jA7HHH+4uVtOxc7MFnYVTY7SUD0IjMNRTX42u2XzcdppjuAQEqMpMHczBnc+PVMO4yRml4wbib5ArX5ToB6yunZ8v/9T7o+HgqnI4c3N30YOoCjs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775068358; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1IreLunMg+1bB5W8Tk2s9FGlmSDlEkID0XPe7IT0ZiE=; 
	b=KV009F7Iz3ikDVYraLXFoyxQKfBGgD0tfXa8Xid4Y/BIjp/JGQbUd7y92LXTnCTKpsnPiV5IntUvwtrKrsMX2UXyESeSbQq8muhFBOyCc+bgUQYzifjh9xLMiiAETxbZVX+tVMZdToumlTv62XHcJDsPtbULOPQJYbbMjvQeEVE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775068358;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=1IreLunMg+1bB5W8Tk2s9FGlmSDlEkID0XPe7IT0ZiE=;
	b=iBD1cVMV+rP3hJ2ZTn8rFGaFmAr65WmXXC9b+4E8gOZfPNLX7+qe0tVcQItrRJDs
	b3/KVXJBTy6tZOM53r4TYEHoFNDumhasR6XMU8wwOqt1IUQBGbPkAcSOeQiDUAhM92/
	lYSwK+LagP8dOXLkAgLXiXAB984M6EKUW1rJcTI1v+1wr+QnwKc2HJ7Oj6me8q4UDWS
	UiioVvZ4y+XaqJm07irklh/U5uSaDcY09d/QXGr3NkQZxsVMm6DTyX9GzsDRujN0ply
	3fBjJxOiQQCWYYH6fiwEy6ZX5vccAxW8RcPgGjcT084Cskn6ldQ0K40jsOu7rXkqetW
	1cpDreHAjQ==
Received: by mx.zohomail.com with SMTPS id 1775068356678685.947586088052;
	Wed, 1 Apr 2026 11:32:36 -0700 (PDT)
Message-ID: <3a10df21ae1a60fbc5275de22ce05c94e21f1f37.camel@rong.moe>
Subject: Re: [PATCH v6 04/13] platform/x86: lenovo-wmi-helpers: Move
 gamezone enums to wmi-helpers
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260331181208.421552-5-derekjohn.clark@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
	 <20260331181208.421552-5-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Apr 2026 02:26:57 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2026-03-31 at 18:11 +0000, Derek J. Clark wrote:
> In the next patch, the thermal mode enum will be accessed across three
> separate drivers (wmi-capdata, wmi-gamezone and wmi-other). An
> additional patch in the series will also add a function protoype that
> needs to reference this enum in wmi-helpers.h. To avoid having all these
> drivers import each others headers, and to avoid declaring an opaque enum
> to hande the second case, move the thermal mode enum to helpers where it
> can be safely accessed by everything that needs it from a single import.
>=20
> While at it, since the gamezone_events_type enum is the only remaining
> item in the header, move that as well to permit removing the gamezone
> header entirely.
>=20
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> ---
>  drivers/platform/x86/lenovo/wmi-events.c   |  2 +-
>  drivers/platform/x86/lenovo/wmi-gamezone.c |  1 -
>  drivers/platform/x86/lenovo/wmi-gamezone.h | 20 --------------------
>  drivers/platform/x86/lenovo/wmi-helpers.h  | 13 +++++++++++++
>  drivers/platform/x86/lenovo/wmi-other.c    |  1 -
>  5 files changed, 14 insertions(+), 23 deletions(-)
>  delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-events.c b/drivers/platform/=
x86/lenovo/wmi-events.c
> index 0994cd7dd504..9e9f2e82e04d 100644
> --- a/drivers/platform/x86/lenovo/wmi-events.c
> +++ b/drivers/platform/x86/lenovo/wmi-events.c
> @@ -17,7 +17,7 @@
>  #include <linux/wmi.h>
> =20
>  #include "wmi-events.h"
> -#include "wmi-gamezone.h"
> +#include "wmi-helpers.h"
> =20
>  #define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
> =20
> diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platfor=
m/x86/lenovo/wmi-gamezone.c
> index 381836d29a96..602a48de1b4e 100644
> --- a/drivers/platform/x86/lenovo/wmi-gamezone.c
> +++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
> @@ -21,7 +21,6 @@
>  #include <linux/wmi.h>
> =20
>  #include "wmi-events.h"
> -#include "wmi-gamezone.h"
>  #include "wmi-helpers.h"
>  #include "wmi-other.h"
> =20
> diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.h b/drivers/platfor=
m/x86/lenovo/wmi-gamezone.h
> deleted file mode 100644
> index 6b163a5eeb95..000000000000
> --- a/drivers/platform/x86/lenovo/wmi-gamezone.h
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -
> -/* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
> -
> -#ifndef _LENOVO_WMI_GAMEZONE_H_
> -#define _LENOVO_WMI_GAMEZONE_H_
> -
> -enum gamezone_events_type {
> -	LWMI_GZ_GET_THERMAL_MODE =3D 1,
> -};
> -
> -enum thermal_mode {
> -	LWMI_GZ_THERMAL_MODE_QUIET =3D	   0x01,
> -	LWMI_GZ_THERMAL_MODE_BALANCED =3D	   0x02,
> -	LWMI_GZ_THERMAL_MODE_PERFORMANCE =3D 0x03,
> -	LWMI_GZ_THERMAL_MODE_EXTREME =3D	   0xE0, /* Ver 6+ */
> -	LWMI_GZ_THERMAL_MODE_CUSTOM =3D	   0xFF,
> -};
> -
> -#endif /* !_LENOVO_WMI_GAMEZONE_H_ */
> diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h b/drivers/platform=
/x86/lenovo/wmi-helpers.h
> index 20fd21749803..3364d8e152ca 100644
> --- a/drivers/platform/x86/lenovo/wmi-helpers.h
> +++ b/drivers/platform/x86/lenovo/wmi-helpers.h
> @@ -14,6 +14,19 @@ struct wmi_method_args_32 {
>  	u32 arg1;
>  };
> =20
> +enum lwmi_event_type {
> +	LWMI_GZ_GET_THERMAL_MODE =3D 0x01,
> +};
> +
> +enum thermal_mode {
> +	LWMI_GZ_THERMAL_MODE_NONE =3D	   0x00,
> +	LWMI_GZ_THERMAL_MODE_QUIET =3D	   0x01,
> +	LWMI_GZ_THERMAL_MODE_BALANCED =3D	   0x02,
> +	LWMI_GZ_THERMAL_MODE_PERFORMANCE =3D 0x03,
> +	LWMI_GZ_THERMAL_MODE_EXTREME =3D	   0xE0, /* Ver 6+ */
> +	LWMI_GZ_THERMAL_MODE_CUSTOM =3D	   0xFF,
> +};
> +
>  int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 meth=
od_id,
>  			  unsigned char *buf, size_t size, u32 *retval);
> =20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index c3614bc4f90c..b24bf98c19ad 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -47,7 +47,6 @@
> =20
>  #include "wmi-capdata.h"
>  #include "wmi-events.h"
> -#include "wmi-gamezone.h"
>  #include "wmi-helpers.h"
>  #include "wmi-other.h"
>  #include "../firmware_attributes_class.h"
