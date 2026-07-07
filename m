Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43791D63E4;
	Tue,  7 Jul 2026 09:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415837; cv=none; b=sOEw8FNObp2bbKjH8Li7U3Q1zjc5JIw06ZTTlMTC0w6TbcsaNaxxmrC2XBM6qoB56zI1hzWoRJuT+3sx6qkdNu1y0DcHwjPeGRrFf1hoi5Nm9gDIA9Rb5/d7Uga4Sebn8MSVIfn7/R9RF0G+boQk5B4GyxHNBJ6I1pEBBf6SWvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415837; c=relaxed/simple;
	bh=MNYNQ5dPiTBWbN91ziqs3pM//ost+gXWYj/YjLPWuVA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SKDKyJG36apQYbtnHg1YB7V+sacoN11C21hAsyPiXKOblGFjnqmLneGl0qeCtMDtG7lvC/0FTkjph+Tn+2A6XcPiqOXOZep0AkOWph2gVJ+e5KhRgTUUKMUFO2oQrY1HURAsO6a+WLstdSH0xYR7EK1k//0TXnkQ4TYhk8k6Mns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=DHupJcLo; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="DHupJcLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1783415805;
	bh=7zqIAIpTNNGyZdOVTxvxa4JN57nhok7BOPwaaDWnm2E=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=DHupJcLoJR1imuu4U5U4qWF2bpDmMMdbSDNcuw7XpQuOnzkgPbCrcaxJpbK3nQrn5
	 /sVYCHnVk3ongPOdKY7z1R0vo70Y50Vx7HqHm+l0DjHPeB4/ac7m+pXf18Gl4PWRgt
	 fziNz4RcaSWggGiIKtu9+DSOqQyc+7ri3KiD2ar0=
X-QQ-mid: esmtpsz17t1783415760t6ac4fe9b
X-QQ-Originating-IP: RXQs5WfCninbdP2xO+AHQrllun/YvkPZLiaoA2WoM7U=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Jul 2026 17:15:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15566604652922070673
EX-QQ-RecipientCnt: 10
From: goutongchen@uniontech.com
To: mpearson-lenovo@squebb.ca
Cc: derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpojarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com,
	shaoyang@uniontech.com,
	goutongchen <goutongchen@uniontech.com>
Subject: [PATCH] platform/x86: think-lmi: Fix "Call Trace" error warning
Date: Tue,  7 Jul 2026 17:15:55 +0800
Message-Id: <20260707091555.71007-1-goutongchen@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: NhQ9hXNievYaMG/bsYTS3eEQ+hhBLmvfXCtqwnjL9Ih+UQwpZbbvs/ff
	3o4X2VKl136AWAJtXWvfWPbyca0kVqZ26lq3ZnrTyE5Eb9fBbtyLN+5k6jMfj61ce3b+mt2
	PC/LPPGide0XyIwv6wxFTcGptG15HbI0vQBmueLcgI5OwoImg2abuDQf0Q/W9xJrvbCpWgA
	n6OZrY5gKc6RhUdxkfDpGtx5j0BkCHT7p/P+O6JCokP4IBnUEQ8uqsKHkMm49Wt8ezArTWl
	eMySSJGaVv7guNl/wlerpyEM1UDSHaKZSwIY2wlYqs5gLTt6sFocj1mmbK5dJoqAesMm9W7
	wCPg6ZnP/wnTTwbPLWW7DlAoFtWCn+glYENaeuXGRIv05JnDDeAyKyP8Jw8QisZorUT3vL9
	eUYZTTHKKCuk7A9yEXIHY2PJx3o+08i6lPJlRjyLgxZGixA7T8Ixhu4Ud5LNCpI13zmFr5v
	JHDwUg1gmC1ZRaRNaCPmY2JL0GvlZ2IJT4bTvyI4dcVvT+cm/AfICJpfAi4oYFdJdTYMoIJ
	BNpbADGi7eVNwqVGJFw36e8MPyhI/G1HPTqLjQsvpxiCx5Pdss4PjkDtcnojqNIDxKsWvUH
	MSTtt6lHIfB9Ekm+ofYMF5G41wCYE0+fx5W8XAdwO1qRnsbe26znVekaNIfKFZMb0IW1mGP
	dlcRuEjb4ENdUo8s5TbLPrIQgfAVGT0/kr3bPmusGLxGu6gh77iMxXRtyYfEa+3mJ01BW3t
	73xnew4/q8hFRgb4+zF7kj+W17odmjkciYxoSiGLC2/Trag7UfZ+8AfSB3Ers6eVSuwTOiY
	cNG1az6ttHKO4Qs4ji3ALtDZakZEbwSpWJzPgTwDBMhYbIhzzjrXa7x3wrmXNUA/jbYSIaA
	sngMGhXYkpin+5/gn6AXYCBGJViaKxVZHZJ8al6g5FeD2osCrMCCHBtPFapl9jtr6NhxUGq
	juaDJHdu6YD6wWfYBBW/AFNEZFA8hDdON6RrHevK6rR2CA1WUxQUI0pq4TT9zKjM6aJ1bTo
	csihzKpvU51foAxQyj1hbZgPDsYocQrDCNdYLkRAFoPhv6J4rdPX6ASwdnT3kiQYEqFKZAw
	/I7xiEt/BQ3GDEoAbP45eDrb3yaVncu+UIZzjPSwTWkAalPDaGcHN6O/ltYgmqHHRt8ttdE
	BuFVQQPaDOTYEjFVTt8SU15kWw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

From: goutongchen <goutongchen@uniontech.com>

The maximum BIOS password length returned by the Lenovo platform BIOS/WMI
exceeded the size assumed by the think_lmi driver's internal static
buffer, causing the driver to trigger a WARN_ON() during self-checks.

Increase TLMI_PWD_BUFSIZE from 128 to 256 to eliminate the recurring
Call Trace warnings.

Here is the kernel warning triggered by the bug:

  kernel: WARNING: CPU: 4 PID: 665 at drivers/platform/x86/think-lmi.c:326
  kernel:        tlmi_get_pwd_settings.constprop.0+0xe6/0x130 [think_lmi]
  kernel: Call Trace:
  kernel:  tlmi_analyze+0x31c/0x640 [think_lmi]
  ...

Fixes: 651b57dd4087 ("platform/x86: Move Lenovo files into lenovo subdir")
Signed-off-by: goutongchen <goutongchen@uniontech.com>
---
 drivers/platform/x86/lenovo/think-lmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.h b/drivers/platform/x86/lenovo/think-lmi.h
index 017644323d46..d643cf3b81b0 100644
--- a/drivers/platform/x86/lenovo/think-lmi.h
+++ b/drivers/platform/x86/lenovo/think-lmi.h
@@ -8,7 +8,7 @@
 
 #define TLMI_SETTINGS_COUNT  256
 #define TLMI_SETTINGS_MAXLEN 512
-#define TLMI_PWD_BUFSIZE     129
+#define TLMI_PWD_BUFSIZE     256
 #define TLMI_LANG_MAXLEN       4
 #define TLMI_INDEX_MAX        32
 
-- 
2.20.1

