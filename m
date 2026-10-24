Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792808992;
	b=ZdG+J45rIwAYgEfiMEzEeTN9kWjlK3G9/hiBnwzT9jGhXboHUn3/8AkmjQjhA62qkgMD
	 XpCItbIJQNxwJzF0llxr6U1iJy+U886hnXbSGZSTH/hHD55NsW5g3Y4LqNF4k6tKqucRY
	 Qtmz4O1w8iefTqOSl6vLcPcSqLftfRUDutqvOWjJizy6CQbwmIAE4lHjN/Q1aBCSt09vk
	 2T0ea9TSoXkLGuQgDCTentBwWf8aPult6nRafCs3LMozO64KFEHivOG1bfj5l3rsLqO0k
	 Ei+WDnIVRkKJy2XLu+towBQDZh0HRtoHeCCprM7sAi0gbTzLVn8nspbAtM20mVlXAvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792808992;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XcXND02uVU9mligWZKre8PewcZOkoWJ0b9UoDwiNQPw=;
	b=z1tIl9OCmeUlfQSVzgaBh3luVVepLvD2S1DQYdYjYmASy44NQ5LLZ8fdSvv7U9HjLGG5
	 yTMBT61j5O1KBNc6TVmvcQS/QLy8lMAvV3U7HzMbHdkg5Q/ZhRWFd+5Jz/0d09gWUZtD4
	 liV+bz0SGR/X7mQgiKmmHIOBBgXnYc21+6Wv4aRo7O/esJOqAnhzKsTWDdmLB7nLPZ9oI
	 uGHZjXEDAcdnQttcHXrUbVK4hKrOQscOltVT80CcVlf13KP4DOJg95LrLC1Ran++c3sgK
	 pHlg1oyxlSmPsinFA1LTGeplw2Rst1gkUyYt7SFMZ447igxOBoUAuvqsRsZLEhdqvvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=ar7yPg7j;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90485606A31A
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 02:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90485606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=ar7yPg7j
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 60BAF402D2
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 02:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792808990;
	bh=XcXND02uVU9mligWZKre8PewcZOkoWJ0b9UoDwiNQPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ar7yPg7jOX43xUprxw2RgD7SBcbws9+iM33JEsO0/7KTqmLlsww187gug+qJUwN9x
	 G3rpWbtWh5dGI3SN6DkCN+uEErKJpN1C49npC3ZV7LP3PJfGq5Kcyur4sJteQo7B3t
	 w0P6EnKFcrGGhoD5zk6r0ng6ayngtatwj0awYSV8neR1RDO+pNKlt2ptlR5V3yV+nr
	 3f11EKu7KW/hQnn2Kksu/D8urs1Mc89IRZyddiBevToKaFVxjFeFtnaZKEF7xP24dk
	 WMVIhvI7km3zS8BYCdWSibnbt5/uqri27ncCVqD3fm/L0xp+/SIyqPw/sREHIzVk3j
	 5NUvxotONw3mqo6x9Y0+AuLFhngR8luwG7Ud5s/i/A2ZpxXzLJygGpgIzCBYLLWzip
	 IyWCHHEbrVVNi4i1o0GoAa2/WFMPYUr165ulUTguyiX8Chmh4xHTBzL8xUpgsfB0rQ
	 Hbjzm9PV3Hv0NiMZh0CsHAhb/7Ag/Ru0V5pFsdSBTGbA5qd8k8v6fAqQUhufKLM5WS
	 7bHwCrFZLxeMIqofWyDFU911k9kuDg2CMhAqCKW2F7/z8U+IRDPGLl6sPKG6GbU7wF
	 Wdemb9otEXO5+7rioJM/77SVYcqtFRr7hWGAmldHslcTsHSUm+mW9jFYrB1q7oLauC
	 GtIR7H6Ll/u5r9XL5GONA3BE=
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab46165261so389419a91.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 19:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792808989; x=1793413789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcXND02uVU9mligWZKre8PewcZOkoWJ0b9UoDwiNQPw=;
        b=QJB8cZNSzBHjLAgjwBKOgk3CbZ6N/lBn6nI7LpNxNH2LL9XRlmFUncpszBXJ9zpWZF
         LPeA4m3b0WoX9NTwjmPHf02suCQfrxw6lU95Kz/UmbcuZJt6LWZIOQYIydLd5ViRv7GZ
         6eBcZdktuR5uHqsz6ZmFFrpo8IchOqhiFBUX3Au4UyHoU/8cWpiG+aNxxkv61//+d7oh
         C1qq7OkXmStdX98IeIkXn4AJJ/orb5/J602Yc0bG5N7kbNjDJSNZvGZKXUYSl6c1xq2O
         OLgIDFJB2gklhhnwzx+jVYpbTWLGMlnNy/45JpvspncdifDfMIEdVkm2JcUKaUzXpcnG
         oUhg==
X-Forwarded-Encrypted: i=1; AKwUvByNFKpPfBicsdO4Uxr2+kRmAnjJWZV3a6OSi/H1a261iwWZSVa+bjGWw5CB/3VeCwUKMtS9ITl0v7jv3HNUXL6v7Usn@vger.kernel.org
X-Gm-Message-State: AFq9FYKFu96B8JTiaVxcNq+1a1L7hazZ/FmmpmqqT/mlI7yrC2Cc8Pq3
	9kaOAuH+1vsi+ulhAXImCTOqeVmvIV7rUvtqzsxL990/iWO8T/hG7TsI2L0ODmkjK2zHKY6MIYu
	cEO1Tf2az2OHI8QyD4VqxU+Xezo28yDCvv+k4RmyukJxJFgTxHIoNaz3Izy9LM9rf65EcAgJaj2
	dHunRveo84dElw3Go=
X-Gm-Gg: AYBFou3hWLJDn/i/XwVEzPe13bq2Qu1Ny3zu3sVRvwvWGOsN0DnBbMdwChb6rWnlToe
	JrQYpR4bv2EFGKLEIFv3OLXiWqjBUy3D196BmgO/AJa3Tzi7D+XIkUY/z/3mfaYxGxaQBvUdBxm
	Tj+9A0+p9IVS6dQcUPBJi3QOzYTVEQu894WXlSxW7f9EQIvY5LWAUbh5zK8mu2p6I+camVt2RYv
	LI/NSShpWJ8H2OQp1SHyWTgcFgrT3sFZ0VaIR/7d4+cAZa2+c56nwLoJ+ozNwlhAbBeWpG0KOg2
	ylJ6z9CtZfN6H0KQzE1uwOah7Dfkv9KdR40/XlhYiVhoPSU/vXFA28ICSnVBJ5AJUPbhe5Z7yjB
	nOp2sGsZBk6BUBCGgpq+Ah4Iaff/oRqOiHj5ZSaVQwTIwZd2Zo2LVDoa2z+QlLAPpaT4BxEvLFH
	VCQF4cWcNIEAfjkMy8Rh6dZHQuw3yhFa4D8LSVNgMk3hhn9hXBvdhgSZwaAY8v+JBUzvhDC3jpZ
	m4GA4kQwLLgpdYUuRuYl+RvAWyfsF2CRk1SmoD9zR4=
X-Received: by 2002:a17:90b:580c:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3ade953ea72mr1289336a91.0.1792808988906;
        Fri, 23 Oct 2026 19:29:48 -0700 (PDT)
X-Received: by 2002:a17:90b:580c:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3ade953ea72mr1289311a91.0.1792808988509;
        Fri, 23 Oct 2026 19:29:48 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-9c57-136b-f73a-3698.dynamic-ip6.hinet.net. [2001:b011:2008:445c:9c57:136b:f73a:3698])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb75254sm587341a91.4.2026.10.23.19.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:29:48 -0700 (PDT)
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
Subject: [PATCH v4 3/3] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Bind through normal serdev matching
Date: Sat, 24 Oct 2026 10:29:30 +0800
Message-Id: <20261024022930.2704030-4-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024022930.2704030-1-an.wu@canonical.com>
References: <20261024022930.2704030-1-an.wu@canonical.com>
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

Pass the modalias to serdev_device_add() and give the serdev driver a
matching id_table, so that the serdev core binds the two through normal
matching. Deferred probing is then handled by the driver core, so the
-EAGAIN translation is no longer needed.

A failing serdev probe no longer propagates out of the platform probe;
as for any other bus, the client is simply left unbound.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   | 25 +++++++------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
index 8551ab4d2c7d..d0bd9d4e3137 100644
--- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
@@ -219,11 +219,17 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 	return 0;
 }
 
+static const struct serdev_device_id yt2_1380_fc_serdev_id[] = {
+	{ KBUILD_MODNAME },
+	{ }
+};
+
 static struct serdev_device_driver yt2_1380_fc_serdev_driver = {
 	.probe = yt2_1380_fc_serdev_probe,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
+	.id_table = yt2_1380_fc_serdev_id,
 };
 
 static const struct pinctrl_map yt2_1380_fc_pinctrl_map[] = {
@@ -260,25 +266,12 @@ static int yt2_1380_fc_pdev_probe(struct platform_device *pdev)
 	/* The fwnode is a managed node, so it will be auto-put on serdev_device_put() */
 	fwnode_handle_get(dev_fwnode(&serdev->dev));
 
-	ret = serdev_device_add(serdev);
+	ret = serdev_device_add(serdev, KBUILD_MODNAME);
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
@@ -305,8 +298,8 @@ static int __init yt2_1380_fc_module_init(void)
 	int ret;
 
 	/*
-	 * serdev driver MUST be registered first because pdev driver calls
-	 * device_driver_attach() on the serdev, serdev-driver pair.
+	 * serdev driver MUST be registered first so that the serdev device
+	 * created by the pdev probe binds to it via the id_table match.
 	 */
 	ret = serdev_device_driver_register(&yt2_1380_fc_serdev_driver);
 	if (ret)
-- 
2.34.1

