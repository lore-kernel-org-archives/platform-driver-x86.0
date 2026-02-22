Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43EC2248B4
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Feb 2026 22:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771798363; cv=none; b=FFbEo7dJqVJbn1p7e9jmu0Y7BptOOtwqR6gWBvmgdx9UL81eOi5eFaT+V6ymllYVRUx+1OlW5AbxJYKaIcBGXN73EcLRPz77EJULqCkBM834Bc2d0voxn2OXT8jtIFIHnqXk+Syau9YzfLbtfguRiYJMF1smro0vCAf3qz8p0u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771798363; c=relaxed/simple;
	bh=OY9S36OVUhW8NrvBWMUeJc3VYjxwH1+4fan5AwSBKxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KJ/yyckr/dQdD2+wggkVQssTCkpM3/pb99ynLzZ2t2OPMDOaYiGiTjrtwqw2QxcHleqFonft5GtvHjF8vdHaOThHL7IpJVyaEQj0hXlTH/Qvu2yt05pCcbtu+Z1QgLHmbrKW4BLn2XJW0jWv1PAMIhgxGXNuFV+6mRx2R9lnCIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=jD0BF19i; arc=none smtp.client-ip=193.222.135.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="jD0BF19i"
Received: (wp-smtpd smtp.tlen.pl 29550 invoked from network); 22 Feb 2026 23:06:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1771797960; bh=NdqiNezNWEKpNA5f3+/gyOtctD2MUwRNTJT4wt2RvWk=;
          h=From:To:Cc:Subject;
          b=jD0BF19ibDs/flWUISfvmUO+9t7m+MctEx0oFYJZCHSKMccBBmCsCPFgK46lIRxwv
           OgPHJJjOaC7S0+NI2lKSOmXrWhNLtukwp1vMCJaeNLzvj4pSxUWF7XsAU017MUWg9a
           yf/EJ4IZgjvzci3wJqAMsHuDGc0Di3ebKZIJhSZ9wQuGgJA6OBqXcU8E+uZF3XLJzt
           +zJxeUXLyUFxIwYzkFGWbs5zGxweNB/vhLvt5/kQQKhhTk0jc08lTtvYUnARL8aTmR
           o0Xw2pGaJ1vdkoAxFZuxY4ez2FGJtCqGzz6YyPVR+XYIiaWcIkUjgv8zo8fZIfwBgF
           0mCYDdkU++n9Q==
Received: from unknown (HELO localhost) (phofman@o2.pl@[176.114.234.141])
          (envelope-sender <phofman@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <corentin.chary@gmail.com>; 22 Feb 2026 23:06:00 +0100
From: =?UTF-8?q?Pawe=C5=82=20Hofman?= <phofman@o2.pl>
To: corentin.chary@gmail.com,
	luke@ljones.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Cc: benato.denis96@gmail.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pawe=C5=82=20Hofman?= <phofman@o2.pl>
Subject: [PATCH] platform/x86: asus-nb-wmi: add UX7602ZM DMI quirk
Date: Sun, 22 Feb 2026 23:05:26 +0100
Message-ID: <20260222220526.285327-1-phofman@o2.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: o2.pl)                                                      
X-WP-MailID: 85ca3b95b8e54504d990b35c49aec5bc
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000001 [QaLg]                               

---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index a38a65f5c550..19cd7ea13fef 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -553,6 +553,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_z13,
 	},
+        {
+                .callback = dmi_matched,
+                .ident = "ASUS Zenbook UX7602ZM",
+                .matches = {
+                        DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+                        DMI_MATCH(DMI_PRODUCT_NAME, "Zenbook UX7602ZM_UX7602ZM"),
+                },
+                .driver_data = &quirk_asus_zenbook_duo_kbd,
+        },
 	{},
 };
 
-- 
2.51.0

