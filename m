Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E23541B360
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010261; cv=pass; b=pUtK2gXihIYvb3M+9O+Hyf0O10jvUUzucdlVKXeGh1VpInykP/y8CZPswm5ahDvAikoWkyc4hl9phkwSiRwZUsDG/SD+OCausWYp79s0TGB9Od1N7HH42CYcCWZ5zOsOTBimLbRDsSiqzkPIEp4IdphcMOdpGwuPgGw4sbhUI04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010261; c=relaxed/simple;
	bh=3KlrU7cwaP7x6A4tdVFBc4zUB/4Q18UgJdhKj7pbTuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHHRz3nTUe9BBGvA5JeuC5rIbUVknUVzaaVPEuVDwsCAi6qDGLhWIo1ab0HBGNjT03jgRgyoRPvba5d3VAjNh5rr0AS0UBuczrQj22Xqhyi5MEEFN14SBnDcLBb0ZnHqmsre+XIzS5YyW2kB1Du11/wyrbTkhqKIsh6Mu86gtaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHr5r76/; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHr5r76/"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa7a7ad4d3so4516406e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Jun 2026 06:04:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781010257; cv=none;
        d=google.com; s=arc-20240605;
        b=UseIFDFIr51wGaSS8ywnCW2P9+BBsfei5XnCYTudOMfoihRO9pXg7zVScE6xE6yKPL
         3ZrCrAHOLuT0n573hN5UIampTEu0gG+DTZNQZIXaKZ5/RPJAgzq8eW+lh2IeIghMXLRx
         xGH1q/uDtE09SPzRVu8QHDC9hJVSc1Hsv66BrMswarz+wo7CULADf7aDxfe1bJ6CltvM
         qziQLdqRE9eq6bEWFcFcsB7oeu7JzWMDIrIZFFWrG+6Jk381/3JKQA4lKLorze248FXw
         mGSxvDNVzSm/adDi6HgN7EGC+S4674lOJDQY/74oKgK6H2B/9i0bJhp8dmuORgcVHBIB
         OCcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2p3OhpzH6yuasFWOZEdSUtDEeDVvlp6cWry0eF6q3aw=;
        fh=iRzVTyZup6NORQ/AQYgKQ5RadCxpQMPShP2Q8MNRbRU=;
        b=QGRDu9rrvTWUem593nd/01VKSF17uNN4hsh2imJRmMbANc5eK+BdVvesIit4LMamEc
         hNvB74xoi9hfiK3lv23F/Jg3NXd/K7g+3Elknup3MgX2/jXy1ANhnHVWZzQ4kpsBcBEQ
         uGDRVzAwqPWs5u/PBqgqmbxj2Yy8pHdcfr+lLpj7sIfSQVdEvvRVjCNqSbw+bzAQ/Wex
         qmmyVzZqJyvRStGC2zaf7VfTD5VYwi54Kl47RyzDl8e2mjlwRRw2xrPKOrEy1yLm3ty1
         TQOu9y8wVstCQeSFud0n0u+nwnmd4ZWkcivKter6Y6V2fOu7f4ypbWecRvaQDmwcQpbC
         1Mig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781010257; x=1781615057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2p3OhpzH6yuasFWOZEdSUtDEeDVvlp6cWry0eF6q3aw=;
        b=rHr5r76/WyMDyd9YmChMhtusjoxyuYbKMWvuQHHk2Rmf+cxmqTUBOkvEuf4KE8fPHq
         LyBXeplWWa+1LEqRF85HIcprY+bHBD0P6GcbSzv9QfavH8ejEG4ry99isaqh9fOsD1p3
         vpFTlpQKwg9RiUutKEf0sLchy8MAq1pUHjATtGkcddaUldV0zjeXLJNYDRVxHP3v1QH9
         LT60baOzLXmrp1RZSG39cTvcQnS0oDKUDMBMFXGGlPGGQZ2M66fSJ4kBC0CtpRraGm9m
         9BbmFGYeyTTkocHAhGk4Pc2qG8nukalXDxMpUk4H9UB/9kjWTCvy61PiOnOUulM5Uype
         KA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010257; x=1781615057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2p3OhpzH6yuasFWOZEdSUtDEeDVvlp6cWry0eF6q3aw=;
        b=ZVjJWTXg4Zc/NN0MeF/rYXRAMR6c0TJk53WNZ1+bqEBF967EcaZVdqsaazmTU9J17v
         dEcmLVsOXksqCsHx2pqhIOocQ3X/Dk9RhI/5bbJ00MI9oO+fVPnZEbknAgsW3IWGgSNt
         UEQFjHIIUh4e93JcDT5M9I3VVVdY91RGGuG6oiL6BieFdZuU1pdb3LX1CkIAOUdDgHk9
         oE9NWlRVQG/XbkhT52ZMf65NbxcgzdhdZb/LxCPrerrla3knnQYzbvHeZrJbVHi8/5Sc
         by3n05xBLoURG8zj7ioEouTNCleYB2dhVb+m0Qc3ERClQAzXUZQE7h5DKp0Bk7KPrZ6Q
         wC2g==
X-Forwarded-Encrypted: i=1; AFNElJ8haooaY5dBG8ApLCzcnMIz+tK4B412NiJM4ECa82gY9qeN/LIjWCvXtoAOhYeuTIcLD/hJL8wsMIpndbqQ16pqNr7j@vger.kernel.org
X-Gm-Message-State: AOJu0Yyof12yVLuU5WlmKuwGFA6xGKvoW54YSPgBZoMJe4wGmy+L3bxv
	6qCTNfvsMKPyv6SJKl55rGzedKVIqSZALrIdmWfQSaqw0cU3u7KvU0YFJq6psv+4MZrVYeK7Y7v
	H7NOH+d2eqTjaU34duEN6zMTahNgTtKI=
X-Gm-Gg: Acq92OEczYLvag2YK+bQFww9mH//pBN+5u62ea2Ec5f4lHDhThhdJz9IGpkArwjzoA8
	WdXrrlvJbUa4dzdu07mw9a+SODyJmmn1cTwagUFxaJ76bKjTHLmp+QkRen2uws1mC8eHli0IaLM
	TPnjs30ONswF/k/LK5tMhURcf2YFcmby1opTv/qQE/kVIKs3Q65LJlFWrpwtqQu7H0En9rVivqZ
	dBCmstsB6BfRN+eDzX0qmT3Jy8IRZPDhqJU3dxTh2/BScukr8Hzfwh9rszmBTASuCcRVN2RyA1S
	1gcwTdXp+jQxn7LuOcSvdv7EjEbpmLOFhEhAh3NcLDK0Fy+QJaI=
X-Received: by 2002:a05:6512:130e:b0:5a8:6d58:b29 with SMTP id
 2adb3069b0e04-5aa87b80b16mr6446931e87.22.1781010256842; Tue, 09 Jun 2026
 06:04:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609041402.328509-1-vishnuocv@gmail.com> <b6a08dcf-c7ce-d85a-5c18-18371f6a7cbf@linux.intel.com>
In-Reply-To: <b6a08dcf-c7ce-d85a-5c18-18371f6a7cbf@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 9 Jun 2026 22:03:40 +0900
X-Gm-Features: AVVi8CdlF7fRNeg44AOibO7n_LysBgYibp9kFBRpeQawyObbwIkEWQeSwgFzLrQ
Message-ID: <CABxCQKvQDKkQrjtHuoS7ij=5_ZBWkxWRn5qdVd3dXoxRoQpcmA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, hmh@hmh.eng.br, 
	Hans de Goede <hansg@kernel.org>, corbet@lwn.net, derekjohn.clark@gmail.com, 
	skhan@linuxfoundation.org, LKML <linux-kernel@vger.kernel.org>, 
	ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Thanks a lot for the review comments.

On Tue, Jun 9, 2026 at 6:12=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 9 Jun 2026, Vishnu Sankar wrote:
>
> > Newer ThinkPad systems expose a USB-C Security (Restricted Mode) featur=
e.
> > When active, USB-C data connections are disabled while power delivery i=
s
> > preserved. This is useful for kiosk and physically-secured deployments.
> >
> > Hardware interface:
> >
> > The HKEY device exposes a read-only ACPI method USCS():
> >
> >   Return value bit layout:
> >     Bit 16 : Capability flag (1 =3D feature present on this SKU)
> >     Bit  0 : Current state  (0 =3D security OFF, 1 =3D security ON)
> >
> > The sysfs attribute is read-only.
> >
> > The Fn+U followed by Fn+S hotkey chord is the only way to toggle the
> > hardware state.
> >
> > Hotkey:
> >
> > Fn+U followed by Fn+S generates HKEY event 0x131e.
> >
> > sysfs interface:
> >
> >   /sys/devices/platform/thinkpad_acpi/usb_c_security  (read-only)
> >   "enabled\n"  -- data connections are currently blocked
> >   "disabled\n" -- data connections are currently allowed
> >
> >   The attribute is hidden on SKUs where the USCS capability bit (bit 16=
)
> >   is not set, so there is no ABI impact on unsupported hardware.
> >
> > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > ---
> > Changes since v1:
> > - Use guard(mutex) from cleanup.h instead of manual mutex_lock/unlock
> > - Revert usbc_security_query() to return int (-EIO/-ENODEV/0) instead
> >   of bool to avoid uninitialized *enabled bug on unsupported platforms
> > - Remove !! when assigning to bool in usbc_security_query()
> > - Remove dead tp_features.usbc_security_supported check in show()
> >   since is_visible() already gates the attribute on unsupported SKUs
> > - Use str_enabled_disabled() from string_choices.h in show()
> > - Fix uninitialized *enabled bug in tpacpi_usbc_security_init() by
> >   only assigning usbc_security_enabled after a successful query
> > ---
> >  .../admin-guide/laptops/thinkpad-acpi.rst     |  24 ++++
> >  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 118 ++++++++++++++++++
> >  2 files changed, 142 insertions(+)
> >
> > diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Docu=
mentation/admin-guide/laptops/thinkpad-acpi.rst
> > index f874db31801d..db4588af0278 100644
> > --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > @@ -1543,6 +1543,30 @@ Values:
> >
> >       This setting can also be toggled via the Fn+doubletap hotkey.
> >
> > +USB-C Security
> > +--------------
> > +
> > +sysfs: usb_c_security
> > +
> > +Reports the current state of the USB-C Security (Restricted Mode) feat=
ure
> > +on supported ThinkPad systems. When enabled, USB-C data connections ar=
e
> > +disabled while power delivery is preserved.
> > +
> > +The available command is::
> > +
> > +        cat /sys/devices/platform/thinkpad_acpi/usb_c_security
> > +
> > +Values:
> > +
> > +     * ``enabled``  - USB-C data connections are currently blocked
> > +     * ``disabled`` - USB-C data connections are currently allowed
> > +
> > +The attribute is read-only. The USB-C Security state can only be toggl=
ed
> > +via the Fn+U followed by Fn+S hotkey chord.
> > +
> > +The sysfs attribute is not created on platforms that do not support th=
is
> > +feature.
> > +
> >  Auxmac
> >  ------
> >
> > diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/plat=
form/x86/lenovo/thinkpad_acpi.c
> > index e1cee42a1683..379769b62c80 100644
> > --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > @@ -38,6 +38,7 @@
> >  #include <linux/backlight.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/bitops.h>
> > +#include <linux/cleanup.h>
> >  #include <linux/delay.h>
> >  #include <linux/dmi.h>
> >  #include <linux/freezer.h>
> > @@ -66,6 +67,7 @@
> >  #include <linux/seq_file.h>
> >  #include <linux/slab.h>
> >  #include <linux/string.h>
> > +#include <linux/string_choices.h>
> >  #include <linux/string_helpers.h>
> >  #include <linux/sysfs.h>
> >  #include <linux/types.h>
> > @@ -185,6 +187,7 @@ enum tpacpi_hkey_event_t {
> >       TP_HKEY_EV_AMT_TOGGLE           =3D 0x131a, /* Toggle AMT on/off =
*/
> >       TP_HKEY_EV_CAMERASHUTTER_TOGGLE =3D 0x131b, /* Toggle Camera Shut=
ter */
> >       TP_HKEY_EV_DOUBLETAP_TOGGLE     =3D 0x131c, /* Toggle trackpoint =
doubletap on/off */
> > +     TP_HKEY_EV_USB_C_SECURITY       =3D 0x131e, /* Toggle USB C Secur=
ity ON/OFF */
> >       TP_HKEY_EV_PROFILE_TOGGLE       =3D 0x131f, /* Toggle platform pr=
ofile in 2024 systems */
> >       TP_HKEY_EV_PROFILE_TOGGLE2      =3D 0x1401, /* Toggle platform pr=
ofile in 2025 + systems */
> >
> > @@ -373,6 +376,8 @@ static struct {
> >       u32 has_adaptive_kbd:1;
> >       u32 kbd_lang:1;
> >       u32 trackpoint_doubletap_enable:1;
> > +     u32 usbc_security_supported:1;
> > +     u32 usbc_security_enabled:1;
>
> Sashiko (sashiko.dev) warned that there may be concurrent, unprotected
> updates to these bitfields (changing bitfields require unsafe RMW). It
> looks pre-existing problem at least for trackpoint_doubletap_enable (mayb=
e
> others).
>
> To avoid adding to the problems, usbc_security_enabled should be added
> outside the bitfield to avoid need to do locking for this bitfield.
>
> And trackpoint_doubletap_enable (and possibly others) which are touched i=
n
> the notify context or in sysfs write should be fixed in a separate patch
> (can be done after this series as it's pre-existing problem for them).
>
> Anything that is only written during init is fine inside the bitfield.
Agreed.
usbc_security_enabled will be moved outside tp_features as a
static bool since it is written from both init and the hotkey notify
context. usbc_security_supported remains inside the bitfield as it is
only written during init.

I note that trackpoint_doubletap_enable and possibly others have the
same pre-existing issue and will address those in a separate patch as
you suggested.
>
> >       struct quirk_entry *quirks;
> >  } tp_features;
> >
> > @@ -11265,6 +11270,112 @@ static struct ibm_struct hwdd_driver_data =3D=
 {
> >       .name =3D "hwdd",
> >  };
> >
> > +/*********************************************************************=
****
> > + * USB-C Security subdriver
> > + *
> > + * HKEY.USCS(0) is a read-only ACPI method; its argument is ignored.
> > + * It always returns:
> > + *   bit 16 - USB-C security capability present on this SKU or not
> > + *   bit  0 - USB-C Security state (enable or disable)
> > + *
> > + * Hotkey
> > + * ------
> > + * 0x131e (Fn+U, Fn+S): firmware toggles USBS before firing the event.
> > + * The driver reads back the new state and notifies the sysfs attribut=
e.
> > + *
>
> Remove the extra line.
Acked
>
> > + */
> > +
> > +/* USCS() return word bit layout */
> > +#define USCS_CAP_BIT         BIT(16) /* capability: feature present on=
 SKU */
> > +#define USCS_STATUS_BIT              BIT(0)  /* current security state=
 */
> > +
> > +static DEFINE_MUTEX(usbc_security_mutex);
> > +
> > +/*
> > + * usbc_security_query - read current USB-C security state via USCS()
> > + * @enabled: out - true when security is ON (data connections blocked)
> > + *
> > + * Returns true if the feature is supported and query succeeded,
>
> Kerneldoc doc compatible syntax is:
>
> Returns:
>
Acked
> > + * false otherwise (feature absent or ACPI call failed).
>
> Please rewrite this as this function no longer returns true/false. :-)
>
Acked
> > + */
> > +static int usbc_security_query(bool *enabled)
> > +{
> > +     int status;
> > +
> > +     guard(mutex)(&usbc_security_mutex);
> > +     if (!acpi_evalf(hkey_handle, &status, "USCS", "dd", 0))
> > +             return -EIO;
> > +
> > +     if (!(status & USCS_CAP_BIT)) {
> > +             pr_debug("USCS cap bit absent (raw=3D0x%x)\n", status);
> > +             return -ENODEV;
> > +     }
> > +
> > +     *enabled =3D status & USCS_STATUS_BIT;
> > +     return 0;
> > +}
> > +
> > +/* sysfs: /sys/devices/platform/thinkpad_acpi/usb_c_security ---------=
- */
> > +static ssize_t usb_c_security_show(struct device *dev,
> > +                                struct device_attribute *attr,
> > +                                char *buf)
> > +{
> > +     return sysfs_emit(buf, "%s\n",
> > +                       str_enabled_disabled(tp_features.usbc_security_=
enabled));
> > +}
> > +
> > +static DEVICE_ATTR_RO(usb_c_security);
> > +
> > +static struct attribute *usbc_security_attributes[] =3D {
> > +     &dev_attr_usb_c_security.attr,
> > +     NULL,
> > +};
> > +
> > +static umode_t usbc_security_attr_is_visible(struct kobject *kobj,
> > +                                          struct attribute *attr, int =
n)
> > +{
> > +     return tp_features.usbc_security_supported ? attr->mode : 0;
> > +}
> > +
> > +static const struct attribute_group usbc_security_attr_group =3D {
> > +     .is_visible =3D usbc_security_attr_is_visible,
> > +     .attrs =3D usbc_security_attributes,
> > +};
> > +
> > +static int tpacpi_usbc_security_init(struct ibm_init_struct *iibm)
> > +{
> > +     bool enabled;
> > +     int err;
> > +
> > +     err =3D usbc_security_query(&enabled);
> > +     if (err)
> > +             return err =3D=3D -ENODEV ? 0 : err;
>
> Just split this to two if () + returns for clarity.
>
Acked.
> > +
> > +     tp_features.usbc_security_supported =3D true;
> > +     tp_features.usbc_security_enabled =3D enabled;
> > +     return 0;
> > +}
> > +
> > +/* tpacpi_usbc_security_hotkey - handle Fn+U Fn+S hotkey (0x131e) */
> > +static bool tpacpi_usbc_security_hotkey(void)
> > +{
> > +     bool enabled;
> > +
> > +     if (!tp_features.usbc_security_supported)
> > +             return false;
> > +
> > +     if (usbc_security_query(&enabled))
> > +             return false;
> > +
> > +     tp_features.usbc_security_enabled =3D enabled;
> > +     sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "usb_c_security");
> > +     return true;
> > +}
> > +
> > +static struct ibm_struct usbc_security_driver_data =3D {
> > +     .name =3D "usbc_security",
> > +};
> > +
> >  /* -------------------------------------------------------------------=
-- */
> >
> >  static struct attribute *tpacpi_driver_attributes[] =3D {
> > @@ -11325,6 +11436,7 @@ static const struct attribute_group *tpacpi_gro=
ups[] =3D {
> >       &dprc_attr_group,
> >       &auxmac_attr_group,
> >       &hwdd_attr_group,
> > +     &usbc_security_attr_group,
> >       NULL,
> >  };
> >
> > @@ -11479,6 +11591,8 @@ static bool tpacpi_driver_event(const unsigned =
int hkey_event)
> >       case TP_HKEY_EV_PROFILE_TOGGLE2:
> >               platform_profile_cycle();
> >               return true;
> > +     case TP_HKEY_EV_USB_C_SECURITY:
> > +             return tpacpi_usbc_security_hotkey();
> >       }
> >
> >       return false;
> > @@ -11930,6 +12044,10 @@ static struct ibm_init_struct ibms_init[] __in=
itdata =3D {
> >               .init =3D tpacpi_hwdd_init,
> >               .data =3D &hwdd_driver_data,
> >       },
> > +     {
> > +             .init =3D tpacpi_usbc_security_init,
> > +             .data =3D &usbc_security_driver_data,
> > +     },
> >  };
> >
> >  static int __init set_ibm_param(const char *val, const struct kernel_p=
aram *kp)
> >
>
> --
>  i.
>
Thank you!

--=20

Regards,

      Vishnu Sankar
