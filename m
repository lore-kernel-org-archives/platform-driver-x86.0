Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637353;
	b=P42oJM0QToMpUocm0W95zvd5L0jCoIgIYja+2xl3oVB+CDPYgFHoH2ear8RLv/pR2vPZ
	 qWnFBLaTUYKTvjb2J6H5P6kRuMixa7c321+o0NyY68QYO2496K/9gk1Slq+JadAB00Vxp
	 r2oMRL8/I/VASuU/zl5ZPJvMRzfKcygzMKbPvKUvmOZOEEV59120H6BJaO1UgQXF4tsY7
	 EN6mvGn7KxToj7mLkqsmHfqvh1dTmdZsVbCpfi7BvytYMKfltVXWqYuWyX2JipYdsDWJz
	 WHeVqU72BuKZvpAKVVk5clFGnKWlWZF7PlgqA7rFVTzkoa7nLwWt1EhaTTZYFPgA9mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=a54BQTIFjPW8P0xkuWanHjV3ZdgHWnaMz+Ldxn8PqvM=;
	b=JcVR9vptl1+/8hDXetcUl0ckuh04osml5VxM3QMCopnjaLMczCu1qoIILQQOGHNY9Op8
	 KnZhyNih/dHMFt9qPVjfV9HA8Xd/bUvnXSN8zrxAAIj7tv3FDYibkMWcGjXQj6z8sYblw
	 IbUA4hbgYzWrzD8DQX4D0igSNGdLmXQHg3co6vdgFi7XKdHeSiCnqu9lWuLyhTZvQJFCt
	 fHuQqKgP0SoQcF/+vFUaGL49vWC8rFzgavP0dJNeCjUwJB53jeBoj8u9LA8aP45jybXhD
	 3Y++kiw0YgNUX74rUiS7K2l3oqyl6nJdA4nh0Df2u1pb3MjaiIrtDEQtfSJAtpnin1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3ze6GhO;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27AF606A332
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 06:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C27AF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3ze6GhO
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso1742250a91.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 22:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637352; x=1795242152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a54BQTIFjPW8P0xkuWanHjV3ZdgHWnaMz+Ldxn8PqvM=;
        b=k3ze6GhOGxdLUFgZdt5Z9OexSj/i0OwBosPzmqlA8R7gXojUX8g2ifJvekL56/ipEC
         1slzLFYh8mjaHI8hiiQhezREESOCUb08P6TrheUqWCmdCjs+ajpNDhnwPhvoD7C/7RDT
         IH899UI2TPF4ztJugZDmVoaY0oWd8UEYNAMx0ujAkp8SkNOLmufPiGidpxV5jZfSLPgs
         xuzLgizr2dsBLu8pL0SuEdbebpXDJytvipoV0aZ5F8uo2Pw47VHpL/co0jqvAdGBtXB4
         TT2poLH6FIZkotwJqXaWxK+wUf/JaXlHJe3SfXpyIrDRuASGGdm4bm5HyMHftF6lPfdC
         ALUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637352; x=1795242152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a54BQTIFjPW8P0xkuWanHjV3ZdgHWnaMz+Ldxn8PqvM=;
        b=p1XlvcPsaiFRGHYgZquDA/twAVSjTiK0IpJqdwgZOx8xbj8hUiEHrhhreKlMHyVBfh
         Q+Iod1Hx4D8H4ft5vgfNAFluv2ojZUlErNw9qkM1c0OglnhNcPYiDTZ/H8dDJ/jB0xQu
         miaSqUX1SQkDi/pXfxAOyMVpwyghDmsBq9aCEUmxtuSk/Dq6U+xle/OtGfJctJHBHNhj
         ij9tD9PcDsyjqBuTMOrxnlYcR0aftGQbi3tMs3Fn/V6h76l1IReZgy9ijWzU07wWbme5
         fbMyGVgpeQGOqOGi0Hmc6cxwLoFaiW+eYjm14rtG0VXy43TCOQiM19O5KUD1DTI0O4dF
         7/gQ==
X-Gm-Message-State: APuU4Z9doiyRJXJPLO0VbjSg9mgoyEI0whp/8pGmfxYRLpYx0AYQon9Z
	WR08iwxHfzre8X5YDxu2ysUVNghuFgan/4NqGAS43bkR5AFHoA/xJCb6
X-Gm-Gg: AYBFou37IpYZCTLMXdNFDdo32vlJ8+JqKSLfubWqLbefuAipxRANPRakih3ESqE2pWk
	fOKp5F5GSrlWia0++MYULjC0Byq6cqAkWJ752f5EjijkEDjWJuEyqSeD3WLarSbOlLMzLqsp0u8
	KJ94cPq26SEA+ouzbtRwSwttOBMFcBFQQ4s69EPzx2vDRLeeRvTZOnhQZlpOInlO+eucjjtY9GY
	oT482rXnS73RuruCVSUKqOichrsiLiZFNgpzXc8e7rXM3YSeJrf0hTFmLJgcE/p7SDjmBbTBd+Y
	480PVJQWyE+PVkYkqbIrnhEgepSN39szu6+ThQTTxcwblPvBRmosvka7Q0QmmoSZppEZVBiP9qT
	dlbwmSzvcfuD6BAjpkoaCf9VQHf1iCOs5Rt1wFq7c2r1wLhgsH2Wp4AgjgfKKRxFlwwIb3Eh2Dn
	c35hUt5WaD/sL9Q9JXVMQQ9nrk8EhJPxGpjspriNAjx3p6lYBlZ+mTs887CE2vbGQuzbEgDUYQn
	l152ncVmPsV7B1sguBG5igBB94wOrxPxzrzLiHGFOaK6uS2NBSBbWLmvCT3hU/bkVoiYHaP/7w2
	O2EtmejO6qqAFiVrqjB/yJZD2AxhYODPVu2kJjn9OmZDFisfQ3RtOS/PaHIfBKponH9wnnnbUkt
	99XDTX0pUykGeOE9GfTre38j3SZnNbxr1Iled/ufCBiWiEOwHCLZdFmFII6CpbcxBJyVAowUjqn
	qVsw==
X-Received: by 2002:a17:90b:4cc9:b0:3b1:82fb:7e03 with SMTP id 98e67ed59e1d1-3b1b09e665emr4584940a91.11.1794637351981;
        Fri, 13 Nov 2026 22:22:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b266d873sm3457653a91.1.2026.11.13.22.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:22:31 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Troy Rollo <linux2021@troy.rollo.name>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-wmi-base: Fix the data pointer for event sequences
Date: Fri, 13 Nov 2026 22:22:19 -0800
Message-ID: <5fa10b9dbe351074e61493c0ba3344ba6106137a.1794633180.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

dell_wmi_process_key() expects its buffer argument to point at the
data that follows the event code. The 0x0000 and 0x0012 callers pass
buffer_entry + 3 for a code at buffer_entry[2], and commit
392c19faec6b ("platform/x86: dell-wmi-base: Fix handling of ultra performance key")
relies on this. The remaining count passed for event sequences
(len - i - 1) also counts from the word after the code.

For sequences of type 0x0010 and 0x0011, however, buffer_entry + i is
passed, which points at the code itself. The tablet mode switch event
(type 0x0011, code 0xe070) then reports !0xe070, so SW_TABLET_MODE is
always 0 and tablet mode is never reported.

Pass the word after the code.

Fixes: 5fbd827eb9c2 ("platform/x86: dell-wmi: Recognise or support new switches")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
Developed with the help of an AI coding assistant (Claude Opus 5.5),
which found the issue and drafted the fix; I reviewed it and am
responsible for it. Builds cleanly with W=1.
Not runtime tested: the M4800 does not send the tablet mode event.

 drivers/platform/x86/dell/dell-wmi-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
index 44857e99fdfe..c778409ca099 100644
--- a/drivers/platform/x86/dell/dell-wmi-base.c
+++ b/drivers/platform/x86/dell/dell-wmi-base.c
@@ -523,7 +523,7 @@ static void dell_wmi_notify(struct wmi_device *wdev, const struct wmi_buffer *bu
 			for (i = 2; i < len; ++i)
 				i += dell_wmi_process_key(wdev, le16_to_cpu(buffer_entry[1]),
 							  le16_to_cpu(buffer_entry[i]),
-							  buffer_entry + i,
+							  buffer_entry + i + 1,
 							  len - i - 1);
 			break;
 		case 0x0012:

base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.0

