Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA20146013
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 19:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406497; cv=none; b=OloAxopS81Kcqgnv6TeGfJyuduzzLQwBGUrG4Unlb0WZLhGVmzlepcgE3ZNEAG/73i1N5VygP4AsUgnevohJczFhnuF4mMI9sUC2B40ELCJy8RKfYU20SYAHu25X5VbAcK7mxrBmZUTjMl0TxWaOJ+YY/CwkZnM4w038Cou+GQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406497; c=relaxed/simple;
	bh=xaz1747bjy7dSsD96YNNfHDgzxvk0T9G8tW5B/APQZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNEalZ/dRoWXaAhtHX1LCyOun6tuGAwQPZwREuVUX0OEIvLKw8aNs6IrR3DzsKAa5+loeYqI2qh/04s0eWDj7InT5A4PDoccEgQYPXwFsWCbeKk31uANiE2tDdVEJVDzuV0/1pNwu3br2rbPmfQ+X7Al3h+uFrqQn7gT+xb4yOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWoNV09U; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWoNV09U"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a5a89787ea4so954431866b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 12:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716406494; x=1717011294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaz1747bjy7dSsD96YNNfHDgzxvk0T9G8tW5B/APQZQ=;
        b=KWoNV09U73YLOBxrbtOK5HBj34atTjW82nt9c2BW/kEA3XVZb09Bsn26eYNRaZbar5
         l42uwyNUtXtTjSLW6e0Ac5kdgsk1Out+eOYiSmjx0GZ0zaKebqkDotxBTLu/HtjQEvNK
         EsoGp3dbtDtgAtW2laq9qjohFWt0WXvg+hesE11yulR1e5zQW2caFQct4F+JwzjH7CEO
         UqUWFb3DDIkMCgNmStneNATABdsCg3EG5sr3a7Xsmg/AHX3ZqETHc3+oyjX1cBbRkABD
         TWheEHHjDoGWQ11gmlLc2rstjVJuQd06WeaWJWebTLRFF2CkrsAoMXK4ROgudXDJ0QUQ
         Wj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716406494; x=1717011294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaz1747bjy7dSsD96YNNfHDgzxvk0T9G8tW5B/APQZQ=;
        b=tGyHNRozLc1vkHkSvM/YOVhshzrWUiMMFrzdIEzhVKGNpC3+ggGLN/R/+zzAYoByD5
         j0J7x0sCuFGACAZ7eKaOZ2cQEDhDWC1Rc96vVP0Yyko3Q3CvFG7cA9ENR+B8j78Co5Px
         YMv4cZMHoAvc0nIsxycYHqvP4tpjOkzVvUp4wfmiwRQWre+cGedjRaDplQbVGP6onsGp
         SctXl25LWR35rqG4xZVFtk0yOuNuolGKTDQiuZC08/c9XmKBNRXyo6zZCi4Rd2DxSMMc
         JUbNPnzbFDK7jXDYEPvh+sYc28DDnSeet+r8gIDnTayOhSU5ysuISM4USmw9yK9A/+Pz
         26GA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ0rkImEdLHNdjeAyoA7i9y2eJL5wm0jzNZvJN3BGW7jEv9KxUg2yamV1fLsIc/U4rDzZWab6ekBSxZcuD4ePfOy2rlr7qAoeqtaP2AyLxmdCmpQ==
X-Gm-Message-State: AOJu0Yy1KgGlEWfFvLWloWMB+fPzEn5l+R8igd2+Lump8uX4N5OHLxpy
	xTFTJLD34/08u8/MPukG1e9WHMFBhqYnt3p1QGigmdB+LdA7cv0BcAfUY3cwAku2yEMc8fbwNr6
	GexfTXODZHiE/0/aZCLmC0GR34dQ=
X-Google-Smtp-Source: AGHT+IG8eIn8ET0MZzDq7a3wlce6gqeovRRhMI+qzCsoEtYcx2buZELZB52JkXJE2DFe9cgTP7sUVkDTusCU5ivzEV4=
X-Received: by 2002:a17:906:d10f:b0:a59:aae5:b0bc with SMTP id
 a640c23a62f3a-a622e731546mr158210966b.42.1716406494159; Wed, 22 May 2024
 12:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522164807.28936-1-hdegoede@redhat.com> <Zk4pC0dkmTEcS_qA@smile.fi.intel.com>
 <4c14d61f-dc0c-4495-a74c-fa0cef4362d5@redhat.com> <CAHp75Vex78gE+e8kaUvvNjVUtkv-3GGgcMFZ3tFFqK49WRQDrA@mail.gmail.com>
In-Reply-To: <CAHp75Vex78gE+e8kaUvvNjVUtkv-3GGgcMFZ3tFFqK49WRQDrA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 May 2024 22:34:17 +0300
Message-ID: <CAHp75VctqHUs31Wh26-TS83Q7bPrW6EERua3xrxGY4fGFY82yw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, Gregor Riepl <onitake@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 10:32=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, May 22, 2024 at 9:40=E2=80=AFPM Hans de Goede <hdegoede@redhat.co=
m> wrote:
> > On 5/22/24 7:19 PM, Andy Shevchenko wrote:
> > > On Wed, May 22, 2024 at 06:48:07PM +0200, Hans de Goede wrote:

...

> > next_arg is meant for parsing different arguments on the kernel cmdline
> > split by spaces. It has space as separator hardcoded so it cannot be
> > used here.
>
> I believe it's not the first time I hear such an excuse for
> duplicating Yet Another (Same) Parser.
> If you think you really need another separator, we may patch
> next_arg() or add next_arg_any(is_separator_fn *fn) and make
> next_arg() to be a wrapper of the other one.

Also note, that it will allow (AFAIU) to have something like
xy=3D"xy,inverted" to be passed if needed in the future.


--=20
With Best Regards,
Andy Shevchenko
