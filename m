Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.60.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115560;
	b=37HoKFyqwyEv8jntDzn734fshIdD393C2slKeE90GODbZGrL8Vcuztc2oO6VZ7ZgXeW5
	 Y392prVW0iKPSIcT/HQoBBEMUL7YmKsLQWGfvUX0WvzWmatLYjHhA/VSmK/Jpeot4THn5
	 EEkjuZyBxbv+T3IXeGTnNXIcRnl+y2Ipb+0094qlsvppmLzT45ZZtA7ZdZXWFFKMBsfXh
	 xdMQuw9Kv7gLMAlnDk7Ah885HLqgTxVB/2gyE6/2iB65iILlHBszXfm9lR6eOl02886LQ
	 muPwmYUXLnzl+TEixCGI472PYO7MlI+JcSj62i5M86ZVaY8BOT/taWFyG/MFjsQ5ngA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115560;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MLs9JIK5E2m1LHtO1k5JGVlN99SynQ2G2eVne3fGdEs=;
	b=F4aeTIjRP8zcR/eITQBQ2Z+5Fu1NMiYwAYXeEyO7wMoGcO0pqB1nrgFtJFBbFcroI8Z/
	 qSMQQOw5LZVef2BjEItxT1Akz4sxpuscOqKwuhgzUJhixRSJA85zXmQ5M/opFOIEJ9KGT
	 CuGblbrpHxNHRSeFFlgbs7SqQ36F3hhRvJIhHUDvYZ8/Xjtr4Jiy6GLVQyNLF7SNfSQtV
	 vrQChgCZ9ddLXbs5E6QhTDeBrqIqT3Ny24K117DzcpOgOh9SwOCK/sQcL0CXt6aAbKzW8
	 5WWr9G2qzvM08wpmaiizU1B/76yCytM5iRqsJtIGiwhAe2Zf+3pv6vMmn3FqvGY5zaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=G0gg7zhP;
	arc=none smtp.remote-ip=51.250.60.165
Received: from forward105d.mail.yandex.net (forward105d.mail.yandex.net [51.250.60.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECB1606A326;
	Thu, 19 Nov 2026 19:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ECB1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=G0gg7zhP
Received: from mail-nwsmtp-smtp-production-main-68 (mail-nwsmtp-smtp-production-main-68.yp-c.yandex.net)
	by forward105d.mail.yandex.net (postfix) with ESMTPS id D9F6F100036;
	Thu, 19 Nov 2026 22:12:28 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-68 with ESMTPSA id PChIvaCdYKo0-CEWBzSG3;
	Thu, 19 Nov 2026 22:12:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1795115548; bh=MLs9JIK5E2m1LHtO1k5JGVlN99SynQ2G2eVne3fGdEs=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=G0gg7zhPidJjCzrfnwPyHpIBN/TxMPY++/JnKMH3tcY/giIBazgHYTy+tmHKVxy03
	 XfpIkJ5yDGpiC0aslrk8emDZ+b83G99nNqw/UzMdzfhER6kdqy3wnIYD/FAN4yzWql
	 ndfHX8IrVDvCYnCy9F68KbsuYElgCljSwzBBvaZk=
Authentication-Results: mail-nwsmtp-smtp-production-main-68; dkim=pass header.i=@yandex.ru
From: Vyacheslav Vankevich <crazycoder@yandex.ru>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Vyacheslav Vankevich <crazycoder@yandex.ru>
Subject: [PATCH] platform/x86: asus-armoury: add power limits quirk for FX707ZC4
Date: Thu, 19 Nov 2026 22:12:24 +0300
Message-ID: <20261119191224.15755-1-crazycoder@yandex.ru>
X-Mailer: git-send-email 2.47.3
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

Add PPT power limits for the ASUS TUF Gaming F17 FX707ZC4
(Intel Core i5-12500H, NVIDIA GeForce RTX 3050 Laptop).

The EC starts with a 5 W package limit, which clamps the CPU to 400 MHz
until userspace writes working limits. The firmware ignores PPT writes
unless a custom fan curve is active, so mark the quirk with
requires_fan_curve.

Limits validated on the hardware (BIOS FX707ZC4.311, 2024-10-18):
- AC: PL1 25-90 W (default 45), PL2 35-115 W (default 90)
- DC: PL1 25-45 W (default 35), PL2 35-60 W (default 60)

Signed-off-by: Vyacheslav Vankevich <crazycoder@yandex.ru>
---
 drivers/platform/x86/asus-armoury.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1229,6 +1229,30 @@
 	},
 	{
 		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FX707ZC4"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_def = 45,
+				.ppt_pl1_spl_max = 90,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 90,
+				.ppt_pl2_sppt_max = 115,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_def = 35,
+				.ppt_pl1_spl_max = 45,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 60,
+				.ppt_pl2_sppt_max = 60,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "G533QS"),
 		},
 		.driver_data = &(struct power_data) {
