Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637776;
	b=MebZBEj+oRXb5xQzu5pjW26IDl9ynqyHJ6eiFCOlS+MUg8OjBB5OkbjN3nAuGdovmx3W
	 gGyiy4UVlKH6jqCFLAxGGIRFTFyiU/vVACUIYr0ocRQKsL3RuUMubjgW+vrmxfjl1O4uI
	 /M0jy1l/dVuQ3LpF7HgZB7gXkO7ba9MYlDqLjFtKYsjfW6ZRKTGiOcAXH+ec/EqNBlcH1
	 nA4j0WT35ixRP3oKXRfjT5aOXczKsjMiY+ij0lhNGpbcvfnFSnjXa0V4NLV8t+NQDtbDa
	 ypam4C8oMlsVFB4f0JKmw686bF7I3FVT1CJ/d+Ejx1/Af1kbW0mCGRi3ChdNSqv26AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=i9+suZUiW2w1H/nLvdwr8UFe/AqgIN0hpaBbLaNfQrY=;
	b=gkVlqThTtIi9epw1RX8WI2ukz0tfdI3P9Kfhgp03vSoriNdjeLPCa2qjcSWPC0CtFxRI
	 Dlnq6q73urO9DVOmmz2Ga96GuSjQnT3emzavv3YU3Ns09F0LrVX+9MXgBk3S517w8Mr7v
	 3Ng7LvJI1ee4zHEbqSkvSOtlqiZc/IZ9n83dFzWcFsehyGMLlz4QkcgM4XxfpEp+ZQBMh
	 yyvG8KECcrbRyQHuhbvKM5a0pmjddObQY5NCSGEqx0x5IvZR8zt/0BI2ejCWe/CkvgaqO
	 9gy92r9zZSgw8TbRwuM2rTaC0auIEW+lmr9CcLsrFypglMHSSqkcH141KyJYKNsrOYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdakY2AI;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF898606A323
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 06:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF898606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdakY2AI
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e95bd1c14cso27778035ad.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 22:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637775; x=1795242575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i9+suZUiW2w1H/nLvdwr8UFe/AqgIN0hpaBbLaNfQrY=;
        b=wdakY2AIl5dU8gPIjU7P1qXU7P8hQIaIlWiyB6RVVH61maO+QZli+X7JbADKU/T3Xp
         rKQd1H6/6pb8zkAQg3shBm+UkilFvFahy+IeKa/ixDcE/oA70rgmQ6elP/E/0tqnzEOZ
         KfbjS0fH6qTekJXB3Mu2Ewp75BgLqUHpYzBr/9ZNRFdEyFlscqlnLHlqBp/onsXC2XDp
         t2jT/IHOLZ7OjK0SiLCFfh4nxGVGEvHHQJlEbwXHzmXgS2WBMNPP1ffIO06WOMjmGNoR
         02VHm3oOWmRXL3iAOCnyvR85hXKxXDafrJMW4l8RH+mFvhCnNYW+xSA+o/gPN0WGE0KG
         ZY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637775; x=1795242575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9+suZUiW2w1H/nLvdwr8UFe/AqgIN0hpaBbLaNfQrY=;
        b=aRYZR2s8IPeVSQBuyX434oi74wZZ1LhJQ+v5f0UgqKcU/+1xtcgma6BPH++5HqVLt1
         yZnapvWpm2D3h34IsOLSOsQ5z7jvteqzPO7jx3MA1xnum8dh8KFzAk4l8mEum1zEXOIH
         kNVGuCT+p9dimP0uYoWr+ZWH6muX+lesYcOFr4oJit5h8TMdZQM36nX0L34hegNWbgje
         RKH0rAGcjoUmqpDx8Wz4OcU+WonYt0VzW4om0th5T+AodNIupWEX0xGVvI33Z9mqr6NX
         2Wz6isOGVvqjP8DBmtumrSk5xoD+h4xXCKM/6hS8cHXxeUZEHqffztNV6+ehJCEiskET
         I3Zw==
X-Gm-Message-State: APuU4Z9Lxy30Jp1e1bUMlH5mTefixJgeCd82Y72QKdF2HCwXY55OeaHs
	2y9h8KGlcmpHDDwD8L9OF0rvQbUcuLDQUDShIGJapYL/+xSwm/DcKRvvd5qnGq25
X-Gm-Gg: AYBFou0fIHozvyX0J2ObeHCdk0eoEOF0bf5CnYz+AuZSSbvIhl6d3h6GP/bHIUQaSSv
	ievCyubjSKitCKoSrT8wmw5Zqg6cXrXJx6UXnRUWW/JxRfE41zVccEeg+tKKeBp4fkHmHZ2UCBm
	KwBqLws+wJTMVRXr5wpATw1bCc7GU2DBOFJG+aZqHlMJLbEE+aZlHLhU0Jb3pbeeKYBojDeBH8G
	Yd0cNPCnWNUIh24p+Ckb1dAi2+I1eIBMZmtsCuvMxH0OygtUsYpxRSsfH4r9C9jF1UgKYYhQr4g
	Bm+MwjaCrBZuOuZbOVu3yNupYt3ZTHdEttgQmsgzMVFyvE/JiCdE0aF35mADXq3wILfbswzCIzq
	T4iQnB/9qrXVar6NsXDEVjHfYgstr/fWuflHu0KoDfl4LySvu5xKDpaQvZOXGa8fhYMW3g8Y5c4
	YS7AAk23bxTdWQ3tcqCYW/w+bIlUc+WQZTABJ//2XE4JsQ2t5+WUSU0bxKOWNf/2CtpyBhsRGlM
	NMV+V88yPHZH52033lp92UEwiz6sVRxrmNyPW3zo9ri8mdqm9qziLhwT/9fS/xLEvJhenaHqMKa
	KgaXc89glVFVCvN3sXv9kafyJAjZKOwSjXZw19lAxx/n1OGEPUTQIA8T1uQOaacyEUiRpeH2qEj
	C47JAGMi1SuhopLpsIEA7er+aC0/BkzRGTDQpE3xTfMzWjZXB589cmqD13m8OOzoP3wl88h8lAS
	n4iw==
X-Received: by 2002:a17:903:1aab:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2ee0ddb1fc5mr52433425ad.25.1794637775107;
        Fri, 13 Nov 2026 22:29:35 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f224370sm18382465ad.0.2026.11.13.22.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:29:34 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] platform/x86: dell-laptop: Fix keyboard backlight and charge threshold handling
Date: Fri, 13 Nov 2026 22:29:24 -0800
Message-ID: <cover.1794633179.git.rosenp@gmail.com>
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

Three fixes for dell-laptop: keyboard backlight timeouts that overflow
during unit conversion were silently accepted, an unread keyboard state
was used at init when the SMBIOS call failed, and the charge end
threshold was parsed as unsigned into an int.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
 - writing 4424214d / 18989323d to stop_timeout set 4m / 2m before
   patch 1 and is rejected with -EINVAL after it; 5m still works
 - charge_control_end_threshold rejects -1 and 101, accepts 85
The kbd_get_state() failure path of patch 2 was not triggered.


Rosen Penev (3):
  platform/x86: dell-laptop: Reject keyboard backlight timeouts that
    overflow
  platform/x86: dell-laptop: Don't use an unread keyboard state at init
  platform/x86: dell-laptop: Parse the charge end threshold as an int

 drivers/platform/x86/dell/dell-laptop.c | 30 ++++++++++++++++++-------
 1 file changed, 22 insertions(+), 8 deletions(-)


base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.0

