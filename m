Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181F32153FB
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Feb 2025 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441791; cv=none; b=H56y2Iw2Y8nU1l2Va0Ipa9NuLV6TrjyKOoT6EeHvVgHaybW4tlh/cl7qYOehU3Cvhs81TTICupYIl2lTCovZ7WOlPGH02wdIFtTblp5ukcIFuNzOOp+DaiKldOs5dg/DPkmUdV1wHMypL+eQbhgz8BhF5pcH8n5iNNlAvi0JhKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441791; c=relaxed/simple;
	bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XC+QFPDCicDcbHhGu/v6NVy46cTNyn9Zbphq1fgSf93cgKL+1Ns1xT98hIuCyIHszUoGVO8q96qL5b+DMp/GaQvoRer9eBnGTZFNkYIgsVeX88OxU5NIbVmi/n3GTwEkoOAd0ss7OLWih3euKfxsAkwoaQEp8lSp6oLIdwrYGv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=baYxDlmE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="baYxDlmE"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dd9b3419cso353474f8f.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Feb 2025 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739441787; x=1740046587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
        b=baYxDlmEYIYvjfbu4jxW8q+NipL4xiZzYboYksA07dYyC/9+JEBKzgZ121waBA1QzK
         TTceqAW87LKEBjGo+NGh/r7H5TwGcK3hjbiQMnJdKL7Uo9smDwE8zpaZCJRHDvgsLSPx
         hUCWXEx+872+qjNfzWL42GE55KPXCCbsloGM+ZMmxG5AIOtXthF2sreQoq5aq7FoovhB
         5HBUIFPQVDaNQtgtoZAakH2ejW5TyNE+jD4zKdWPVCcUSW6aOxFgk8VGJfQATww5mQaU
         vKoNZJIYOFk4LRYA9skQPjAPwngn7lS3bpHUeJntCndndGpgHev2xXY8LigkonNYcOY2
         ayEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739441787; x=1740046587;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
        b=clQQfp0bllAbew2No7Yoj1moUzksVpL+t6HwI9wz28liy5w6EmTjkH7nxDWMQo7aRh
         uMr8f3hAxLP6slj7gf7P3FkHvBWQbBmRhoJsvXm1ees2St8DaD96dgou5IpofFqA81jB
         P5nroON2VO5OEN9AcYKA2uB0eOzFCUrzNBtz5BqfvwmR1p7Ge+zyBKzMY0JRstLcfGlk
         PKtmSUePc0tKrzok2zhSrgP+YDqDCTmCvwM7PDCowidVO6tNYa7uYxYK/81nWkkSNUMh
         xp32VCLgo4ZatHq4yU0qgFxvK2Rg0rLL8/2myHtCYXcLOKxx2OCgrmpS+zvsOCNP73sH
         gasw==
X-Forwarded-Encrypted: i=1; AJvYcCUgheGcJgVFRRsh7O2tesXZP5uij8hiQWAWBn3Jcii9KosjV4xUZgI4l4xPSL6nkdIl1Zx5FEwmONvT2mphughJf1F0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Zd9mKrf9UQs6cBXwqmb07i+he5QkLS/+o8a3luuv9pD+1QTu
	HmXqM0Q5gTH0MeFZy0s24vxzjv7B0DCKn7y+ST6iW4RqiVCe08YczP9O8BZ6NaU=
X-Gm-Gg: ASbGnct1ezOYYqZaadrKsBqupNnRUmtYm7WM7+rw785Q0TGddUfD8kC/F873er79T/v
	IObHw5EaJ2KF8nr5YrKaGhJSWMTd4PSA+NDfV/nA/s5x2FKrAJG+CGK+hXOkPfvWcANYP0cpxou
	smGlV+vqIMMrnujPbajsKmDfoxREYZTvsyNftCtJxjLFOkT6y6BPISnFciVOgGVsczfQsuh/S2i
	tE4jwpkXI6DUU2MID1kHMdl3q6o9jynXooUQKitJwhw91/QgSa/emM2uz8ai7JocmzEoqtgIL1m
	a5pUmNutC2n16g==
X-Google-Smtp-Source: AGHT+IEffmNN4Pb9+ARCo3GKUiuLAJbsEVpvuLGQpUwyPZc6Fg0ln2kIswpBpy9K/UypDXBJlkii1A==
X-Received: by 2002:a05:6000:1884:b0:38d:d8d1:a4e1 with SMTP id ffacd0b85a97d-38dea3c42dcmr5386478f8f.4.1739441787185;
        Thu, 13 Feb 2025 02:16:27 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm1451341f8f.94.2025.02.13.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 02:16:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Dave Ertman"
 <david.m.ertman@intel.com>,  "Ira Weiny" <ira.weiny@intel.com>,  "Rafael
 J. Wysocki" <rafael@kernel.org>,  "Stephen Boyd" <sboyd@kernel.org>,
  "Arnd Bergmann" <arnd@arndb.de>,  "Danilo Krummrich" <dakr@kernel.org>,
  "Conor Dooley" <conor.dooley@microchip.com>,  "Daire McNamara"
 <daire.mcnamara@microchip.com>,  "Philipp Zabel" <p.zabel@pengutronix.de>,
  "Douglas Anderson" <dianders@chromium.org>,  "Andrzej Hajda"
 <andrzej.hajda@intel.com>,  "Neil Armstrong" <neil.armstrong@linaro.org>,
  "Robert Foss" <rfoss@kernel.org>,  "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman" <jonas@kwiboo.se>,
  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "David
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,  "Hans de
 Goede" <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>,  "Gregory CLEMENT"
 <gregory.clement@bootlin.com>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Abel Vesa" <abelvesa@kernel.org>,  "Peng Fan"
 <peng.fan@nxp.com>,  "Shawn Guo" <shawnguo@kernel.org>,  "Sascha Hauer"
 <s.hauer@pengutronix.de>,  "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,  "Fabio Estevam" <festevam@gmail.com>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  <linux-kernel@vger.kernel.org>,
  <linux-riscv@lists.infradead.org>,  <dri-devel@lists.freedesktop.org>,
  <platform-driver-x86@vger.kernel.org>,  <linux-mips@vger.kernel.org>,
  <linux-clk@vger.kernel.org>,  <imx@lists.linux.dev>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset
 driver - take 2
In-Reply-To: <D7QJX632CRCV.P0ZI0WWT083Z@bootlin.com> (=?utf-8?Q?=22Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun"'s message
	of "Wed, 12 Feb 2025 15:53:38 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
	<D7QJX632CRCV.P0ZI0WWT083Z@bootlin.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 11:16:26 +0100
Message-ID: <1ja5aq175x.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed 12 Feb 2025 at 15:53, Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> wro=
te:

> Hello Jerome,
>
> Why the " - take 2" in the commit first line?

Because, at the origin of the dicussion for this patchet, there was
another change doing the same thing [1]. The change was reverted do
perform some rework and now it is back. It was another series entirely
so v2, v3, etc ... did not really apply well.

Just giving a change to people using google or lore to distinguish the
two, that's all.

[1]: https://lore.kernel.org/lkml/f9fc8247-331e-4cdb-992e-bc2f196aa12c@lina=
ro.org/T/#m9ab35b541a31b25bdd812082ed70f9dac087096e

>
> Thanks,

--=20
Jerome
