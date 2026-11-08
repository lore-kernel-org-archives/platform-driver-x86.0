Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794103458;
	b=NzJ4gFWN4sIxe57tQTLn3pPU/VofUAEFia4yY+JhEceHJtQMTbbu9ELqT9IOXY1DhOGz
	 sknlmFv00bK/o8/KEAH8sSLMMJDczISuxYRSzBen22zwJVvCHq+k3Fj9TPMuoL5CVTGAW
	 C9k/GTR6K9hPwfwYhXyYtGT51UU+LnHZPI8hlS9pLmpxVWLL5uhJY9YLR74/Gazw6Lx77
	 WTpC/opElzjSrcKZeA0pG6TwgD1XQnjqYNaXphs5MBUrHwZFKxRrAgZ26Tabe3KuXPCAH
	 7b54T6qS9ErLbSZazTeeVkEyjy9u+Qg0UXSeOl9bx2HjhWROlFMBKKJxBlwXlMyhXyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794103458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p226xUVyOCcEBPo+3Gn7mR+BBT39fpCk4Kx8gUqu/lg=;
	b=dG5bjJ2teHgixQYsqPslXNo/kpAl29w1TMHaKr9P6bVUUAHUn0SQbmA5NZbJ7BhcizgV
	 rpER5cAK1M7p8IASorTHmtTYgKpR8hWJo2b+aBe1SedYFvw9qGSfl4mQYBRA5AwkF2qTS
	 2Z29i7iRWUwUUo/xFtF0+XwLWi1WayBSxY8L9qN4fidYn/h9syU8WW3NYc+0sLLWzDwO3
	 kRfWNo5n/RzLz4qVdZA5I9r6WHk1COuBc7kjpdwo8+m0BOqKD/CA7BLph8yzeWfgyjLRj
	 uyxrhEFCHyOMz4ZGQ71Ok6kdIhFZFMqx+ZIhaheyjXnbyhid+Z9rA/0yoYwo277cgYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhyIYeVo;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F28606A31A
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 02:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F28606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhyIYeVo
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36fb88ea38cso1008840eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 07 Nov 2026 18:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794103457; x=1794708257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p226xUVyOCcEBPo+3Gn7mR+BBT39fpCk4Kx8gUqu/lg=;
        b=QhyIYeVovOnSTnPzrzgRPfs9jV2MTD63IEPI27wWcj2N9qWsFSWTlof/Xlrmg1XR+j
         HPvrrxbzQ8GUXYURzP7kdjKUZ0MOuxSCxrvquQY2UpylPoEIkuaByUWr/eoP0Ahwe24n
         8QZGACIZIukS37RsIo67xkbvLWP/wxK+Q+EfC3mzM+laOv2eXbjptQ9eyJDAvL+gX8dz
         Cbs39QQS9VKd5dZ7jMMz4+x4GN5+J3TRQe+dgVTZ0ElVjUFrLHn+GIpG1BXCi6FiEZ13
         as3wr9nGOfWLkw34URieKqs8F4iIsAP3kUEfVbEH6RNhQT3iVNfb8edHLE4eDXzbTs7j
         DPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794103457; x=1794708257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p226xUVyOCcEBPo+3Gn7mR+BBT39fpCk4Kx8gUqu/lg=;
        b=1juEoEfdXtpTFtuS9l+v3VzPLabQ3yo8irG6b/Q1aRgWxEskcxWwU3Hx0/nGlqEx+A
         N3hWg2GfL9ChPWS+GOOGF5jizXEri9IB5cKL+38a1pa8hQmF/AHkjl4izGtX1vONeYS0
         3i69rHrO8Fg16KFDkBx9o40I7X0m4fe8PKwKJRhD02BRoGzzdXP12cZ7CswFNe+WpL//
         GxyRRIjEBLK+StEyY6CrO+Ue7Mafc4ntR2MTKfVQPd+tyzJrttXUIw9nxJXekqfOQ9Eb
         pBnw8D9qkZwtVDnIlC5o3UFIn9aA7YGGj0AyjLdqm/q1YIuuNTxVMLNJH0l3VQYK+RGQ
         vQyg==
X-Forwarded-Encrypted: i=1; AKwUvBwmbTdII7T8gmQsAe0oIn0QtqhyKlkAKTkH/tD0Aob55v3liU9ZMPeNT6q4/yzgzKG4tMqGOKFcoXhLj7NogyaTVS9L@vger.kernel.org
X-Gm-Message-State: APuU4Z8ALZGdPUlHbG2eEaP6WDI1LBGGTiWMkv0ZyArNE90clO7UgncA
	DpY2g6LQkFTnlBG/x8ZoCRSPgAs1qLsYSHN/ADngK/lxAByvuNWLPKw=
X-Gm-Gg: AYBFou3047/kWJ5iNvLJllBH7XECnxx3ulZ+loLoDOGXNyioMB9AHFbpTRGuBUAIEyL
	WL7sMd2pvFYTPRP2VYBzIE+m2yMec7glHwps3PigiqDQQEa2LpVi9BvOsKB9/IcLrflIiZdjcNd
	UbUMpjnHGhwuvBWE+Rv5PfGCdfvKKn2oOljQifBW1l9CanEd4p6SpbVbxnWjx4xrrhKaualPi9V
	v6L35Ul4Q5zZD6VaMkODIngfbhgFb4/im2zSttyHm5Ccav6QbxnNbMwZMqtDQugzBAkVHcFV+8T
	zCZDyVcO2Pnf2wz8cXISG8fYjYHkJnu4CBDdFu9Qa4onwrl7Tw0fJ/DpbhqQ4YH9mU0fDm+NmPY
	Y4UuTjzzi1gEvZ1DO+sm9ZFPDDozA8W8+mf5Yjc1vCArY8pZMx9aofOXI+fdG4NITC6njXQrLnQ
	8TBDKwsGdSqIRjqrNxPbkwwgDoB1I/h3H9Vx+vCg8hBm+ShtIPQ8EjZdcDQswKNG7/wOS20NLt6
	5e5ju4fCzFI7JXx3ykCeO6rkHqj6DiQrfdYOhhncV6IkS3U+Mp2PPp2opAPsYnLUll9IkqTrwzt
	KGi/I4oHPJnAxyARd8V1j1verP+Tz8R53aVtIlRjxagbIPh/XP2UuJVYvHKL/fp9WTwQHQI=
X-Received: by 2002:a05:7022:c41:b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b269af1bfemr4662689c88.4.1794103457134;
        Sat, 07 Nov 2026 18:04:17 -0800 (PST)
Received: from localhost.localdomain ([1.251.173.69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771e5728sm2077895c88.16.2026.11.07.18.04.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 18:04:16 -0800 (PST)
From: Hijae Song <hijae99@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hijae Song <hijae99@gmail.com>
Subject: [PATCH] platform/x86: ayaneo-ec: Enable charge control on Flip KB
Date: Sun,  8 Nov 2026 11:03:51 +0900
Message-ID: <20261108020351.62494-1-hijae99@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Flip KB was matched to quirk_fan (fan control only), the same
quirk used for boards without a working charge-limit EC
interface. Testing on real hardware shows the charge-limit
register works identically to AIR/AIR 1S/KUN, so switch it to
quirk_charge_limit.

Verified on real hardware: switching charge_behaviour to
inhibit-charge stops the charge current (status: Not charging,
power_now: 0), and switching back to auto resumes charging.

Signed-off-by: Hijae Song <hijae99@gmail.com>
---
 drivers/platform/x86/ayaneo-ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
index 41a24e09..6fe2387d 100644
--- a/drivers/platform/x86/ayaneo-ec.c
+++ b/drivers/platform/x86/ayaneo-ec.c
@@ -88,7 +88,7 @@ static const struct dmi_system_id dmi_table[] = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
 			DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
 		},
-		.driver_data = (void *)&quirk_fan,
+		.driver_data = (void *)&quirk_charge_limit,
 	},
 	{
 		.matches = {
-- 
2.54.0 (Apple Git-157)

