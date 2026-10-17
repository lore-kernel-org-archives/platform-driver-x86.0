Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3494935AC0C
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 07:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222667; cv=none; b=MDmKkTdxGc1rrY7+rk4EVULdedwXCp4TXBNg03NHvWf9DRo2ofztYYgKfa/JVlETaQxVPhIlGvLvAadhNLAhhdqxj2VYHZQE1Qns7Z3FFTpcy57t0DJR34zLgwXc6SPhO4n+lKqGO310RDW+vY22FKrTSupriacHyqK6EjtBUAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222667; c=relaxed/simple;
	bh=8zajuJbCZYDvPYc20T6semxymaSx/rpIwAsVqTVL97w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QkAonZWYEI/Wn5mQcAacThYtBCOBSvNHRXouQwKaaGEHuDJT7hycKzGUMNHa8nyP8DOEqi8kRBPR2nGexgXWtW+Enyh2NcoVVAZmvtn/rmzj1ItLYR5oJHTkK9sIhB9Up6SvmWjABrnl2/mu0BVEa8HEvARsQrFvabKMRzvwplc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbFsPA4b; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbFsPA4b"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535a54bed9so817829eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 00:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792222665; x=1792827465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tCWKPJOQkz1GZ1kK+3Oy8l2mtoidBzuso/v99l2Kso8=;
        b=MbFsPA4bCw4uwySuoELhj/DBUeOTZGyiBAYT8oLOlU172n3tpE0+00en1WwAq1tDgl
         ELC6+oYkM+yVMXMtubq1Skfr8nYQeeFtlI8VLmBIp3J4pCNHjLk9AUX31zA4xPeA2tRL
         hwOGzGRsALxPeQouU5FQpGC/9t/McpwKkupI+0noNBBNFPbdwaqdPuLlxUGlqUh0DWlX
         56fwynYY0S1u94yqHPyxh+OeZidILcHKdXZ5rmpAyPshuwqZF2FKEZWZZ4+JjdlO/OYA
         lpkoJfvn+1evueuz0CRGwbes74/TtVSwYv+moGu86m8XuuzBS/p0gu3x6GBownBTsSnJ
         eCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792222665; x=1792827465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tCWKPJOQkz1GZ1kK+3Oy8l2mtoidBzuso/v99l2Kso8=;
        b=y5dF/AC+NpIHhl8DnRSVMnzzO+k/Y1+tO0lP4tXwPtu93aRqajrpfWmvU+P0j7mZ4f
         E9chBItaRBAAObGqRCuaGR+32MMhcKe2XCtTmFoF4QudH2Y6CAARpV1atie0TFJ2bv9Z
         eZz7VIuC+wxrtRk129Rhmf+3LwCHvQac5LIFnggtnVndp1yH0+mrpkuBW3h4lN3HhWOk
         kGIGfHbCz0X1NyC83fnZPYxG7hxcguSHuhyGCeyNGnZh3X/7P0T4gf9F5Vv+pFR8skhN
         JGlpkTPgRKSz+zr+wxXMQtXjltZs1bt1dUVWVciYFA/P53SXTC64yL2USkRLkm2C/QQf
         SZVQ==
X-Gm-Message-State: AFq9FYKi3lRXk7kCoIVjXd5XqtBpfDHxMmjgFw9Pyby1t/w0q6eU8Wdm
	o/otga/m8EpBZecM8iqAwlE2a4juQR6qTNbwfD0vORxRLiSGiESBAnM4
X-Gm-Gg: AYBFou3EJbUrejCr4uGIxpZh+MhN12u+ziHPxet5k+haJpx1yDRhzbcrXcbZ/2kCUVp
	CgdMU+nXJy8WwwiKAauqHYYSQwvauXXL+m5vaLrUxAzC37wVkHTYQ+fOjzsnemPzVkS/xwsxq2x
	y6A1Gtp+YppbnCDOc16k8C04zHl/ixyDBRJEBFa3LJCQUR5mPdmiKln+AHl5QKxTRhrJ+Yo7cem
	TU+bvajlE3W2B5L3SnST6abtTmRdzWW1dBaiIAa7VkMbM0vbetp61wXCgM0PSbmIt4bi4v1H3Yl
	9jwalV7qqVZ+xp2Kwp9t61Fo/jGEXsfEYSyf/6o0RP+iTBz/SZ6kyNCgqMWIRm2hhpT3nREPKrx
	ektac5sP/JrXQ4cQHnMRFgQInauqVpSIAqXOsz+ZjoOjm5uD3ESsDWmLh4nDXzhW133D82FduXs
	PJDVvAT6lhdSBONHQ+2lQiXR+MuHZ6INN2/aOqN/lrM4RZPLkSK6eWs+01d3lCxIqsjmBsoGbj1
	yOUqX4A54K3xHiVf6CVNT0=
X-Received: by 2002:a05:7300:d409:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-361a1f5019bmr2907187eec.23.1792222665198;
        Sat, 17 Oct 2026 00:37:45 -0700 (PDT)
Received: from chitransh.. ([106.202.98.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm15999208eec.3.2026.10.17.00.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:37:44 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v4 1/2] platform/x86: dell-uart-backlight: extract dell_uart_bl_receive_data() helper
Date: Sat, 17 Oct 2026 13:07:03 +0530
Message-ID: <20261017073704.606497-2-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017073704.606497-1-chitranshmandhaniya@gmail.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
 <20261017073704.606497-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Factor the response-byte accumulation and checksum validation out of
dell_uart_bl_receive() into a standalone dell_uart_bl_receive_data()
helper.

The helper returns the number of bytes consumed from the input buffer.
The caller inspects dell_bl->status for the outcome:

  -EBUSY  frame still incomplete
   0      frame received and checksum valid
  -EIO    checksum mismatch

This is a preparatory refactor for adding stray-byte recovery in the
next patch.

No functional change.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/dell/dell-uart-backlight.c   | 42 ++++++++++++-------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..5f01ad108338 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -205,20 +205,13 @@ static const struct backlight_ops dell_uart_backlight_ops = {
 	.get_brightness = dell_uart_get_brightness_op,
 };
 
-static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data, size_t len)
+/* Process received UART data; returns number of bytes consumed. */
+static size_t dell_uart_bl_receive_data(struct dell_uart_backlight *dell_bl,
+					const u8 *data, size_t len)
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
+		return i; /* Response not complete, status stays -EBUSY */
 
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
+	size_t ret;
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
+	if (dell_bl->status == -EBUSY)
+		return ret; /* Response not complete yet, waiting for more data */
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

