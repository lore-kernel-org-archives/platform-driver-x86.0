Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1723C219E0;
	Thu,  2 Jan 2025 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735836580; cv=none; b=XC2FEDOqkum8T7yrvPZpr/1KOo/Brynq9psUi0lo73BRIB/kwKJUwaXajXmedaFWxxsd8MMxVrVIdB4symAQr8RgLlKNCP3ih96f/oG2JRfCaYxnriMqmm62suLi7pD5fjT4bRPvf1ay+9LMMp94udhk2w+YzO8JFdWZxV6zc04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735836580; c=relaxed/simple;
	bh=Bh3qfhNNQbriB6qaK9mRm7nGdlkzJ7hUGaUhwj49qbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IodLYE1JpOMoFv81YKDczfwMWNZMLihqBXZ/kXImVfkbyJqrAVgBLG6rzUzVelktLJO3IvYjoMbkCihWzGHdRwa0qF8z9TflTg23/bbtQNe2+EcwP8FnuCxEX+dRWEDe1iz/9OJwtjAcwJcT7rLxak0HJApscAygUoQn38d+Iv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=K218M+7X; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="K218M+7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735836574; x=1736441374; i=w_armin@gmx.de;
	bh=72hXxR8ln6jOMKLSmm0Wn8ZtSe6/1lgWIH7o+bLHN4Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=K218M+7XdgTWJksaZWVLwwMryPqGfwtK+3ygTBWLhUlkdVdG8yFsG3e4BoRPr/W0
	 qsl9yPOpQyfJo7FenZv27R/cEXWJSZGlYggLHAFVAjVe+0DNKs69TnlGHs5wAdwOr
	 wTkOp197IR7b+jcXl4yjJsV7xiPLLaL7BsegDrn/FXDJz3hZ+pR6SM4BQxip9Cqw9
	 hFdHiGxbSKsnWvvXA1fuu0fvec11WjIMjuB01nvar7pe3ZVh19L/MRbcdD9J1okW0
	 1Mdz/9F1PKh6FA8c6w3cx7pZdxpv/LzU4PhZy29dpmNgYUeepDdaCFcLC/DMDipOm
	 Dc2x9K8nesOtORcaPA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MryXH-1toTzk3Toz-00oCW4; Thu, 02
 Jan 2025 17:49:34 +0100
Message-ID: <326123ef-4bcf-4978-a1c6-bb4ebfd4e5ce@gmx.de>
Date: Thu, 2 Jan 2025 17:49:31 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/20] platform-x86: Split the alienware-wmi driver
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-19-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241229194506.8268-19-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nH+5IzPGf7ypEl86NaLc76syHZDs8TCEGSmCHZqILyBHvRHl6bc
 BhNZhZklGZlXU1Srx4lEG3O+kA+h6H8IKKzeD2p8uGahyy6qhQ4XbZpSnwaWehklck6/+hs
 20hkk+AGnOP6VYyT4YM2x7fBmYkX1fIk+FpX/IN1Njx2MgB0lvTs9y3+/UwnmLyKc7VRylr
 VI86uDT5wf9/4MnUoa8Tw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hDO6+aZMTOA=;SLEilEnO6Qg4TwBn7II3In3KrCz
 rxVhL9AjQUx4XiuGkwk2UzgAElLftJD/jYsLvKM3ApJgDbqIef6jsACpRsuaLfhxM5eQQ0jGo
 tLtym2iJL8jj4jKk+DEOWIC0yA9r6Xwim4lW8Ozpp2A09+SMrnIMYMcfYIBIHQ/0QQr++zn28
 uAAShsJRnT3WOiEfdSHZDwrrcClei2GJGf1U+r8e2Nw6GxweigE29KqzW28BOhphhA950mlre
 cRfoZVO5D2YaLUp+mscY3WWpi/r7pOoRq3yWRbPb8kFnI1fZqkoNAbp4OrlygNVxqDwhHon85
 5zLc3f7VmQlCEDPwPT2q4ZViNJLjnHBjx6CLFgD5yRtiddD8YxB+BmyGLE7K0kflvWwX2/oSA
 vO6JFBG/1rWVhqrl6PNX5FY8zsGHfRPM4r73/wPb+a09imEQEv3tUE4lNbMiEt+251Y4mll8X
 HM1kIZ9uaa6rmturcalsYSV2MiJiW1zf1msn4bcxtGVP/VjsdhVLYsKUN9asAyqeMATCQ47u7
 Np1HXgKfVXWDluxgoF+61/6h1MFylg8icfGkC2Y9UV5hA0jCN18A9vMw0MTGwJs7Gwp/z/juV
 QbhNWHarXUfWdba2Wap/UcmZ/MA2mCGNYuNRv50r52YEUtliFawcPUZq8UnB3oTSyOkKNqo+U
 Du6bp8UEpqdYSKGaoohIobQCq2euhaaoiuy98G9B39gAzqiqZS8n/mbxpfVXC1Hz8exo/Ns1Y
 nByP+stpagyVrjDjpw7M9vK5A1tgLeXmE2LPUeYanL4mO2VDMEjeGyuyeLdheK/GgL6sbvzF9
 TxVAfgTDvSKoZVNiTIIh8362iUXRr0kgY45ChgRIsIxOt+0609W0YQqUJHyWfMhyhVv9wY+cR
 yue5VN1qKghsuGFSpbZLvZUup7hwRp5TZezYzFpgwqmTRqZp+f519XKutkeXuWqzCPcm9bNIl
 VQfUnrrOCMjTiQiNg14ndowO6YDcql8vtzOP3TlZcyJNofwiJ16jbzJjoeI0EnPBC5cFMshqT
 Gk8fmALZTdnV98nBJ826ImMhLh5FyBXBK0Yrey1DXrjuggacrYrZ/Gjcgp2un+k5cRRo/sZwY
 3Ouy5orXy2xqp85yZ2356keSg9A399

Am 29.12.24 um 20:45 schrieb Kurt Borja:

> Split alienware-wmi WMI drivers into different files. This is done
> seamlessly by copying and pasting, however some blocks are reordered.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/Makefile            |   2 +
>   .../platform/x86/dell/alienware-wmi-base.c    | 849 +-----------------
>   .../platform/x86/dell/alienware-wmi-legacy.c  |  98 ++
>   .../platform/x86/dell/alienware-wmi-wmax.c    | 775 ++++++++++++++++
>   4 files changed, 876 insertions(+), 848 deletions(-)
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
>
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/d=
ell/Makefile
> index f8aec8502c2f..03ba459f3d31 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -6,6 +6,8 @@
>
>   obj-$(CONFIG_ALIENWARE_WMI)		+=3D alienware-wmi.o
>   alienware-wmi-objs			:=3D alienware-wmi-base.o
> +alienware-wmi-y				+=3D alienware-wmi-legacy.o
> +alienware-wmi-y				+=3D alienware-wmi-wmax.o
>   obj-$(CONFIG_DCDBAS)			+=3D dcdbas.o
>   obj-$(CONFIG_DELL_LAPTOP)		+=3D dell-laptop.o
>   obj-$(CONFIG_DELL_RBTN)			+=3D dell-rbtn.o
> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/pl=
atform/x86/dell/alienware-wmi-base.c
> index a268193ad2a1..fd73c3881dc0 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-base.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
> @@ -8,96 +8,21 @@
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
>   #include <linux/acpi.h>
> -#include <linux/bitfield.h>
> -#include <linux/bits.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> -#include <linux/platform_profile.h>
>   #include <linux/dmi.h>
>   #include <linux/leds.h>
> -#include <linux/wmi.h>
>   #include "alienware-wmi.h"
>
> -#define WMAX_METHOD_HDMI_SOURCE		0x1
> -#define WMAX_METHOD_HDMI_STATUS		0x2
> -#define WMAX_METHOD_BRIGHTNESS		0x3
> -#define WMAX_METHOD_ZONE_CONTROL	0x4
> -#define WMAX_METHOD_HDMI_CABLE		0x5
> -#define WMAX_METHOD_AMPLIFIER_CABLE	0x6
> -#define WMAX_METHOD_DEEP_SLEEP_CONTROL	0x0B
> -#define WMAX_METHOD_DEEP_SLEEP_STATUS	0x0C
> -#define WMAX_METHOD_THERMAL_INFORMATION	0x14
> -#define WMAX_METHOD_THERMAL_CONTROL	0x15
> -#define WMAX_METHOD_GAME_SHIFT_STATUS	0x25
> -
> -#define WMAX_THERMAL_MODE_GMODE		0xAB
> -
> -#define WMAX_FAILURE_CODE		0xFFFFFFFF
> -
>   MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
>   MODULE_DESCRIPTION("Alienware special feature control");
>   MODULE_LICENSE("GPL");
>
> -static bool force_platform_profile;
> -module_param_unsafe(force_platform_profile, bool, 0);
> -MODULE_PARM_DESC(force_platform_profile, "Forces auto-detecting thermal=
 profiles without checking if WMI thermal backend is available");
> -
> -static bool force_gmode;
> -module_param_unsafe(force_gmode, bool, 0);
> -MODULE_PARM_DESC(force_gmode, "Forces G-Mode when performance profile i=
s selected");
> -
>   enum INTERFACE_FLAGS {
>   	LEGACY,
>   	WMAX,
>   };
>
> -enum WMAX_THERMAL_INFORMATION_OPERATIONS {
> -	WMAX_OPERATION_SYS_DESCRIPTION		=3D 0x02,
> -	WMAX_OPERATION_LIST_IDS			=3D 0x03,
> -	WMAX_OPERATION_CURRENT_PROFILE		=3D 0x0B,
> -};
> -
> -enum WMAX_THERMAL_CONTROL_OPERATIONS {
> -	WMAX_OPERATION_ACTIVATE_PROFILE		=3D 0x01,
> -};
> -
> -enum WMAX_GAME_SHIFT_STATUS_OPERATIONS {
> -	WMAX_OPERATION_TOGGLE_GAME_SHIFT	=3D 0x01,
> -	WMAX_OPERATION_GET_GAME_SHIFT_STATUS	=3D 0x02,
> -};
> -
> -enum WMAX_THERMAL_TABLES {
> -	WMAX_THERMAL_TABLE_BASIC		=3D 0x90,
> -	WMAX_THERMAL_TABLE_USTT			=3D 0xA0,
> -};
> -
> -enum wmax_thermal_mode {
> -	THERMAL_MODE_USTT_BALANCED,
> -	THERMAL_MODE_USTT_BALANCED_PERFORMANCE,
> -	THERMAL_MODE_USTT_COOL,
> -	THERMAL_MODE_USTT_QUIET,
> -	THERMAL_MODE_USTT_PERFORMANCE,
> -	THERMAL_MODE_USTT_LOW_POWER,
> -	THERMAL_MODE_BASIC_QUIET,
> -	THERMAL_MODE_BASIC_BALANCED,
> -	THERMAL_MODE_BASIC_BALANCED_PERFORMANCE,
> -	THERMAL_MODE_BASIC_PERFORMANCE,
> -	THERMAL_MODE_LAST,
> -};
> -
> -static const enum platform_profile_option wmax_mode_to_platform_profile=
[THERMAL_MODE_LAST] =3D {
> -	[THERMAL_MODE_USTT_BALANCED]			=3D PLATFORM_PROFILE_BALANCED,
> -	[THERMAL_MODE_USTT_BALANCED_PERFORMANCE]	=3D PLATFORM_PROFILE_BALANCED=
_PERFORMANCE,
> -	[THERMAL_MODE_USTT_COOL]			=3D PLATFORM_PROFILE_COOL,
> -	[THERMAL_MODE_USTT_QUIET]			=3D PLATFORM_PROFILE_QUIET,
> -	[THERMAL_MODE_USTT_PERFORMANCE]			=3D PLATFORM_PROFILE_PERFORMANCE,
> -	[THERMAL_MODE_USTT_LOW_POWER]			=3D PLATFORM_PROFILE_LOW_POWER,
> -	[THERMAL_MODE_BASIC_QUIET]			=3D PLATFORM_PROFILE_QUIET,
> -	[THERMAL_MODE_BASIC_BALANCED]			=3D PLATFORM_PROFILE_BALANCED,
> -	[THERMAL_MODE_BASIC_BALANCED_PERFORMANCE]	=3D PLATFORM_PROFILE_BALANCE=
D_PERFORMANCE,
> -	[THERMAL_MODE_BASIC_PERFORMANCE]		=3D PLATFORM_PROFILE_PERFORMANCE,
> -};
> -
>   static struct alienfx_quirks *quirks;
>
>   static struct alienfx_quirks quirk_inspiron5675 =3D {
> @@ -222,138 +147,7 @@ static const struct dmi_system_id alienware_quirks=
[] __initconst =3D {
>   	{}
>   };
>
> -struct wmax_brightness_args {
> -	u32 led_mask;
> -	u32 percentage;
> -};
> -
> -struct wmax_basic_args {
> -	u8 arg;
> -};
> -
> -struct legacy_led_args {
> -	struct color_platform colors;
> -	u8 brightness;
> -	u8 state;
> -} __packed;
> -
> -struct wmax_led_args {
> -	u32 led_mask;
> -	struct color_platform colors;
> -	u8 state;
> -} __packed;
> -
> -struct wmax_u32_args {
> -	u8 operation;
> -	u8 arg1;
> -	u8 arg2;
> -	u8 arg3;
> -};
> -
> -struct awcc_priv {
> -	struct wmi_device *wdev;
> -	struct platform_profile_handler pp_handler;
> -	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAS=
T];
> -};
> -
> -static u8 interface;
> -
> -struct awcc_quirks {
> -	bool gmode;
> -};
> -
> -static struct awcc_quirks g_series_features =3D {
> -	.gmode =3D true,
> -};
> -
> -static struct awcc_quirks x_series_features =3D {
> -	.gmode =3D false,
> -};
> -
> -static const struct dmi_system_id awcc_dmi_table[] __initconst =3D {
> -	{
> -		.ident =3D "Alienware m17 R5",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> -		},
> -		.driver_data =3D &x_series_features,
> -	},
> -	{
> -		.ident =3D "Alienware m18 R2",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> -		},
> -		.driver_data =3D &x_series_features,
> -	},
> -	{
> -		.ident =3D "Alienware x15 R1",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> -		},
> -		.driver_data =3D &x_series_features,
> -	},
> -	{
> -		.ident =3D "Alienware x17 R2",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> -		},
> -		.driver_data =3D &x_series_features,
> -	},
> -	{
> -		.ident =3D "Dell Inc. G15 5510",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> -		},
> -		.driver_data =3D &g_series_features,
> -	},
> -	{
> -		.ident =3D "Dell Inc. G15 5511",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
> -		},
> -		.driver_data =3D &g_series_features,
> -	},
> -	{
> -		.ident =3D "Dell Inc. G15 5515",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
> -		},
> -		.driver_data =3D &g_series_features,
> -	},
> -	{
> -		.ident =3D "Dell Inc. G3 3500",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
> -		},
> -		.driver_data =3D &g_series_features,
> -	},
> -	{
> -		.ident =3D "Dell Inc. G3 3590",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
> -		},
> -		.driver_data =3D &g_series_features,
> -	},
> -	{
> -		.ident =3D "Dell Inc. G5 5500",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
> -		},
> -		.driver_data =3D &g_series_features,
> -	},
> -};
> -
> -struct awcc_quirks *awcc;
> +u8 interface;
>
>   int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
>   			  void *in_args, size_t in_size, u32 *out_data)
> @@ -586,458 +380,6 @@ static enum led_brightness global_led_get(struct l=
ed_classdev *led_cdev)
>   	return priv->global_brightness;
>   }
>
> -/*
> - *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
> - *	It can toggle between standard system GPU output and HDMI input.
> - */
> -static ssize_t cable_show(struct device *dev, struct device_attribute *=
attr,
> -			  char *buf)
> -{
> -	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
> -	struct wmax_basic_args in_args =3D {
> -		.arg =3D 0,
> -	};
> -	u32 out_data;
> -	int ret;
> -
> -	ret =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
> -				    &in_args, sizeof(in_args), &out_data);
> -
> -	if (!ret) {
> -		if (out_data =3D=3D 0)
> -			return sysfs_emit(buf, "[unconnected] connected unknown\n");
> -		else if (out_data =3D=3D 1)
> -			return sysfs_emit(buf, "unconnected [connected] unknown\n");
> -	}
> -
> -	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);
> -	return sysfs_emit(buf, "unconnected connected [unknown]\n");
> -}
> -
> -static ssize_t source_show(struct device *dev, struct device_attribute =
*attr,
> -			   char *buf)
> -{
> -	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
> -	struct wmax_basic_args in_args =3D {
> -		.arg =3D 0,
> -	};
> -	u32 out_data;
> -	int ret;
> -
> -	ret =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
> -				    &in_args, sizeof(in_args), &out_data);
> -
> -	if (!ret) {
> -		if (out_data =3D=3D 1)
> -			return sysfs_emit(buf, "[input] gpu unknown\n");
> -		else if (out_data =3D=3D 2)
> -			return sysfs_emit(buf, "input [gpu] unknown\n");
> -	}
> -
> -	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
> -	return sysfs_emit(buf, "input gpu [unknown]\n");
> -}
> -
> -static ssize_t source_store(struct device *dev, struct device_attribute=
 *attr,
> -			    const char *buf, size_t count)
> -{
> -	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
> -	struct wmax_basic_args args;
> -	int ret;
> -
> -	if (strcmp(buf, "gpu\n") =3D=3D 0)
> -		args.arg =3D 1;
> -	else if (strcmp(buf, "input\n") =3D=3D 0)
> -		args.arg =3D 2;
> -	else
> -		args.arg =3D 3;
> -	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
> -
> -	ret =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE, &a=
rgs,
> -				    sizeof(args), NULL);
> -
> -	if (ret < 0)
> -		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);
> -
> -	return count;
> -}
> -
> -static DEVICE_ATTR_RO(cable);
> -static DEVICE_ATTR_RW(source);
> -
> -static bool hdmi_group_visible(struct kobject *kobj)
> -{
> -	struct alienfx_priv *priv =3D dev_get_drvdata(kobj_to_dev(kobj));
> -
> -	return priv->quirks->hdmi_mux;
> -}
> -DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
> -
> -static struct attribute *hdmi_attrs[] =3D {
> -	&dev_attr_cable.attr,
> -	&dev_attr_source.attr,
> -	NULL,
> -};
> -
> -static const struct attribute_group hdmi_attribute_group =3D {
> -	.name =3D "hdmi",
> -	.is_visible =3D SYSFS_GROUP_VISIBLE(hdmi),
> -	.attrs =3D hdmi_attrs,
> -};
> -
> -/*
> - * Alienware GFX amplifier support
> - * - Currently supports reading cable status
> - * - Leaving expansion room to possibly support dock/undock events late=
r
> - */
> -static ssize_t status_show(struct device *dev, struct device_attribute =
*attr,
> -			   char *buf)
> -{
> -	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
> -	struct wmax_basic_args in_args =3D {
> -		.arg =3D 0,
> -	};
> -	u32 out_data;
> -	int ret;
> -
> -	ret =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_AMPLIFIER_CABLE=
,
> -				    &in_args, sizeof(in_args), &out_data);
> -
> -	if (!ret) {
> -		if (out_data =3D=3D 0)
> -			return sysfs_emit(buf, "[unconnected] connected unknown\n");
> -		else if (out_data =3D=3D 1)
> -			return sysfs_emit(buf, "unconnected [connected] unknown\n");
> -	}
> -
> -	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", ret);
> -	return sysfs_emit(buf, "unconnected connected [unknown]\n");
> -}
> -
> -static DEVICE_ATTR_RO(status);
> -
> -static bool amplifier_group_visible(struct kobject *kobj)
> -{
> -	struct alienfx_priv *priv =3D dev_get_drvdata(kobj_to_dev(kobj));
> -
> -	return priv->quirks->amplifier;
> -}
> -DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
> -
> -static struct attribute *amplifier_attrs[] =3D {
> -	&dev_attr_status.attr,
> -	NULL,
> -};
> -
> -static const struct attribute_group amplifier_attribute_group =3D {
> -	.name =3D "amplifier",
> -	.is_visible =3D SYSFS_GROUP_VISIBLE(amplifier),
> -	.attrs =3D amplifier_attrs,
> -};
> -
> -/*
> - * Deep Sleep Control support
> - * - Modifies BIOS setting for deep sleep control allowing extra wakeup=
 events
> - */
> -static ssize_t deepsleep_show(struct device *dev, struct device_attribu=
te *attr,
> -			      char *buf)
> -{
> -	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
> -	struct wmax_basic_args in_args =3D {
> -		.arg =3D 0,
> -	};
> -	u32 out_data;
> -	int ret;
> -
> -	ret =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STAT=
US,
> -				    &in_args, sizeof(in_args), &out_data);
> -
> -	if (!ret) {
> -		if (out_data =3D=3D 0)
> -			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
> -		else if (out_data =3D=3D 1)
> -			return sysfs_emit(buf, "disabled [s5] s5_s4\n");
> -		else if (out_data =3D=3D 2)
> -			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
> -	}
> -
> -	pr_err("alienware-wmi: unknown deep sleep status: %d\n", ret);
> -	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
> -}
> -
> -static ssize_t deepsleep_store(struct device *dev, struct device_attrib=
ute *attr,
> -			       const char *buf, size_t count)
> -{
> -	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
> -	struct wmax_basic_args args;
> -	int ret;
> -
> -	if (strcmp(buf, "disabled\n") =3D=3D 0)
> -		args.arg =3D 0;
> -	else if (strcmp(buf, "s5\n") =3D=3D 0)
> -		args.arg =3D 1;
> -	else
> -		args.arg =3D 2;
> -	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf=
);
> -
> -	ret =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONT=
ROL,
> -				    &args, sizeof(args), NULL);
> -
> -	if (!ret)
> -		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret=
);
> -
> -	return count;
> -}
> -
> -static DEVICE_ATTR_RW(deepsleep);
> -
> -static bool deepsleep_group_visible(struct kobject *kobj)
> -{
> -	struct alienfx_priv *priv =3D dev_get_drvdata(kobj_to_dev(kobj));
> -
> -	return priv->quirks->deepslp;
> -}
> -DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
> -
> -static struct attribute *deepsleep_attrs[] =3D {
> -	&dev_attr_deepsleep.attr,
> -	NULL,
> -};
> -
> -static const struct attribute_group deepsleep_attribute_group =3D {
> -	.name =3D "deepsleep",
> -	.is_visible =3D SYSFS_GROUP_VISIBLE(deepsleep),
> -	.attrs =3D deepsleep_attrs,
> -};
> -
> -/*
> - * Thermal Profile control
> - *  - Provides thermal profile control through the Platform Profile API
> - */
> -#define WMAX_THERMAL_TABLE_MASK		GENMASK(7, 4)
> -#define WMAX_THERMAL_MODE_MASK		GENMASK(3, 0)
> -#define WMAX_SENSOR_ID_MASK		BIT(8)
> -
> -static bool is_wmax_thermal_code(u32 code)
> -{
> -	if (code & WMAX_SENSOR_ID_MASK)
> -		return false;
> -
> -	if ((code & WMAX_THERMAL_MODE_MASK) >=3D THERMAL_MODE_LAST)
> -		return false;
> -
> -	if ((code & WMAX_THERMAL_TABLE_MASK) =3D=3D WMAX_THERMAL_TABLE_BASIC &=
&
> -	    (code & WMAX_THERMAL_MODE_MASK) >=3D THERMAL_MODE_BASIC_QUIET)
> -		return true;
> -
> -	if ((code & WMAX_THERMAL_TABLE_MASK) =3D=3D WMAX_THERMAL_TABLE_USTT &&
> -	    (code & WMAX_THERMAL_MODE_MASK) <=3D THERMAL_MODE_USTT_LOW_POWER)
> -		return true;
> -
> -	return false;
> -}
> -
> -static int wmax_thermal_information(struct wmi_device *wdev, u8 operati=
on,
> -				    u8 arg, u32 *out_data)
> -{
> -	struct wmax_u32_args in_args =3D {
> -		.operation =3D operation,
> -		.arg1 =3D arg,
> -		.arg2 =3D 0,
> -		.arg3 =3D 0,
> -	};
> -	int ret;
> -
> -	ret =3D alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
> -				    &in_args, sizeof(in_args), out_data);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (*out_data =3D=3D WMAX_FAILURE_CODE)
> -		return -EBADRQC;
> -
> -	return 0;
> -}
> -
> -static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
> -{
> -	struct wmax_u32_args in_args =3D {
> -		.operation =3D WMAX_OPERATION_ACTIVATE_PROFILE,
> -		.arg1 =3D profile,
> -		.arg2 =3D 0,
> -		.arg3 =3D 0,
> -	};
> -	u32 out_data;
> -	int ret;
> -
> -	ret =3D alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
> -				    &in_args, sizeof(in_args), &out_data);
> -	if (ret)
> -		return ret;
> -
> -	if (out_data =3D=3D WMAX_FAILURE_CODE)
> -		return -EBADRQC;
> -
> -	return 0;
> -}
> -
> -static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation=
,
> -				  u32 *out_data)
> -{
> -	struct wmax_u32_args in_args =3D {
> -		.operation =3D operation,
> -		.arg1 =3D 0,
> -		.arg2 =3D 0,
> -		.arg3 =3D 0,
> -	};
> -	int ret;
> -
> -	ret =3D alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
> -				    &in_args, sizeof(in_args), out_data);
> -
> -	if (ret < 0)
> -		return ret;
> -
> -	if (*out_data =3D=3D WMAX_FAILURE_CODE)
> -		return -EOPNOTSUPP;
> -
> -	return 0;
> -}
> -
> -static int thermal_profile_get(struct platform_profile_handler *pprof,
> -			       enum platform_profile_option *profile)
> -{
> -	struct awcc_priv *priv =3D container_of(pprof, struct awcc_priv, pp_ha=
ndler);
> -	u32 out_data;
> -	int ret;
> -
> -	ret =3D wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_PR=
OFILE,
> -				       0, &out_data);
> -
> -	if (ret < 0)
> -		return ret;
> -
> -	if (out_data =3D=3D WMAX_THERMAL_MODE_GMODE) {
> -		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> -		return 0;
> -	}
> -
> -	if (!is_wmax_thermal_code(out_data))
> -		return -ENODATA;
> -
> -	out_data &=3D WMAX_THERMAL_MODE_MASK;
> -	*profile =3D wmax_mode_to_platform_profile[out_data];
> -
> -	return 0;
> -}
> -
> -static int thermal_profile_set(struct platform_profile_handler *pprof,
> -			       enum platform_profile_option profile)
> -{
> -	struct awcc_priv *priv =3D container_of(pprof, struct awcc_priv, pp_ha=
ndler);
> -
> -	if (awcc->gmode) {
> -		u32 gmode_status;
> -		int ret;
> -
> -		ret =3D wmax_game_shift_status(priv->wdev,
> -					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
> -					     &gmode_status);
> -
> -		if (ret < 0)
> -			return ret;
> -
> -		if ((profile =3D=3D PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
> -		    (profile !=3D PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
> -			ret =3D wmax_game_shift_status(priv->wdev,
> -						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
> -						     &gmode_status);
> -
> -			if (ret < 0)
> -				return ret;
> -		}
> -	}
> -
> -	return wmax_thermal_control(priv->wdev,
> -				    priv->supported_thermal_profiles[profile]);
> -}
> -
> -static int create_thermal_profile(struct wmi_device *wdev)
> -{
> -	struct awcc_priv *priv =3D dev_get_drvdata(&wdev->dev);
> -	enum platform_profile_option profile;
> -	enum wmax_thermal_mode mode;
> -	u8 sys_desc[4];
> -	u32 first_mode;
> -	u32 out_data;
> -	int ret;
> -
> -	ret =3D wmax_thermal_information(wdev, WMAX_OPERATION_SYS_DESCRIPTION,
> -				       0, (u32 *) &sys_desc);
> -	if (ret < 0)
> -		return ret;
> -
> -	first_mode =3D sys_desc[0] + sys_desc[1];
> -
> -	for (u32 i =3D 0; i < sys_desc[3]; i++) {
> -		ret =3D wmax_thermal_information(wdev, WMAX_OPERATION_LIST_IDS,
> -					       i + first_mode, &out_data);
> -
> -		if (ret =3D=3D -EIO)
> -			return ret;
> -
> -		if (ret =3D=3D -EBADRQC)
> -			break;
> -
> -		if (!is_wmax_thermal_code(out_data))
> -			continue;
> -
> -		mode =3D out_data & WMAX_THERMAL_MODE_MASK;
> -		profile =3D wmax_mode_to_platform_profile[mode];
> -		priv->supported_thermal_profiles[profile] =3D out_data;
> -
> -		set_bit(profile, priv->pp_handler.choices);
> -	}
> -
> -	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
> -		return -ENODEV;
> -
> -	if (awcc->gmode) {
> -		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =3D
> -			WMAX_THERMAL_MODE_GMODE;
> -
> -		set_bit(PLATFORM_PROFILE_PERFORMANCE, priv->pp_handler.choices);
> -	}
> -
> -	priv->pp_handler.profile_get =3D thermal_profile_get;
> -	priv->pp_handler.profile_set =3D thermal_profile_set;
> -	priv->pp_handler.name =3D "alienware-wmi";
> -	priv->pp_handler.dev =3D &wdev->dev;
> -
> -	return platform_profile_register(&priv->pp_handler);
> -}
> -
> -static int alienware_awcc_setup(struct wmi_device *wdev)
> -{
> -	struct awcc_priv *priv;
> -
> -	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> -
> -	dev_set_drvdata(&wdev->dev, priv);
> -	priv->wdev =3D wdev;
> -
> -	return create_thermal_profile(wdev);
> -}
> -
> -static void alienware_awcc_exit(struct wmi_device *wdev)
> -{
> -	struct awcc_priv *priv =3D dev_get_drvdata(&wdev->dev);
> -
> -	platform_profile_remove(&priv->pp_handler);
> -}
> -
>   /*
>    * Platform Driver
>    */
> @@ -1073,13 +415,6 @@ static const struct attribute_group *alienfx_group=
s[] =3D {
>   	NULL
>   };
>
> -static const struct attribute_group *wmax_alienfx_groups[] =3D {
> -	&hdmi_attribute_group,
> -	&amplifier_attribute_group,
> -	&deepsleep_attribute_group,
> -	NULL
> -};
> -
>   static struct platform_driver platform_driver =3D {
>   	.driver =3D {
>   		.name =3D "alienware-wmi",
> @@ -1120,188 +455,6 @@ void alienware_alienfx_exit(struct wmi_device *wd=
ev)
>   	platform_driver_unregister(&platform_driver);
>   }
>
> -/*
> - * Legacy WMI driver
> - */
> -static int legacy_wmi_update_led(struct alienfx_priv *priv,
> -				 struct wmi_device *wdev, u8 location)
> -{
> -	struct legacy_led_args legacy_args =3D {
> -		.colors =3D priv->colors[location],
> -		.brightness =3D priv->global_brightness,
> -		.state =3D 0,
> -	};
> -	struct acpi_buffer input;
> -	acpi_status status;
> -
> -	if (legacy_args.state !=3D LEGACY_RUNNING) {
> -		legacy_args.state =3D priv->lighting_control_state;
> -
> -		input.length =3D sizeof(legacy_args);
> -		input.pointer =3D &legacy_args;
> -
> -		status =3D wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
> -					     location + 1, &input, NULL);
> -		if (ACPI_FAILURE(status))
> -			return -EIO;
> -
> -		return 0;
> -	}
> -
> -	return alienware_wmi_command(wdev, location + 1, &legacy_args,
> -				     sizeof(legacy_args), NULL);
> -}
> -
> -static int legacy_wmi_update_brightness(struct alienfx_priv *priv,
> -					struct wmi_device *wdev, u8 brightness)
> -{
> -	return legacy_wmi_update_led(priv, wdev, 0);
> -}
> -
> -static int legacy_wmi_probe(struct wmi_device *wdev, const void *contex=
t)
> -{
> -	struct alienfx_platdata pdata =3D {
> -		.wdev =3D wdev,
> -		.ops =3D {
> -			.upd_led =3D legacy_wmi_update_led,
> -			.upd_brightness =3D legacy_wmi_update_brightness,
> -		},
> -	};
> -
> -	return alienware_alienfx_setup(&pdata);
> -}
> -
> -static void legacy_wmi_remove(struct wmi_device *wdev)
> -{
> -	alienware_alienfx_exit(wdev);
> -}
> -
> -static struct wmi_device_id alienware_legacy_device_id_table[] =3D {
> -	{ LEGACY_CONTROL_GUID, NULL },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
> -
> -static struct wmi_driver alienware_legacy_wmi_driver =3D {
> -	.driver =3D {
> -		.name =3D "alienware-wmi-alienfx",
> -		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> -	},
> -	.id_table =3D alienware_legacy_device_id_table,
> -	.probe =3D legacy_wmi_probe,
> -	.remove =3D legacy_wmi_remove,
> -};
> -
> -int __init alienware_legacy_wmi_init(void)
> -{
> -	return wmi_driver_register(&alienware_legacy_wmi_driver);
> -}
> -
> -void __exit alienware_legacy_wmi_exit(void)
> -{
> -	wmi_driver_unregister(&alienware_legacy_wmi_driver);
> -}
> -
> -/*
> - * WMAX WMI driver
> - */
> -static int wmax_wmi_update_led(struct alienfx_priv *priv,
> -			       struct wmi_device *wdev, u8 location)
> -{
> -	struct wmax_led_args in_args =3D {
> -		.led_mask =3D 1 << location,
> -		.colors =3D priv->colors[location],
> -		.state =3D priv->lighting_control_state,
> -	};
> -
> -	return alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL, &in_args,
> -				     sizeof(in_args), NULL);
> -}
> -
> -static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
> -				      struct wmi_device *wdev, u8 brightness)
> -{
> -	struct wmax_brightness_args in_args =3D {
> -		.led_mask =3D 0xFF,
> -		.percentage =3D brightness,
> -	};
> -
> -	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
> -				     sizeof(in_args), NULL);
> -}
> -
> -static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> -{
> -	struct alienfx_platdata pdata =3D {
> -		.wdev =3D wdev,
> -		.ops =3D {
> -			.upd_led =3D wmax_wmi_update_led,
> -			.upd_brightness =3D wmax_wmi_update_brightness,
> -		},
> -	};
> -	struct platform_device *pdev;
> -	int ret;
> -
> -	if (awcc) {
> -		ret =3D alienware_awcc_setup(wdev);
> -	} else {
> -		ret =3D alienware_alienfx_setup(&pdata);
> -		if (ret < 0)
> -			return ret;
> -
> -		pdev =3D dev_get_drvdata(&wdev->dev);
> -		ret =3D device_add_groups(&pdev->dev, wmax_alienfx_groups);
> -	}
> -
> -	return ret;
> -}
> -
> -static void wmax_wmi_remove(struct wmi_device *wdev)
> -{
> -	if (awcc)
> -		alienware_awcc_exit(wdev);
> -	else
> -		alienware_alienfx_exit(wdev);
> -}
> -
> -static struct wmi_device_id alienware_wmax_device_id_table[] =3D {
> -	{ WMAX_CONTROL_GUID, NULL },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
> -
> -static struct wmi_driver alienware_wmax_wmi_driver =3D {
> -	.driver =3D {
> -		.name =3D "alienware-wmi-wmax",
> -		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> -	},
> -	.id_table =3D alienware_wmax_device_id_table,
> -	.probe =3D wmax_wmi_probe,
> -	.remove =3D wmax_wmi_remove,
> -};
> -
> -int __init alienware_wmax_wmi_init(void)
> -{
> -	const struct dmi_system_id *id;
> -
> -	id =3D dmi_first_match(awcc_dmi_table);
> -	if (id)
> -		awcc =3D id->driver_data;
> -
> -	if (force_platform_profile)
> -		awcc =3D &x_series_features;
> -
> -	if (force_gmode)
> -		awcc =3D &g_series_features;
> -
> -	return wmi_driver_register(&alienware_wmax_wmi_driver);
> -}
> -
> -void __exit alienware_wmax_wmi_exit(void)
> -{
> -	wmi_driver_unregister(&alienware_wmax_wmi_driver);
> -}
> -
>   static int __init alienware_wmi_init(void)
>   {
>   	int ret;
> diff --git a/drivers/platform/x86/dell/alienware-wmi-legacy.c b/drivers/=
platform/x86/dell/alienware-wmi-legacy.c
> new file mode 100644
> index 000000000000..b53a931f97b5
> --- /dev/null
> +++ b/drivers/platform/x86/dell/alienware-wmi-legacy.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Alienware LEGACY WMI device driver
> + *
> + * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
> + */
> +
> +#include <linux/wmi.h>
> +#include "alienware-wmi.h"
> +
> +struct legacy_led_args {
> +	struct color_platform colors;
> +	u8 brightness;
> +	u8 state;
> +} __packed;
> +
> +
> +/*
> + * Legacy WMI driver
> + */
> +static int legacy_wmi_update_led(struct alienfx_priv *priv,
> +				 struct wmi_device *wdev, u8 location)
> +{
> +	struct legacy_led_args legacy_args =3D {
> +		.colors =3D priv->colors[location],
> +		.brightness =3D priv->global_brightness,
> +		.state =3D 0,
> +	};
> +	struct acpi_buffer input;
> +	acpi_status status;
> +
> +	if (legacy_args.state !=3D LEGACY_RUNNING) {
> +		legacy_args.state =3D priv->lighting_control_state;
> +
> +		input.length =3D sizeof(legacy_args);
> +		input.pointer =3D &legacy_args;
> +
> +		status =3D wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
> +					     location + 1, &input, NULL);
> +		if (ACPI_FAILURE(status))
> +			return -EIO;
> +
> +		return 0;
> +	}
> +
> +	return alienware_wmi_command(wdev, location + 1, &legacy_args,
> +				     sizeof(legacy_args), NULL);
> +}
> +
> +static int legacy_wmi_update_brightness(struct alienfx_priv *priv,
> +					struct wmi_device *wdev, u8 brightness)
> +{
> +	return legacy_wmi_update_led(priv, wdev, 0);
> +}
> +
> +static int legacy_wmi_probe(struct wmi_device *wdev, const void *contex=
t)
> +{
> +	struct alienfx_platdata pdata =3D {
> +		.wdev =3D wdev,
> +		.ops =3D {
> +			.upd_led =3D legacy_wmi_update_led,
> +			.upd_brightness =3D legacy_wmi_update_brightness,
> +		},
> +	};
> +
> +	return alienware_alienfx_setup(&pdata);
> +}
> +
> +static void legacy_wmi_remove(struct wmi_device *wdev)
> +{
> +	alienware_alienfx_exit(wdev);
> +}
> +
> +static struct wmi_device_id alienware_legacy_device_id_table[] =3D {
> +	{ LEGACY_CONTROL_GUID, NULL },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
> +
> +static struct wmi_driver alienware_legacy_wmi_driver =3D {
> +	.driver =3D {
> +		.name =3D "alienware-wmi-alienfx",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D alienware_legacy_device_id_table,
> +	.probe =3D legacy_wmi_probe,
> +	.remove =3D legacy_wmi_remove,
> +};
> +
> +int __init alienware_legacy_wmi_init(void)
> +{
> +	return wmi_driver_register(&alienware_legacy_wmi_driver);
> +}
> +
> +void __exit alienware_legacy_wmi_exit(void)
> +{
> +	wmi_driver_unregister(&alienware_legacy_wmi_driver);
> +}
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pl=
atform/x86/dell/alienware-wmi-wmax.c
> new file mode 100644
> index 000000000000..597be9e6d19c
> --- /dev/null
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -0,0 +1,775 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Alienware WMAX WMI device driver
> + *
> + * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/dmi.h>
> +#include <linux/moduleparam.h>
> +#include <linux/platform_profile.h>
> +#include <linux/wmi.h>
> +#include "alienware-wmi.h"
> +
> +#define WMAX_METHOD_HDMI_SOURCE			0x1
> +#define WMAX_METHOD_HDMI_STATUS			0x2
> +#define WMAX_METHOD_HDMI_CABLE			0x5
> +#define WMAX_METHOD_AMPLIFIER_CABLE		0x6
> +#define WMAX_METHOD_DEEP_SLEEP_CONTROL		0x0B
> +#define WMAX_METHOD_DEEP_SLEEP_STATUS		0x0C
> +#define WMAX_METHOD_BRIGHTNESS			0x3
> +#define WMAX_METHOD_ZONE_CONTROL		0x4
> +#define WMAX_METHOD_THERMAL_INFORMATION		0x14
> +#define WMAX_METHOD_THERMAL_CONTROL		0x15
> +#define WMAX_METHOD_GAME_SHIFT_STATUS		0x25
> +
> +#define WMAX_THERMAL_MODE_GMODE			0xAB
> +
> +#define WMAX_FAILURE_CODE			0xFFFFFFFF
> +#define WMAX_THERMAL_TABLE_MASK			GENMASK(7, 4)
> +#define WMAX_THERMAL_MODE_MASK			GENMASK(3, 0)
> +#define WMAX_SENSOR_ID_MASK			BIT(8)
> +
> +static bool force_platform_profile;
> +module_param_unsafe(force_platform_profile, bool, 0);
> +MODULE_PARM_DESC(force_platform_profile, "Forces auto-detecting thermal=
 profiles without checking if WMI thermal backend is available");
> +
> +static bool force_gmode;
> +module_param_unsafe(force_gmode, bool, 0);
> +MODULE_PARM_DESC(force_gmode, "Forces G-Mode when performance profile i=
s selected");
> +
> +struct awcc_quirks {
> +	bool gmode;
> +};
> +
> +static struct awcc_quirks g_series_features =3D {
> +	.gmode =3D true,
> +};
> +
> +static struct awcc_quirks x_series_features =3D {
> +	.gmode =3D false,
> +};
> +
> +static const struct dmi_system_id awcc_dmi_table[] __initconst =3D {
> +	{
> +		.ident =3D "Alienware m17 R5",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> +		},
> +		.driver_data =3D &x_series_features,
> +	},
> +	{
> +		.ident =3D "Alienware m18 R2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> +		},
> +		.driver_data =3D &x_series_features,
> +	},
> +	{
> +		.ident =3D "Alienware x15 R1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> +		},
> +		.driver_data =3D &x_series_features,
> +	},
> +	{
> +		.ident =3D "Alienware x17 R2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> +		},
> +		.driver_data =3D &x_series_features,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G15 5510",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> +		},
> +		.driver_data =3D &g_series_features,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G15 5511",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
> +		},
> +		.driver_data =3D &g_series_features,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G15 5515",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
> +		},
> +		.driver_data =3D &g_series_features,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G3 3500",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
> +		},
> +		.driver_data =3D &g_series_features,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G3 3590",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
> +		},
> +		.driver_data =3D &g_series_features,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G5 5500",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
> +		},
> +		.driver_data =3D &g_series_features,
> +	},
> +};
> +
> +enum WMAX_THERMAL_INFORMATION_OPERATIONS {
> +	WMAX_OPERATION_SYS_DESCRIPTION		=3D 0x02,
> +	WMAX_OPERATION_LIST_IDS			=3D 0x03,
> +	WMAX_OPERATION_CURRENT_PROFILE		=3D 0x0B,
> +};
> +
> +enum WMAX_THERMAL_CONTROL_OPERATIONS {
> +	WMAX_OPERATION_ACTIVATE_PROFILE		=3D 0x01,
> +};
> +
> +enum WMAX_GAME_SHIFT_STATUS_OPERATIONS {
> +	WMAX_OPERATION_TOGGLE_GAME_SHIFT	=3D 0x01,
> +	WMAX_OPERATION_GET_GAME_SHIFT_STATUS	=3D 0x02,
> +};
> +
> +enum WMAX_THERMAL_TABLES {
> +	WMAX_THERMAL_TABLE_BASIC		=3D 0x90,
> +	WMAX_THERMAL_TABLE_USTT			=3D 0xA0,
> +};
> +
> +enum wmax_thermal_mode {
> +	THERMAL_MODE_USTT_BALANCED,
> +	THERMAL_MODE_USTT_BALANCED_PERFORMANCE,
> +	THERMAL_MODE_USTT_COOL,
> +	THERMAL_MODE_USTT_QUIET,
> +	THERMAL_MODE_USTT_PERFORMANCE,
> +	THERMAL_MODE_USTT_LOW_POWER,
> +	THERMAL_MODE_BASIC_QUIET,
> +	THERMAL_MODE_BASIC_BALANCED,
> +	THERMAL_MODE_BASIC_BALANCED_PERFORMANCE,
> +	THERMAL_MODE_BASIC_PERFORMANCE,
> +	THERMAL_MODE_LAST,
> +};
> +
> +struct wmax_led_args {
> +	u32 led_mask;
> +	struct color_platform colors;
> +	u8 state;
> +} __packed;
> +
> +struct wmax_brightness_args {
> +	u32 led_mask;
> +	u32 percentage;
> +};
> +
> +struct wmax_basic_args {
> +	u8 arg;
> +};
> +
> +struct wmax_u32_args {
> +	u8 operation;
> +	u8 arg1;
> +	u8 arg2;
> +	u8 arg3;
> +};
> +
> +struct awcc_priv {
> +	struct wmi_device *wdev;
> +	struct platform_profile_handler pp_handler;
> +	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAS=
T];
> +};
> +
> +static const enum platform_profile_option wmax_mode_to_platform_profile=
[THERMAL_MODE_LAST] =3D {
> +	[THERMAL_MODE_USTT_BALANCED]			=3D PLATFORM_PROFILE_BALANCED,
> +	[THERMAL_MODE_USTT_BALANCED_PERFORMANCE]	=3D PLATFORM_PROFILE_BALANCED=
_PERFORMANCE,
> +	[THERMAL_MODE_USTT_COOL]			=3D PLATFORM_PROFILE_COOL,
> +	[THERMAL_MODE_USTT_QUIET]			=3D PLATFORM_PROFILE_QUIET,
> +	[THERMAL_MODE_USTT_PERFORMANCE]			=3D PLATFORM_PROFILE_PERFORMANCE,
> +	[THERMAL_MODE_USTT_LOW_POWER]			=3D PLATFORM_PROFILE_LOW_POWER,
> +	[THERMAL_MODE_BASIC_QUIET]			=3D PLATFORM_PROFILE_QUIET,
> +	[THERMAL_MODE_BASIC_BALANCED]			=3D PLATFORM_PROFILE_BALANCED,
> +	[THERMAL_MODE_BASIC_BALANCED_PERFORMANCE]	=3D PLATFORM_PROFILE_BALANCE=
D_PERFORMANCE,
> +	[THERMAL_MODE_BASIC_PERFORMANCE]		=3D PLATFORM_PROFILE_PERFORMANCE,
> +};
> +
> +struct awcc_quirks *awcc;
> +
> +/*
> + *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
> + *	It can toggle between standard system GPU output and HDMI input.
> + */
> +static ssize_t cable_show(struct device *dev, struct device_attribute *=
attr,
> +			  char *buf)
> +{
> +	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
> +	struct wmax_basic_args in_args =3D {
> +		.arg =3D 0,
> +	};
> +	u32 out_data;
> +	int ret;
> +
> +	ret =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
> +				    &in_args, sizeof(in_args), &out_data);
> +
> +	if (!ret) {
> +		if (out_data =3D=3D 0)
> +			return sysfs_emit(buf, "[unconnected] connected unknown\n");
> +		else if (out_data =3D=3D 1)
> +			return sysfs_emit(buf, "unconnected [connected] unknown\n");
> +	}
> +
> +	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);
> +	return sysfs_emit(buf, "unconnected connected [unknown]\n");
> +}
> +
> +static ssize_t source_show(struct device *dev, struct device_attribute =
*attr,
> +			   char *buf)
> +{
> +	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
> +	struct wmax_basic_args in_args =3D {
> +		.arg =3D 0,
> +	};
> +	u32 out_data;
> +	int ret;
> +
> +	ret =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
> +				    &in_args, sizeof(in_args), &out_data);
> +
> +	if (!ret) {
> +		if (out_data =3D=3D 1)
> +			return sysfs_emit(buf, "[input] gpu unknown\n");
> +		else if (out_data =3D=3D 2)
> +			return sysfs_emit(buf, "input [gpu] unknown\n");
> +	}
> +
> +	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
> +	return sysfs_emit(buf, "input gpu [unknown]\n");
> +}
> +
> +static ssize_t source_store(struct device *dev, struct device_attribute=
 *attr,
> +			    const char *buf, size_t count)
> +{
> +	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
> +	struct wmax_basic_args args;
> +	int ret;
> +
> +	if (strcmp(buf, "gpu\n") =3D=3D 0)
> +		args.arg =3D 1;
> +	else if (strcmp(buf, "input\n") =3D=3D 0)
> +		args.arg =3D 2;
> +	else
> +		args.arg =3D 3;
> +	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
> +
> +	ret =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE, &a=
rgs,
> +				    sizeof(args), NULL);
> +
> +	if (ret < 0)
> +		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RO(cable);
> +static DEVICE_ATTR_RW(source);
> +
> +static bool hdmi_group_visible(struct kobject *kobj)
> +{
> +	struct alienfx_priv *priv =3D dev_get_drvdata(kobj_to_dev(kobj));
> +
> +	return priv->quirks->hdmi_mux;
> +}
> +DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
> +
> +static struct attribute *hdmi_attrs[] =3D {
> +	&dev_attr_cable.attr,
> +	&dev_attr_source.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group hdmi_attribute_group =3D {
> +	.name =3D "hdmi",
> +	.is_visible =3D SYSFS_GROUP_VISIBLE(hdmi),
> +	.attrs =3D hdmi_attrs,
> +};
> +
> +/*
> + * Alienware GFX amplifier support
> + * - Currently supports reading cable status
> + * - Leaving expansion room to possibly support dock/undock events late=
r
> + */
> +static ssize_t status_show(struct device *dev, struct device_attribute =
*attr,
> +			   char *buf)
> +{
> +	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
> +	struct wmax_basic_args in_args =3D {
> +		.arg =3D 0,
> +	};
> +	u32 out_data;
> +	int ret;
> +
> +	ret =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_AMPLIFIER_CABLE=
,
> +				    &in_args, sizeof(in_args), &out_data);
> +
> +	if (!ret) {
> +		if (out_data =3D=3D 0)
> +			return sysfs_emit(buf, "[unconnected] connected unknown\n");
> +		else if (out_data =3D=3D 1)
> +			return sysfs_emit(buf, "unconnected [connected] unknown\n");
> +	}
> +
> +	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", ret);
> +	return sysfs_emit(buf, "unconnected connected [unknown]\n");
> +}
> +
> +static DEVICE_ATTR_RO(status);
> +
> +static bool amplifier_group_visible(struct kobject *kobj)
> +{
> +	struct alienfx_priv *priv =3D dev_get_drvdata(kobj_to_dev(kobj));
> +
> +	return priv->quirks->amplifier;
> +}
> +DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
> +
> +static struct attribute *amplifier_attrs[] =3D {
> +	&dev_attr_status.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group amplifier_attribute_group =3D {
> +	.name =3D "amplifier",
> +	.is_visible =3D SYSFS_GROUP_VISIBLE(amplifier),
> +	.attrs =3D amplifier_attrs,
> +};
> +
> +/*
> + * Deep Sleep Control support
> + * - Modifies BIOS setting for deep sleep control allowing extra wakeup=
 events
> + */
> +static ssize_t deepsleep_show(struct device *dev, struct device_attribu=
te *attr,
> +			      char *buf)
> +{
> +	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
> +	struct wmax_basic_args in_args =3D {
> +		.arg =3D 0,
> +	};
> +	u32 out_data;
> +	int ret;
> +
> +	ret =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STAT=
US,
> +				    &in_args, sizeof(in_args), &out_data);
> +
> +	if (!ret) {
> +		if (out_data =3D=3D 0)
> +			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
> +		else if (out_data =3D=3D 1)
> +			return sysfs_emit(buf, "disabled [s5] s5_s4\n");
> +		else if (out_data =3D=3D 2)
> +			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
> +	}
> +
> +	pr_err("alienware-wmi: unknown deep sleep status: %d\n", ret);
> +	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
> +}
> +
> +static ssize_t deepsleep_store(struct device *dev, struct device_attrib=
ute *attr,
> +			       const char *buf, size_t count)
> +{
> +	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
> +	struct wmax_basic_args args;
> +	int ret;
> +
> +	if (strcmp(buf, "disabled\n") =3D=3D 0)
> +		args.arg =3D 0;
> +	else if (strcmp(buf, "s5\n") =3D=3D 0)
> +		args.arg =3D 1;
> +	else
> +		args.arg =3D 2;
> +	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf=
);
> +
> +	ret =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONT=
ROL,
> +				    &args, sizeof(args), NULL);
> +
> +	if (!ret)
> +		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret=
);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(deepsleep);
> +
> +static bool deepsleep_group_visible(struct kobject *kobj)
> +{
> +	struct alienfx_priv *priv =3D dev_get_drvdata(kobj_to_dev(kobj));
> +
> +	return priv->quirks->deepslp;
> +}
> +DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
> +
> +static struct attribute *deepsleep_attrs[] =3D {
> +	&dev_attr_deepsleep.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group deepsleep_attribute_group =3D {
> +	.name =3D "deepsleep",
> +	.is_visible =3D SYSFS_GROUP_VISIBLE(deepsleep),
> +	.attrs =3D deepsleep_attrs,
> +};
> +
> +static const struct attribute_group *wmax_alienfx_groups[] =3D {
> +	&hdmi_attribute_group,
> +	&amplifier_attribute_group,
> +	&deepsleep_attribute_group,
> +	NULL
> +};
> +
> +/*
> + * Thermal Profile control
> + *  - Provides thermal profile control through the Platform Profile API
> + */
> +static bool is_wmax_thermal_code(u32 code)
> +{
> +	if (code & WMAX_SENSOR_ID_MASK)
> +		return false;
> +
> +	if ((code & WMAX_THERMAL_MODE_MASK) >=3D THERMAL_MODE_LAST)
> +		return false;
> +
> +	if ((code & WMAX_THERMAL_TABLE_MASK) =3D=3D WMAX_THERMAL_TABLE_BASIC &=
&
> +	    (code & WMAX_THERMAL_MODE_MASK) >=3D THERMAL_MODE_BASIC_QUIET)
> +		return true;
> +
> +	if ((code & WMAX_THERMAL_TABLE_MASK) =3D=3D WMAX_THERMAL_TABLE_USTT &&
> +	    (code & WMAX_THERMAL_MODE_MASK) <=3D THERMAL_MODE_USTT_LOW_POWER)
> +		return true;
> +
> +	return false;
> +}
> +
> +static int wmax_thermal_information(struct wmi_device *wdev, u8 operati=
on,
> +				    u8 arg, u32 *out_data)
> +{
> +	struct wmax_u32_args in_args =3D {
> +		.operation =3D operation,
> +		.arg1 =3D arg,
> +		.arg2 =3D 0,
> +		.arg3 =3D 0,
> +	};
> +	int ret;
> +
> +	ret =3D alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
> +				    &in_args, sizeof(in_args), out_data);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (*out_data =3D=3D WMAX_FAILURE_CODE)
> +		return -EBADRQC;
> +
> +	return 0;
> +}
> +
> +static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
> +{
> +	struct wmax_u32_args in_args =3D {
> +		.operation =3D WMAX_OPERATION_ACTIVATE_PROFILE,
> +		.arg1 =3D profile,
> +		.arg2 =3D 0,
> +		.arg3 =3D 0,
> +	};
> +	u32 out_data;
> +	int ret;
> +
> +	ret =3D alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
> +				    &in_args, sizeof(in_args), &out_data);
> +	if (ret)
> +		return ret;
> +
> +	if (out_data =3D=3D WMAX_FAILURE_CODE)
> +		return -EBADRQC;
> +
> +	return 0;
> +}
> +
> +static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation=
,
> +				  u32 *out_data)
> +{
> +	struct wmax_u32_args in_args =3D {
> +		.operation =3D operation,
> +		.arg1 =3D 0,
> +		.arg2 =3D 0,
> +		.arg3 =3D 0,
> +	};
> +	int ret;
> +
> +	ret =3D alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
> +				    &in_args, sizeof(in_args), out_data);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (*out_data =3D=3D WMAX_FAILURE_CODE)
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +
> +static int thermal_profile_get(struct platform_profile_handler *pprof,
> +			       enum platform_profile_option *profile)
> +{
> +	struct awcc_priv *priv =3D container_of(pprof, struct awcc_priv, pp_ha=
ndler);
> +	u32 out_data;
> +	int ret;
> +
> +	ret =3D wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_PR=
OFILE,
> +				       0, &out_data);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (out_data =3D=3D WMAX_THERMAL_MODE_GMODE) {
> +		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +		return 0;
> +	}
> +
> +	if (!is_wmax_thermal_code(out_data))
> +		return -ENODATA;
> +
> +	out_data &=3D WMAX_THERMAL_MODE_MASK;
> +	*profile =3D wmax_mode_to_platform_profile[out_data];
> +
> +	return 0;
> +}
> +
> +static int thermal_profile_set(struct platform_profile_handler *pprof,
> +			       enum platform_profile_option profile)
> +{
> +	struct awcc_priv *priv =3D container_of(pprof, struct awcc_priv, pp_ha=
ndler);
> +
> +	if (awcc->gmode) {
> +		u32 gmode_status;
> +		int ret;
> +
> +		ret =3D wmax_game_shift_status(priv->wdev,
> +					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
> +					     &gmode_status);
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		if ((profile =3D=3D PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
> +		    (profile !=3D PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
> +			ret =3D wmax_game_shift_status(priv->wdev,
> +						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
> +						     &gmode_status);
> +
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
> +
> +	return wmax_thermal_control(priv->wdev,
> +				    priv->supported_thermal_profiles[profile]);
> +}
> +
> +static int create_thermal_profile(struct wmi_device *wdev)
> +{
> +	struct awcc_priv *priv =3D dev_get_drvdata(&wdev->dev);
> +	enum platform_profile_option profile;
> +	enum wmax_thermal_mode mode;
> +	u8 sys_desc[4];
> +	u32 first_mode;
> +	u32 out_data;
> +	int ret;
> +
> +	ret =3D wmax_thermal_information(wdev, WMAX_OPERATION_SYS_DESCRIPTION,
> +				       0, (u32 *) &sys_desc);
> +	if (ret < 0)
> +		return ret;
> +
> +	first_mode =3D sys_desc[0] + sys_desc[1];
> +
> +	for (u32 i =3D 0; i < sys_desc[3]; i++) {
> +		ret =3D wmax_thermal_information(wdev, WMAX_OPERATION_LIST_IDS,
> +					       i + first_mode, &out_data);
> +
> +		if (ret =3D=3D -EIO)
> +			return ret;
> +
> +		if (ret =3D=3D -EBADRQC)
> +			break;
> +
> +		if (!is_wmax_thermal_code(out_data))
> +			continue;
> +
> +		mode =3D out_data & WMAX_THERMAL_MODE_MASK;
> +		profile =3D wmax_mode_to_platform_profile[mode];
> +		priv->supported_thermal_profiles[profile] =3D out_data;
> +
> +		set_bit(profile, priv->pp_handler.choices);
> +	}
> +
> +	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
> +		return -ENODEV;
> +
> +	if (awcc->gmode) {
> +		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =3D
> +			WMAX_THERMAL_MODE_GMODE;
> +
> +		set_bit(PLATFORM_PROFILE_PERFORMANCE, priv->pp_handler.choices);
> +	}
> +
> +	priv->pp_handler.profile_get =3D thermal_profile_get;
> +	priv->pp_handler.profile_set =3D thermal_profile_set;
> +	priv->pp_handler.name =3D "alienware-wmi";
> +	priv->pp_handler.dev =3D &wdev->dev;
> +
> +	return platform_profile_register(&priv->pp_handler);
> +}
> +
> +static int alienware_awcc_setup(struct wmi_device *wdev)
> +{
> +	struct awcc_priv *priv;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, priv);
> +	priv->wdev =3D wdev;
> +
> +	ret =3D create_thermal_profile(wdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void alienware_awcc_exit(struct wmi_device *wdev)
> +{
> +	struct awcc_priv *priv;
> +
> +	priv =3D dev_get_drvdata(&wdev->dev);
> +
> +	platform_profile_remove(&priv->pp_handler);
> +}
> +
> +/*
> + * WMAX WMI driver
> + */
> +static int wmax_wmi_update_led(struct alienfx_priv *priv,
> +			       struct wmi_device *wdev, u8 location)
> +{
> +	struct wmax_led_args in_args =3D {
> +		.led_mask =3D 1 << location,
> +		.colors =3D priv->colors[location],
> +		.state =3D priv->lighting_control_state,
> +	};
> +
> +	return alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL, &in_args,
> +				     sizeof(in_args), NULL);
> +}
> +
> +static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
> +				      struct wmi_device *wdev, u8 brightness)
> +{
> +	struct wmax_brightness_args in_args =3D {
> +		.led_mask =3D 0xFF,
> +		.percentage =3D brightness,
> +	};
> +
> +	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
> +				     sizeof(in_args), NULL);
> +}
> +
> +static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct alienfx_platdata pdata =3D {
> +		.wdev =3D wdev,
> +		.ops =3D {
> +			.upd_led =3D wmax_wmi_update_led,
> +			.upd_brightness =3D wmax_wmi_update_brightness,
> +		},
> +	};
> +	struct platform_device *pdev;
> +	int ret =3D 0;
> +
> +	if (awcc) {
> +		ret =3D alienware_awcc_setup(wdev);
> +	} else {
> +		ret =3D alienware_alienfx_setup(&pdata);
> +		if (ret < 0)
> +			return ret;
> +
> +		pdev =3D dev_get_drvdata(&wdev->dev);
> +		ret =3D device_add_groups(&pdev->dev, wmax_alienfx_groups);
> +	}
> +
> +	return ret;
> +}
> +
> +static void wmax_wmi_remove(struct wmi_device *wdev)
> +{
> +	if (awcc)
> +		alienware_awcc_exit(wdev);
> +	else
> +		alienware_alienfx_exit(wdev);
> +}
> +
> +static struct wmi_device_id alienware_wmax_device_id_table[] =3D {
> +	{ WMAX_CONTROL_GUID, NULL },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
> +
> +static struct wmi_driver alienware_wmax_wmi_driver =3D {
> +	.driver =3D {
> +		.name =3D "alienware-wmi-wmax",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D alienware_wmax_device_id_table,
> +	.probe =3D wmax_wmi_probe,
> +	.remove =3D wmax_wmi_remove,
> +};
> +
> +int __init alienware_wmax_wmi_init(void)
> +{
> +	const struct dmi_system_id *id;
> +
> +	id =3D dmi_first_match(awcc_dmi_table);
> +	if (id)
> +		awcc =3D id->driver_data;
> +
> +	if (force_platform_profile)
> +		awcc =3D &x_series_features;
> +
> +	if (force_gmode)
> +		awcc =3D &g_series_features;
> +
> +	return wmi_driver_register(&alienware_wmax_wmi_driver);
> +}
> +
> +void __exit alienware_wmax_wmi_exit(void)
> +{
> +	wmi_driver_unregister(&alienware_wmax_wmi_driver);
> +}
