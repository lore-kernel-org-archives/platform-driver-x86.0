Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3632F8EBE
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 01:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778290274; cv=none; b=B0OBMC69spQ2vAUWk7cqtNKQBt9eCV08m271KKzn3I91M5P9yEbLWlaZvlL6BId/j3N8wGAU40y8vLidO1Gpr20VrQ0XWGXDwUXv4vCIoDOWOBuBq8dUfRY61+1bEuCbf8YVDBsDkuXw/ez0pEXYz8zpuhepaGj73XEcv8sIYAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778290274; c=relaxed/simple;
	bh=acFu2Xjpg4pZSrD6LRRLywAPJZEwO4kgZbcrQJvbu1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L742pcJPNt8xxkT4lz33U6GFWVLqVB5OXt22l2OZGod6lD+Uuzk6f48E4BKyTfw453cKsYrAksd2yeT1pamLNsZ9w+rah5yCa9cCXoHvbHysmfuW6Q+xMyrWt357kCd4H0FeLOFdvv85vs0YCWB87SkB7M/k0KfQcZhecQcJGuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=F9Cp6ehs; arc=none smtp.client-ip=185.125.25.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="F9Cp6ehs"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gC7jn3SRZzQ02
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 03:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1778290269;
	bh=L27OgPutkmm8ASZUOGdctMKSqc+pMmXtRa5EtMnmzzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F9Cp6ehsq40CXCE1/dz0rwNtm9J14saFFcbwFQa8anfR9YZNF1qFJgddEW3kyzTp8
	 cj/1IDgvdChoJSL44xFWNvTOQ2QRUAYF0lZ91/MoViYy+qsAgQxsyrpqtbLiRHHG3u
	 G1PQLZkehWBPT0/WwqQTVdw12uywZGwNO3+0lzi59HHpn/98126wslJZMJMTk/txGe
	 mOBlOg65Ep1s/yNgmcTCuHB8+IB3Kn2oioVIS6oG703hpmlL4FIBZwEQ1+fNr6cyHH
	 Bnx7K/nHExMjIY3OmlB3c1LjQVN+ikgJSCf+P7xsglZlF/VJqfnslizRM4gmnjxcMq
	 RJ4MxqPrAAjVw==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gC7jn05MGzHcM
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 03:31:08 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Sat, 09 May 2026 03:31:08 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH v2 3/5] platform/x86/amd/pmc: Add delay_suspend module parameter
Date: Sat,  9 May 2026 03:31:02 +0200
Message-ID: <20260509013105.816339-4-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260509013105.816339-1-daniel@gibson.sh>
References: <20260509013105.816339-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Enabling the new delay_suspend module parameter delays suspend for
2.5 seconds which is known to help for some AMD-based Lenovo Laptops
that otherwise failed to send/receive events for key presses or the
lid switch after s2idle.
Apparently the EC needs to do some things in the background before
suspend or it gets into a bad state.

There are many reports of AMD-based laptops (mostly but not exclusively
IdeaPads) about similar issues on the web; this parameter gives
affected users an easy way to try out if their issues have the same
root cause and to work around them until their specific device is added
to the quirks list.
I added a note to the parameter description encouraging users to report
their device so it can be added to the quirks list, inspired by a
similar request in parameter descriptions of the ideapad-laptop module.

The module parameter can be set to "1" to explicitly enable it,
"0" to disable it even on devices that are assumed to be affected,
or -1 (the default) to enable it if the device is assumed to be affected
(according to fwbug_list[])

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221383
Signed-off-by: Daniel Gibson <daniel@gibson.sh>
---
 drivers/platform/x86/amd/pmc/pmc.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 6bafd8661d68..2d3d180c15d2 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -16,6 +16,7 @@
 #include <linux/bits.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/dmi.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/limits.h>
@@ -89,6 +90,11 @@ static bool disable_workarounds;
 module_param(disable_workarounds, bool, 0644);
 MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
 
+static int delay_suspend = -1;
+module_param(delay_suspend, int, 0644);
+MODULE_PARM_DESC(delay_suspend,
+		 "Delays s2idle by 2.5 seconds to work around buggy ECs, often causing keyboard issues after suspend. 0: don't delay, 1: do delay, -1 (default): let amd_pmc decide. If you need this please report this to: platform-driver-x86@vger.kernel.org");
+
 static struct amd_pmc_dev pmc;
 
 static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
@@ -625,8 +631,23 @@ static bool amd_pmc_want_suspend_delay(struct amd_pmc_dev *pdev)
 	 *
 	 * See https://bugzilla.kernel.org/show_bug.cgi?id=221383
 	 */
-	if (!disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev)) {
-		dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
+	if (amd_pmc_quirk_need_suspend_delay(pdev)) {
+		/*
+		 * delay_suspend=1 force-enables this, otherwise it can be
+		 * disabled with disable_workarounds or delay_suspend=0
+		 */
+		if (delay_suspend == 1 || (delay_suspend == -1 && !disable_workarounds)) {
+			dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
+			return true;
+		}
+		dev_info(pdev->dev, "Not delaying suspend because of module parameter, even though your device is assumed to need it!\n");
+	} else if (delay_suspend == 1) {
+		dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
+			 dmi_get_system_info(DMI_SYS_VENDOR),
+			 dmi_get_system_info(DMI_PRODUCT_NAME),
+			 dmi_get_system_info(DMI_PRODUCT_FAMILY),
+			 dmi_get_system_info(DMI_BOARD_VENDOR),
+			 dmi_get_system_info(DMI_BOARD_NAME));
 		return true;
 	}
 	return false;
-- 
2.48.1

