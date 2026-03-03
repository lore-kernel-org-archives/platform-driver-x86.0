Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10723845B0;
	Tue,  3 Mar 2026 22:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772578490; cv=none; b=c215+pYb1NKfGaNeYIGaKk+eA0wO7yE/4jjI3g4OOW2G+Ci7xJxAcP4h3IQM7zJA4v/pSSPLsMhDW/x1VOw5opyIDh8nxsfEabDzn6IjVuzUbZyDRLcAiotyGHGcMtDwCVmFwpuBfK2Fusl9lQLalOYv7jEtfFcRXgPyFxzGKzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772578490; c=relaxed/simple;
	bh=tGbY878cYocd5rxkSCE9wodIx14OlNg34VX3mLvcaP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LSC36iySsyV7jbY1DMYIq+V5z6D9NjjbmX8K+07BogdobfNmDSCjMwrCDcOfFWsUURbuSAvYEQEkEAwsndBgQHOh682L/ht6m+s3wfns5AHon84qZZyAOoX3p7P+i+m3qmHgVzdGLk6HaeJ9TSXhWKUFYNvfSmGCr4kIRq4ECu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=LP9ph36g; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="LP9ph36g"
Received: from wse-pc.fritz.box (i5C75F679.versanet.de [92.117.246.121])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 2018A2FC0217;
	Tue,  3 Mar 2026 23:54:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772578487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VJTnts3G3vPZr3uZnNUMK2zO8ZKjjtmrL5s8XkOGPUM=;
	b=LP9ph36gWeUyaP6rgFTItgpZDWMYDQd3teFo7yhlF+MlZ3b7lEiUa5uS4osGXGfFASFO+D
	nh6FgsBU7qa7OpiDCHuYlK4mHp/MeUgp+UnrXRaz8cOYT6QLBTDO08hVsMWvWk/s81171P
	b3+sS6BZWLCxM3D/YU3QJAsea7IGwTI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v4 4/5] platform/x86/uniwill: Readd Schenker system vendor for XMG FUSION
Date: Tue,  3 Mar 2026 23:54:10 +0100
Message-ID: <20260303225440.504358-5-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303225440.504358-1-wse@tuxedocomputers.com>
References: <20260303225440.504358-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Readd entries with Schenker system vendor for the XMG FUSION, I'm not
entierly sure if this combi exists, but to be on the safe side to avoid
regressions.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 83c60ac6d2fdd..56504e06cfb71 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2008,6 +2008,22 @@ static struct uniwill_device_descriptor pf5pu1g_descriptor __initdata = {
 };
 
 static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
+	{
+		.ident = "XMG FUSION 15 (L19)",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+		.driver_data = &lapqc71a_lapqc71b_descriptor,
+	},
+	{
+		.ident = "XMG FUSION 15 (L19)",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+		.driver_data = &lapqc71a_lapqc71b_descriptor,
+	},
 	{
 		.ident = "XMG FUSION 15 (L19)",
 		.matches = {
-- 
2.43.0

