Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BEF253B61
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 17:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294909; cv=none; b=eHwXSD/pRlY94NOoTxwVtzo/Ysq9KDvqUhs3LVdkzfrEmyxfwuB3YHZGqBEo7H0itUHwvUDMyjcSh3s0zFDm9XTMuyIv4dBpgIh8Zb4cH7lXk/h81VizgDVjCST81SEMH75ChS8IAHZXdO4GD9I/+1jgatamkPMNAClMqdNvyBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294909; c=relaxed/simple;
	bh=a5cIVDB/XqIyZLdjQfX2dKjmeJTuroJeXtpvtv2BIfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mVpuzcJbyNRBlQ4EWhR+206hHCkBnVkRrBiaw80VJ2O5vSVWsXV3OgDVHO92kfgi9qc1Fw56rHLfOZX0CIsupHTBuUVU/1++Slb0up5+o5sj7kpVvTLaiWQ/SOj6fZXnJnEu1NtXF4/3/eUGRp2iF5Y7dPOE+u7oBtbiDfSkSw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JqFhPF+Y; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JqFhPF+Y"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dcb97e8a3so3738227f8f.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 09:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294904; x=1739899704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XGuymloIkb07DBUsJm0q376VtiZsOgNoZNsnmfiTCVw=;
        b=JqFhPF+YTp9EKbAI0fLE7o+zo0Msj8mJ27PsaU7Btwn7Jzs0SDConc4d1c/wtt/IWW
         Kq4Kj6oUfQeQQuleQ3/b8+PSpRL07Cvfn9j+c6YtqAaOVqn7CQFw31pRuj+BZcX3sgLC
         3PdBMkrkEnCVvNmEtCj1mZz9IqoMLr4c1dT9/ZayUJzSy7ePILtWc1V1D/sfDHFLPtgt
         FBGLQjY96Vw+I1GYcMTsz2C9vxBqXYnkUcZHO+vvF+C39iqok0DEpUrXoVHWjsw8hGzT
         kVBcPWZ9qci6b2G+Vov2M9p7+pCP5bmsTZGWwia9LDuGitD3uBf33TCfmo6C3/FTJvyX
         kg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294904; x=1739899704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGuymloIkb07DBUsJm0q376VtiZsOgNoZNsnmfiTCVw=;
        b=pDt4AOLDQPCa4s0R3m/evfHDW8ntCGEYm6OPQkex1vuq4KlFQyqntAbtCp/ndAdVVf
         stRLACGkT1rct8nxC4QTDcxpEbD5D2QTXxGXwJ8Hc5Y1oK4x2jrbvFBs1BCUPYFtwpkb
         CIylZtIKtf5+qXjYjBJRLtIClR6PiRz+hEQVTPtyn9q5vF5BaMDYr4ahvdRQQyhoL6cG
         DWKrCwe8B+kiFbqgdlKAFRprSz+7nCwcBzo/jt1xd/1n7eu6jUjqOCuVXlZBjO58S+rT
         ZYG7kVjsGkH+7XzeIJXTvn9y+P9M6gEVU3XB7OOx5qi07vBg+1bcQ6vFNUuha8pzXRWP
         RwKg==
X-Forwarded-Encrypted: i=1; AJvYcCUB3xYVitV6RXkzR/Bwt/iNE1vL2/a9siq5kShxMcJxWQOeE8JS/uE+uXIxlrrlQWygaXYUDqRcfPD+oUAXHP+zJcUW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+bhYo0pv34W73BR1OBdReeEb48UQeoo7as92To14NKJXNrbEg
	Jq2ky1FQPcLE/B+7d5ZVO3nKTTOc7/JsU598kLqEAOEVYk67YG3t+4Xv1N+nNu0=
X-Gm-Gg: ASbGncueuAzb8jVzjuflb0VUWGlIYHn+pVT0oMdMQX03ng6+V9Ngqq4SVLxKeX+eafe
	Yj60PpAXVp2CrryHG6QcyBcv4rEDzb6ZB0v44JQK5Vpjo3svdSMnRrmwJVUvzCqOUwQhJV3t7HX
	nWfqSIeW0mPb+vpNOY/lZexPB72KuXaTrchtzYCAhIjHEA5myMA1Xu9j62AGfhNzBLOJmHB7Mk0
	xIkXZEX+37LxpAuWWfXVhlabbJKpM9AJNjFGRk3QH+BHNhWYF/si2s327aLKXjPoKz9SVIDF2hi
	GCTPazufyv/OECx4Qg==
X-Google-Smtp-Source: AGHT+IEnLhYUowYHE0yKYJiPhnWPf3ZeYK7gEVcdnt/kejC8y5qrfPO/D7z6hU8xWCz/RTS9lenTeg==
X-Received: by 2002:a5d:6d8d:0:b0:38d:dac3:482f with SMTP id ffacd0b85a97d-38ddac34a13mr9552027f8f.20.1739294904276;
        Tue, 11 Feb 2025 09:28:24 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 0/7] driver core: auxiliary bus: add device creation helper
Date: Tue, 11 Feb 2025 18:27:56 +0100
Message-ID: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20241210-aux-device-create-helper-93141524e523
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2783; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=a5cIVDB/XqIyZLdjQfX2dKjmeJTuroJeXtpvtv2BIfo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g1Pe4IH0OZxqD2nUyrcAQNxBIXu0/k/eK1P
 eeZU0tDtUuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uINQAKCRDm/A8cN/La
 hTwuEAC0yRgoF5+sh3729QlMMArb49bUXPCcRfPXuGX9LfhICUU4rDzmeyhZ73ixiud2HTj/cU+
 CD1JkxcQMgGt91XivcxSZaa/O8J0yiPY7XsyumB7lZztf3UOMsCyUYTcKtXq5nqIs4XCbEhpJBv
 wWROK3l7aHwYaq86foxHXPKLBnOdGvO9tG4Cd9dFUqvfkunsU8f1EiHoxbmp+8AixeZ8JpI2h4m
 RjfqKlyTgw1YwDSy8gvB5ZPIPfJVWyTKmC1Scwl9vPX/7HwArcDqpjHRlq9wCWsX1X+dYHwP114
 skbcxvzytfFkqEWc/m9N/YUNN2dmQQm9p2R1+J86uloEWI4o5KzhTYOpepjT2AkP1fIujSUKYHZ
 /rh/PrI+zpIhqvRdlvWTgCLIc/16EpKDNCBjZm6Uvr97KnbucwB0DCt3VCIVrzNe0IS/YeK6OhJ
 lildtlGnvUpl2dz96XT3fC5LwwQchqy+/WWifjqotaNI+P2EF+piohEbV+BE1YCqkl75qvhErq5
 jYQ83+S4Fv3kZTw+9RDwCRDGX4prBwuMRTKuurwvRjXy3rrJdHr0VSfiRqXP+ZsEqCTGpkiLz/9
 aR1gap1Zu3kcgRpqyt4RTF3xD8Ji6TpRGWpayTg2eFIl/D+xovgQKgGFBvkXIlBF5K3AjkP5YO/ 5n/HysQTp88OoaA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

The suggestion for this change was initially discussed here: [1]

This patchset adds and use a helper to create a simple auxiliary device.
The goal is to remove boilerplate code that tends to get repeated for
simple cases.

Only the last change was tested on actual HW. The other usage of the helper
have only been compile tested with x64_64 allmodconfig. There are many other
simple cases of auxiliary device creation but those tend to use the
'container_of' trick to allocate the auxiliary device. It is possible to
convert these drivers to use the provided helper but the conversion is
slightly more complex.

[1]: https://lore.kernel.org/linux-clk/df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org

Changes in v3:
- Implement Ira's suggestion to use KBUILD_MODNAME by default, same as
  auxiliary_driver_register()
- Link to v2: https://lore.kernel.org/r/20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com

Changes in v2:
- Add usage examples, as requested.
- Add 'id' as function parameter:  Adding the example usage showed that
  handling IDA allocation was not appropriate and making the usage more
  complex for simple use case.
- Also add 'modname' as parameter: Most driver have been using
  KBUILD_MODNAME and this actually rarely align with the driver name.
- Link to v1: https://lore.kernel.org/r/20241210-aux-device-create-helper-v1-1-5887f4d89308@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (7):
      driver core: auxiliary bus: add device creation helpers
      reset: mpfs: use the auxiliary device creation helper
      drm/bridge: ti-sn65dsi86: use the auxiliary device creation helper
      platform: arm64: lenovo-yoga-c630: use the auxiliary device creation helper
      clk: eyeq: use the auxiliary device creation helper
      clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
      clk: amlogic: axg-audio: use the auxiliary reset driver - take 2

 drivers/base/auxiliary.c                  |  88 +++++++++++++++++++++++
 drivers/clk/clk-eyeq.c                    |  57 ++++-----------
 drivers/clk/imx/clk-imx8mp-audiomix.c     |  56 ++-------------
 drivers/clk/meson/Kconfig                 |   2 +-
 drivers/clk/meson/axg-audio.c             | 114 ++++--------------------------
 drivers/gpu/drm/bridge/ti-sn65dsi86.c     |  84 ++++++----------------
 drivers/platform/arm64/lenovo-yoga-c630.c |  42 ++---------
 drivers/reset/reset-mpfs.c                |  52 +-------------
 include/linux/auxiliary_bus.h             |  10 +++
 9 files changed, 157 insertions(+), 348 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241210-aux-device-create-helper-93141524e523

Best regards,
-- 
Jerome

