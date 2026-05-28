Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEF038945C;
	Thu, 28 May 2026 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959214; cv=none; b=uqTjXRhKjI/1lN+WrhfaTWrp9ShyVD47UzeuQ8OetTKbyWG5DCrdcLhHRr7q7efxxEATeT+KTETJIKwPjYS3cl/YQI/Cieqzti6nNspsxXsW5QWlkDfQO1Lwo/IkpPSJlVN4Jo3XCL2HxznJXPH9IGdhYcZTLLlGDQSD7t+kBvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959214; c=relaxed/simple;
	bh=UKQup2hgSyHkFja2tb6JHOEJnbgPuRwtgBIH9Kh1jHE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=h0QXsSq5es7R93bL6ONuJbaG+xUKR/G+yAfv4fNrW6J4AEzNGcRCXx/mKvprNNpW/uQS0MyrKK2P+zmDYbh9C65xl97xcMODYGIzMMpwBjeamQaa6tZSILxmEoXquM1S+rTRi2jjTs4mV51DjQg/JDku5aYnHAzeutLZoVOT8is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ze0j4V6U; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ze0j4V6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779959213; x=1811495213;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UKQup2hgSyHkFja2tb6JHOEJnbgPuRwtgBIH9Kh1jHE=;
  b=Ze0j4V6UpScteaJlHAvm725sq/5dvoqTY0xcF8ZJQIE4fzuxBZ8jMJ/5
   SfBxJQpwQC6MRyJjE2p1M8RFQ82DnDhPZ5GchXaagdPiKFb7yDiCtGxfN
   xKd1KM4LsSGNEQ1ZUJUN/KgJ5D5vzrW8BbWwdOEW0FIJaVqBQy3tuMC/O
   x8Xk3kNeUS37TddGsBxDrafGusQrK4qLz3Aaz3J7eGv7gW/GlCJpJUHeW
   iQtjWU8Ae6nt5F9cmvFE0iDQWBtpG+mrxk7o8/syXeM+bjnFG3tBuo4JY
   Vc8ucW+uxjyYtq7v5biXKGPfT3gruvYyCjKupOu1OORJ7RXCtkBqqP3IV
   g==;
X-CSE-ConnectionGUID: 9TmBySpbQOWIH4meea2Dsw==
X-CSE-MsgGUID: JXO1bMuzQ9iqkeI0g+BEhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80858523"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80858523"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 02:06:53 -0700
X-CSE-ConnectionGUID: hbqlRM31TYSEruXhY68l2g==
X-CSE-MsgGUID: S96cKLjbSqql/27wLMhVuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="244325784"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 02:06:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 28 May 2026 12:06:47 +0300 (EEST)
To: Denis Benato <denis.benato@linux.dev>, 
    =?ISO-8859-2?Q?Dariusz_Figza=B3?= <dariuszfigzal@gmail.com>
cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com, 
    luke@ljones.dev, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: asus-wmi: add keystone dongle support
In-Reply-To: <c4256b75-6791-4ae8-a254-4a767e2a7af8@linux.dev>
Message-ID: <ccd7ef85-c3a8-aefe-3071-d3ea61b58ca6@linux.intel.com>
References: <20260526214439.70142-1-dariuszfigzal@gmail.com> <c4256b75-6791-4ae8-a254-4a767e2a7af8@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-165527202-1779959207=:1291"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-165527202-1779959207=:1291
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 28 May 2026, Denis Benato wrote:

>=20
> On 5/26/26 23:44, Dariusz Figza=C5=82 wrote:
> > The ASUS Keystone is a physical NFC-like dongle that slots into support=
ed
> > ASUS laptops. The EC fires WMI notify code 0xB4 on insert/remove events=
=2E
> >
> > Expose the current insert state via a sysfs attribute by querying WMI
> > device ID 0x00120091 (DSTS). This devid does not follow the standard DS=
TS
> > convention: PRESENCE_BIT (0x00010000) encodes the insert state rather t=
han
> > feature presence, and STATUS_BIT is never set. Presence of a keystone s=
lot
> > is detected by a successful DSTS call (any result other than -ENODEV).
> Thanks for this!
>=20
> Ilpo might have some suggestions on how to make the code better,
> As we discussed a fair bit about this I say LGTM.
>=20
> Reviewed-by: Denis Benato <denis.benato@linux.dev>
> > Signed-off-by: Dariusz Figza=C5=82 <dariuszfigzal@gmail.com>
> > ---
> >  drivers/platform/x86/asus-wmi.c            | 75 ++++++++++++++++++++++
> >  include/linux/platform_data/x86/asus-wmi.h |  7 ++
> >  2 files changed, 82 insertions(+)
> >
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asu=
s-wmi.c
> > index 80144c412b90..a3fa3921aef3 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -70,6 +70,7 @@ module_param(fnlock_default, bool, 0444);
> >  #define NOTIFY_KBD_TTP=09=09=090xae
> >  #define NOTIFY_LID_FLIP=09=09=090xfa
> >  #define NOTIFY_LID_FLIP_ROG=09=090xbd
> > +#define NOTIFY_KEYSTONE=09=09=090xb4
> > =20
> >  #define ASUS_WMI_FNLOCK_BIOS_DISABLED=09BIT(0)
> > =20
> > @@ -279,6 +280,8 @@ struct asus_wmi {
> >  =09u32 tablet_switch_dev_id;
> >  =09bool tablet_switch_inverted;
> > =20
> > +=09bool keystone_detected;
> > +
> >  =09enum fan_type fan_type;
> >  =09enum fan_type gpu_fan_type;
> >  =09enum fan_type mid_fan_type;
> > @@ -646,6 +649,66 @@ static bool asus_wmi_dev_is_present(struct asus_wm=
i *asus, u32 dev_id)
> >  =09return status =3D=3D 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
> >  }
> > =20
> > +/* Keystone **********************************************************=
*********/
> > +
> > +static ssize_t keystone_show(struct device *dev,
> > +=09=09=09     struct device_attribute *attr, char *buf)
> > +{
> > +=09struct asus_wmi *asus =3D dev_get_drvdata(dev);
> > +=09u32 retval;
> > +=09int err;
> > +
> > +=09err =3D asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_KEYSTONE, &retva=
l);
> > +=09if (err)
> > +=09=09return err;
> > +
> > +=09return sysfs_emit(buf, "%d\n", !!(retval & ASUS_WMI_DSTS_PRESENCE_B=
IT));
> > +}
> > +
> > +static DEVICE_ATTR_RO(keystone);
> > +
> > +static void asus_wmi_keystone_notify(struct asus_wmi *asus)
> > +{
> > +=09sysfs_notify(&asus->platform_device->dev.kobj, NULL, "keystone");
> > +}
> > +
> > +static int asus_wmi_keystone_init(struct asus_wmi *asus)
> > +{
> > +=09u32 retval;
> > +=09int err;
> > +
> > +=09/*
> > +=09 * Use a raw devstate call rather than asus_wmi_dev_is_present().
> > +=09 * For this devid, PRESENCE_BIT encodes current insert state, not
> > +=09 * feature presence, so asus_wmi_dev_is_present() would return fals=
e
> > +=09 * whenever the dongle is absent at boot, even on machines that hav=
e
> > +=09 * a keystone slot.
> > +=09 * -ENODEV means the firmware doesn't know this devid at all.
> > +=09 * retval is not examined here, only the return code matters.
> > +=09 */
> > +=09err =3D asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_KEYSTONE, &retva=
l);
> > +=09if (err =3D=3D -ENODEV)
> > +=09=09return 0;
> > +=09if (err)
> > +=09=09return err;
> > +
> > +=09err =3D device_create_file(&asus->platform_device->dev, &dev_attr_k=
eystone);
> > +=09if (err)
> > +=09=09return err;
> > +
> > +=09asus->keystone_detected =3D true;
> > +=09return 0;
> > +}

The visibility of this should be controlled using .is_visible and the=20
attribute should be placed into the normal attribute array.

> > +static void asus_wmi_keystone_exit(struct asus_wmi *asus)
> > +{
> > +=09if (!asus->keystone_detected)
> > +=09=09return;
> > +
> > +=09device_remove_file(&asus->platform_device->dev, &dev_attr_keystone)=
;
> > +=09asus->keystone_detected =3D false;
> > +}
> > +
> >  /* Input *************************************************************=
*********/
> >  static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool valu=
e)
> >  {
> > @@ -4575,6 +4638,12 @@ static void asus_wmi_handle_event_code(int code,=
 struct asus_wmi *asus)
> >  =09=09return;
> >  =09}
> > =20
> > +=09if (code =3D=3D NOTIFY_KEYSTONE) {
> > +=09=09if (asus->keystone_detected)
> > +=09=09=09asus_wmi_keystone_notify(asus);
> > +=09=09return;
> > +=09}
> > +
> >  =09if (code =3D=3D NOTIFY_KBD_FBM || code =3D=3D NOTIFY_KBD_TTP) {
> >  =09=09if (asus->fan_boost_mode_available)
> >  =09=09=09fan_boost_mode_switch_next(asus);
> > @@ -5085,6 +5154,10 @@ static int asus_wmi_add(struct platform_device *=
pdev)
> >  =09if (err)
> >  =09=09goto fail_sysfs;
> > =20
> > +=09err =3D asus_wmi_keystone_init(asus);
> > +=09if (err)
> > +=09=09dev_warn(&pdev->dev, "Keystone initialization failed: %d\n", err=
);
> > +
> >  =09err =3D asus_wmi_input_init(asus);
> >  =09if (err)
> >  =09=09goto fail_input;
> > @@ -5170,6 +5243,7 @@ static int asus_wmi_add(struct platform_device *p=
dev)
> >  fail_hwmon:
> >  =09asus_wmi_input_exit(asus);
> >  fail_input:
> > +=09asus_wmi_keystone_exit(asus);
> >  =09asus_wmi_sysfs_exit(asus->platform_device);
> >  fail_sysfs:
> >  fail_custom_fan_curve:
> > @@ -5191,6 +5265,7 @@ static void asus_wmi_remove(struct platform_devic=
e *device)
> >  =09asus_wmi_backlight_exit(asus);
> >  =09asus_screenpad_exit(asus);
> >  =09asus_wmi_input_exit(asus);
> > +=09asus_wmi_keystone_exit(asus);
> >  =09asus_wmi_led_exit(asus);
> >  =09asus_wmi_rfkill_exit(asus);
> >  =09asus_wmi_debugfs_exit(asus);
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux=
/platform_data/x86/asus-wmi.h
> > index 554f41b827e1..c29962d5baac 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -147,6 +147,13 @@
> >  #define ASUS_WMI_DEVID_GPU_MUX=09=090x00090016
> >  #define ASUS_WMI_DEVID_GPU_MUX_VIVO=090x00090026
> > =20
> > +/* Keystone dongle insert/remove state.
> > + * PRESENCE_BIT (0x00010000) encodes insert state:
> > + * 0x00010000 =3D inserted, 0x00000000 =3D absent. STATUS_BIT is never=
 set.
> > + * 0xFFFFFFFE means no keystone slot on this machine.
> > + */
> > +#define ASUS_WMI_DEVID_KEYSTONE=09=090x00120091
> > +
> >  /* TUF laptop RGB modes/colours */
> >  #define ASUS_WMI_DEVID_TUF_RGB_MODE=090x00100056
> >  #define ASUS_WMI_DEVID_TUF_RGB_MODE2=090x0010005A
>=20

--=20
 i.

--8323328-165527202-1779959207=:1291--
