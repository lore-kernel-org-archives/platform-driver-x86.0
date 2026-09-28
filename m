Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0443835C6AF;
	Mon, 28 Sep 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585718; cv=none; b=J9++MDh6nYC18RFOSe3h3nzg+HB/9iejafEUhsUEf9ZYYB1ro47zqkrhJdYFvzVZ+zI5Vbny+Hxt+G2mHDyT1913V7MA5kSdYOzPSwM+edGihkCWrl9pCjMDOdA3lU5IkzopQhaX6AsNguswswG5GdKybFsxyrWnVwM7Kwh5Lnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585718; c=relaxed/simple;
	bh=tcNvYp3rbKzpFdd6l/5HYF71nLYq/j/HDocDFuvoTik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3Y2H18UGalmHYL1l551c4UqWoV5fBCrNjTcxC6hJm4Z4ndy0tjRzOHr+mB9nnwLGu94tJMr+V2sXXvwh4EDXrJAsh8/hg0hFs50mVf6Dpi7wGjAHdRz8pLs+oWJ0vMchCmA3z7GLIq8Wr79f1EZKICEAWm4s1eb86CyIEUTLMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=MydfFPqp; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="MydfFPqp"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 8B19D2FC0069;
	Mon, 28 Sep 2026 10:55:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1790585707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UirZIdCMr5IiJxA7cT7J3M3sGv5kSmeKF3s9N4PR9M8=;
	b=MydfFPqp8x8zGNUSrMWvIyHjs6QN7dfykN2/Zs3mA1FaQkkEQoy0vNHSp8pE/E6OGXWBVF
	xzwF4y9xtRZzR+P3He0NFi5fhvJOI7uB4n7+s4hERzCKGFzlQEQcGZOAzmJh8R2QK0ee7f
	+coTfSVuFTjGN1aDwZkyACBWBhtQt3I=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] platform/x86/tuxedo: Fix keyboard LED map ordering
Date: Mon, 28 Sep 2026 10:36:29 +0200
Message-ID: <20260928085448.9024-5-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928085448.9024-1-aer@tuxedocomputers.com>
References: <20260928085448.9024-1-aer@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LED mappings in sirius_16_[iso|ansii]_kbl_map did contain a
flipped line that caused LEDs to turn on in the wrong order when
counting up the Lamp ID.

Fixes: cfd84b3f419b
Cc: stable@vger.kernel.org
Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
---
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
index 8f1ffca0430d..2b985b030197 100644
--- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
+++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
@@ -232,8 +232,8 @@ static const struct tux_kbl_map_entry_t sirius_16_ansii_kbl_map[] = {
 	{ 0x2e, { 246000,  67500, 5250 } },
 	{ 0x2a, { 269500,  67500, 5250 } },
 	{ 0x53, { 294500,  67500, 5250 } },
-	{ 0x55, { 311200,  67500, 5250 } },
-	{ 0x54, { 327900,  67500, 5250 } },
+	{ 0x54, { 311200,  67500, 5250 } },
+	{ 0x55, { 327900,  67500, 5250 } },
 	{ 0x56, { 344600,  67500, 5250 } },
 	{ 0x2b, {  31000,  85500, 5500 } },
 	{ 0x14, {  51500,  85500, 5500 } },
@@ -337,8 +337,8 @@ static const struct tux_kbl_map_entry_t sirius_16_iso_kbl_map[] = {
 	{ 0x2e, { 246000,  67500, 5250 } },
 	{ 0x2a, { 269500,  67500, 5250 } },
 	{ 0x53, { 294500,  67500, 5250 } },
-	{ 0x55, { 311200,  67500, 5250 } },
-	{ 0x54, { 327900,  67500, 5250 } },
+	{ 0x54, { 311200,  67500, 5250 } },
+	{ 0x55, { 327900,  67500, 5250 } },
 	{ 0x56, { 344600,  67500, 5250 } },
 	{ 0x2b, {  31000,  85500, 5500 } },
 	{ 0x14, {  51500,  85500, 5500 } },
-- 
2.43.0

