Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A092F290A
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775500970; cv=pass; b=E6ILQ1UlCOXxg+UYdt71OKYr5jPr5YwbDrSlsTPwmLVid2pY7LbG0elKVNYMWABr5DLsaxt14usW9Mjyj3A/a9M+26fcHm3lJ6OmzMg9MSelsZKkmkCyfTgSCE9DAGs5cJMHFOFw4/35D6EM8zc1vBledHw6eronfSihbo8frqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775500970; c=relaxed/simple;
	bh=2t/dqWikcuVoZCGkAQ9ON3eKcJP2RLNeubP1KG6L0P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YcUEYvDQ3mFJEbKEbNijkszZ9HwqkPOWT0OhJ6UF2dOUPpryorwpRlnB3Pp21doGUrXmlKgHk3+DhhmPEbd+IXO+tKZuXB6VTOg5lzTr6WEkRDrpn3W3vgOQ1BqOhfkFwHVPdpe3TfcVJMvAcUjGjoC0HAQLtrAJgDyeMNYbQBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqXxZq/K; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqXxZq/K"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8a05c388b27so84982346d6.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 11:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775500968; cv=none;
        d=google.com; s=arc-20240605;
        b=Wlna+nubdxmFY60kHQi5YjwgFzJR0GhA255CCEA3h+2v/L6FvQRewuOocW2Bm7/vJk
         OTYSUfT08fvfy8ll9OeSlrQRN40f2qpZatjtXqOcAn41TpKCDDz6ZeX8NIOreSwIjwBo
         YjqJZ2RvRyA3PnzIzehiquqiZ7yn7fY+Q+Dicih/DG7w6SBFMq3keNDe3MDj1WPOHCTy
         G3W2vtXaPV1NO0fLUnm6Fld8dCC8WKHdsCOjIr3vqUmscw2yZ/2+O3eMDrokAP73cgbt
         U6xhDtmrB8xT4cVpZuuaTDfq+CyRfuRy/GnF3SHXp61m1zV4VmELFAA9EXiwryhdrX/A
         PMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2dD2eVO9YOEvgq4N0uzPsgMJoIErz8h33H4BqncBVvI=;
        fh=3xg73sFtJ/dEVUZm2zJOQO/1FePc3B48lu1zgf2ktjQ=;
        b=PbuVeWk/yrmi7iqS83w4R4y4HnCLFnnhc0j1lEbgqY8anLtC1uNJkfVSp52jA7qfsT
         V304XiQBr9VAs9stTMDwfITE1Tq2CqO5rI5aV78+zP0qUee5RzcA6gVkjp4u0F/uATx0
         s889Oz4Ha1OoBWPuoQ3ocWxSN8Az31JUZD95AqlUHULU1wU/tyrUkTOUGmjinYlbWGrY
         x07zT9dVexei+zYI+XAkkhfiTFXmbZBV3ljE2KbsIM21KGPH0W7xovJcUoxGpK9ISLTD
         qQLVa/Iw0lvWDb9hRggLmoQ/MLED01pBxo2hfDklRKb+UIL27TU13diZY/bLisEZLyh5
         aqqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775500968; x=1776105768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dD2eVO9YOEvgq4N0uzPsgMJoIErz8h33H4BqncBVvI=;
        b=EqXxZq/K2MhC7uKCEYNmzunhohiaErVLRZd1WXQ/KXP1UFlvr7JlAJhi0XlHAEJQKn
         RcOcpcLCE7CrqT4N9CU00rzeWl8Dc1gJQyKucCaXEQDG6JHrI5uZ0JqZlQ1EXl1189bF
         xYTOtLjcqcXXUnCfesLGGt1X3UQmY4zfUsvj8nmHTs4tRh3XnYllyq/mN48/qAQFhDr1
         XWItjFUN46VtYTocktwtCjbfHi+UKvHTF7oBuxiWUCSY7mUOUKfcjm12PPxKhx9v5rTx
         xLoCgz5ptWioJWaDFRkTTjLmU76LYw06lKjdygwTNan8fsoS9kuk2vg6iVcTyOgH77Oo
         IHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775500968; x=1776105768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2dD2eVO9YOEvgq4N0uzPsgMJoIErz8h33H4BqncBVvI=;
        b=Yfl+YdbSJHH+Eqcd8zAx2VeRA5jnKbBUTXZBcEl6KQb9WRONiAwNC7xBwqqtXeVhry
         4/iJKuTmtNNSDITGvfpz+1Xwb2i/ziF7Dubr+RyISxm5N6XnVErUaWBVoEy5gXfDU1G5
         yZ1cOuFNmk1LlUmQm+Yd7i3v+v8Qo9LG7YVpbvf7FcTTS81nJFCmyNQZccWAvVlQFazv
         blZbuDiG0ASu4mljN0COmWJ8spJFXr4Z+OjHDMYhuhp9QQVTglXcySx2oiFL6cciLQej
         VO+UGqyUpOzzQdOAF5k+SBb3hMcmo8tbqGZJ5AcJIRG2vG1DGQwJ6jX62FjxmvnpYAOl
         7BRA==
X-Forwarded-Encrypted: i=1; AJvYcCUQS1J84Bbe6j9iqDEQ9Rcz6IWst9/uroGtdMF5iNjLZDCUOgTLhjSiZVFOk5SMNDR4iOU0uGKJRFhQZ364RqB+22V0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoe6XejjcZ7dm88fCFq3q3Y/OK+hfty9AsjG2n2A6JrGZjgjlO
	sx6UXpNS6ULpaGj0zlnTYRDY5MTElEFrSTgV4mEd3zoG6boW8qSvvKTRZNGGau1e+iXfyX5grZE
	WrXs+0HttnrmbbRFbljTfmJ5KimipBso=
X-Gm-Gg: AeBDiesiHuT+Zfx8kplqpx/MhwI5Y9uPwZ2KAeb5OEwzc9l6lbOPoSxFykYDANwkAal
	ufqqD7Bw6emnOqK7ZVKtY2nM+Ux9SelP1iFn86iVPfqbKOMkMdx37fIj6Q5Tj0YbwVbnOeB/QBZ
	knwR4+UpnOL5WrZxTxp0vJuLNngid3BGqsl0Zu3NPYdB7VGpdSxxhlNaZ5bnl39g7+GYQ2Z/Lwi
	AqY7kqHVjw+5GxeOYpqN8lRYbM/BsurPAR5i7zSRAbdiddhg3di5dqi/E0OHdFBnzcxGbiWyXKg
	zllHbrKIqqWjcZwdJ9c=
X-Received: by 2002:a05:6214:21a2:b0:89c:4ea7:a714 with SMTP id
 6a1803df08f44-8a7027a3647mr221372076d6.22.1775500967714; Mon, 06 Apr 2026
 11:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
 <20260402032424.678528-9-derekjohn.clark@gmail.com> <ac5a412f-9fb5-4f1a-99ca-127e1564d327@app.fastmail.com>
In-Reply-To: <ac5a412f-9fb5-4f1a-99ca-127e1564d327@app.fastmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Mon, 6 Apr 2026 11:42:36 -0700
X-Gm-Features: AQROBzAOSr1d7CIkvo1HORURLutWf5XH9XzqqMvCcf6Hnx76tk5mBWwOXV6R0jI
Message-ID: <CAFqHKTn+1wbZdpi_yKpaqHmeLnb5PKbWXpj8Pc=547GVYBhX=Q@mail.gmail.com>
Subject: Re: [PATCH v7 08/16] platform/x86: lenovo-wmi-helpers: Move gamezone
 enums to wmi-helpers
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
	Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 5:04=E2=80=AFPM Mark Pearson <mpearson-lenovo@squebb=
.ca> wrote:
>
> Hi Derek,
>
> On Wed, Apr 1, 2026, at 11:24 PM, Derek J. Clark wrote:
> > In a later patch in the series the thermal mode enum will be accessed
> > across three separate drivers (wmi-capdata, wmi-gamezonem and wmi-other=
).
> > An additional patch in the series will also add a function protoype tha=
t
> > needs to reference this enum in wmi-helpers.h To avoid having all these
> > drivers begin to import each others headers, and to avoid declaring an
> > opaque enum to hande the second case, move the thermal mode enum to
> > helpers where it can be safely accessed by everything that needs it fro=
m
> > a single import.
> >
> > While at it, since the gamezone_events_type enum is the only remaining
> > item in the header, move that as well and remove the gamezone header
> > entirely.
> >
> > Reviewed-by: Rong Zhang <i@rong.moe>
> > Tested-by: Rong Zhang <i@rong.moe>
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> >  drivers/platform/x86/lenovo/wmi-events.c   |  2 +-
> >  drivers/platform/x86/lenovo/wmi-gamezone.c |  1 -
> >  drivers/platform/x86/lenovo/wmi-gamezone.h | 21 ---------------------
> >  drivers/platform/x86/lenovo/wmi-helpers.h  | 13 +++++++++++++
> >  drivers/platform/x86/lenovo/wmi-other.c    |  3 +--
> >  5 files changed, 15 insertions(+), 25 deletions(-)
> >  delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h
> >
> > diff --git a/drivers/platform/x86/lenovo/wmi-events.c
> > b/drivers/platform/x86/lenovo/wmi-events.c
> > index 0994cd7dd504..9e9f2e82e04d 100644
> > --- a/drivers/platform/x86/lenovo/wmi-events.c
> > +++ b/drivers/platform/x86/lenovo/wmi-events.c
> > @@ -17,7 +17,7 @@
> >  #include <linux/wmi.h>
> >
> >  #include "wmi-events.h"
> > -#include "wmi-gamezone.h"
> > +#include "wmi-helpers.h"
> >
> >  #define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
> >
> > diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c
> > b/drivers/platform/x86/lenovo/wmi-gamezone.c
> > index a91089694727..5a8f4aee02cf 100644
> > --- a/drivers/platform/x86/lenovo/wmi-gamezone.c
> > +++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
> > @@ -21,7 +21,6 @@
> >  #include <linux/wmi.h>
> >
> >  #include "wmi-events.h"
> > -#include "wmi-gamezone.h"
> >  #include "wmi-helpers.h"
> >
> >  #define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> > diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.h
> > b/drivers/platform/x86/lenovo/wmi-gamezone.h
> > deleted file mode 100644
> > index ddb919cf6c36..000000000000
> > --- a/drivers/platform/x86/lenovo/wmi-gamezone.h
> > +++ /dev/null
> > @@ -1,21 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-or-later */
> > -
> > -/* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
> > -
> > -#ifndef _LENOVO_WMI_GAMEZONE_H_
> > -#define _LENOVO_WMI_GAMEZONE_H_
> > -
> > -enum gamezone_events_type {
> > -     LWMI_GZ_GET_THERMAL_MODE =3D 1,
> > -};
> > -
> > -enum thermal_mode {
> > -     LWMI_GZ_THERMAL_MODE_NONE =3D        0x00,
> > -     LWMI_GZ_THERMAL_MODE_QUIET =3D       0x01,
> > -     LWMI_GZ_THERMAL_MODE_BALANCED =3D    0x02,
> > -     LWMI_GZ_THERMAL_MODE_PERFORMANCE =3D 0x03,
> > -     LWMI_GZ_THERMAL_MODE_EXTREME =3D     0xE0, /* Ver 6+ */
> > -     LWMI_GZ_THERMAL_MODE_CUSTOM =3D      0xFF,
> > -};
> > -
> > -#endif /* !_LENOVO_WMI_GAMEZONE_H_ */
> > diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h
> > b/drivers/platform/x86/lenovo/wmi-helpers.h
> > index 651a039228ed..ed7db3ebba6c 100644
> > --- a/drivers/platform/x86/lenovo/wmi-helpers.h
> > +++ b/drivers/platform/x86/lenovo/wmi-helpers.h
> > @@ -16,6 +16,19 @@ struct wmi_method_args_32 {
> >       u32 arg1;
> >  };
> >
> > +enum lwmi_event_type {
> > +     LWMI_GZ_GET_THERMAL_MODE =3D 0x01,
> > +};
> > +
> > +enum thermal_mode {
> > +     LWMI_GZ_THERMAL_MODE_NONE =3D        0x00,
> > +     LWMI_GZ_THERMAL_MODE_QUIET =3D       0x01,
> > +     LWMI_GZ_THERMAL_MODE_BALANCED =3D    0x02,
> > +     LWMI_GZ_THERMAL_MODE_PERFORMANCE =3D 0x03,
> > +     LWMI_GZ_THERMAL_MODE_EXTREME =3D     0xE0, /* Ver 6+ */
> > +     LWMI_GZ_THERMAL_MODE_CUSTOM =3D      0xFF,
> > +};
> > +
> >  int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 me=
thod_id,
> >                         unsigned char *buf, size_t size, u32 *retval);
> >
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c
> > b/drivers/platform/x86/lenovo/wmi-other.c
> > index 1d1bab98298b..e475d1d8a5a7 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -46,7 +46,6 @@
> >
> >  #include "wmi-capdata.h"
> >  #include "wmi-events.h"
> > -#include "wmi-gamezone.h"
> >  #include "wmi-helpers.h"
> >  #include "../firmware_attributes_class.h"
> >
> > @@ -787,7 +786,7 @@ static bool lwmi_attr_01_is_supported(struct
> > tunable_attr_01 *tunable_attr)
> >  {
> >       u8 modes[2] =3D { LWMI_GZ_THERMAL_MODE_CUSTOM,
> > LWMI_GZ_THERMAL_MODE_NONE };
> >       struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> > -     struct wmi_method_args_32 args =3D { 0x0, 0x0 };
> > +     struct wmi_method_args_32 args =3D {};
>
> Was this change intentional? It's seems unrelated to the commit descripti=
on.
>

It should have been declared as =3D {}; from the initial patch. Seems I
missed one in the rebase and it got added later.

Thanks,
Derek

> >       bool cd_mode_found =3D false;
> >       bool cv_mode_found =3D false;
> >       struct capdata01 capdata;
> > --
> > 2.53.0
