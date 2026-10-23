Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733257;
	b=j5pYWEH2F/BxY8bu/fJ4UGjpifn8kA02FMt4H3Fe2CeRJgO3j0VwZM0koEvHyWHNcDZp
	 I6zcMzhxSW7NZk2Q0WeIwhaMnGNWn/jRHJDn/lNSaendRd0kB4CJq/an57Bz2VTpuYdfd
	 qZdoYKbpXwEkgH8xn9OePZE1txXmgySAUOJB94CvTUKrNw4J1f9BSH15R9E9B0zt19Bwp
	 rso2qHHl3qi/1+NpNqLculGbYHtnBhh5S+Pr+kmX/IklRPfFI8Povv/Fjh4OTnT2rUv3O
	 1EH6ZXrzxG03nDrSxNp2Z9PVqekoiQT3jMEorOYTPFlp01WIz/hKr3pzYUjXeV/dpZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733257;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4L6weuCfG+0+7nbvcKznkqD/AuPq+kc5T9Pa5EzUN/c=;
	b=qIg+ZJYAGdoCV7oEYN6N+ywVOlreHqc2IgFlC6D43xaL0U1m7VGapfR2j81tft6uepNx
	 C0B4uxc7ASobOPbz9itWUfL+kfY231AT7VkphhW4W+TkvzhhBZsnJ5kMNKUSs4nDhv+uo
	 JseB/wUA/VjIHgMELb0RnjRBlbLcpJEZcq+UISKx2mlA81E9EbXdTOJLfhkBEDtWDTXTO
	 MjQk//Q7z46kB6Uu94d+0q8oeq01VP76sNPvLw72N9ZOAyTZvHizDjoUoUiLB+WzzUSIf
	 /vb8HbqfLXD6UQZLxiaDEzSEqoRvn/F/1c3UhP4n4ZSO8IoOIf3fZa5/JB6m4oyDpSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b="eK/k63io";
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D755606A33A
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 05:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D755606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=eK/k63io
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E8850402CE
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 05:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792733253;
	bh=4L6weuCfG+0+7nbvcKznkqD/AuPq+kc5T9Pa5EzUN/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=eK/k63iolage+Feo8V/nYaJe3Hs5zxE8GD1r2XXUMl3U/K/pwYxzg5bkD6mqweMFy
	 4R7VcfeZoj2420GNWnPdQ2YsMENc1iWqEDYkMcmoThW/rHtTvFlBYwziUaRdens5lq
	 EbwgAUpA3e8klJAtXtnjczTIea6mPRKG0prxjZ0LRxhnKOgN5oE7y6DB0t31etRiFk
	 SXAdmBolBnScAihsKEghTuX487/LSkvE28po7VWy+BaNl7cz1zetDSrHcvCqbwXHs1
	 VlVEawzy9haYcqJIlC9y4zpwj1dqSk3D+CI4dHYDAxoTHhpTbkgHbuW6EyMw8AQuBA
	 pD8dUqzwqXA5Jg3rUeN7bL7gtyvnulQJUxcEKk5T5XvfXolcY+rtFKJYFl4N+x3xfV
	 ZtKGfg4epIr0hhiOiFhNCF+gKBEX9zolivyFZjxKJg/FAR5RbudLHnLB9PdFYWfGx8
	 OT9lTH72EaAkT0UtXJSoitdrRrTOQ6GFTKN8FrL13eICfg7WJcDt79qtrQQ77l3YMg
	 9/5ooo06cDtoDMVlEc6fo9G2DuwZUUzsoV+7wcpA6Rppa5Bdvwp0XM+NjA8wAOfV6a
	 DUJoraErzi2y0uJOh+g4XTHGFCOFfWlWypbK5N/30wXaR7ywvbDpaZoquJljs9fR5X
	 SfyeHMlCl3KUWe3+4xQLRdMY=
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35dca90dea9so54642eec.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 22:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733252; x=1793338052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4L6weuCfG+0+7nbvcKznkqD/AuPq+kc5T9Pa5EzUN/c=;
        b=yT7IIQNE0hYkfss25IN2b+d99rymNVxow2WS79Z+kYc6h9xGoRVphyXoIaCLKb3H98
         KJTqoC8bbqLzj5O2Vj4bqZ3Wej5cz+lsoMznxL4Zcge0p2WLu6v+BnZ8kub3ODFTZr7x
         q3S+La6vHacDkkaFSUperMv++rc9OF6m9FtBrVYaOx9C/TsMhZ3M+FSqQSmt/fRPT7XD
         ofXkBgUneCQPRAXUnV0xSZy9JCeuX6eULul551a42StZiV7H2eo5Rxlo0VGyBeZHdUL5
         iTRfPQVCUqYYmXGMfbAvEgpEiMp7Dpii3tCK1kyGplgDxLIRvLd3RgDpmFqtwCUljhNK
         BkcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFtmXi26kWxe1ZVemub8KXEObCpRwXAwPEWKPEdbBgM/Twri/3/V7SKphkGALgzrhCHqojZEdcVu0IYzIDYiR7uUG3@vger.kernel.org
X-Gm-Message-State: AFq9FYINZChy19FDPz9DafJ6lLCRIIYtgy+J6h7b28SBU64pOQFiyGxL
	Er42X/cYP0A4xu+c/r83aCN6rzCioM6W6ovWXpcCJyU6mKDdsicG95a+J5y3PC8kuU6FGddWe1Y
	CSPXXYLH5ovjEv1AxaVRSgNv68+v9XwLY4emKTorOiQ0RQqY93A65cjjeJyeVvkgU+AwoerRqCO
	1duOk+9CEkyHRCCiw=
X-Gm-Gg: AYBFou0MfURPHaewwuJvU0GHU4jIShW/fhY3WOc4yejUYL4TNBdWHXC/7V00vj2iTHh
	+W2zsVhr3PQDRKoVMuxEQAC0hdYgGk/gLF1//2Edeh22LWKha4S4fs1jVwk7Vzw3n/CkZ/65hgp
	T5UjYY3t4Q5aQt8rsSXGHXKEd5+JZyQcElbfVmll6/BnG22MUsXzWewHvVyWWNAvgGt3WxtkPNh
	pCsVH07NtlHCpFgwFmR7OjHayr8gd2IXmEwW1OnAgy3vOoGPSoD6W3BUXl4mYpAWin0wJVz6HaQ
	GUapTCmJFB2fPnYTBp9sdprkuqSGlVepHpPAf0n/p2/DFIA6Ttk1kKkC6I3GPBfZKcurpbdUymv
	OQGP/9kEHX8RhvpTZBKAc3taoQchW7mMi2SfZMs/m4LjAVoYVsJZDGGrsrRrg2nG560CfrG6mhj
	tVjc0UNf4HnsQfOIDKOCb3TVMlUnHvqN0CSpA9JuEkRb5aEFhSvcYlCjAJZPH0AXn7YxRjamE0Q
	/hxZSGM1iWxUgIdyY75iXeJ0NFAoErqey7jPcHlwU8=
X-Received: by 2002:a05:693c:8952:10b0:35f:ea17:d171 with SMTP id 5a478bee46e88-369d975d845mr2603011eec.2.1792733252241;
        Thu, 22 Oct 2026 22:27:32 -0700 (PDT)
X-Received: by 2002:a05:693c:8952:10b0:35f:ea17:d171 with SMTP id 5a478bee46e88-369d975d845mr2602969eec.2.1792733251744;
        Thu, 22 Oct 2026 22:27:31 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-b47a-213f-cf99-45b4.dynamic-ip6.hinet.net. [2001:b011:2008:445c:b47a:213f:cf99:45b4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e1a085sm3590098eec.29.2026.10.22.22.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:27:31 -0700 (PDT)
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
Subject: [PATCH v3 2/3] platform/x86: dell-uart-backlight: Bind through normal serdev matching
Date: Fri, 23 Oct 2026 13:27:16 +0800
Message-Id: <20261023052717.2577234-3-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023052717.2577234-1-an.wu@canonical.com>
References: <20261023052717.2577234-1-an.wu@canonical.com>
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

Set the modalias of the client before adding it and give the serdev
driver a matching id_table, so that the serdev core binds the two
through normal matching, then drop the manual attachment.

The client now also reports a "serial:dell_uart_backlight" modalias to
userspace instead of failing with -ENODEV. A failing serdev probe no
longer propagates out of the platform probe; as for any other bus, the
client is simply left unbound.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
Changes in v3:
- Use serdev_device_set_modalias() instead of ::name; add an id_table
  to the serdev driver

Changes in v2:
- New in v2

 .../platform/x86/dell/dell-uart-backlight.c    | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..13515ebda3dc 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -325,11 +325,17 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	return PTR_ERR_OR_ZERO(dell_bl->bl);
 }
 
+static const struct serdev_device_id dell_uart_bl_serdev_id_table[] = {
+	{ KBUILD_MODNAME },
+	{ }
+};
+
 static struct serdev_device_driver dell_uart_bl_serdev_driver = {
 	.probe = dell_uart_bl_serdev_probe,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
+	.id_table = dell_uart_bl_serdev_id_table,
 };
 
 static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
@@ -354,6 +360,8 @@ static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
 	if (!serdev)
 		return -ENOMEM;
 
+	serdev_device_set_modalias(serdev, KBUILD_MODNAME);
+
 	ret = serdev_device_add(serdev);
 	if (ret) {
 		dev_err(&pdev->dev, "error %d adding serdev\n", ret);
@@ -365,20 +373,10 @@ static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
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

