Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86991182B7
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 21:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675690; cv=none; b=OGkUW06cz2ZP1WyxFqNG1uoYt/qUM4bjppvvN+IiDGNu0ZEUb+C4jIIY/wdrgIFHnNAfQcCATM55KOkPobZKG4xUDP4JM1GHGz4PxhlP10nQ2/qkTtOUtCoAnSr5W+fJDakRb/YjPV790oy4PH86DHETG4Xy0i+zdLKnnFTIBNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675690; c=relaxed/simple;
	bh=nfMO8pUP9Ey5B+YHBoF+agg+SQTz6j9xdJ3R4PUCmXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jBxxLV+XLKkjSZ+miPJqQbysFSzx8Ekipft5kSdBagriJqZnTWdthcPPlbACBmJaufV6ycyV0wernfieh7f9UWWAhZkFYVc0A5HpoXKrwL24borWuItQ4qZlrHYC70o8C2JIZfs7yE5QuNgBXgLNSUoQU+w/MyNt+eYU8P9m15U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=RAJMQHMT; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="RAJMQHMT"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 51F69C5D7F
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 23:54:41 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 98627C5D48
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 23:54:40 +0200 (EET)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 976D3200E53
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 23:54:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763675680;
	bh=/yw/fa3PteFsFrN1xLwNloCfH0V5obbkxZaxM5gP44A=;
	h=Received:From:Subject:To;
	b=RAJMQHMT+oswRgE+NbZqAnZCNmHFAjYOUYS65qcf5XVJeqaWqkD3VRmsLZupJmnkS
	 0ghM9KZodwCdW59pNWZqjpzDSA10m5YRtB74vyhOtnd8EeNJp/xopAcZHpxyEG7puo
	 QpoFd2dIC9yWGOv2OyaxKubHj1KkG4h7zAN9Xw8ufoQz9JSy06Dy3dyjfbyHKjf+TF
	 P9CwHyWcMWRG95DnIucWXaOfmu+1B26+yvQ8j+P1pCivK//XAW47zeFnRp85C+Blhx
	 8GrGW9hja10x1Mun+UCmyKNWP7eBD35bbbaYjAQdjUEfQyu+CZrmD/VA8J0TBFHN7N
	 dyckrVuKYy/Fg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.178) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f178.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-37b996f6b28so11898401fa.3
        for <platform-driver-x86@vger.kernel.org>;
 Thu, 20 Nov 2025 13:54:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXjTLyHJdo7jJLdDRCrTD4KfzK4Y/xW5nzrYGJWfFcHGjOwtdqhRfSw+88kWa5lSOwuy9UEzZGLO2Gr1GBH3n1n6N0t@vger.kernel.org
X-Gm-Message-State: AOJu0YxyCU1xd+aQotgsWQ2s9NIdw02bSUUyP0OaNrc/TWjqcnBCunqf
	0XOhKXFowuEgHsvkEykkCMbnSs873DMNaDu7sW545DrYlfqDFZUnDS6EIo6SHiT52tJm91pnwaQ
	8Hq+2wocL9Avj0jYreej/F+txXZa3BwQ=
X-Google-Smtp-Source: 
 AGHT+IF9hvpa1HsFfWLrTQ6u/i9/ip89gLjUNUcnWnLCv0cUEBAfa/UMeR9EMkoLb1HsYzbf+8AMmIYi301n9PS6QaU=
X-Received: by 2002:a05:651c:239:b0:37a:5bc6:ab9f with SMTP id
 38308e7fff4ca-37cc6797c70mr10108011fa.26.1763675678991; Thu, 20 Nov 2025
 13:54:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-5-lkml@antheas.dev>
 <967761fb-3f55-4d51-be0b-23ad03258eff@gmail.com>
 <CAGwozwF6wegwHy=W1zaTEVksQYaw4L7V27w2aaZBMMoDjUjRYg@mail.gmail.com>
 <04075ef3-3fba-c308-871f-619972ffe5ff@linux.intel.com>
In-Reply-To: <04075ef3-3fba-c308-871f-619972ffe5ff@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 20 Nov 2025 22:54:27 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHSFy6UhbEGBSvYewoFXozd8=MrbpKv5qexeo0yA+4NkQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmrBP8fJB7SIc26H6mb3erCLu569uoPPUKzqGbxjSsVryGq5oQAuETh0_8
Message-ID: 
 <CAGwozwHSFy6UhbEGBSvYewoFXozd8=MrbpKv5qexeo0yA+4NkQ@mail.gmail.com>
Subject: Re: [PATCH v9 04/11] HID: asus: fortify keyboard handshake
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <benato.denis96@gmail.com>,
 platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176367567986.94435.1365348579287569641@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 20 Nov 2025 at 17:41, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 20 Nov 2025, Antheas Kapenekakis wrote:
>
> > On Thu, 20 Nov 2025 at 15:15, Denis Benato <benato.denis96@gmail.com> w=
rote:
> > >
> > >
> > > On 11/20/25 10:46, Antheas Kapenekakis wrote:
> > > > Handshaking with an Asus device involves sending it a feature repor=
t
> > > > with the string "ASUS Tech.Inc." and then reading it back to verify=
 the
> > > > handshake was successful, under the feature ID the interaction will
> > > > take place.
> > > >
> > > > Currently, the driver only does the first part. Add the readback to
> > > > verify the handshake was successful. As this could cause breakages,
> > > > allow the verification to fail with a dmesg error until we verify
> > > > all devices work with it (they seem to).
> > > >
> > > > Since the response is more than 16 bytes, increase the buffer size
> > > > to 64 as well to avoid overflow errors.
> > > >
> > > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > > ---
> > > >  drivers/hid/hid-asus.c | 32 +++++++++++++++++++++++++++++---
> > > >  1 file changed, 29 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > > > index 6de402d215d0..5149dc7edfc5 100644
> > > > --- a/drivers/hid/hid-asus.c
> > > > +++ b/drivers/hid/hid-asus.c
> > > > @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPa=
d");
> > > >  #define FEATURE_REPORT_ID 0x0d
> > > >  #define INPUT_REPORT_ID 0x5d
> > > >  #define FEATURE_KBD_REPORT_ID 0x5a
> > > > -#define FEATURE_KBD_REPORT_SIZE 16
> > > > +#define FEATURE_KBD_REPORT_SIZE 64
> > > >  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> > > >  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
> > > >
> > > > @@ -394,14 +394,40 @@ static int asus_kbd_set_report(struct hid_dev=
ice *hdev, const u8 *buf, size_t bu
> > > >
> > > >  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
> > > >  {
> > > > +     /*
> > > > +      * The handshake is first sent as a set_report, then retrieve=
d
> > > > +      * from a get_report. They should be equal.
> > > > +      */
> > > >       const u8 buf[] =3D { report_id, 0x41, 0x53, 0x55, 0x53, 0x20,=
 0x54,
> > > >                    0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, =
0x00 };
> > > > +     u8 *readbuf;
> > > >       int ret;
> > > >
> > > >       ret =3D asus_kbd_set_report(hdev, buf, sizeof(buf));
> > > > -     if (ret < 0)
> > > > -             hid_err(hdev, "Asus failed to send init command: %d\n=
", ret);
> > > > +     if (ret < 0) {
> > > > +             hid_err(hdev, "Asus failed to send handshake: %d\n", =
ret);
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     readbuf =3D kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> > > I see my suggestion to use __free here didn't materialize in code usi=
ng
> > > it even after Ilpo kindly wrote how to correctly use it.
> > >
> > > I think you can move the readbuf assignment right below buf and
> > > take into account what Ilpo said.
> > >
> > > I don't expect new variables will be added here ever again,
>
> It's also about always doing the right thing so others will pick up the
> pattern (for the cases when it's needed).
>
> > > but I agree with Ilpo that it's a good idea here to write code
> > > accounting for that possibility.
> > >
> > > It is my understanding that who proposes patches is expected to
> > > resolve discussions when changes are proposed or to take into
> > > account requested changes and submit a modified version.
> >
> > It was ambiguous. I interpreted Ilpo's email as a dismissal
>
> I tried to explain how to use it, not to suggest cleanup.h shouldn't be
> used.

Ok, I'll wait a few days and do another revision, doing some rewording
as well. Hopefully that will cover everything. To that extent, try to
finish reviewing the latter part of the series before that revision.

I'm a bit concerned with introducing kfree here because I do not know
how to use it and it might regress, but it should be ok.

I'd rather push the init down instead of pulling it up. Referencing
other code samples for kfree it is acceptable to push the variable
definition down, right?

Antheas

> > I will try to incorporate it if I do another revision. Although I do
> > not think it improves things in this case as the function does not
> > have multiple return statements.
> >
> > > > +     if (!readbuf)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     ret =3D hid_hw_raw_request(hdev, report_id, readbuf,
> > > > +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE=
_REPORT,
> > > > +                              HID_REQ_GET_REPORT);
> > > > +     if (ret < 0) {
> > > > +             hid_err(hdev, "Asus failed to receive handshake ack: =
%d\n", ret);
> > > > +     } else if (memcmp(readbuf, buf, sizeof(buf)) !=3D 0) {
> > > > +             hid_warn(hdev, "Asus handshake returned invalid respo=
nse: %*ph\n",
> > > > +                     FEATURE_KBD_REPORT_SIZE, readbuf);
> > > > +             /*
> > > > +              * Do not return error if handshake is wrong until th=
is is
> > > > +              * verified to work for all devices.
> > > > +              */
> > > > +     }
> > > >
> > > > +     kfree(readbuf);
> > > >       return ret;
> > > >  }
> > > >
> > >
> >
>
> --
>  i.
>
>

