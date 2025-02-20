Received: from mail.d-sys.org (70-31-180-213.sta.estpak.ee [213.180.31.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C151B4243
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Feb 2025 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.180.31.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066045; cv=none; b=f/Pr1xB6C3Np2f4bYMcsdBgjZNrVjP9GhnW3wmGjt/252cQc4Ywq0JdNQVk/VoO+FNUgR4HrFNXim2UDGHC042QY3rTVGvl54vi7E9BzOTQXzz2WXTvgGun+h4XPm5LhAbFc9az4LH2kd4gStBLmJp4gW1+q1QzcnXDPAUKck14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066045; c=relaxed/simple;
	bh=EuYubKaDRmvGka64CbA9o8/Yu+1m8FNddelZ5w9YKiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lKZzE4Nf4MRtLgxtbIvqTf2Zf758+QPK1rVYfZDSIZ2aXGVmR/24PMHQIkgAUHIKuyvcCyvlK8GuSHrwJNtcYgYKvi/74nu/As6spB3PxdTxzc88sOJ9j5ioBx6RVyO9+xBFitay5afRBpbzxpsOJM9796iZDbLsa1uKdr/g4KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-systems.ee; spf=pass smtp.mailfrom=d-systems.ee; dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee header.b=Xg5ZClCZ; arc=none smtp.client-ip=213.180.31.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-systems.ee
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-systems.ee
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee header.b="Xg5ZClCZ"
Received: from mail.d-sys.org (localhost [127.0.0.1])
	by mail.d-sys.org (Postfix) with ESMTP id 5394460A53;
	Thu, 20 Feb 2025 17:40:37 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-systems.ee; s=mail;
	t=1740066037; bh=EuYubKaDRmvGka64CbA9o8/Yu+1m8FNddelZ5w9YKiE=;
	h=From:To:Cc:Subject:Date;
	b=Xg5ZClCZuwLLMVLC0pl2vfl6ACa6WeZCXVeVsk04oIZbkNuke+7w8Rd8wMA6BwGUJ
	 mtH0sGWrQsfU2ay2RvkyE8/VGq8rQtCcEYg/RojpnBJ4cAECwDR1cjuv/SzKc3bkPm
	 q4MihatKeWOu/XHKDuqnI4Uea9mUBIDJQkzahLccxeN2nm6Yn7csRqb9Cym1dAUYfL
	 73tyn1LovDpYDKVadoD7bpCWv3a7jeHXs7jS398T+jMAHTdbCHfokzOY/Ohf7AjYPy
	 vsWduXadNqeBfobcftsIhsH0m9DvsyhBWw93gczaNp7UgIJlJwonC7UwZC8AlMlfbP
	 SpvanH6eMfHGA==
Received: from WSMF.dh (unknown [10.255.0.244])
	by mail.d-sys.org (Postfix) with ESMTP id 50F2B60A41;
	Thu, 20 Feb 2025 17:40:37 +0200 (EET)
From: Dmitry Panchenko | d-Systems <dmitry@d-systems.ee>
To: platform-driver-x86@vger.kernel.org
Cc: Dmitry Panchenko <dmitry@d-systems.ee>
Subject: [PATCH] platform/x86: intel-hid: fix volume buttons on Microsoft Surface Go 4 tablet
Date: Thu, 20 Feb 2025 17:39:31 +0200
Message-ID: <20250220154016.3620917-1-dmitry@d-systems.ee>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP

From: Dmitry Panchenko <dmitry@d-systems.ee>

Volume buttons on Microsoft Surface Go 4 tablet didn't send any events.
Add Surface Go 4 DMI match to button_array_table to fix this.

Signed-off-by: Dmitry Panchenko <dmitry@d-systems.ee>
---
 drivers/platform/x86/intel/hid.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 927a2993f616..88a1a9ff2f34 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -139,6 +139,13 @@ static const struct dmi_system_id button_array_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go 3"),
 		},
 	},
+	{
+		.ident = "Microsoft Surface Go 4",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go 4"),
+		},
+	},
 	{ }
 };
 
-- 
2.43.0

