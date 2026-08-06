Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1019D2EEE85
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 13:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022208; cv=none; b=FrpAF3GZEln3xOE2ZIUCKi0ra2kKQze9vgqkMwBzWjkj09u2o3CmE8G4ptbpFI+FXR+m76bcJB+abbBmSFmtD6uoh+ZmMMnZCJIr/4+JE8dCsmgXEDdjweUGVLy7hsJwV1oduRLN2wNeq3VxiD+1+qMzxx8ONiOw7bmqmkPAtF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022208; c=relaxed/simple;
	bh=FvWypIVfEAG2rD/8WJAl72mElKDbHhfpKppCyNZyMSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LRDvUwb1+ko4iX9S9IuIbSK5L0+jtNFlrChiRhuvG52Ir6Owx8xwx23ppivfV2YE/0TrF5Ez1ImbvOkdSrkycnb2dRkAV7X7AL3SSfzMnSX+ibRJvJp+Llw+9648qqFFFTBoTGZznoXXkc0xt8JMZqR3rwP8qvhL/Vh4/LMVZrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kZoNpVxH; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kZoNpVxH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786022200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qrgHrOGuZMN0Xaoc1nMaVdn4Tjd2uZLW/P7pfqSzedM=;
	b=kZoNpVxHFSGqb+Epwc4hpCITQO2LQqPcJHb/qfQZu867ZjJo+pGPSI0j+1Ar/HMveX4iQ6
	bqup+kfN47MOXA2E2z/Jpadl0BQCuoQ8lbmY+qac1Nv742SxD9r7HYepCklUJv2XM1HbT0
	3wAQYB863l4I1T8Jg2irr4/Y6O0mr/Y=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Use bool for str_supported() parameter
Date: Thu,  6 Aug 2026 15:15:50 +0200
Message-ID: <20260806131549.235170-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943; i=thorsten.blum@linux.dev; h=from:subject; bh=FvWypIVfEAG2rD/8WJAl72mElKDbHhfpKppCyNZyMSA=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFklnayzo0t3TV/fI6AV+LSsxny537+um+2L17fFaGYfY Azad9Gyo5SFQYyLQVZMkeXBrB8zfEtrKjeZROyEmcPKBDKEgYtTACaSX8zw33vLq/jaT3eZzs7Y wTdBJbTYNVGmtWK6UvrCKY+v1+c6GTIyLFPKufPhuaCAaM2D2UvyOPQ/WcsKMnVVbfbfe/9wzm4 bRgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Make str_supported() take a bool, define it inline, and return string
literals directly. Use a single inline definition for both debug and
non-debug builds.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 445e1403308e..022353f95cab 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -448,11 +448,14 @@ do {									\
 		       __func__, ##arg);				\
 } while (0)
 
+static inline const char * __init str_supported(bool is_supported)
+{
+	return is_supported ? "supported" : "not supported";
+}
+
 #ifdef CONFIG_THINKPAD_ACPI_DEBUG
 #define vdbg_printk dbg_printk
-static const char *str_supported(int is_supported);
 #else
-static inline const char *str_supported(int is_supported) { return ""; }
 #define vdbg_printk(a_dbg_level, format, arg...)	\
 	do { if (0) no_printk(format, ##arg); } while (0)
 #endif
@@ -5798,7 +5801,7 @@ static int __init led_init(struct ibm_init_struct *iibm)
 	}
 
 	vdbg_printk(TPACPI_DBG_INIT, "LED commands are %s, mode %d\n",
-		str_supported(led_supported), led_supported);
+		str_supported(led_supported != TPACPI_LED_NONE), led_supported);
 
 	if (led_supported == TPACPI_LED_NONE)
 		return -ENODEV;
@@ -11515,15 +11518,6 @@ static struct proc_dir_entry *proc_dir;
 
 static bool force_load;
 
-#ifdef CONFIG_THINKPAD_ACPI_DEBUG
-static const char * __init str_supported(int is_supported)
-{
-	static char text_unsupported[] __initdata = "not supported";
-
-	return (is_supported) ? &text_unsupported[4] : &text_unsupported[0];
-}
-#endif /* CONFIG_THINKPAD_ACPI_DEBUG */
-
 static struct dentry *tpacpi_dbg;
 static void tpacpi_debugfs_init(void)
 {
