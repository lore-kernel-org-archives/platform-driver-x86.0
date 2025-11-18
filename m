Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7DA315767
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 23:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763509605; cv=none; b=haXV0JRy0h8gzSC8IqKmuoqg8iEDcay4ufEcd/WtMXlIWSVf1nrEu1XYMCaAMUc4AIFIrmuB+4uvfFFcG0qVE0wYgcqBj2lwaScAV6Fn0EZH0CUbDJ5m3YiZF4EmwRPBPWq4kx5+RkP/oW2PpqnZpqVtofOkkYj5l8LY01oY3f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763509605; c=relaxed/simple;
	bh=Y81iAgwGzd6F0tM2YJ9kwTo44xHD+hJ38WYbaWW96lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eOBpWI0l4ZopS3itD+Skqku084rxNUd0xOFbKvYgHfwWEbObfjmXYmtykEddWNwjWdDxCMp+u2kaf+7A7l40BgT7B/U16R1RCwefnHqtBxmc5KPc21pb7TgS97k0UdWEqfgftOOWux1BKw/uss/Q7h0RQQFQz4AcjpAnNGtFyBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=UrG7xH6E; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="UrG7xH6E"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id F08BCBD7E3
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 01:46:33 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 668A2BD9E5
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 01:46:33 +0200 (EET)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C7B48201E91
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 01:46:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763509593;
	bh=KoENTDO5p3S1g1mgVozMSsgTw57pzVWf7oZ7ZONvhVU=;
	h=Received:From:Subject:To;
	b=UrG7xH6EUSrQWUuXzlDJ0h45cMpe/CrLUab2Xh22hc4dUlJx6mM3Nm1FjGCaSV5J1
	 LAkOjw+RWf9oOKxWzEvudRePJizjhsQ/rfCx5CqHlDIl4+3Khgf4sEyo/Pb07HwQg0
	 ocOw3K+1opqAen3mbO2EDUc863VFA1lE04O7Z1X/i4LvSRq2vNSCDTHNTKBN3mpD1m
	 Irb9p2tipWJnJHhd8QuLL3nnVFLlU2+S1xSwa1wpI9hh+PIa/D3xeau0jnSNA8otMt
	 w78xN9eapvMWh+JdpTgMjFOH0EA44kGEfZOYuVhZsrlDYWgW2kRTbWOutyv/6JBKo1
	 kvGgWpSV7VTew==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.167.53) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f53.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5957d7e0bf3so348788e87.0
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 18 Nov 2025 15:46:32 -0800 (PST)
X-Gm-Message-State: AOJu0YyMzGAFkueU64lc/AieGgMEObyI0KENZhjy74v9ucvUFbOPaJoY
	KGzpPS8fNDmkK08a0X5IFWGOvCCEy0ElvW9Fd2Rl+tWjPIog9xc4kz4UBikC0yMtQ40x7nN3zyV
	6ADxam+BbXjgiPERyQsAMhMcJ1HRZPSA=
X-Google-Smtp-Source: 
 AGHT+IF2C3X5HVW+Q3X8xfphx3QF7R2OPCeQvc+LT7a82QRhAnICGo0kVMeXwEAjzM9nm6FP336yuNMUujqZCQIhO5U=
X-Received: by 2002:a2e:3a18:0:b0:37a:4277:86f8 with SMTP id
 38308e7fff4ca-37c6a126505mr814721fa.10.1763509592130; Tue, 18 Nov 2025
 15:46:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-4-lkml@antheas.dev>
 <75fe4c0f-3303-4f3d-adc5-45487df3c80a@gmail.com>
In-Reply-To: <75fe4c0f-3303-4f3d-adc5-45487df3c80a@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 19 Nov 2025 00:46:20 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwG6_r=XzrDtcFO7SivHUzmDgbYH8mQVZGvZLDOTRFuoAw@mail.gmail.com>
X-Gm-Features: AWmQ_bk9hEynhjlFSuhv8f2T0wWvP2CJDTBPwfjDwmrUxRa_ikvKBlGx1W3l4MY
Message-ID: 
 <CAGwozwG6_r=XzrDtcFO7SivHUzmDgbYH8mQVZGvZLDOTRFuoAw@mail.gmail.com>
Subject: Re: [PATCH v8 03/10] HID: asus: fortify keyboard handshake
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176350959302.1506193.5839487534707148755@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 19 Nov 2025 at 00:43, Denis Benato <benato.denis96@gmail.com> wrote:
>
>
> On 11/1/25 11:47, Antheas Kapenekakis wrote:
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
> > index 4676b7f20caf..03f0d86936fc 100644
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
> > @@ -393,14 +393,40 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
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
>
> __free(kfree) = NULL here? Would simplify the code.
>
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
> > +     if (!readbuf)
> > +             return -ENOMEM;
> > +
> > +     ret = hid_hw_raw_request(hdev, report_id, readbuf,
> > +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> > +                              HID_REQ_GET_REPORT);
> See comments on patch 1 (also reported below): not sure if others
> report_id are going to answer, my guess is that we will have to try
> if you choose to go that route.
> > +     if (ret < 0) {
> > +             hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> > +     } else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> > +             hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
> > +                     FEATURE_KBD_REPORT_SIZE, readbuf);
> > +             /*
> > +              * Do not return error if handshake is wrong until this is
> > +              * verified to work for all devices.
> > +              */
> In review of patch 1 I requested this function to be called with more report_id
> than just 0x5a so this will have to be checked against those values too.
>
> In alternative you can fork based on the report_id, but having confirmation that
> this is valid with those ids too would be of great help. Perhaps I can help you
> with this asking to asus-linux users.

Yes, it is valid to do a get_report for handshakes with 0x5d/0x5e, and
this patch is non-fatal. If it causes warnings to be printed that can
be dealt then.

Antheas

> > +     }
> >
> > +     kfree(readbuf);
> >       return ret;
> >  }
> >
>

