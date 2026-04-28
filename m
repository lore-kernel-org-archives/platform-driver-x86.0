Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A1B342539;
	Tue, 28 Apr 2026 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777364549; cv=none; b=Y3lrbEeRoQeJgYIojLKyrusN4QXxwZhSb9NquCSflHFLbIYoFnmob09LHGEDuCprPez3aT4GlnqEnAKM7SSSs9SknZL4Q/zeNqBTKKjpcsoNWrTibtSgCsc+52Q8kGiwhMKyMjjMHfGEI7DlsODtX5Nj9giIwDojmdD3/j4lVgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777364549; c=relaxed/simple;
	bh=9GTaruPeA32EVnCpkJpgwoDtv2OOoqn2Wn/4mnTqeKY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iEGi/oZr4qnQB4dxmOAILcnJYU7TQ/2XvOeCAgrQFbFS+1EhNYUo2u8vh7b3GbLVYM92bVs9VVjxSjZIh00+u+GSyZneo6zr3fkzNQxRBdboWVl+L8Sn1pI74z5RldWYMt/KfFdH4tX1If2/oz00ChrNuJoUBL/7xkvrTFTe9Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h12Jt7k+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h12Jt7k+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777364548; x=1808900548;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=9GTaruPeA32EVnCpkJpgwoDtv2OOoqn2Wn/4mnTqeKY=;
  b=h12Jt7k+Dlu3qadnKigbF9k0O7CKN9bYjvl5DWSPWC7m9rgld7rx518g
   KcvwB+Gltl056Z4McDUZe78wD17wlUmj8v8JPcu589K6cn9h/JfvoyR5I
   x60uF1PV7bIEUVCb+oKmicep9hID+R7RvtBxTwwQAi9kqe/df7uEFlpK5
   xXlrvFK/JH679zA/21/sTO/3pOT631AvdY+lMQMA1Qrj7CjN5RQkND2ja
   disKUh12psTrhBXYXwk17MMPDXiuVInANr6f2lqmSYA/QFhlY214qpeqo
   AkfKkVIW4PxdVZ5/npX5isEAwLS4CzjRzwc9qWwIZBzHCA1NRTMHbuT8Z
   g==;
X-CSE-ConnectionGUID: FfZ668ceQYW+2r4sk2tlSQ==
X-CSE-MsgGUID: zJi5jGS2SVq/OWStDO6FHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78144805"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="78144805"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:22:27 -0700
X-CSE-ConnectionGUID: LzK5+LUdQyGBuonFe3B1Xw==
X-CSE-MsgGUID: YPt4etELQjWGMLyvHWnlyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="231243574"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:22:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 28 Apr 2026 11:22:20 +0300 (EEST)
To: =?ISO-8859-15?Q?Jos=E9_Guilherme_de_Castro_Rodrigues?= <jose.guilherme.cr.bh@gmail.com>
cc: Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: fix camera key led on Zenbook
 S14
In-Reply-To: <adg6GzkykThAB_4u@djouze-zen>
Message-ID: <ce2a2f37-ad8a-647c-0db8-83f6efd99f12@linux.intel.com>
References: <adg6GzkykThAB_4u@djouze-zen>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1447735719-1777364101=:1128"
Content-ID: <948669a1-3eed-972e-c636-40217fe781ee@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1447735719-1777364101=:1128
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <1cf1f452-1d2f-4138-451c-2285264472ba@linux.intel.com>

On Thu, 9 Apr 2026, Jos=E9 Guilherme de Castro Rodrigues wrote:

> Fix key led not turning on/off when the camera key is pressed. The
> asus_wmi_dev_is_present(ASUS_WMI_DEVID_CAMERA_LED) check fails on
> Zenbook S14, and no sysfs attribute for the camera key led is
> created.
>
> The check succeeds for ASUS_WMI_DEVID_CAMERA_LED_NEG, though,
> and when it is read, the led state is synchronized. By doing a read after
> every key press, the led is guaranteed to stay in sync with the actual
> camera state.
>=20
> This change is not visible to userspace, as no sysfs attribute for
> ASUS_WMI_DEVID_CAMERA_LED_NEG exists.

While I believe you are "correct" that userspace won't see a thing, is=20
this really correct way to implement support for this device?

I mean the camera led init in asus_wmi_led_init() is gated by=20
asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED) but should that=20
be gated by either CAMERA_LED or CAMERA_LED_NEG and the related code in=20
*_camera_led_*() that now only uses ASUS_WMI_DEVID_CAMERA_LED=20
should use which ever of them is available?

> Tested on an ASUS Zenbook S14 with BIOS version UX5406SA.309.
>=20
> Signed-off-by: Jos=E9 Guilherme de Castro Rodrigues <jose.guilherme.cr.bh=
@gmail.com>
> ---
> Changes in v2:
>  - Do not return after triggering the update.
>  - Use tabs for indentation on new defines.
> ---
>  drivers/platform/x86/asus-wmi.c            | 19 +++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  2 +-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index 80144c412b90..32d0d4ce60ff 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -70,6 +70,8 @@ module_param(fnlock_default, bool, 0444);
>  #define NOTIFY_KBD_TTP=09=09=090xae
>  #define NOTIFY_LID_FLIP=09=09=090xfa
>  #define NOTIFY_LID_FLIP_ROG=09=090xbd
> +#define NOTIFY_CAMERA_TOGGLE_1=09=090x82
> +#define NOTIFY_CAMERA_TOGGLE_2=09=090x85
> =20
>  #define ASUS_WMI_FNLOCK_BIOS_DISABLED=09BIT(0)
> =20
> @@ -307,6 +309,7 @@ struct asus_wmi {
>  =09u32 kbd_rgb_dev;
>  =09bool kbd_rgb_state_available;
>  =09bool oobe_state_available;
> +=09bool camera_neg_led_available;
> =20
>  =09u8 throttle_thermal_policy_mode;
>  =09u32 throttle_thermal_policy_dev;
> @@ -1982,6 +1985,18 @@ static int micmute_led_set(struct led_classdev *le=
d_cdev,
>  =09return err < 0 ? err : 0;
>  }
> =20
> +static bool is_camera_toggle(int code)
> +{
> +=09return code =3D=3D NOTIFY_CAMERA_TOGGLE_1 || code =3D=3D NOTIFY_CAMER=
A_TOGGLE_2;
> +}
> +
> +static void camera_neg_led_trigger_update(struct asus_wmi *asus)
> +{
> +=09u32 result;
> +
> +=09asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG, &result);
> +}
> +
>  static enum led_brightness camera_led_get(struct led_classdev *led_cdev)
>  {
>  =09struct asus_wmi *asus;
> @@ -4587,6 +4602,9 @@ static void asus_wmi_handle_event_code(int code, st=
ruct asus_wmi *asus)
>  =09if (is_display_toggle(code) && asus->driver->quirks->no_display_toggl=
e)
>  =09=09return;
> =20
> +=09if (is_camera_toggle(code) && asus->camera_neg_led_available)
> +=09=09camera_neg_led_trigger_update(asus);
> +
>  =09if (!sparse_keymap_report_event(asus->inputdev, code,
>  =09=09=09=09=09key_value, autorelease))
>  =09=09pr_info("Unknown key code 0x%x\n", code);
> @@ -5062,6 +5080,7 @@ static int asus_wmi_add(struct platform_device *pde=
v)
>  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> =20
>  =09asus->oobe_state_available =3D asus_wmi_dev_is_present(asus, ASUS_WMI=
_DEVID_OOBE);
> +=09asus->camera_neg_led_available =3D asus_wmi_dev_is_present(asus, ASUS=
_WMI_DEVID_CAMERA_LED_NEG);
> =20
>  =09if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POL=
ICY))
>  =09=09asus->throttle_thermal_policy_dev =3D ASUS_WMI_DEVID_THROTTLE_THER=
MAL_POLICY;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/p=
latform_data/x86/asus-wmi.h
> index 554f41b827e1..1a9349da6069 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -56,7 +56,7 @@
>  #define ASUS_WMI_DEVID_MICMUTE_LED=09=090x00040017
> =20
>  /* Disable Camera LED */
> -#define ASUS_WMI_DEVID_CAMERA_LED_NEG=090x00060078 /* 0 =3D on (unused) =
*/
> +#define ASUS_WMI_DEVID_CAMERA_LED_NEG=090x00060078 /* 0 =3D on */
>  #define ASUS_WMI_DEVID_CAMERA_LED=090x00060079 /* 1 =3D on */
> =20
>  /* Backlight and Brightness */
>=20

--=20
 i.
--8323328-1447735719-1777364101=:1128--
