Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FBB3537ED;
	Tue, 26 May 2026 09:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787017; cv=none; b=Lm2JWJ2On3DiOPt3m5jElWmfQoloueR6JdK7yXojrnVUG7Li5+8rBHvexLPkxW0vYYKsiWwDM4+1BrlWOoFqFu1++wxmo0D90Fwhiohcy5tMM53zbRdkw+XGvzw+G30wnuufY7InsSeiwB68zWuoBNwTKodrMonoPaCvXytcSzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787017; c=relaxed/simple;
	bh=vpFx+abpjEIaV3lU1vKU4sqJFHneqDANLbMplRnno9o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o5o0KoFgKtN0j9TPSbV1O1mfrQL4M5DCk4VtS4tsUz4r37wZtCO2H7aZFEQeWC1R7CCu5fqcuN71OR49hB+w9vsDS1hFierbwbn07obpNLPnodRO4gyaG5ZqDJHRZZomK+y3mfL9aIOcCiijlJTXWP3xRYBLUrgG3UHZt5FjuyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTDa40Kb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTDa40Kb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779787013; x=1811323013;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vpFx+abpjEIaV3lU1vKU4sqJFHneqDANLbMplRnno9o=;
  b=bTDa40Kb3bpSATAixvukH9Z60HhqfprnCfgTnic8k73CHRm3Ghr3Z9tA
   EIgsbxVytpQ2T5Oyj15512JA7p/BYl6q/HJvqFdtwZJ+bji53m9d/ouub
   K16/Ml9uQT4zFOdrts/FjghrdrN/RxjuftUiKPaFSZqx1TmHI+D8s8OXQ
   JYR9RTOwEx2d2MlIwcHpbfgQbSlo8Q2SRczSKpfECUgR0/v4jRZ/ytX5F
   wMfvP/q8O2ld3LjElyDAsfy57SqvPQiOn9BCcRGmSVJOo0/cuDx2ADltM
   ckchGtoEYkb06khwhxaoGD65vQSxhRmhBtfXh1bShOsvI0pUWW5hl/Pf3
   g==;
X-CSE-ConnectionGUID: WQfIuAKBS22A7nOryn7lkg==
X-CSE-MsgGUID: yFyYEhaGQ8iTJUp26I6m4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80628402"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80628402"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 02:16:47 -0700
X-CSE-ConnectionGUID: wd9nxugHRNqyXfCuH7/1/w==
X-CSE-MsgGUID: bg9G/kjSRPW4WVAQmlFZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="265720988"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.137])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 02:16:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 26 May 2026 12:16:40 +0300 (EEST)
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, skhan@linuxfoundation.org, 
    hmh@hmh.eng.br, Hans de Goede <hansg@kernel.org>, corbet@lwn.net, 
    derekjohn.clark@gmail.com, LKML <linux-kernel@vger.kernel.org>, 
    ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add USB-C Security (USCS)
 support
In-Reply-To: <CABxCQKuWt-iGENEaC_gNFMfWHrr80zJe_xnwEQz1Q-1yADcDOg@mail.gmail.com>
Message-ID: <d9f33111-cd96-a37f-cf3f-23f6758c7e18@linux.intel.com>
References: <20260522100715.20036-1-vishnuocv@gmail.com> <c4c0632b-0a24-8956-9557-69b927e451fb@linux.intel.com> <CABxCQKuWt-iGENEaC_gNFMfWHrr80zJe_xnwEQz1Q-1yADcDOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-956113078-1779787000=:1874"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-956113078-1779787000=:1874
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 26 May 2026, Vishnu Sankar wrote:

> Hi Ilpo,
>=20
> Thank you for the comments.
>=20
> On Tue, May 26, 2026 at 2:19=E2=80=AFAM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Fri, 22 May 2026, Vishnu Sankar wrote:
> >
> > > Newer ThinkPad systems expose a USB-C Security (Restricted Mode) feat=
ure.
> > > When active, USB-C data connections are disabled while power delivery=
 is
> > > preserved. This is useful for kiosk and physically-secured deployment=
s.
> > >
> > > Hardware interface:
> > >
> > > The HKEY device exposes a read-only ACPI method USCS():
> > >
> > >   Return value bit layout:
> > >     Bit 16 : Capability flag (1 =3D feature present on this SKU)
> > >     Bit  0 : Current state  (0 =3D security OFF, 1 =3D security ON)
> > >
> > > The sysfs attribute is read-only.
> > >
> > > The Fn+U followed by Fn+S hotkey chord is the only way to toggle the
> > > hardware state.
> > >
> > > Hotkey:
> > >
> > > Fn+U followed by Fn+S generates HKEY event 0x131e.
> > >
> > > sysfs interface:
> > >
> > >   /sys/devices/platform/thinkpad_acpi/usb_c_security  (read-only)
> > >   "enabled\n"  -- data connections are currently blocked
> > >   "disabled\n" -- data connections are currently allowed
> > >
> > >   The attribute is hidden on SKUs where the USCS capability bit (bit =
16)
> > >   is not set, so there is no ABI impact on unsupported hardware.
> > >
> > > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > > ---
> > >  .../admin-guide/laptops/thinkpad-acpi.rst     |  24 ++++
> > >  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 115 ++++++++++++++++=
++
> > >  2 files changed, 139 insertions(+)
> > >
> > > diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Do=
cumentation/admin-guide/laptops/thinkpad-acpi.rst
> > > index f874db31801d..db4588af0278 100644
> > > --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > > +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > > @@ -1543,6 +1543,30 @@ Values:
> > >
> > >       This setting can also be toggled via the Fn+doubletap hotkey.
> > >
> > > +USB-C Security
> > > +--------------
> > > +
> > > +sysfs: usb_c_security
> > > +
> > > +Reports the current state of the USB-C Security (Restricted Mode) fe=
ature
> > > +on supported ThinkPad systems. When enabled, USB-C data connections =
are
> > > +disabled while power delivery is preserved.
> > > +
> > > +The available command is::
> > > +
> > > +        cat /sys/devices/platform/thinkpad_acpi/usb_c_security
> > > +
> > > +Values:
> > > +
> > > +     * ``enabled``  - USB-C data connections are currently blocked
> > > +     * ``disabled`` - USB-C data connections are currently allowed
> > > +
> > > +The attribute is read-only. The USB-C Security state can only be tog=
gled
> > > +via the Fn+U followed by Fn+S hotkey chord.
> > > +
> > > +The sysfs attribute is not created on platforms that do not support =
this
> > > +feature.
> > > +
> > >  Auxmac
> > >  ------
> > >
> > > diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/pl=
atform/x86/lenovo/thinkpad_acpi.c
> > > index e1cee42a1683..889db802185a 100644
> > > --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > > +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > > @@ -185,6 +185,7 @@ enum tpacpi_hkey_event_t {
> > >       TP_HKEY_EV_AMT_TOGGLE           =3D 0x131a, /* Toggle AMT on/of=
f */
> > >       TP_HKEY_EV_CAMERASHUTTER_TOGGLE =3D 0x131b, /* Toggle Camera Sh=
utter */
> > >       TP_HKEY_EV_DOUBLETAP_TOGGLE     =3D 0x131c, /* Toggle trackpoin=
t doubletap on/off */
> > > +     TP_HKEY_EV_USB_C_SECURITY       =3D 0x131e, /* Toggle USB C Sec=
urity ON/OFF */
> > >       TP_HKEY_EV_PROFILE_TOGGLE       =3D 0x131f, /* Toggle platform =
profile in 2024 systems */
> > >       TP_HKEY_EV_PROFILE_TOGGLE2      =3D 0x1401, /* Toggle platform =
profile in 2025 + systems */
> > >
> > > @@ -373,6 +374,8 @@ static struct {
> > >       u32 has_adaptive_kbd:1;
> > >       u32 kbd_lang:1;
> > >       u32 trackpoint_doubletap_enable:1;
> > > +     u32 usbc_security_supported:1;
> > > +     u32 usbc_security_enabled:1;
> > >       struct quirk_entry *quirks;
> > >  } tp_features;
> > >
> > > @@ -11265,6 +11268,111 @@ static struct ibm_struct hwdd_driver_data =
=3D {
> > >       .name =3D "hwdd",
> > >  };
> > >
> > > +/*******************************************************************=
******
> > > + * USB-C Security subdriver
> > > + *
> > > + * HKEY.USCS(0) is a read-only ACPI method; its argument is ignored.
> > > + * It always returns:
> > > + *   bit 16 - USB-C security capability present on this SKU or not
> > > + *   bit  0 - USB-C Security state (enable or disable)
> > > + *
> > > + * Hotkey
> > > + * ------
> > > + * 0x131e (Fn+U, Fn+S): firmware toggles USBS before firing the even=
t.
> > > + * The driver reads back the new state and notifies the sysfs attrib=
ute.
> > > + *
> > > + */
> > > +
> > > +/* USCS() return word bit layout */
> > > +#define USCS_CAP_BIT         BIT(16) /* capability: feature present =
on SKU */
> > > +#define USCS_STATUS_BIT              BIT(0)  /* current security sta=
te */
> > > +
> > > +static DEFINE_MUTEX(usbc_security_mutex);
> > > +
> > > +/*
> > > + * usbc_security_query - read current USB-C security state via USCS(=
)
> > > + * @enabled: out - true when security is ON (data connections blocke=
d)
> > > + *
> > > + * Returns true if the feature is supported and query succeeded,
> > > + * false otherwise (feature absent or ACPI call failed).
> > > + */
> > > +static bool usbc_security_query(bool *enabled)
> > > +{
> > > +     int status;
> > > +
> > > +     mutex_lock(&usbc_security_mutex);
> > > +     if (!acpi_evalf(hkey_handle, &status, "USCS", "dd", 0)) {
> > > +             mutex_unlock(&usbc_security_mutex);
> > > +             return false;
> > > +     }
> > > +     mutex_unlock(&usbc_security_mutex);
> >
> > Please use cleanup.h.
> Will do.
> Will replace the manual mutex_lock/unlock pattern with guard(mutex).
> >
> > > +
> > > +     if (!(status & USCS_CAP_BIT)) {
> > > +             pr_debug("USCS cap bit absent (raw=3D0x%x)\n", status);
> > > +             return false;
> > > +     }
> > > +
> > > +     *enabled =3D !!(status & USCS_STATUS_BIT);
> >
> > No need to do !! when assigning to bool.
> Agreed, will remove the !!.
> >
> > > +     return true;
> > > +}
> > > +
> > > +/* sysfs: /sys/devices/platform/thinkpad_acpi/usb_c_security -------=
--- */
> > > +static ssize_t usb_c_security_show(struct device *dev,
> > > +                                struct device_attribute *attr,
> > > +                                char *buf)
> > > +{
> > > +     return sysfs_emit(buf, "%s\n",
> > > +                       tp_features.usbc_security_enabled ? "enabled"=
 : "disabled");
> >
> > Please use string_choices.h.
> Will use str_enabled_disabled() which is already used in
> thinkpad_acpi.c for similar pattern.
> >
> > > +}
> > > +
> > > +static DEVICE_ATTR_RO(usb_c_security);
> > > +
> > > +static struct attribute *usbc_security_attributes[] =3D {
> > > +     &dev_attr_usb_c_security.attr,
> > > +     NULL,
> > > +};
> > > +
> > > +static umode_t usbc_security_attr_is_visible(struct kobject *kobj,
> > > +                                          struct attribute *attr, in=
t n)
> > > +{
> > > +     return tp_features.usbc_security_supported ? attr->mode : 0;
> > > +}
> > > +
> > > +static const struct attribute_group usbc_security_attr_group =3D {
> > > +     .is_visible =3D usbc_security_attr_is_visible,
> > > +     .attrs =3D usbc_security_attributes,
> > > +};
> > > +
> > > +static int tpacpi_usbc_security_init(struct ibm_init_struct *iibm)
> > > +{
> > > +     bool enabled;
> > > +
> > > +     tp_features.usbc_security_supported =3D
> > > +             usbc_security_query(&enabled);
> >
> > Fits to one line.
> Acked.
> >
> > > +     tp_features.usbc_security_enabled =3D enabled;
> >
> > I'm not sure I follow the logic here as you always seem set it enabled
> > disregarding even support or not?
> >
> > And that hotkey enabling seems deadcode with it already enabled here.
> >
> > I feel like I must blind to something obvious but cannot just find
> > what that would be.
> I'm sorry, this is a bug.
> I will change to the following:
>     tp_features.usbc_security_supported =3D usbc_security_query(&enabled)=
;
>     if (tp_features.usbc_security_supported)
>         tp_features.usbc_security_enabled =3D enabled;
>
> The hotkey path is not dead code =E2=80=94 it updates usbc_security_enabl=
ed
> when the user presses Fn+U Fn+S, since the EC firmware toggles the
> state and fires the event. The init only captures the state at boot;
> subsequent toggles come through the hotkey. Sorry for the confusion in
> the init code.

Oh, I see now what I was missing and it's just as obvious I was I=20
thinking... I, for some reason, read these as:

=09tp_features.usbc_security_enabled =3D true;

=2E..but you had =3D enabled there. I'm sorry about my confusion.

I find the the way usbc_security_query() is architected a bit confusing=20
though, it returns supported/not supported in return value and another=20
boolean through the bool pointer. And that looks broken, if=20
usbc_security_query() returns early, it won't set *enabled which then=20
remains uninitialized (contains pseudogarbage from stack so your testing=20
might have been luck and had it always working the way you wanted).

> > > +     return 0;
> > > +}
> > > +
> > > +/* tpacpi_usbc_security_hotkey - handle Fn+U Fn+S hotkey (0x131e) */
> > > +static bool tpacpi_usbc_security_hotkey(void)
> > > +{
> > > +     bool enabled;
> > > +
> > > +     if (!tp_features.usbc_security_supported)
> > > +             return false;
> > > +
> > > +     if (!usbc_security_query(&enabled))
> > > +             return false;
> > > +
> > > +     tp_features.usbc_security_enabled =3D enabled;
> > > +     sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "usb_c_security");
> > > +     return true;
> > > +}
> > > +
> > > +static struct ibm_struct usbc_security_driver_data =3D {
> > > +     .name =3D "usbc_security",
> > > +};
> > > +
> > >  /* -----------------------------------------------------------------=
---- */
> > >
> > >  static struct attribute *tpacpi_driver_attributes[] =3D {
> > > @@ -11325,6 +11433,7 @@ static const struct attribute_group *tpacpi_g=
roups[] =3D {
> > >       &dprc_attr_group,
> > >       &auxmac_attr_group,
> > >       &hwdd_attr_group,
> > > +     &usbc_security_attr_group,
> > >       NULL,
> > >  };
> > >
> > > @@ -11479,6 +11588,8 @@ static bool tpacpi_driver_event(const unsigne=
d int hkey_event)
> > >       case TP_HKEY_EV_PROFILE_TOGGLE2:
> > >               platform_profile_cycle();
> > >               return true;
> > > +     case TP_HKEY_EV_USB_C_SECURITY:
> > > +             return tpacpi_usbc_security_hotkey();
> > >       }
> > >
> > >       return false;
> > > @@ -11930,6 +12041,10 @@ static struct ibm_init_struct ibms_init[] __=
initdata =3D {
> > >               .init =3D tpacpi_hwdd_init,
> > >               .data =3D &hwdd_driver_data,
> > >       },
> > > +     {
> > > +             .init =3D tpacpi_usbc_security_init,
> > > +             .data =3D &usbc_security_driver_data,
> > > +     },
> > >  };
> > >
> > >  static int __init set_ibm_param(const char *val, const struct kernel=
_param *kp)
> > >
> >
> > --
> >  i.
> >
>=20
> I will update the v2 with all these changes soon, if no further comments.
>=20

--=20
 i.

--8323328-956113078-1779787000=:1874--
