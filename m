Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AE14252AB
	for <platform-driver-x86@vger.kernel.org>; Sun,  4 Oct 2026 11:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791111847; cv=none; b=DxqwjxDI+KcVGsf4Fr7XrQ1jhrTN1fhm+G2VxuTeKijX1qDh1pDJPA4losQxjjK0upSWytqwxIMSRl2UHiz/kz9Ru3oHlXhIHKXu/pt4RAAx2e+IOFGvLE7rppVwhnLPuTHQDVGMoXbTPHDdwwMtsVCe9r/dEnXOQ404Zqmel+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791111847; c=relaxed/simple;
	bh=j+Vpw6E6tAEgRUW1m5cAGXI5KzWwrgL+mCu2hj6Mnz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NbiPyx9Y8tSFqI/sdRsI5A3PCeweVctdLiW8x1VUva/3SU8fQDYfKrMo1BXLn9jYZbnHKc4C8uDjEVJbCvnJpMW/KmeAowR5lGZVXG0WXhhjIEMZm+Y0BAjwvd/o7pw+FZg9A75z4ShDmKGjiluhUdDGvt9Gxrs85jgkqiV0PKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0uLQpgt; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0uLQpgt"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so932913eec.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 04 Oct 2026 04:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791111845; x=1791716645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XSFrkQBUK6qKBawjNwaZ4kqaH3MbOx2NwvrnRbSvr3U=;
        b=f0uLQpgtuFXvZmvRYz1H+VRIiuwPt/Eygx+S4E3l2P08Uk5cYFFrBC3oCgQcSp9yhz
         1T26JSGRRvu4nXJh2exUQiyfdUkASHfltYmMehia7r/uu+lXXF41mhH4pYAlxj18mD+H
         M1fZibLyfh3TMPxzxEiTwwbNqzW1fwVsV46e3egyAmGzdhGA1pZP9i0to1ZQMv9UJCDU
         4gb8Wu8FDsfjPIIMfqCRZMSrox4k2N5CLl+OYgd65BCj4vCA98tsq+kA9PhTOKhXPvqY
         BEGO2eLM9wciKAc5esstZ6j0VKnrKqa97o1TqFyP+JBlsiujSoYO6LJVjb6lUjRNLulH
         ug4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791111845; x=1791716645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XSFrkQBUK6qKBawjNwaZ4kqaH3MbOx2NwvrnRbSvr3U=;
        b=wlNN352Xf12ETc2d8O25xnJOgNFU1QbqUsBHgEMXsTCWwterkVOQBU8wsT9sORPSyM
         MkvKbX4M1NldxNdclfokw4VaFCmjz5hhewdOd+bMaI4WvgUuRTgd8NZxFLt3tSOpi28z
         gTs8hXQbnjTTn/WEMe+LI9DuSi2EsajQr1mW5s6dNNoyChYvrdBuyX2xWvB6YWepP2t+
         DVK1m2sIU/a5hcJ7nZ2O+RkE3bxWZqlyrnS+FIj9xXrGz/kzpSthoB5zGbUniuLCLuvG
         PhNNowm2a8JXS9gFT5i4x7hooJwzp3cYMpaN9ldIQGtW07vqAHy2smyekgzom5gUbTPD
         6+hA==
X-Forwarded-Encrypted: i=1; AKwUvBzVLuRx1JRlC7l+oGsp6u2t4lq1UNqiWG0WJXU4Ac+eUXXLeBjxJBYlv1elBmr6S4/Wba0sqqYPUA8ondfPV18Ucmr2@vger.kernel.org
X-Gm-Message-State: AFq9FYKfdqHqe2L5JE2Uq9ySNl+kbzWBAof78LmbnMziNSNg9cQOW+TL
	qt0+Ifx1PGyxCX55uSYEECiND310oxU0v78LFrV3/WJdyljCcUNWHtOY
X-Gm-Gg: AYBFou1MTYJCKs1OXHgZA1deQlpGwk8asIr0pYNrgo06a6IisPH2lLNpSR/exnpQq53
	tSElcQd5geei65qXrPcEqkT9RXhq8DjRWgXZ4vkxOgZLdENRA6m3zLUuIdAIwrqLjE762Syf2iw
	Uw09/rNE/5NNjFfIOQhPXyq9qKyrwR+0/whdBGzJtMnXSbWo/6jYRGhTRgqjSkWctVXGB4aneGJ
	qUUPjMvgiUeugUt5U/W4H9OFKO1QjlWkPhAzTJD+d8CLkIG7NJNuehl1PNs18NQqxaJ4N7jr/4V
	E3sWd/Ep6XopBV9wWd9RAEJTR4m+H6+yLgeodz7OSKiM1gILE1o6mNnSzrPOlGGtSyvLSqp6zTp
	KoKhvDwrQG9pBQ2+nrhtFBjqS+lU3Nrqkq9pbDTlM60h4ABtUy/hBqAGu89G7Hu3Qqj+Ez8eqwp
	1BNKR7deYvME2Dl28N7S44q695JE6BNA8d14+3S/M+HvxvXCVUX3Dp+pys0tyo9kcM6yObcEz08
	j8ZFmvqqCLNw7UEe9DzFKqSdJQV9fzTUV1fHQ==
X-Received: by 2002:a05:693c:8087:b0:351:dbc:b663 with SMTP id 5a478bee46e88-3510dbcccfbmr6861823eec.31.1791111844387;
        Sun, 04 Oct 2026 04:04:04 -0700 (PDT)
Received: from chitransh.. ([2401:4900:c94b:d76d:7790:8565:8a42:7f99])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127021d1esm4582590eec.4.2026.10.04.04.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 04:04:03 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
Subject: [PATCH] platform/x86: dell-uart-backlight: recover from stray EC response byte
Date: Sun,  4 Oct 2026 16:33:33 +0530
Message-ID: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

On some Dell AIO machines the EC occasionally inserts a spurious byte
after the cmd-echo in UART backlight response frames. A get-brightness
reply "04 0c 0a e5" arrives as "04 0c 0d 0a e5". The length field still
reflects the original frame size, so the parser consumes the stray byte
as payload and mistakes the real payload for the checksum, returning
-EIO.

Handle this in dell_uart_bl_receive(): on the first checksum failure for
a frame longer than the minimum size, drop the byte at the first payload
offset, shift the rest down by one, read one more byte as the new
checksum, and re-validate.  Limit this single-byte resync to once per
command via a resync_used flag cleared at the start of each transaction.
A second mismatch is still a hard error.

Well-formed replies pass on the first check and never enter the recovery
path.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/dell/dell-uart-backlight.c   | 92 +++++++++++++------
 1 file changed, 62 insertions(+), 30 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..068b91c21bf4 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -51,7 +51,7 @@
 #define MAX_RESP_LEN			80
 
 struct dell_uart_backlight {
-	struct mutex mutex;
+	struct mutex mutex; /* Protects command + response state below */
 	wait_queue_head_t wait_queue;
 	struct device *dev;
 	struct backlight_device *bl;
@@ -60,6 +60,7 @@ struct dell_uart_backlight {
 	u8 resp_len;
 	u8 resp_max_len;
 	u8 pending_cmd;
+	bool resync_used;
 	int status;
 	int power;
 };
@@ -91,6 +92,7 @@ static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
 	dell_bl->resp_len = -1; /* Invalid / unset */
 	dell_bl->resp_max_len = resp_max_len;
 	dell_bl->pending_cmd = cmd[1];
+	dell_bl->resync_used = false;
 
 	/* The TTY buffer should be big enough to take the entire cmd in one go */
 	ret = serdev_device_write_buf(to_serdev_device(dell_bl->dev), cmd, cmd_len);
@@ -208,8 +210,10 @@ static const struct backlight_ops dell_uart_backlight_ops = {
 static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data, size_t len)
 {
 	struct dell_uart_backlight *dell_bl = serdev_device_get_drvdata(serdev);
+	const int max_passes = 2;
 	size_t i;
 	u8 csum;
+	int pass;
 
 	dev_dbg(dell_bl->dev, "Recv: %*ph\n", (int)len, data);
 
@@ -220,42 +224,70 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 	}
 
 	i = 0;
-	while (i < len && dell_bl->resp_idx != dell_bl->resp_len) {
-		dell_bl->resp[dell_bl->resp_idx] = data[i++];
-
-		switch (dell_bl->resp_idx) {
-		case RESP_LEN: /* Length byte */
-			dell_bl->resp_len = dell_bl->resp[RESP_LEN];
-			if (dell_bl->resp_len < MIN_RESP_LEN ||
-			    dell_bl->resp_len > dell_bl->resp_max_len) {
-				dev_err(dell_bl->dev, "Response length %d out if range %d - %d\n",
-					dell_bl->resp_len, MIN_RESP_LEN, dell_bl->resp_max_len);
-				dell_bl->status = -EIO;
-				goto wakeup;
+	for (pass = 0; pass < max_passes; pass++) {
+		while (i < len && dell_bl->resp_idx != dell_bl->resp_len) {
+			dell_bl->resp[dell_bl->resp_idx] = data[i++];
+
+			switch (dell_bl->resp_idx) {
+			case RESP_LEN: /* Length byte */
+				dell_bl->resp_len = dell_bl->resp[RESP_LEN];
+				if (dell_bl->resp_len < MIN_RESP_LEN ||
+				    dell_bl->resp_len > dell_bl->resp_max_len) {
+					dev_err(dell_bl->dev,
+						"Response length %d out if range %d - %d\n",
+						dell_bl->resp_len, MIN_RESP_LEN,
+						dell_bl->resp_max_len);
+					dell_bl->status = -EIO;
+					goto wakeup;
+				}
+				break;
+			case RESP_CMD: /* CMD byte */
+				if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
+					dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
+						dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
+					dell_bl->status = -EIO;
+					goto wakeup;
+				}
+				break;
 			}
-			break;
-		case RESP_CMD: /* CMD byte */
-			if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
-				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
-					dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
-				dell_bl->status = -EIO;
-				goto wakeup;
-			}
-			break;
+			dell_bl->resp_idx++;
 		}
-		dell_bl->resp_idx++;
-	}
 
-	if (dell_bl->resp_idx != dell_bl->resp_len)
-		return len; /* Response not complete yet */
+		if (dell_bl->resp_idx != dell_bl->resp_len)
+			return i; /* Response not complete yet, wait for more data */
+
+		csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
+		if (dell_bl->resp[dell_bl->resp_len - 1] == csum) {
+			dell_bl->status = 0; /* Success */
+			dev_dbg(dell_bl->dev,
+				"Response OK for cmd 0x%02x, len %d: %*ph\n",
+				dell_bl->pending_cmd, dell_bl->resp_len,
+				dell_bl->resp_len, dell_bl->resp);
+			goto wakeup;
+		}
+
+		/*
+		 * Some EC firmware inserts a stray byte right after the cmd-echo
+		 * byte. Try once to drop it and re-fetch the checksum byte from the wire.
+		 */
+		if (!dell_bl->resync_used && dell_bl->resp_len > MIN_RESP_LEN) {
+			dell_bl->resync_used = true;
+
+			dev_warn(dell_bl->dev,
+				 "Checksum mismatch got 0x%02x expected 0x%02x, dropping stray byte 0x%02x at offset %d\n",
+				 dell_bl->resp[dell_bl->resp_len - 1], csum,
+				 dell_bl->resp[RESP_DATA], RESP_DATA);
+
+			memmove(&dell_bl->resp[RESP_DATA], &dell_bl->resp[RESP_DATA + 1],
+				dell_bl->resp_len - RESP_DATA - 1);
+			dell_bl->resp_idx = dell_bl->resp_len - 1;
+			continue; /* re-fetch the last (checksum) byte and re-validate */
+		}
 
-	csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
-	if (dell_bl->resp[dell_bl->resp_len - 1] == csum) {
-		dell_bl->status = 0; /* Success */
-	} else {
 		dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x\n",
 			dell_bl->resp[dell_bl->resp_len - 1], csum);
 		dell_bl->status = -EIO;
+		goto wakeup;
 	}
 wakeup:
 	wake_up(&dell_bl->wait_queue);
-- 
2.43.0

