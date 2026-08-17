Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE7A3CE495
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 21:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003706; cv=none; b=eSKCxssVd2SapNaJQZkUSVnSB1WNAWbyfPTtAG/7U/BSO7h1ovXBiEinq0RZp2qhA3pcDasNcIfb7KYc9zbe1ic/uxq8Iq3MJNbdD3atmpG43jQBzEZmpKQ/2m8rdLGC7c8SgMvYcapeDNQ9wLR6u+OTl/XqtYLh9bEjWdy6sOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003706; c=relaxed/simple;
	bh=waubqiuCOYRQ2QTo7ozti7dFGxycb8EqFHbDI6qm6Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSqZpUKR4ZvevpadbzYRZABKvpA7jwm/E0vVhtF5z9KEx/Nz3YpjZfaQfy4KvipqxZ0A2k9Ibq2i2/hq2Qgkby8XFcV9lLosOW9AVc5QsyNOb/kc2Onmh+UPQoDevE1CQE+PkDdiD5haxFUIHxPDDQjquD8XGv/gv3FGRCIYMrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=OWMChSy2; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="OWMChSy2"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fe377a217so2671499f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 14:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787003701; x=1787608501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waubqiuCOYRQ2QTo7ozti7dFGxycb8EqFHbDI6qm6Lk=;
        b=OWMChSy2TdxVmn8WVkTcA+sMo5hXnPaubarGO0gaDNcbC6dwDD/5KQ82XLg18KYxRr
         3BPSNXVU893Y6b7PO7cM7GptBFNuVyth8GuRKr3uKV0YtXfnCTOFVN3WlRA9TVR/7xOo
         BvSR9jyK/F1KVYslfq0RABlayh4gdoSSyozuqAmj4N54ISohJ+q6vIJvFClB9fRfrXMZ
         X2Wy38pzSB0AYrv+hUOVLx5Emg2l0GWjJzNqVmLeKZJSznU2EjjeTOqXMzVwhGbTsxMb
         gRWqUrT9ST2qYPeFsbl2h+QvvcuYDKrYe7ZEdSnT4ViIUmHPO+rQ5Gx4mcf+Wqhj6oCr
         Sg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003701; x=1787608501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=waubqiuCOYRQ2QTo7ozti7dFGxycb8EqFHbDI6qm6Lk=;
        b=RMOrgSbhuNM0j2RYobx91qU6Uc2CrxNukUFqKduxcBWT09p0uLScLVXyQSHJEtQkOj
         GHNCOckCDl1gjqncVidEN9SQUrlUn3vObGp6vQIpQId/3b/v7GtI4Eze1zc8ej41rr7o
         psjZDkN0duCE6+7r+F7W+ayvfa1kAFjn4jbuJum4hb1oUqiLeIHw+rS7qbBNPrkMqj88
         XXCY4cfXuIs3SyY+H9ky/rrF9edXN4qcRrifNZ1JM0yTBKljrrvl+hZNSlGSpvuP8MpO
         0itpp5ZVuid23C7v2yrMjI4leTNWoVHy+ZRabTgYDHJCney2371cHyWv0nFG9Qk6Yxpk
         Ksag==
X-Forwarded-Encrypted: i=1; AHgh+Rq0jYDfus8FghuhbHZd9M0kSIk6CoWV/KDR/CtWzG4i80rIJgMUznPJUMPRaenag8T+JfXDT8eC7ITfveZY3bsaUidV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi1HjT9feBVwJCdxfwndKmFUdISSpHmmVCLFgsZjQSPNhSZ+9D
	fMlI+q1vsPVpVhtytkeJ2wVSVQZ8y18jVGp3sBx3LoA5I7o6F7h1gJIgEgGg5X2Fzw==
X-Gm-Gg: AR+sD128ElWOH1K0fr8cjWm+s5nEtnbWkGdogu2AJ81x+pRj1WwMNggTTo8WmzzgSUM
	zdl+exghaXFL4vtyWkUhLyDx+c7XLEpkQ/aig9pglwGNG0Nc0bNt0wxZTCcux8CJT0p3CFU2YpK
	XK46axh1Z7vyIUUe6PNbWnp36FUoMn8RMFo6hruayMTfLyNTbWF+GmPbiv+bHEp1gUIgft1Zksj
	nOPQFaedZ5fs7vN5BKzGCbtF07J5/NA437bH6YaJxBLzjGX53RsZohbrClCQ+gHWzokLUqNsOJu
	nQvVoHwt21JKiSB7C1agvcUvQVa9ke6//yiIa6iHBFvbIvsuRVJP20StVVGxDkb09KORTEi+9YF
	ukUNv6PMezz+w1gHgsvP/ojf9gpy0Sviz3it9jD2Cm4FycJtRnkjfCiLyBHJnmGlo/UQdy8PFK2
	FejXtON0LxTbhgq8+0YcxLh0i7aY0ZbkwKf0OklXVL1ti0YpliAiALglXDNnJpw9+pLM0KNWCKb
	D4qg/KJ650O9A==
X-Received: by 2002:a05:6000:4a01:b0:47f:8f8f:e493 with SMTP id ffacd0b85a97d-482a8fe9b5amr6047922f8f.3.1787003701113;
        Mon, 17 Aug 2026 14:55:01 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b3f0sm6060954f8f.14.2026.08.17.14.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:55:00 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: chrome-platform@lists.linux.dev
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
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
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
	linux-kernel@vger.kernel.org,
	oliver@liuxiaozhen.dev
Subject: [PATCH v13 RESEND 5/5] arm64: defconfig: Update coreboot firmware symbols
Date: Mon, 17 Aug 2026 22:54:51 +0100
Message-ID: <540bd3107a81da9555655ed2d5a9252ed04a620a.1787003659.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787003659.git.sean@starlabs.systems>
References: <cover.1787003659.git.sean@starlabs.systems>
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
