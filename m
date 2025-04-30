Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE57025D1F8
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028327; cv=none; b=cERILAUn4t3bGbKCiAunc/8jWkM4aPLmor6q1tg0l3VlVj1vazNnl6pM7EINFhNPqpP/N3hmeCRHrfsKY1Q3OS/cMHlQAGy8z01oDc6Bu39XVgtDU5Nd6QUloAv2ckk+vZyFZyNWWuxDYBrsD/XvzpYshHv2aFHxwTtvkWc3S2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028327; c=relaxed/simple;
	bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALSFamAjyv+ExgCw81K29zxxNOIP1/2mDXIkPvZ/ZzCoiLNUCJd4fW5pyEtL5lYggkksQRIT9ySTQs59XMqOoM+HU42+QESkcuHGgcC/6s/TrtB55ZaGIyMbs4mT4gay93OBAF4UPL5dl5nP/u11fJLs59AyTbune8EjF4PexE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oI3QoUE6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oI3QoUE6"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2255003f4c6so30495ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746028325; x=1746633125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
        b=oI3QoUE6JiwQDf7dYKZtdqiktH8waKlt4mp0JChBH9rwd2clquLsCaIr6iroBnsMLp
         GU56XxocM2WEiTRZBCMgn11U38cTYLYuohCFpWufiE8wCXV3mBlSkhRtl75jMAuSIoSm
         /Z/W/eofnFYo3uBKgzofTCd85m3VA9PW8eKRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028325; x=1746633125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
        b=N1FoKXnWQTaqPJAqn7AglDLWI3qcqcxTH9DrZSOkrlshbsNjMEl5DB/97mLJKy0DOU
         X0yIiDA0UthKdmgir+E9MESHjGhWukcG/4g9LPFD3/K54JASQgaBrsSaU4vwu5uBV0yb
         2g50vl7ZAAjvusHigawJtiai+Jhj4Vkxr7etqP8QZYwzApmkW/RWydoI00dxlgHYoSAd
         OL9ObphvAl7KNTnuip30p0fXdsW7pswaxJptCiu6P8k2tiS1ROuhaNDT/cFZuwXmptNd
         IsJq9W7fPUtg+cWu8cl6kLyq1SRWbLzsbGD0xqAsNHpOxAzJkaAxwVtNhy9F8fCSr7OI
         N5iw==
X-Forwarded-Encrypted: i=1; AJvYcCVa94yzrVuPZhbpQQcAPZlU6QcASJ9CMo5jKayEwgnLso2KTw3g7NKfJrDTsqZAiRC5drTLykp6E7y3HcbSw20WflbH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+hbRhq2S6zKSI9FG/1UBKGPkWEl57CeCTF7sO3SZVRYdAZepZ
	2fqWw16j+nW5GKYr4wv59OAyZDvDnBVJkyUpO4pDHZ/YZmo9qPiPMbf23sFsYLwxICleWUXgYh0
	=
X-Gm-Gg: ASbGncuxpUDbJaGIYfKJSIbltQOtR1Hb+NTlzbNnpS7nzNDFVtaukpYv62Qyc4Cui5T
	/O5Q7ert1yk4BQiZI4bG1PLk5KbfKA0bcK72EkA62F3eFbEY6McrZgX+5B9PdI/gSikf1JGgL+k
	xs9eBa9aZyJe7UAi5AUVsIXSQ9D/fRyW6dbxYvWKQBE57ZjTz62SQP8nN/u1enEx3BsRZtPzOam
	B9W1UCLs7dgwG9tA5y0N0eXRKLFjQxzYnfaAXe5Sy7Wt6ersISeqBdiP2Dlr5XE95QC0u4unT9n
	UVpnw+Hi0E8GK15nbGHGdv/QClYRAbJTTxnxqgIqgmpXgrbu7tIxPpZXziJ93RmIujyL1KKNDI9
	p9y7i0Loz
X-Google-Smtp-Source: AGHT+IHTNaNyaZjSAe6dk+Ae37sG4GJirJU8op8fnrnb4Wrhafn320T6tKiVbEkqDqGida1a1zBWDg==
X-Received: by 2002:a17:903:1b23:b0:220:eade:d77e with SMTP id d9443c01a7336-22df358f9a1mr65168305ad.40.1746028325154;
        Wed, 30 Apr 2025 08:52:05 -0700 (PDT)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com. [209.85.215.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e87d5sm123565945ad.118.2025.04.30.08.52.04
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ae727e87c26so1034a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUj4nmXqTT8IsTUzMX4wptHb1ze6xTm3pcEnPMtJ7RhhNr1XtLsCEG5h3o11gdmWs/0I+a0sLl3ckvRkN+aYj0bQVpK@vger.kernel.org
X-Received: by 2002:a17:90b:17d0:b0:2ee:d371:3227 with SMTP id
 98e67ed59e1d1-30a3330bd2amr6121407a91.17.1746028323966; Wed, 30 Apr 2025
 08:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com> <20250430123557.3d8b1de4@booty>
In-Reply-To: <20250430123557.3d8b1de4@booty>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Apr 2025 08:51:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
X-Gm-Features: ATxdqUFfYEEYqvpO67K1TXBYapYURxE3d7Z_gt9FzIWHk5tUMzE1QBIfnvJL-xI
Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Christoph Fritz <chf.fritz@googlemail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan <mordan@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 30, 2025 at 3:36=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Doug,
>
> On Mon, 28 Apr 2025 13:59:50 -0700
> Doug Anderson <dianders@chromium.org> wrote:
>
> [...]
>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
> > Tested-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
>
> Thank you for your review!
>
> However I'll be sending v3 with some differences w.r.t. v2, in order to
> fix the 3 bugs reported by Andy Yan plus a similar one I spotted. The
> fix just is replacing PTR_ERR() with ERR_CAST() in the 4 cases where the
> involved function is returning a pointer instead of an int.
>
> Your review/test tags appear global to the whole patch, thus being the
> patch different I think I cannot include your tags in v3.
>
> Let me know if you think I should do differently.
>
> Sorry about that.

It's fine if you want to drop my tag. I didn't have time to review the
whole thing but I felt like I should at least review the drivers I'm
signed up as a reviewer for. That being said, I'm not counting tags or
anything so I'm not offended if they're dropped.

My understanding is that the hashtag at the end is at least a
semi-standard way to say that my tag only applies to a small part of
the patch, so it seems like it would be OK to carry it, though...

-Doug
