Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4F81DEFDD
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Feb 2025 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378765; cv=none; b=T0dLGmw2CIIdMktPGWzIaSV86HMWSrbCSn4+oEmovEzlWUVpiXxqunDiPuvQnj1AIOa//lY8FKM8n6agRCvJUbNiNeco40/n7LRB8SLftsS9tN0vNts1/LqYBXak1HFKgEL5F2b858GSWZyp3iJN4NZzALrOa8J8WxAm+GHtFJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378765; c=relaxed/simple;
	bh=BULMItlD7UmqT+FeS+xvhAotN9kxf42G+uPp6a158Mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWHUxAnHMZC6lW6/tKBS2k2GZPPYvJzjuBeM4r+YJWmhauGHDwZh6uK8Dbu5DxVpbUQDvA0gqMaBucD335soEbhCORGS7X25VQ2XSCSFf1Wn8dN9aWwnmlH1wjmyJI6FW6a3IjbK6rn1BWk6urf+K1pqquB0l85ROF94sytP/pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TOOPV9PS; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TOOPV9PS"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so8480872a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Feb 2025 08:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739378761; x=1739983561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
        b=TOOPV9PS9Bmi3g/f5j5x/20vyT6gwfScW7C7L/jMWKHmVmUtgGovtDWbtr6CNwRHS3
         6/9e0sYHijaZXO7Q/qoInb7ZEmpagwbamP3TDKZE9E2XLGb3budFDBlz9A0LAmTNlik+
         0IV6AYKL+ZeUNCu4tFZ8ooc0kj0A7Os849HoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739378761; x=1739983561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
        b=foDbRl4CZ6VX90D+yH48NzU0T1DKrUfgTQSl3a8KXtHEFn5dufd/3tDsW4Tgy+K/RB
         Ugy4qK4JT/hsBIOBGyGMDEkX3nIw3A/SLBUmxezu2ecsMpBlzFe0+klXtQ1y0bRqPLhO
         wVi21q+I7+cYWsXSijGs6fgQPHkvabUbpj6iTLV6krh+5bxtaZD7x2oFbbp6kQGaFoyI
         1ph4FEIDZY34BzQYp7VW7kiDDAfjr3wuiTVcMi5SiSgumxNwx28YMdIhHLGf8K/NndD7
         l64tc15eTtIXf8Ys3Rb7WiC+9spDtrruvKMBV4z5xe1eU5evwlAiXIKq5xjBOx89ecRE
         Pejw==
X-Forwarded-Encrypted: i=1; AJvYcCUoWYeMh7OjDz7eEDRMHUTLmDFM3c4QpfbfMh7BNpdxhYRvRRhwJFNDJR807rDDrtBogk7C3Gzn+WETnmfoQGZeuvA8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0wVfdwmUjGSFjYsU6SKB9XxGN7bI4YPOFrt9klhBpyd+B9HOK
	XFTrahKlh17ewusQZ9kWIC/VCzk3c/4Eic9QAMxx/bggr6nyugP9GVOSQoCAT/kQN4GzLlln7y3
	9k1U3
X-Gm-Gg: ASbGncvG9hbgscTK0jy1tWyGk/a61FoVcA6pGfd5Jn5cil6l7ik9q33tLUI3axjh5h+
	HykiQR7eT8EodQCRaIdDZLtsZEut2gr5K/agVBZ0dp6O5Szo2hkOaB8BPKK+55cNN74GTaA2Qjs
	2bY1bgnOoFi3zU0WpoyQn2F+YzyZxSoVv50X98kqNGf3xqTfpQD10ROUAh7ozNj9dJLNCthaiAH
	ObQJGtSpuPbpJfH4fPcvQ5HDBEDsdyA3cXBx8n9CXK+USGXE6OrYjMzY2abECgx34sRluMDi6yY
	XfP7Oj5ndQqW0XnEEMkoZd+77pdrMkaydcZScdTuP+inNv9bFrmjz1s=
X-Google-Smtp-Source: AGHT+IFA5v+Zuz7LYv5QAlq4VZL3xmeVmPE1UV8oJDVGIy4hDAeFlRhJ6daqNdjR+iiF7cTr9J1h+A==
X-Received: by 2002:a05:6402:13cf:b0:5dc:929a:a726 with SMTP id 4fb4d7f45d1cf-5deb0bd6a79mr2782978a12.26.1739378760646;
        Wed, 12 Feb 2025 08:46:00 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm9156335a12.45.2025.02.12.08.45.59
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 08:45:59 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so8480769a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Feb 2025 08:45:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULU45hhQVeUoEx/RmTm9osQAzRhSJhMwwFcBlW5ketvgqXapjK8Xs5AYP/8ctdRkTRDDckTWHezAnZZGsagr3GZ0I6@vger.kernel.org
X-Received: by 2002:a05:6512:1195:b0:545:9e1:e824 with SMTP id
 2adb3069b0e04-545184bc12fmr1571346e87.48.1739378317154; Wed, 12 Feb 2025
 08:38:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com> <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
In-Reply-To: <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Feb 2025 08:38:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
X-Gm-Features: AWEUYZnEAQCx0nU_sk8MYOvtfC7Gu1h5Zsl0lbrfbQPnQTV4y2laVQqsVCR6NTE
Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary device
 creation helper
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

On Tue, Feb 11, 2025 at 9:28=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 84 +++++++++--------------------=
------
>  1 file changed, 20 insertions(+), 64 deletions(-)

Thanks for creating the helpers and getting rid of some boilerplate!
This conflicts with commit 574f5ee2c85a ("drm/bridge: ti-sn65dsi86:
Fix multiple instances") which is in drm-next, though. Please resolve.

Since nothing here is urgent, I would assume patch #1 would land and
then we'd just wait until it made it to mainline before landing the
other patches in their respective trees?


> -static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
> -                                      struct auxiliary_device **aux_out,
> -                                      const char *name)
> -{
> -       struct device *dev =3D pdata->dev;
> -       struct auxiliary_device *aux;
> -       int ret;
> -
> -       aux =3D kzalloc(sizeof(*aux), GFP_KERNEL);
> -       if (!aux)
> -               return -ENOMEM;
> -
> -       aux->name =3D name;
> -       aux->dev.parent =3D dev;
> -       aux->dev.release =3D ti_sn65dsi86_aux_device_release;
> -       device_set_of_node_from_dev(&aux->dev, dev);
> -       ret =3D auxiliary_device_init(aux);
> -       if (ret) {
> -               kfree(aux);
> -               return ret;
> -       }
> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, au=
x);
> -       if (ret)
> -               return ret;
> -
> -       ret =3D auxiliary_device_add(aux);
> -       if (ret)
> -               return ret;
> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, au=
x);
> -       if (!ret)
> -               *aux_out =3D aux;

I notice that your new code has one fewer devm_add_action_or_reset()
than the code here which you're replacing. That means it needs to call
"uninit" explicitly in one extra place. It still seems clean enough,
though, so I don't have any real objections to the way you're doing it
there. ;-)

-Doug
