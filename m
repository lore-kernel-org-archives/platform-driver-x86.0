Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1322A2820DD
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 08:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916057; cv=none; b=Qg0a96yTYWYEets8w9Rc2G8XnpY7rFvDe3yj4EPROHPEhpqY6OP+V5k+cJ6h0KB6GQXxp1A32MX+rhxNf6Bo24pVR586r7XzNfsGKj0ndQyKtMbjXoJR4M97de5xy9vts1CODvjJgYwAtquvNOrOW4I7NqKNJbsW5HwBoTmA1Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916057; c=relaxed/simple;
	bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhTIIafaMccgihbAIq1ZcouR4SBi7EQ+df9UqX04X3SbUSpw0K+td1A8u9LZ7t1sJaL4Tpxpc8VM9zhN+ppvvE03M78CcC294cPISPf1L8gRW+S4hOdbyM3VQSpHWK5rxcbyA50aL6wATZ11MxGQ/SkHA2TjTy6pAK2to/aFYcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ansbdwJx; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ansbdwJx"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3106217268dso54204121fa.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916052; x=1746520852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
        b=ansbdwJxsueyefFM/ctUcCC6V8SAelIg4fyKH0DNmeisPkebKtqXUHrNQVqfENhfvo
         /+xit3qJOdMQNIxjRfKCjBsxY2jgxaKdC9yYi5qsMAbJn/zV1cYNMbu/w4+loB87L643
         DH0iVgtbCj6WQeJ0sbJ7sNEfSrSsGMP1adYk92DE/R/9ycX53FcJURUwQsxFhMD6m4Ai
         T+HRIAFJccEWJbCk8+vatZJzmsTisFrWvgBUure1gbQ0+JaJ9Of4s58IKYvHqEa8LScR
         UCmvWxEUobYTFF9R4MH7dqF8MXy9MWi4sSVnogYjOCJV9F0dCattldNwJT0oODZa8Tnd
         BmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916052; x=1746520852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
        b=AGyx/EQLji1C8ESe9Px8RQHuoVSNc+IPCm2LWiwZ0RFzPW7BGhHKLprK9yomyJp603
         z9u2Zk4x/4q7DoGrsPM/RTteQAQ0ilQPHra56ruTxZFeJamfEYyGy0JOAe94ECTqT6ha
         hh/DiQRlpFgNzXoRJ8M2dM/m9T5+NhDrdF0igUdTAM6ubbPa4EpIcUjzQZaiOhEBj63+
         +jr6GaYIDuCU1qyr4VeeDW5dHcKHZjdgb2Xw8eg9jAlzAOLVAwARUfAbdtbiiF5oYwpa
         raer6klRtN9i3wgKncqaq6OBNYgMN0zNMOWDALw0gEULR7IAsEcDC+X2ulDZ2TlluMmA
         WCmA==
X-Forwarded-Encrypted: i=1; AJvYcCXqmZOuwHhgP8Fp0CVmBXoHva6wgM+cL9Y5fEDzA3JOeQ4KGOmg+uD1tf7zLlCkIW3mEhB0lZatDvdBDK5lkWPZmRgp@vger.kernel.org
X-Gm-Message-State: AOJu0YzvsukTK46Um2wPUOSV6tEnIdLj/4KlYjdzR7lggWjzdnNFJCvf
	drLF0oXJJzdy/kCG2Ns8CidBwx4oks6ggdYyKjNimea840nBCl95C8r40zlHA1YuAoTG4/4aObM
	EU3j6Qbl9nkTKLZUUcKcnWyFDRtzVOKpBYjl2nQ==
X-Gm-Gg: ASbGncsa0fSD7bj147rJkTOV8NMBvlr3Ce+ENCg29f/3ouDPiJnUvbCCHvlBUL8HP1E
	rmOjrdasIJLvLGDMNrivGr+NjiIiE1BSeIufaB+pkboSpKva/K12wVTP/ntn3HlOiuoAKvP4dwQ
	xyUDBxp1RnvGF0Gh5RDpOZqQ==
X-Google-Smtp-Source: AGHT+IEUiqYB296CVrwZ+xxBw7BC+pTcJa/x+6Bu5GNB2EvNhnBwa7BLSUJNRUMp+Ehtf1mLBoE9JSmzpMhMYJBukms=
X-Received: by 2002:a2e:bc0b:0:b0:30d:894a:a538 with SMTP id
 38308e7fff4ca-31d34b6c243mr8766341fa.21.1745916052135; Tue, 29 Apr 2025
 01:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:40:41 +0200
X-Gm-Features: ATxdqUEhPh2HxY_cKMawBJnfuogL8n7jPhFvg8U9jTR5km8hYrNkb1VPdIYXtGQ
Message-ID: <CACRpkdZt8zem0hFUiq3-Z1feNZHRh3R=Y0cEtK=pVt=bJ9Qf1g@mail.gmail.com>
Subject: Re: [PATCH v2 15/34] drm/mcde: convert to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 9:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
