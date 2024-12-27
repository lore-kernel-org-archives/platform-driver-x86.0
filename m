Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0041C28E;
	Fri, 27 Dec 2024 04:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272279; cv=none; b=LLMkD6yC4x3QI82Nxq8ttYMikOC+nbc8WtJoGaSwN0UQQvof4lQ7BuDY+ayWGPx9VQGG7zuB3iQIeBvlkW772rvRyUa6i4a32C88VnCDw3tGj3vQz01QBF/m2api+Dun0SkaNNcJMWgSlXcha9NT1jWuDHzXrEpkhc/iSHK9AXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272279; c=relaxed/simple;
	bh=nwdgBPqNPUXoimIibRYDti1pPH8186c+EWIZAdMTP/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hOCJH3is0ov8K4Es65JSAnhTvmJKvf43pbQ/zOnUyp5yfVbPJ4WPKZ+g3HJJ/AcdqUbwfaSgg6kyRvX3MR7+1dm5ZuuMKOeqsNYILJFh1s54dFMSRloBnpNiurR5jOhBUbs7BhunVZRDyksNruLhGuCQyxWOctf0+tjtEuf8Hmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cdyG0B6q; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cdyG0B6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735272261; x=1735877061; i=w_armin@gmx.de;
	bh=AykTVMWPjZdyDyHAUBNb5cHHjZBAHUG5mdWVKuT41CA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cdyG0B6q0Ur2lPwMZkXY7+G1o9VahxtkmnDFTAWf9MRroBqxtk3C2JcfagXRtcMQ
	 Yc2lnpH/naiAo63jK3RD6pw3csCHS1BDd8TNK5OYB076UmGYC4a2vkPb8smlsaZwy
	 4BZdEfudXEi68uQi8O25okyQA+MOcfBViuAp+KZzAsfn4wfF/abMMGKIv+KuSDf6l
	 y3zn1WCTuHFdErMIFRpj/TUI5e3lzgZyPAgmBD6xPrGHi60eg5atDDKzqIYOUXy6B
	 ze440S/skbQ/WeEKOA0k7DkGVv344HFiYyU3VofaSxQyuamsU/NAfq3iagLkh6nX3
	 YQwJi6frYN0vYreTxQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXQF-1t86zL3sdL-00IGl0; Fri, 27
 Dec 2024 05:04:21 +0100
Message-ID: <93335a62-eb26-4d93-aaeb-ca24479a6a4a@gmx.de>
Date: Fri, 27 Dec 2024 05:04:19 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/20] platform-x86: Split the alienware-wmi driver
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-18-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-18-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ukVoK+mbptYLeU58gtfEcUw20D6uGkblfSO1d2VpasIbw1Bd5Xz
 I8IyEjhQb60okvlqi6y31M5M3sFGnF5BWP1SrTnGSyJ6O+QgJoNt6h6l4IO/3372uz6Pnua
 rrDJTl9gWLyC+eQKugd8OI27B7Nenbt5NG8wASQeizp/gIoCUXjiVLL9FtpLqfxGt/1bY+q
 +SinwQq9z++GJbSLjCVKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/lEM6JTI29o=;ILCYsjBFroyPHGsjTrRE7qIDgxe
 RfQEo+o2vpZh0FDi+xhYuoWOwDTLtrQLZ4r8fg3BJ0YNySOInQS8Tz0uBuGTrdBmLxMyfr1Ar
 0MrGedcdatUgs4nO1cWIpL0tl/9542+FHNv+T/HZJmy7h+wkCliZ5opiC2d4HqW5M/z9Ve9c2
 FdNa32PgvgmP37P6ib7dNSGdrGojwv4cS/qIpxReLA+RYxekabdXE/IRLUhSuTgbmUkWUYtf1
 /wnN3N3YCPCevEm8/cIFFzHkxtBPYSo31u43VJ69JI7j9AXE5tALVOD8Lg1e1ywDs6+oGqyGh
 9eGeVZlghsrxRykEjSppvRfSafXnbjacoCiPO/yOwBLY5wPhC/tpGbso28eMWAoiFStWuN7L1
 ize95b8+iYqdFSZC4Fz5FqtS3MY/ir54l+y5s/Zon3R0q1DrL+G1ArtVMLtnvTa4dLVdw0iEm
 mWN/5kMiN0fYPyIOU4Y5UmmdCmPVO/E/3C45+Zrl4O+yjMOVfMuxFwr3Kl8TN7tiv6TpeTOQO
 5j7e8KeH8G7ts370uXBr+ILDXrE5YWRpgcGe+fuH1w+ak8UDsPVZXu8nv7F+Bek6Kl/pWf5/V
 Zs053LI1sneEUB0Jsh7ACs0xcxrKwvu8p1Is91pypzrwyYALQ+l28uSoxVeDvRNWasArOYiQB
 rch68fn834zKhNy5hCzCFzsNoer61iSmQkNxtpj7LYuWeAsAEq/OrM4rYpG6iCnFJxthmzgtH
 2K1EddgGtO3MB2Osgd/GhI2o6udF60ASIya3Q0ynwm5QKOKpAtlambp+Yz/oDTNdrZc+wJjQr
 l78X0no7ciIQ4dDqsa0MyjvWIPu26Q0XYrw1i8N/Ggt/qpDL5mPEruVLAC9wti3UbfflFr7vM
 v8rWrlYArQdp0gQ8jgVZZ2Z4Jv0VfW5coiCZQk7uEb3VQrJ97K1Ywv85gNRForIwkkWUUuIBk
 9XeJNwAALIeYSZKt1iXsBCQxz2hzAcdD82m392+Xrp5xn0zV0TDTupXDlnSkgRCepO6bEYi7l
 WNm5obSU5wUUadFoin56ZB3pFIZqtzxTPjRkCBj7UGjJigpQfSq/smYi1R2Tq1LO4Wcn10/D/
 Axh+CLVNrOo81VPQnkptjRMHpRrGVa

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Split alienware-wmi WMI drivers into different files. This is done
> seamlessly by copying and pasting.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/Makefile            |   2 +
>   .../platform/x86/dell/alienware-wmi-base.c    | 596 ------------------
>   .../platform/x86/dell/alienware-wmi-legacy.c  |  89 +++
>   .../platform/x86/dell/alienware-wmi-wmax.c    | 526 ++++++++++++++++
>   4 files changed, 617 insertions(+), 596 deletions(-)
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
> index e8d470bbb608..450ba0a48004 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-base.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
> @@ -8,80 +8,21 @@
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
>   struct quirk_entry {
>   	u8 num_zones;
>   	u8 hdmi_mux;
> @@ -213,120 +154,10 @@ static const struct dmi_system_id alienware_quirk=
s[] __initconst =3D {
>   	{}
>   };
>
> -struct awcc_features {
> -	bool gmode;
> -};
> -
> -static struct awcc_features g_series_features =3D {
> -	.gmode =3D true,
> -};
> -
> -static struct awcc_features x_series_features =3D {
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
> -struct awcc_features *awcc;
> -
>   struct wmax_basic_args {
>   	u8 arg;
>   };
>
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
>   static u8 interface;
>
>   acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_=
id,
> @@ -775,250 +606,6 @@ static const struct attribute_group deepsleep_attr=
ibute_group =3D {
>   	.attrs =3D deepsleep_attrs,
>   };
>
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
> -	acpi_status status;
> -
> -	status =3D alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION=
,
> -				       &in_args, sizeof(in_args), out_data);
> -
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
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
> -	acpi_status status;
> -	u32 out_data;
> -
> -	status =3D alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
> -				       &in_args, sizeof(in_args), &out_data);
> -
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
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
> -	acpi_status status;
> -
> -	status =3D alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
> -				       &in_args, sizeof(in_args), out_data);
> -
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
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
> -	struct awcc_priv *priv;
> -	u32 out_data;
> -	int ret;
> -
> -	priv =3D container_of(pprof, struct awcc_priv, pp_handler);
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
> -	struct awcc_priv *priv;
> -
> -	priv =3D container_of(pprof, struct awcc_priv, pp_handler);
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
> -	enum platform_profile_option profile;
> -	enum wmax_thermal_mode mode;
> -	struct awcc_priv *priv;
> -	u8 sys_desc[4];
> -	u32 first_mode;
> -	u32 out_data;
> -	int ret;
> -
> -	priv =3D dev_get_drvdata(&wdev->dev);
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
> -	int ret;
> -
> -	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> -
> -	dev_set_drvdata(&wdev->dev, priv);
> -
> -	priv->wdev =3D wdev;
> -
> -	ret =3D create_thermal_profile(wdev);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> -}
> -
> -static void alienware_awcc_exit(struct wmi_device *wdev)
> -{
> -	struct awcc_priv *priv;
> -
> -	priv =3D dev_get_drvdata(&wdev->dev);
> -
> -	platform_profile_remove(&priv->pp_handler);
> -}
> -
>   /*
>    * Platform Driver
>    */
> @@ -1097,189 +684,6 @@ void alienware_alienfx_exit(struct wmi_device *wd=
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
> -	struct legacy_led_args legacy_args;
> -	struct acpi_buffer input;
> -	acpi_status status;
> -
> -	legacy_args.colors =3D priv->colors[location];
> -	legacy_args.brightness =3D priv->global_brightness;
> -	legacy_args.state =3D priv->lighting_control_state;
> -
> -	input.length =3D sizeof(legacy_args);
> -	input.pointer =3D &legacy_args;
> -
> -	if (legacy_args.state =3D=3D LEGACY_RUNNING)
> -		status =3D alienware_wmi_command(wdev, location + 1, &legacy_args,
> -					       sizeof(legacy_args), NULL);
> -	else
> -		status =3D wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
> -					     location + 1, &input, NULL);
> -
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> -
> -	return 0;
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
> -	acpi_status status;
> -
> -	status =3D alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL,
> -				       &in_args, sizeof(in_args), NULL);
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> -
> -	return 0;
> -}
> -
> -static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
> -				      struct wmi_device *wdev, u8 brightness)
> -{
> -	struct wmax_brightness_args in_args =3D {
> -		.led_mask =3D 0xFF,
> -		.percentage =3D brightness,
> -	};
> -	acpi_status status;
> -
> -	status =3D alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_arg=
s,
> -				       sizeof(in_args), NULL);
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> -
> -	return 0;
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
> -	int ret =3D 0;
> -
> -	if (awcc)
> -		ret =3D alienware_awcc_setup(wdev);
> -	else
> -		ret =3D alienware_alienfx_setup(&pdata);
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
> index 000000000000..38dd2a602f34
> --- /dev/null
> +++ b/drivers/platform/x86/dell/alienware-wmi-legacy.c
> @@ -0,0 +1,89 @@
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
> +/*
> + * Legacy WMI driver
> + */
> +static int legacy_wmi_update_led(struct alienfx_priv *priv,
> +				 struct wmi_device *wdev, u8 location)
> +{
> +	struct legacy_led_args legacy_args;
> +	struct acpi_buffer input;
> +	acpi_status status;
> +
> +	legacy_args.colors =3D priv->colors[location];
> +	legacy_args.brightness =3D priv->global_brightness;
> +	legacy_args.state =3D priv->lighting_control_state;
> +
> +	input.length =3D sizeof(legacy_args);
> +	input.pointer =3D &legacy_args;
> +
> +	if (legacy_args.state =3D=3D LEGACY_RUNNING)
> +		status =3D alienware_wmi_command(wdev, location + 1, &legacy_args,
> +					       sizeof(legacy_args), NULL);
> +	else
> +		status =3D wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
> +					     location + 1, &input, NULL);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
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
> index 000000000000..75b9a1f029b2
> --- /dev/null
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -0,0 +1,526 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Alienware WMAX WMI device driver
> + *
> + * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
> + */
> +
> +#include <linux/dmi.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/moduleparam.h>
> +#include <linux/platform_profile.h>
> +#include <linux/wmi.h>
> +#include "alienware-wmi.h"
> +
> +#define WMAX_THERMAL_TABLE_MASK		GENMASK(7, 4)
> +#define WMAX_THERMAL_MODE_MASK		GENMASK(3, 0)
> +#define WMAX_SENSOR_ID_MASK		BIT(8)
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
> +struct awcc_features {
> +	bool gmode;
> +};
> +
> +static struct awcc_features g_series_features =3D {
> +	.gmode =3D true,
> +};
> +
> +static struct awcc_features x_series_features =3D {
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
> +struct awcc_features *awcc;
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
> +	acpi_status status;
> +
> +	status =3D alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION=
,
> +				       &in_args, sizeof(in_args), out_data);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
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
> +	acpi_status status;
> +	u32 out_data;
> +
> +	status =3D alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
> +				       &in_args, sizeof(in_args), &out_data);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
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
> +	acpi_status status;
> +
> +	status =3D alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
> +				       &in_args, sizeof(in_args), out_data);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
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
> +	struct awcc_priv *priv;
> +	u32 out_data;
> +	int ret;
> +
> +	priv =3D container_of(pprof, struct awcc_priv, pp_handler);
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
> +	struct awcc_priv *priv;
> +
> +	priv =3D container_of(pprof, struct awcc_priv, pp_handler);
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
> +	enum platform_profile_option profile;
> +	enum wmax_thermal_mode mode;
> +	struct awcc_priv *priv;
> +	u8 sys_desc[4];
> +	u32 first_mode;
> +	u32 out_data;
> +	int ret;
> +
> +	priv =3D dev_get_drvdata(&wdev->dev);
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
> +
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
> +	acpi_status status;
> +
> +	status =3D alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL,
> +				       &in_args, sizeof(in_args), NULL);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
> +				      struct wmi_device *wdev, u8 brightness)
> +{
> +	struct wmax_brightness_args in_args =3D {
> +		.led_mask =3D 0xFF,
> +		.percentage =3D brightness,
> +	};
> +	acpi_status status;
> +
> +	status =3D alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_arg=
s,
> +				       sizeof(in_args), NULL);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
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
> +	int ret =3D 0;
> +
> +	if (awcc)
> +		ret =3D alienware_awcc_setup(wdev);
> +	else
> +		ret =3D alienware_alienfx_setup(&pdata);
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
