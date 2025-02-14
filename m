Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A382D266B7D
	for <platform-driver-x86@vger.kernel.org>; Fri, 14 Feb 2025 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546778; cv=none; b=ksXLMYzo0P0gLl/3D5fvvIfdxpYCp2uE0JIpC4wNnES3GU5O6jYjbcEImcUJFnzZcXNf1N+CoGz0TwpTcNp4frmjG2ttsxT5w9YRr1C8p51LBUgroaPJmyyh1hgqEX+TDCPB9nHEVgFJLv/MdUzpRI2rgGBwaDqxO2eK8X0+2BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546778; c=relaxed/simple;
	bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mt7bMw+8v3Nm6iX0zJhO0T+vYuB2ZDGHUGveYDwkiNnYfGXj1CmN3Ifuvti8zi214pYEoj1jwOG3831V5kaTd6JDmO9cTo4fzg6HRErCQuarImuCLguKAoSjyMgPCw02bAngEjqnh8sAjVEQ5GPaadEwQc3sxCs7z9Ia8ESHK30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C5stt3BB; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C5stt3BB"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5452e6f2999so474590e87.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Feb 2025 07:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739546773; x=1740151573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
        b=C5stt3BBJuOOXMAzfMyhLZv00eXEca7HZwOE73UqnCR9RjwLASUVnP6Y7bc4l6Yd+c
         +tkE3SvTx2vg6Zv9rZ6gG5RIy1LO5N7sbN+7bCQOAF2dXw46lbBUjyYzQoKBRVu6ZrKN
         z2+8xkiAjZgSuaQKggOcPLYmoXGdKq6YfH5uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546773; x=1740151573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
        b=DUwOqt5X/wwTHyffI3rZC2/RVfi/7XiZifB0XKJ3leOOxlT+jaAb+mEUTWJsKYv+eQ
         9Hdf3aJePbQzQLj4BA0ETQUJpgikCCCzn7DOIsLT9JrOWsA0FmxUV0XcrbqkNMMitNIh
         LpuTIwVm8SPM6kjN0wKO4oencTOYrsRCiD63at3vg4c7TUHTCjXAxhHw2zvUh2sQHLJb
         Cm4K1mZXcKv7mo4OfMnpXMdaruXfNEuCyJzkZI2bHMmKFTIAoxmz/IIGK+ohLxfWcM+V
         A6L2OKdcn03zSMNiSGBVwagv2E7v6pMu2uU8wkc+MH3Uif+Wtr5iPE4U9q91rGAh1s7b
         bo2w==
X-Forwarded-Encrypted: i=1; AJvYcCWZ/KN6XbOQ/OMJk1sINXUQSz4zDoZ2UJBdB9eMmBsVbJI4iobWC2HT+IVeKMydGSS3Jdjl5bhRApqMFI//hTZA7mHA@vger.kernel.org
X-Gm-Message-State: AOJu0YywmIwtRaHilrZZ/beebI8xcDMCqmVpKJlMi5nopWICE+8X3v6J
	PQADUy/UDZosrHvvPLcbas26Ca6XJbkQ8ApKJmJ2PkDem40MRek3ShBhhkQHsgm/K3PcxcSaLeP
	4mg==
X-Gm-Gg: ASbGncsXq3XjbbtyioDeLjMhnAoXlRxKQrfBKnY7RgyQRfzOefkmU4yWlll3vUqJUyT
	WYc8a2Oj8ewa1CIzK17MswGPY2qCBHnoBSjmLJRYgykFPoDcfjSrQOLri4Qe0jTaKcpXZC3wssN
	69GzoqZ9mcp/J7XnyuSTLkLf+4JQUuyCx072bsBUYVkv2OyfRgGlY1cSivOEmxJboJojmgZlJD9
	TbNUKntRDu4fcLdTT2R+cQHADybKvbRgq5vRN3LDA3Ud9u7fedKU2SLwstJ+hwSVpbOBZSuql/B
	RJpurj9HOGjNxWEjwrJe3p+eAxUyS+GgDd0RmhG3Vp8dniefGAK0J0uMmU0=
X-Google-Smtp-Source: AGHT+IHAu+vyN7HPEfsOUtsp5Yp52IhHxJNXRx0cycHirCzbBPqBu1mmSr3hiHY34Xl+61EW90mhAQ==
X-Received: by 2002:a05:6512:a8c:b0:545:17b:3cf9 with SMTP id 2adb3069b0e04-5451ddda522mr3181712e87.48.1739546772952;
        Fri, 14 Feb 2025 07:26:12 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f105d71sm553301e87.148.2025.02.14.07.26.10
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 07:26:12 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-309191eec90so12257681fa.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Feb 2025 07:26:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUw0v3Bn8Vj33RZcMIWX2q56wuisNgL+mzKNJZPJUrhgeCfIM/IQfpBI/IFMhAGrJk6uaIsm/cMXaNIzyDzk/n80Ene@vger.kernel.org
X-Received: by 2002:a2e:8a97:0:b0:308:eb58:6581 with SMTP id
 38308e7fff4ca-30914801891mr14311001fa.0.1739546770563; Fri, 14 Feb 2025
 07:26:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
 <20250213-crown-clustered-81c6434c892b@spud> <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 07:25:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
X-Gm-Features: AWEUYZn5Dl35ky148QOOCnARP_86rg2vhIKgVTUOs7s9KbdYhXOWWeRWr_r9yF0
Message-ID: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation helper
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Conor Dooley <conor@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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

On Fri, Feb 14, 2025 at 12:59=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> > One think that's always felt a bit meh to me is this id number stuff,
> > I just threw in 666 for meme value.
>
> :)
>
> > The whole thing seems super
> > arbitrary, do any of the users of this helper actually put meaningful
> > values into the id parameter?
>
> In example changes I've sent, no.
>
> In other simple usages (those using container_of()) of the auxiliary
> bus, I think there are a few that uses 0 and 1 for 2 instances.
>
> I guess your question is "do we really need this parameter here ?"
>
> We could remove it and still address 90% of the original target.
>
> Keeping it leaves the door open in case the figure above does not hold
> and it is pretty cheap to do. It could also enable drivers requiring an
> IDA to use the helper, possibly.

FWIW, once you resolve the conflicts in drm-misc with ti-sn65dsi86
you'll need the ID value. ;-)

There was a big-ol' discussion here:

https://lore.kernel.org/r/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.17291804=
70.git.geert+renesas@glider.be

I eventually pushed v2 of the patch:

https://lore.kernel.org/r/7a68a0e3f927e26edca6040067fb653eb06efb79.17338400=
89.git.geert+renesas@glider.be


-Doug
