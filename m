Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36101E86E;
	Fri, 12 Dec 2025 18:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765562607; cv=none; b=DAtXgpnWDWF6MAqngnfYiWyflzdIC6x82lksC0gpSvtPIO//P0gHWNjkkU0Jkg3p6cv+YWhKzbrUAxuGDS3QJqs1MIOfzgD+Ivnfn0OgMDPHSkvVCxO+hj0h3EIbHgUG5hAmqYTCVictksL/IlywnQvPch1019bO3hWnyC2Jiqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765562607; c=relaxed/simple;
	bh=oPkjB3e5PDKXoBlPn7faUmXH29TO0WHbXeAI+4x6oCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TkJtisbrVZ8dw/2IRtypSVHeFSyYHZfuzXd/uGtlOJIus33Rd1aBYlRqdnrt37Ak+znQ1W+4b7OYK/eDhEaTXyhgtJ3nW3oxghnz7qrpsh1R1667tiM7zvWuFvu/tLvL4FL+Yq4WN/TnzYxjUGQrqU7d1zhA0JNQ/Da7JrMV+30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=KOMON+o3; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="KOMON+o3"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 45B012FC0052;
	Fri, 12 Dec 2025 19:03:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1765562601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bvFuWbEYb8B/H+iu8J4E4uvN06ZkuOaozBN6xmRUOvI=;
	b=KOMON+o3l9HEPHnrAo4QwlXnK/jhUwszK6Di3cc5WXla51V8d0r7B8yDHK8+eyrD89NFG1
	R/u3PDiUOIu9VwWhjF8R4L3uAzJq83wQ2uAoFWCDV0QQ8pjpSCNYDfIlI/dk3JVFwwYVAp
	aRX1ISf7dvf/BMtGpoq8jeHiQaiWg/g=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86/uniwill: Add TUXEDO Book BA15 Gen10
Date: Fri, 12 Dec 2025 19:02:22 +0100
Message-ID: <20251212180319.712913-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In my previous patch I missed the TUXEDO Book BA15 Gen10. Adding this now
also to the list of supported devices of the Uniwill driver.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
V1->V2: Slight .ident change to be consistent with the rest of the entries

 drivers/platform/x86/uniwill/uniwill-acpi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index bd7e63dd51810..0f935532f2504 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1844,6 +1844,13 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
 		},
 	},
+	{
+		.ident = "TUXEDO Book BA15 Gen10 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5PU1G"),
+		},
+	},
 	{
 		.ident = "TUXEDO Pulse 14 Gen1 AMD",
 		.matches = {
-- 
2.43.0

