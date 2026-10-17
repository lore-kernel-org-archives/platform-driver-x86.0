Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C20413796
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 07:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222673; cv=none; b=p/i4wb6mAuWlo8EBJZ26BvgmD2maYbq+WAoa7EWJldqu45uCoMv0zw97PLHsqntRyZgLLH19nPkF1o8JagzF6ozwrVZXmZejrURZQaiR2DRt0Xk3V31et7GvtvxNPigAWRm7qLtKIybOoSibTRbL+xxdolOCzPFQXuf/YxSlRhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222673; c=relaxed/simple;
	bh=yO55rMRMNFiSDpzMtOxkRaSgAkLG/0ZSB7MlzUEj+QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=is0gMoHD/GV0Mtg64d2kgsTTZ1DyZcNvszmC3TfVPkY09O9q6gptUUsL47ICTDkUdLde3JrCt6q9Js+bFhSrr8IePl9DeYgT1S4/Y1/S7KA4SECr6vgF0y0b5gFTASZ9isXWedsAdf42eB1iaKRa6vSi6Y4qIbwyVkvirWgav50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtEqdD83; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtEqdD83"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-354ba08cfd1so882025eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 00:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792222671; x=1792827471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvBVnVtS+/h3GSsbSWJrSoEHfPtmhIxjzCCsppIZ1BI=;
        b=WtEqdD83QWpzHmQT91fGHNGuYUgzJGksQM4UP8j0GIcJ/5UQHyIbTvRlxeZpR+lbHL
         iRsYfR7FEz9RgO4GjKfBzCaU8wiqz4XC3OtjPgkkTW3uk9pajMvGQK5DcS23Gd8/oSJ+
         o6U/oP5UHHuV3UlbaBPqhRd1pAYt7/RRTx78pwXHzS4VLoF3Wj4aJd1ZlemOChlE2k1d
         Ye8ISdUqRe3x9eqraZXkvsynEkCMs8in5T9kg+1r4dwT+tSgYIokMfyYbaBLkiDozOg9
         CMPSTkwBLenE4JxSef7QxWr7l3JCjedIuGSsSu3m3gG4+e8tycQPQT1yJSkaLUzTZZIO
         gozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792222671; x=1792827471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pvBVnVtS+/h3GSsbSWJrSoEHfPtmhIxjzCCsppIZ1BI=;
        b=QTPtcLKH4ol/Zc2MklkPZnQMXTYjhL5zImo4uKfPDWet/J+LavgQW34wxzogDeQ9Xl
         yPURmwo0ogQdEVYzIhbCmQnAAIWYfU3ayPTG9I7HS8sxDKsd/N+apH4AdavivgzuhplT
         9G45VrhJgAcKAmiHykoPFK8muRNgigZzC+DRKRvog5HN8FR5TNFpqUMteAGtka8FNWD2
         pFDwiIP3ejAljU+g2meqX2pW2lGm98H6XLtEAvcK4SdCLeQA8ZLwpIq6Xly4f1bdS3sa
         OjzOx8ThUmgJOXGHFa+j+LESG/ylEsyFahp0FDBTCPZ4ffvTuwZrAmUAkdXwspYETnwJ
         RTCQ==
X-Gm-Message-State: AFq9FYKFuOlYrtd8H/oNGeNrACX9ovvFRk/38Ax8D3pubgA+uKp0hs+u
	9C19Q+OYiap9JLBAb+f8IIsCpPZmxbysaA9kvW58msZKfwzVGOaMOZ5v
X-Gm-Gg: AYBFou1yDeus5FAtTwgP/2oXTkw3QevDVE1a6REirHBh7ODVzE+j6RXjZ2AKQqDz6Cg
	Mu2hXloweysPtcInT83ytpJ1UcUxF4Yw7WnkcoJ+mvjovkk7M9Psx3WxBPhVhnBdoWDnXaVhIf8
	ocoTXuRj7to0z7eKXKOl7c45gJe/ONIuyt3KM9qvV8NLn9CTkPW1DtQS5uoztfy2T8qigQzqjHU
	14fujKeNvN9dkSIo8RPiwWyZ6pIon9F0GTxrgA8aiJC+tRpvSk+In2+JsVsdkqaUB3pzTrrR1jd
	8YareN0AIQvvy/8xnkfbqtg/L067fqMUP+eaRCDKs0Tucua6DJVOF2ksIrbIxFSCVEvab02llEd
	IkxbfM/nPsrDMMNtYvS9+UZLWqVZviPhQTl0KfJpttZrFKM2ld3pnnp95b6PgjgqodGNW98UAoC
	p6JMUZ2kQEipVhpbP3S/wMDABoNTkHYrSvNvGJeLoFz6w+wWkkgRDLd1YoTcjRptdQcJN0GqPey
	hlI3MzDrBxUAkQGFaLxrEeATZ4d/BOjPg==
X-Received: by 2002:a05:693c:87c2:10b0:359:bd18:aab8 with SMTP id 5a478bee46e88-3619e925ea4mr3318978eec.5.1792222670801;
        Sat, 17 Oct 2026 00:37:50 -0700 (PDT)
Received: from chitransh.. ([106.202.98.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm15999208eec.3.2026.10.17.00.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:37:50 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v4 2/2] platform/x86: dell-uart-backlight: recover from stray EC response byte
Date: Sat, 17 Oct 2026 13:07:04 +0530
Message-ID: <20261017073704.606497-3-chitranshmandhaniya@gmail.com>
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

On some Dell All-in-One machines the EC occasionally inserts a spurious
byte after the command echo in UART backlight response frames. For
example a get-brightness reply that should be "04 0c 0a e5" arrives as
"04 0c 0d 0a e5". The length field still reflects the original frame
size, so the parser treats the stray byte as payload and the real
payload as the checksum, producing a spurious -EIO.

Add single-attempt recovery inside dell_uart_bl_receive_data(): on a
checksum mismatch for a frame longer than the minimum size, drop the
byte at the first payload offset, shift the remaining data down by one,
and decrement resp_idx so serdev re-delivers the real checksum byte on
the next callback. Status remains -EBUSY, so no special handling is
needed in the caller.

A per-transaction resync_used flag, cleared at the start of each
command, limits recovery to one attempt. A second mismatch is a hard
-EIO. Well-formed frames never enter the recovery path.

Tested on Dell OptiPlex AIO 7410 65W (board 0TKWC4) where the EC
inserts a stray byte on every get-brightness response.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/dell/dell-uart-backlight.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index 5f01ad108338..1243c191c5b0 100644
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
@@ -245,6 +247,14 @@ static size_t dell_uart_bl_receive_data(struct dell_uart_backlight *dell_bl,
 	csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
 	if (dell_bl->resp[dell_bl->resp_len - 1] == csum) {
 		dell_bl->status = 0; /* Success */
+	} else if (!dell_bl->resync_used && dell_bl->resp_len > MIN_RESP_LEN) {
+		/* Stray byte after cmd-echo? Drop it, let serdev re-deliver checksum. */
+		dell_bl->resync_used = true;
+		dev_dbg(dell_bl->dev, "Resync: dropping stray byte 0x%02x at offset %d\n",
+			dell_bl->resp[RESP_DATA], RESP_DATA);
+		memmove(&dell_bl->resp[RESP_DATA], &dell_bl->resp[RESP_DATA + 1],
+			dell_bl->resp_len - RESP_DATA - 1);
+		dell_bl->resp_idx = dell_bl->resp_len - 1;
 	} else {
 		dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x\n",
 			dell_bl->resp[dell_bl->resp_len - 1], csum);
-- 
2.43.0

