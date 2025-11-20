Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EEB349AF5
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648950; cv=none; b=uhmzMWwUXry7PZlivNGf1kMxZ7uYT2FefM07Qi1Hbi5a70Sszc4MNz68yb+BC8ZJBR2pOPGPQs6fZNYGE8dd4GUSsM0/kc04ECUQw6l6adHsTiro8I4AAJSE6nacEMOe25KY7+49vKe55LNNjn8YO7biFwV19Rxx4LcLvtVqoDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648950; c=relaxed/simple;
	bh=y9T5W3mZuIgccMZKYEybLuo1DVoNqauScMiQFkdcj+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppFNbKXjAo37nkj9GhOSaUJJy5L8QCdFZ2Xr0l7VEE1B72WeyYTkxzW2B2VMnpqca4YqiZ18WTm/r7HG1EJuQpAuS0VIe6PrPenvIb+SFwweOuFSUYLH3WcVpe6Sm7UCG1zUTaSRJjWHw53t5QqZXNGA3K1MUxsyNnSdhRUl7FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=jKSqsdfy; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="jKSqsdfy"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id C81685E510
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 16:29:07 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id B0C125E531
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 16:29:06 +0200 (EET)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B0CBB1FE176
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 16:29:05 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763648945;
	bh=t4VoVkGuW8Juro1IA3AkGhUa+8HOMn2XjW10FQnJfA8=;
	h=Received:From:Subject:To;
	b=jKSqsdfyIZOyhSe6d29mfpoggOezEFadWxX7/xmYEOEInsTaTFgNHyH8chN3jffOq
	 ynlWeBcAWAlFsaedaAR8EcdMSYjsCB+RgOSpgB2QTXdPCYmTv1pDKRNFzdCOHqT1qR
	 vNELhiCxESkWaJA7Ni1z9Dy49FeXAW0a70eOv+RCcNlSpgofCERuvJS2r42eHZKWf0
	 iSsyCUachwwdYYCZFf+kDD7kQeqLDamgg9iO9feyiJJFBecqDSqkgB5J2tM9F8OYXH
	 2TjTSYilPa6LBuMU/LemXcnr1Uew4JJHE7wqus+RD3g4I4lK1upSxZ2Jp1pNcbMlGs
	 w7oTDi3jaClpw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.178) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f178.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-37ba5af5951so9995591fa.1
        for <platform-driver-x86@vger.kernel.org>;
 Thu, 20 Nov 2025 06:29:05 -0800 (PST)
X-Gm-Message-State: AOJu0YxmPEDSDt5P4x+aTGh7NZIn07Bn+430HOdvwCkVtvhIcW9j02pz
	8ulYtkenRzPQxqyLLUQtrQpLrF7E2EiUeLIcbUtnZpKx0vRgutE7Pn/jHFGLxxngfniexVSLCr4
	mjo87g7Qj0ZO1KlJD/lk8vNgJJY9GNII=
X-Google-Smtp-Source: 
 AGHT+IHR70YXT5oFejeYarVO0au0IptD4dKyY1rABeYNj/2QqX6OtLq38kNROZHdJY6m9BlO3Ku9SrCRUEpT+iTYE3I=
X-Received: by 2002:a2e:8649:0:b0:37a:39fb:b2f1 with SMTP id
 38308e7fff4ca-37cc67964b8mr9146131fa.27.1763648945272; Thu, 20 Nov 2025
 06:29:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-5-lkml@antheas.dev>
 <967761fb-3f55-4d51-be0b-23ad03258eff@gmail.com>
In-Reply-To: <967761fb-3f55-4d51-be0b-23ad03258eff@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 20 Nov 2025 15:28:52 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF6wegwHy=W1zaTEVksQYaw4L7V27w2aaZBMMoDjUjRYg@mail.gmail.com>
X-Gm-Features: AWmQ_bnO2IaCIhmepM-mEPflsc5g6fnmKZJEcEL8sb9r806gpilgaZLUTk5rHuY
Message-ID: 
 <CAGwozwF6wegwHy=W1zaTEVksQYaw4L7V27w2aaZBMMoDjUjRYg@mail.gmail.com>
Subject: Re: [PATCH v9 04/11] HID: asus: fortify keyboard handshake
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176364894593.2686095.3107960588882806970@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 20 Nov 2025 at 15:15, Denis Benato <benato.denis96@gmail.com> wrote:
>
>
> On 11/20/25 10:46, Antheas Kapenekakis wrote:
> > Handshaking with an Asus device involves sending it a feature report
> > with the string "ASUS Tech.Inc." and then reading it back to verify the
> > handshake was successful, under the feature ID the interaction will
> > take place.
> >
> > Currently, the driver only does the first part. Add the readback to
> > verify the handshake was successful. As this could cause breakages,
> > allow the verification to fail with a dmesg error until we verify
> > all devices work with it (they seem to).
> >
> > Since the response is more than 16 bytes, increase the buffer size
> > to 64 as well to avoid overflow errors.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/hid-asus.c | 32 +++++++++++++++++++++++++++++---
> >  1 file changed, 29 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 6de402d215d0..5149dc7edfc5 100644
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
> > @@ -394,14 +394,40 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
> >
> >  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
> >  {
> > +     /*
> > +      * The handshake is first sent as a set_report, then retrieved
> > +      * from a get_report. They should be equal.
> > +      */
> >       const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
> >                    0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> > +     u8 *readbuf;
> >       int ret;
> >
> >       ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
> > -     if (ret < 0)
> > -             hid_err(hdev, "Asus failed to send init command: %d\n", ret);
> > +     if (ret < 0) {
> > +             hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> I see my suggestion to use __free here didn't materialize in code using
> it even after Ilpo kindly wrote how to correctly use it.
>
> I think you can move the readbuf assignment right below buf and
> take into account what Ilpo said.
>
> I don't expect new variables will be added here ever again,
> but I agree with Ilpo that it's a good idea here to write code
> accounting for that possibility.
>
> It is my understanding that who proposes patches is expected to
> resolve discussions when changes are proposed or to take into
> account requested changes and submit a modified version.

It was ambiguous. I interpreted Ilpo's email as a dismissal

I will try to incorporate it if I do another revision. Although I do
not think it improves things in this case as the function does not
have multiple return statements.

> > +     if (!readbuf)
> > +             return -ENOMEM;
> > +
> > +     ret = hid_hw_raw_request(hdev, report_id, readbuf,
> > +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> > +                              HID_REQ_GET_REPORT);
> > +     if (ret < 0) {
> > +             hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> > +     } else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> > +             hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
> > +                     FEATURE_KBD_REPORT_SIZE, readbuf);
> > +             /*
> > +              * Do not return error if handshake is wrong until this is
> > +              * verified to work for all devices.
> > +              */
> > +     }
> >
> > +     kfree(readbuf);
> >       return ret;
> >  }
> >
>

