Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F8C4DAF95
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548840; cv=none; b=IfBzBGHTJdlsFv1Q/yxzE25YEzIzKlSOhSt/2oITadwOB5tR8JPbDqNBkkMDO+WLJRxLiN1D0BSz7g5RpdwZYkYjOan2rJzlfMNyY5TlUBIaNb9526lgcY+rjHSCOGoyRY25GYIqijzlRJqsG+P2CGoFAG5q1KPqEXHgBc7SiOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548840; c=relaxed/simple;
	bh=MDg77Vnq8u03KI3oB6qoZm7xt/WwRUdAERRRJnOgjzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDQMr5Bq0tzUhswt7h+JJ/is0dnoEVOl0B0SlX9J15WODVY4Ajdp/MDeP3YhetLTm/349eoZbKPo1dWv270GQXnJWPjA0xlOythc7KtWUTUoTiEg3FQJOIXuTZnQ5WMmxQfc3+ZF/R8kf833MURNtuuZ/vN03eXdzFq3WqL/dcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JylxzSQt; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JylxzSQt"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a8af3a704fso1841464a91.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Oct 2026 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791548830; x=1792153630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xuE7TEiZUlY3stwbxLZ96YrVlSM7HQb7YiNc8MwTzXw=;
        b=JylxzSQt1MqDhR9ys2SR3uKnckSbC2uOy7avusO8oMPTqP7X20EuOvIRmZTOaUbMx2
         R9bS+r08XFnwroYfMK4WGwZUkseiZpyypdOoNv4wKJ4BRItehycB+Ev/BaxKDZ1tC51i
         3USoWOIihV/jVUOdFc5PAq8gFpkKW5axK+1g0xkizMdH4eBQCV/W15fVkZr4Z51i5miO
         cIoekpygTo6BLCENPX8pjH9Qm2HsZb2C17v0URYkLuZ6+wfs8OljT5yvhRJvFqNjg2oi
         +w2ypfUD3QzR0l9foiglqTchbwo+kseFIe4ZQw/F/Gm44baFJxIZ7f9vP58NIATNiooJ
         XA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548830; x=1792153630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xuE7TEiZUlY3stwbxLZ96YrVlSM7HQb7YiNc8MwTzXw=;
        b=Ro7akvvOP/Zte/73p+zkAIaWE8S324Jk7yy/qXnuzuOItgnOqpbAtMtC6vGoYY8ky6
         NRQlNdRDxOm7x6vOej8lOL0LseTnDEWKdUQwQDrw2agqkSnOvRCtSR2J6gyVNvNnuA/r
         WJtkG3BUCGZKAHaINPBDnfufLTJzs/Z2UFRimbUe/rawl4PL7TlWejvQanOzblmFFydy
         LHZpaOGbGkyJN6qz803USpbIw5QcKCIkhAy1QS6+0jsgAMppJHCPg34L3qox+DeYnOE7
         WVryoooZWSn6LYxjXerGtIEq46hdCH9kflsw40luzz7/2CCF1yGf+EKzRzcUigb/XsWo
         0ANQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxzidNeGZcLcNdiF2vUOxDku1wbXBXZ6l/9Dn9MKBvX8AIZ4CH91V+5IP3bClGLRPkFVrmEWO3XHwKxUSIfQDRr9YT@vger.kernel.org
X-Gm-Message-State: AFq9FYJaoF1+gxo8dy1Zp+09F/sHzqAYzGo1QY54CA2kWHMLbdC0mKSC
	F8hGl0ZgAd/U7+9M93CMyzIu+2sNU3VbLVp1s7ru6EzJMp7eZLBlryK+
X-Gm-Gg: AYBFou1smAGKnnWAVTHh6c1EB6vqPvJ/f0lyUmgx8PWqUZ1/cFTe6wgMBFyw51hzZuM
	UWKSQoqklo/kW6tOw3mzz8dA9EikdpA16sQyqnUyjVppt9FT+hYD8KRe2FRM0O5kZCouKgkFa16
	+/OQERD8gD6LWzJNiTfEFcWHLi9oUeNJoqRptbg9ZVPr3jJTdwIUunOy7LFIbj1dX1+YKPbDZvl
	T6jvf8a6p9bBWIAQ3ifk6EiDQ03V7rreHuohbV0JuZzT38s3WOiBQ7qxkJG3T80wbXdd6ygqaUQ
	AX1rodjpqUk6Ac/IZ/OaadvIV3w2yYYjChPpCkULBQ11jmmLg5k60zCGRMrr6YCWO1F98Sm9g/3
	4qBewm6lm52AlOC9jN4UCjEwVj699j/dDIp5IEHMrUe/Fg8PHK2Iw6CplGjwZ0C7ju3YgbJS6zJ
	74p+e/qAByra+h1XPXfoVC307S3b1aGylhs4zlTmL6/XP+Eiw+952HHAaOffMgRGFkgy2c6jxE0
	kxPbd1wmd1enqkR/JOTsty2Aww=
X-Received: by 2002:a17:90b:2e08:b0:3a7:ecab:c4c7 with SMTP id 98e67ed59e1d1-3ab3a748058mr1804986a91.34.1791548829483;
        Fri, 09 Oct 2026 05:27:09 -0700 (PDT)
Received: from chitransh.. ([2401:4900:9397:bb62:5cb7:971b:ead7:8dc5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f4737esm3426729a91.7.2026.10.09.05.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:27:09 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v3 1/2] platform/x86: dell-uart-backlight: extract dell_uart_bl_init() from probe
Date: Fri,  9 Oct 2026 17:56:01 +0530
Message-ID: <20261009122602.56624-2-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009122602.56624-1-chitranshmandhaniya@gmail.com>
References: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
 <20261009122602.56624-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Move the UART backlight initialization sequence (get_version,
set_bl_power, get_brightness and backlight device registration) out of
dell_uart_bl_serdev_probe() into a new dell_uart_bl_init() helper.

No functional change. This is a preparatory refactor so that a
follow-up patch can inspect the return value of dell_uart_bl_init()
and take an alternative code path on failure.

Tested on OptiPlex AIO 7410 35W (01KP8D) and OptiPlex AIO 7420 35W
(0914RT) -- driver behaviour unchanged, backlight probes identically.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/dell/dell-uart-backlight.c   | 59 ++++++++++---------
 1 file changed, 32 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..e3b7f1beda5b 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -267,40 +267,19 @@ static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
 	.write_wakeup = serdev_device_write_wakeup,
 };
 
-static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
+static int dell_uart_bl_init(struct device *dev, struct dell_uart_backlight *dell_bl)
 {
 	u8 get_version[GET_CMD_LEN], resp[MAX_RESP_LEN];
 	struct backlight_properties props = {};
-	struct dell_uart_backlight *dell_bl;
-	struct device *dev = &serdev->dev;
 	int ret;
 
-	dell_bl = devm_kzalloc(dev, sizeof(*dell_bl), GFP_KERNEL);
-	if (!dell_bl)
-		return -ENOMEM;
-
-	mutex_init(&dell_bl->mutex);
-	init_waitqueue_head(&dell_bl->wait_queue);
-	dell_bl->dev = dev;
-
-	serdev_device_set_drvdata(serdev, dell_bl);
-	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
-
-	ret = devm_serdev_device_open(dev, serdev);
-	if (ret)
-		return dev_err_probe(dev, ret, "opening UART device\n");
-
-	/* 9600 bps, no flow control, these are the default but set them to be sure */
-	serdev_device_set_baudrate(serdev, 9600);
-	serdev_device_set_flow_control(serdev, false);
-
 	get_version[0] = DELL_SOF(GET_CMD_LEN);
 	get_version[1] = CMD_GET_VERSION;
 	get_version[2] = dell_uart_checksum(get_version, 2);
 
 	ret = dell_uart_bl_command(dell_bl, get_version, GET_CMD_LEN, resp, MAX_RESP_LEN);
 	if (ret)
-		return dev_err_probe(dev, ret, "getting firmware version\n");
+		return ret;
 
 	dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + RESP_DATA);
 
@@ -318,13 +297,39 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	props.max_brightness = DELL_BL_MAX_BRIGHTNESS;
 	props.power = dell_bl->power;
 
-	dell_bl->bl = devm_backlight_device_register(dev, "dell_uart_backlight",
-						     dev, dell_bl,
-						     &dell_uart_backlight_ops,
-						     &props);
+	dell_bl->bl = devm_backlight_device_register(dev, "dell_uart_backlight", dev, dell_bl,
+						     &dell_uart_backlight_ops, &props);
 	return PTR_ERR_OR_ZERO(dell_bl->bl);
 }
 
+static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
+{
+	struct dell_uart_backlight *dell_bl;
+	struct device *dev = &serdev->dev;
+	int ret;
+
+	dell_bl = devm_kzalloc(dev, sizeof(*dell_bl), GFP_KERNEL);
+	if (!dell_bl)
+		return -ENOMEM;
+
+	mutex_init(&dell_bl->mutex);
+	init_waitqueue_head(&dell_bl->wait_queue);
+	dell_bl->dev = dev;
+
+	serdev_device_set_drvdata(serdev, dell_bl);
+	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
+
+	ret = devm_serdev_device_open(dev, serdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "opening UART device\n");
+
+	/* 9600 bps, no flow control, these are the default but set them to be sure */
+	serdev_device_set_baudrate(serdev, 9600);
+	serdev_device_set_flow_control(serdev, false);
+
+	return dell_uart_bl_init(dev, dell_bl);
+}
+
 static struct serdev_device_driver dell_uart_bl_serdev_driver = {
 	.probe = dell_uart_bl_serdev_probe,
 	.driver = {
-- 
2.43.0

