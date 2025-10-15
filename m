Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2947231D731
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760527142; cv=none; b=NSBtAHLRZyMV30/ujhvzvOpPsqlGk/Rx5ugIuOOtiqEFBHsRAfk/cguHzY8P8bRZ/bWnaI75RJbB9FI8d0IIn5jZh9oKXo8S5+zTYdIlhSoQ2JmkqhDeEfF4CwdzTUCLVfS/CGxbozSPiWi0iiVHjqrOC7QyI5gnrrvxuJvLn+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760527142; c=relaxed/simple;
	bh=yj5AnPrxT5XFETcS5BhC+/RR39841AKWnwThRBY+xC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fG1tcgn80c7DxwgaCkLH+vFpHaKjvtvW134F7cstiNMAPZ4Mmm4ZKyhkrZ9+0Ro3ReuO7F0Riw0lxoKTnYrSPMK690LFOwLzgJeurZOiF/WV4J05/8siRrXuMqfWaI/o+IV2W7mF3YLa1hythDi3T1+L80qp4rlieM9ViqNPlc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=D4pubGjT; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="D4pubGjT"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 96B9AC7397
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 14:18:57 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id ADFD0C734E
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 14:18:56 +0300 (EEST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id E77B4200BB1
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 14:18:55 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760527136;
	bh=UkiI2ZsGihYBWOkUgXP0CuqOxH7rRFPIOzIv/oYbijg=;
	h=Received:From:Subject:To;
	b=D4pubGjT2pQ7K9I12U41/iDuqZ/8nnzHL3wJY6sKMhwe2u3qoz++YKgxcW1rIaJSP
	 ioBQq/BSBf5+AywWYtGqVhAdtGJBwelo3ZslKGi7cww6btINZNPj+JUDNIhuxOeHxP
	 lduslEVBmxogegZ4Y9fUnM+HtbTYZAjZBCXHEG57OZm59JXq71wpkCAZ9nW/1jhVHy
	 tvZPT9bbVlpIlO11iDsrfy+Ta3olT6Qlx51GpMEv2FdSDM0E8coHilqiyzpe7E0xO3
	 XROIAM69ztOyFjdlt6JMK+vrO7En7lpEC+yVIQA+vk7P1r5vQo2M2AHAXdEU9lguv+
	 PEFmOS8U+uflA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.167.53) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f53.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-58affa66f2bso6848761e87.1
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 15 Oct 2025 04:18:55 -0700 (PDT)
X-Gm-Message-State: AOJu0YyDtO79U5azUivzSccGZpld49UzxmevVdAkuP+oPdlXipgkjDBa
	HCXkIM1LgtWBXx5rddTe9f7Is0++dk0CabzjwTUpqjFddSIXClC6Igb6jvbdnQq+QDBm3ryHtBC
	bszUm6KuvpuG55vSwlbLT4N8dRMI/I3Q=
X-Google-Smtp-Source: 
 AGHT+IFmHw+c7yr4ZTmfF0Pk/AgUgsYD/YIc62Sxu0KFfQCvaWmGYjNBpuYEizHHp6K/c15Qi/0o6/rgC5bSzimh1hI=
X-Received: by 2002:a2e:bc15:0:b0:36b:2bde:a016 with SMTP id
 38308e7fff4ca-37609cf7ea1mr79014611fa.2.1760527135429; Wed, 15 Oct 2025
 04:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013201535.6737-1-lkml@antheas.dev>
 <20251013201535.6737-2-lkml@antheas.dev>
 <3d59f42f-2e24-6011-23b5-369be7eb4b3b@linux.intel.com>
In-Reply-To: <3d59f42f-2e24-6011-23b5-369be7eb4b3b@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 15 Oct 2025 13:18:44 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwF+LfL1AhR3PLJWLzF1iriohWFJRmRkHC6uwgfTnhZFaw@mail.gmail.com>
X-Gm-Features: AS18NWD_VWjax_OfWl7-j20ZEZZ8yowjbqG-xMqTB2JCtSjC8bhttFGoOAbsLoI
Message-ID: 
 <CAGwozwF+LfL1AhR3PLJWLzF1iriohWFJRmRkHC6uwgfTnhZFaw@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] HID: asus: refactor init sequence per spec
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176052713620.1578208.4725276728555192570@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 15 Oct 2025 at 12:53, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 13 Oct 2025, Antheas Kapenekakis wrote:
>
> > Currently, asus_kbd_init() uses a reverse engineered init sequence
> > from Windows, which contains the handshakes from multiple programs.
> > Keep the main one, which is 0x5a (meant for brightness drivers).
> >
> > In addition, perform a get_response and check if the response is the
> > same. To avoid regressions, print an error if the response does not
> > match instead of rejecting device.
>
> I'm none the wiser on "why?" question after reading all this. Please
> describe the change properly. **Besides, you do many thing changes which =
are
> not mentioned here at all.**

Changes in asus_kbd_register_leds look bigger than they are due to
un-indenting and merging the if/else for non-nkey/nkey.

I will update the text of the new patch to include the changes which
are 1) applying asus_kbd_get_functions to NKEY devices to check for
backlight, 2) removing 0x5d/0x5e initialization from NKEY devices
(0x5d is for armoury crate/0x5e for an aura matrix creator studio
thing), which then means that the if/else blocks are equivalent and
can be merged.

These two changes should not affect functionality, other than reduce
some init commands.

> And what "spec" is the one you mention in the shortlog?
>
> > Then, refactor asus_kbd_get_functions() to use the same ID it is called
> > with, instead of hardcoding it to 0x5a so that it may be used for 0x0d
> > in the future.
>
> Can this be in own patch?

I will spin this into three patches and reword. One for each paragraph
in the current commit body.

Ack on the rest.

> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/hid-asus.c | 91 ++++++++++++++++++++++--------------------
> >  1 file changed, 48 insertions(+), 43 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index a444d41e53b6..d0c783df99bc 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >  #define FEATURE_REPORT_ID 0x0d
> >  #define INPUT_REPORT_ID 0x5d
> >  #define FEATURE_KBD_REPORT_ID 0x5a
> > -#define FEATURE_KBD_REPORT_SIZE 16
> > +#define FEATURE_KBD_REPORT_SIZE 64
> >  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> >  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
> >
> > @@ -393,14 +393,37 @@ static int asus_kbd_set_report(struct hid_device =
*hdev, const u8 *buf, size_t bu
> >
> >  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
> >  {
> > -     const u8 buf[] =3D { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x5=
4,
> > -                  0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00=
 };
> > +     /*
> > +      * The handshake is first sent as a set_report, then retrieved
> > +      * from a get_report. They should be equal.
> > +      */
> > +     const u8 buf[] =3D { report_id, 0x41, 0x53, 0x55, 0x53, 0x20,
> > +             0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x0=
0 };
>
> Why was layout of this changed?
>
> > +     u8 *readbuf;
> >       int ret;
> >
> >       ret =3D asus_kbd_set_report(hdev, buf, sizeof(buf));
> > -     if (ret < 0)
> > -             hid_err(hdev, "Asus failed to send init command: %d\n", r=
et);
> > +     if (ret < 0) {
> > +             hid_err(hdev, "Asus failed to send handshake: %d\n", ret)=
;
> > +             return ret;
> > +     }
> > +
> > +     readbuf =3D kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> > +     if (!readbuf)
> > +             return -ENOMEM;
> > +
> > +     ret =3D hid_hw_raw_request(hdev, report_id, readbuf,
> > +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REP=
ORT,
> > +                              HID_REQ_GET_REPORT);
> > +     if (ret < 0) {
> > +             hid_err(hdev, "Asus failed to receive handshake ack: %d\n=
", ret);
> > +     } else if (memcmp(readbuf, buf, sizeof(buf)) !=3D 0) {
> > +             hid_warn(hdev, "Asus handshake returned invalid response:=
 %*ph\n",
> > +                     FEATURE_KBD_REPORT_SIZE, readbuf);
> > +             // Do not return error if handshake is wrong to avoid reg=
ressions
>
> This driver so far is using only /* */ comments.
>
> > +     }
> >
> > +     kfree(readbuf);
> >       return ret;
> >  }
> >
> > @@ -422,7 +445,7 @@ static int asus_kbd_get_functions(struct hid_device=
 *hdev,
> >       if (!readbuf)
> >               return -ENOMEM;
> >
> > -     ret =3D hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
> > +     ret =3D hid_hw_raw_request(hdev, report_id, readbuf,
> >                                FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REP=
ORT,
> >                                HID_REQ_GET_REPORT);
> >       if (ret < 0) {
> > @@ -638,50 +661,32 @@ static int asus_kbd_register_leds(struct hid_devi=
ce *hdev)
> >       unsigned char kbd_func;
> >       int ret;
> >
> > -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> > -             /* Initialize keyboard */
> > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> > -             /* The LED endpoint is initialised in two HID */
> > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> > -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > -                     ret =3D asus_kbd_disable_oobe(hdev);
> > -                     if (ret < 0)
> > -                             return ret;
> > -             }
> > -
> > -             if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> > -                     intf =3D to_usb_interface(hdev->dev.parent);
> > -                     udev =3D interface_to_usbdev(intf);
> > -                     validate_mcu_fw_version(hdev,
> > -                             le16_to_cpu(udev->descriptor.idProduct));
> > -             }
> > +     ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > +     if (ret < 0)
> > +             return ret;
> >
> > -     } else {
> > -             /* Initialize keyboard */
> > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > -             if (ret < 0)
> > -                     return ret;
> > +     /* Get keyboard functions */
> > +     ret =3D asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPOR=
T_ID);
> > +     if (ret < 0)
> > +             return ret;
> >
> > -             /* Get keyboard functions */
> > -             ret =3D asus_kbd_get_functions(hdev, &kbd_func, FEATURE_K=
BD_REPORT_ID);
> > +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > +             ret =3D asus_kbd_disable_oobe(hdev);
> >               if (ret < 0)
> >                       return ret;
> > +     }
> >
> > -             /* Check for backlight support */
> > -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> > -                     return -ENODEV;
> > +     if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> > +             intf =3D to_usb_interface(hdev->dev.parent);
> > +             udev =3D interface_to_usbdev(intf);
> > +             validate_mcu_fw_version(
> > +                     hdev, le16_to_cpu(udev->descriptor.idProduct));
> >       }
> >
> > +     /* Check for backlight support */
> > +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> > +             return -ENODEV;
> > +
> >       drvdata->kbd_backlight =3D devm_kzalloc(&hdev->dev,
> >                                             sizeof(struct asus_kbd_leds=
),
> >                                             GFP_KERNEL);
> >
>
> --
>  i.
>
>

