Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792843504;
	b=VMJwq8ojiCu0yUnR8sWQFT5qP8uLXGqgJaWWJVEtcOYbbWHfBuXCbbCZTcKJ6Bj3o3aq
	 PkRH1wT7wUhxopvrTWHJISplpnXpcEo4WUOT/g/VyGP3XsullvCljIB5gouYQ3zdHHCJ3
	 CZyKG1uvFQxBWV1HMA3ivhltc5neCSYTCf9kEGdoNAO7fA59pHuJ/DOcP+VFvN2LGjUyy
	 idCO0aX8kJnjdvknjJRdjwQGLTyzdsYXfXYWmraJPsJA1BiudXVD9NOFme5FsEii4na5e
	 nlhk+GNQbRhEQLxDZJlBxqOx2yh4BkXfG5M6xtQgjG/4GbQumhzuSlLvZIrjz95Wy8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792843504;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XcXND02uVU9mligWZKre8PewcZOkoWJ0b9UoDwiNQPw=;
	b=0lvXP7j9yBA8xOSUeW7IfRUWkdlJvUROUWZCrTmwb9MDA6wuZjywooAOCnJVATd99M3t
	 CTyaqSvVKznDabMRfg8vvDKQD3TkRFFv2r+YI/V7IaLvHEiSf9S2nMZW7AQZkB++13j4C
	 EMBes7xbFPI41vY6BntD3sOrBVFR4lBwMWUJedanrNNJK1dBU9Y+uErGlNx9yGAI7cC6I
	 d62Uon5dBm4BZBB5OzzpCbbORihv6URMoLObajaEJFn5klPErD5R7NhKwsO9R343b3IVQ
	 yjI+aFlVrcuRUt8FypMEWR9JhA35kf37vlQao/myAKP1GxlXoE7xVxqnaKqsUeHVT2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=I0sgSLyf;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4EC606A331
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 12:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F4EC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=I0sgSLyf
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 650743F698
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792843502;
	bh=XcXND02uVU9mligWZKre8PewcZOkoWJ0b9UoDwiNQPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=I0sgSLyfiwSxnbjIJjhfm6g1YLsCEnhfuW5WZ6ZjzjYCbx3orKIIuYV0pRq0DzXvN
	 lOwRVWd4ByYKijLzCzVEzxbJE6JwbqXUsAxzysrLt5AoRHDoa+/Uhxt6ihfbKGrCcL
	 K1yi1AizLgrkT1WTv5qLTqlGM/WvuX+LbcAlhBtdYvWmLUsjahmmupNPpfuZerN+DZ
	 ZCqwCwU5vB2flUXABFQcsAuq5xdoTsA3shFrtWRjK7wS0KCO/FmJfL5Zg16cHOCuLW
	 Wjz0qxej8y5ERq4A/3nrV9UauyRdkVrV4ZkptuaDuXG9qdISqfDJF7cj/ssjaaobub
	 Teq1YkIeUH8lA3SshGx0Rugt/shlpmQL2fHCpcKNvseg+IM8dEkKvOeFrVyYUjzWve
	 wTeQo9etPzdY9PML+ZSi3RAcYO1fvRW3QZ5lRmL8tfup6vwJFQb4vB6rIWzCY1j/bC
	 y8ks4b7rn+Hr6sU3L9/xdwIZMiz728A0W1dy+eodYMMTVw6lqK0rAbKy9Vac1UF08K
	 m+wyFIzpe8Gdpb0wcN49oZ7sekN9u6PPMe3Qi4tSMPPjpr8aoo6qe/VbpKCeyBbruW
	 EF2InAednb9OijiUIavZjUUJd278+6LkX9DpnxZMibY16GfawjrpXLNGpG8iWWboJE
	 kbLZb6nsgHhZ0cE+7Le61Sv8=
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad94b96698so489270a91.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 05:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792843501; x=1793448301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcXND02uVU9mligWZKre8PewcZOkoWJ0b9UoDwiNQPw=;
        b=CuzJlZ4zaKrPVK5wMe5Y4bakoRcdGvuvlJEHX0nfjaWKOVuebQJD19uds/q/v4ntbW
         19T1Y+G8Dmji9xKXBhnZHDci3CkqKKlQOh5M1rqm2wP8GtxvDtx3QVb+2M3HdwehdQLP
         5TqNYgUT4RJiYSb6AmRPiu0eCsXAHXK/I/nhMcSpD/VnUF5Q00rnH84MJO4KoRjrTnMo
         sSEG/Kh9bw7KscTj2/naXQcZKb/XU4Da+cJbvVsqd+MmJaADtR7TyqOK5HqA7ISsAdL1
         3zS/aIOrmLwqr4YEvYK3IjQEgEVM793K61dfYEG5lTgWEL0yDylLEdGDlIq+ySSaeYex
         9Cug==
X-Forwarded-Encrypted: i=1; AKwUvBy7KL2viehUGR/PiCmJDQPtJVFGKXp5zwshFziw16gxXkOgquIjEAxgnDPFvHch3ZiTRRBt6Xwhr+D1ZD+ePS4V9i/X@vger.kernel.org
X-Gm-Message-State: AFq9FYITxDnX0SbxGTyVorCvf8jMSttYJcExeoHr1XT/y3CCU7uyqMNY
	Sl5HpnmDzJhoAx/dVDwl9aVw+c9Sn3l3q0xP62IfAjUnqtoFXXusyEazkmgjFwTooUuri7nmtNt
	8mL1OUlXujJarGuDu/Kv4LyokBE+d3LPWwZG3hUCL+qh3qadHR0wrMnGRUoPDXA1t5+w90pPJRi
	deqnYjfJViJ8O9HLI=
X-Gm-Gg: AYBFou3bYsfkwWu6HMXbB0fsknJsWgQvvWmg4zHT99eNszMmb9mwFAkec5hgU41wfiG
	CCgZ6qhPKlHdQdjqGmfXOX/MfUrxrvLWSCZqi17l69kpykepyttQTO5vHtuTOOE5nwtnj3zESJ4
	5EmApLhwkYQmyEsKysjN9uYrWA9WR3yzbh6d/b5ktrChdL4oDFoY6Xd42aepRpsAy6vuqSX5XjI
	FrT5cJrODg3Tted/QB+l9E5uBl5qXm10H9ccF+Se9HWbEoyKPGDEJoZC/EzTQP4lX30SgQp3Jkd
	8+bdcAPf0+DLUqNa+q66OyLrY4p+wnYPmu8x6Mm1+32US3MmUyPhRulHNTays3kKt0MCp2OfZ1K
	dR1kGYb4KdHygrojM5hyyXeuDTLBjR8XhEfEfB3wYhYyEv3a8mas7HgWB7PSGz9mq8bZItApWoY
	J6XpMI9OeEJuWOwGI5th0lzFJkIL+OuqEjQ4hm2XOIu6GLUsmgnESIwcedVmTCnXc/XOYmpsAcO
	Wdwpd8CiJJY7dAeOgFQc9fkSzIyofH8/MpDUwuIUg==
X-Received: by 2002:a17:90b:580c:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3ade953ea72mr2539073a91.0.1792843500793;
        Sat, 24 Oct 2026 05:05:00 -0700 (PDT)
X-Received: by 2002:a17:90b:580c:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3ade953ea72mr2539026a91.0.1792843500265;
        Sat, 24 Oct 2026 05:05:00 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-0e25-4b6d-1924-440d.dynamic-ip6.hinet.net. [2001:b011:2008:445c:e25:4b6d:1924:440d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb24a04sm2893409a91.16.2026.10.24.05.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:04:59 -0700 (PDT)
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
Subject: [PATCH v5 3/3] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Bind through normal serdev matching
Date: Sat, 24 Oct 2026 20:04:40 +0800
Message-Id: <5e70a181599ada304c6aa6589cc61662f1a8d710.1792831564.git.an.wu@canonical.com>
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

