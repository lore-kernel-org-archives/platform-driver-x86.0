Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792448927;
	b=ZaOv2zx9N+OupTjufhPNXBN1LAd04wpQvsJr6SNjGU5Z9nvYb9GUXuM1RAX5c4eLJBhz
	 q2V+U/6RCEHlo0BBVtaNwQcpB2flbtSPvMZJxOtuYt3UutW3h/aQpogXpNARS7XLBUlbF
	 BXh7HCaETuUFBsHACJOI7xQEty0uFGFL5Ovwijr1zeTYKd4zdTYHpxsRJmQ6NIiXbSklQ
	 tAH2gpRCaRxhiQ30ejKKoY0wqRynGbzVWrC5NwIqpmLjXmqQfQOxrHydz7x6LYtCduUjs
	 xIR7Y5VkGfNGkq0qhXlpgNQZZBi55YgO4WYszfl3Z4TXivhoAliuLxLX7W5IOe7iwzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MqScAEBcEdrO9olOPv0aI3RfvOhn0celPkhFlZwz1+0=;
	b=EQDdZVPlr1+tljlr3/hUF7s89q7OEW3MiH+o/4NPFzOpZRrxZZcDcVqIDXKCVKzk0YJj
	 QtkWkd9vJw8bZQOdXnXsES4Vyq1h9rMnrjdyBmdkuwbPbuv6rvpsh6LTrsS1aufy1rky7
	 T4Ac3yk+W7PGb75t4m3bR5arBzXMFmaQAsZnGq+l98X4WX9TUSZ7XncxzwvJycbJvQUUp
	 Fyj9P0VW9Bvnyx22Lo1o+Cg+3xM2ZFglZj4k/TK4DPOpStIxy8/onHHfGU3Oe+ZPrz44r
	 mcmEVHZ2XhPYzrOXl5fb7PKtvNq46Mw4QG0ch5NwViNm+rUo+cYQOFBXSx7AnziS8cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bLsLfPea;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71B9606A324
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 22:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C71B9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bLsLfPea
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f2493c28bso207872485a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 15:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792448926; cv=none;
        d=google.com; s=arc-20260327;
        b=ID8QERBsTLTqTEAuGHOxZHKylJotLbhxo12Ri1c8TNa+EsRBNPfY3CRYqfJudRFvC8
         i7jMcIu2EBEKo0I72wPAZ+Pty6jfulPaBclMedqqU4IMRR/Aea0XGdlyXkcVTHPEsRBs
         dUYlHL9Ygd6Muhx51sYjYLBpRz4mlS9c7JoPJAqiKnIHWQ5XpF4TUgIdyO5huuzga25h
         mPE7Pj+EP+s48HnoGBtZP0qGTlzQ8RS7cVoWyQ/P+X26psJfpyv3yrQ6Q87IVRqzQ3y8
         G9McVaHDOqAGIvEbk60DMlxou3mEWrI7OySC6GRdGZ7pTAiE6C1nMx/Zub4iZJt4irAA
         F52w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MqScAEBcEdrO9olOPv0aI3RfvOhn0celPkhFlZwz1+0=;
        fh=T+RkV0m+56A9y82CTia0b+ueAITxvO1kF9mC/3VSKUk=;
        b=qgSh2HaxNXUsbVMn4omRPOMlni4V0XY7eb8dYmysjwQOFabhNCOySMPZWrjOcZCNMx
         NOxIZXBdtApEwplIafe1naw6oKLEcuPIhBOB4+PxFDv054vzYInApPhesdDKR797xsvm
         XFkrUJzMVRlS4EbZ9HEMgKE+JHypoTw1nQw/qXrkE1W0Q22YCrSlb7/pT70Aie4vzMF1
         /0fOuVSfScjNlcaQwY1zXrHe+1lla+w8VVMpP68gUt6yZYuwNwcejr6Cj4xq/5mTNAo6
         pFLzUpy2FeV73Uck6FZU4/4haDqX1u3SZMP2wa/YEHveSZiVFJ4zNE6wjYTnZIYUEmWp
         WEsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792448926; x=1793053726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MqScAEBcEdrO9olOPv0aI3RfvOhn0celPkhFlZwz1+0=;
        b=bLsLfPead1YBpugKDncXbMsrTLn9dTtmjSo0xos0itd/nJBGk+LlloqOFHZeTetczU
         5GyBxW6/jpwTRxjJsR+uPGRgGdEPDHJSMPQmEtMG9nWPNjl2zpa/t1/bWdZ2oHllRWOP
         47mvAv9cC5IVhF5Sn8dKV/wqOKKROHpKx6JeUgCTbxFuIynK7XH5bNv5i9jWDJX9xOqq
         P6IzLL5ugvUrxWhrap66iKvGni7m1GwsxvhoXhenz5cI3hnmc2cl1dyNurDNCxDgIq8H
         uGiwKZWYnJISWuGDwYCIxVI1qoVCXTTR6nbl7a5v9WjeNlcG5Ims9HU6kirZTMPV+hjH
         agBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448926; x=1793053726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqScAEBcEdrO9olOPv0aI3RfvOhn0celPkhFlZwz1+0=;
        b=PG9Eh+/0nZIGy/ZCCvaxs4ybNRmynIPv4dYejJTIagOhMJectgln8yoZlWM9v9tfYt
         R1Z8F4tV2Ef2sRaldNHLz9IvX1sabzxc1ToXBLdX+8yosIs+Av4YIOr76vF/Kl0yEaUc
         Jhc3gwG2C8D3W+2kELhueO0rZIipM/AcsE2Cd+nLxLJvnkCtFfRHGwKK2Np2/b7tTx+/
         ReLEOHUeEFTLMrWGJmgqJG6V4VBO7xcZ39Gq7kzFHcd18GrTZPjJ1L286vOiv0cX09h3
         ldrwSnLVtk2erxFsWXi5QbWZ7l1PgrhDI2eZvX7qwOrjfdpJUdHeldOib6nJF8YWUAET
         4WHw==
X-Forwarded-Encrypted: i=1; AKwUvBz+MFZOIcXWHkjmUi2bA8O7j201oQ8kFxaB3QXwOsFQnFDir63LkwG6Anz/leOPGz9cRgNrcg+pOEnrjo9b11wkCBkj@vger.kernel.org
X-Gm-Message-State: AFq9FYKtWv3XQXIGqdxa3Eixv3pDxfymYerqPrUPbbgX0DstDxWrrghE
	MWwuir9gfWTFfatjB/DLfRJwkvurTh/Ee6frZJiPAoUrEFwkUxVH9CNbrYl0d+ig8OuupV4d0v4
	upoDoY56UsONoxROnifMhoMIojaxD1Mw=
X-Gm-Gg: AYBFou2GFeC1RgCLKGIlq+kXJh0iWQqdC0e/QAUGQWybJAhzinbVbRXHNAywyn2u4/H
	oxZDOsmAoKCSlSRNEZP6GyJITQOnSCt6s2WTFoODw58g1KcQnAKQm08mk3PtmVqorXRuUKJFDS8
	UYsVMIXII8Wyq0rtjJd2g/RJfsP/yz7g9bpRGpj3V4DgtYKBhDOqO+/7rPYrQEb7pJPzjhn+ZYo
	7ogs2+GUYPuNDNFRYg+o5RVaW4wKWehfBz8wOWRGehujZCQ4SJP4LsjzfsQbI83spa6soXDY55X
	ZwplLD+QJmRLFzrhFHD5TwwL0BBQ5/ZjBQCK3IIRFGLzyfZzGp2j6A==
X-Received: by 2002:a05:620a:2846:b0:93e:c06a:7313 with SMTP id
 af79cd13be357-93f29ceed11mr1539830885a.13.1792448925708; Mon, 19 Oct 2026
 15:28:45 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163029.107250-1-eugene.wolferz@gmail.com> <d27c2b12-8968-4eec-b925-d5345ba1821e@linux.dev>
In-Reply-To: <d27c2b12-8968-4eec-b925-d5345ba1821e@linux.dev>
From: =?UTF-8?B?0JXQstCz0LXQvdC40Lkg0JLQvtC70YzRhNC10YDRhg==?= <eugene.wolferz@gmail.com>
Date: Tue, 20 Oct 2026 01:28:29 +0300
X-Gm-Features: AclHuK_Vge_qaXUbzdgGb83bqvr1qwk6GiBd2kqk00kHix-vmz9M_8oqYQVn-io
Message-ID: <CADQe2ZeEJEgE3AoXCtPNAvrggjJmG4WJh=O6++GS+ipRXaVgWQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Ignore spurious 0xe5 events on GU605MY
To: Denis Benato <denis.benato@linux.dev>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026, Denis Benato wrote:

> I am thinking that a quirk with e5 in the name is a bit overly specific..=
.
>
> I am thinking that perhaps the best thing to do is just create a case 0xE=
5 that
> simply does the ignore with no quirks check and a nice comment outlining
> why it is done.

Hi Denis,

Thank you for the review!

I agree that a DMI-specific quirk is probably unnecessary here,
especially since the same event has been observed on other ASUS
models.

I initially tested a global KE_IGNORE entry for 0xE5 on my GU605MY
with a 7.2.7-based kernel, and it successfully stopped the repeated
display wakeups.

I also noticed the related patch series from Seyed Mohammad Mahdi
Hosseini, which proposes the same global KE_IGNORE approach:

https://lore.kernel.org/platform-driver-x86/cover.1791672579.git.i@smmh.dev=
/

Since my patch was submitted first, I would be happy to prepare a v2
using the global KE_IGNORE approach, incorporating your feedback.

Would you prefer that I submit a v2, or should we wait for Ilpo's
opinion on how to handle the overlapping submissions?

Best regards,
Evgeny


=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC, =D0=95=D0=B2=
=D0=B3=D0=B5=D0=BD=D0=B8=D0=B9.
+7 (926) 607-70-19
https://t.me/mreugene


On Tue, 20 Oct 2026 at 01:12, Denis Benato <denis.benato@linux.dev> wrote:
>
>
> On 10/15/26 18:30, Evgeny Volferts wrote:
> > The ASUS ROG Zephyrus G16 GU605MY periodically emits an
> > unrecognized WMI event (0xe5), approximately every 12 seconds.
> >
> > The event is reported as KEY_UNKNOWN through the Asus WMI hotkeys
> > input device. When the session is locked, it causes both the
> > internal display and an external monitor connected through a
> > Thunderbolt dock to wake up repeatedly.
> >
> > Add a DMI-specific quirk to suppress this event on the GU605MY
> > without affecting other ASUS notebook models.
> >
> > Ignoring the event was first verified on a 7.2.7-based OGC kernel.
> > The DMI-specific quirk was subsequently built against 7.2.8-ogc5
> > and tested on 7.2.9-ogc2 and 7.2.9-ogc4. On both 7.2.9 variants,
> > the DMI match was confirmed and the unknown 0xe5 event messages
> > disappeared.
>
> Hi Evgeny,
>
> Thank you for your work!
>
> I am thinking that a quirk with e5 in the name is a bit overly specific..=
.
>
> That code has never been handled and is just the EC repeating some settin=
gs.
>
> I am thinking that perhaps the best thing to do is just create a case 0xE=
5 that
> simply does the ignore with no quirks check and a nice comment outlining
> why it is done.
>
> I don't see asus repurposing that for something else honestly so it shoul=
d
> be future-proof enough and will potentially avoid this to other models as
> well.
>
> On the other end it would be cool to know what that really is telling us.=
..
>
> If you don't come up with an answer I would defer to Ilpo whether preferr=
ing
> reducing quirks or keeping the symmetry within that key_filter function.
>
> I am fine either way.
>
> Best regards,
> Denis Benato
>
> > Signed-off-by: Evgeny Volferts <eugene.wolferz@gmail.com>
> > ---
> >  drivers/platform/x86/asus-nb-wmi.c | 17 +++++++++++++++++
> >  drivers/platform/x86/asus-wmi.h    |  1 +
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/=
asus-nb-wmi.c
> > index aeb461b1644d..8d69231d25a0 100644
> > --- a/drivers/platform/x86/asus-nb-wmi.c
> > +++ b/drivers/platform/x86/asus-nb-wmi.c
> > @@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_k=
bd =3D {
> >       .key_wlan_event =3D ASUS_WMI_KEY_IGNORE,
> >  };
> >
> > +static struct quirk_entry quirk_asus_gu605my =3D {
> > +     .ignore_e5_wmi_event =3D true,
> > +};
> > +
> >  static struct quirk_entry quirk_asus_z13 =3D {
> >       .key_wlan_event =3D ASUS_WMI_KEY_ARMOURY,
> >       .tablet_switch_mode =3D asus_wmi_kbd_dock_devid,
> > @@ -562,6 +566,15 @@ static const struct dmi_system_id asus_quirks[] =
=3D {
> >               },
> >               .driver_data =3D &quirk_asus_z13,
> >       },
> > +     {
> > +             .callback =3D dmi_matched,
> > +             .ident =3D "ASUS ROG Zephyrus G16 GU605MY",
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."=
),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "ROG Zephyrus G16 GU6=
05MY_GU605MY"),
> > +             },
> > +             .driver_data =3D &quirk_asus_gu605my,
> > +     },
> >       {},
> >  };
> >
> > @@ -690,6 +703,10 @@ static void asus_nb_wmi_key_filter(struct asus_wmi=
_driver *asus_wmi, int *code,
> >               if (quirks->key_wlan_event)
> >                       *code =3D quirks->key_wlan_event;
> >               break;
> > +     case 0xE5:
> > +             if (quirks->ignore_e5_wmi_event)
> > +                     *code =3D ASUS_WMI_KEY_IGNORE;
> > +             break;
> >       }
> >  }
> >
> > diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asu=
s-wmi.h
> > index 5cd4392b964e..e7772397cd10 100644
> > --- a/drivers/platform/x86/asus-wmi.h
> > +++ b/drivers/platform/x86/asus-wmi.h
> > @@ -41,6 +41,7 @@ struct quirk_entry {
> >       bool wmi_force_als_set;
> >       bool wmi_ignore_fan;
> >       bool filter_i8042_e1_extended_codes;
> > +     bool ignore_e5_wmi_event;
> >       int key_wlan_event;
> >       enum asus_wmi_tablet_switch_mode tablet_switch_mode;
> >       int wapf;
