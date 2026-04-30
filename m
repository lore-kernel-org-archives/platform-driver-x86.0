Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713B8413225;
	Thu, 30 Apr 2026 13:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554835; cv=none; b=CaSkN7QNbggO2jtzTlklg9JGCxuHr0zZvH3W3thebzaYg8iYqNzxx5rbG5qbRXHc/VW8ElJnCAQnC+nQBpSvsv8Ix6I3YfZiqNKyYZF6YOvJwBxdVmU5/wn3NqTWs6q69sFKuQai6g0Rbbhg+X+PrYd3OEyxGm1CGdRiphOGm1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554835; c=relaxed/simple;
	bh=QACaw0T7nwUTwNugPFA66ahGtQwSk9MNxJvoQLCRqFQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qzTcPHkCthbKd9iOrrx8hVecCu60B4p6zTWDnlo6SNuIySwOlz7CoAnQW/EUCzjpLyGl4XgzNMfwsLtIv1lRNNyJIH5akfZ1tWdjfbQdqDozrEx1L8t0TxOHMfw6M3quHJtMPJjwzauw+nMqIB59NBRGJkVPbY60DUp6E3fkD+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtmYQr0k; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtmYQr0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777554832; x=1809090832;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QACaw0T7nwUTwNugPFA66ahGtQwSk9MNxJvoQLCRqFQ=;
  b=NtmYQr0kQadgxKhtJZ6F+mcpc7MGUghPoXGtqTxHx5l2AeHw+wgfOhq8
   deoDfvo0Sls9Gh2XfIzs8Xm+aAW0k+5Z3+M9j3MCobFTgrSXDXUlOlfza
   RGj1eeZxKSB19wlFIrXRiOaELW0lX7AfbS09sX0gLSrtZP+pmOEG40IhF
   4/9NO85TXhb+04mmx0wkTzX8Y+U5ZzAkoOPYzc7y/AYRSzo49GkmQokQN
   kBbF4dhdw6HHiFitj4lgl1X8d3jDJw10ZN7QPuXRhqxNUj/DIopLLHUt2
   DMIJU+gwq0Cg/l8HT5cduU+ZknlClcveDsBVOUAEkA9Nlh7XOtB8eJD2E
   g==;
X-CSE-ConnectionGUID: qzh6Lcu7SwyBfB8JiaQQlw==
X-CSE-MsgGUID: /pefIJfKT9e+xuHuYL+reQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89596919"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="89596919"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:13:51 -0700
X-CSE-ConnectionGUID: W5P8smh1RGG6aWIUZ5eGJw==
X-CSE-MsgGUID: V+/6DOePTQK59j4fe//Jjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="258158958"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:13:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 30 Apr 2026 16:13:44 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/7] platform/x86: uniwill-laptop: Mark EC_ADDR_OEM_4
 as volatile
In-Reply-To: <20260417050912.5582-7-W_Armin@gmx.de>
Message-ID: <aff220ab-3c15-6b20-322b-6263e1be5c64@linux.intel.com>
References: <20260417050912.5582-1-W_Armin@gmx.de> <20260417050912.5582-7-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1769630749-1777554824=:971"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1769630749-1777554824=:971
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 17 Apr 2026, Armin Wolf wrote:

> It turned out that EC_ADDR_OEM_4 also contains bits with a volatile
> nature. Mark the whole register as volatile to prepare for the usage
> of said bits. This also means that we now have to save/restore the
> touchpad toggle state ourself.
>=20
> Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 70 ++++++++++++++++++---
>  1 file changed, 60 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfo=
rm/x86/uniwill/uniwill-acpi.c
> index 8c00d762ab08..d4abcaf87e39 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -343,6 +343,7 @@ struct uniwill_data {
>  =09struct mutex battery_lock;=09/* Protects the list of currently regist=
ered batteries */
>  =09bool last_fn_lock_state;
>  =09bool last_super_key_enable_state;
> +=09bool last_touchpad_toggle_enable_state;
>  =09struct mutex super_key_lock;=09/* Protects the toggling of the super =
key lock state */
>  =09struct list_head batteries;
>  =09struct mutex led_lock;=09=09/* Protects writes to the lightbar regist=
ers */
> @@ -598,6 +599,7 @@ static bool uniwill_volatile_reg(struct device *dev, =
unsigned int reg)
>  =09case EC_ADDR_PWM_2:
>  =09case EC_ADDR_TRIGGER:
>  =09case EC_ADDR_SWITCH_STATUS:
> +=09case EC_ADDR_OEM_4:
>  =09case EC_ADDR_CHARGE_CTRL:
>  =09case EC_ADDR_USB_C_POWER_PRIORITY:
>  =09=09return true;
> @@ -747,11 +749,22 @@ static ssize_t super_key_enable_show(struct device =
*dev, struct device_attribute
> =20
>  static DEVICE_ATTR_RW(super_key_enable);
> =20
> +static int uniwill_write_touchpad_toggle_enable(struct uniwill_data *dat=
a, bool status)
> +{
> +=09unsigned int value;
> +
> +=09if (status)
> +=09=09value =3D 0;
> +=09else
> +=09=09value =3D TOUCHPAD_TOGGLE_OFF;
> +
> +=09return regmap_update_bits(data->regmap, EC_ADDR_OEM_4, TOUCHPAD_TOGGL=
E_OFF, value);
> +}
> +
>  static ssize_t touchpad_toggle_enable_store(struct device *dev, struct d=
evice_attribute *attr,
>  =09=09=09=09=09    const char *buf, size_t count)
>  {
>  =09struct uniwill_data *data =3D dev_get_drvdata(dev);
> -=09unsigned int value;
>  =09bool enable;
>  =09int ret;
> =20
> @@ -759,30 +772,39 @@ static ssize_t touchpad_toggle_enable_store(struct =
device *dev, struct device_at
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> -=09if (enable)
> -=09=09value =3D 0;
> -=09else
> -=09=09value =3D TOUCHPAD_TOGGLE_OFF;
> -
> -=09ret =3D regmap_update_bits(data->regmap, EC_ADDR_OEM_4, TOUCHPAD_TOGG=
LE_OFF, value);
> +=09ret =3D uniwill_write_touchpad_toggle_enable(data, enable);
>  =09if (ret < 0)
>  =09=09return ret;
> =20
>  =09return count;
>  }
> =20
> +static int uniwill_read_touchpad_toggle_enable(struct uniwill_data *data=
, bool *status)
> +{
> +=09unsigned int value;
> +=09int ret;
> +
> +=09ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09*status =3D !(value & TOUCHPAD_TOGGLE_OFF);
> +
> +=09return 0;
> +}
> +
>  static ssize_t touchpad_toggle_enable_show(struct device *dev, struct de=
vice_attribute *attr,
>  =09=09=09=09=09   char *buf)
>  {
>  =09struct uniwill_data *data =3D dev_get_drvdata(dev);
> -=09unsigned int value;
> +=09bool status;
>  =09int ret;
> =20
> -=09ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
> +=09ret =3D uniwill_read_touchpad_toggle_enable(data, &status);
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> -=09return sysfs_emit(buf, "%d\n", !(value & TOUCHPAD_TOGGLE_OFF));
> +=09return sysfs_emit(buf, "%d\n", status);
>  }
> =20
>  static DEVICE_ATTR_RW(touchpad_toggle_enable);
> @@ -1774,6 +1796,18 @@ static int uniwill_suspend_super_key(struct uniwil=
l_data *data)
>  =09return uniwill_read_super_key_enable(data, &data->last_super_key_enab=
le_state);
>  }
> =20
> +static int uniwill_suspend_touchpad_toggle(struct uniwill_data *data)
> +{
> +=09if (!uniwill_device_supports(data, UNIWILL_FEATURE_TOUCHPAD_TOGGLE))
> +=09=09return 0;
> +
> +=09/*
> +=09 * EC_ADDR_OEM_4 is marked as volatile, so we have to restore it
> +=09 * ourselves.
> +=09 */
> +=09return uniwill_read_touchpad_toggle_enable(data, &data->last_touchpad=
_toggle_enable_state);
> +}
> +
>  static int uniwill_suspend_battery(struct uniwill_data *data)
>  {
>  =09if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
> @@ -1809,6 +1843,10 @@ static int uniwill_suspend(struct device *dev)
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> +=09ret =3D uniwill_suspend_touchpad_toggle(data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
>  =09ret =3D uniwill_suspend_battery(data);
>  =09if (ret < 0)
>  =09=09return ret;
> @@ -1839,6 +1877,14 @@ static int uniwill_resume_super_key(struct uniwill=
_data *data)
>  =09return uniwill_write_super_key_enable(data, data->last_super_key_enab=
le_state);
>  }
> =20
> +static int uniwill_resume_touchpad_toggle(struct uniwill_data *data)
> +{
> +=09if (!uniwill_device_supports(data, UNIWILL_FEATURE_TOUCHPAD_TOGGLE))
> +=09=09return 0;
> +
> +=09return uniwill_write_touchpad_toggle_enable(data, data->last_touchpad=
_toggle_enable_state);
> +}
> +
>  static int uniwill_resume_battery(struct uniwill_data *data)
>  {
>  =09if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
> @@ -1884,6 +1930,10 @@ static int uniwill_resume(struct device *dev)
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> +=09ret =3D uniwill_resume_touchpad_toggle(data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
>  =09ret =3D uniwill_resume_battery(data);
>  =09if (ret < 0)
>  =09=09return ret;
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1769630749-1777554824=:971--
