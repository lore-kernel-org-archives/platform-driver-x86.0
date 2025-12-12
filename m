Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1202F49FE;
	Fri, 12 Dec 2025 17:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765562322; cv=none; b=Bp/44RbZ3/c24Tb1o0H0GKHq9aYL5O74XvmQqgokrXFPHTuVBZgn579lptyYFAD579SMI3ss9/wlFF36vGbcn/bkaACRQklK5a6KQKP6SYndMzr1K5g3TRXWfb+hVsZnon2TPslrzEoOFPVGNkhs5avPc8aQ7WXyDPQh2kG9l9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765562322; c=relaxed/simple;
	bh=JJMej69PR6nYZaJaGqQWOAi/xWm8BuApgwdfK6cJA4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U7PUI3Xlb+0zImJ3KwozF8/KfOZJvbP8X7v0yjH5DKOEWlqeJHAltaOoCJDVkuj8pUsMXm/I80PRuuc5E8/ZxBuHzs9GpZZAl9x4m3/NPIxRj3V4M7tpEGIIuqZmX8gF5voHyEBXOg1JbtfDgeTbu5tudBDTDdn7GAWisBejYHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=T6qsjMEp; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="T6qsjMEp"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 8C3B62FC0059;
	Fri, 12 Dec 2025 18:58:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1765562311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7ggCn4YKiWKPsPqK3QXYlDWWVZjwHkPlkXuOilEluvI=;
	b=T6qsjMEp5Ze5E30nOqKHIlfHsZ11sO5qHOgXv5QM/2HN9f3NtfpFZQh+Ni8BXlu2HWXeLu
	3XuxNI1ktqQ4KMNEBx5MZE/s0PwrS0xw3AljGpGConLIO/rixbz9UBiOtSHiNu94WcB6Ud
	3j++CRpVUwNzI/qy8FLoWdHIb2SIEew=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/uniwill: Add TUXEDO Book BA15 Gen10
Date: Fri, 12 Dec 2025 18:58:05 +0100
Message-ID: <20251212175828.660359-1-wse@tuxedocomputers.com>
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
 drivers/platform/x86/uniwill/uniwill-acpi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index bd7e63dd51810..9c598389a8f0b 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1844,6 +1844,13 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
 		},
 	},
+	{
+		.ident = "TUXEDO Book BA15 Gen10",
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

