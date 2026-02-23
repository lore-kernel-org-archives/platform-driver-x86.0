Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5C8279DAF;
	Mon, 23 Feb 2026 14:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856216; cv=none; b=oHC2GfJ50NsvzlOY/t9yuwAHpb+sKNNxIfG28Ofw5gRzk4n7vVnL8m1XM8byUuVjE8tsvLPD5unyr3nIr8iciOT286+86WTQbiigDdIvOlQm4j53ZPHC3fbKfoQQ9z/3erqhRlWZJs39xiHhuLxyLenK/w0MrA/qsd0XZiB4zXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856216; c=relaxed/simple;
	bh=pTeAHtRlATmFJy+UDEy11AuvDxwqDCOketocPg4MPSk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Fm49NkZ8ualfMoJ+Wf+LKbzleqHtxLRIKrSUMs+77Otd7F6mDcPaT/j4XbmOfioE5paW9iCGYzjJCQUcDTTgHcicRbRppaUsJmkTXex/3XjJgz6573wCkhoETNJPN83vtKDC9MpYfY/+2OW/8JeiF3vH1yH7c2cEMdcWJw9eKPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XC25BHTH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XC25BHTH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771856215; x=1803392215;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pTeAHtRlATmFJy+UDEy11AuvDxwqDCOketocPg4MPSk=;
  b=XC25BHTHhe/OuvXI8N/wJUCBjPnpppkh2QlqaJjnwrBuX6JPsh+e75Ll
   FlOdIrfBg69un3jXUuikuDPxJp/QYydtlYrbvZlKlP+4tmKn8wJfXqHZz
   C/SSo+Yp58UkzR8iJil9b8xVJL2YXcRZHCTeyBXIlnAn2SLdytY/3fRnt
   6qXqM5uk6h0nbIxH0s6V+mlN//sIUa8AEIestLrG2P/afp66e1APHmYFB
   7ppjoxzHem/Ou/eGrfCH/Jq0uGpy0UBR37BtXSUf9sOspNfqZ2udtN3rM
   NGKf8WdeQCNwtNdoDEcnfsvVOhW/o61CRAvzYBodOsYZ0AVMjrXiar9LC
   w==;
X-CSE-ConnectionGUID: yeQzg4ksTr6vJxVysqjHcA==
X-CSE-MsgGUID: r9daIpJWRzaO3HFrmRooJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76462583"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="76462583"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:16:55 -0800
X-CSE-ConnectionGUID: obYCn2FcQw2Oq9909ZLw8A==
X-CSE-MsgGUID: 0/WmR67NScqNW5P2iMBikw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="214660176"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:16:51 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Feb 2026 16:16:47 +0200 (EET)
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
cc: Peter Tyser <ptyser@xes-inc.com>, Lee Jones <lee@kernel.org>, 
    Hans de Goede <hansg@kernel.org>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    brgl@kernel.org
Subject: Re: [PATCH v2 2/2] platform/x86: meraki-mx100: use real software
 node references
In-Reply-To: <20260218-meraki-swnodes-v2-2-92c521da241c@oss.qualcomm.com>
Message-ID: <4828beda-7e35-a10d-fe09-9c02f15d7bd8@linux.intel.com>
References: <20260218-meraki-swnodes-v2-0-92c521da241c@oss.qualcomm.com> <20260218-meraki-swnodes-v2-2-92c521da241c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-816202610-1771856207=:1095"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-816202610-1771856207=:1095
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 18 Feb 2026, Bartosz Golaszewski wrote:

> The lpc_ich MFD driver now exposes the software node associated with the
> its GPIO controller cell. Remove the dummy software node from the
> meraki-mx100 driver and reference the real one instead.
>=20
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

For merging through mfd tree,

Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> ---
>  drivers/platform/x86/meraki-mx100.c | 41 ++++++++++++++++---------------=
------
>  1 file changed, 18 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/platform/x86/meraki-mx100.c b/drivers/platform/x86/m=
eraki-mx100.c
> index 8c5276d98512390effcc9f2258a6061684420d11..9f4caa1f3a923164eeaf31765=
a4e83c874cff181 100644
> --- a/drivers/platform/x86/meraki-mx100.c
> +++ b/drivers/platform/x86/meraki-mx100.c
> @@ -20,16 +20,11 @@
>  #include <linux/input-event-codes.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/lpc_ich.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> =20
> -#define TINK_GPIO_DRIVER_NAME "gpio_ich"
> -
> -static const struct software_node gpio_ich_node =3D {
> -=09.name =3D TINK_GPIO_DRIVER_NAME,
> -};
> -
>  /* LEDs */
>  static const struct software_node tink_gpio_leds_node =3D {
>  =09.name =3D "meraki-mx100-leds",
> @@ -38,7 +33,7 @@ static const struct software_node tink_gpio_leds_node =
=3D {
>  static const struct property_entry tink_internet_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:green:internet"),
>  =09PROPERTY_ENTRY_STRING("linux,default-trigger", "default-on"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 11, GPIO_ACTIVE_LOW),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 11, GPIO_ACTIVE_LO=
W),
>  =09{ }
>  };
> =20
> @@ -50,7 +45,7 @@ static const struct software_node tink_internet_led_nod=
e =3D {
> =20
>  static const struct property_entry tink_lan2_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:green:lan2"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 18, GPIO_ACTIVE_HIGH),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 18, GPIO_ACTIVE_HI=
GH),
>  =09{ }
>  };
> =20
> @@ -62,7 +57,7 @@ static const struct software_node tink_lan2_led_node =
=3D {
> =20
>  static const struct property_entry tink_lan3_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:green:lan3"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 20, GPIO_ACTIVE_HIGH),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 20, GPIO_ACTIVE_HI=
GH),
>  =09{ }
>  };
> =20
> @@ -74,7 +69,7 @@ static const struct software_node tink_lan3_led_node =
=3D {
> =20
>  static const struct property_entry tink_lan4_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:green:lan4"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 22, GPIO_ACTIVE_HIGH),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 22, GPIO_ACTIVE_HI=
GH),
>  =09{ }
>  };
> =20
> @@ -86,7 +81,7 @@ static const struct software_node tink_lan4_led_node =
=3D {
> =20
>  static const struct property_entry tink_lan5_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:green:lan5"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 23, GPIO_ACTIVE_HIGH),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 23, GPIO_ACTIVE_HI=
GH),
>  =09{ }
>  };
> =20
> @@ -98,7 +93,7 @@ static const struct software_node tink_lan5_led_node =
=3D {
> =20
>  static const struct property_entry tink_lan6_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:green:lan6"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 32, GPIO_ACTIVE_HIGH),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 32, GPIO_ACTIVE_HI=
GH),
>  =09{ }
>  };
> =20
> @@ -110,7 +105,7 @@ static const struct software_node tink_lan6_led_node =
=3D {
> =20
>  static const struct property_entry tink_lan7_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:green:lan7"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 34, GPIO_ACTIVE_HIGH),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 34, GPIO_ACTIVE_HI=
GH),
>  =09{ }
>  };
> =20
> @@ -122,7 +117,7 @@ static const struct software_node tink_lan7_led_node =
=3D {
> =20
>  static const struct property_entry tink_lan8_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:green:lan8"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 35, GPIO_ACTIVE_HIGH),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 35, GPIO_ACTIVE_HI=
GH),
>  =09{ }
>  };
> =20
> @@ -134,7 +129,7 @@ static const struct software_node tink_lan8_led_node =
=3D {
> =20
>  static const struct property_entry tink_lan9_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:green:lan9"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 36, GPIO_ACTIVE_HIGH),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 36, GPIO_ACTIVE_HI=
GH),
>  =09{ }
>  };
> =20
> @@ -146,7 +141,7 @@ static const struct software_node tink_lan9_led_node =
=3D {
> =20
>  static const struct property_entry tink_lan10_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:green:lan10"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 37, GPIO_ACTIVE_HIGH),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 37, GPIO_ACTIVE_HI=
GH),
>  =09{ }
>  };
> =20
> @@ -158,7 +153,7 @@ static const struct software_node tink_lan10_led_node=
 =3D {
> =20
>  static const struct property_entry tink_lan11_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:green:lan11"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 48, GPIO_ACTIVE_HIGH),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 48, GPIO_ACTIVE_HI=
GH),
>  =09{ }
>  };
> =20
> @@ -170,7 +165,7 @@ static const struct software_node tink_lan11_led_node=
 =3D {
> =20
>  static const struct property_entry tink_ha_green_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:green:ha"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 16, GPIO_ACTIVE_LOW),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 16, GPIO_ACTIVE_LO=
W),
>  =09{ }
>  };
> =20
> @@ -182,7 +177,7 @@ static const struct software_node tink_ha_green_led_n=
ode =3D {
> =20
>  static const struct property_entry tink_ha_orange_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:orange:ha"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 7, GPIO_ACTIVE_LOW),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 7, GPIO_ACTIVE_LOW=
),
>  =09{ }
>  };
> =20
> @@ -194,7 +189,7 @@ static const struct software_node tink_ha_orange_led_=
node =3D {
> =20
>  static const struct property_entry tink_usb_green_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:green:usb"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 21, GPIO_ACTIVE_LOW),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 21, GPIO_ACTIVE_LO=
W),
>  =09{ }
>  };
> =20
> @@ -206,7 +201,7 @@ static const struct software_node tink_usb_green_led_=
node =3D {
> =20
>  static const struct property_entry tink_usb_orange_led_props[] =3D {
>  =09PROPERTY_ENTRY_STRING("label", "mx100:orange:usb"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 19, GPIO_ACTIVE_LOW),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 19, GPIO_ACTIVE_LO=
W),
>  =09{ }
>  };
> =20
> @@ -230,7 +225,7 @@ static const struct software_node tink_gpio_keys_node=
 =3D {
>  static const struct property_entry tink_reset_key_props[] =3D {
>  =09PROPERTY_ENTRY_U32("linux,code", KEY_RESTART),
>  =09PROPERTY_ENTRY_STRING("label", "Reset"),
> -=09PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 60, GPIO_ACTIVE_LOW),
> +=09PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 60, GPIO_ACTIVE_LO=
W),
>  =09PROPERTY_ENTRY_U32("linux,input-type", EV_KEY),
>  =09PROPERTY_ENTRY_U32("debounce-interval", 100),
>  =09{ }
> @@ -243,7 +238,6 @@ static const struct software_node tink_reset_key_node=
 =3D {
>  };
> =20
>  static const struct software_node *tink_swnodes[] =3D {
> -=09&gpio_ich_node,
>  =09/* LEDs nodes */
>  =09&tink_gpio_leds_node,
>  =09&tink_internet_led_node,
> @@ -348,3 +342,4 @@ MODULE_AUTHOR("Chris Blake <chrisrblake93@gmail.com>"=
);
>  MODULE_DESCRIPTION("Cisco Meraki MX100 Platform Driver");
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:meraki-mx100");
> +MODULE_IMPORT_NS("LPC_ICH");
>=20
>=20
--8323328-816202610-1771856207=:1095--
