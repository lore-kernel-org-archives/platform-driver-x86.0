Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1293328F2;
	Mon, 17 Nov 2025 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763385951; cv=none; b=rHybAgs4RDDOujByaslqmJhi8TwOzEsHx0P+dzU1mJcGw3o5MVq6qSQssVEj0QLn2CTERjZoEbB27ckqW8Ee8O3+Ry73u54bWzbQiz1tyqfwJSkhC69M9whL49lFvlNXp05mw86pjw65t4L+CbgZMd2WXrt6DO6wtWcQdq/dtik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763385951; c=relaxed/simple;
	bh=Bdt0IJ6GEEdDiqtpNpi4fK/5Aim/c3WyMcOKp4lt9Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ClGsu4MxKa62Dkt93YZ/EmzukTMDWgWpAY3F8bqgFUcWvjQIZVvt3e5oyE+XRP2cihArCTqdZXj9reBLtrGg/yVp2EPQdDQLlJQKkymr2M4izGCjsFz60YLkwz66IlosdTce2JX9wHFXOvAev3GQcKHBWaidFBvhhOHc6RpmOYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=LeDMzBpP; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="LeDMzBpP"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 1949E2FC005D;
	Mon, 17 Nov 2025 14:25:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763385941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6LxhFjiKunbhiTXLOed3Qvlv9XVkd1JWfBr4qSjK2eg=;
	b=LeDMzBpPMui/bskTjZM38waAenArLqWn5KrLn2Ddg+f20lyg9QtjLJXCHCfqocklfs8KdF
	J5f7r8S5wdgBi2V75L2qhCtuw0Q4NSC6Ypt0ycSHKLMO0sG2soeIRdJt0eeZ0N01xOcMOL
	wgBeJ1Pp0OQA9UhFgD23cYX6/Qwu+aU=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH 6/6] platform/x86/uniwill: Set cTGP support based on EC for TUXEDO IBP Gen7 MK1
Date: Mon, 17 Nov 2025 14:24:03 +0100
Message-ID: <20251117132530.32460-7-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117132530.32460-1-wse@tuxedocomputers.com>
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TUXEDO InfinityBook 14 Gen7 shares a boardname between the variant with
and without an NVIDIA GPU.

Dynamically read which variant is present from EC to determine cTGP
support.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 22 ++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 15a94c256f728..f6b24d2c28b89 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -88,6 +88,9 @@
 
 #define EC_ADDR_GPU_TEMP		0x044F
 
+#define EC_ADDR_SYSTEM_ID		0x0456
+#define HAS_GPU				BIT(7)
+
 #define EC_ADDR_MAIN_FAN_RPM_1		0x0464
 
 #define EC_ADDR_MAIN_FAN_RPM_2		0x0465
@@ -1406,6 +1409,23 @@ static int uniwill_ec_init(struct uniwill_data *data)
 	return devm_add_action_or_reset(data->dev, uniwill_disable_manual_control, data);
 }
 
+static int quirk_ibp_gen7_ctgp_supported(const struct dmi_system_id *d)
+{
+	struct uniwill_data *data = container_of(d, struct uniwill_data, id);
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(data->regmap, EC_ADDR_SYSTEM_ID, &value);
+	if (ret < 0)
+		return ret;
+	if (value & HAS_GPU) {
+		data->id.driver_data =
+			(void *)((unsigned long)data->id.driver_data |
+				 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL);
+	}
+	return 0;
+}
+
 static const struct dmi_system_id uniwill_dmi_table[] = {
 	{
 		.ident = "XMG FUSION 15",
@@ -1462,12 +1482,12 @@ static const struct dmi_system_id uniwill_dmi_table[] = {
 		.driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
 	},
 	{
+		.callback = quirk_ibp_gen7_ctgp_supported,
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
 		},
-		.driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Book Pro Gen 7",
-- 
2.43.0

