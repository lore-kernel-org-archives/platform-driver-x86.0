Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F101B12A177;
	Fri, 27 Dec 2024 04:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272500; cv=none; b=oX7d3IgDCDWVqNs/P9MAw8nu+xBN0UZoplc9HbuSmt/aWf/4r83mOUlrn/z3WMoedT5llfoi/9wI8vhe1lQlxEbhWelVhy+5Ey8tmzNFA92F5aGOyHoTW1BlQzZSXHn8wwKodCHJC5hTL0ME615mdM9noZMNApyc+yZRbRSY+CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272500; c=relaxed/simple;
	bh=fgxwpIOz3zwfAe+EueUvRE91V9Kcgo5H5aTRKzm7DG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBoBy9ahiuCdr9/XhZ1GBZ+acXkB983tTn8lptOXONIuaKzv1E5xnzkXARQewzLE43CALPsAH4dW0UiWrvjCsTjk2XgfKo0AHWVLPMCqdmKJYDbNmfCW7t0e+NN9cb4yX1V8lpqSfzaFQARvVRSBSOlnCuTbPfXdblhHYhizcTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ZD8RaXy9; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ZD8RaXy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735272485; x=1735877285; i=w_armin@gmx.de;
	bh=xzGqwybNGGK7CWqyl5DTmdWHmmtJ+3gb9F+4E5dBzYU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZD8RaXy9MdrbOMFBnPZHGyGa5m42HYcUCCNjYb3RGMKY9lpgc/b72Ze5R72fbUWz
	 KxxNXg9Q+kOkSTa7CKHjOistwwrRCYZHXWH30Y0omGE5Dbvbg5eME36zZWvpiGUXa
	 pC6nuajlBHgl9lFpe3w+YYedqisRAM2cl1mxdKgWU1W1AYScaM9PjGtjm3UMcu6Y0
	 a3cxS5P3/n6IkPm/6zw3X84FxJGsNPl3AMNwPRAmx/4PrQjIxN2qepxxGFKAhJkew
	 QinqFN9g60Gq1xkgTxgeaHaiU1VyFFIEMCOBPF3AjwExzIbhA/0I6dMXbEZnSI/jO
	 GWLezWiIYadEqHKnhw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MF3HU-1tKOrs3hF2-00Gm4V; Fri, 27
 Dec 2024 05:08:04 +0100
Message-ID: <0ae84512-46f4-4cd9-8fd8-ed9694d96ec8@gmx.de>
Date: Fri, 27 Dec 2024 05:08:03 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/20] platform/x86: Update alienware-wmi config entries
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-20-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-20-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pYwFJ0xIPJ1qBD6ewiKSvphdrdQN4+lG26xP3EOcUVeFr8qQuMB
 p6LVexGnHOY6OSiGzMfYTNeRxd8KQzoWAlmpwgoA4XokuxvryYPNpQ2Wj+pa5/2fbjm/A8/
 XOLhLiKtG4tUPCxd77Wlu83lM2J6I0GKLaN+EQKmP/EWB8vDPmiZAj5DdxllFXbuDKovhrp
 YEYQFZsnWgDNnM5/h8OjQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AFeM6MVvOj4=;QX435db6p5WwHQQ6r6cK9zPfuYj
 07xhnhqNL2J6QHjER9JMMMmwyvCgGZOxmciiFZp89i3ol3UXJijdQxGdkcjeL7eijmHdClriS
 H77KRsQcVTCKe261+n5rE5mqDr3KVpjhgXqx60XTL7aipiqj8JLMRun8/JxtTzvlTcbVpvz8Z
 1tu9kBjCo9+W2nZftSDxwmWBvJPpi+9JLgVS9+UjdVo47sic7ogPN9n9Vvt6WYXKNtm6thAJu
 JvQoVFjkfECxjVTcrxhjA8W/AC6mrQMqe+l3E2fJsEjaJjFVg9j+bl6/AwLRaRcZoxkFBGktP
 YoGaXiV/s5I5TJ+pJsE5CBKxlKHg5E0Xi6Wl6uvFlF5wNc1i/VUXr1chLTjvWfNLx1/ET6m8r
 ZTFE6BGNLmG/F9kHMGtuZjCuTHQuayh6gibQg/cPk44DFllBRADR/NnIanvM98FI7n/xuNvUM
 FVSx2TiaVEcnxoYJrnkqLNFx5X6bdBRm6JOFesvj93PCNEmSTUQQwgqbyedS1mWF1zsWkoch0
 Lep9+9Wzxuy+e3pXiDFLwy0Onv6KSZrBQPFO434JUsovfQ7jULsPxfPqN6UvO8d58EyJ6EKmf
 cB1dXFYgLYNz5ss5npl+/BIJJX+THBo2soXVh1p6Vgcm/X3pKT3FlEhKoRe9H83/AfkbpJoPd
 UEWt3ZKQcRPoe2MGb8RkBgxpl3BVMv7uGF/IK93Qd6u7z9131qDG6ZzyYiOQGUOFxtBoTeWAp
 3lQ8ubLucIQTnGTrzmtQ0Ls2somF4nvnTxtf3KifmsvAmrXUUjkpWLBhCbX0H5WwtH6nFsCAB
 GlGY0aUV5y4eIUlgRXJxMu/ay6AZzDE3L74ef7kkk2FvwRaCy/76FcPYkQWJitFqxJrkZ8r4I
 b1Py5TFJVi9Z2nynxGaZ/p9EstKg6gNnjR3kb/RRU5bUgjvnooHRTqklF37UQ1J2h+Hvr9r+K
 7R7cIFvIPvE4YNIugRA3n0i9w0SpwU49Pa4LQC4iKdfIgT1HzrWYjG1zsVHQ86jJDsUU4E5SZ
 x+IDnnLFB6iNaklU3Otoq7Ej/vcatFZgmfPw0DB8gd5Isl9SzlnEJXEzCuLM6/Bv1UgTRzlPQ
 9v6YZdTtN9Yg74Ptp76hGfIbwOh7Y4

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Add config entries for each WMI driver managed by the alienware-wmi
> module to be able to conditionally compile them.
>
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
> index 78ac10122155..97b52e51cd7d 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.h
> +++ b/drivers/platform/x86/dell/alienware-wmi.h
> @@ -94,10 +94,33 @@ acpi_status alienware_wmi_command(struct wmi_device =
*wdev, u32 method_id,
>   int alienware_alienfx_setup(struct alienfx_platdata *pdata);
>   void alienware_alienfx_exit(struct wmi_device *wdev);
>
> +#if IS_ENABLED(CONFIG_ALIENWARE_WMI_LEGACY)
>   int __init alienware_legacy_wmi_init(void);
>   void __exit alienware_legacy_wmi_exit(void);
> +#else
> +int __init alienware_legacy_wmi_init(void)
> +{
> +	return 0;

Please return -EOPNOTSUPP here.

> +}
> +
> +void __exit alienware_legacy_wmi_exit(void)
> +{
> +}
> +#endif
>
> +#if IS_ENABLED(CONFIG_ALIENWARE_WMI_WMAX)
>   int __init alienware_wmax_wmi_init(void);
>   void __exit alienware_wmax_wmi_exit(void);
> +#else
> +int __init alienware_wmax_wmi_init(void)
> +{
> +	return 0;

Same as above.

Thanks,
Armin Wolf

> +}
> +
> +
> +void __exit alienware_wmax_wmi_exit(void)
> +{
> +}
> +#endif
>
>   #endif
