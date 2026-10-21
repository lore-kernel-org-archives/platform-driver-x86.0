Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574500;
	b=vJjLYQ8IBlgIJvmMS000dCD02zuT4UekN0cpW19EpvsTzV/MbzVnU9iMbzxuPEPBN4nZ
	 qzeUIhsBAtORFmXdbnhdX88N4SfB0Lm+rMWsIlKaaNR/1IJHZTY4lKuA4f+gDyD7sGZ6c
	 6LGgM+wa4HlEO+M3EXu1itCJN9w+iuUj1DqTfl5tXeX7lDjOSb1qW7oj3PkThs/CRdlal
	 cNs6mtq/vcOxzUrM2y7vapflNj4NBnr7NcKgFJbPO4PNpI1F0GO5xBF9BkuNcNN3PTf4U
	 3gPMURX+aT1KGdARTBInSpLZUzuCY9Pv1Q+RNB6oD6SgqbWcmX5NweHTbHH5o08wnVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574500;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pjLw4ni01XCQ9bFFwFJPEpPhHyB1Fll+ofVTTD9NfnY=;
	b=RgzgKEJkUSkH8GLM+ekJzrHlaBk6yhWLx5XDBYKysexjkJcGb3z6RrL0w7J2Q18EbG98
	 gSDs+/ZTnLyawSQ218AVYUz6QSG8NgqAOPnvrPXBmW5K5Sgoz0xljRLPiebh5k03enETR
	 ijD0B8R6VJaznwY82SKSdA7/r7c9tZvIe3RsrUKjMHPRPcnz+t94+vLzc9uQu2zKtMpDL
	 7q7GPw+DD3YxYem+3oHoxzCvwMN/3rZ3rFAKUKBPD6Rh78hsa/ZGfkJyaCsGBK9nDGInN
	 B3WhxIbd2/9vtBck1JeBdvHL4g7CNHFlrsF/EbK49tpqqskWPX21PBpX+gjusG1eulA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=NauWSat4;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17BE606A322
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 09:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B17BE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=NauWSat4
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5B43C40252
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792574498;
	bh=pjLw4ni01XCQ9bFFwFJPEpPhHyB1Fll+ofVTTD9NfnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=NauWSat4jEfzc48kmw63vJ/WgcO3hRVm4qEQ/W71yd/Gr8GrG5jYRvRNShZXaLtGH
	 OBB5JG/R2gsAqGvWJDFhPQI2/4LwqgjgdqH8RLm+nEBevYCA6rslva1b+r0fV3n88L
	 3ysewhYq0MjMDGefkuiihWlohvy6px39OBxY8yUsieF0GHyrdeEaqbE0msNyXLJZld
	 DPHIjuVY8W9i5xkRi6nqxs+JoiNEm9dJn4DPX+hCF6sTpOlP541IHK/ORArFAWooTX
	 J6l5pccGCoIyMVc1Wllt//qHFIXlk9n3GhXIdjRWPpV1XfbiocwIn5XZXJi41rCK/J
	 cDWevXsOuXBznK6rw+XlNPyW9+rNwiQvId3FQb511SQygifwol9DP0GhJyEn+r2x9L
	 ZHU4rIr/M9Hr5JTQyE6irQ/kEWGsaEh5ppqhsMzIr/GAmqpum6lvpvuL7Gl7Blcg4/
	 D9ukvGW909Bqp6KvYiAgzgYviUTlRbAJKlGdsgteHc3xU8XSG6pdlvbdTA2gwDi3Ur
	 0GLVHJCKcMNuOTiKvXQn5tOZi+BY2tdvFKW0rGDYpBEMnpWSoGZdL2MpGzGOvFpA1d
	 wnyVxQWZD1dMssFBM6hItzXxPJ5zcxZJprCIvuNzRgAVrZ3OSDxoMOPfBEw40yOlrk
	 nQdO7Kkaa9e7rEwESEmDF/s8=
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9a4052726so2233945ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 02:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574497; x=1793179297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjLw4ni01XCQ9bFFwFJPEpPhHyB1Fll+ofVTTD9NfnY=;
        b=oMdbjK4KxfxnAslvXKu/Mm8sHAvvg5CetaPio7seAfvWvN5CtDpbs0qZ0shp7p7/NL
         I81ckWygx4ldThZiLUdNi8QEMV2mZMOzGuVjS4cU0nV9UAvFkLnPZghcUw3eu5giiZGF
         YDLMP/nWWt/L9PAAVkzuuQCZOv1TQj4iGrUR/iCAiXmIxdASExJlVAZQm3kobuT4ZfjT
         I3UAxtirMMwfYI7bRJCxE1BgLxAeyKHA23lnzgVSmmIhHwbmjfEO9hgW7iyoBeDjkbCn
         F+kZqEUwFDVpGeq2b59k4VW4VhXHoonsG0Nl/VqUsXewUYGS7XKshqvLNXTKybGvY1ip
         N7fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxq05EagiDm9YFRrUgFnoqXpCi1uv6xlA/hmyU2tHVxwLV1FcrmYSVIS/qLl0cfinIy44bEoSVDhJbjgMHcEufb+PYF@vger.kernel.org
X-Gm-Message-State: AFq9FYIx3NaxVP/kWfsr/BdWvF4nDpApgqZ30kXbtBsfnrKcIR76qET8
	FA1z0N97hNjLM9Vwrcq6eRIRrkb35k4tccnZedtzcWmBqH2ebbpdrM7f9gpZGp8AGkVxq8TCz6y
	3CF6Cr/6DhC1gSyvz19H+osw3k5myHsyFxP/xM7dqqdEI2MaLDXFTsmHKQwqt4nI+cLW3tS/1J4
	zE2s+Dba38+G6S3kc=
X-Gm-Gg: AYBFou0sysIHS/tdP7K/XM6FHkQRdFpJYevfuUySDFlaCORXc0O941N5ZMeZE10I+zI
	Ksw9Z4rgntoXGmRjEoh+wDHoK11ehd8KQy4jSloL53HjvtfzBLM9H8HVR5WycGHhk5STsf+0kSJ
	hOiA10bZqMFdjgfH4CqakW1ZMYctM4ZfosaMnV5PoGf+jqisT1RMP7qusQkquEbO+rUqDw2FUt/
	lDoNDqVxQ+9T4ulCgCpbdr2Gy0wK1EmLK94YSkxSmTchScyh6xCEKkeEkAD6IJUkpwpBZkBl+ym
	i8Iov6n7FxpSfBw+Lw8IXhwyqbir4NSbqvhftHr0ozCZ6JCTfgwrDbDMJuLN+4Nz64BFRscTKxw
	xrJlncCfMKHKr3qhpQbpY/ZVOD8oHtjHRomByzHKR99+T7opL5K+8/IHUZs01xpRA5v3a1/uL8P
	YheZeQIh0QcAElC2U0aXELxwXdA0GSW/ojeJ7XLumIMH6omZsvDgFymumctGQ72c8Js3qTQqJ4O
	pAXtpV7ed+IoUU7pt/3XeNstoSQWbV52RW79eKd4Q==
X-Received: by 2002:a17:903:1a0f:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2ea438e2a84mr21563815ad.1.1792574496839;
        Wed, 21 Oct 2026 02:21:36 -0700 (PDT)
X-Received: by 2002:a17:903:1a0f:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2ea438e2a84mr21563625ad.1.1792574496546;
        Wed, 21 Oct 2026 02:21:36 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-c2b4-05d7-81df-1886.dynamic-ip6.hinet.net. [2001:b011:2008:445c:c2b4:5d7:81df:1886])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea4005a7c1sm6572935ad.71.2026.10.21.02.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:21:36 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: linux-serial@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	markus.probst@posteo.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com
Subject: [PATCH v2 2/3] platform/x86: dell-uart-backlight: Bind through normal serdev matching
Date: Wed, 21 Oct 2026 17:21:23 +0800
Message-Id: <20261021092124.2306053-2-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021092124.2306053-1-an.wu@canonical.com>
References: <20261021092124.2306053-1-an.wu@canonical.com>
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

The driver creates a serdev client without firmware metadata and
force-attaches its driver.

Set its name before adding it so the serdev core can match the driver
normally, then remove the manual attachment.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
 drivers/platform/x86/dell/dell-uart-backlight.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..19ed7f8b12bd 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -354,6 +354,8 @@ static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
 	if (!serdev)
 		return -ENOMEM;
 
+	serdev_device_set_name(serdev, KBUILD_MODNAME);
+
 	ret = serdev_device_add(serdev);
 	if (ret) {
 		dev_err(&pdev->dev, "error %d adding serdev\n", ret);
@@ -365,20 +367,10 @@ static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_remove_serdev;
 
-	/*
-	 * serdev device <-> driver matching relies on OF or ACPI matches and
-	 * neither is available here, manually bind the driver.
-	 */
-	ret = device_driver_attach(&dell_uart_bl_serdev_driver.driver, &serdev->dev);
-	if (ret)
-		goto err_unregister_serdev_driver;
-
 	/* So that dell_uart_bl_pdev_remove() can remove the serdev */
 	platform_set_drvdata(pdev, serdev);
 	return 0;
 
-err_unregister_serdev_driver:
-	serdev_device_driver_unregister(&dell_uart_bl_serdev_driver);
 err_remove_serdev:
 	serdev_device_remove(serdev);
 	return ret;
-- 
2.34.1

