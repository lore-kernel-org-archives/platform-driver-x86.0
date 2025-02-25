Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8317E183CB0
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Feb 2025 16:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740499519; cv=none; b=h+qFAGGvv9Y5omJCRJ7C2o5vctkh4ZGq6xdNlokHCelC+IcsadM82Aw+CWnM9B7K8ngJEj3TOlu1PAuMpdYB+zuzX95ksshs04QmgC4dVuflK7f85gza7Yad38zzhkbYYMh/Hvk2le45eoql0Cewly0DL+IGhQIK8gCkzqcbPLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740499519; c=relaxed/simple;
	bh=rCByvJMOjUxh8ZzB5E/B1+AmONBCyWA+/sUB1yHUqbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0z+oFuiKGcm45dFZK73kBF2iKfLH6NKC2W7iHkhyvvbt8f/FzmGqPvzJ4yOYGFzJaLh+4IlouITYBHDR48TLS/qGt6BVoU9QCt9rYU7osJyoDWBXnwXXv3guWCEma6K3onidBVckUu/PFt2zQt8u2Vc6rTLfM/amOnA7zNQe9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GzmYvBrP; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GzmYvBrP"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-548430564d9so3424364e87.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Feb 2025 08:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740499512; x=1741104312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
        b=GzmYvBrPgSl/t3EpsqdLPYuDi20yNBU+MokSgvE5iKmImiJoCkjDu2Y/OknVGqRfzq
         ll6LBJsL2XPEck9qeuxXuDGvNtacV0VFGnO+12N/puz0U7LDz8wD/qtJth/5fkge8v0T
         Dq0VjW8l29iUyQB2+QIZbMcIcT07YNKUTaI+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499512; x=1741104312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
        b=VghNQFzMlVbH7ZCLjbVXVz/2LJMxOVnXWhUwB9gLPU017U71fGQTEln3beihyGPaMq
         ogXWJkfHqvaFCC7ghuS6Lbv24m89Z5saS1reI7gRbU8EF36D94YoAgb5KxaE2WEcuPve
         lSyxnuSTzCfN83maN31D0CtNVViREJQWrHzYIDGl/dSt5/KSgBQdLoRShK36d1b8Ocps
         xordisC3oKdAsm0OwGxID9AC5aynBqEL5pn/3GvYxLfNFyOHX/XhV0ZHlxWtq3sf+6zJ
         DchB2XpsQzARVrf+ko8rqc+Y5sJ3NPvWlFrLF+OghYnQXMRyA2ARMZwe/6FfydFq+3TM
         6GRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUzTmokntoznev0wapuPA4GVnSHxUhN9HEl4XvBvf7e18a1o29ng7qA4/l6zNJ0xvBBOaUwpTWlSWPyM1D2xDQIoWT@vger.kernel.org
X-Gm-Message-State: AOJu0YxakVJtZ+iSsTHNAHVjV4dr/rojOdKLsc7jgBunfAesPIcmmB0b
	EtBEu6JAe4xBKcOpNZwGpQ/2VcxMJq4EwBaOhr66kjBUEvv5Dn96EHTkn+tZr88paUplJc23hMD
	Xjrr8
X-Gm-Gg: ASbGnct/73zr1a8cpPugn+pAMb0T56dZSRsgJ50EYrFAnM/qJdrc3/i6m0ZetAV4zBa
	sC5LyqmkD2oRAyeaO3HuK00GIg2G6Wp0Rdrqo+pWyjZTUZ/PAV7kf4CEfb21uPL7uuGfTBE9S6z
	BVY6+Y4qSxO/oDR5vawxnawjVKpLU3puc4tvQ3JwZn8N8FzIOd2JZdu6ZXYjTT0hzDPA54HX5PU
	YwwhcfBKKg+fOk0DzUaMQCEfSdLxOFgzNFZFF/qJZrhm5iQg+qXmURJHKKWEV+aDr+onOpIMGLu
	iNAxnDakfgFFf5U1veSHdqhjfP0UP4ylcQX8qoRM2uBe4fN+pNYQiSYTCpNWD8yDGw==
X-Google-Smtp-Source: AGHT+IFFQs8xS1U8RCMxqbe4aFU40mnELdTwiz8/4xBFwP/Ls82biHVprN+N2L5mEe9cVHWcizB+0Q==
X-Received: by 2002:a05:6512:108e:b0:545:2b24:c711 with SMTP id 2adb3069b0e04-5483913b263mr6203369e87.21.1740499512079;
        Tue, 25 Feb 2025 08:05:12 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514efce0sm209717e87.118.2025.02.25.08.05.09
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 08:05:11 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5452c29bacfso6268914e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Feb 2025 08:05:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhVs6wzbF/0L9sAiClKBqK+LJCwrR2YlVOCgbWGjBMVRmssxr8IfrgHg+LW+38ERUDgOz5qSVAOSlhU+4VNC1bfDLc@vger.kernel.org
X-Received: by 2002:a05:6512:1241:b0:547:6723:93b6 with SMTP id
 2adb3069b0e04-5483909d1d1mr6678553e87.0.1740499509419; Tue, 25 Feb 2025
 08:05:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com> <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Feb 2025 08:04:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
X-Gm-Features: AWEUYZm3vRrajChqqVao9eJTA9wadMF2aiVVZGdKkNeW96YTlQauMsPFnVVKvC0
Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
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

On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++------------------------=
------
>  1 file changed, 7 insertions(+), 42 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll snooze this for a bunch of weeks and check back to see if this
can be landed in drm-misc-next every once in a while. If you notice
that drm-misc-next has the necessary patches before I do then feel
free to poke me and I'll commit it.

-Doug
