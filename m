Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABBF215766
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 15:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483816; cv=none; b=jDA+YXnHbao05RHvaTdRInyDx9GewP0oATp1X0EAQS13CI2Pora6Qlhj1BaGFyAAeXb8vjv1uM0aEh1mRB7UVqN1axfUpSm2lf3mpO08QzX90nyz/4rKKgtwVQHJCIrHhh8vRqvlF3Q6naHlPoeuDlZiwO/Ub6R0N7LWWS8YDkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483816; c=relaxed/simple;
	bh=MF8URYVd6paFLRNZA/wbEoqFzCWsn4Uq07b2eMDDSJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7dqhvbU0Wt7iCzzBvW55XwknyY8+spwckPbLP94yI2BUBy9mAUW63TnlIbc4XaI2xZo6CB5b54NH8jIEBOzd8L0/eabuZp88DEgV2AivKl+qm0if92Arp2zzVTqy/j00iScSauPZ2X50lRCm2jIgigWwzrGFuwkkAhzd5SUNRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PtjhGOXZ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PtjhGOXZ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3535588b3a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Jun 2025 08:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749483810; x=1750088610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=PtjhGOXZOzE60BZMbh7+zamXp7SLl/Eiu74m1gpb56jhQI58U5NRPfzi8Sd72w5v7x
         Bik8CIZZS+BGKT8KqkM3s3ObeQNnWtQARw20uxVahOWoNhLvk0XD274CrlD0fuxn7cx7
         mcmShC9Ca8BkRlAigKXqKli7g0n9zQ5bbufjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483810; x=1750088610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=sLRUXdmXDpXv/M6MIPg7EbG11hqHE+TkPzrWkmqhm6tbqno0LRy7WMLz8j7SuWaehG
         CkDVrVRNVBBZP/qLC2Pv8PlE2KdypAoDAvDtj8IGlP9zuDNGvSRInefqDkdT62FPahkI
         TRG9FCekwsyUoqkXJbLmofUH2f0aJPixj4IeSDSiOXijppQ24+53E1LOc4VzYnnCIw7X
         5+86KWhkWr5PQEgpU3gJOgCe2imNfYgL11My7qhGZyVgtT3/cqr0D+QAeWhwS4xLLaeo
         Qh1pF9qo8dgeLyE1Hz8pEb5oGnXR6pLxMLHn4ZOQzqsBzwOW7czYvNIu6Hz2DPMfSTqh
         +93A==
X-Forwarded-Encrypted: i=1; AJvYcCU8NUmgHQyARqYRdmLHnfE+YVRZilCoKDlRID9YBaCik/3yhJy45KBKOjj6q/ymEq7EZtECuqjHHyN1QAJ5bSlKhgGM@vger.kernel.org
X-Gm-Message-State: AOJu0YxHp6blaO2Kvo/7KTvvCrMvZ1102pT1rrjAeacR3iQjnYaOZvP8
	k3CXSH/G/CX0wK5hkepiAVi5m4H8PAGOHFiYJWXFSIxnTq/L1GechCjh9p2Pk/9lHUBulTq2qQw
	ZQq4=
X-Gm-Gg: ASbGnct6o//aEvFw36+9etI78KQUU7TPUnpzrxak0ePw/ulDDe8Azqi1zq1Hfbu1R81
	d7NvJApQBQpYywQzycYazcostFajR1GaK553c2BP3BAF6mMP6FqCaLc3Yx/L3ZmHJZk9w47UxbQ
	oedq9sZ09QgU/9IH0lopw+jEYnNg0dwCFrWU6YabjjzosiHga7r0bdnsvThBhOIInuK0JLz5BR2
	rTz7dnpNYy21uJcQSmjj+BvmPUVR80aM0vSyqAuBuI1J9vjlHAM3rebAEGHzaHsraZp+LjcOwHS
	ibPmHvW1b3bEbhD+BN/l8rQvQ8qanhBkFdYy+V6RUc28/DIByZxdFKq0llqJXo+RsTTsE/d4gde
	0vTW2Iyq2AbhBO7buzfvisJrtpMZ7Ig==
X-Google-Smtp-Source: AGHT+IGvf7U9O6J2/pYKRnk9iadHUYmt8i7ojRGfvlK53jxnkXdLClMGjRA3cQxLg6LKFGFgDMnqAA==
X-Received: by 2002:a05:6300:6c0a:b0:21f:4ecc:11ab with SMTP id adf61e73a8af0-21f4ecc15aemr6945326637.9.1749483809755;
        Mon, 09 Jun 2025 08:43:29 -0700 (PDT)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com. [209.85.215.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c082csm5875341b3a.121.2025.06.09.08.43.27
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 08:43:27 -0700 (PDT)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so2927862a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Jun 2025 08:43:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWk4enVkBXp/8/2l3oqYCat9e5CvEmk3Lmot+KRx+0qEsR+IQzMLkCMmlZROZ7PX9bSbq93o0+WJac9mYzdDAs4YHjy@vger.kernel.org
X-Received: by 2002:a17:90b:4c4e:b0:313:27e5:7ff1 with SMTP id
 98e67ed59e1d1-313472d3204mr17932741a91.1.1749483806734; Mon, 09 Jun 2025
 08:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com> <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 08:43:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
X-Gm-Features: AX0GCFvkFbIIK7ULGaQhmTqdCQ0r1uM5Yw-QxUNG98qVpJtj4RBGOmfISaSOf8g
Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 9, 2025 at 6:02=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrote:
>
> > Hi,
> >
> > On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibr=
e.com> wrote:
> >>
> >> The auxiliary device creation of this driver is simple enough to
> >> use the available auxiliary device creation helper.
> >>
> >> Use it and remove some boilerplate code.
> >>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++---------------------=
---------
> >>  1 file changed, 7 insertions(+), 42 deletions(-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'll snooze this for a bunch of weeks and check back to see if this
> > can be landed in drm-misc-next every once in a while. If you notice
> > that drm-misc-next has the necessary patches before I do then feel
> > free to poke me and I'll commit it.
>
> Hi Doug,
>
> FYI, this is safe to take with v6.16-rc1.
> Please let know in case you prefer a resend.

Thanks for the reminder. Unfortunately, I still need to wait. This
patch will need to land through drm-misc-next and that doesn't have
v6.16-rc1 yet.

https://cgit.freedesktop.org/drm/drm-misc/

...presumably v6.16-rc1 will get merged in before too much longer.
I'll try to keep an eye on it.

-Doug
