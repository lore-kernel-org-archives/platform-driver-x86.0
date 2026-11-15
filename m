Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782395;
	b=suBWTeXxn2bkLpnKxZQfC4tBx1nA5xGScMyUFnKDydZ8Wd89uQRgnQq0PeBIHWvxy2BL
	 QNBIlxh3SNF9PIzPM6mq/IZ/P7kuya/scBgtoikLWA3DEzpiXyuJ1GQbolgQj/rdLCvti
	 zUC4d5kuo9Z4+tPSQpt1X6+ECv9XsouPrjVABp7xQ0X2MOdKQuq3fxliwH9HhbJkm2UOJ
	 V6Q4I7ul711nHAcG73gJ1zv8YrurSEWnTCk1CP8Fy/uN5CYbba9FTRQ+8DJyuFj8T0Urs
	 6DgyW6lKPlC3kGS/fmwzAOTJ2UEJjM6vFk9a5dVv+T6y9CZ4dC/AvqEJn7qIMVKRRuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782395;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=bNeDCgwvFnCnsvXZG+H8EtJRxUT+DRj67qdVYEs4+aY=;
	b=21UVW5+hfuubGbUQA1Fhtziq1e1wmTxInvQnekCUaxkK0TiV+qAeFFx7NeGm1nsn4Iu3
	 wP5bbOYTkz1TpByNPEs2F8ed93F9Y+CbMdkI0f7KJr2mU9tGoMk5u5LE7ektV1yDsPYhg
	 1/KlPpGFqgtnY6E5FCzsqiYgLQVovexeaPvYX/CuJqUuP+CdamUehToCSQ0HJjO3h+nnZ
	 Bl5c5bAA1PeW1/odujV8rP/JZXb7UNTVVt1rwoFu+4F4MPljfQeX89OdgsJ3Uo9UDebDy
	 8FzWnzEplxMzBQ0dU42NN+EhD5edvomCLoAkVYD6ZFMePTuqQLvXlAqGyhq7fxY/0YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=JVvCCZGo;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Cjdh5Hfm;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41B9606A323
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Nov 2026 22:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F41B9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=JVvCCZGo;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Cjdh5Hfm
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 507251D000DA
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Nov 2026 17:39:53 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Sun, 15 Nov 2026 17:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794782393;
	 x=1794868793; bh=bNeDCgwvFnCnsvXZG+H8EtJRxUT+DRj67qdVYEs4+aY=; b=
	JVvCCZGom5Zh2ENE8E5zp6W85ZtwPYxOq1vdSHuL+fFmLFMMN4s332+5dtj61FbD
	UsuV2IYFn1XhnbcHfAM+RU7tZdeb1hLhQ7R5T4IVY2Le6F8khHCZCI6/nz1OB1CX
	BYvv41SjTmv2gSPB81NMMukRP3gCCDlDsyKWOX8MOcFjmrO9NCpUqjRZlYsCq3d8
	JqJ9hhhBC27HSpMHdFMxtakIyKnXAAsQc2Ry8eiS88f7AsRiJ6EQNqWLVHgPxNVs
	x3lpmOAGcbvMIbK3p4y8Ao7lLbHvGw4m/DC1Z4QOTg7tQZBoKUzhCgJW9j1gOJtX
	GFKlZHQl1nmrOP+N5ldu9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794782393; x=
	1794868793; bh=bNeDCgwvFnCnsvXZG+H8EtJRxUT+DRj67qdVYEs4+aY=; b=C
	jdh5HfmKc/wKgZgXb5PafUxawvkjufYEdLq/COlVkRGmJgpnCzUadbmo2qd5MFTr
	V/KLNHa1YWIqZqc9Rlxn1zmH2f7WeVx8Md4luWGCgI5GVPH4LUx56vHtOCUE61i6
	L4yAggY5dpo4GUkp++Owjqm/XNOrr6NlmtV2VFACd9rYQlzRM1346R2n5j+xKrfP
	NEfb0ciH7ADqO+TvPOS1AYBWA91+dbtd6OAAQd53gnOcky9LzPZyT3du26JeqmxW
	NxHDubww1Gv+tLzWnr2nXK5kyAVBQHwvglTb+vNDwx26xgiD8jhYqa1xK0UUWhoq
	tD2RorlIrJ43RjPFuBb4w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794782393; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:lBmAR6rYlAjQ+uZLZccWBpLDJ4kx7X3fUVpOHufx0xFjvUP
	8/uwf0i/Pzdzhel3XLUqe1e0zAJaUYw/ATNIMARIDvFl/UgM9DkVjfHoWUfDwnPH
	rIyES1mueSsqQhxhYKuJjRwzIkfHSSEiNzgqI594N6x93Vf+V+gmigEuPJfMygJX
	93eFrJmXheKB2bhsK5BHdru0sX0Lf+9GRNqsFVf/529blf0L4LzrfxjBzqvX1DX5
	ireebARXq96v7eIc8P3IVyOifb3SUODrHOEiB6PrOqK+sb5RNJ4gAN2HbFxJtXy7
	+aCK+howN88gdxLiO/FfbnA3SRLeUuiu+6izbcg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:DjQgXcEKYibzuRGNO+xSN2OH0q2boEHMS6s+FVJgDbs=:Uf85MUytDBoXQ6wmzhfjoG4RZu/fgneJL3IiIdAIZYo=;
X-ME-Sender: <xms:uDT6aig6_XS9zhoTiFK1IjxIwuf1YeQwQ1qGJscexDiF7u0r2Wmqww>
    <xme:uDT6at2GgHrgGQY_g97pUd8o2IY5IvBi6Bm73xxln4R8upDfBFksT7PpBjHysmSjQ
    i9Xs0ILLL28okU3xdT3Nh2sChkouIaZ1S4yt0hG7-DC68fOJ53YD7hs>
X-ME-Proxy-Cause: dmFkZTGW0qsrD/X5vzJCF9IttnZ4SizfRrSvSRedsU5IxQxBtOmoNdrD0Qt+G6Cfmq1V8c
    GsP1WlmsZaYS4DAPVPJBimtIWhRtd3D3B36jVZHEtl3VAkADjXcO6hVndTwO8Ugcq9aHZg
    Fk2jcrqXzh16WdgeDGIArmb1RLELS8KE02oQgJ/ZhQ7f1kLAzOQL9pWiNNV/pPXSs5k+DJ
    Cs2unxt28j+xrT3eOoLCPpinqX493U5TqTwxMioIfPbtajfeP9KKQrAleXjVsqgBx8bojS
    WynMMkRT2nORbaF7dSN367ITEgWMj/Ak6Zj3Zqded5u21ycH33Kc4aE+tTyHSUmXUgJ9YK
    bgPA/zBjVAniv2M8YA5om2w1gcvXvvPcWNnOrlZpTdWT2HpMCwwjPEaeRb+JcLXdot93hf
    mlLBcISHWuk2Q4jQtui+8ror/RY7BZvOe91NdWPfqXiZYFRVRs+i3stdRNvb7rnkeiKxUh
    P+3Q7EVaAQ+nFTGqlfdZQ2F4W5gToLYE/0Si1E7s6RVUG6mSMGQCT+877ex3WIYryv7HvT
    vs1iYCPKs8kCszGRfs0SufTPJOIGl4xZhnI59RWcpagWLE7ML1l7s77M9qWTpHsHfGbLbx
    9QLReYXzrzhEvSzW5MfcyV84CyQWBIiWeFeNcjqMIp5umEY7YlBJhzwn9EAg
X-ME-Proxy: <xmx:uDT6auFcczvJk4is3xenKobOLsZ089w5E_5GGiV__V1ZhgJ-BmAwEg>
    <xmx:uDT6anjCbnV-YazS8N5e7lsKWV2NRWMmI6MhjEjh-3q3DCEfF_5jfQ>
    <xmx:uDT6ajtf-2JsBo6_8U7eynSe1fFdgjnDpl1-buZP1YqycwBzmQtSeQ>
    <xmx:uDT6aisUc1M4zBCZ1udSvJ9qGxCF6UQ0a9L_0cyhZ1HFQk0SQTMv3Q>
    <xmx:uTT6alm0PYs9E3xdiUAPfL3Uf6XYpOzeITZWvYpEeP6c_bvrneGDOVsb>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 1CC1E2C00085; Sun, 15 Nov 2026 17:39:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AZf8LQYQVgsF
Date: Sun, 15 Nov 2026 17:39:31 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Gergo Koteles" <soyer@irl.hu>, "Ike Panhc" <ikepanhc@gmail.com>,
 "Andrew Kallmeyer" <kallmeyeras@gmail.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "Mahir Faisal" <mahirfaisalantiq33@gmail.com>
Message-Id: <e39bd69c-9953-4154-8938-313e6fb0b26a@app.fastmail.com>
In-Reply-To: <20261116-ymc-82yl-v1-4-fac1a2b01a84@rong.moe>
References: <20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe>
 <20261116-ymc-82yl-v1-4-fac1a2b01a84@rong.moe>
Subject: Re: [PATCH 4/7] platform/x86: lenovo-ymc: Modernize WMI driver and factor out
 events
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Sun, Nov 15, 2026, at 2:27 PM, Rong Zhang wrote:
> The lenovo-ymc driver is a legacy WMI driver. It binds to the events
> GUID as a WMI driver but calls the query GUID with the deprecated GUID-
> based interface.
>
> Handle YMC events in lenovo-wmi-event, and coordinate relevant drivers
> with notifier chains:
>
>                 +---LWMI_EVENT_THERMAL_MODE---> wmi-gamezone
>                 |
>   wmi-events ---+
>                 |
>                 +---LWMI_EVENT_YMC---> ymc=20
> ---IDEAPAD_LAPTOP_YMC_EVENT---> ideapad-laptop
>
> Modernize the lenovo-ymc driver by adopting lwmi_dev_evaluate_int() fr=
om
> lenovo-wmi-helpers, which has adopted the modern WMI core interfaces a=
nd
> taken care of buffer's lifecycle. This should hopefully improve
> robustness on various firmware as it aligns with the Windows behavior
> that ACPI object type doesn't matter but the size does.
>
> Note that the WMI core does not verify min_event_size for the legacy
> notify() callback (it only ensures the event has data). By factoring o=
ut
> YMC events to lenovo-wmi-events with the new notify_new() callback, now
> the WMI core can finally verify the size of event data:
>
>   [WmiDataId(1), read, Description("Lenovo Yoga Mode Change Event")]=20
> uint32 ModeDataVal;
>
> With these changes, the lenovo-ymc driver become a no_singleton
> asynchronous-probe driver that only binds to the query GUID. It also
> retrieve event data as a fallback data source when the query method

Minor typo: retrieves?

> fails, so that the EC is always triggered on valid events (i.e., passi=
ng
> the min_event_size check). On probe it's always triggered, too, as we
> want the EC to initialize the state of keyboard and touchpad on boot.
>
> The input device's phys string also adopts the query GUID rather than
> the events one. It shouldn't break anything, as nothing actually match=
es
> the previous phys string.
>
> The DMI quirk tables are left untouched, as the contained devices shou=
ld
> have both GUIDs.
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/Kconfig      |  2 +
>  drivers/platform/x86/lenovo/wmi-events.c |  7 +++
>  drivers/platform/x86/lenovo/wmi-events.h |  1 +
>  drivers/platform/x86/lenovo/ymc.c        | 85 ++++++++++++++++++-----=
---------
>  4 files changed, 58 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/Kconfig=20
> b/drivers/platform/x86/lenovo/Kconfig
> index 516594993073..f16b09bab082 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -63,6 +63,8 @@ config LENOVO_YMC
>  	depends on INPUT
>  	depends on IDEAPAD_LAPTOP
>  	select INPUT_SPARSEKMAP
> +	select LENOVO_WMI_EVENTS
> +	select LENOVO_WMI_HELPERS
>  	help
>  	  This driver maps the Tablet Mode Control switch to SW_TABLET_MODE=20
> input
>  	  events for Lenovo Yoga notebooks.
> diff --git a/drivers/platform/x86/lenovo/wmi-events.c=20
> b/drivers/platform/x86/lenovo/wmi-events.c
> index 01ad5bcf0437..a0ddea01213f 100644
> --- a/drivers/platform/x86/lenovo/wmi-events.c
> +++ b/drivers/platform/x86/lenovo/wmi-events.c
> @@ -21,6 +21,7 @@
>  #include "wmi-helpers.h"
>=20
>  #define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
> +#define YOGA_MODE_CHANGE_EVENT_GUID "06129D99-6083-4164-81AD-F092F9D7=
73A6"
>=20
>  #define LWMI_EVENT_DEVICE(guid, type)                        \
>  	.guid_string =3D (guid), .context =3D &(enum lwmi_events_type) \
> @@ -123,6 +124,7 @@ static void lwmi_events_notify(struct wmi_device=20
> *wdev, const struct wmi_buffer
>  	struct lwmi_events_priv *priv =3D dev_get_drvdata(&wdev->dev);
>  	void *notif_data =3D NULL;
>  	int sel_prof;
> +	u32 ymc_mode;
>  	int ret;
>=20
>  	switch (priv->type) {
> @@ -143,6 +145,10 @@ static void lwmi_events_notify(struct wmi_device=20
> *wdev, const struct wmi_buffer
>  			return;
>  		}
>  		break;
> +	case LWMI_EVENT_YOGA_MODE_CHANGE:
> +		ymc_mode =3D le32_to_cpup(buf->data);
> +		notif_data =3D &ymc_mode;
> +		break;
>  	default:
>  		return;
>  	}
> @@ -175,6 +181,7 @@ static int lwmi_events_probe(struct wmi_device=20
> *wdev, const void *context)
>=20
>  static const struct wmi_device_id lwmi_events_id_table[] =3D {
>  	{ LWMI_EVENT_DEVICE(THERMAL_MODE_EVENT_GUID, LWMI_EVENT_THERMAL_MODE=
)=20
> },
> +	{ LWMI_EVENT_DEVICE(YOGA_MODE_CHANGE_EVENT_GUID,=20
> LWMI_EVENT_YOGA_MODE_CHANGE) },
>  	{}
>  };
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-events.h=20
> b/drivers/platform/x86/lenovo/wmi-events.h
> index cd34e886912c..592da08ff2a3 100644
> --- a/drivers/platform/x86/lenovo/wmi-events.h
> +++ b/drivers/platform/x86/lenovo/wmi-events.h
> @@ -10,6 +10,7 @@ struct notifier_block;
>=20
>  enum lwmi_events_type {
>  	LWMI_EVENT_THERMAL_MODE =3D 1,
> +	LWMI_EVENT_YOGA_MODE_CHANGE =3D 2,
>  };
>=20
>  int lwmi_events_register_notifier(struct notifier_block *nb);
> diff --git a/drivers/platform/x86/lenovo/ymc.c=20
> b/drivers/platform/x86/lenovo/ymc.c
> index eba22600161e..cb3ae49dfd9e 100644
> --- a/drivers/platform/x86/lenovo/ymc.c
> +++ b/drivers/platform/x86/lenovo/ymc.c
> @@ -3,22 +3,25 @@
>   * lenovo-ymc.c - Lenovo Yoga Mode Control driver
>   *
>   * Copyright =C2=A9 2022 Gergo Koteles <soyer@irl.hu>
> + * Copyright =C2=A9 2026 Rong Zhang <i@rong.moe>
>   */
>=20
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>=20
> -#include <linux/acpi.h>
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
> +#include <linux/container_of.h>
>  #include <linux/dmi.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/mutex.h>
> +#include <linux/notifier.h>
>  #include <linux/wmi.h>
>  #include "ideapad-laptop.h"
> +#include "wmi-events.h"
> +#include "wmi-helpers.h"
>=20
> -#define LENOVO_YMC_EVENT_GUID	"06129D99-6083-4164-81AD-F092F9D773A6"
>  #define LENOVO_YMC_QUERY_GUID	"09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C"
>=20
>  #define LENOVO_YMC_QUERY_INSTANCE 0
> @@ -61,8 +64,10 @@ static const struct dmi_system_id=20
> allowed_chasis_types_dmi_table[] =3D {
>  };
>=20
>  struct lenovo_ymc_private {
> +	struct wmi_device *wdev;
>  	struct input_dev *input_dev;
>  	struct mutex mutex; /* Protects event handling. */
> +	struct notifier_block nb;
>  };
>=20
>  static const struct key_entry lenovo_ymc_keymap[] =3D {
> @@ -75,49 +80,44 @@ static const struct key_entry lenovo_ymc_keymap[] =
=3D {
>  	{ KE_END },
>  };
>=20
> -static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_obj=
ect *data)
> +static void lenovo_ymc_refresh(struct lenovo_ymc_private *priv, u32 c=
ode)
>  {
> -	struct lenovo_ymc_private *priv =3D dev_get_drvdata(&wdev->dev);
> -	u32 input_val =3D 0;
> -	struct acpi_buffer input =3D { sizeof(input_val), &input_val };
> -	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> -	union acpi_object *obj;
> -	acpi_status status;
> -	int code;
> +	struct wmi_device *wdev =3D priv->wdev;
> +	u32 input =3D 0, output;
> +	int ret;
>=20
>  	guard(mutex)(&priv->mutex);
>=20
> -	status =3D wmi_evaluate_method(LENOVO_YMC_QUERY_GUID,
> -				LENOVO_YMC_QUERY_INSTANCE,
> -				LENOVO_YMC_QUERY_METHOD,
> -				&input, &output);
> -
> -	if (ACPI_FAILURE(status)) {
> -		dev_warn(&wdev->dev,
> -			"Failed to evaluate query method: %s\n",
> -			acpi_format_exception(status));
> -		return;
> -	}
> -
> -	obj =3D output.pointer;
> -
> -	if (obj->type !=3D ACPI_TYPE_INTEGER) {
> -		dev_warn(&wdev->dev,
> -			"WMI event data is not an integer\n");
> -		goto free_obj;
> -	}
> +	ret =3D lwmi_dev_evaluate_int(wdev, LENOVO_YMC_QUERY_INSTANCE,=20
> LENOVO_YMC_QUERY_METHOD,
> +				    (unsigned char *)&input, sizeof(input), &output);
> +	if (ret)
> +		dev_warn(&wdev->dev, "Failed to invoke query method: %d\n", ret);

Should it not bomb out here? Otherwise the chances are high it's reporti=
ng an incorrect status isn't it?

> +	else
> +		code =3D output;
>=20
>  	/* strip upper bits (e.g. 0x50000) on newer devices */
> -	code =3D FIELD_GET(LENOVO_YMC_STATE_MASK, obj->integer.value);
> +	code =3D FIELD_GET(LENOVO_YMC_STATE_MASK, code);
>=20
>  	if (!sparse_keymap_report_event(priv->input_dev, code, 1, true))
>  		dev_warn(&wdev->dev, "Unknown key %d pressed\n", code);
>=20
> -free_obj:
> -	kfree(obj);
>  	ideapad_laptop_call_notifier(IDEAPAD_LAPTOP_YMC_EVENT, &code);
>  }
>=20
> +static int lenovo_ymc_notify(struct notifier_block *nb, unsigned long=20
> action, void *data)
> +{
> +	struct lenovo_ymc_private *priv =3D container_of(nb, struct=20
> lenovo_ymc_private, nb);
> +	const u32 *p =3D data;
> +
> +	switch (action) {
> +	case LWMI_EVENT_YOGA_MODE_CHANGE:
> +		lenovo_ymc_refresh(priv, *p);
> +		return NOTIFY_OK;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +}
> +
>  static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
>  {
>  	struct lenovo_ymc_private *priv;
> @@ -147,7 +147,7 @@ static int lenovo_ymc_probe(struct wmi_device=20
> *wdev, const void *ctx)
>  		return err;
>=20
>  	input_dev->name =3D "Lenovo Yoga Tablet Mode Control switch";
> -	input_dev->phys =3D LENOVO_YMC_EVENT_GUID "/input0";
> +	input_dev->phys =3D LENOVO_YMC_QUERY_GUID "/input0";
>  	input_dev->id.bustype =3D BUS_HOST;
>  	input_dev->dev.parent =3D &wdev->dev;
>  	err =3D sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
> @@ -164,16 +164,24 @@ static int lenovo_ymc_probe(struct wmi_device=20
> *wdev, const void *ctx)
>  		return err;
>  	}
>=20
> +	priv->wdev =3D wdev;
>  	priv->input_dev =3D input_dev;
> +	priv->nb.notifier_call =3D lenovo_ymc_notify;
>  	dev_set_drvdata(&wdev->dev, priv);
>=20
> +	err =3D devm_lwmi_events_register_notifier(&wdev->dev, &priv->nb);
> +	if (err) {
> +		dev_err(&wdev->dev, "Could not register YMC events notifier: %d\n",=
 err);
> +		return err;
> +	}
> +
>  	/* Report the state for the first time on probe */
> -	lenovo_ymc_notify(wdev, NULL);
> +	lenovo_ymc_refresh(priv, YMC_POSTURE_UNKNOWN);
>  	return 0;
>  }
>=20
>  static const struct wmi_device_id lenovo_ymc_wmi_id_table[] =3D {
> -	{ .guid_string =3D LENOVO_YMC_EVENT_GUID },
> +	{ .guid_string =3D LENOVO_YMC_QUERY_GUID },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table);
> @@ -181,16 +189,19 @@ MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table=
);
>  static struct wmi_driver lenovo_ymc_driver =3D {
>  	.driver =3D {
>  		.name =3D "lenovo-ymc",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>  	},
>  	.id_table =3D lenovo_ymc_wmi_id_table,
> -	.min_event_size =3D sizeof(u32),
>  	.probe =3D lenovo_ymc_probe,
> -	.notify =3D lenovo_ymc_notify,
> +	.no_singleton =3D true,
>  };
>=20
>  module_wmi_driver(lenovo_ymc_driver);
>=20
>  MODULE_AUTHOR("Gergo Koteles <soyer@irl.hu>");
> +MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
>  MODULE_DESCRIPTION("Lenovo Yoga Mode Control driver");
>  MODULE_LICENSE("GPL");
>  MODULE_IMPORT_NS("IDEAPAD_LAPTOP");
> +MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
> +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
>
> --=20
> 2.55.0
