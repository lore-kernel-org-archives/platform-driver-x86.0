Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792893817;
	b=iRuqUOttBD4xcoEbldUueQPWeaYyEV59Hi+9s0G5POkLk+Ix8dTUzNYEQSG0ekDjX9Az
	 aZS2VLtywhJ5hKPlvBNvDfFb1uvHWdfMvdYgsh1DgR/ws8Xmi+2KW8tceW1eHW0Fpj21C
	 kgt/IaWWnlWD8jZkv/RAVSkQ292kan6CKGtMODPg7kkucR/Ca5lixke3JoSqdvQDL7ZdM
	 I++OCUbgLIeSdp872T6hssF4BGu6UI0qH0qwB8lgZUlIHzIYCE7TcukWhLQ2VZIao7kx5
	 FopuAPiatiu1A4zYkGU3yKRmsPtMLT/M4pey+qT//Eu7EcaJdV3g5oo5YFEFrfoO1cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792893817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o5OJ4oy2J+hfRd2KpSbnpHV5mlGk05MxAQLLAb5RJaU=;
	b=ZYFAsSObgSoMnvuqOF8qlLyzXWQmS9xp9paYEHyewuDHHvg2j8do1KRYWxZ/DVAVTEjk
	 yf6mWcez/LRM3ID9soiwkoIx20rPeHGqAtXY1G/xS7PwLV1+gDzIOik3flZ0vkOQrUIBz
	 Wxaa6Azi+HIaqzESs1LCgU8heM80kob2Pa8pAZTscRIv70khYYHfiA3/lXWj1eymzVImy
	 FYDEjgpD1sSqzKWbM3rWTXc+BWBxiaxRgHlrXB7vesrkkOlbqHAcxHeEh8zhll5tLdu+8
	 /+WaOmO+Q5D7JipAckQ1NI6kr9nIPThQd131CuTaonaU3DyNKCOjvNVEfYqt8biQ0bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=PB3Qefui;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF08D60A2603
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 02:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF08D60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=PB3Qefui
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5A34D3F276
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 02:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792893815;
	bh=o5OJ4oy2J+hfRd2KpSbnpHV5mlGk05MxAQLLAb5RJaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=PB3Qefui9E2TLRLt05hN4KZRjlBMsBsbiKro7dxl6dfWVihYZE1iZRP4CaQpZmhqX
	 9Clg2B4znwtufKN4epjtygXiR6CUv+PWYB358hY76En0mwfOmv09XH3B1evvENF4Kl
	 E8hg9j3w08vao8kBqVQSp0+15hDnPTd+D+z2CjeguqzaiPH7Bkf+6kOD/eKHr2hoGC
	 yL2377G+yhfKA+d+ln2aKcj7x1h7eFPGhG+yqyfqhru8Xe4McksBDmCITkAY0x1e3x
	 4D9AmvlcDLWoLTpoOwPgzndCsYoTKzlpGv0IinuWWLSDhiwbOyiU6B8UQLZCybYpnu
	 8AAKimuY+y5UGNkHmWBgEQ+BztSAIuIMwyRlFGlm3J9Wv3qiOmS01Wl1IsrEVUfLc2
	 8GeATKMKY6eU3DxlnmeuVo5GJ3fY5KAPIzddH1uEtWUWEYKJTx/ZhDAZ4PAJY+fFaV
	 Tth0KYYbkZdZq06RdvaEgJJ3kLq3LBFMAPVq/6vSmI0bFpBW52o2QdcD67eBVK+ijW
	 Sudv4AcsjJfTXh5XKHAvKqg6b+xaQvKHfBD2UKCN0Y2yu263wz2RCTM6Z/D/faepDS
	 3GBKelJl7f+qZVJd7etlA4DdpXGSDRV+c9aV1VusCb59FVKbX/WdG/DmEkUE3r+HNJ
	 pU5qOvSYQrrWWtKlhzd3kjGY=
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab27c28489so689461a91.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 19:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792893814; x=1793498614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o5OJ4oy2J+hfRd2KpSbnpHV5mlGk05MxAQLLAb5RJaU=;
        b=jGxZLON5VSJJ0Zr5xaPquoCMvVxEy7T9TzcJlkymKVZPimcsTSDtMMjPxC5HVM2ufd
         48AAIMFAc/6CiFRknRyAW3NOAlA0/aiYlnGUv+Ekg2suzVO1a9m8ksqxpa1CodIv0Uis
         WMqX9O3Y5qkgfzxltqNh6bnPpjyahU5Ie+7mbRrYYxSjf2cr7LlVOBTWasmr0P3DXMFT
         DO4E+3Ml5p/Aw3m/PZjHzbbg4lmhWyVhS0GTN1QEh2RsS5o6oxi12D8noNZi8YC2oDFC
         5TU1peHIVxdTkbjCpWKx6AlDFQeeaHD4DW5M2sqt2mG8U3POclAZHLdADdi5ZynLdRWJ
         cqMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoEiy4+jhXD7JuXTASZ147yqYIX7Wp59oegS+tRPkJq0fmnfGlYNLVM6LL2ZOKZqDK/vMKZ4LoNTWsF0CmDPOjMJfK@vger.kernel.org
X-Gm-Message-State: AFq9FYKbN+qoerMrCcpg2Wp+bzVmbujwK8CPM7gu6uvPm1qpdQdYo/p3
	BpI01yc69hFwEz50oxUEP1LAKl2EHI8+N3UOcsK6rk3Dzrqi7OS5gNXCaxhKLC4qQ6/bm/q9F3S
	5A7p5oqzSA+Q3jd68emBGE8I8bVlp5nhHtwmaccEdyHmlI5mMKxfPr4OBAbg/RFKjjYYu7cfs76
	HpJ5BLzCDsWLOsvK8=
X-Gm-Gg: AYBFou2aJqQNPg1G+8f2n+8D9cO+GmWUqcK1RzjpO4lP1v2/G+Sq0m4nYYn30r1TPwR
	YRKrwy8m/1G/qz8J9iTd1tzZWQd49kBDsRnRaqjrOnbgbSvcMHSWNsavge/OmqXxklqwG/2nikC
	qw6529pLaVZQtr4R5NLBD5byhN/axHdPQoSDqYAmj1xXdiY7mraHRK1Xpq/8AM6dwFGjTnfI/2u
	QOJxBte1LxrCTc3MMVj+cIQeFmp8MpKtWR8UcVN0X06s5EmxH31scoFWU3ABaFmjeTtIkNMP+wX
	yZh7uo+EB/pDjwY28eyjRG2KSpOTf4oFxWeFNKRaVJMiv1n5TgzGATj0tZPKu/iSU5lGZqsMiaN
	qN8ud2i6vK479aSnYEL/qlOvbZNEf+ImZGU7jD5EWSqoPbR4RH5jpnnStcc6IgPejHvzWGnhXUS
	TvUfpiwq9ILln5YEvxEZO6CF/WmB45mGIU5P+QF7ASOp3Tsf0zGlf048ba71nQERXdB2PhFPCNV
	QE1mYQgL2KIACTn7RbMhFud073NYh0ufjrou8qeIA==
X-Received: by 2002:a17:90b:1809:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3ade9481ef8mr4927454a91.0.1792893813909;
        Sat, 24 Oct 2026 19:03:33 -0700 (PDT)
X-Received: by 2002:a17:90b:1809:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3ade9481ef8mr4927434a91.0.1792893813535;
        Sat, 24 Oct 2026 19:03:33 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-0e25-4b6d-1924-440d.dynamic-ip6.hinet.net. [2001:b011:2008:445c:e25:4b6d:1924:440d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacbf5fsm4226044a91.6.2026.10.24.19.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:03:33 -0700 (PDT)
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
Subject: [PATCH v6 2/3] platform/x86: dell-uart-backlight: Bind through normal serdev matching
Date: Sun, 25 Oct 2026 10:03:16 +0800
Message-Id: <50556466ff036ece9b73f7088deaece5faf4e59b.1792856688.git.an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792856688.git.an.wu@canonical.com>
References: <cover.1792856688.git.an.wu@canonical.com>
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
force-attaches its driver to it.

Pass the modalias to serdev_device_add() and give the serdev driver a
matching id_table, so that the serdev core binds the two through normal
matching, then drop the manual attachment.

The client now also reports a "serial:dell_uart_backlight" modalias to
userspace instead of failing with -ENODEV. A failing serdev probe no
longer propagates out of the platform probe; as for any other bus, the
client is simply left unbound.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
Reviewed-by: Markus Probst <markus.probst@posteo.de>
---
 .../platform/x86/dell/dell-uart-backlight.c    | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f076cfac2bc5..9b8ef91bb0a2 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -325,11 +325,17 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	return PTR_ERR_OR_ZERO(dell_bl->bl);
 }
 
+static const struct serdev_device_id dell_uart_bl_serdev_id[] = {
+	{ KBUILD_MODNAME },
+	{ }
+};
+
 static struct serdev_device_driver dell_uart_bl_serdev_driver = {
 	.probe = dell_uart_bl_serdev_probe,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
+	.id_table = dell_uart_bl_serdev_id,
 };
 
 static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
@@ -354,7 +360,7 @@ static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
 	if (!serdev)
 		return -ENOMEM;
 
-	ret = serdev_device_add(serdev, NULL);
+	ret = serdev_device_add(serdev, KBUILD_MODNAME);
 	if (ret) {
 		dev_err(&pdev->dev, "error %d adding serdev\n", ret);
 		serdev_device_put(serdev);
@@ -365,20 +371,10 @@ static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
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

