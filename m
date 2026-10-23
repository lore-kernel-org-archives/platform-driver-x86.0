Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733258;
	b=eFwfzs7tahdVrCZQk2NRezqpc+JG8YNwL9imvdr1r6270pN3GdFUrgQxmbD1WJpzgKKb
	 k85UEPLhBfJ3V8c8K8WyqklOZKbRaino9nV2Vo6oO8IhWn1c9r4YDbF3QWvilEcv7IG5M
	 lhPOwfbI7IZ+l1Tl973lEhEgYqCaWJDiPZmvRu39J+DUkIr+9l3iDjMvp1yQK1QgXc4Z4
	 zGQg0XM0KtZp2+qVrP+kEwdSqGnrkjKY/axGgWXQp+WUykV7hLF8ZDRrbJFVLfu1I5F75
	 nlre93CZ+v77NujHGEvr4BMMYUEZ6LNtVWauK86LNXlXHHZcLGccv6tfgnp+xIbQDWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733258;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IMwZb/VFaN95E89jP9ukm1SSK05tIJqySoFJB1gotfQ=;
	b=zg2KmieRaHVPi8KGv8aMWNOkZ14hBx7qWrcnZo9XK5JPh/lZCAGAIA78kbm0xkNvYl6V
	 a5u09w8rgn6bEY4JJOy8Y8B/S0+JtR/rcltgpr2h9rtKvX3NkwOLPJFI8LMPHOC+wIkew
	 755KfTs384IEHyyc69AUyIgPo2XyuAlBMC027wKHYMwyVSkD9L4DLJLfBsfjLmR9moOvg
	 Vd7g/mYS4QypR9tDanPkizDu8WUs7UJAIChaLJSgdvNbPKhepP5UDMKv7nshGdPHDqnTt
	 TzQ/tj1Y752vv0VyNA4P+m5xtI7XjzrTlih8O0Qp8jlEbQJpDtqF+B+LR6icx3QtlYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=P8O01mz6;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B259460A260A
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 05:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B259460A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=P8O01mz6
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 919CB402E0
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 05:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792733256;
	bh=IMwZb/VFaN95E89jP9ukm1SSK05tIJqySoFJB1gotfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=P8O01mz6SO9B4BmONAdGWQqB1auURsK/bdp1Vo4IPl5at9Gh3c6XNnH7r5EzmmidK
	 46wMLeVg7bFfofbGPFk34BDtwi79L7D8T+pBviSUplZPwtVH/ALpqGENSeybb/6ucs
	 7Gn5biUDw0fp0sTtjY8JtUNKNYNytI3cgOWAxJqGpZVHSrFXiN7FQlRDTgXJpxWJxe
	 2M35YE7ViMaTfs2bPlKKlU5TfgU9P/0iJ1gOQ2qnbjo5qeYjl6rP+1IvbKrCnq4vHu
	 ime9ci7BzR3yxPF15fQDyah9PAccPnDiAH0ULV6a8Xqr5vfUsBSuq2QZ2BlR8vbnb0
	 MA4iFucwFpDCQZjkNP3B6hNnz0xi/IReu47jCYPvuvtexbVr1r39ubXnKyZa+kOAwa
	 00W3WXoCUrjeO4WfgHUg4emQuBOUVSkFrXRur0w5zZzix4QM9GHMDTPTjCb+pn7TVX
	 dY0koDcG6mDa7j2LBPyvHiEltn4iY29bue6MIRk4DsTXUcu/7Yht92guvmYyTLe3FI
	 +l2BvVa+Kx195L2VAFuflqMgXVwMwusWdEmuKDGZdgp/wgY6G9lREgzG1kenD9pbLt
	 mvGDxGcb8oVZ/R5wS8uUi7HkD5rPfoss7oyHWahQ4tjTBUqV1lK4dOd1Ps1xx5d3AL
	 TKhe4DWS26YmYirKss2RxukQ=
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33bf1d17dfeso93736eec.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 22:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733255; x=1793338055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMwZb/VFaN95E89jP9ukm1SSK05tIJqySoFJB1gotfQ=;
        b=nYHvB9E0mPaZnUDL2mG4At/TC9C5bkxYF+WDeOODwjTN5dxptLVQd2H4zGBIGvxDQG
         pji88+O67dfqcq7/L6suoLy29VD5qKVzXfCfOsPms3sud03xfDK5Z/HBbK4CXyuhLXYK
         8lavJLPQBOP6RV0DiRgI1W6WQCfdY42VmRYza99isVikxeIrxkUPlVm/JCrw02HBjQCl
         /LP5vpnW20wSl1J10Vkrs7EF4NiruuYlHWZHLPgom0n9PYLOdxJMsadevl4T5BH8qo9Z
         LBV0cjBzBmpY6kx0XaqfUp/qpP5H7fUPO3USqsa365gvaTJEA6ooLrvySlBPjfOhizP1
         SQNA==
X-Forwarded-Encrypted: i=1; AKwUvBygqih7JBZGf9eLfxwCzDi1XtWFyLy9Z4CZOPxGMwnt5gDS5KXfdsf4aUaQzS5fHgvkRiyERw0MwbkHhpzTcnhrniPY@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9zjCuiLawWapnUrRbJsdR7M8/5k+6kpCb9fh+e4R7aElKyQb3
	bgQZZOzClkm9IQQd8dWk4CEl2ny8pgTdm//eZomsAdXLZNBmhba4NsaGTpxENkZTvYt9QwwMLKC
	r/oyGL6iWAeDlbgX8wpRSjOrz1difRLqs7EhGbUR/MQFY8vk/UTadx7yEKZWbCjkLtApvUEa5Wd
	5vOX7No+pZCO23QRI=
X-Gm-Gg: AYBFou1FGmanny4PFNNPclQ0qxDDjfMnqU4w0FEiNBqrxGCHVsx8VlrvGMgyfKWGKGM
	c6xnu5YQb4mwYX+x0OUesEVNCcszchmBYD19f2Uz7MMd2t2RUcLBA1yULYOlRTUHFIhrwIPtgej
	pw/wl1AROnOXcz6mio8djnSXToyclmox1qsckwqU9VH61lIfaFsjJeR524HzLwKgw7Za0mgAEFh
	SHL2h5Oh1kB6qsRdkant/I71zr0guEb8r4I+UUImjSeuPruXjT/HgULdwAoTPFgKcjChlg88WyW
	0RHmLJ0O0S74CcdoxChVop63T68xaPnEZixiB0FelTThV367l9J+9LhEKX93TKtdyNguS7tf/RO
	slOGUMUfNCZNmX11gddyWrk6aQhe0AKGnTkhb+yNi6V9Kbs/WYMIicXoPw7SwKNX23m9/ctJw4Q
	GPUg9hC1PpIeO/F8u9zIEkiVTNns0QPNvR5KO+CmZAmX5mwmI/KJaEQyjbzYVPfaJEj02k4SU/Y
	EtD5tqPmIL21F07ZowE35CNx48GTmCUGQGdTN0GJKg=
X-Received: by 2002:a05:693c:87d1:10b0:367:2bed:e7a5 with SMTP id 5a478bee46e88-369d978c94dmr2892495eec.2.1792733254876;
        Thu, 22 Oct 2026 22:27:34 -0700 (PDT)
X-Received: by 2002:a05:693c:87d1:10b0:367:2bed:e7a5 with SMTP id 5a478bee46e88-369d978c94dmr2892448eec.2.1792733254322;
        Thu, 22 Oct 2026 22:27:34 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-b47a-213f-cf99-45b4.dynamic-ip6.hinet.net. [2001:b011:2008:445c:b47a:213f:cf99:45b4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e1a085sm3590098eec.29.2026.10.22.22.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:27:33 -0700 (PDT)
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
Subject: [PATCH v3 3/3] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Bind through normal serdev matching
Date: Fri, 23 Oct 2026 13:27:17 +0800
Message-Id: <20261023052717.2577234-4-an.wu@canonical.com>
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

The software-node-backed serdev client cannot be matched through ACPI or
device tree and is force-attached to its driver.

Set the modalias of the client before adding it and give the serdev
driver a matching id_table, so that the serdev core binds the two
through normal matching. Deferred probing is then handled by the driver
core, so the -EAGAIN translation is no longer needed.

A failing serdev probe no longer propagates out of the platform probe;
as for any other bus, the client is simply left unbound.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
Changes in v3:
- Use serdev_device_set_modalias() instead of ::name; add an id_table
  to the serdev driver

Changes in v2:
- New in v2

 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   | 27 +++++++++----------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
index 8551ab4d2c7d..31780c4aebe0 100644
--- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
@@ -219,11 +219,17 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 	return 0;
 }
 
+static const struct serdev_device_id yt2_1380_fc_serdev_id_table[] = {
+	{ KBUILD_MODNAME },
+	{ }
+};
+
 static struct serdev_device_driver yt2_1380_fc_serdev_driver = {
 	.probe = yt2_1380_fc_serdev_probe,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
+	.id_table = yt2_1380_fc_serdev_id_table,
 };
 
 static const struct pinctrl_map yt2_1380_fc_pinctrl_map[] = {
@@ -260,25 +266,14 @@ static int yt2_1380_fc_pdev_probe(struct platform_device *pdev)
 	/* The fwnode is a managed node, so it will be auto-put on serdev_device_put() */
 	fwnode_handle_get(dev_fwnode(&serdev->dev));
 
+	serdev_device_set_modalias(serdev, KBUILD_MODNAME);
+
 	ret = serdev_device_add(serdev);
 	if (ret) {
 		serdev_device_put(serdev);
 		return dev_err_probe(&pdev->dev, ret, "adding serdev\n");
 	}
 
-	/*
-	 * serdev device <-> driver matching relies on OF or ACPI matches and
-	 * neither is available here, manually bind the driver.
-	 */
-	ret = device_driver_attach(&yt2_1380_fc_serdev_driver.driver, &serdev->dev);
-	if (ret) {
-		/* device_driver_attach() maps EPROBE_DEFER to EAGAIN, map it back */
-		serdev_device_remove(serdev);
-		return dev_err_probe(&pdev->dev,
-				     (ret == -EAGAIN) ? -EPROBE_DEFER : ret,
-				     "attaching serdev driver\n");
-	}
-
 	/* So that yt2_1380_fc_pdev_remove() can remove the serdev */
 	platform_set_drvdata(pdev, serdev);
 	return 0;
@@ -305,8 +300,10 @@ static int __init yt2_1380_fc_module_init(void)
 	int ret;
 
 	/*
-	 * serdev driver MUST be registered first because pdev driver calls
-	 * device_driver_attach() on the serdev, serdev-driver pair.
+	 * Register the serdev driver first, so that the serdev device which
+	 * the pdev driver's probe() adds is matched as soon as it is added.
+	 * Registering it afterwards would work as well, since driver_register()
+	 * also walks the devices which are already on the bus.
 	 */
 	ret = serdev_device_driver_register(&yt2_1380_fc_serdev_driver);
 	if (ret)
-- 
2.34.1

