Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776738;
	b=S8vZVn1l/2HgkSq30FCHO1hP+7v3F88gqQohBnfDExtq+Z+0frA0/Q0yEp+JwjVKEaHz
	 /4xA1118UdTw7W8AQmYrlt1ugbO/yQ1ujlYDHpXfj+nn7nzUHiPi1j/uJsZ8t0qbVwPgg
	 DnE4v+br7+gMdgY4v8/QMv/ACTA1Blnpyng/kRXB0S2HX5a0h2tun3V6DmLXLyZwjPhwm
	 hEUVn8La/GAhqOURGMCvfOfNWTGSMtdvfFgIWEm8qT3TxrgWro0KMD1hJaRtGDIn7U7wB
	 30IR8oXfG5t58KTd3GFpCwch7BkSd7tODOPYHcpJPsv3WEbAGPliKkzTLOSL4tysugg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2r1x0Dt7yoigexj1LN19Sk2tBE9eYyGPD9hXhp2NAA0=;
	b=bBrThpC4VzqNbprQRYBLwuE/HveC+ann5iiy8RFDxYspL4OkWpFM6G4p8NLwwxitywXT
	 3gqgzJ46X/Qyj0ics17EOcwwddBH1Tt6v2ZNVI+ucjEmTt/TCQGbc+Ie2ypoLR6BKTRVe
	 ZKDZM+Ow6STni44FRVxhv/q6wqVtEAKfg92UAwn5XTtgAUJfFPlzwjxJJxMRZxz6tpcEh
	 X+AGjU7/A/YRUOO8vh4xQ68ym4BdMoPchJoiRqWR2tf0XDJanmQMiiL5zYSa9egQx+0KL
	 ltB6ottKPQJkQHCg7sKYSB51RgrqTbdq/5NczX7vjd+M2Z8wTnnvSSEQFonGIaZvJFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PwZ+s2Tb;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB531606A324
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 17:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB531606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PwZ+s2Tb
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso12287555e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 10:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776736; x=1793381536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2r1x0Dt7yoigexj1LN19Sk2tBE9eYyGPD9hXhp2NAA0=;
        b=PwZ+s2TbTyIPznOIqdpFwhuFG5Fy19HEa90OazWCvH+cPmycOtmyfWL+SqKTK/HQwQ
         wk2BXXxN+F0tq4OYymMclyAcq88/ZOr5JzCheM7u2rVQTKzcb4ID/ee58qKyN4sqjwHD
         Ugx54IAVQxOGsb1r8AklKuNmySnRUmhwZXpvbPSBLANvjA8V8Cugq7Yy+gjidYZ9ItrX
         zGnEnOp3NisHiCmk15ABB2eYOeiLWJulMU7h3jR79Z2C/SG9+DfFHFxzBUXPkR9WOgNq
         66kwfjKjyW3N0l7YynCUrEhDsESBWh/BvLmU8kwOspfvVX9y0XCJbhtR/wcAcfsvDWHn
         xiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776736; x=1793381536;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2r1x0Dt7yoigexj1LN19Sk2tBE9eYyGPD9hXhp2NAA0=;
        b=VLFmwtaSQHcGgCH4Dj8yXNFkk7hiAMUCq8C7sexEof6MVi46ncwycOKqnJKEmzjEs9
         BCYJWgqBNg7wYFYkdRo9UtO8KqaU6ulF0VkO/TuNARAVD4Q/16M2x7XE2r68kwbVnx4E
         jlV30qYvi+WM2uM52regQSN8asnTrDlZDilj6nsCYEd29cOQsx5ZpRQSFzp069+zgBXO
         JP9EB4Urv78hk8q+xm3cyonB58KETH+q3dcjq/uieHqyCL9dBlQ1sl9CWeP6AiPR9k40
         p5VPebDecd6J+8dEL+LXOlYJVwVKx+vknMD9Cv9WObWiNhTHq8vyKvmDyCIq0+3chINd
         OGuA==
X-Forwarded-Encrypted: i=1; AKwUvByNuIaQVAssTyAeXT1D2E4+uTIFWmTRzeFrQNJHO3A8B/Y6g1QOUbD25xDvAyQta6Du8IWdC1DbCHY8bjmRGjADhZCM@vger.kernel.org
X-Gm-Message-State: AFq9FYLKf6C6b+BNPHbabozqqaVqq1GxSS1cf3icsvtnjpodTyPk1l9o
	As4pYM3+FFNXGSaUTvMLGS/HpFJvY0EgTIOvAUMMGflymDcwTlefeyR9
X-Gm-Gg: AYBFou2nZ7wpkPAf4B5ZHyJaS/zPcL9ey13xtgHT0FrPtHQWMly3Rm5vh7yXmDav2gJ
	YQbhqKgxNqc+Yzk5qzkOAoiQ9mj4S5lqHrWEFuAnAgZx2Af1PKKNMwpn5r2za5gvlZOG4DlvOrl
	xM5nbYyPWY8LYKv4OJJk6j090d7DQNuGbt2fosvwvQfHqDXgSGRU78JjDPK6t0e7iBBk8qAMYti
	/y+GRo3NwLG9Inndt3Nw6lfc4og8MAQ08BGJbi6pJOv5FWb9juJ739pp71MfSIRmSFXUztljT7R
	ZBmeCKdHwNX0uJoEA1S+WD0/CZTZBLW/QddF4KN/HlcVyDCfNQBrw2oz9sfGVEYuoCwX+BMRPHU
	eLOl4MAbHT6dN52p8QNxj3r4kZE2LEaOCyoOUTuXf9duDuT6veOI7Sm8yjjXJUVloWYpw//SBmm
	ohcD9ov+BcXzA7mUovsrNMlUwcLyiwbnw4JBC7Pukn5qpcqQr2PmJlmXbn75DTAHNIbYRqSzFxj
	BKkPLiE6ybzdyTXLTsXCBdSiqUBuEoGo0LtXBW0POTjfz9WwKkehA+dZtpQg/DKWJ6SiC4Znn4+
	kVu9DbbEKYjM2Kwsj+Ls2rcuUnBrvaLpP4KLEtP7SCHTAqs3YNLTa96DkNMkTlgoLD1v
X-Received: by 2002:a05:600c:1390:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a211ee53d8mr50695125e9.33.1792776736231;
        Fri, 23 Oct 2026 10:32:16 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fc7012sm12475755e9.5.2026.10.23.10.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:32:16 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
Subject: [PATCH] power: supply: surface_battery: handle battery event 0x1a
Date: Fri, 23 Oct 2026 17:32:15 +0000
Message-ID: <20261023173215.6233-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the Microsoft Surface Pro 11 (Snapdragon X Elite / X1E80100), the
Surface Aggregator Module (SAM) emits battery target category (0x02) event
CID 0x1a alongside standard battery status notifications. Because CID 0x1a
is currently unhandled in spwr_battery_event(), surface_battery logs:

  surface_battery: unhandled battery event (cid = 0x1a)

Add SAM_EVENT_CID_BAT_0x1A (0x1a) and trigger a battery status recheck via
spwr_battery_recheck_full(), matching the existing battery state events.

Assisted-by: Antigravity:gemini-2.5-pro
Signed-off-by: Ramón Jesús Miranda <ramonjesusmiranda@gmail.com>
---
 drivers/power/supply/surface_battery.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/supply/surface_battery.c b/drivers/power/supply/surface_battery.c
index c759add..a3fa899 100644
--- a/drivers/power/supply/surface_battery.c
+++ b/drivers/power/supply/surface_battery.c
@@ -26,6 +26,7 @@ enum sam_event_cid_bat {
 	SAM_EVENT_CID_BAT_BST         = 0x16,
 	SAM_EVENT_CID_BAT_ADP         = 0x17,
 	SAM_EVENT_CID_BAT_PROT        = 0x18,
+	SAM_EVENT_CID_BAT_0x1A        = 0x1a,
 	SAM_EVENT_CID_BAT_DPTF        = 0x53,
 };
 
@@ -368,6 +369,7 @@ static u32 spwr_notify_bat(struct ssam_event_notifier *nf, const struct ssam_eve
 		break;
 
 	case SAM_EVENT_CID_BAT_PROT:
+	case SAM_EVENT_CID_BAT_0x1A:
 		/*
 		 * TODO: Implement support for battery protection status change
 		 *       event.
-- 
2.56.0

