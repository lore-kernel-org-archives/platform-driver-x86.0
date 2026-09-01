Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6949D48CD5B
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 17:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284897; cv=none; b=D3CDGFLo9LjNqg6eizAMCp62v8xDpmgw1n+YdoquYTQ3oIVjKALk+0I+PhFYsDCRAY4Ouu4SDR2hnRx9QTxEQwivqe4hmmqAFBwLSu2/C3iAwo5UdnUJ+4PxyTO8tupLY3nmWicGTvEqNo7mePdZFL7oQDJxZlfBQO7r4mGkI8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284897; c=relaxed/simple;
	bh=vfQaj9ly6LhRgNLfN+7UahmQXADGA5101PUjRoWcTdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i3htxcxLIMW8Uyrh31ZpHp6Lc1PSZEyYBMaLOjBHzxP2H7aOa/tag9wQmNQtGlVebmWDKYeyU7bLCbtUyKg/+fdXyAzlvyYBgLrcd15ddkxy9SDECm19dr/pI/xfNZEe3EDrwlHLA2W+hCxAuyIfCgXCS3YRXaEGz3zVM7r8/tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=Ny+qmMUK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="Ny+qmMUK"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso307175e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Sep 2026 10:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1788284893; x=1788889693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0l43AVlC6vAtGNyUJOGdQyBhYz3ewWV5F6wFrMVKpks=;
        b=Ny+qmMUKeweMa71IhvvxF8Q7ikGujhiyOc+73zDRLfTv2G/AfQxyI6sE7pNc8io4fi
         uFtSCtqLBcwM+S2wTHJ/c14oKkdTpMeJuA7/eGXOwpNtAULdjxRg/anq1rmJozQLiBKp
         aDOX/apfGgmaGsGpY4kITVLzOfDRB9IaJ2/V83+yRi1pdA8Xx2pAJqmcCMl9ongAJH34
         Rz8d7TivgBKxzNoU9HB/BHlWxDW8VF1XBzLRvFN2DFg0isbBOUa+S+Udji9caAD8NLv+
         zVBSQ9ZqTC1c/QLunuGEaDM9GTvtOm8xp0ForhbWULQyNOSjs7GF5l52MQxatIE74XeH
         Xuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284893; x=1788889693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0l43AVlC6vAtGNyUJOGdQyBhYz3ewWV5F6wFrMVKpks=;
        b=pdE8laflcOrgVMBiO5BtqkTXvDGsjWtv0MobbFGUdqWss9oU5Ki0Bo+rsqz5+nkn8p
         MULtc/PW1A06nJLz+KR8Mm+QQbOOPCrqGK4H7hYsjOR6ctDar39jUPSaEfxYyUgTwF9n
         wLrS10ieZdNwfuIjqflesqkxQN/ku+nwfqSif1usrvEJseKVdu+Rzb6mXNd4w5YeizZp
         f8VIPGVR0LjtWVoltXam8/A3OWDzB/u3SjosVzVdzy4pnwgGTfvlutb+Q3OywMEajniS
         0JSFdDZhg77EFskdDZQpvengLSxS3URAP895jQ8ZJwacltMUWV5EFYBVAHK7idzme8Ds
         2HBA==
X-Forwarded-Encrypted: i=1; AHgh+RpotpdqChyc5E94I/tRILPtqRAreqfrnIj0PndIEjMX3IPwSPCZ9TcocYtrRo/b4KtWMLj+mD+sujmB48sp39XPI95Q@vger.kernel.org
X-Gm-Message-State: AFuF++nsLTKrKDZGnJZznqJ8eN+jVhJsgKflnpotpcN/hQUNUsnuqq5b
	iAsEMN6GZGzBo//RF74PqVRANMje8DBuv2aRYXBL3e3ymtKj7al4g5AOzwWmX/lwrw==
X-Gm-Gg: AR+sD121pdecPB8lPJFA2w45jy7FULVGyJSJ5yVCjRHJ3uf4ywhP13n4SHfphbsG2Ks
	hyhup8F3nW43ARVolc6wE7nnLX0I3k0/s7ivw8bKUuiuGOtghPFKuUOT3rh0zWRc7nKehvxJZgN
	P3dqhboPvn+HgYQN8Am+cEESceGuJb6Q2OsWJEWTa7L8CAZyPQimVyzH/TnAKu7JTzELWZdsOWi
	ytlWVXXRFub8f3gHk9MWDobEy6BWvl2w25Lh8qQgNh8+vMXBV1EMWJei0KXoNN5u8Rc9HeIAKdb
	QE9XZFW0S/co8CEuXs/27nOEyLmCmHWMl1RgKBH9cMDeBmth/Lk1nWOnksFJ/eOajitNxD4X7m4
	D/T85ppMFOTBNMrtZvs7OB7L+6h5+5IMWWEyL2GhF2+h1+i6l4jz/ZG0BCg8/DmlQiI8GWi1XyZ
	fDSCMd/h6NBp10+O/Pql/jatPrHANnnzI6Dh+G3teKWMb8jTmL50q/ciYEAJL+dPF3cD1KmDyyg
	ZUKqZksvENQMFM=
X-Received: by 2002:a05:600c:4512:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49cdc14d69dmr178611345e9.3.1788284893038;
        Tue, 01 Sep 2026 10:48:13 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47885b1sm2369225e9.14.2026.09.01.10.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:48:12 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	Will Deacon <will@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
	Yidi Lin <yidilin@google.com>,
	Kees Cook <kees@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	chrome-platform@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Subject: [PATCH v14 3/5] drm/sysfb: Update coreboot framebuffer Kconfig symbol
Date: Tue,  1 Sep 2026 18:48:04 +0100
Message-ID: <1748b8899ec772cc435dc57dc55f76c15da95f0a.1788284852.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788284852.git.sean@starlabs.systems>
References: <cover.1788284852.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The coreboot firmware directory rename introduces COREBOOT_FRAMEBUFFER as
the user-facing symbol while retaining GOOGLE_FRAMEBUFFER_COREBOOT as a
transitional compatibility symbol.

Make DRM_COREBOOTDRM depend on the new symbol. This keeps the DRM
dependency aligned with the renamed firmware option without changing
runtime behavior.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/gpu/drm/sysfb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sysfb/Kconfig b/drivers/gpu/drm/sysfb/Kconfig
index f7e48178885e..2bfcd59bfe6d 100644
--- a/drivers/gpu/drm/sysfb/Kconfig
+++ b/drivers/gpu/drm/sysfb/Kconfig
@@ -10,7 +10,7 @@ config DRM_SYSFB_HELPER
 config DRM_COREBOOTDRM
 	tristate "Coreboot framebuffer driver"
 	depends on DRM && MMU
-	depends on GOOGLE_FRAMEBUFFER_COREBOOT
+	depends on COREBOOT_FRAMEBUFFER
 	select APERTURE_HELPERS
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
