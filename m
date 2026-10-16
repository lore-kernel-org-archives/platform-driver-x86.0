Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A7F47F77E
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143235; cv=none; b=Ebr11mP7a+dKNLHnpikMJiP8kDNRuUJNJTaDIuvitsgP0ZTBBnWEIk2Oh5s8cjMyE5riQP7GF5XMU31A+utejEqx7Y39lRaP9KJMBdX6oClvxi+uNxydtlJ6ZCH89M4N52dqR4EXbVEMHnImGeEwq3Kf5Tl3QwFCyQ3iCfRpKFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143235; c=relaxed/simple;
	bh=F3oVj1GVBPZtR8IMhOBhQOj2CnusPvyjtCmEqfVHX48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N5VX8C/b40OrIRRbPSgsYe6JAr0spm7fSnJxkPJcjCL5upcNZV67lQYnclSp6V8YdeNBmwagc/NoOOf7QW69uxcVUOGQjIqvmeYecvGuPbDo6EI+OhNOgV/D7w/ru6JTfY+wHWbgq1BYLB3rm9J9WapDAc/8R2bu06ARg4UEOj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AClN4A21; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AClN4A21"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-141395927feso11984536c88.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 02:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143232; x=1792748032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPmyq1VRX5j+1ElGFQRN4luLHP0XL08EkLecnHX3lu0=;
        b=AClN4A21Pgs2rw37XhYio5hybhRaclsoJSLPM3ip0hKRpAgGqyRA1PHIxDjxt2A2zc
         VK/jUEaw6ObR9jp8xn6yDgwQWv5jpoSTn06yr7/uF6+LVrotcJUbzdCYI4T+pBLtLGfM
         aW1vHp6LFQx18Y9tcwrSZOUh16ApPvLIHKuo2SVTMkrpiWXsYN9MyApXwrBnvoyD+9ma
         UoI0S/qa2d0EWQyUgcLfpYWGdDTavPRDlH/nDPshj/N1CTWbIYBpGsJL9dkCMdPcB4ca
         GFfqHo+Ir43GXPwMz3n5Ockq7mwGseJSNNIVhkFx+OxHzzYlMqR6hlPbhWAZ6jgh4LYN
         9xRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143232; x=1792748032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPmyq1VRX5j+1ElGFQRN4luLHP0XL08EkLecnHX3lu0=;
        b=tr1Lqp33hYG6G7IS9RXn+ih2+WRCaiojHUB4B9RmqLZFJgokBjqkHQO1ydAnvH9KWm
         jd/s4JSfIhhrxbTMmFLydr7gV3KgKJ2sW1hFpKlfuepwPG4ZbL8sDF57RFFkU+6IpiHN
         7aGyQc7ABDQ7zGyA82sYkmStg+4Z5BlZvfk7XXpxBYPd3qbpirTJiXa/5lFDiPNu54Gd
         8xKJn4y/5vfJ4CrZM6FGKThrSqQMeqIECLfllYKqM8kTpPC1ezuUAPLrcSrdR/i+SzWV
         SrPzvfvSDk/QVGMQIqkoxviaLPsZTS+VhiVAewnekwMSFc8dQ/SLJprV55sCFdEKwNdo
         ayDg==
X-Gm-Message-State: AFq9FYKMlnywEZB/ugYaCWg0+ITIowl8VqExLWENrlOVoFSn0R4TR99q
	l+TT3pCEZ6W1CUbbn3vsriV6J7zcg177JunjZCjCbspTbVA2DuG6w2aZ
X-Gm-Gg: AYBFou2EIjhi32EOo1pO1TQc+yH+xH4yCO2dpZOSqNv4sKO8+b/dIde7RhQ9ktKQHB6
	L+bZOPGcuJ96nueJYvGP+OuydQ/ThfCAWjO20Pk5tl1dwlBxCFAX+r7Nk+UwL4CP9aVyJsaHmu/
	UgkjSGrbwpcMQTo6WSArvr2GCj8sceeQR8IjE/rZbP7aei3JxzDZ+gVVa2kkNkikzTOqB2NoCX0
	Z6HTAzjdKOcleE4Z8w7bFOoE+UY/aULB3tif6tSyXJbjgXkZPHMY2INiNZ5SsFvhOThY2jjzfFi
	ZAOuiTwPxslWhWPrBM+X1Hs0Do204yucHp0mdZoOGJAAMLbCTm3Omei6ScKsbGrLkCHf5aAsVKQ
	QSkHCotOX1mdPmkeXp2ruUuvqhiPu1qsS39G9dVvzLESZLTmOqGrfXpiSDycvMKLRutnMHiOC4D
	B9TWifj3+NxEXkRMBxRhJ9I1X+8fBWithnhSat15WDv4x6uw8FqY5SZsFOUj5DG1dSKtwPeonCX
	WQCFlC9hyziWRiZppym9Ja0uV4jqw==
X-Received: by 2002:a05:7301:78c9:b0:34e:e7f4:cc78 with SMTP id 5a478bee46e88-3537de1cfd3mr28058784eec.5.1792143231573;
        Fri, 16 Oct 2026 02:33:51 -0700 (PDT)
Received: from chitransh.. ([2401:4900:9390:ec4c:7580:f3c1:62f7:b0b6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm8697922eec.28.2026.10.16.02.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:33:50 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v3 2/2] platform/x86: dell-uart-backlight: recover from stray
Date: Fri, 16 Oct 2026 15:03:02 +0530
Message-ID: <20261016093302.55528-3-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016093302.55528-1-chitranshmandhaniya@gmail.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
 <20261016093302.55528-1-chitranshmandhaniya@gmail.com>
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

On the first checksum failure for a fully received frame, drop the byte
at the first payload offset, shift the remaining data down by one, and
call dell_uart_bl_receive_data() again to re-fetch the checksum byte
from the wire. Track total consumed bytes so the exact count is
returned to serdev.

The resync is guarded by resp_idx == resp_len to ensure a complete frame
was received, preventing memmove on a truncated or out-of-range length
field.

Limit this single-byte resync to once per command via a resync_used flag
cleared at the start of each transaction.  A second mismatch is still a
hard error. Well-formed replies never enter the recovery path.

While at it, switch mutex_init() to devm_mutex_init() so the mutex is
automatically destroyed via devres, fixing a missing mutex_destroy()
on the teardown path.

Tested on Dell OptiPlex AIO 7410 65W (0TKWC4) where the EC inserts a
stray byte on every get-brightness response -- resync fixes it
transparently.

Suggested-by: ilpo.jarvinen@linux.intel.com
Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/dell/dell-uart-backlight.c   | 35 ++++++++++++++++---
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index af9c5f9a566f..b0df479a4658 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
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
@@ -256,7 +258,7 @@ static size_t dell_uart_bl_receive_data(struct dell_uart_backlight *dell_bl,
 static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data, size_t len)
 {
 	struct dell_uart_backlight *dell_bl = serdev_device_get_drvdata(serdev);
-	size_t ret;
+	size_t consumed;
 
 	dev_dbg(dell_bl->dev, "Recv: %*ph\n", (int)len, data);
 
@@ -266,12 +268,35 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 		return len;
 	}
 
-	ret = dell_uart_bl_receive_data(dell_bl, data, len);
+	consumed = dell_uart_bl_receive_data(dell_bl, data, len);
 	if (dell_bl->status == -EBUSY)
 		return len; /* Response not complete yet */
 
+	/*
+	 * Stray byte after cmd-echo? Drop it, shift data down, re-fetch
+	 * checksum. Only attempt when a full frame was received (resp_idx ==
+	 * resp_len) to avoid acting on a truncated length field.
+	 */
+	if (dell_bl->status == -EIO && !dell_bl->resync_used &&
+	    dell_bl->resp_idx == dell_bl->resp_len &&
+	    dell_bl->resp_len > MIN_RESP_LEN) {
+		dell_bl->resync_used = true;
+		dell_bl->status = -EBUSY;
+
+		dev_dbg(dell_bl->dev, "Resync: dropping stray byte 0x%02x at offset %d\n",
+			dell_bl->resp[RESP_DATA], RESP_DATA);
+
+		memmove(&dell_bl->resp[RESP_DATA], &dell_bl->resp[RESP_DATA + 1],
+			dell_bl->resp_len - RESP_DATA - 1);
+		dell_bl->resp_idx = dell_bl->resp_len - 1;
+
+		consumed += dell_uart_bl_receive_data(dell_bl, data + consumed, len - consumed);
+		if (dell_bl->status == -EBUSY)
+			return len; /* Need more data for checksum byte */
+	}
+
 	wake_up(&dell_bl->wait_queue);
-	return ret;
+	return consumed;
 }
 
 static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
@@ -291,7 +316,9 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	if (!dell_bl)
 		return -ENOMEM;
 
-	mutex_init(&dell_bl->mutex);
+	ret = devm_mutex_init(dev, &dell_bl->mutex);
+	if (ret)
+		return ret;
 	init_waitqueue_head(&dell_bl->wait_queue);
 	dell_bl->dev = dev;
 
-- 
2.43.0

