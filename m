Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4BF13DDAA
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Sep 2024 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725517286; cv=none; b=Ziij9ucFtb0LmXpXxTUvPN2zyGyiQ1sDfEZv9jfC3YUP+k8DGAT6fAkKK9Af/ADhla6eKnrm+AXr/AYWszsfj9r+Wgj5mYwQqTIPdSgtc8H5n8fPPDThHx4Bht2wGibzyfKa3hGY6mz7TcfJqUceupf4ZGfV63VIuUKTnGPU040=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725517286; c=relaxed/simple;
	bh=a3CK8iaCOykrxzj/7UsjxaRwAlWyah712Yy6LNsezJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J86+s/8SIMR+oCl2537AFHBz0+PG70IUGau6zNLGrEh3acuKjBW086jykSMpKxFjREaAZrccUPxOGqLKCt3mCJCaK6Set9FNU6KUexSklNNL3/64yXzKp+xHnpbOrZsUJdTQRKbiBCmV5iB/fTxTyV7W8Vd+FIAytmmxBGRkRHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=TjVV9ECL; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="TjVV9ECL"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3FA9D3F45F
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Sep 2024 06:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1725517279;
	bh=mbmUIVBPF1avSMx1JKXJ9kX4vovDkNTWxLfCkm8vNDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=TjVV9ECLvZ2R96QNB9/dZjfJrjtnjtGSv+M8Omsc7qsswQuWggS2P/Vj5AssN8zwJ
	 /yb0M6Yt4WqadFdUKB3ZmI5T/glbDh+wHO2vrRtz83MWxoladnR0nHA0D3HP4Sn2Qz
	 H5p0Y6yRsS5i12YVyT6iwDHK5hLui2COtZIC53Pv8JILPgI5aRKpoi96AfafcGEoCB
	 ZZCs7q+5fEII7fdo0GBFopbTocxvzWVWHby9JOAws0BEZPUsV+wcAKlVEYDhCcDK2r
	 ECS7oKro85rHgn/bQLYv5a1YSSOMA4RkF61TSr7w6AbNO9J66n50HlWccd/f9x1+QI
	 eEhHXL+iwfOaQ==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5c24e546f3fso419761a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Sep 2024 23:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725517278; x=1726122078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbmUIVBPF1avSMx1JKXJ9kX4vovDkNTWxLfCkm8vNDw=;
        b=Grk9L177D1Apu32Y2awehbJazlYofvnJsMWIT30oPqdjLYlB6NLSWVhUm3Pzgtz8qJ
         kU8RpcuAOtseZnQWRoHxZyTxj0Q364H1gGYCRLfiJ2p80UhBaYr/hub1wo+9d/KDtroA
         OwaTRM1KGOVeLEE6Y0ncF8L0wOTnr977UdonO40MK1jzt7qqI2Zq5UhuUDnaC6Cdwpcp
         8zmIcHjEZ+w0qWUf2lLB9gfHnEWsLTKHNjBMkJkUcCNOHb2S3VNn3izjLAANbm3AnKg6
         fpfhnjSikm5UeTEVvW4C1nRLEe/aVLrxHmV9SExaU5f5tf3OFfk23mnqvK83lims6k3/
         nOoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhniSmCPYBTFhU4MWl4/Ls+Rpw27Q2fhizqDStR6yLlnRRWf3QFxnf+WvtuYXfvfQ642B/ZjBVCiMd1B1k2gYEX10E@vger.kernel.org
X-Gm-Message-State: AOJu0YyopJC1I0DMqXETNfEe75DNu+SqjF6Z6is1iXqqhRxCs0JLnxps
	yRuKP5OlB1layShkFmIjCovUQhUPdpWJv5+E4CAJExo5AdntghZOxWPb/l+nCJRzuWRnJ2NwLzx
	01BKTQaGFauasARqIte8SkzvA6Op4SyEi8dh7kcRqTJB6Qs7CdKedGazKfu4ZIiNR2af84D78Hk
	uElOg53B58+AvnaWEU1DBrDunJ0mxQ1njK+vx7JjmWDnJNX8TEZtYdo39Rx9ZTmg==
X-Received: by 2002:a05:6402:270c:b0:5c2:53a1:c209 with SMTP id 4fb4d7f45d1cf-5c253a1c259mr8985064a12.25.1725517277806;
        Wed, 04 Sep 2024 23:21:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSMtMo2aa9bEuAXrrmcrQmbvDN6XOqnkcQURyv/FmGjhc9B5NljiU6bnI8WOeBvKMxCwUSJWfDSGwlyKHGt1k=
X-Received: by 2002:a05:6402:270c:b0:5c2:53a1:c209 with SMTP id
 4fb4d7f45d1cf-5c253a1c259mr8985021a12.25.1725517277241; Wed, 04 Sep 2024
 23:21:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905042447.418662-1-kai.heng.feng@canonical.com>
 <20240905042447.418662-2-kai.heng.feng@canonical.com> <2024090510-repaying-disrupt-e568@gregkh>
In-Reply-To: <2024090510-repaying-disrupt-e568@gregkh>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 5 Sep 2024 14:21:03 +0800
Message-ID: <CAAd53p6N0PbxP6_ZxCaA7oXM=Buo8=LGxneT7Fs06bCtXL8cYg@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86/hp: Avoid spurious wakeup on HP ProOne 440
To: Greg KH <gregkh@linuxfoundation.org>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jorge.lopez2@hp.com, 
	acelan.kao@canonical.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 1:18=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Thu, Sep 05, 2024 at 12:24:47PM +0800, Kai-Heng Feng wrote:
> > The HP ProOne 440 has a power saving design that when the display is
> > off, it also cuts the USB touchscreen device's power off.
> >
> > This can cause system early wakeup because cutting the power off the
> > touchscreen device creates a disconnect event and prevent the system
> > from suspending:
> > [  445.814574] hub 2-0:1.0: hub_suspend
> > [  445.814652] usb usb2: bus suspend, wakeup 0
> > [  445.824629] xhci_hcd 0000:00:14.0: Port change event, 1-11, id 11, p=
ortsc: 0x202a0
> > [  445.824639] xhci_hcd 0000:00:14.0: resume root hub
> > [  445.824651] xhci_hcd 0000:00:14.0: handle_port_status: starting usb1=
 port polling.
> > [  445.844039] xhci_hcd 0000:00:14.0: PM: pci_pm_suspend(): hcd_pci_sus=
pend+0x0/0x20 returns -16
> > [  445.844058] xhci_hcd 0000:00:14.0: PM: dpm_run_callback(): pci_pm_su=
spend+0x0/0x1c0 returns -16
> > [  445.844072] xhci_hcd 0000:00:14.0: PM: failed to suspend async: erro=
r -16
> > [  446.276101] PM: Some devices failed to suspend, or early wake event =
detected
> >
> > So add a quirk to make sure the following is happening:
> > 1. Let the i915 driver suspend first, to ensure the display is off so
> >    system also cuts the USB touchscreen's power.
> > 2. If the touchscreen is present, wait a while to let the USB disconnec=
t
> >    event fire.
> > 3. Since the disconnect event already happened, the xhci's suspend
> >    routine won't be interrupted anymore.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/platform/x86/hp/hp-wmi.c | 104 ++++++++++++++++++++++++++++++-
> >  1 file changed, 103 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp=
/hp-wmi.c
> > index 876e0a97cee1..80fc3ee4deaf 100644
> > --- a/drivers/platform/x86/hp/hp-wmi.c
> > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > @@ -30,6 +30,9 @@
> >  #include <linux/rfkill.h>
> >  #include <linux/string.h>
> >  #include <linux/dmi.h>
> > +#include <linux/delay.h>
> > +#include <linux/pci.h>
> > +#include <linux/usb.h>
> >
> >  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
> >  MODULE_DESCRIPTION("HP laptop WMI driver");
> > @@ -1708,6 +1711,52 @@ static void __exit hp_wmi_bios_remove(struct pla=
tform_device *device)
> >               platform_profile_remove();
> >  }
> >
> > +static int hp_wmi_suspend_handler(struct device *device)
> > +{
> > +     acpi_handle handle;
> > +     struct acpi_device *adev;
> > +     struct device *physdev;
> > +     struct usb_port *port_dev;
> > +     struct usb_device *udev;
> > +     acpi_status status;
> > +     bool found =3D false;
> > +
> > +     /* The USB touchscreen device always connects to HS11 */
> > +     status =3D acpi_get_handle(NULL, "\\_SB.PC00.XHCI.RHUB.HS11", &ha=
ndle);
> > +     if (ACPI_FAILURE(status))
> > +             return 0;
> > +
> > +     adev =3D acpi_fetch_acpi_dev(handle);
> > +     if (!adev)
> > +             return 0;
> > +
> > +     physdev =3D get_device(acpi_get_first_physical_node(adev));
> > +     if (!physdev)
> > +             return 0;
> > +
> > +     port_dev =3D to_usb_port(physdev);
>
> That's a brave cast, how do you "know" this is this device type?

Assuming the the physical device of "\_SB.PC00.XHCI.RHUB.HS11" is a usb_por=
t.
But yes there's no guarantee.

>
> > +     if (port_dev->state =3D=3D USB_STATE_NOTATTACHED)
> > +             return 0;
> > +
> > +     udev =3D port_dev->child;
> > +
> > +     if (udev) {
> > +             usb_get_dev(udev);
> > +             if (le16_to_cpu(udev->descriptor.idVendor) =3D=3D 0x1fd2 =
&&
> > +                 le16_to_cpu(udev->descriptor.idProduct) =3D=3D 0x8102=
) {
> > +                     dev_dbg(&hp_wmi_platform_dev->dev, "LG Melfas tou=
chscreen found\n");
> > +                     found =3D true;
> > +             }
> > +             usb_put_dev(udev);
> > +
> > +             /* Let the xhci have time to handle disconnect event */
> > +             if (found)
> > +                     msleep(200);
>
> why 200?

A minimal delay that works. We can make it longer too.

>
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static int hp_wmi_resume_handler(struct device *device)
> >  {
> >       /*
> > @@ -1745,7 +1794,7 @@ static int hp_wmi_resume_handler(struct device *d=
evice)
> >       return 0;
> >  }
> >
> > -static const struct dev_pm_ops hp_wmi_pm_ops =3D {
> > +static struct dev_pm_ops hp_wmi_pm_ops =3D {
> >       .resume  =3D hp_wmi_resume_handler,
> >       .restore  =3D hp_wmi_resume_handler,
> >  };
> > @@ -1871,6 +1920,57 @@ static int hp_wmi_hwmon_init(void)
> >       return 0;
> >  }
> >
> > +static int lg_usb_touchscreen_quirk(const struct dmi_system_id *id)
> > +{
> > +     struct pci_dev *vga, *xhci;
> > +     struct device_link *vga_link, *xhci_link;
> > +
> > +     vga =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, NULL);
> > +
> > +     xhci =3D pci_get_class(PCI_CLASS_SERIAL_USB_XHCI, NULL);
> > +
> > +     if (vga && xhci) {
> > +             xhci_link =3D device_link_add(&hp_wmi_platform_dev->dev, =
&xhci->dev,
> > +                                   DL_FLAG_STATELESS);
> > +             if (xhci_link)
> > +                     dev_info(&hp_wmi_platform_dev->dev, "Suspend befo=
re %s\n",
> > +                              pci_name(xhci));
>
> When drivers work properly, they are quiet, was this ment to be
> dev_dbg()?

Sure, will change it to dev_dbg() next revision.

>
> > +             else
> > +                     return 1;
> > +
> > +             vga_link =3D device_link_add(&vga->dev, &hp_wmi_platform_=
dev->dev,
> > +                                        DL_FLAG_STATELESS);
> > +             if (vga_link)
> > +                     dev_info(&hp_wmi_platform_dev->dev, "Suspend afte=
r %s\n",
> > +                              pci_name(vga));
>
> Same here.

Thanks for the review.

Kai-Heng

>
> thanks,
>
> greg k-h
