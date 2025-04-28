Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FEC169AE6
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Apr 2025 21:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874392; cv=none; b=bqOidF8DC9sFiGKeJ2LCRTU0sb87Uzc+YDJpkwlVZ2XhyE1ox3hSrv3bYeo96QubF8TaArXwTgAyp0yybGtvnLz6zZTQ2YfKcujt77l7ktJIJGWL8lA251z80xgOqBjNU+szJMtRS4E9/enAwn/dnUfLp802Fm57y2acUB13N14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874392; c=relaxed/simple;
	bh=sehDf/wz1Jc2NfNVJoDIU1m599/TWswRXczsp9U/qmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcK0LfXmJ+ypkKSNXS9648bO1cZTJB8VhQlbhIbGDkc3jKM4srbyA7dY/E43vlcV+9XxWqbT7L3ZdMS1HwJIINXnSYeNoeSxu3ZLoqhDYOVElBjtKld/u2148l2TwwaYLwCv/ekYt1/SEd4oCYPbNqWF+GkpaPOLJFTzE99Rseo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XxIXFqkT; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XxIXFqkT"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5aecec8f3so940418885a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Apr 2025 14:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745874389; x=1746479189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HZyp8budJTYWJ9MOmTZnBjDzB8PV0g52ckHb+nyRQs=;
        b=XxIXFqkTiKJz+Ovy038TttmiM3L65Gkq7AbGcaarJG4PhZmvFKtEN5ThTT9QC9KLJz
         eYQhxcX5X1gfsf3N49p3pr2TFa90STUdqLEERs9Vnto3xVg/j5ZRtm04MCq9ZJmSB9qh
         j/OnTjuOwXroKtqJuEHxUlYPEEkqCCybX2JXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745874389; x=1746479189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HZyp8budJTYWJ9MOmTZnBjDzB8PV0g52ckHb+nyRQs=;
        b=g0zAmr5xuLc3ENMEu6CodsqqFQj+vL/PrWAyg72tkVvoSd1e+AVykQvt2Y8ymeUg5B
         03kwyN51YiwWF9rFIqBGW1KOLkuPxg+RS5D6FOIChnBfOY4JIxbBHGZiu2nq1m5YMQ13
         nRZVIGeauoe8msX7gMOEzGtJUn1UHLv8nlPiNP6iDcHILDubk0IylW5Ja/x0xOShCUlr
         /rQ2BDuwW0G3QVnGVDAp6Qu4VE3Fq9Yr18d0jbj5W18nBKhEV2XpMSjpwwqyjK7PCVTE
         aZWm4s/wJN8SR1GupwjYYl6iUdeq0IkOZONwGSzDJqUkCaME0fr8GwZinPr6ljkcY+bJ
         G8Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXb2NCv8IZqMyLssZqka8F3noGUzvRtLYYs4czpemaJ0N887UYajWvmUCAf3YHyCUlHgncGRn8LdvGY9ZFNdXaN0Csr@vger.kernel.org
X-Gm-Message-State: AOJu0YwUmwcWZgNreFWdzV9ai21OTodAgOlcdZswVcMjtgx7s8qIFdXi
	XKo2MAUvKeOoOSp0v87Er6JZMzhIq740nbgVgVmblI3JqDwyO0nkWQi1WmKSNBdMBlAdhi4AI80
	=
X-Gm-Gg: ASbGnctvSjCHCbRoYd8pSfOIp0KpP4e17uTRC6+W8b7BRHAekJ5iKS9mTF079YzonYG
	uKRxuSQHkMazLFHj02yOfUQUd+eQwvB8znrAHniPfcD2IK3qjQEhlup8Lv8v7w+TChfufEOmQWM
	yBhXAg1FehyUTVgXz/ezRFw9WR8WHp15bxmwUYCoA3ATzbXj69LlFU5kbd2xMgtz6kSzjZXDAq0
	vf4H0sIIdsYVYW0/Y++LWNeC+ZVER9eISKZ3BTLwzuyCV/WCiXiUh9mgbx4Cp/Ne+eMHwuxpHpy
	1BktWyuHe1p4oPiqk9XhDMBkAK0lJBCOiPZ/PC5EVk2SyLR507vyVy057tI3HoFeaCY/idyJupM
	tfBMT
X-Google-Smtp-Source: AGHT+IHasqFQCT6LTxN+bDF+FEuUz2uvEg2hOeUqZsGoJQZ+ZuulFOlv2CQ1I4Xk3wgZUsJv2kmxOQ==
X-Received: by 2002:a05:620a:98c:b0:7c9:6d26:91b9 with SMTP id af79cd13be357-7c96d2692e7mr1207329385a.36.1745874389049;
        Mon, 28 Apr 2025 14:06:29 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958ea014asm660689985a.100.2025.04.28.14.06.28
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:06:28 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso94496136d6.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Apr 2025 14:06:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIsglOd0kPel+fcMoa8K5BeXDdNhqrJAtAzheju6kAvRWxr9JL63Q1LnRqzpJDvMKQk9sj+Vmj7y4HiUkIX+2Kjca8@vger.kernel.org
X-Received: by 2002:a17:90b:2e03:b0:2fa:1a23:c01d with SMTP id
 98e67ed59e1d1-30a0132e771mr15291417a91.21.1745874002058; Mon, 28 Apr 2025
 14:00:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:59:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com>
X-Gm-Features: ATxdqUFp3e4vRAA9U9jS3-gUD9FhwChMaNCvlfej-PAqltrXksVDq12UxaUaXqM
Message-ID: <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com>
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

On Thu, Apr 24, 2025 at 11:59=E2=80=AFAM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> devm_drm_bridge_alloc() is the new API to be used for allocating (and
> partially initializing) a private driver struct embedding a struct
> drm_bridge.
>
> For many drivers having a simple code flow in the probe function, this
> commit does a mass conversion automatically with the following semantic
> patch. The changes have been reviewed manually for correctness as well as
> to find any false positives.
>
>   @@
>   type T;
>   identifier C;
>   identifier BR;
>   expression DEV;
>   expression FUNCS;
>   @@
>   -T *C;
>   +T *C;
>    ...
>   (
>   -C =3D devm_kzalloc(DEV, ...);
>   -if (!C)
>   -    return -ENOMEM;
>   +C =3D devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>   +if (IS_ERR(C))
>   +     return PTR_ERR(C);
>   |
>   -C =3D devm_kzalloc(DEV, ...);
>   -if (!C)
>   -    return ERR_PTR(-ENOMEM);
>   +C =3D devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>   +if (IS_ERR(C))
>   +     return PTR_ERR(C);
>   )
>    ...
>   -C->BR.funcs =3D FUNCS;
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Adrien Grassein <adrien.grassein@gmail.com>
> Cc: Aleksandr Mishin <amishin@t-argos.ru>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Christoph Fritz <chf.fritz@googlemail.com>
> Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Cc: Detlev Casanova <detlev.casanova@collabora.com>
> Cc: Dharma Balasubiramani <dharma.b@microchip.com>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Janne Grunau <j@jannau.net>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Jesse Van Gavere <jesseevg@gmail.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Manikandan Muralidharan <manikandan.m@microchip.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Phong LE <ple@baylibre.com>
> Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Cc: Sugar Zhang <sugar.zhang@rock-chips.com>
> Cc: Sui Jingfeng <sui.jingfeng@linux.dev>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: Vitalii Mordan <mordan@ispras.ru>
>
> Changed in v2:
> - added missing PTR_ERR() in the second spatch alternative
> ---
>  drivers/gpu/drm/adp/adp-mipi.c                      |  8 ++++----
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c        |  9 ++++-----
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c  |  9 ++++-----
>  drivers/gpu/drm/bridge/aux-bridge.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c             |  9 +++++----
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  8 ++++----
>  drivers/gpu/drm/bridge/chipone-icn6211.c            |  9 ++++-----
>  drivers/gpu/drm/bridge/chrontel-ch7033.c            |  8 ++++----
>  drivers/gpu/drm/bridge/cros-ec-anx7688.c            |  9 ++++-----
>  drivers/gpu/drm/bridge/fsl-ldb.c                    |  7 +++----
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c      |  9 ++++-----
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        | 10 ++++------
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     |  8 ++++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        |  8 ++++----
>  drivers/gpu/drm/bridge/ite-it6263.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/ite-it6505.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/ite-it66121.c                |  9 ++++-----
>  drivers/gpu/drm/bridge/lontium-lt8912b.c            |  9 ++++-----
>  drivers/gpu/drm/bridge/lontium-lt9211.c             |  8 +++-----
>  drivers/gpu/drm/bridge/lontium-lt9611.c             |  9 ++++-----
>  drivers/gpu/drm/bridge/lvds-codec.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/microchip-lvds.c             |  8 ++++----
>  drivers/gpu/drm/bridge/nwl-dsi.c                    |  8 ++++----
>  drivers/gpu/drm/bridge/parade-ps8622.c              |  9 ++++-----
>  drivers/gpu/drm/bridge/parade-ps8640.c              |  9 ++++-----
>  drivers/gpu/drm/bridge/sii9234.c                    |  9 ++++-----
>  drivers/gpu/drm/bridge/sil-sii8620.c                |  9 ++++-----
>  drivers/gpu/drm/bridge/simple-bridge.c              | 10 ++++------
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        |  8 ++++----
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c       |  8 ++++----
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c      |  8 ++++----
>  drivers/gpu/drm/bridge/tc358762.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/tc358764.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/tc358768.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/tc358775.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/thc63lvd1024.c               |  8 ++++----
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                |  9 ++++-----
>  drivers/gpu/drm/bridge/ti-tdp158.c                  |  8 ++++----
>  drivers/gpu/drm/bridge/ti-tfp410.c                  |  9 ++++-----
>  drivers/gpu/drm/bridge/ti-tpd12s015.c               |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_dp.c                   |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_dpi.c                  |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_dsi.c                  |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                 |  9 ++++-----
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c          | 12 ++++++------
>  drivers/gpu/drm/meson/meson_encoder_dsi.c           | 12 ++++++------
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c          | 12 ++++++------
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         |  9 ++++-----
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 10 ++++------
>  49 files changed, 201 insertions(+), 237 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
Tested-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
