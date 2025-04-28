Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0083514D428
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Apr 2025 20:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873647; cv=none; b=mkndFxzxiN9mzbkE46HfDn6D2b29l+ysU9QfRSaZ1eLgOtF9MqryZkvZ9WB7BNZf9hFM/Oep7ID7twrndHwsyH46UZJCiU7RKQwwGgtdZFdiS9RGcu8iMxqOxHMFDrf01+xxjEKdZ0N0ay1Ael0ZodcEJpbpxo1jzM6a0x6BbIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873647; c=relaxed/simple;
	bh=n4WGwCItyZewiOJcBSp4Eaj+wnGcnc5O6i3QGT0fNG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZ2Lf/RA6MTSmWfFbpW9cTajJFe0hlDqO+p1WpWPBJ0SZKN+BM9ml9hegospsoO/4EnCNmGG3XJhP8DsREU0YoUFuIwIU9gel9SgbsirZE4pGxmiC0grb3wpK/HmcLzjxVuSjREE6T8qc5hnFuFe0tUPw3CPV3p1N3JOeCwp4hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YHujt9MM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YHujt9MM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22c336fcdaaso62878335ad.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745873645; x=1746478445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=YHujt9MMTp8bKrMsFmXM63bMM8a+I2YXydtfpVDqQAF3DVIzLp41fZ7aZMRYjXHg1l
         DhEJEskBspuF4q7G933v3fo40LBtspLETpFYAIzL7KWa41H2k04Aq+LRX3YOefHIPU/Q
         nfKgompPqt/dqYsgIAhR4l+BSNllmue2YLiEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873645; x=1746478445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=TjwNTL2dY+3yP/4IE+350oqYhpd3d83YsMdvu9g54+iFUwBqceRDp3MBsstQ6sK8Pb
         hbhS7RH1Xu5trVWNgI7yzfaoCoJsLIs3hYwiLuU4xqQwxh51iHEYzOYA73tkoWVYjXy2
         hQ+Ho+2sigJYrKUJi8Ik4aOvhk47xq/1oOzWYfcwpBc1icXsbq5464BeOv2zrSDsAZV9
         q3c2CW1fqq4KjCOVw+pkTSg9TH753TiZRVL0DdUxdIN3/hayjzmpwXMkHmoRwfaCIIXp
         mBCm64KD5XUv4Ky2c93ZPpaeOQu+9BfXOJgsdef8wxRzSjI8PBHuPqTegz6J0jLnxyrI
         u6Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWIHu5lrEa2M81LONjsmcpX+XzO1Uk+fFIUBMjWYvrsB8PzG31833CBM7ul8cOnssajW8pkyeH361F7jQY9ZAPu+P8G@vger.kernel.org
X-Gm-Message-State: AOJu0YwY/kxq5JySDytifuX9eKo1B50f8mZqbPnBjP5ht/9kYm1RTW21
	kpzFlX7Uy665E/FVJScD/8ciZlmvl6GKnIjLYiHylCqJTgBzyOK+j5/bxKmHVld0c081jwqMKMM
	=
X-Gm-Gg: ASbGncveEp+692ZloymXgFG78cEds/ive0G8V5oYpxsJlSfJAqVTlHVSUlGINga2M9h
	4UGCPmfKE51WUETzudk7/kmhWd5mfj/hJUu4JHCacLivCKgC20DIjdhrPcVBXjBVAfuhRN519R1
	lWwKCgdYTQSJLmMyxuO3RtCgVyuWQnE3lCynqqahUmSGl2eBqeLK5bQzd7PyRSacZFsk5ccGUzU
	V8izkYdiZnNgpB+Kd04S0IhKizYCYQsmzC+DAp+u/UKIQQtnA4PW+aMSLmnVFe18dvS9vQ8vpaQ
	cyMKsacJXqsuLMJ4IKfVxCItezcz52zR7XtGOPbR00yZC36nWGuuK8hhEjQ/++LtV62uFUniv2V
	w0Nmde+pzOGgi1JM=
X-Google-Smtp-Source: AGHT+IEHAMoWw+AUEb7DCXGZ5grUNX4MnykPUXDXpyK9CeLBtN9rD2PCZOf0l2PoqktgeEwnDQ+B6Q==
X-Received: by 2002:a17:903:2a90:b0:220:d79f:60f1 with SMTP id d9443c01a7336-22de6066d53mr13211375ad.42.1745873645396;
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7613sm87633645ad.143.2025.04.28.13.54.05
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3035858c687so4431847a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2qqRiiOST2yVN6Kno/omOLj5TfKPp36HZx1O8cEvV2+opYaF5fDL4c4i9SGcElAIFtxOaod6cwSIo4IXeNSYWLoGh@vger.kernel.org
X-Received: by 2002:a17:90b:2d08:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30a215a9e35mr1596359a91.31.1745873644318; Mon, 28 Apr 2025
 13:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:53:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
X-Gm-Features: ATxdqUGX6srhk44LYXds4__tJ7VKjYOOGbCee4VbhetmdBaO7SswZM-oniFpcj8
Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] drm/bridge: ti-sn65dsi86: convert to
 devm_drm_bridge_alloc() API
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
	linux-stm32@st-md-mailman.stormreply.com, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 24, 2025 at 12:00=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> This is the new API for allocating DRM bridges.
>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I can confirm that I can still build/boot on a board with ti-sn65dsi86
after this patch. Thus, happy with:

Tested-by: Douglas Anderson <dianders@chromium.org>

Happy to have someone else land this through drm-misc-next or I can
land it there myself.
