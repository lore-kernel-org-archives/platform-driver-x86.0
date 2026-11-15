Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779433;
	b=QAWgyklpzmaH0ev+cQjMRfqCt1E0Os4paRkkVrig+3kH7eumSBDvFSPRYR4QizwnCZ6c
	 bz0t0arVJBD7fkNcJbn3Ex+mT5fe+NdOf2vz3omKg9YwC3KetQ4UyjFCZ0RqRUYdFC3yR
	 tHzeNKi4NqlqL8jErGDwt+0xWtDj8qsoete6I0360estbHl5s9kGSAFnUw9vFwxh9sWuI
	 osLiOCOiuz1yHRamZn/fJSlTnpjVQ3FXop9hrjP8rIf+t2LQWDBtSBCkUl68jZlVX5kZn
	 BJdVysqfNG+m3MB1vOA8jyx35appXo/0VEB+ataIzChZ/KB9nylwUiS7mfEf01NuKSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779433;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=ucn7XZE/WUqLhAvxQw/CFNm3/LiqKJtAbOZVUi+I1Iw=;
	b=gJEkcYdIZ+JC8I/Mx3kkY323pQQi5ixKxrYJ6EXFzA0wbtBbJUHNpPLNbBNwIpVBg5kA
	 NN6XmCeRF7uYP1tqpmPriV/PwPOxmUMh3mf1kUiLmEHy6tPuODf92mRaTfddFc/IkP7YI
	 z2gLyzRB+xV08nSEki+1cZ/aRzJ3l+oSvbJG2uSQPjcZwXcpvQ4uS37JE3gPjQB3nlH/0
	 oDd9yYG/JVRLM17mB6XYsOcedcb/BvV/t4ESEFdT6lk4gwhgwh9UHkApt+PBx+e5wekUp
	 3m/oNk2VZ6hiSbM3P74rtkahb6Z8M0oitClAHzSe1zR1bJopi4CQeX+wRNyIIzBD+Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=X5Beifr4;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Qh9hkBm+;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FA7606A333
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Nov 2026 21:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2FA7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=X5Beifr4;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Qh9hkBm+
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3B41A7A0100
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Nov 2026 16:50:32 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Sun, 15 Nov 2026 16:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794779432;
	 x=1794865832; bh=ucn7XZE/WUqLhAvxQw/CFNm3/LiqKJtAbOZVUi+I1Iw=; b=
	X5Beifr4M/dgTdPwcChS4pO6w9uUFsb09ykwxxbFFWsQgtMSh9MWcAhQQMv9Nxvs
	0OUspDgAJRDSc0c/1hOpCkEDiVTdYz8o591yyOc9dYiJmOvNKCSyFu0ILkMmNvxR
	1eRKP0Qlc3lW06+K0FCWdzVn32n1Scm1XKrAu8EOpn38dy7Q1nwkXX8xIOZ4JOFs
	iSxwznenTQssbzsDCmgeD7w12wivUfDQb06L0u6+OtYeU1OKoLf1o4Q18wteX73k
	bBbOAGh3wvAWieQaxV+KUnfS79qUszV/euHW1aPKyqmQiJy0xz/2LbONrj7pDT/O
	lkuxAvrBe7sUH0kq7PjD5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794779432; x=
	1794865832; bh=ucn7XZE/WUqLhAvxQw/CFNm3/LiqKJtAbOZVUi+I1Iw=; b=Q
	h9hkBm+DCaMwUyns8CUWzo2MrBEugkp+QbWTVGuCgCQL/qYzc3SFyhLf8iKGj0C8
	wGYqRTrE83GrchnhtdybwGBtuyx6xgfhJOtK9aspJk5zfiNuaOQe+IdS4m3MFAgw
	feo89BT1jUNsXuMvSLIklp4IUU5FeCxHy2QoPlRuD7vMDVfJHCcI05MnHTQpVRjY
	sMS9+0vZQzYnyqxWs75KgrBW8XrL1DCJ9QtcoKVpQMb0jVGqPxm2d11l5Evh2ZtO
	p9Tz7wNiwjWIkfVmZ4JaWzR1ThJu9DXxwQ9ON4iawQLReS1TbR9Z4lEQ4BXvvUq8
	SWnMupVOJbVYm0/xu6Mhg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794779432; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:bUDAL3jnFGoIi127Yp3g15iB1lpWqS24zLj2yOoUnGWPfxj
	HRlxCo5aT3pSqoGxPe3avQH1BEHBDmChbOOLKwk8reFeC/GWLlWFRH+L3I+V27k0
	H023VsYvRuxsNYOc5eUM7hmHk547enZNfHkQyT9026/jnSwcT0LSWwj2zmW19fkJ
	b70v8Qm3AwdbSajJJ8u9LwbfZKkVElFg0WAQg1ykkfiv7tPJ2rS2QHKykhHkpffo
	113AbdAHGmrgCkKxEzBxNudirGvJVcHmJrz09+6GfrECmlD+5QBnP255AR+qp03e
	dDK7CTPZ7EygRdsaPzznDyTE44HgENUiYciJSDg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:vS68xX0PsPOIWgPsiVOBkxz35h0N6ZBbaTMeZ3EwVK0=:gvEKQW0uaAKSP1VExdRr8y/vKa3O49iPjf0Q+e03o2Y=;
X-ME-Sender: <xms:KCn6agEvYR42ObY5uDDH5S5IwY9DdWVo53w9OmojIQ8HKNce2kMcaw>
    <xme:KCn6akK9Fk4gqZxQ_Hm0EdB-nMEX6E4B3czaCOfqFOKdu40xODepqokpb3JTUlrmn
    nSluBMzfJHN-7tDqO2smVGoXzOrD716YpEQ133hvlceGLMdleRaBbIY>
X-ME-Proxy-Cause: dmFkZTFtyUJfm5eRYC3iCxQ8iFNcwK9VNI0y99tAXM+6mAeIriTMHbpwbsC125nFfN8LMl
    /SIBAO9tBVyHNN+REGRkkqloWdGf5IZv1tAFgg5xoAkGBDvpnnrVhS23OEujQNNzrp2BAL
    1nl5ynfjWQl5loBGLUUK4TOyT/VTEwG1OBtzC9+HO5e03LC8uV413ESsXn42R0q985LuYL
    2svD9BtPS6zqF9iUWPygu+b+V0+VJ62anDfU2bAzLgUvt7WNdLO7fTTTdeiu0y+VANYEfL
    eBScEGCR+iC2kx+/J01B143pJTWZ3vjbHu2QqC1xZ4u9hI3nXKo1aIs2ehqVs9YiTlRLf3
    sbVvmdqY1cIjeUrexHdVsS1vwNEaVegH7Qne+Yfj+TRE5Fr2D9wLWXSSuJvzD8ot+NRQE1
    9k63BmEtjn3mN2vlLUX0Am/M1k91dn+TU/rB12lEtEmZ3SRIqz/yXMBbeta1hYW7AF6VT8
    VAPpzpD79Mvaw1xwuBCabGO6LEtixQTmNyh6rPi0q656xHADtQaU0tEvW6vA9/c2uecDuI
    1fpGE7/sniueZ2nKCPxOZeVpOLrErGmueelDYZ15v29itZbZM+dSChgMveOVESGeteGH1m
    +mvCfniFHrgc+ak/1b+LAFVDel2OPoBOtORG2ZCp48Fb9X8Bg3csbCJF3n8Q
X-ME-Proxy: <xmx:KCn6ako3iapYMIf6XuKtxbPUyF2n0Wi7BOtLFPR6XgWPPHNleHycqg>
    <xmx:KCn6ai0Xw8qhRLQ2nVkSYhnwOvDGzufjM02MiyELiz8L6gY4hVm-cg>
    <xmx:KCn6akwO2oj1bpB6bLkIH5qcOT2iu6Pi-Oz1o0v4kYMmP-E512ORgA>
    <xmx:KCn6amjkOKZxBY6D8ztNsYIU6G-7GAC5IaWRRcuJtfc0Oddg27o4FQ>
    <xmx:KCn6aj8YSUh20E8qfBDWHKeLIdWm3ru96Yp5WSMs0cDO7XyRYWXjxzYm>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id E6F562C00085; Sun, 15 Nov 2026 16:50:31 -0500 (EST)
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
X-ThreadId: AdYZAHf3NDmJ
Date: Sun, 15 Nov 2026 16:50:11 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "David Cemin" <dcemin@nvidia.com>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Armin Wolf" <W_Armin@gmx.de>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Jackie Dong" <xy-jackie@139.com>, "Ike Panhc" <ikepanhc@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, ldemarchi@nvidia.com
Message-Id: <cbaf1595-05e3-46cd-b2aa-7bec1315cf8f@app.fastmail.com>
In-Reply-To: <20261113222755.1696567-2-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
 <20261113222755.1696567-2-dcemin@nvidia.com>
Subject: Re: [RFC PATCH 1/3] platform: lenovo: move the architecture independent WMI
 drivers out of x86
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Fri, Nov 13, 2026, at 5:27 PM, David Cemin wrote:
> The Lenovo WMI drivers (events, helpers, capability data, GameZone,
> Other Mode, hotkey utilities and camera button) contain no x86 specific
> code: they talk to firmware through the ACPI-WMI core only. They live
> under drivers/platform/x86 because that is where Lenovo drivers were
> collected, and X86_PLATFORM_DEVICES keeps them off every other
> architecture.
>
> Lenovo now ships ACPI based arm64 laptops whose firmware exposes the
> same WMI GUIDs (the Fn key events, the mic mute LED method, GameZone and
> Other Mode). Give these drivers an architecture independent home,
> drivers/platform/lenovo, following the layout of drivers/platform/surface
> which exists for the same reason, so they can be built wherever the WMI
> core is available. ideapad-laptop, thinkpad_acpi, think-lmi, yogabook and
> the Yoga Tablet drivers stay under x86: they depend on i8042, port I/O or
> x86 only ACPI devices.
>
> Pure code motion: the files, their Kconfig entries and the module naming
> scheme are unchanged. MAINTAINERS entries are updated for the new paths.
>
> Signed-off-by: David Cemin <dcemin@nvidia.com>
> ---
>  MAINTAINERS                                   |  3 +-
>  drivers/platform/Kconfig                      |  2 +
>  drivers/platform/Makefile                     |  1 +
>  drivers/platform/lenovo/Kconfig               | 87 +++++++++++++++++++
>  drivers/platform/lenovo/Makefile              | 22 +++++
>  .../platform/{x86 => }/lenovo/wmi-camera.c    |  0
>  .../platform/{x86 => }/lenovo/wmi-capdata.c   |  0
>  .../platform/{x86 => }/lenovo/wmi-capdata.h   |  0
>  .../platform/{x86 => }/lenovo/wmi-events.c    |  0
>  .../platform/{x86 => }/lenovo/wmi-events.h    |  0
>  .../platform/{x86 => }/lenovo/wmi-gamezone.c  |  0
>  .../platform/{x86 => }/lenovo/wmi-helpers.c   |  0
>  .../platform/{x86 => }/lenovo/wmi-helpers.h   |  0
>  .../{x86 => }/lenovo/wmi-hotkey-utilities.c   |  0
>  drivers/platform/{x86 => }/lenovo/wmi-other.c |  0
>  drivers/platform/x86/lenovo/Kconfig           | 67 --------------
>  drivers/platform/x86/lenovo/Makefile          |  7 --
>  17 files changed, 114 insertions(+), 75 deletions(-)
>  create mode 100644 drivers/platform/lenovo/Kconfig
>  create mode 100644 drivers/platform/lenovo/Makefile
>  rename drivers/platform/{x86 => }/lenovo/wmi-camera.c (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-capdata.c (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-capdata.h (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-events.c (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-events.h (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-gamezone.c (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-helpers.c (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-helpers.h (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-hotkey-utilities.c (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-other.c (100%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 056408bc086e..3b0ad5a3debe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15170,13 +15170,14 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>  F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> +F:	drivers/platform/lenovo/
>  F:	drivers/platform/x86/lenovo/*
> 
>  LENOVO WMI HOTKEY UTILITIES DRIVER
>  M:	Jackie Dong <xy-jackie@139.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
> +F:	drivers/platform/lenovo/wmi-hotkey-utilities.c
> 
>  LENOVO HID drivers
>  M:	Derek J. Clark <derekjohn.clark@gmail.com>
> diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
> index 312788f249c9..80b2b83b69e5 100644
> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -15,6 +15,8 @@ source "drivers/platform/olpc/Kconfig"
> 
>  source "drivers/platform/surface/Kconfig"
> 
> +source "drivers/platform/lenovo/Kconfig"
> +
>  source "drivers/platform/x86/Kconfig"
> 
>  source "drivers/platform/arm64/Kconfig"
> diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
> index fa322e7f8716..0144f88ff6db 100644
> --- a/drivers/platform/Makefile
> +++ b/drivers/platform/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_GOLDFISH)		+= goldfish/
>  obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
>  obj-$(CONFIG_CZNIC_PLATFORMS)	+= cznic/
>  obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
> +obj-$(CONFIG_LENOVO_PLATFORMS)	+= lenovo/
>  obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/
>  obj-$(CONFIG_BCM2835_VCHIQ)	+= raspberrypi/
>  obj-$(CONFIG_ACPI_WMI)		+= wmi/
> diff --git a/drivers/platform/lenovo/Kconfig 
> b/drivers/platform/lenovo/Kconfig
> new file mode 100644
> index 000000000000..8222322ca671
> --- /dev/null
> +++ b/drivers/platform/lenovo/Kconfig
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Lenovo Platform-Specific Drivers
> +#
> +
> +menuconfig LENOVO_PLATFORMS
> +	bool "Lenovo Platform-Specific Device Drivers"
> +	depends on ARM64 || X86 || COMPILE_TEST
> +	default y if ARM64 || X86
> +	help
> +	  Say Y here to get to see options for platform-specific device 
> drivers
> +	  for Lenovo devices that do not depend on the CPU architecture, such
> +	  as the ACPI-WMI based drivers used on both x86 and arm64 laptops.
> +	  This option alone does not add any kernel code.
> +
> +	  If you say N, all options in this submenu will be skipped and 
> disabled.
> +
> +if LENOVO_PLATFORMS
> +
> +config LENOVO_WMI_HELPERS
> +	tristate
> +	depends on ACPI_WMI
> +
> +config LENOVO_WMI_EVENTS
> +	tristate
> +	depends on ACPI_WMI
> +
> +config LENOVO_WMI_CAPDATA
> +	tristate
> +	depends on ACPI_WMI
> +	depends on LENOVO_WMI_HELPERS
> +
> +config LENOVO_WMI_HOTKEY_UTILITIES
> +	tristate "Lenovo Hotkey Utility WMI extras driver"
> +	depends on ACPI_WMI
> +	select NEW_LEDS
> +	select LEDS_CLASS
> +	imply IDEAPAD_LAPTOP
> +	help
> +	  This driver provides WMI support for Lenovo customized hotkeys 
> function,
> +	  such as LED control for audio/mic mute event for Ideapad, YOGA, 
> XiaoXin,
> +	  Gaming, ThinkBook and so on.
> +
> +config LENOVO_WMI_CAMERA
> +	tristate "Lenovo WMI Camera Button driver"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	help
> +	  This driver provides support for Lenovo camera button. The Camera
> +	  button is a GPIO device. This driver receives ACPI notifications 
> when
> +	  the camera button is switched on/off.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called lenovo-wmi-camera.
> +
> +config LENOVO_WMI_GAMEZONE
> +	tristate "Lenovo GameZone WMI Driver"
> +	depends on ACPI_WMI
> +	depends on DMI
> +	select ACPI_PLATFORM_PROFILE
> +	select LENOVO_WMI_EVENTS
> +	select LENOVO_WMI_HELPERS
> +	help
> +	  Say Y here if you have a WMI aware Lenovo Legion device and would 
> like to use the
> +	  platform-profile firmware interface to manage power usage.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo-wmi-gamezone.
> +
> +config LENOVO_WMI_TUNING
> +	tristate "Lenovo Other Mode WMI Driver"
> +	depends on ACPI_WMI
> +	depends on ACPI_BATTERY
> +	select HWMON
> +	select FW_ATTR_CLASS
> +	select LENOVO_WMI_CAPDATA
> +	select LENOVO_WMI_EVENTS
> +	select LENOVO_WMI_HELPERS
> +	help
> +	  Say Y here if you have a WMI aware Lenovo Legion device and would 
> like to use the
> +	  firmware_attributes API to control various tunable settings 
> typically exposed by
> +	  Lenovo software in Windows.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo-wmi-other.
> +
> +endif # LENOVO_PLATFORMS
> diff --git a/drivers/platform/lenovo/Makefile 
> b/drivers/platform/lenovo/Makefile
> new file mode 100644
> index 000000000000..1cac115dd735
> --- /dev/null
> +++ b/drivers/platform/lenovo/Makefile
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for linux/drivers/platform/lenovo
> +# Lenovo Platform Specific Drivers (architecture independent)
> +#
> +
> +lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+= wmi-events.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+= wmi-capdata.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= 
> wmi-hotkey-utilities.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+= wmi-camera.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= wmi-gamezone.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+= wmi-other.o
> +
> +# Add 'lenovo' prefix to each module listed in lenovo-target-*
> +define LENOVO_OBJ_TARGET
> +lenovo-$(1)-y := $(1).o
> +obj-$(2) += lenovo-$(1).o
> +endef
> +
> +$(foreach target, $(basename $(lenovo-target-y)), $(eval $(call 
> LENOVO_OBJ_TARGET,$(target),y)))
> +$(foreach target, $(basename $(lenovo-target-m)), $(eval $(call 
> LENOVO_OBJ_TARGET,$(target),m)))
> diff --git a/drivers/platform/x86/lenovo/wmi-camera.c 
> b/drivers/platform/lenovo/wmi-camera.c
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-camera.c
> rename to drivers/platform/lenovo/wmi-camera.c
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c 
> b/drivers/platform/lenovo/wmi-capdata.c
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-capdata.c
> rename to drivers/platform/lenovo/wmi-capdata.c
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h 
> b/drivers/platform/lenovo/wmi-capdata.h
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-capdata.h
> rename to drivers/platform/lenovo/wmi-capdata.h
> diff --git a/drivers/platform/x86/lenovo/wmi-events.c 
> b/drivers/platform/lenovo/wmi-events.c
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-events.c
> rename to drivers/platform/lenovo/wmi-events.c
> diff --git a/drivers/platform/x86/lenovo/wmi-events.h 
> b/drivers/platform/lenovo/wmi-events.h
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-events.h
> rename to drivers/platform/lenovo/wmi-events.h
> diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c 
> b/drivers/platform/lenovo/wmi-gamezone.c
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-gamezone.c
> rename to drivers/platform/lenovo/wmi-gamezone.c
> diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c 
> b/drivers/platform/lenovo/wmi-helpers.c
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-helpers.c
> rename to drivers/platform/lenovo/wmi-helpers.c
> diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h 
> b/drivers/platform/lenovo/wmi-helpers.h
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-helpers.h
> rename to drivers/platform/lenovo/wmi-helpers.h
> diff --git a/drivers/platform/x86/lenovo/wmi-hotkey-utilities.c 
> b/drivers/platform/lenovo/wmi-hotkey-utilities.c
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
> rename to drivers/platform/lenovo/wmi-hotkey-utilities.c
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c 
> b/drivers/platform/lenovo/wmi-other.c
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-other.c
> rename to drivers/platform/lenovo/wmi-other.c
> diff --git a/drivers/platform/x86/lenovo/Kconfig 
> b/drivers/platform/x86/lenovo/Kconfig
> index 516594993073..36bcefb61805 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -20,29 +20,6 @@ config IDEAPAD_LAPTOP
>  	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
>  	  rfkill switch, hotkey, fan control and backlight control.
> 
> -config LENOVO_WMI_HOTKEY_UTILITIES
> -	tristate "Lenovo Hotkey Utility WMI extras driver"
> -	depends on ACPI_WMI
> -	select NEW_LEDS
> -	select LEDS_CLASS
> -	imply IDEAPAD_LAPTOP
> -	help
> -	  This driver provides WMI support for Lenovo customized hotkeys function,
> -	  such as LED control for audio/mic mute event for Ideapad, YOGA, XiaoXin,
> -	  Gaming, ThinkBook and so on.
> -
> -config LENOVO_WMI_CAMERA
> -	tristate "Lenovo WMI Camera Button driver"
> -	depends on ACPI_WMI
> -	depends on INPUT
> -	help
> -	  This driver provides support for Lenovo camera button. The Camera
> -	  button is a GPIO device. This driver receives ACPI notifications when
> -	  the camera button is switched on/off.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called lenovo-wmi-camera.
> -
>  config LENOVO_YB9_KBDOCK
>  	tristate "Lenovo Yoga Book 9 keyboard dock detection"
>  	depends on ACPI_WMI
> @@ -246,47 +223,3 @@ config YT2_1380
> 
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called lenovo-yogabook.
> -
> -config LENOVO_WMI_CAPDATA
> -	tristate
> -	depends on ACPI_WMI
> -	depends on LENOVO_WMI_HELPERS
> -
> -config LENOVO_WMI_EVENTS
> -	tristate
> -	depends on ACPI_WMI
> -
> -config LENOVO_WMI_HELPERS
> -	tristate
> -	depends on ACPI_WMI
> -
> -config LENOVO_WMI_GAMEZONE
> -	tristate "Lenovo GameZone WMI Driver"
> -	depends on ACPI_WMI
> -	depends on DMI
> -	select ACPI_PLATFORM_PROFILE
> -	select LENOVO_WMI_EVENTS
> -	select LENOVO_WMI_HELPERS
> -	help
> -	  Say Y here if you have a WMI aware Lenovo Legion device and would 
> like to use the
> -	  platform-profile firmware interface to manage power usage.
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called lenovo-wmi-gamezone.
> -
> -config LENOVO_WMI_TUNING
> -	tristate "Lenovo Other Mode WMI Driver"
> -	depends on ACPI_WMI
> -	depends on ACPI_BATTERY
> -	select HWMON
> -	select FW_ATTR_CLASS
> -	select LENOVO_WMI_CAPDATA
> -	select LENOVO_WMI_EVENTS
> -	select LENOVO_WMI_HELPERS
> -	help
> -	  Say Y here if you have a WMI aware Lenovo Legion device and would 
> like to use the
> -	  firmware_attributes API to control various tunable settings 
> typically exposed by
> -	  Lenovo software in Windows.
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called lenovo-wmi-other.
> diff --git a/drivers/platform/x86/lenovo/Makefile 
> b/drivers/platform/x86/lenovo/Makefile
> index 12816d8d5e24..758c36cedee8 100644
> --- a/drivers/platform/x86/lenovo/Makefile
> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -7,17 +7,10 @@ obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
>  obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>  obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
> 
> -lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= wmi-hotkey-utilities.o
>  lenovo-target-$(CONFIG_LENOVO_YB9_KBDOCK)	+= yb9-kbdock.o
>  lenovo-target-$(CONFIG_LENOVO_YMC)	+= ymc.o
>  lenovo-target-$(CONFIG_YOGABOOK)	+= yogabook.o
>  lenovo-target-$(CONFIG_YT2_1380)	+= yoga-tab2-pro-1380-fastcharger.o
> -lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+= wmi-camera.o
> -lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+= wmi-capdata.o
> -lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+= wmi-events.o
> -lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
> -lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= wmi-gamezone.o
> -lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+= wmi-other.o
> 
>  # Add 'lenovo' prefix to each module listed in lenovo-target-*
>  define LENOVO_OBJ_TARGET
> -- 
> 2.56.1

Looks good to me.
Will the MAINTAINERS file need updating?

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
