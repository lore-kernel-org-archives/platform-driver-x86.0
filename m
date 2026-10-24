Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792808995;
	b=5MNS4ObE4/cLYzin+Is7o8MBYLBdARF1eQ5eYJSlFdne6j2j0MJBkHwkQpPnjCehQZEc
	 097zSh8wEXFC7mbHbRIhXPTGRi8LUCTascnO26Dmvn8gghjxmH0zn70xv57I6Yw/QzsEd
	 s8ui3u9iRKc2lDK66RWE8QEcPMn0J3dCNT8bph9WcqqwDS7EZzouiFit9dcTIC+ks5bNX
	 KgIEQNieTtCasm+9VeoVLhiZIsV4BaBuNGuI2M4LUB/f0HGe+2eshUGLR+9aMS3UrPqFx
	 eCAb85NYpSQtUggmYaZcMO/xGuCAssmeT1VenoZtjYvLZgsXS7brI2lPjQ46tn6HHsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792808995;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
	b=tqJ9XJxoxWBPZ+Zb/3F6+x62N8ICOOaTyE9sSZMoBXufveS1rnjyQl5mjm0aWCaKlheE
	 xJhkU5F0Z4syLaIdgY6CL5LeBdO9Aio5jNoYtz80DNSz/+3kyGxsw1DwBaSUltddrQmON
	 4VD17IXuUzBf0u6EEtyoUzjNVwSPFh0uuQGt4jf+Tfs0TGvhsOrMCnwux+FTp4iCcUw6B
	 qNiFip4mb6u6agssaV2psykO9RyTFywO3pSLCJ7URUUih6Bdm6lZApYAFTrrow/oCJ0VP
	 /6Jvjo9b0QqEsPfAF0yKHfFhDuKpsV1Ygb0ydzI0IMmd9C0b38p+eeKaisrxT4DZQig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=H9ijO9tz;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE3A606A32F
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 02:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE3A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=H9ijO9tz
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AB59F40334
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 02:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792808987;
	bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=H9ijO9tzhTGXqyy2qGYxCC1jLR21xEYsjPStybnUXDJ6jh9MoTVcHkqRrTzsTAWDy
	 jqqd5C9IOndBIH5MyFa79dE5Nw/UMRIU4OogtIcjJSryBbPqlJ/pl5SghyfW42kWJS
	 G9SiXPq8v3wIcpWPjjUovkCp2l2G1xgCIL2wuJwF85DC/om5nLlRmuJlErhZup+yt7
	 YDyskipv1zLbv6bgNBCJbyVqcvHfCTGjwFcOTaeUbwO/sa15sZXKVxQMUvhfgD640S
	 wQzhBU6fzI009PflVt/M+1AFqWMTClzBmQBcqVA98trYWxnH+FPUuB6T/mUYOcXC+8
	 1fkNGWTuoLB0++5a07YiES5jWomh4T0pXhbdNXokHSjkXyKj5nMp5PSjjuDjf4Qui7
	 zlEiyinnbLhzVXCwOIm8rcGSAar7JzodYyOCLZl7xy7KxEMTXBuUoQSTVtwXU1exL6
	 1do/qdGoauBkkvz893UpOvrpgwOtf+odDUq3UiDvCBLQHbdD5pLCcPHZMH6weXCPFw
	 sI4Qzog9Wy/RhdwSEolTXDpBNdHx4tLUpHRayJ6p7UEsmTkLj3hGYLGKGXmHKKmsZE
	 8ZJVbkJ3B8umIJozH0pGEdO4TMEaOwr5MBhn4IWH67rTJ5rtfQPNp1zsdmpj7+GWFW
	 IH1wVySKPVk959f8AS8mpEH0=
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab46165261so389412a91.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 19:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792808986; x=1793413786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
        b=O4HQLVyq6f15M7ooGWFz8VwBB3dTgY8Rc7oqMiK2sa37OhrbGqa4d6ajZLu4TkNUVW
         5rjHB43bjntvcLYJEHfIPPwTObvVVE0B+CMO9ePi1eetjnBb7qNuZ9IlruyhrhZfc5JI
         PkaO/iqwntaL0ht+QpHH/dGL1uR0g5iacd5jnBOpDCmzM8gOkUPM2UCWq4z5WZHxUl0s
         zSBR79nuten1qAeAc2kooRU8LPwVRb8+Ew1vIh4RYsZwwBd4zKfK4ulB75e7RRjNMj+O
         2DzekSGgdNq/QJcKm6rwGr84x0+OquEjkNjLt5vurQAOdILdu9O9JnUvENVlCqOdJ+eK
         +mXA==
X-Forwarded-Encrypted: i=1; AKwUvByHbDbe6/s8rHLFgG+z0AAfVxFIEYaI0Hbn3OCNxGotQn6TUGQadDhnyTFuvfZVuA1W7LftZl2UeX2DFHd14ULEr/tw@vger.kernel.org
X-Gm-Message-State: AFq9FYIz+aWiMPurY1cclroO88LhB09PNYXFGWq211Ow7RlLOdDTTp3l
	IsrvjU2FMjiORnJFk02sC6/slJj7sTY/2F1IGthRjuOZOLkCtOHqHnbp+YN9OBHGMjyCiEL0+1t
	GjS2dQp5ACPAe7Z8X/Jh9JU4UMa/x/9CGrbcy7n8qihP9twsXQq5bsBOl9nzuyCIQ7nIsRMpZQk
	c8B+/PSkuLhzwDk+s=
X-Gm-Gg: AYBFou3rAuHIMhLRZNkSewxVIxt49Ts5B5IHUd92qKuzP8+YEeSaQnaTJVxgqL5MAyi
	sjY5jWBTA4sz1f3s6CuKHsV04LfJUKkagNP5Zte7jidQLT8j9k9W950IGj31lJxqr7sjrWO2KWV
	u3awb85Zxz0XhqAgN1fNoJJQPJapFQGtb4bQAXur1APxOa4v1Thds/sBiTj9br2z6kKSw7Y66uC
	yoyNC6PzgAY7PzNO0JKybwAKqzlVXauZlbY7rhWCYDHip/0GlqoopDQsEpnpS82Z/XB/H6NgwBO
	xdik0FJjI0/hAt87KHqjQTy6rVmCKvk1ejXk/9PXhVWC//cJrJJLELnKsUT4lZvPShmBtr9Rye+
	6/Ke55OmNkSCLbL5ERiSPM5eP7d4Q4jotUcnrHFSIl/f/HaJLik0KBQTdNIe1oq3Ehrto7sRmjn
	wY3Gaa9iekrnpXwaDpdzq9yfTnBmCs9WuXpKx1j+f56v9GCEcp25Z2dT0fjC8ObaDrkZznKgiLy
	I16d9LwdyCs9fJJOOha9Uk8//XdEFJ/dVPs6WsTUqQ=
X-Received: by 2002:a17:90b:58cd:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3adea2003c9mr1490264a91.2.1792808986092;
        Fri, 23 Oct 2026 19:29:46 -0700 (PDT)
X-Received: by 2002:a17:90b:58cd:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3adea2003c9mr1490243a91.2.1792808985767;
        Fri, 23 Oct 2026 19:29:45 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-9c57-136b-f73a-3698.dynamic-ip6.hinet.net. [2001:b011:2008:445c:9c57:136b:f73a:3698])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb75254sm587341a91.4.2026.10.23.19.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:29:45 -0700 (PDT)
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
Subject: [PATCH v4] platform/x86: dell-uart-backlight: Bind through normal serdev matching
Date: Sat, 24 Oct 2026 10:29:29 +0800
Message-Id: <20261024022930.2704030-3-an.wu@canonical.com>
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

