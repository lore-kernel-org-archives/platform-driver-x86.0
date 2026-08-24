Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9131343E4B1
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584166; cv=none; b=LYFYgvhFnUuMJHnQUCjI+0d0sIJRJK441TotzO4f2FAf3w9GS0+6ksvwBmS22dwLaWyus4R6tKLOD8qLqphfM3nFbqctLoP+r7h0fTJEgyEL9Z+NVLvazWJ3lUFThXoJ4wg1mEtWYsllXzvEVKaQivbpVCB0vBIfGKVHwLrjcSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584166; c=relaxed/simple;
	bh=waubqiuCOYRQ2QTo7ozti7dFGxycb8EqFHbDI6qm6Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QLDjk8yt1uta1Y1aR/+OzOyxYClEkuLJHMNXw9j2+OV6qLhNLPOeZKY9MK0162wYP4jWOMRdB2edVuhgtByngKPkNY++0repaYBEe/17UQEhlnUQ5M3hatv8bqPD3AaODN3UAbRhf0qk7kkO3kYo5p17FGkBgu0/LM3i8rqwexU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=AR6nvY/P; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="AR6nvY/P"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47de0093c42so2844427f8f.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 08:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787584161; x=1788188961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waubqiuCOYRQ2QTo7ozti7dFGxycb8EqFHbDI6qm6Lk=;
        b=AR6nvY/Psx4TTNQNDB31lAycc2iiDIBCzGW04/3RpSrmoAuvftFu3JnfbIAhMSBacB
         HvT59dSmps60GDIebv9Xt/XlX9BnKy5yTrETg1TjlSXO1kIbwm1rNV2eC3C4Kh9P+yAM
         VyQFldwnyuAxdhwJSaIIlPIwMI0+OXsTypVbg08G/vVbF5i0dG0Nf5ayeDtJ0aEmYugL
         wqMelDwrGS/2JP5EkAuiWXVMKf19AQ8dpQ7JRpRUiGR7obn6TrRFesrBxF2QeBNHli2c
         xOn+JYOTn7U31gjKhPy0tq0z5AXHIApbnVbaj1BxyoyL4pvAy8JSeGpNnaVCA45QYbWt
         LM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584161; x=1788188961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=waubqiuCOYRQ2QTo7ozti7dFGxycb8EqFHbDI6qm6Lk=;
        b=p6LYeqT1YTtRJaODzwiS4P//EpkdexQZ4P67/fYGNwMdhrP7VJylf+fKlSqEdIXXXx
         wSkPk6DRDqoGctF9Mh1kopxbrnk/wmtdFuclLJKcYqg+tUYNQrq+BcwXFdiH+6wjL/ix
         gt/G/pkdok3pQ4z+s4HSGzrcwEe0cOdR3PYf+qbR84LqG/rw7DJhwjeYKiat5f3KtlAZ
         PNRmTRIzuYMJ0c7ncRF4hEC4DmaVMuMSn5uID9w12C/boglcdlPPZ7WpJjtXXvU7JPZQ
         BEr+bW1WSN6vVSVVsra5fWCG/bQtVqpGnDddfZEl+Ad+wnRqJ0zNkgCElIcCa3A1Vky0
         Wvxw==
X-Forwarded-Encrypted: i=1; AHgh+RqMJGtoa0H3XYD3HmSRbeeW53rImUxOkpBhov2mNsN8EwjdzigsUHWUKb0/8lsqtk070WzbmfMB4bjdgWM1b5TGiYW+@vger.kernel.org
X-Gm-Message-State: AFuF++l2L9lZLumUKIYZbfPujuBK0aEh982IQeYRdIX/x53ccL/3LYus
	5e0Aert9uekR0yHbH3gpos8WU+IIRgy0w9o6tmn9Gy69OolcrnjJMtDzUkQjLlbw+A==
X-Gm-Gg: AR+sD130uSqhSn8dDWytXG+H5MDZTtdYvYdSik9JgQvygrhdAzj/IIEeJZ0X3gM8ASa
	i3ldCBTnYH018Vk8r/UQ8VOhxXhC/y9CO3h7WhbqSF99TjK+/sJa71tnKjx7t+v51QSEU/Jvc/Z
	ddugB/LY6gSqGvXtQTMptQjLmX4SOU5gzFhjjCBK5VHJSq5rCAqTuhbhbrOrmpY6zjwP1e+iSrt
	C83+RwO55ZaW7a88hnN1gdkwGvDXPL9TYNwryzgNKE3W26v5IJ0dUP7vc5fiAgoOp24DsBX+iOF
	Uv9ZRGe5ipurO/ARJkOoNFplmhaJ5VDs/GXELf0oRByCz75sN3xQq4spJOjemogkCDLFUgDT9tJ
	y2ndtxcVQCByb8l5bHMDj+RGr8SQb8T4RitQHsKu66QOIG8GeubMV3wPCfFAoyEno1NplZ+STyk
	oU4f0KpAsonGmQOnSbbvdMyjPV6grZuAlKtDwOGLpkgEYEcNJ3GxStvcS01UhZN+LKdD4may2me
	T/xvBLG1AyaEiH7Nk9WeKDrnl9AMGg=
X-Received: by 2002:a05:600c:5294:b0:499:8ba4:8cae with SMTP id 5b1f17b1804b1-499b830d665mr374268665e9.1.1787584160350;
        Mon, 24 Aug 2026 08:09:20 -0700 (PDT)
Received: from horizon.localdomain ([216.128.28.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c8f382b1sm63920035e9.8.2026.08.24.08.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:09:19 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Sean Rhodes <sean@starlabs.systems>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Kees Cook <kees@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	chrome-platform@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>
Subject: [PATCH v13 RESEND 5/5] arm64: defconfig: Update coreboot firmware symbols
Date: Mon, 24 Aug 2026 16:09:02 +0100
Message-ID: <540bd3107a81da9555655ed2d5a9252ed04a620a.1787584107.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787584107.git.sean@starlabs.systems>
References: <cover.1787584107.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic coreboot firmware Kconfig symbols were renamed from
CONFIG_GOOGLE_* to CONFIG_COREBOOT_* while keeping the old names as
transitional compatibility symbols.

Select the new names directly in the arm64 defconfig so the checked-in
defconfig follows the visible Kconfig symbols. Keep this separate from
the rename patch so the configuration churn is easy to review
independently.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 arch/arm64/configs/defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..32ec89a872d9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -267,9 +267,9 @@ CONFIG_RASPBERRYPI_FIRMWARE=y
 CONFIG_INTEL_STRATIX10_SERVICE=y
 CONFIG_INTEL_STRATIX10_RSU=m
 CONFIG_MTK_ADSP_IPC=m
-CONFIG_GOOGLE_FIRMWARE=y
-CONFIG_GOOGLE_CBMEM=m
-CONFIG_GOOGLE_COREBOOT_TABLE=m
+CONFIG_COREBOOT_FIRMWARE=y
+CONFIG_COREBOOT_CBMEM=m
+CONFIG_COREBOOT_TABLE=m
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
