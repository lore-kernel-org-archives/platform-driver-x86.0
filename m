Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974209;
	b=FdeZJ8Kod92TYCOACADqPP9ze+RGm/JbKZgJmCaT/pZGMRcJKIr4KPo770J5DwzKsjkQ
	 PwdZIurUnY/y0YVsk+xmkumoKIZqqZ5y5X2DLdVUXG0UersIlP/jJX9bumd6IDaD/SS60
	 UloVF9A3QwA6jOecwHL8MA4DVwc2tfk4H6tpa9QGR3/43RcsEj4ADl4ol4FxjSQS4iDal
	 1Q+GxOC3X/m0TOMyPvSpt83FVZPCwFyCGx/pq9943XupIm7GJ+WNBE/NYyr4m8HEoaXZg
	 VLyi7NZeIsqTN2yUSGOet0UCAWLBXiIFdLEJFNNpNIhSfGkQa6/o7gzktDLiWIbDbPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z8CJNheyPjviB457OpOPxH4XHRHps9PFn1iR5iYuJCw=;
	b=Wffue+JbZ2LvGxwSxEijvdUdGQXJqAtBf8OB+J7RBF0ff105NYRenxaOGwIdSooqkDLi
	 qPtP9MtQj2cowybs55wvQPc2lh0Buc7qwLt/bCvAT2Pr4ojKFH2eT42zIgfM1dIHmiuAN
	 8ltM6WUrBI8rUgdajKCHIP2jqdy1FOR+qRRDlQBbSG9UHiUUdojGO7LijhHX2q01GiIb8
	 gkWvYV546+mDyapazP/tFHmLxA2ZBaAbLC8yq+HE2vqUS9QYrQizv6vMgTx5JuhufKgeL
	 1bKVqd0ZAhIYRj2JHqz7fIVOxzWDeh4gQTE744c9xnRgUqwCZbYcEuauJTp0SwTdA7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hu1cUdUl;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E572F606A333
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 03:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E572F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hu1cUdUl
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso373996a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 19:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974208; x=1795579008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8CJNheyPjviB457OpOPxH4XHRHps9PFn1iR5iYuJCw=;
        b=hu1cUdUlUr+75UCpl8V4RlnshAYeqV+LBgyXI8UQktaraSJHlOhrfJtK73dAX63zyg
         xQ3e8o78R8kRT7DPRilBW9j9ygNKCql1f6RV562gJ6CkaVUDHK5OIGovsqG269EgaeKz
         ZlWdrSN4bVIgkfcYyFAwrbkLnPUA4wSAB3zvp50GSVtMjNagSkTTFrScUl5GsKaZMfrc
         QMvreUSkhn2x74LgGQDE56mfBiN9ukiPDp/j7Jhm6RnMxeh4fpIkHqsvZhciJQ6+wtAZ
         ZVg1h020Z6xCxJYEOJqEUPGskF+IgO/TCJnHMypweJsqHpl9h7Keoe0zXwp0XthFRb9f
         +BEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974208; x=1795579008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z8CJNheyPjviB457OpOPxH4XHRHps9PFn1iR5iYuJCw=;
        b=QQL+5xRQOz0hFb3VQd2hMocmPNrQDGGumKLqBCZPSjdFAc0HGT3IZBIkOz5ydtPng/
         +XJpWpf5aIH/WjVq47RFGWXPYsBUF0pu+VYEgsCYq+KPSq95AwkHjQIx0xaiWkk+S9TX
         eSuclSBPqPOz0rug5L9YiRf28aeGoVxnDd9oOYHvJGrcxQmVnOTORmSoK85vwgZG0wXS
         mwpn9RoifkLxcWRah3N4Xyq8ZdxEE7YRrF4CV1Phsu8WYhag4rr5LO4HILAchn0v2Izp
         bUyHO88SxlDcIrcj/nQpbAjckUGa7EKYd7j68KJvDJTRxYDTlM6AFVVKSsg2r/+8bQ32
         gaZg==
X-Gm-Message-State: APuU4Z+vkKOzAr+g/wztTEiqEISk7hX1HFI2MRsYC2CjsxlSsVfSIJPP
	yZVUFO1tVTCoNAkCuTgeWkGsLCAWG9683homM625QHSriGlfRFFgUA75c/KL8w==
X-Gm-Gg: AZFdTZeSYxx/b0dKIseF2p/uxw45LAWIN4sw486Z0VvhzLwM2FqJuE1+6D0n+fvkDEN
	pjLd7WyT2jf8kkxKnXIDIlYRgtMJyIBnA0kOjJPw99pLg+Bgo+qgVKR/+jlmG2y21igaQ/8+Q08
	Gdx+1KxCVbBPZT8fSlFWzTRBOgTI8KZyNsj2XPLlH97xTXY/WM6EN/MxQHI0u+sgLGcg1AAy2ff
	8M3TiRSNHt78p19d1OdSA07c5UAG1fd56JgthTpzuaWuzYAmm31Evf2sC1qiAtIPmcjJQ3P9F5r
	AuVde3IfplZS1JY+V4RXk8fvnBTuGApkV42O4ylEMu+T3k9IsgJTmmTfrCE1mElzjMIZ+hTjwfB
	GMwydvXFx6oFsHE7nycdUHQ8MS/T26sWU/6s2XUlmAkAIoqeXiStve0kKnt7JbpdrE5Qwlmrxye
	FHWMCWiaU6oRQPqbH42azQHycx0QMp9iTWom3c9dYrJDxpH0Gy8L866VhIySaXwM7qgALiObYbj
	liO5+7AGXFBu7b3fABPfpVi2sIXLN8hpXweVSWV9fTfyyBHJnPIDKqx6jDIDqw+bZ8BJdTxKkJb
	EFvRNkGOQATwFmvJtrS7z/YboEkl1guNjTFVmjv9NNvumFh0qxDSslIDa6eURWYGVKALQrMNh0H
	uGnrFKd42tSPxxVZyo8UXK6x/IMZWLbBvdcc/cygT7L90ncRBWDjuD8EDdMyCICqaa6McUQXX8a
	njuQ==
X-Received: by 2002:a17:90b:3c0f:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b3d07aa6d2mr1491761a91.26.1794974208113;
        Tue, 17 Nov 2026 19:56:48 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm598227a91.0.2026.11.17.19.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:56:47 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 2/4] platform/x86: dell: dcdbas: Suppress bind attributes of the platform driver
Date: Tue, 17 Nov 2026 19:56:36 -0800
Message-ID: <20261118035638.11773-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118035638.11773-1-rosenp@gmail.com>
References: <20261118035638.11773-1-rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dcdbas platform device is created by the module itself and stays
in use for as long as the module is loaded: dell-smbios-smm allocates
its SMI buffers against it through dcdbas_smi_alloc() whether or not
the driver is bound.

Binding the driver again after an unbind also leaks state:
dcdbas_check_wsmt() runs a second time and memremap()s the firmware
SMI buffer again, overwriting bios_buffer and leaking the previous
mapping.

Unbinding or rebinding the device by hand is not useful, so hide the
bind and unbind files.

Fixes: 12c956c4f32e ("firmware: dcdbas: Add support for WSMT ACPI table")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index f5d214b7bb6c..6bab3e0619bc 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -706,6 +706,7 @@ static void dcdbas_remove(struct platform_device *dev)
 static struct platform_driver dcdbas_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.suppress_bind_attrs = true,
 	},
 	.probe		= dcdbas_probe,
 	.remove		= dcdbas_remove,
-- 
2.56.1

