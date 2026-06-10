Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FA63DCD85;
	Wed, 10 Jun 2026 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781094321; cv=none; b=EN4aPQ6N+NKa1kn5x0lhurWN6mD9MSpJU8wjo9X1JPVfwi7lk1GLPldrKKbKBTuxVrcXHntY8zAdVKcFEqCPZpgrdY6WfB7pfjKo5OOOfECklecmwukovvCKzXB00+uKGhbyB/nZooTU1hk6opxJ/BovjXZFxW0VRfuTFvShkoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781094321; c=relaxed/simple;
	bh=zOuO+58MSImvkUy1uDvTrIY6tNOn0bXs3rhBYdVvypE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=q/YrF/qPH0t6cFlVt98CMF0Xc9ODUCxFAQJIqypuJC4mwwYCBgSlxLTNJspy3fUyzRnAh+Krm/CV/+JJbcIROF3JLDB7NOTCbVabZwdneUc8z2feO/JSMcGHq05OQPDnC9p5m1lOrrA3volwfGBAkODU7CkLEzkSsQKU0nhu7ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g0vAKBYj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g0vAKBYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781094320; x=1812630320;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zOuO+58MSImvkUy1uDvTrIY6tNOn0bXs3rhBYdVvypE=;
  b=g0vAKBYjmEfR50W0uwke71z5ciVUP5nF3/aESGkR9tZJd8TYtzPoaYjg
   x5E2Q+UuJJIU1qHTMeJ/jpL7jWHLhtqLUWc6m8NQbsu/LcPjO9WcLxQc9
   tJoE4iEKYdTRSrMwe1Dj9jF2x68ZED12N4Pf5IsW1jxaFOqbKu0hrVi8R
   fIAnrJav/zdfGi2PP4y1Ep1BhbkXm+0r54nhpMIv7pokDxeIT1dnijdHl
   thEQHQCldCtyGIKpPk4oWjYyImvEd8G1F0IspBq/TMMcj+S76WLX/XX1D
   BtiC7ufJoihkYdl2rxPwHIm0WBe8bk+YOqUy5lopamg2CKuub6spnMiDl
   g==;
X-CSE-ConnectionGUID: 0UJTIbIjRiG+RnqBW+NCWg==
X-CSE-MsgGUID: q1B3z0IJRgCrr9j6Vux2mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="69425407"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="69425407"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 05:25:19 -0700
X-CSE-ConnectionGUID: 2ZAhPR73QrC7oDe+l74JFA==
X-CSE-MsgGUID: 7ob79xzGQQOn0XQg9a7Ewg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="241737664"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 05:25:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 15:25:12 +0300 (EEST)
To: =?ISO-8859-2?Q?Dariusz_Figza=B3?= <dariuszfigzal@gmail.com>
cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com, 
    luke@ljones.dev, denis.benato@linux.dev, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: add keystone dongle support
In-Reply-To: <20260528185752.81563-1-dariuszfigzal@gmail.com>
Message-ID: <df1a778f-5b43-9ec7-2c38-99b44d7eab61@linux.intel.com>
References: <20260528185752.81563-1-dariuszfigzal@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-768591789-1781094312=:1359"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-768591789-1781094312=:1359
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 28 May 2026, Dariusz Figza=C5=82 wrote:

> The ASUS Keystone is a physical NFC-like dongle that slots into supported
> ASUS laptops. The EC fires WMI notify code 0xB4 on insert/remove events.
>=20
> Expose the current insert state via a sysfs attribute by querying WMI
> device ID 0x00120091 (DSTS). This devid does not follow the standard DSTS
> convention: PRESENCE_BIT (0x00010000) encodes the insert state rather tha=
n
> feature presence, and STATUS_BIT is never set. Presence of a keystone slo=
t
> is detected by a successful DSTS call.
>=20
> Signed-off-by: Dariusz Figza=C5=82 <dariuszfigzal@gmail.com>
> ---
>=20
> Changes in v2:
> - Use .is_visible and platform_attributes[] instead of
>   device_create_file/device_remove_file (Ilpo J=C3=A4rvinen)
>=20
>  drivers/platform/x86/asus-wmi.c            | 65 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  7 +++

Please document the interface in
Documentation/ABI/testing/sysfs-platform-asus-wmi

--
 i.

>  2 files changed, 72 insertions(+)
>=20
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index 80144c412b90..3c9ef826551d 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -70,6 +70,7 @@ module_param(fnlock_default, bool, 0444);
>  #define NOTIFY_KBD_TTP=09=09=090xae
>  #define NOTIFY_LID_FLIP=09=09=090xfa
>  #define NOTIFY_LID_FLIP_ROG=09=090xbd
> +#define NOTIFY_KEYSTONE=09=09=090xb4
> =20
>  #define ASUS_WMI_FNLOCK_BIOS_DISABLED=09BIT(0)
> =20
> @@ -279,6 +280,8 @@ struct asus_wmi {
>  =09u32 tablet_switch_dev_id;
>  =09bool tablet_switch_inverted;
> =20
> +=09bool keystone_available;
> +
>  =09enum fan_type fan_type;
>  =09enum fan_type gpu_fan_type;
>  =09enum fan_type mid_fan_type;
> @@ -646,6 +649,55 @@ static bool asus_wmi_dev_is_present(struct asus_wmi =
*asus, u32 dev_id)
>  =09return status =3D=3D 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
>  }
> =20
> +/* Keystone ************************************************************=
*******/
> +
> +static int keystone_check_present(struct asus_wmi *asus)
> +{
> +=09u32 retval;
> +=09int err;
> +
> +=09asus->keystone_available =3D false;
> +
> +=09/*
> +=09 * Use a raw devstate call rather than asus_wmi_dev_is_present().
> +=09 * For this devid, PRESENCE_BIT encodes current insert state, not
> +=09 * feature presence, so asus_wmi_dev_is_present() would return false
> +=09 * whenever the dongle is absent at boot, even on machines that have
> +=09 * a keystone slot.
> +=09 * -ENODEV means the firmware doesn't know this devid at all.
> +=09 * retval is not examined here, only the return code matters.
> +=09 */
> +=09err =3D asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_KEYSTONE, &retval)=
;
> +=09if (err =3D=3D -ENODEV)
> +=09=09return 0;
> +=09if (err)
> +=09=09return err;
> +
> +=09asus->keystone_available =3D true;
> +=09return 0;
> +}
> +
> +static ssize_t keystone_show(struct device *dev,
> +=09=09=09     struct device_attribute *attr, char *buf)
> +{
> +=09struct asus_wmi *asus =3D dev_get_drvdata(dev);
> +=09u32 retval;
> +=09int err;
> +
> +=09err =3D asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_KEYSTONE, &retval)=
;
> +=09if (err)
> +=09=09return err;
> +
> +=09return sysfs_emit(buf, "%d\n", !!(retval & ASUS_WMI_DSTS_PRESENCE_BIT=
));
> +}
> +
> +static DEVICE_ATTR_RO(keystone);
> +
> +static void asus_wmi_keystone_notify(struct asus_wmi *asus)
> +{
> +=09sysfs_notify(&asus->platform_device->dev.kobj, NULL, "keystone");
> +}
> +
>  /* Input ***************************************************************=
*******/
>  static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool value)
>  {
> @@ -4575,6 +4627,12 @@ static void asus_wmi_handle_event_code(int code, s=
truct asus_wmi *asus)
>  =09=09return;
>  =09}
> =20
> +=09if (code =3D=3D NOTIFY_KEYSTONE) {
> +=09=09if (asus->keystone_available)
> +=09=09=09asus_wmi_keystone_notify(asus);
> +=09=09return;
> +=09}
> +
>  =09if (code =3D=3D NOTIFY_KBD_FBM || code =3D=3D NOTIFY_KBD_TTP) {
>  =09=09if (asus->fan_boost_mode_available)
>  =09=09=09fan_boost_mode_switch_next(asus);
> @@ -4698,6 +4756,7 @@ static struct attribute *platform_attributes[] =3D =
{
>  =09&dev_attr_lid_resume.attr,
>  =09&dev_attr_als_enable.attr,
>  =09&dev_attr_fan_boost_mode.attr,
> +=09&dev_attr_keystone.attr,
>  #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  =09=09&dev_attr_charge_mode.attr,
>  =09=09&dev_attr_egpu_enable.attr,
> @@ -4741,6 +4800,8 @@ static umode_t asus_sysfs_is_visible(struct kobject=
 *kobj,
>  =09=09devid =3D ASUS_WMI_DEVID_ALS_ENABLE;
>  =09else if (attr =3D=3D &dev_attr_fan_boost_mode.attr)
>  =09=09ok =3D asus->fan_boost_mode_available;
> +=09else if (attr =3D=3D &dev_attr_keystone.attr)
> +=09=09ok =3D asus->keystone_available;
> =20
>  #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  =09if (attr =3D=3D &dev_attr_charge_mode.attr)
> @@ -5081,6 +5142,10 @@ static int asus_wmi_add(struct platform_device *pd=
ev)
>  =09if (err)
>  =09=09goto fail_platform_profile_setup;
> =20
> +=09err =3D keystone_check_present(asus);
> +=09if (err)
> +=09=09dev_warn(&pdev->dev, "Failed to check Keystone presence: %d\n", er=
r);
> +
>  =09err =3D asus_wmi_sysfs_init(asus->platform_device);
>  =09if (err)
>  =09=09goto fail_sysfs;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/p=
latform_data/x86/asus-wmi.h
> index 554f41b827e1..c29962d5baac 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -147,6 +147,13 @@
>  #define ASUS_WMI_DEVID_GPU_MUX=09=090x00090016
>  #define ASUS_WMI_DEVID_GPU_MUX_VIVO=090x00090026
> =20
> +/* Keystone dongle insert/remove state.
> + * PRESENCE_BIT (0x00010000) encodes insert state:
> + * 0x00010000 =3D inserted, 0x00000000 =3D absent. STATUS_BIT is never s=
et.
> + * 0xFFFFFFFE means no keystone slot on this machine.
> + */
> +#define ASUS_WMI_DEVID_KEYSTONE=09=090x00120091
> +
>  /* TUF laptop RGB modes/colours */
>  #define ASUS_WMI_DEVID_TUF_RGB_MODE=090x00100056
>  #define ASUS_WMI_DEVID_TUF_RGB_MODE2=090x0010005A
>=20
--8323328-768591789-1781094312=:1359--
