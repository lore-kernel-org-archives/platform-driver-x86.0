Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792843500;
	b=kR2t3IOuRv0SJkFKVQLPp68WXCA1H/Wb7t+wU5jNn1UvVOPF66nZEdY4OeF26d35wwOf
	 Gi+lHjmK1bWav247fvBgypov+yFUOEQgwNa3Wn2iYnu8dc0rKPCsHialRF2FnIps9Zy/B
	 LB5ccCEuLC2OeYOO+7HWs0VW0lQxEXgZwRBjns7WyJoapMCVCrla2tPz4lCugo6cGW6ff
	 gaAlnTdk32MJPeQRnlFQjLfOfv4gDZYFG8r+TKU0o0f/mgKWGUuGNH/FihcXRY0w6vLsG
	 6lY6tErOzNUX0HRn24AShkP3FM7dCsidlY3Yxaqayey48npLReonwWF5ez801/RwtFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792843500;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
	b=OQY0Dy5eAtDHqBrupzPZhxnICg/sZzAeFwhzi362uA9v3J3LlaQkSwWPfpaYksuXb+FI
	 pt6Eb433spovibsqd8RIajgF0UqBkcNtoqc9CVovOTOnlgHGJ+L6ckI/n+4FKZ3dYl7Ol
	 mpADaBRrIDQPLoyI1KMntHOT7EImfWLfamER6i5KURQyzuMvg909FY+VF9YV73qm0XIU/
	 7+E4VojYSq7/u6lwvbLq/yJNNLxLZMmABs82u767nGJC4KQwfTYX1cX7neVISI+ZkoPRb
	 b/p1ck1WIbYDuQCsEnHbJf6gfqMIRVbG4POaXJNdKY+9GgejrPMUgITdUJXzLFNKDaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b="Sj/37OOt";
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0059606A334
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 12:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0059606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=Sj/37OOt
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AC62E3F185
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 12:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792843498;
	bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Sj/37OOtuJAT0DfmI+N1gQgSFXXNz+xG9KImkEuUsGwiAQ+RpD5AeU3xkEofXyzUY
	 +MwuGDNCvyvq8eSgINBUJQ/2zXK9zMJaEfyg8SdptciOAO81X+IUfMtzRu4VtbLdE7
	 dXDwAVeFh+qbI/Oi7axaAihCoKGcp9RC2hfsQxVfea3oiBhmR2ocVbMQnRWNDuVWTI
	 ZXbgcncur1J31d37l8wxBr3pt6gypynXpMnCtSfYGyDnQrExPHCBiW1Fm2hdMfcHr4
	 PkZBM5Qe4QmsJCv0sbJ7p/SpGv2VEwPqQa/h7jTsP2Flsq9ig3C3eK2RH/VTMIDLep
	 1drP3QWoDy1PnnzWQkDOJZZJksNW6QByEPjmRj06LYXQ3znrVP60ZPF9wRhR25Tduj
	 AXpZaS/GWmIYRGy4UFvyqoqhvlZ3/RYHrMCAVNen2sXegfALGtQbiulQ0gzHUDIfJx
	 q22ab1RQbaYvspk4SzOGDE4iNHMokk9tBtW5yNRY9fcNDY3SStYFA03NhuTPoIfQou
	 myDBedp0v/stewfJVKIr09qAMCKCLA36yF+ws1EAH4FKW1DOIUjV3o/hGZeaMfeUn9
	 yOnGv0Vr2YZCwRnbUo0WM9qYe+DKxGVrcu9FN8O9rPhHCdj4dFUwub56nZmnMFgEx0
	 x1aUrUkmWJKi1jcQhN0jZiEQ=
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac8116f6ffso445638a91.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 05:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792843497; x=1793448297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
        b=F7eTM99FOFsj7mPajIGnWYwh0xwknDsjx3hQDl83O2VRK1EFfQmRku19MkVQldZjXP
         J43jnNhLBT59Ls0e2BmLUtOZhnDqJ4xHzAyTsapGFI56/s/OD12kMHYRdIRm9+NT7vj1
         idaJR9u04Nowv5RGcp5INjlpzK0Yf0F+ZIeyFAQLcTud4CpQubPXcXDUBNIwoeD00iG1
         AD7Cmr7GNrfPLSFvkr7QvbEXDcXc0x3+yxge2ZnEdDwJAQuvtpUnn1j6cwmOfvpCWs3Q
         da/eBbTiXrLuA+d5MzcUdzgvhmmxwpKcrhgNZ11E7HSrH4pa6wkl1m72GQ/7Et4lV/Cx
         /p7Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2POvl3vSflqkkA8fNIQIkIU1WQzWKbyrOmca75rsmwd+GWHAGKQOUy6ME4hQIadXhro1sXlVqkwhuM62A4io1BxrP@vger.kernel.org
X-Gm-Message-State: AFq9FYJtgOP5GyzAokk+aQEWUY6wlmaNQcb+foLJPqxRYZtDg9d6jgCR
	gWaPEdLeUrlt4f5QKyVl+SZPTudaGd4wAKoH9v+gI2hiXEqX+8QTeEotrzLCRZYyqoaVuUaPV29
	Gj1LeqMr1cZm/clnATMaWaD4Rs/VOgexHNF2OcmvaOEnSbakJlDyJzbG2n759i9X4qZuq+XCYHS
	gV+h1I5ziprAc3cjE=
X-Gm-Gg: AYBFou3ScYlkiaLXp3tmNJ32Y21hRZgtnbupLJpt5+swLPER1uw+ma1ITtnuF9Lar0B
	TEd4IfAt7IWEUzWpUIJ4Za+untzk2M1ZKecoe2M3VygoU0iPostmAWTL1kdM6hUHiJGfqxfEp2B
	RB8/dyL5pAtWLdHH7rz73FBBToHK26DlTg0NTEmqjBTRailQioMwk/m1UrEaq8oRYza3awUQh34
	BuqiI2CNAHJ8gpZKIi1b8xtpdG9mQHMhgAM9x2+RdGWoJR5/y5Z8Q5ur5XRcrAWv8KhvuCwHejd
	MR5dAKF6Y5OYrvCoGv75koOhG3R99hKx1y3aZ5hi1//fbZTaCfCXOd+gnzGa8KglhOLcAvk5w2h
	pPkwHn32B72hwnOTMssSfmjzBe5vamyrg5Y2GGAtR8iDjK9oUGgIN5yrUFiTlf+GyH1Mj6xtn+g
	LUBj+1/wlOPa0uKf0wEIdEQMadr41UryoYgvOLS89AvebZW4cAL0iknpbj8nDzmCyfNBmpUk3Kq
	pDsCzOC2xKqw9e2BkQHZqraM5p7Uj7VqF3sBISIIw==
X-Received: by 2002:a17:90b:4fd0:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3adeb0f6c42mr2849037a91.5.1792843497179;
        Sat, 24 Oct 2026 05:04:57 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd0:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3adeb0f6c42mr2849002a91.5.1792843496815;
        Sat, 24 Oct 2026 05:04:56 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-0e25-4b6d-1924-440d.dynamic-ip6.hinet.net. [2001:b011:2008:445c:e25:4b6d:1924:440d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb24a04sm2893409a91.16.2026.10.24.05.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:04:56 -0700 (PDT)
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
Subject: [PATCH v5 2/3] platform/x86: dell-uart-backlight: Bind through normal serdev matching
Date: Sat, 24 Oct 2026 20:04:39 +0800
Message-Id: <4ac249174a529766e8fd69c39fc08dfa1572a650.1792831564.git.an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792831564.git.an.wu@canonical.com>
References: <cover.1792831564.git.an.wu@canonical.com>
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
---
 .../platform/x86/dell/dell-uart-backlight.c    | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..9b8ef91bb0a2 100644
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
 
-	ret = serdev_device_add(serdev);
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

