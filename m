Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1221A9F82
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jul 2026 03:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783482515; cv=pass; b=W/sY6uh1IeCqCeD3ZYa3XKAqscqjcdkpuTxu7+CSACkoUGR6pnncZ86cfurTXGwVnP6rMFAWovazhH/u7+TrBCjpA1Mnyq6NDnOx62KqA21AWbBg3Fehq5RhyFw085PuDYdA0nU9S/lGJP3lIluK6HIpck/yp4C+ArQEWf/IAy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783482515; c=relaxed/simple;
	bh=VFXmVDUf8AZzEMTLw6V/svrlMVVVPKT35SsfcNVHZ3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kdrbah5lQcIy91u2zfVj2Yc1HQ24YMM6b3ccU8P+SH05SW62HrLO6ede1RghtSr3hH/1dAzOMlVsD3EayKw+LESPQm0TqcgO9iSYDU4P/qPPxMAMhhmupQk3CYtKf+RMD28nDz2UPgtrS2gba7lkROQ4PzXoKax1gylvllL2q5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICsWW5H9; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICsWW5H9"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39669bcaadfso1976331fa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 20:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783482512; cv=none;
        d=google.com; s=arc-20260327;
        b=gN7eGNspZkKMZbFIFtO/z/fG6lpFNFH0wJtVClkG7me0HafUZ2z0Crghwm0AXrlREu
         pbG44c4SktbsI+CE81/LITKB8xfSdStSS1Ew25o4rF/Q0Or5ruAd4hh8tSOGv/fu2AxY
         46wfL/7lQkaWXJKpejrh9h/prr4aW4Ga2zSWwL2dy2RGTJogjpPgiambt/ASbyEf3d5Y
         +tOrZv+DWK6yK522e4/NyATrqqqVbisrTestKfP73i5JYjWpN4/PJajithdNQYSB/4ow
         //3iK7bY8t8wlq3LrOLnHmIt6d8UyY3MPPAT8jrKYj9LpCFIgWyBJjXGwoOWmMuWVLiR
         25iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KlYVhTpuSXBFBCVpK4CRi4WSbdQhavkfuYahY6d8jN4=;
        fh=vaVWestNWaL++iI/bvClpWsy1v1N1tY4cDihfFlSZUY=;
        b=Yy7Rhe3Ulv6+8aDzPhnjq8ars5opLsZdPBPg4QPASNTgZluD41Pr1a5dUpMMuYDrbX
         6Nf99QGF3wJxNE1KXvcyr3tUCNMTIqHxBYx2Oe87FzCgaASxf7XqhAWQUGhHcOkl5nhs
         Af2XWDULznCLdlSmeVNIXqIe0Lish6YaeY3HCy4CN7Q6C0fSLl3dBEAMwyXFezQ1aAUp
         Gnc2z3ZNyK0NnsFCeb5va007b/upr3xQmCNx98mhpeJ5BLfpSJyw/b6tVAVOXnDVHvTD
         ZsSOL0ugKjd/zZt7K3Ms+sc9eQ4P3FAFcZufgNv6CfmYDdaI6ICAJVWK28d/0qcw14bQ
         AfJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783482512; x=1784087312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlYVhTpuSXBFBCVpK4CRi4WSbdQhavkfuYahY6d8jN4=;
        b=ICsWW5H9wXjOWXlH5dP8v6S2rpKGXyPCXJQ5Zw63JfO6fMXQJGjjnPzXwr7s4PfDAj
         cwGYiK0yOrDrdG2K4s/Llzq1z382K8O4uNmhiF/OAl+02KYteQEY9/3Hg6vPtXN7iRWQ
         IJqzuALzWY8PDcur88isXYU/HqA44yQsVsNOWt0VlUph3Kryx/TDvMqZkD4f3SLcc27y
         QRMfGlQT8Kcdq3S8bm8eOmZXOs7Hu9CZJjFd6WUEjpVWKxPHrPU8CCo+5t30iVGalamX
         WloFXksQD0fj9OWnp3LrRfXgKwPQh293uC833VHQgsHqhCX5bz6/txMY+oFiSxwwGiG8
         xQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783482512; x=1784087312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlYVhTpuSXBFBCVpK4CRi4WSbdQhavkfuYahY6d8jN4=;
        b=pVzBiN9SGk9A9yvpAfpzvpnuw1iAfTMYRumZ0DzkM7utt3N2UWqy72AOSdYJUwHBhi
         03o4HY4llAgm158Zle/TAk7GdtZWJ+kzK8YBCAc7duSlQy2ObeyF7+oFO/NqItsIhYz4
         qtQUx9hdoU/mMz+QfAkLUf2VYSuqsw/9QiHddoN7Z3FIzMCQDl86KYb7scBPbkLylPLW
         Rh4tgf0TUSru60qyRa3SeGpBBvJUnVhGkARwmBPBjmMzNia6ZrawbXWUnEG74Ut3e3wc
         m7ht5nRx4he1WwRK0dMuYQV1qNIfvzbHwqvmcu6NnDa6a02ELmROZnj2G3mUCjoAJYwO
         dJAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoY8Gho39/nrav8l44tRhW8vVzUSWScEgz4C5slIRF8eGJvHETJLWQafPx9BxTYtn+XBVBK2wkF75PfzJHpaEIzaNE9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4qJ1+O+XKC0UVebU6aa7A3WaKjwzEdTWwJpwgBggymY/ejERR
	1un7EDIkqY0MtVVyIOzWonyIpqEPZuwfumA9mF825Yrdm8AuozJbtW4NuEniPrusKbMt/xVCMvI
	DZFVow7AuBdmJOKJ276ot/dT91WH9mvk=
X-Gm-Gg: AfdE7cnRRPgc8TjinEfmd8Rh5eLrZ1jN2iw8MFacOvXg14qfbo/BGEzZr5aREdNF2jZ
	giBC2IXqf8EDEGt4O4LTXXkVWU2Fe/SBjwADqgOM/az8sCSfk0MPh34BDbLd9SQcuKlHldQx3de
	Njv8jfP/otu+fXnRyaX9LGXf6TImJA59LaeRqhyivSbzxDHu8Qu99cgy9EUf90+l6gCgc1mRPyx
	iVIlZz4HWGtY96kD1Sr9Ss7+qAoE40vmT773lpNoFMWoH4VUjRlztYpCY1brdtioAPbfQ==
X-Received: by 2002:a05:6512:448c:b0:5aa:123d:b755 with SMTP id
 2adb3069b0e04-5b01147b2b4mr128991e87.28.1783482511634; Tue, 07 Jul 2026
 20:48:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613225736.30906-1-vishnuocv@gmail.com> <2c7578ec-432e-e77c-c19f-668e2edc1733@linux.intel.com>
In-Reply-To: <2c7578ec-432e-e77c-c19f-668e2edc1733@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Wed, 8 Jul 2026 12:47:55 +0900
X-Gm-Features: AVVi8Cemvgn3bTbxH74c93Id1sp7tpzHP77f6z97KkfxlolYfE-WmyzbYFIlcKs
Message-ID: <CABxCQKuuDNVRE0DZMVycPG6x=4q0sjEhijx0Rq75bw7HbpFRDw@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, skhan@linuxfoundation.org, corbet@lwn.net, 
	hmh@hmh.eng.br, Hans de Goede <hansg@kernel.org>, derekjohn.clark@gmail.com, 
	LKML <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
	linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Thanks for the review.

Thanks,
Vishnu

On Tue, Jul 7, 2026 at 10:32=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sun, 14 Jun 2026, Vishnu Sankar wrote:
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
> > Changes since v2:
> > - Move usbc_security_enabled out of tp_features bitfield to a bool
> >   member of tp_features to avoid unsafe concurrent bitfield RMW;
> >   usbc_security_supported remains a bitfield as it is init-only.
> > - Pass &tp_features.usbc_security_enabled directly to
> >   usbc_security_query() removing the local bool intermediary
> >   in both init and hotkey paths.
> > - Remove extra blank line before */ in block comment.
> > - Fix kerneldoc Returns: syntax and rewrite return value description
> >   to match the int return type.
> > - Split ternary return into two separate if statements for clarity
> >
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
> >  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 116 ++++++++++++++++++
> >  2 files changed, 140 insertions(+)
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
> > index e1cee42a1683..59b485a57ffe 100644
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
> > +     TP_HKEY_EV_USB_C_SECURITY       =3D 0x131e, /* USB C Security (Fn=
+U, Fn+S) */
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
> > +     bool usbc_security_enabled;
> >       struct quirk_entry *quirks;
> >  } tp_features;
> >
> > @@ -11265,6 +11270,110 @@ static struct ibm_struct hwdd_driver_data =3D=
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
> > + */
> > +
> > +/* USCS() return word bit layout */
> > +#define USCS_CAP_BIT         BIT(16) /* capability: feature present on=
 SKU */
> > +#define USCS_STATUS_BIT              BIT(0)  /* current security state=
 */
> > +
> > +static DEFINE_MUTEX(usbc_security_mutex);
>
> Please add a comment to document what the lock protects.
Will add a comment to document what the lock protects:

/* Protects USCS() ACPI method calls in usbc_security_query() */
static DEFINE_MUTEX(usbc_security_mutex);

Will send v4 with this addressed.
>
> > +
> > +/**
> > + * usbc_security_query - read current USB-C security state via USCS()
> > + * @enabled: out - true when security is ON (data connections blocked)
> > + *
> > + * Returns:
> > + *   0        success, @enabled contains the current state
> > + *  -EIO      ACPI evaluation failed
> > + *  -ENODEV   capability bit absent; feature not present on this SKU*
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
> > +     int err;
> > +
> > +     err =3D usbc_security_query(&tp_features.usbc_security_enabled);
> > +     if (err =3D=3D -ENODEV)
> > +             return 0;
> > +     if (err)
> > +             return err;
> > +
> > +     tp_features.usbc_security_supported =3D true;
> > +     return 0;
> > +}
> > +
> > +/* tpacpi_usbc_security_hotkey - handle Fn+U Fn+S hotkey (0x131e) */
> > +static bool tpacpi_usbc_security_hotkey(void)
> > +{
> > +     if (!tp_features.usbc_security_supported)
> > +             return false;
> > +
> > +     if (usbc_security_query(&tp_features.usbc_security_enabled))
> > +             return false;
> > +
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
> > @@ -11325,6 +11434,7 @@ static const struct attribute_group *tpacpi_gro=
ups[] =3D {
> >       &dprc_attr_group,
> >       &auxmac_attr_group,
> >       &hwdd_attr_group,
> > +     &usbc_security_attr_group,
> >       NULL,
> >  };
> >
> > @@ -11479,6 +11589,8 @@ static bool tpacpi_driver_event(const unsigned =
int hkey_event)
> >       case TP_HKEY_EV_PROFILE_TOGGLE2:
> >               platform_profile_cycle();
> >               return true;
> > +     case TP_HKEY_EV_USB_C_SECURITY:
> > +             return tpacpi_usbc_security_hotkey();
> >       }
> >
> >       return false;
> > @@ -11930,6 +12042,10 @@ static struct ibm_init_struct ibms_init[] __in=
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


--=20

Regards,

      Vishnu Sankar
