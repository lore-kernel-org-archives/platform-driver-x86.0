Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852F4175A77
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 00:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779757137; cv=pass; b=u3soYui9VPg0hclkFyqipUzBSrfAxT3S/mMQhZzlWTe8aSUIv/QR8AZkW810zESePsV7fMcFgbncJFE2cTrhOnsZzKMQutjOjHG11Y7dDolQycouNCmAYMuugpd6wztF6aDzptmno7CFd7VWVdtFf6ezO+TpKRFgOs+heaBhhi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779757137; c=relaxed/simple;
	bh=35lRTWUoKZja/3WFw+xwXqCU9qXFz7dqwJWDoPP03cA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YujfZ+7ZDW64mW6z7w5SBx5L2lDoGbc4SrmJst4MIPKNGjnqc50K6RikxVLFG4RFJ34y7KBRlm77T9FN9YH+Wzqk2oS4r22EblAo+/RuibidMPm8qjl659QEMrCTigXoOurgMkuJkKi1jG6nJ0ONHJpjq7yy+plxqoS7QKN3ugo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUzj+jgJ; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUzj+jgJ"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-393a44854d2so88667081fa.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 17:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779757133; cv=none;
        d=google.com; s=arc-20240605;
        b=EBs4MjMKIsd7yaHCI9XdpDuXKcFGnIXcHl6L5/YXAWqqOJMdMLsBq9vnWb68y8cbV0
         LWTjchzREt0rmAEfiJHWIOwN2PMrDt8GBj3IFUxeS8y+zGfQxOuYmxvL8zclvYobP/Z7
         P0O7RMsaGpzlwxGkjfezr7uif4rm6+epTvLWpN2JECEMOsVSVxmVnKB5tVvof1APqS4T
         80bphZJ/kmLQFWdn988jbYbTqKdesJ8TBOlBghI7p1/n1kskvPZaCGiF/unCNdKWp6IU
         vGGgp9LtkVEaJa5Au5ROe430gDb7RyIUpKiiqyoL6BYFvXz5KcTS3Nd5F8cF5TC6FW+S
         8LsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hU/a8U6/8PCG5iyhBekkPg6xRf0oiS0RAJVmmodueZU=;
        fh=4VD231rTaIK9OnNgAMTwsvZ2fTFr5zVSTZgfVikYkQY=;
        b=JMJ5IHPrMu3oUrQpmRqa6S2dwNzvGuEwNwbTVc7n0g3iFB+eFdJmT3F/Gpwrsp4zc0
         vMgTzMzz2e56O4//pNh6JUF2BEMH74C6ciHN4lu1vZNexsHzf2FfmPsRfdn/ZFMsJOgH
         v2L8L6XhFZvPxInTnJBxYWB99vwvzyIWrhxqzgzDygb8Q3ckzRt15K837l5uQjNUaxF1
         L4i4OwbZI0xY1e638lQ6KKjDmIa6SIeNDUYDCp+LxfrFNfY4bBO1T2RMQ7UldAozkmOk
         RJ/8I4YXwKejSKKDDQZzZky5pZFVw92CDgGFPNNWrju9K0X6L6wTgO4EjUbeey5PzV7/
         Jsjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779757133; x=1780361933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hU/a8U6/8PCG5iyhBekkPg6xRf0oiS0RAJVmmodueZU=;
        b=TUzj+jgJ9ZboZ/oQmWukx3rjPmcGu0QBQHgd/Trxr5fcuf5nK3xQUIyasIvG3akmLP
         9gE67YkJu/kL5pLKiuLQ+x0O/coSRswSjUXrHVoT+axYkgSyXJ/F+uZ7cUAxBfIrQcGS
         dMi85qP2CtmNtO2VzgB2TBG/qjCQ0fLjkGAcQOFDOA8wk57En8YgVqndBhpPhYQJaRzV
         y5bw39bbtiSzDtToBIL3XwVcZPUWt0ocAzBP+Nrj7A91oD1FZz2Ldh8QCpXViqX9P3jB
         OQM8ZNX/p2NxPNNfH/5e/Iqkn/0mYY0QoIFxsPVqMRi3dYblwfq7eq587VFjOkNB42Zj
         fFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779757133; x=1780361933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hU/a8U6/8PCG5iyhBekkPg6xRf0oiS0RAJVmmodueZU=;
        b=ZAWkZWSAzUZO9WXaADI0zO774vh+cV0FKMzB+Fc/uinl8UCJf8Qi0xThYd7nUhtzzB
         T9e6+E+qgriO/NeJrNNey4vqyPoWYaSuuv2XajpVAejTwbLuu4s8ndg2l7+/Gwv79cqj
         BP98XX7aHHn3BVu/VFmmtCAHtso8w+XJRLJsk7SAcR0/lIuGp71nu5NLxBZOUQ0h9BY4
         eWipBBL+CSJGvpezy/9toCWt0CGy8mzdhb/lw/CFCS/pMVuWvYhrZseQfhY24wy17wlh
         SQpCiZGHJpjHeDqLl/xLKRXXgXiQP8ObujwbOqP2VrO29dJP3kYpVs9sc9S0ABsXaMms
         udAw==
X-Forwarded-Encrypted: i=1; AFNElJ8Rn/jgA0i47L0mRxfjD551YV+EWh0m2ON72+40vOfBZkDqScH7lkDE+nnxjA1zmx48lluVJF6u3onK4sEllW0OvEmp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsg6XgkjMf176zV84j5MdiZIQw97z+stt0hQlFOb+SgRD3tCzH
	Nu9E9SO3J4RTYk+AepYoeqsHFpIg7yzHWXfFTPUkPDfnW6UFWfXp3wwfsru2OnLuow8L0qQfpbu
	M5JFG8gylYIuQaBfgGpCQMWUZcMb4E+Y=
X-Gm-Gg: Acq92OGSfMbxzQ89h+jY+TfQx3hI95xOh2HSKYhwCnqqeXO0aCb/pi8sv7kIBRHPDFS
	971bGWpPEC3LNsrpGsFqFELEp0i/v6QJEB2Lr+7358fmaHMp7Ab+WDyUIF6kEuIiwNoh7qs/Cf8
	JH1kcXCA2esSjDsAO4y3ITjj070GWuG76fZ38odfXn36tJxfdktgWLW0DIILVRV7UKH3Ampffpb
	zyvlVWIoSwewKihQ0igqXGjq2oyDnE+Y10bMWsBvAVcogTNMSSm631kSXJYdnrCoSl0zHLtz2CX
	qehiaLdzTxNbWu2NY5jJhfJnMw6//Tb8VifFb3cV
X-Received: by 2002:ac2:41c1:0:b0:5a8:8de0:4576 with SMTP id
 2adb3069b0e04-5aa323a9cc5mr4021184e87.25.1779757132412; Mon, 25 May 2026
 17:58:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522100715.20036-1-vishnuocv@gmail.com> <c4c0632b-0a24-8956-9557-69b927e451fb@linux.intel.com>
In-Reply-To: <c4c0632b-0a24-8956-9557-69b927e451fb@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 26 May 2026 09:58:16 +0900
X-Gm-Features: AVHnY4IKZmXqIk91m7pvQY4-gBoPXinMSWynhQ0WG-PLkjI5idkW9rsYIkH6VyI
Message-ID: <CABxCQKuWt-iGENEaC_gNFMfWHrr80zJe_xnwEQz1Q-1yADcDOg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, skhan@linuxfoundation.org, hmh@hmh.eng.br, 
	Hans de Goede <hansg@kernel.org>, corbet@lwn.net, derekjohn.clark@gmail.com, 
	LKML <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
	linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Thank you for the comments.

On Tue, May 26, 2026 at 2:19=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Fri, 22 May 2026, Vishnu Sankar wrote:
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
> >  .../admin-guide/laptops/thinkpad-acpi.rst     |  24 ++++
> >  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 115 ++++++++++++++++++
> >  2 files changed, 139 insertions(+)
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
> > index e1cee42a1683..889db802185a 100644
> > --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > @@ -185,6 +185,7 @@ enum tpacpi_hkey_event_t {
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
> > @@ -373,6 +374,8 @@ static struct {
> >       u32 has_adaptive_kbd:1;
> >       u32 kbd_lang:1;
> >       u32 trackpoint_doubletap_enable:1;
> > +     u32 usbc_security_supported:1;
> > +     u32 usbc_security_enabled:1;
> >       struct quirk_entry *quirks;
> >  } tp_features;
> >
> > @@ -11265,6 +11268,111 @@ static struct ibm_struct hwdd_driver_data =3D=
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
> > + * false otherwise (feature absent or ACPI call failed).
> > + */
> > +static bool usbc_security_query(bool *enabled)
> > +{
> > +     int status;
> > +
> > +     mutex_lock(&usbc_security_mutex);
> > +     if (!acpi_evalf(hkey_handle, &status, "USCS", "dd", 0)) {
> > +             mutex_unlock(&usbc_security_mutex);
> > +             return false;
> > +     }
> > +     mutex_unlock(&usbc_security_mutex);
>
> Please use cleanup.h.
Will do.
Will replace the manual mutex_lock/unlock pattern with guard(mutex).
>
> > +
> > +     if (!(status & USCS_CAP_BIT)) {
> > +             pr_debug("USCS cap bit absent (raw=3D0x%x)\n", status);
> > +             return false;
> > +     }
> > +
> > +     *enabled =3D !!(status & USCS_STATUS_BIT);
>
> No need to do !! when assigning to bool.
Agreed, will remove the !!.
>
> > +     return true;
> > +}
> > +
> > +/* sysfs: /sys/devices/platform/thinkpad_acpi/usb_c_security ---------=
- */
> > +static ssize_t usb_c_security_show(struct device *dev,
> > +                                struct device_attribute *attr,
> > +                                char *buf)
> > +{
> > +     return sysfs_emit(buf, "%s\n",
> > +                       tp_features.usbc_security_enabled ? "enabled" :=
 "disabled");
>
> Please use string_choices.h.
Will use str_enabled_disabled() which is already used in
thinkpad_acpi.c for similar pattern.
>
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
> > +
> > +     tp_features.usbc_security_supported =3D
> > +             usbc_security_query(&enabled);
>
> Fits to one line.
Acked.
>
> > +     tp_features.usbc_security_enabled =3D enabled;
>
> I'm not sure I follow the logic here as you always seem set it enabled
> disregarding even support or not?
>
> And that hotkey enabling seems deadcode with it already enabled here.
>
> I feel like I must blind to something obvious but cannot just find
> what that would be.
I'm sorry, this is a bug.
I will change to the following:
    tp_features.usbc_security_supported =3D usbc_security_query(&enabled);
    if (tp_features.usbc_security_supported)
        tp_features.usbc_security_enabled =3D enabled;

The hotkey path is not dead code =E2=80=94 it updates usbc_security_enabled
when the user presses Fn+U Fn+S, since the EC firmware toggles the
state and fires the event. The init only captures the state at boot;
subsequent toggles come through the hotkey. Sorry for the confusion in
the init code.
>
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
> > +     if (!usbc_security_query(&enabled))
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
> > @@ -11325,6 +11433,7 @@ static const struct attribute_group *tpacpi_gro=
ups[] =3D {
> >       &dprc_attr_group,
> >       &auxmac_attr_group,
> >       &hwdd_attr_group,
> > +     &usbc_security_attr_group,
> >       NULL,
> >  };
> >
> > @@ -11479,6 +11588,8 @@ static bool tpacpi_driver_event(const unsigned =
int hkey_event)
> >       case TP_HKEY_EV_PROFILE_TOGGLE2:
> >               platform_profile_cycle();
> >               return true;
> > +     case TP_HKEY_EV_USB_C_SECURITY:
> > +             return tpacpi_usbc_security_hotkey();
> >       }
> >
> >       return false;
> > @@ -11930,6 +12041,10 @@ static struct ibm_init_struct ibms_init[] __in=
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

I will update the v2 with all these changes soon, if no further comments.
--=20

Regards,

      Vishnu Sankar
