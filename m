Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B799417BB35;
	Mon, 23 Dec 2024 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.81.35.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734949020; cv=none; b=EwjcF/qRsXmxOea3ahfM4KAmIcBOJFN7xi8XLJG0tQzyCPy+0k6gGjsNHiVFuqhVDByqTyp08ybVuZIVgCwG8+iXeJp2DpGyn1afiwkU9B1pmxlJqceKBAUzVvzv3rWJlG2co/Gx2Lg9b0tu3G5257mpS3U8zLiYmxgW3b04hS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734949020; c=relaxed/simple;
	bh=4KEGscMEIqsqn+ZzJtdhpeL64pZqYTmH+NdpdoYZnmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i75PCLK6qQvB30Je7ooEVDlA4omKTi4+mF5zfQ2voVIoHFh0rnJIlIS8h9+AGUgn3z77e9Xo/unxDnPiz/SU27oz4GrmP/5Pm7WTIwU4eU4Q5iB00kviUZ2u1ls9m8tTB0ahJQNagKiVEritsClNUrFoRd0QrzNIywcv7rjwGp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=x6dbOqa4; arc=none smtp.client-ip=51.81.35.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="x6dbOqa4"
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 8EF19205A4;
	Mon, 23 Dec 2024 10:08:22 +0000 (UTC)
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.66.162])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id AD66020761;
	Mon, 23 Dec 2024 10:08:13 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 4CEC13E8A9;
	Mon, 23 Dec 2024 11:08:06 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 3458D400EA;
	Mon, 23 Dec 2024 10:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1734948484; bh=4KEGscMEIqsqn+ZzJtdhpeL64pZqYTmH+NdpdoYZnmQ=;
	h=From:To:Cc:Subject:Date:From;
	b=x6dbOqa4iph60h6mIHpDKCFxB7+4vfHrpb2VmHiPV4YOOdJdTiWHry3f3Hi5uwCHT
	 XqiFZgW+wf1PdyVNAzKyUEJQyJQ6q5e9h+UXj0cZXYx1LTRDa8nY0X7OsCLMjnXtpR
	 jk4GC5rcpcf7/Okd5W4eOkwRJ53QcbOqAZXlCX9w=
Received: from JellyNote.localdomain (unknown [203.175.14.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 195C0411E7;
	Mon, 23 Dec 2024 10:07:59 +0000 (UTC)
From: Mingcong Bai <jeffbai@aosc.io>
To: Alexis Belmonte <alexbelm48@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Armin Wolf <W_Armin@gmx.de>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>,
	xiaoxi404 <1577912515@qq.com>,
	Mingcong Bai <jeffbai@aosc.io>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ai Chao <aichao@kylinos.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: hp-wmi: mark 8A15 board for timed OMEN thermal profile
Date: Mon, 23 Dec 2024 18:07:46 +0800
Message-ID: <20241223100748.2157703-1-jeffbai@aosc.io>
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
	SPFBL_URIBL_EMAIL_FAIL(0.00)[1577912515.qq.com:server fail,jeffbai.aosc.io:server fail];
	FREEMAIL_CC(0.00)[aosc.io,qq.com,linux.intel.com,kylinos.cn,baylibre.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,qq.com];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: nf2.mymailcheap.com
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3458D400EA

From: xiaoxi404 <1577912515@qq.com>

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

Signed-off-by: xiaoxi404 <1577912515@qq.com>
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

