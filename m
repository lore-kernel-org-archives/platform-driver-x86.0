Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749E31494AD;
	Thu, 26 Dec 2024 06:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.241.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735194160; cv=none; b=lLDUFq64ltUFTgKiAFQ544rPk0Ih412G//ybRo+HFZJL+oi4l0SX4Q4nD7TFHc00SnfDFfjM0PGLDGNZzENu2VgfSbHW6GJOxCjWpWxsNQRpEllMNnxV1Ai0BBlOIEBYrntJrCQrgL1wxZ+lJUWOuAB/Tap6WvuR/lBZ/Ji95wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735194160; c=relaxed/simple;
	bh=2D1Na9JRUs2dY5xLfU55nK8+HE4cqh94hO7BpNKfk8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GLY9xpVCXdyuZl1QErcPi7Pn7yfopZm9l8ig5HNqRsQGIDSwncIVQHrcMz+KyWN2Yo0dJHPbUdKSYsmlfhW19nRonnR/02yvN8ObnZoSqMATMy8fuhpayPiEOXSzosQ+gIN1AxtN/27oLVN5SAnT77HUDf6ZVABM2qoJzg1mB2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=NRlppaj7; arc=none smtp.client-ip=159.100.241.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="NRlppaj7"
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.100])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id B6E6E20761;
	Thu, 26 Dec 2024 06:22:29 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id 86A293E939;
	Thu, 26 Dec 2024 06:22:22 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 281DB400B3;
	Thu, 26 Dec 2024 06:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1735194141; bh=2D1Na9JRUs2dY5xLfU55nK8+HE4cqh94hO7BpNKfk8A=;
	h=From:To:Cc:Subject:Date:From;
	b=NRlppaj7k/75j2F3njIdEGxVSVKn3hQ3oW0E+w/9BcIiCUkgy34SMWfeGfkyOikrU
	 UDZEhxlXZ2/SapMpiYkvSFOcyvnkXE4n8oLtUbtXivSQGlCd2ECSMq5EWUSguM3XFu
	 FPxXvB3dFFG9FPx4IUHmcFZo8NbqTte6VWbv4/FE=
Received: from JellyNote.localdomain (unknown [203.175.14.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 7DBEA40C52;
	Thu, 26 Dec 2024 06:22:17 +0000 (UTC)
From: Mingcong Bai <jeffbai@aosc.io>
To: Alexis Belmonte <alexbelm48@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Armin Wolf <W_Armin@gmx.de>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>,
	Mingcong Bai <jeffbai@aosc.io>,
	Xi Xiao <1577912515@qq.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ai Chao <aichao@kylinos.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: hp-wmi: mark 8A15 board for timed OMEN thermal profile
Date: Thu, 26 Dec 2024 14:22:05 +0800
Message-ID: <20241226062207.3352629-1-jeffbai@aosc.io>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.40 / 10.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com,gmx.de];
	RCPT_COUNT_SEVEN(0.00)[11];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[jeffbai.aosc.io:server fail,1577912515.qq.com:server fail];
	FREEMAIL_CC(0.00)[aosc.io,qq.com,linux.intel.com,kylinos.cn,baylibre.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,qq.com];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: nf2.mymailcheap.com
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 281DB400B3

The HP OMEN 8 (2022), corresponding to a board ID of 8A15, supports OMEN
thermal profile and requires the timed profile quirk.

Upon adding this ID to both the omen_thermal_profile_boards and
omen_timed_thermal_profile_boards, significant bump in performance can be
observed. For instance, SilverBench (https://silver.urih.com/) results
improved from ~56,000 to ~69,000, as a result of higher power draws (and
thus core frequencies) whilst under load:

Package Power:

- Before the patch: ~65W (dropping to about 55W under sustained load).
- After the patch: ~115W (dropping to about 105W under sustained load).

Core Power:

- Before: ~60W (ditto above).
- After: ~108W (ditto above).

Add 8A15 to omen_thermal_profile_boards and
omen_timed_thermal_profile_boards to improve performance.

Signed-off-by: Xi Xiao <1577912515@qq.com>
Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 81ccc96ffe40..20c55bab3b8c 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -64,7 +64,7 @@ static const char * const omen_thermal_profile_boards[] = {
 	"874A", "8603", "8604", "8748", "886B", "886C", "878A", "878B", "878C",
 	"88C8", "88CB", "8786", "8787", "8788", "88D1", "88D2", "88F4", "88FD",
 	"88F5", "88F6", "88F7", "88FE", "88FF", "8900", "8901", "8902", "8912",
-	"8917", "8918", "8949", "894A", "89EB", "8BAD", "8A42"
+	"8917", "8918", "8949", "894A", "89EB", "8BAD", "8A42", "8A15"
 };
 
 /* DMI Board names of Omen laptops that are specifically set to be thermal
@@ -80,7 +80,7 @@ static const char * const omen_thermal_profile_force_v0_boards[] = {
  * "balanced" when reaching zero.
  */
 static const char * const omen_timed_thermal_profile_boards[] = {
-	"8BAD", "8A42"
+	"8BAD", "8A42", "8A15"
 };
 
 /* DMI Board names of Victus laptops */
-- 
2.47.1

