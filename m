Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792893820;
	b=niCbUxjYAmQ5mxTN165vs3mzwFn5oF/iYFFPi03XowSjZBqks4yPi4BAIG1MA3Y7QlMh
	 TdqDf4WSacJLDxMRjv9nMhih3El9jCQQAZgzsx5inEvNntHAUY3ZWuX2ltJwqFCAmIJcD
	 Jp7KyrKdHjkukjXYCKM/0+k/qUxT7kET/u89b2AwiuocN8FyKUNQJS6szPwHwvvJNrByM
	 qUWo2PbFFq/EfMfCdyMllUa4BPuP0SH6S9q+bN66bPIGgsBoV3pd7v3x98ouHETSaRILq
	 5hTKlxtLg+UtrMK9gZISMAIRzhOabXqlFAjdjLokVevFV/E+NVcy2LzTXpSQeWFJ+vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792893820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8HMHgdeILuk+JbZuGBNZ98iCp3ntUR48S81/BHCsYyI=;
	b=NVX8CtC0qCnMMwMOBz7+XKq5HP+YErnnIbusin3eakHDMJUhF1MSfSvsegDbVRUrDr39
	 DIHJHmvAHeONZwtox4us2zzaPgxTcYPWxFfzcpQ4Z1x6IZKNbGg+bb53dtbVphPtKY6ga
	 Q/9InTn9/NYivOAz+Jj+gkUElb2mWSKmzCKfnCwsQBMSTEFPZ/YUMnRKc/52mMQQwUjGw
	 O+0FgeQEuoXqiQJNs6q/gjvx/KafMgT7nncRWw79/gWJ4eJYUDZ7TH16zAmYoEgduBx4e
	 tq6yxPX0e1ZaBpYYTibN9FoNjjAq6LildCiWLRAChoyHbYBu3UNmRzDpAXI7v3jhLmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=rWvGhGop;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2037A606A330
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 02:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2037A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=rWvGhGop
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DACBE3F442
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 02:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792893818;
	bh=8HMHgdeILuk+JbZuGBNZ98iCp3ntUR48S81/BHCsYyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=rWvGhGopgZ/uub5s+4J3JkkG/NT1mwOikSHDiqcad+iEJVIp9qJEan7aJEZZhunbo
	 CuCCrivvvjE+5XWgnpf7hqMHCGO1/06PxO25quhQygBDmuy7H1u9F9T7k0bTVfpX4M
	 L9NgC/1bQnCPZzWTx/0j5EGodPydeyAVFclUwD2FOfztBtj5eb2XgL+8o79OxlFd+s
	 eJNOiK9fz7QvkJE8naiiHTlXa8WYC60dHFqgy/wqS+FRY9nNZdtV+0rTvOPZafDCGJ
	 wqjieNEOM5YFsPuNvVUaG67S7G0XP9atyiJazK4LI2JdYw1jPvLTh6wENjL9BaxyTl
	 AMXIUAWZ9WZsWxnzN9GhJMQnbEdZFOCwqcYcEj/p9UHh4E+t7xDAAm7i9zbyTlhtPV
	 JRSkiwRArceurN85BkmhtsyX5xuZcpE6vKISDa0SBTU5TgOmEMtokjT9s2un60vwKa
	 CdQxKyUmc0oquG1VD6VqzAaM/nbx+qvWP8eSkCnM4nmzB8W4ncovuPMXWLmDmjUUSR
	 AmesFQnTyo8+5yWiFgt1TUMbOyA8jrv1YqPd1nzpkwSmNR4iSWUQxpN9hlcvZsjKqG
	 ZMsnkhcGqAKUZL44JBfp/C7rd2MaqaAX8IiWKuTbsluB2VxkdnOqG6ZxUykX8o617j
	 hpzL6csLuFrofQzAaLZUnHSY=
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad3bf3fe2fso780271a91.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 19:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792893817; x=1793498617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8HMHgdeILuk+JbZuGBNZ98iCp3ntUR48S81/BHCsYyI=;
        b=d2Da1hUO0JirC3JpctEGaGd+FivRw4bvMnfV9ydXfVWRBY5+cwAS8Gu35TUe8MWhza
         igfvUjq08XvJiQBfrnmPqhWPV1g+GdaLsJNiYssWkgvMOfKxBUhhrpBLq0wruiMqJjXk
         h+FUMzKnGc+iV2ppVXxwRfIV22xbhboCt39FfTZUd/Cen0Yar+jWuX1dDvzU/tSLvh/7
         FMvpWx4P+4cClj+/rcc70eyel0/AgIMjHDYZ0/5zz6oofUbD+2jKSL2e+wiBFrAf/GBG
         sZtBXyhAgFpuau0uRnARKnkHCJZKNNgqafwgw6aKsGa29GR+JLBBoMduco2SKHy5atNY
         BBnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOi3CEHAfQF91mJDRsGMltqG2xeCNTZBTwUqLc/aGVGBMIjppWuVG+4w0/NC4BviNXg4gLry4Da8PlVIYC0EqGsRTH@vger.kernel.org
X-Gm-Message-State: AFq9FYJrCHtDVQmgvjuFdJqormekKXIKcvcvgai4I7/A0IBpOCO2DA54
	qFqPXZ3tbAPVoIBkWMbfdrbJpQJW4dt+e73W8nkh9WcFa89riaV3Rk3QP4hXeitxxVW2DJtYaAd
	YuZeaeehQtQYfoNJV1u3oHHDHi0jO1c6AQ/ozaGtLOVUvVD5TeqjVwKRg/0Y+JdEU5U7nGgYSK8
	Kt2ftmyYOJ5CMXTyg=
X-Gm-Gg: AYBFou26e96lyNfBfoV9rTabizrZ9PFkbqxj6Ek4XciSUKXfzQ5sjqt9tx3Z5etd8yk
	F7UCZrXqAUwsacLR4idtiT0jyuUMV+A7K5gIugvU1zNM/Fvz0FfH/FVTGZt7jai7aWTpRV/bMuS
	oTvl0AlTO08V9YBrl6trWocTVCAxC+sz4nhqlGfppsP+ss0DMNvzBWmUP/j3/Ohx+SoNDVRXl4p
	Ssi3z5v+D+oGzxW2jVsCL5IFpzMuu/EtSkiOpJLrNNF5GaJy8HmERH/tpa1Dt/7jrlE6GQ+pGPv
	ufOa9SMkISBiboH0+HdIQOxkod7r8FtWgruk6L2LHrDyRBiPCGt7BSuuRKA2rLfDdfh1DrU896X
	EALjHJ5gi00yOA58rh9fSyEK6NPz3GO7NmGXpyAIKDLppNnTwADfY/8v1NxtEHsZ6wMrigP5euW
	J30Kpn44DYIbXNbkK9dtHj4/Lcz1EZ7+EX2tkHvb7F4fY6VWzj7v6W4uF9khU+ZXVn/SHtxjhJ5
	p6ADH09Jsh1KnnnCya9rcEcRcPWOtStw3nSxLFBDg==
X-Received: by 2002:a17:90b:4fd0:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3adeb0f6c42mr4824999a91.5.1792893817343;
        Sat, 24 Oct 2026 19:03:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd0:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3adeb0f6c42mr4824972a91.5.1792893816917;
        Sat, 24 Oct 2026 19:03:36 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-0e25-4b6d-1924-440d.dynamic-ip6.hinet.net. [2001:b011:2008:445c:e25:4b6d:1924:440d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacbf5fsm4226044a91.6.2026.10.24.19.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:03:35 -0700 (PDT)
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
Subject: [PATCH v6 3/3] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Bind through normal serdev matching
Date: Sun, 25 Oct 2026 10:03:17 +0800
Message-Id: <3827984795c4bd797008652a49b069151e1e8be6.1792856688.git.an.wu@canonical.com>
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

The software-node-backed serdev client cannot be matched through ACPI or
device tree and is force-attached to its driver.

Pass the modalias to serdev_device_add() and give the serdev driver a
matching id_table, so that the serdev core binds the two through normal
matching. Deferred probing is then handled by the driver core, so the
-EAGAIN translation is no longer needed.

A failing serdev probe no longer propagates out of the platform probe;
as for any other bus, the client is simply left unbound.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
Reviewed-by: Markus Probst <markus.probst@posteo.de>
---
 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   | 25 ++++++-------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
index 5e568fe1162d..ecac3eb3f336 100644
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
 
-	ret = serdev_device_add(serdev, NULL);
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
@@ -304,10 +297,6 @@ static int __init yt2_1380_fc_module_init(void)
 {
 	int ret;
 
-	/*
-	 * serdev driver MUST be registered first because pdev driver calls
-	 * device_driver_attach() on the serdev, serdev-driver pair.
-	 */
 	ret = serdev_device_driver_register(&yt2_1380_fc_serdev_driver);
 	if (ret)
 		return ret;
-- 
2.34.1

