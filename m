Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B51171CD;
	Thu,  2 Jan 2025 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735837044; cv=none; b=VhBvyg89t9afzVjlT74PYy40ZW57LdoXDyu/jCqdVAcOFv5wCpWoqdafUsY4i/qYKAyAhuRiuJYOGsfBilGIReNs3cim5Wtwf6CTDuStxMbks2Qp0y+r2w4LPBFSiudkYAAyFLjaConZyPvhiGNavQTsXRBXTrqGzexDujD+BCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735837044; c=relaxed/simple;
	bh=d+EfRI/ycRufqgNKls8jP41ripd2AOUU26YkPp+T6no=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fteZgpiWeCK+Wlwu7OSLN114tRtXBdHRR2uU7reugb+GaaHaDztNY4BIB/361FObG4lMQ84VVyumtOf2lvpE9AAmUaBWHwDnldi35g7vdVThVBQmwNr0lFIXD51mt3PBVwI6x2rgqfr3YvQ0zA7MoI615XXmEVeTgbNN8ZbRVJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cztIMuoE; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cztIMuoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735837029; x=1736441829; i=w_armin@gmx.de;
	bh=ZiIoAmBb5Qgp8HPVC+Tf/7FzSZW/G/bOQauLIkkpwQA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cztIMuoEH1hINDgKAZI2CvECviMePBB+oSZRIJkVvI6YAwuyXKBXCzcDHVtSGLjG
	 pZ0was6T/iIGXM4kVkpdhkBDKy4NkeOB1uhJgwu9aOPbCcYS1hxLesGDEQVOQNrou
	 Y6w1BFQASS4B4OkBMHTk1m0g/Km/cSOBx/aIZxUXQHNoA2KNDboVMwLqWd1qFiCnK
	 h+NdZiMk6vtfQejXZQxssFgzbXV3QEN3pHNMFe7L/ztydOiPO+TpRSkpv23S3d+9y
	 t3vkcMF70wB4ah2ZSsJt73VmrKp8bzDGWpO4brmhSYl/YH7B45+e3bUrGL8tHlSJD
	 7sVKp2jWrbi/FoXMbg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKsnP-1tD6Xg1ppl-00LYn3; Thu, 02
 Jan 2025 17:57:09 +0100
Message-ID: <f1a8613d-8743-499e-b04c-94dca9e4f427@gmx.de>
Date: Thu, 2 Jan 2025 17:57:07 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/20] platform/x86: Update alienware-wmi config
 entries
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-21-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241229194506.8268-21-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZDpoCcRaYQVYo8J22IhTDQatklcVDX02HXkz9dPeKmf9kyhhrji
 2ikajABqy7C1qdDOQaibbPVoIYmrJYFqfPijBmt1J0UG7KPyy+0QzSRLKQ/QVLu+LoWX7l0
 q3/Y/lDLhrK1w07OeHLxo9dbaVXxzapF/NGNHajdEmTuMe79Lx9G+ioA/FSXhespuPEbOea
 ArI7LsIRnGrZcAHyD6ucA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1dHa9SDbdVo=;+O5F55V5uWAOA9UAF5KwhmQyIVP
 rcbiE4ThMle13L9W4+IsSiHIN/cqyKg6NGkqx84aC8O0vepdvTheOzOTmkpAYRMAyG/vv6EZU
 Fy2K2fOnYh67fbmMmoHu+j3cMJIkNgBtV7p5TLvGR4gKGdAKCmNn3qJyhoc1wenkeWgOIlhjP
 VzZg+QuiJC2MhquEC4NwxIQkJ8K63zn75/NjjhwzAC2bCQiW7b+U3lHPV1TD96PY7XVH2zjJg
 FboTyp1Igb4gS11lUVYRRAhBcl5iEB6xn0gVVMG895aNH3Xsv7nB7SQYDrNbdvYiBJSTXgLum
 2x1POoCxMwKmUFkDFNtmzSaQBxglbng0ALnSVsC7WG88H00T8v7fuA6hp4tG0jRdM3olAhQbE
 ZCoHN4syQQFi8iS7UjjXIrWGBeoqhH9L+pgAYVtHPL3iAHYdTEsV3YXvBuQORqiaShQavbwDF
 /JWBAPPUHHbC6jXVutzLoHL6Db5jTbp6y7OFIHSMC+s/7yiL8m4DkCOUIRE9b4djeh+97+zjv
 3f1IRgvzR8JIyEYPTnWjmmq8v9xNvgvH//HNbcwawceBuIJbPBZ5IHKkvbbJ5NcHWWyQFBEWt
 hV5GwzdmZvKxIQ/03aeMVpGKyXj9oD+u7U4vn+25fAjbwimE32EATZLb1sv5Zm0eoKnhbxl7r
 /eDhuUtd1UuVWYcJynKbzj48sjn4Gnaqky5HEdCSpLKRl74myU+B07ZsVERMBFKU/FS7fMBiW
 IPnXN5/Z64wL0g8/P2SA/pA635pLikul1698ISqRqkehItZG6ly9EjAw+or6pYNwnETqiQ4KT
 kQ8RcJ6C9tItReJOvMhw5jXdOC5Ibgb7nrZNx+HhwTGyFs0y/syv0D4/Scrffzb0ltb0+KNau
 D1/9BGjmZZR9E/jwcJ23lAvwS2CN063LeQgjbF6Zu9en1mBdyllXb8zxatWMKEUc6av87H/yr
 51Z7PtyQaayqJbYQn5TEMsEr4zTMw3dgWxZT/7M6bO2rLq9wx5YOhUw1rRdcdPOcLTUmYQhNc
 z2yKhurYrrWoXnGy933HECTpQYuaRxN3AASrNSnx9sijxpAnOwnSckottiUSK5D/Q4dMPTr23
 1XAKzuwxG2HINFfisxFkRlvXJ9Li0h

Am 29.12.24 um 20:45 schrieb Kurt Borja:

> Add config entries for each WMI driver managed by the alienware-wmi
> module to be able to conditionally compile them.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/Kconfig         | 30 +++++++++++++++++++----
>   drivers/platform/x86/dell/Makefile        |  4 +--
>   drivers/platform/x86/dell/alienware-wmi.h | 23 +++++++++++++++++
>   3 files changed, 50 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/de=
ll/Kconfig
> index d09060aedd3f..f8a0dffcaab7 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -18,15 +18,35 @@ config ALIENWARE_WMI
>   	tristate "Alienware Special feature control"
>   	default m
>   	depends on ACPI
> +	depends on ACPI_WMI
> +	depends on DMI
>   	depends on LEDS_CLASS
>   	depends on NEW_LEDS
> -	depends on ACPI_WMI
> +	help
> +	 This is a driver for controlling Alienware WMI driven features.
> +
> +	 On legacy devices, it exposes an interface for controlling the AlienF=
X
> +	 zones on Alienware machines that don't contain a dedicated
> +	 AlienFX USB MCU such as the X51 and X51-R2.
> +
> +	 On newer devices, it exposes the AWCC thermal control interface throu=
gh
> +	 known Kernel APIs.
> +
> +config ALIENWARE_WMI_LEGACY
> +	bool "Alienware Legacy WMI device driver"
> +	default y
> +	depends on ALIENWARE_WMI
> +	help
> +	 Legacy Alienware WMI driver with AlienFX LED control capabilities.
> +
> +config ALIENWARE_WMI_WMAX
> +	bool "Alienware WMAX WMI device driver"
> +	default y
> +	depends on ALIENWARE_WMI
>   	select ACPI_PLATFORM_PROFILE
>   	help
> -	 This is a driver for controlling Alienware BIOS driven
> -	 features.  It exposes an interface for controlling the AlienFX
> -	 zones on Alienware machines that don't contain a dedicated AlienFX
> -	 USB MCU such as the X51 and X51-R2.
> +	 Alienware WMI driver with AlienFX LED, HDMI, amplifier, deep sleep an=
d
> +	 AWCC thermal control capabilities.
>
>   config DCDBAS
>   	tristate "Dell Systems Management Base Driver"
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/d=
ell/Makefile
> index d5718ef34c48..8ac9a933c770 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -6,8 +6,8 @@
>
>   obj-$(CONFIG_ALIENWARE_WMI)			+=3D alienware-wmi.o
>   alienware-wmi-objs				:=3D alienware-wmi-base.o
> -alienware-wmi-y					+=3D alienware-wmi-legacy.o
> -alienware-wmi-y					+=3D alienware-wmi-wmax.o
> +alienware-wmi-$(CONFIG_ALIENWARE_WMI_LEGACY)	+=3D alienware-wmi-legacy.=
o
> +alienware-wmi-$(CONFIG_ALIENWARE_WMI_WMAX)	+=3D alienware-wmi-wmax.o
>   obj-$(CONFIG_DCDBAS)				+=3D dcdbas.o
>   obj-$(CONFIG_DELL_LAPTOP)			+=3D dell-laptop.o
>   obj-$(CONFIG_DELL_RBTN)				+=3D dell-rbtn.o
> diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platfor=
m/x86/dell/alienware-wmi.h
> index dccbf4f95da0..ae3731f2fef2 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.h
> +++ b/drivers/platform/x86/dell/alienware-wmi.h
> @@ -69,10 +69,33 @@ int alienware_wmi_command(struct wmi_device *wdev, u=
32 method_id,
>   int alienware_alienfx_setup(struct alienfx_platdata *pdata);
>   void alienware_alienfx_exit(struct wmi_device *wdev);
>
> +#if IS_ENABLED(CONFIG_ALIENWARE_WMI_LEGACY)
>   int __init alienware_legacy_wmi_init(void);
>   void __exit alienware_legacy_wmi_exit(void);
> +#else
> +static inline int alienware_legacy_wmi_init(void)
> +{
> +	return -ENODEV;
> +}
>
> +static inline void alienware_legacy_wmi_exit(void)
> +{
> +}
> +#endif
> +
> +#if IS_ENABLED(CONFIG_ALIENWARE_WMI_WMAX)
>   int __init alienware_wmax_wmi_init(void);
>   void __exit alienware_wmax_wmi_exit(void);
> +#else
> +static inline int alienware_wmax_wmi_init(void)
> +{
> +	return -ENODEV;
> +}
> +
> +
> +static inline void alienware_wmax_wmi_exit(void)
> +{
> +}
> +#endif
>
>   #endif
