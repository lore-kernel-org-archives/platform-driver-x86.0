Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793963934;
	b=CiMv7Uja/fn+6Gfgb7+WNcvzM6sV4uYTa+J67zmkTmCVo+NHZtMKDshDoobkx6a7TWpC
	 VZPcuy6PhBn0ifSvRMJBGZ6HB5FzunssEbPVQ5wKsCqaBK7y1fOp5Kuq8TM0VPdBtERya
	 82RiA7ul23mU++3P8IkegCkFCdTfPivfDbpcOiodUqRRg2ehXWN9vDJEszJWdqDeWrIWc
	 a9SJoSQbcWUV6Fx2wf0W6WPV29vFMqRwoGu5UNJ6PSWGdQEhSy/+6w9O7qyi4yaDTJL0B
	 nKgdExN2royjkwQjsNjsTEp2qRToxdbJumtnNPueW838qGWmyXy/aD7jK+xjr8XHJZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JCiiK4kYulPJyLW4OAcXTNQWLZn928rt9Ez3MCOozdI=;
	b=w4vYKjBrS+OdAUr2wZrwiSiwGVOupdW0NpjTUNZQlSiIDY8idgmK0qwFI3BnFJKDy/+k
	 Ka8Q9PaRsRcchkc7HIV/rg/UM6hnooFy1TLqaax9wxyg4r1uNSbt5HJ/aghwu47GBcLfi
	 4FssIOTFR3MyrJPpXyS4OPogYbzUeewiC9BE3OI7O9/c/Hak4pzznQMHAmVx++d1H2wka
	 4dt0J2iYMt81QYDL5MIZhqVeBrk/CACXCWeGVP8moPuDkAjP1iyo9bRJvbEo2gX/wSdUa
	 cyHg9SWwlTJ0K05PJr9TBMEuDKP/6TP3J3iYKTvaEUc7s43AhBMuXOYDNl3oRc9k+LQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=O5GvNw7p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EC1606A338
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 11:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4EC1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=O5GvNw7p
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-705cb6ceebaso322714eaf.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 03:18:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793963932; cv=none;
        d=google.com; s=arc-20260327;
        b=ZZiKYuRheCyulyhOKS5JNQzAu2p4tHDQtbWbOI9dtK/eexSOG//Qoxjiewn/0x7Bm/
         jLrr+sgWefyJr3BkS5wifgDOdvT3J9E+M9KxuhSx0IjDl3u9HSQ7+8jE45RKYitU+Fcw
         p5GENcuqgW7Q7+/BoGqaq77qYO+andtIWaUe1SQW86XZFMfVC7q+4G0jJUkhW+I2vXVf
         IU1YGvnieDmC5DdfEPQMINEh6113/fYH04NtCrOhk3xVC2MYEKIgbhN4DVOUsw24arMa
         xZjtN3SASBTmbDuQXFZkQMPuQry0vOx2hQC84oS27DT/wuU1P6cKuqbE2HFJwqJkVtQG
         CGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JCiiK4kYulPJyLW4OAcXTNQWLZn928rt9Ez3MCOozdI=;
        fh=FHBrpg5xGYKZBZAGGdnDlEq6sh57t+X9ZAB/rpQiqqU=;
        b=rYTrYHNhvXkXVhH4gMXj6A0zAPCCSv0PUsNO2ixqKoWc5yS7CpcNO7cNkGp43GbT34
         Jd95RH3EOygsuemX7PzCZnFFuHorTQfGNVjHo6xD/5KgeNLj3IAsU2QnGgqHtoDEPrHn
         +BPu107hGymhe3vVIf5TD8il35CGHrfmk9myeoJKOv9sXbJoZoIMLMxWYVckgA41kJdq
         YzizoKbWoK0P7II07PtJL/1gozZvVYLoRDJN7XxuL5VlzGldgqbs6o7fQrCJtjol+Qdf
         XZU1gF8bjyzuSkjC6WjPKJag/x2AftaFSreE6LRzK05Wbhho82CkCxERlKWs6GBf1/yF
         3eDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793963932; x=1794568732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCiiK4kYulPJyLW4OAcXTNQWLZn928rt9Ez3MCOozdI=;
        b=O5GvNw7pGEtidqI4/3jGNA2bgcr2xLuj9SKry0LIXD/lxuKa7X4kQzIZ7iobRHnYsv
         Mr7v0g1QO8JUbm3RQTiSNpbvPqm1cM59zuUrP8NsJJDtHkuG4OZw7HgArVY5I0DkHY1S
         dTV6mKCfFNhuSYjmKhV9jlnzOE7igr83SG0rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963932; x=1794568732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCiiK4kYulPJyLW4OAcXTNQWLZn928rt9Ez3MCOozdI=;
        b=qFFp0miFvsNHLnUXAhGcU4Aqq5Qonr9fQZF5+3f5962r4WMQy9a6IPB229UmvfRDcA
         tmeTmwkUKCJA1d0BO+JXfy0YzJeLaWn+ICT/AQNO0Uwz7OtVYhPeHyaa1Z5BTXvjCEkC
         GE0fHFAnqhVuZRKW9Z8cvHTYu2O0f24OdHdn0YK4yoEozCND/FaSP33Z/u3b1TiMqj9Z
         ya1tu7Mhj6t+FzNt7LhY37Nf7z6U10nLvlvimTtYz2MXAOi+maRl+i8tk8CwHaQ/xFt8
         g32fGp6cY3Css0oN8k2WYfJ2B84HrNMC1aCduEtip4cScXJ6ywD2/RW5lOEyOqnj0m52
         DzQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBvfjKOJdXneayYA0+7HEyxzcD69TKuF3/g4Rn2ol4IQ12+a+z8ipmSe7NYIJguqW+2tiHLTBeKRHCNRd/PrYvjG7X@vger.kernel.org
X-Gm-Message-State: APuU4Z/k0ovk1Cz1aG29CRIJBbRzwlHfquj/PM16LV6uO+o0j1432/vL
	zcfHmTI7OkhVRADa1/Dnim86/ZKRdhJUBkIGxITZCC6Er8s2a0WZ0z0UtG+LxXaj9MVart6NH//
	yb+/oQty5qBa2OxcGJSZttqmpgV8jMCICFV19CfOcFQ==
X-Gm-Gg: AYBFou2VBMz6n8+0aDElGgxQLnJa/njQfe0ipS0LyPcxd3boDGVulyq0zAH9OMF+Iny
	SL73rChecsZAsUVvoWUyYjvqj+aqwUAQBiDHyzPIgOdFQ5c+zLw3rNft1vL+xiB74wNJJRFOv1U
	QWSXx+svQYONFq9yE2U91eot1zPiVGR9ZzKf4j7XwN5WPiFfWreVtH4f3GleHJ4PxjMO/8xvlXF
	He3u9qf5IDEZyGt3PfSe1VDNy/hu47oGmWI+MWFzyZu1e8PNY9fKGv2TzEJMtn8zPP76/PZSjWT
	L6Pe6B4DlOLVsQzkl0czhKavJ3kYfAoyc1Hvvs3rZHcL/oLSfKy7Hs/pDggIoMPTvXOXn0589lZ
	sOfmf6VI3ekGkgdV3POS6tSbsEDNgre+cWfPApmrHdorp/7OhuGnG4+5ZEbGM4G+56zI+Hw==
X-Received: by 2002:a05:6820:162a:b0:6e5:5dc5:14e8 with SMTP id
 006d021491bc7-716e7a0cbb0mr1273240eaf.86.1793963932480; Fri, 06 Nov 2026
 03:18:52 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101161814.1325847-1-chris@miget.com> <20261101161814.1325847-5-chris@miget.com>
 <59fe5a60-049f-4e53-bd75-e7b2de3717bd@gmail.com>
In-Reply-To: <59fe5a60-049f-4e53-bd75-e7b2de3717bd@gmail.com>
From: Chris Taraszka <chris@miget.com>
Date: Fri, 6 Nov 2026 12:18:37 +0100
X-Gm-Features: AclHuK8qOOWqzLCcOSAiZKiOMHPnlf6cEbowk6SmPxaLD2mqq7aAre5KeUZr4ao
Message-ID: <CAAcRvKO-Qv=rUQbK6Kv6cEu3WasP20EfrHm1k6aPQARK=wVfNA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] platform/x86: bitland-mifs-wmi: Cycle the platform
 profile on Fn+K
To: Mingyou Chen <qby140326@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>, KentoNion <kento@kekto.ru>, 
	Matias Civadda <matias.civadda2342001@gmail.com>, 7z0423arsenova <7z0423arsenova@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Nov 2026, Mingyou Chen wrote:
> How about 0x16 (WMI_EVENT_PERFORMANCE_PLAN_ALT)? Some devices report
> this instead of 0x28 (WMI_EVENT_PERFORMANCE_CYCLE).

0x16 reports a mode change rather than asking for one. On TM2135 the
firmware cycles the mode itself on Fn+K and then sends 0x16 with the
new value [1]. TM2424 sends it after every SET as well, within 10 ms:

  SET 0x09 -> 0x16 value 0x09
  SET 0x03 -> 0x16 value 0x03
  SET 0x02 -> 0x16 value 0x02

Cycling on 0x16 would step twice per Fn+K press on TM2135, and on any
of these machines it would loop, since each step does a SET that sends
another 0x16. v15 already handles it with platform_profile_notify().
0x28 is different: TM2424 sends it on Fn+K and leaves the mode alone.

[1] https://lore.kernel.org/all/BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-aKy=
ZahijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=3D@proton.=
me/

Thanks,
Chris


On Mon, Nov 2, 2026 at 12:10=E2=80=AFPM Mingyou Chen <qby140326@gmail.com> =
wrote:
>
> On 11/2/26 00:18, Chris Taraszka wrote:
> > On the Xiaomi Book Pro 14 (TM2424), Fn+K sends hotkey event 0x28 and
> > the firmware does not change SystemPerMode itself. The event is a
> > request that the vendor software acts on; without that software Fn+K
> > does nothing on Windows either, and on Linux it is currently logged as
> > an unknown event.
> >
> > Add a quirk for this and call platform_profile_cycle() from the control
> > device when the event arrives, so Fn+K cycles through the profiles that
> > all platform profile handlers support. Models without the quirk keep
> > ignoring the event.
> >
> > Suggested-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Chris Taraszka <chris@miget.com>
> > ---
> >
> > Notes:
> >      Sent on its own earlier today [1]. It is now part of the series si=
nce
> >      it changes the TM2424 quirks entry from patch 1. Retested with v3:=
 three
> >      Fn+K presses from balanced step performance (0x04) -> low-power (0=
x02)
> >      -> balanced (0x09).
> >
> >      [1] https://lore.kernel.org/all/20261101144100.1043263-1-chris@mig=
et.com/
> >
> >   drivers/platform/x86/bitland-mifs-wmi.c | 20 ++++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform=
/x86/bitland-mifs-wmi.c
> > index 4d02cd9e8a6b..84d1223d0ec6 100644
> > --- a/drivers/platform/x86/bitland-mifs-wmi.c
> > +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> > @@ -100,6 +100,9 @@ struct bitland_mifs_quirks {
> >
> >       bool return_code_at_end;
> >       bool skip_ac_type_check;
> > +
> > +     /* Fn+K sends WMI_EVENT_PERFORMANCE_CYCLE and leaves the mode to =
the OS */
> > +     bool cycle_profile_on_key;
> >   };
> >
> >   static const struct bitland_profile_entry default_profile_entries[] =
=3D {
> > @@ -126,6 +129,7 @@ static const struct bitland_mifs_quirks tm2424_quir=
ks =3D {
> >       .profile_entries =3D tm2424_profile_entries,
> >       .num_profile_entries =3D ARRAY_SIZE(tm2424_profile_entries),
> >       .skip_ac_type_check =3D true,
> > +     .cycle_profile_on_key =3D true,
> >   };
> >
> >   static const struct dmi_system_id bitland_mifs_dmi_table[] =3D {
> > @@ -169,6 +173,7 @@ enum bitland_mifs_event_id {
> >       WMI_EVENT_MIC_MUTE              =3D 33,
> >       WMI_EVENT_RESERVED_23           =3D 34,
> >       WMI_EVENT_OPEN_APP              =3D 35,
> > +     WMI_EVENT_PERFORMANCE_CYCLE     =3D 40,
> >   };
> >
> >   enum bitland_mifs_event_type {
> > @@ -217,6 +222,7 @@ static BLOCKING_NOTIFIER_HEAD(bitland_notifier_list=
);
> >   enum bitland_notifier_actions {
> >       BITLAND_NOTIFY_KBD_BRIGHTNESS,
> >       BITLAND_NOTIFY_PLATFORM_PROFILE,
> > +     BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
> >       BITLAND_NOTIFY_HWMON,
> >   };
> >
> > @@ -869,6 +875,10 @@ static int bitland_notifier_callback(struct notifi=
er_block *nb,
> >       case BITLAND_NOTIFY_PLATFORM_PROFILE:
> >               platform_profile_notify(data_ctx->pp_dev);
> >               break;
> > +     case BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE:
> > +             if (data_ctx->pp_dev)
> > +                     platform_profile_cycle();
> > +             break;
> >       case BITLAND_NOTIFY_HWMON:
> >               fan_info =3D data;
> >
> > @@ -1015,6 +1025,7 @@ static void bitland_mifs_wmi_report_key(struct wm=
i_device *wdev, u32 payload)
> >   static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
> >                                   const struct wmi_buffer *buffer)
> >   {
> > +     struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(&wdev->dev=
);
> >       const struct bitland_mifs_event *event =3D buffer->data;
> >       struct bitland_fan_notify_data fan_data;
> >       u8 brightness;
> > @@ -1043,6 +1054,15 @@ static void bitland_mifs_wmi_notify(struct wmi_d=
evice *wdev,
> >                                            NULL);
> >               return;
> >
> > +     case WMI_EVENT_PERFORMANCE_CYCLE:
> > +             if (!data->quirks->cycle_profile_on_key)
> > +                     break;
> > +
> > +             blocking_notifier_call_chain(&bitland_notifier_list,
> > +                                          BITLAND_NOTIFY_PLATFORM_PROF=
ILE_CYCLE,
> > +                                          NULL);
> > +             return;
> > +
>
> How about 0x16 (WMI_EVENT_PERFORMANCE_PLAN_ALT)? Some devices report
> this instead of 0x28 (WMI_EVENT_PERFORMANCE_CYCLE).
>
> https://lore.kernel.org/all/BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-aKyZa=
hijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=3D@proton.me=
/
>
> >       /*
> >        * The device has 3 fans (CPU, GPU, SYS),
> >        * but there are only the CPU and GPU fan has events
