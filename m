Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E6448C3FB
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 07:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050267; cv=none; b=C4TBSaqQkuIFlhJ7UVZ40MdDScNanwYr6hh++IJdPZ/yBw+NaEK1iT6OUPnGln1aiyE1qWC7iTRa3akBSAraRZe5XgwQ8AVMOzv5HdJjhWlo4Jc8OKcsb3pClH5jjJbBunT3rPJF2pO2GDxfnUKeTAOwwzsz1O96SoLoN+n2jJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050267; c=relaxed/simple;
	bh=yhUlIp18d7878UrLimCqmEvF6mmb+xteJ7eUoweywJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZVdhr9BSr0leoALOuJWUS8CFzBrkilLS0xjqrA9HhB3wb4rKz4qsUBS7gXkJ+FG4DnNDt1XqedFUd+0ljlaHTc2IUy/rRT3cmaFA3kf8m24epqv8TsqrGh17D6RIz3OnkWyNybUcWk1Gzfg1Sx75rn54Wrd+ufdhN6ybbB95CBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b66UuWKh; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b66UuWKh"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so828513a91.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050260; x=1792655060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDEevMacbooi2fkIJdKH3aMGF4FSdtM40ZuCloog92o=;
        b=b66UuWKhUf+eh3oScpVJ657be2qW7NhECFzuuiCRSReM4v4CLtyZzzGJhlE9TM8I85
         SjvXqVobK82jC6q71xVfo/mGIVyIEfXDX4Ej9Ib/oLQ7rA73dDK24bqSNnqU0XUiJR4f
         d1bOkSPHIqao34T98UWRZl/aSzZD8IjbgMRii/2Bzm2f9eQfIFu72pNfdoA6FgIdXU/G
         mogDAIvBuA2n3NMIwtqwiV56m6fG8qT/Ya8DywWDAdXSBLqSw2zK7XnWJ9BrOc/4NM6u
         +t9+0+G+DU8EWl4a4ZGVaVe83kTjFes1n9feKskaVZPeW/cd3gmfPLxMO/0i6Z7c+GY+
         tDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050260; x=1792655060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDEevMacbooi2fkIJdKH3aMGF4FSdtM40ZuCloog92o=;
        b=uORgC1TcpkxnkyUuq1NioNVYqmIirJx8zsKKhU3ygUfPCHcdZ8XfYRDOCohLUUWAQR
         3Vn6PUJBzWixbl60/dg311GlHLD1kIz5Ozemw1t0fv5S0gTe+Wn5tYqFcJuAXOCExOVK
         /wWrpfmMFBibf4JSxC5cAEdr73DtbSoektc+I+eZiiE4pLc+ax9cs05VcPMtD5w4OyVm
         gLWuzcP3D3RI7ac8GhEjXC9ClNk03JUxnPy87+OjCHqigfZe+iFr5Q9RmXwMZE2WXFyU
         UqATrFDcv4Qcrl787k/AQzOl6K3J0jE7V5WfenbC0zDWwlIDv5foftjMpy5P52NoAomG
         W5fw==
X-Gm-Message-State: AFq9FYK7vJ5O7gYT5+lYpXu7eH8WXhUYCnsw2YLNP/OuEgAtNhPd4S+w
	HthEloXFrRLIJEj6DZYYC5QgDxrAVUddcJTXStsQ1fZZU7IOUsRXktYu
X-Gm-Gg: AYBFou1p921o4BBqoZIT6h+Rn0SF1E7h2mUJ/D9AV1K5/Tth4QTC3O2GP3TR1AMGSXC
	URcEoAUsuUGD0ERy+p0R3YNJse2g6rsXRTgYSzEU9ni4/zVrmhXkS85Lta9FZe+juheaSTQXWkQ
	J9mQUFVHR3RW91Ze0esQvylBOOtzOmxFzrDUE/PtKxjApeGw+Rwd1Km29t//KXf69WdATYx/t7W
	KrfUbZhwuylMV9KVkOIWIewyNaWxam3KuJOcYqSLPQZ6HGmtj0ZFOXeqVsShmLPFPM382ruigaD
	gHVCaJ2mtZitCPCumg3MJPy4nrNJprnwHWHNo++EgmOLFyfNxi0B8rH6tK2l6I3ejCTP7hx+Syb
	6/Y/VvtoqT58Ba1q1lFnq3MWpSHos+2/90sb/hfofQVrCBVO8si0UcNfw3rtewMGmn0T/PFNIBV
	qxqW/Fk46KYvV7qq3KyCZYKrpCkb4lGBW4WWKE5umrLiMoDvAicCxvB2q4xXg319EllZ9qxmV99
	s87KvVziBkSyD6wAzhhrWw=
X-Received: by 2002:a17:90a:e7ca:b0:39e:4c80:f67b with SMTP id 98e67ed59e1d1-3ab3a7a1526mr15067914a91.26.1792050260255;
        Thu, 15 Oct 2026 00:44:20 -0700 (PDT)
Received: from chitransh.. ([106.202.101.59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm3007423a91.8.2026.10.15.00.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:44:19 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v2 1/2] platform/x86: dell-uart-backlight: extract dell_uart_bl_receive_data() helper
Date: Thu, 15 Oct 2026 13:13:38 +0530
Message-ID: <20261015074339.27388-2-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015074339.27388-1-chitranshmandhaniya@gmail.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
 <20261015074339.27388-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Move the response-byte processing and checksum validation out of
dell_uart_bl_receive() into a new dell_uart_bl_receive_data() helper.

No functional change. This is a preparatory refactor so that a
follow-up patch can call the helper again after resyncing on a stray
byte from the EC.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/dell/dell-uart-backlight.c   | 42 ++++++++++++-------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..b61499d7b3f8 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -205,20 +205,13 @@ static const struct backlight_ops dell_uart_backlight_ops = {
 	.get_brightness = dell_uart_get_brightness_op,
 };
 
-static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data, size_t len)
+/* Process received UART data; returns bytes consumed or -1 if incomplete. */
+static int dell_uart_bl_receive_data(struct dell_uart_backlight *dell_bl,
+				     const u8 *data, size_t len)
 {
-	struct dell_uart_backlight *dell_bl = serdev_device_get_drvdata(serdev);
 	size_t i;
 	u8 csum;
 
-	dev_dbg(dell_bl->dev, "Recv: %*ph\n", (int)len, data);
-
-	/* Throw away unexpected bytes / remainder of response after an error */
-	if (dell_bl->status != -EBUSY) {
-		dev_warn(dell_bl->dev, "Bytes received out of band, dropping them.\n");
-		return len;
-	}
-
 	i = 0;
 	while (i < len && dell_bl->resp_idx != dell_bl->resp_len) {
 		dell_bl->resp[dell_bl->resp_idx] = data[i++];
@@ -231,7 +224,7 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 				dev_err(dell_bl->dev, "Response length %d out if range %d - %d\n",
 					dell_bl->resp_len, MIN_RESP_LEN, dell_bl->resp_max_len);
 				dell_bl->status = -EIO;
-				goto wakeup;
+				return i;
 			}
 			break;
 		case RESP_CMD: /* CMD byte */
@@ -239,7 +232,7 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
 					dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
 				dell_bl->status = -EIO;
-				goto wakeup;
+				return i;
 			}
 			break;
 		}
@@ -247,7 +240,7 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 	}
 
 	if (dell_bl->resp_idx != dell_bl->resp_len)
-		return len; /* Response not complete yet */
+		return -1; /* Response not complete yet */
 
 	csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
 	if (dell_bl->resp[dell_bl->resp_len - 1] == csum) {
@@ -257,11 +250,30 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 			dell_bl->resp[dell_bl->resp_len - 1], csum);
 		dell_bl->status = -EIO;
 	}
-wakeup:
-	wake_up(&dell_bl->wait_queue);
 	return i;
 }
 
+static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data, size_t len)
+{
+	struct dell_uart_backlight *dell_bl = serdev_device_get_drvdata(serdev);
+	int ret;
+
+	dev_dbg(dell_bl->dev, "Recv: %*ph\n", (int)len, data);
+
+	/* Throw away unexpected bytes / remainder of response after an error */
+	if (dell_bl->status != -EBUSY) {
+		dev_warn(dell_bl->dev, "Bytes received out of band, dropping them.\n");
+		return len;
+	}
+
+	ret = dell_uart_bl_receive_data(dell_bl, data, len);
+	if (ret < 0)
+		return len; /* Response not complete yet */
+
+	wake_up(&dell_bl->wait_queue);
+	return ret;
+}
+
 static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
 	.receive_buf = dell_uart_bl_receive,
 	.write_wakeup = serdev_device_write_wakeup,
-- 
2.43.0

