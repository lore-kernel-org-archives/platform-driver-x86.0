Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F7817A30A;
	Thu, 30 Apr 2026 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554706; cv=none; b=Unb3OpD6/xKPEV08NHTiEENgpyhoStHtwYDr4VZLBT/t24fY2cnrLex3b3odgm0Dflhxca4ZZfX52R0Xpol4+Ps0pSwbi5J4+71AtTNTgczT3VUMsGmdpwMfdzWTkukuxL2RV0A0oq3l93XX1b+tB/3V5DijW1funMkOLOBYnjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554706; c=relaxed/simple;
	bh=E+2wbeYSFOfSekhV1Ca77/cJElOC3kXMUcvsSRb7fQI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mpPr1ZHPQ7YxEAX6zv3/5VLw8FjNMhKQAlFA9cZUC7f0C/IAtn65cQdnaTvi64yavQpFt8XNQvCy7tzfWBaW/ylsFybvO0F/tcVwHN9AZAXyEFv4tXNSmm7iGmjiGlPWmRqsuHPeQsD0fOsrAI6XF9j/1cSadSIfh/V/L/ZGdYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiKXqgoo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiKXqgoo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777554705; x=1809090705;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=E+2wbeYSFOfSekhV1Ca77/cJElOC3kXMUcvsSRb7fQI=;
  b=DiKXqgooa7zICHwxYBtlw6LmbOtaoscg8TUxqdDXXDOLe/9zO3ro9374
   a/lf56M31XEXPcpU98sOrekyW+CiLmr/mEGhs0qpk93C8zdI6owekLkK9
   o1tprrvbgeZCG782tRAMqZeH297bDizbI0fGMEwOtYu7xRkKu1hjAih1P
   7fQDRD71Jpw5PLDoAY1U3IjtjFXf3zjFWAG+Be/Z4lFz1hZjtvrzSYOz4
   zyZgNeA95cGZdiMp6BLbPRM3ByD1UI/3hwsUA/31tadRAh3xbXHHqtYHc
   MS819k8VnpGunG/3zp3Ds65Q8z/lS/ip6Bee4bNfaEyfX50oiyoY85Hbc
   w==;
X-CSE-ConnectionGUID: 1mqidWY+QnyKPJAnWigWlw==
X-CSE-MsgGUID: 3CzSfF9xT/C82K4K9KIVFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78693001"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78693001"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:11:44 -0700
X-CSE-ConnectionGUID: ExqZnqIYQeWRsuVx6qPP3g==
X-CSE-MsgGUID: JkDxMtKSQqSydWWDj7JzfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="239583027"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:11:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 30 Apr 2026 16:11:38 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/7] platform/x86: uniwill-laptop: Rework FN lock/super
 key suspend handling
In-Reply-To: <20260417050912.5582-6-W_Armin@gmx.de>
Message-ID: <84c0343c-0d3b-5bb8-59d7-60fc4af5c0e4@linux.intel.com>
References: <20260417050912.5582-1-W_Armin@gmx.de> <20260417050912.5582-6-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1105413697-1777554698=:971"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1105413697-1777554698=:971
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 17 Apr 2026, Armin Wolf wrote:

> Currently the suspend handling for the FN lock and super key enable
> features saves the whole values of the affected registers instead of
> the individual feature state. This duplicates the register access
> logic from the associated sysfs attributes.
>=20
> Rework the suspend handling to reuse said register access logic and
> only store the individual feature state as a boolean value.
>=20
> Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 117 ++++++++++++--------
>  1 file changed, 73 insertions(+), 44 deletions(-)
>=20
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfo=
rm/x86/uniwill/uniwill-acpi.c
> index dac80c78ca0b..8c00d762ab08 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -341,8 +341,8 @@ struct uniwill_data {
>  =09struct acpi_battery_hook hook;
>  =09unsigned int last_charge_ctrl;
>  =09struct mutex battery_lock;=09/* Protects the list of currently regist=
ered batteries */
> -=09unsigned int last_status;
> -=09unsigned int last_switch_status;
> +=09bool last_fn_lock_state;
> +=09bool last_super_key_enable_state;
>  =09struct mutex super_key_lock;=09/* Protects the toggling of the super =
key lock state */
>  =09struct list_head batteries;
>  =09struct mutex led_lock;=09=09/* Protects writes to the lightbar regist=
ers */
> @@ -619,11 +619,22 @@ static const struct regmap_config uniwill_ec_config=
 =3D {
>  =09.use_single_write =3D true,
>  };
> =20
> +static int uniwill_write_fn_lock(struct uniwill_data *data, bool status)
> +{
> +=09unsigned int value;
> +
> +=09if (status)
> +=09=09value =3D FN_LOCK_STATUS;
> +=09else
> +=09=09value =3D 0;
> +
> +=09return regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STA=
TUS, value);
> +}
> +
>  static ssize_t fn_lock_store(struct device *dev, struct device_attribute=
 *attr, const char *buf,
>  =09=09=09     size_t count)
>  {
>  =09struct uniwill_data *data =3D dev_get_drvdata(dev);
> -=09unsigned int value;
>  =09bool enable;
>  =09int ret;
> =20
> @@ -631,21 +642,15 @@ static ssize_t fn_lock_store(struct device *dev, st=
ruct device_attribute *attr,
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> -=09if (enable)
> -=09=09value =3D FN_LOCK_STATUS;
> -=09else
> -=09=09value =3D 0;
> -
> -=09ret =3D regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_ST=
ATUS, value);
> +=09ret =3D uniwill_write_fn_lock(data, enable);
>  =09if (ret < 0)
>  =09=09return ret;
> =20
>  =09return count;
>  }
> =20
> -static ssize_t fn_lock_show(struct device *dev, struct device_attribute =
*attr, char *buf)
> +static int uniwill_read_fn_lock(struct uniwill_data *data, bool *status)
>  {
> -=09struct uniwill_data *data =3D dev_get_drvdata(dev);
>  =09unsigned int value;
>  =09int ret;
> =20
> @@ -653,23 +658,31 @@ static ssize_t fn_lock_show(struct device *dev, str=
uct device_attribute *attr, c
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> -=09return sysfs_emit(buf, "%d\n", !!(value & FN_LOCK_STATUS));
> -}
> +=09*status =3D !!(value & FN_LOCK_STATUS);
> =20
> -static DEVICE_ATTR_RW(fn_lock);
> +=09return 0;
> +}
> =20
> -static ssize_t super_key_enable_store(struct device *dev, struct device_=
attribute *attr,
> -=09=09=09=09      const char *buf, size_t count)
> +static ssize_t fn_lock_show(struct device *dev, struct device_attribute =
*attr, char *buf)
>  {
>  =09struct uniwill_data *data =3D dev_get_drvdata(dev);
> -=09unsigned int value;
> -=09bool enable;
> +=09bool status;
>  =09int ret;
> =20
> -=09ret =3D kstrtobool(buf, &enable);
> +=09ret =3D uniwill_read_fn_lock(data, &status);
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> +=09return sysfs_emit(buf, "%d\n", status);
> +}
> +
> +static DEVICE_ATTR_RW(fn_lock);
> +
> +static int uniwill_write_super_key_enable(struct uniwill_data *data, boo=
l status)
> +{
> +=09unsigned int value;
> +=09int ret;
> +
>  =09guard(mutex)(&data->super_key_lock);
> =20
>  =09ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> @@ -680,20 +693,33 @@ static ssize_t super_key_enable_store(struct device=
 *dev, struct device_attribut
>  =09 * We can only toggle the super key lock, so we return early if the s=
etting
>  =09 * is already in the correct state.
>  =09 */
> -=09if (enable =3D=3D !(value & SUPER_KEY_LOCK_STATUS))
> -=09=09return count;
> +=09if (status =3D=3D !(value & SUPER_KEY_LOCK_STATUS))
> +=09=09return 0;
> +
> +=09return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER=
_KEY_LOCK,
> +=09=09=09=09 TRIGGER_SUPER_KEY_LOCK);
> +}
> +
> +static ssize_t super_key_enable_store(struct device *dev, struct device_=
attribute *attr,
> +=09=09=09=09      const char *buf, size_t count)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09bool enable;
> +=09int ret;
> =20
> -=09ret =3D regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPE=
R_KEY_LOCK,
> -=09=09=09=09TRIGGER_SUPER_KEY_LOCK);
> +=09ret =3D kstrtobool(buf, &enable);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D uniwill_write_super_key_enable(data, enable);
>  =09if (ret < 0)
>  =09=09return ret;
> =20
>  =09return count;
>  }
> =20
> -static ssize_t super_key_enable_show(struct device *dev, struct device_a=
ttribute *attr, char *buf)
> +static int uniwill_read_super_key_enable(struct uniwill_data *data, bool=
 *status)
>  {
> -=09struct uniwill_data *data =3D dev_get_drvdata(dev);
>  =09unsigned int value;
>  =09int ret;
> =20
> @@ -701,7 +727,22 @@ static ssize_t super_key_enable_show(struct device *=
dev, struct device_attribute
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> -=09return sysfs_emit(buf, "%d\n", !(value & SUPER_KEY_LOCK_STATUS));
> +=09*status =3D !(value & SUPER_KEY_LOCK_STATUS);
> +
> +=09return 0;
> +}
> +
> +static ssize_t super_key_enable_show(struct device *dev, struct device_a=
ttribute *attr, char *buf)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> +=09bool status;
> +=09int ret;
> +
> +=09ret =3D uniwill_read_super_key_enable(data, &status);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%d\n", status);
>  }
> =20
>  static DEVICE_ATTR_RW(super_key_enable);
> @@ -1715,10 +1756,10 @@ static int uniwill_suspend_fn_lock(struct uniwill=
_data *data)
>  =09=09return 0;
> =20
>  =09/*
> -=09 * The EC_ADDR_BIOS_OEM is marked as volatile, so we have to restore =
it
> +=09 * EC_ADDR_BIOS_OEM is marked as volatile, so we have to restore it
>  =09 * ourselves.
>  =09 */
> -=09return regmap_read(data->regmap, EC_ADDR_BIOS_OEM, &data->last_status=
);
> +=09return uniwill_read_fn_lock(data, &data->last_fn_lock_state);
>  }
> =20
>  static int uniwill_suspend_super_key(struct uniwill_data *data)
> @@ -1727,10 +1768,10 @@ static int uniwill_suspend_super_key(struct uniwi=
ll_data *data)
>  =09=09return 0;
> =20
>  =09/*
> -=09 * The EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to res=
tore it
> +=09 * EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to restore=
 it
>  =09 * ourselves.
>  =09 */
> -=09return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_s=
witch_status);
> +=09return uniwill_read_super_key_enable(data, &data->last_super_key_enab=
le_state);
>  }
> =20
>  static int uniwill_suspend_battery(struct uniwill_data *data)
> @@ -1787,27 +1828,15 @@ static int uniwill_resume_fn_lock(struct uniwill_=
data *data)
>  =09if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
>  =09=09return 0;
> =20
> -=09return regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STA=
TUS,
> -=09=09=09=09  data->last_status);
> +=09return uniwill_write_fn_lock(data, data->last_fn_lock_state);
>  }
> =20
>  static int uniwill_resume_super_key(struct uniwill_data *data)
>  {
> -=09unsigned int value;
> -=09int ret;
> -
>  =09if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
>  =09=09return 0;
> =20
> -=09ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> -=09if (ret < 0)
> -=09=09return ret;
> -
> -=09if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) =3D=3D (value =
& SUPER_KEY_LOCK_STATUS))
> -=09=09return 0;
> -
> -=09return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER=
_KEY_LOCK,
> -=09=09=09=09 TRIGGER_SUPER_KEY_LOCK);
> +=09return uniwill_write_super_key_enable(data, data->last_super_key_enab=
le_state);
>  }
> =20
>  static int uniwill_resume_battery(struct uniwill_data *data)
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1105413697-1777554698=:971--
