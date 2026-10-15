Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB15414428
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050268; cv=none; b=WA2bFndu+EO3yeLRRLPvIxfLLV/MBXYiABWLEgGf9eeLQMBqX3uKT8K0HyIzQrLITkYHbZIQIPdxTADMuNB8PvReX2iOzzUeyPEkgczN2z2xefeAFn5Mmf0crx34A8YDAD58U7b0dHv5xt4uMHMVpb+mtXnNVfPvObc9y6Ofs3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050268; c=relaxed/simple;
	bh=7y+yRF81iZ5p6JHx/r1efbfLA9EYlv8GHW0hYZ1HWxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDjZxXK+xhxAGUyqBk8tG/wiE9MgrQdfYpl5sNPvZsUuw2USoEee3aVPqsX82z7rWG3POITfae0fH53tnsyfCN6Y/9pog9z+W060Xti4P4Ktmze+pDGSas4waeUYKU7mh6z5xeRmFZWFkOMRheqKfG8q9+tz+6q5OlHp6mT0B9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btJke9aI; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btJke9aI"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso687084a91.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 00:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050266; x=1792655066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8GsylX4a4lqmTRbuX4pJqRcRdmdE+d0tyzRFMMnoIk=;
        b=btJke9aIqxkQtjWT7vRYpxNwGweO8aEBks1u2n5nU8nX2AzvP9zw5ULWV6vTPfA93N
         nvn/IF3fl/omzAq2qvXFR4ixN79uY+ccjAikjx3qd1FqjU6JGZUPV+ElrNz/nuLQHPmk
         JUx2XQntvvQTMxBFIs4KbiDvFh9ztKlImvRTpeRt+urYKJjxsRB/F5WDVcQjH8hk8lN3
         memFz2HF3/MmeKlkZ3AcG/S2e+KRw94LITXbFYDfhtptrYsbSaH28WtekPXbr9a/54zl
         dtLcZ+Ri6LypLFA/6LXxAVAAeUE0WOaJzhVVn7egkYIcjqpa89EwEieJZzKX9sbz7MNX
         zKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050266; x=1792655066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8GsylX4a4lqmTRbuX4pJqRcRdmdE+d0tyzRFMMnoIk=;
        b=OtRYBkQehCP+QGcpaR3veo+nHckv6y05Zm0IHw8pcB/UG3BnNKEOt1vSoL0WcnW0k8
         Iw2MhNAFcJE63WQoWYuIe6OlBbvGJDAM1LsPTY0L4bHEFMdx6i6Pn6EUTqfOFDUp3qx3
         XOVtaYuBxqnsWZAWt4DyUKZGgdCvu21vhvo9PpoDThpmP45LRjzDAbCDv+eO7PW8XHcE
         amXk4y84XMY9uh9uAnhgn5bP80mfLWw2tidksdH4nkkF1plzlXBx8ZweZabcNnynuiKC
         sa6au2IxZ6VVjaiZDhGf70I/kRqdSiik2YEnqiIggbJ1QKrMJ2L9Lm2PwCA0L7iwcBdK
         W2Vw==
X-Gm-Message-State: AFq9FYLPNDJ1ja2t4p1WAIfLPg6A4NCDNV2N1DShGJHle7ywpKkeGwwI
	Id5HEBlL7+XyETdLuZZkw60AMMOcTJTviGufAVlFn73Hs+fRqg++wSzUixEdZ74O
X-Gm-Gg: AYBFou0cT8JjMH7gLJ6fswmY/89b79EieLkoFQYws3BNm1QueZeaLoWKuFnvtRV1t8G
	s8gPo1yTNfWepZ63DJNFcQSn3u4Q9H90Jm6jmIWI0xVLDRF0Jy2jk9awqHo7VEDdEYDjcRY7n7L
	Y+cC9b6L7Y5Hco7equTQz5l1S8lPfRl6Woh4N9WT4UhEOmdw7cgBZA6Tsls709mDiEjJpyVSOnU
	mnOrOl0eqgpa7WMKBL60AgS2wkc+9vYNke5rjqejc2gFsLnOtzafWvwTR4KFXNxn9SuSQI78eIo
	Mrzdlb+kE4hwBAt7KwXxKojMs7njUD+Fo6cQlxiGZSXsikpyAebajVI45icj9hwIbAkCBJQJMns
	dioveDPmkbfSHb71+7X3yiHG7DISSe4yrGLKYY6rYeJ807aYo6BSkyi8MRWt9qjunYa3FdKLbpN
	Ou9LgC5e7P+bPy9D7Hi3VvHnhEqwlWk6zOtFv5U2XHCaV2pfI4yHCYB6/tx+yykKUXYMUEUvh87
	SlaI1mkSiYSxrqCEmAWJv8bGBv60sbSgl2E
X-Received: by 2002:a17:90b:2d0b:b0:3a7:e11c:4e6e with SMTP id 98e67ed59e1d1-3ab3a97a71dmr15876690a91.59.1792050265773;
        Thu, 15 Oct 2026 00:44:25 -0700 (PDT)
Received: from chitransh.. ([106.202.101.59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm3007423a91.8.2026.10.15.00.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:44:25 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v2 2/2] platform/x86: dell-uart-backlight: recover from stray EC response byte
Date: Thu, 15 Oct 2026 13:13:39 +0530
Message-ID: <20261015074339.27388-3-chitranshmandhaniya@gmail.com>
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

On some Dell AIO machines the EC occasionally inserts a spurious byte
after the cmd-echo in UART backlight response frames.  A get-brightness
reply "04 0c 0a e5" arrives as "04 0c 0d 0a e5". The length field still
reflects the original frame size, so the parser consumes the stray byte
as payload and mistakes the real payload for the checksum, returning
-EIO.

On the first checksum failure for a frame longer than the minimum size,
drop the byte at the first payload offset, shift the remaining data down
by one, and call dell_uart_bl_receive_data() again to re-fetch the
checksum byte from the wire and re-validate.

Limit this single-byte resync to once per command via a resync_used flag
cleared at the start of each transaction. A second mismatch is still a
hard error.  Well-formed replies pass on the first check and never enter
the recovery path.

Tested on Dell OptiPlex AIO 7410 65W (0TKWC4) where the EC inserts a
stray byte on every get-brightness response -- resync fixes it
transparently.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/dell/dell-uart-backlight.c   | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index b61499d7b3f8..085dcc055554 100644
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
@@ -270,8 +272,27 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 	if (ret < 0)
 		return len; /* Response not complete yet */
 
+	/* Stray byte after cmd-echo? Drop it, shift data down, re-fetch checksum. */
+	if (dell_bl->status == -EIO &&
+	    !dell_bl->resync_used && dell_bl->resp_len > MIN_RESP_LEN) {
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
+		/* Re-fetch checksum byte from remaining data */
+		ret = dell_uart_bl_receive_data(dell_bl, data + ret, len - ret);
+		if (ret < 0)
+			return len; /* Need more data for checksum byte */
+	}
+
 	wake_up(&dell_bl->wait_queue);
-	return ret;
+	return len;
 }
 
 static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
-- 
2.43.0

