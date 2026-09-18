Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB62B51CF67;
	Fri, 18 Sep 2026 18:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755845; cv=none; b=K0/WuwrMzSkm5x1c3bQUwu5s4kLhY1S0ybtNcpwkeu/Jb7QD9gnIRJXYZ+ZKyjg2uqf9FuOtTpcmmFbtcH1vkdWxEQoR6eBELdDGSWpRGMjes9xw0aMYiOzBDxEjidCiBjKcUHXcyNB0HwPUwPgk3Gx4Rc7KPFKfqOpz3K+34RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755845; c=relaxed/simple;
	bh=8DqdEN8qL+zvonqvfy3niTDe+vIoY6iB/0zAvvOmYA0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GkkAfrsA4p/JjQco647ZuGqmzTQOjMzcrcDHFCVqnTtmTo+VY1bQTx71IqmhVywJeko6zCpThp8CwgWajy9gRH5UNh1hpU5Mt4HU1R5+LVkoV8pjy8Hs2Zx3SOUtsw8Nz5H2BB+OfeZXbwCA2kXL0rSvNLENOgDDdMJk622j2lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/Ek6N29; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/Ek6N29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755843; x=1821291843;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8DqdEN8qL+zvonqvfy3niTDe+vIoY6iB/0zAvvOmYA0=;
  b=G/Ek6N29ivQbU0nAqsSFhkVH5OQ0xsmMVh2LXbip4o+GRgOHBx0a1RH2
   yAIE035HGurjpV0z1DP0haRDpId9P4Rlw9wMwDzIf+dHm7g0kTONqA5nA
   zMs4+cVPG6A82mcyGhPRPWxb11hYr7eOzGr6ctFawX/QIyef9hoM3mOrB
   yodxOaHHmoKlaiNde+tHjzE5gL3gfFn9QM+/zsInnMR/k3xxBLcM35A4r
   gi90n/+wekxOHXEoQOPU7TLiKOiSfoP3FwlZSPkgm7GbOFqNJ9zP9vwnw
   XLXxGd35t7pafKnvlsHydBkKye1uFxvCft5ZKOwpRXnpp/qjBW/waqApg
   A==;
X-CSE-ConnectionGUID: PZMudf6iSia35RQpjldV/g==
X-CSE-MsgGUID: VEp8Q9lATYqY3D3bEZfACA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100880634"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100880634"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:24:01 -0700
X-CSE-ConnectionGUID: 3IPv3sEkQAuh/CYtbmL3yw==
X-CSE-MsgGUID: CIYNu28QTB6yrZ8Ma9EtJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2761950"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:23:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 18 Sep 2026 21:23:56 +0300 (EEST)
To: =?ISO-8859-15?Q?Jorge_N=FA=F1ez_Granero?= <eljorge199525@gmail.com>
cc: platform-driver-x86@vger.kernel.org, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: asus-wmi: add speaker mute LED
In-Reply-To: <20260918180954.56382-1-eljorge199525@gmail.com>
Message-ID: <bb67adac-99e0-7b2e-0aae-d9df92f09959@linux.intel.com>
References: <20260918180954.56382-1-eljorge199525@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-237601934-1789755836=:17235"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-237601934-1789755836=:17235
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 18 Sep 2026, Jorge N=C3=BA=C3=B1ez Granero wrote:

> Some ASUS laptops (e.g. the ExpertBook B3405CCA) have a mute LED on the
> F1 key next to the mic mute LED on F4. The mic mute LED is already
> driven through WMI device 0x00040017, but the speaker mute LED is not
> known to the driver, so it never lights up under Linux while the
> firmware does light it under Windows.
>=20
> The DSDT of the B3405CCA exposes device 0x0004001C in the same LED
> group with the presence bit set, and calling DEVS(0x0004001C, 1/0)
> turns the F1 key LED on and off.
>=20
> Register it as "platform::mute" with the "audio-mute" default trigger,
> mirroring the existing mic mute LED, so that the snd-ctl-led speaker
> mode drives it automatically. Only registered when the firmware
> reports the device as present, so nothing changes on other models.
>=20
> Tested on an ASUS ExpertBook B3405CCA (BIOS 307): DSTS reports the
> device present and DEVS 1/0 toggles the LED.
>=20
> Signed-off-by: Jorge N=C3=BA=C3=B1ez Granero <eljorge199525@gmail.com>

Thanks for the patch, but I've already queued another patch to this effect=
=20
into the review-ilpo-next branch (from where it will eventually=20
propagate to the for-next branch).

--
 i.

> ---
>  drivers/platform/x86/asus-wmi.c            | 24 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  1 +
>  2 files changed, 25 insertions(+)
>=20
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index a650904..60bbd10 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -262,6 +262,7 @@ struct asus_wmi {
>  =09struct led_classdev lightbar_led;
>  =09int lightbar_led_wk;
>  =09struct led_classdev micmute_led;
> +=09struct led_classdev mute_led;
>  =09struct led_classdev camera_led;
>  =09struct workqueue_struct *led_workqueue;
>  =09struct work_struct tpd_led_work;
> @@ -2054,6 +2055,16 @@ static int micmute_led_set(struct led_classdev *le=
d_cdev,
>  =09return err < 0 ? err : 0;
>  }
> =20
> +static int mute_led_set(struct led_classdev *led_cdev,
> +=09=09=09enum led_brightness brightness)
> +{
> +=09int state =3D brightness !=3D LED_OFF;
> +=09int err;
> +
> +=09err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_MUTE_LED, state, NULL);
> +=09return err < 0 ? err : 0;
> +}
> +
>  static enum led_brightness camera_led_get(struct led_classdev *led_cdev)
>  {
>  =09struct asus_wmi *asus;
> @@ -2084,6 +2095,7 @@ static void asus_wmi_led_exit(struct asus_wmi *asus=
)
>  =09led_classdev_unregister(&asus->wlan_led);
>  =09led_classdev_unregister(&asus->lightbar_led);
>  =09led_classdev_unregister(&asus->micmute_led);
> +=09led_classdev_unregister(&asus->mute_led);
>  =09led_classdev_unregister(&asus->camera_led);
> =20
>  =09if (asus->led_workqueue)
> @@ -2181,6 +2193,18 @@ static int asus_wmi_led_init(struct asus_wmi *asus=
)
>  =09=09=09goto error;
>  =09}
> =20
> +=09if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MUTE_LED)) {
> +=09=09asus->mute_led.name =3D "platform::mute";
> +=09=09asus->mute_led.max_brightness =3D 1;
> +=09=09asus->mute_led.brightness_set_blocking =3D mute_led_set;
> +=09=09asus->mute_led.default_trigger =3D "audio-mute";
> +
> +=09=09rv =3D led_classdev_register(&asus->platform_device->dev,
> +=09=09=09=09=09   &asus->mute_led);
> +=09=09if (rv)
> +=09=09=09goto error;
> +=09}
> +
>  =09if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED)) {
>  =09=09asus->camera_led.name =3D "asus::camera";
>  =09=09asus->camera_led.max_brightness =3D 1;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/p=
latform_data/x86/asus-wmi.h
> index b5ed8c8..6cb2e58 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -54,6 +54,7 @@
>  #define ASUS_WMI_DEVID_LED5=09=090x00020015
>  #define ASUS_WMI_DEVID_LED6=09=090x00020016
>  #define ASUS_WMI_DEVID_MICMUTE_LED=09=090x00040017
> +#define ASUS_WMI_DEVID_MUTE_LED=09=090x0004001C
> =20
>  /* Disable Camera LED */
>  #define ASUS_WMI_DEVID_CAMERA_LED_NEG=090x00060078 /* 0 =3D on (unused) =
*/
>=20
--8323328-237601934-1789755836=:17235--
