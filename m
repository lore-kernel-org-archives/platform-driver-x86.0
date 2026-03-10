Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6D439BFEB;
	Tue, 10 Mar 2026 23:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773186029; cv=none; b=d8J0xSPTSul14W8EEKm7LwXqMcNXFDwSz2mxdDEuZZSDg88KK6IfCnOofV7Md0kg8hzOLayq09TqyIDRN7PxOI0au5ZCKiB/yX8XWGsHcdfBcz3Qu+kseRSVAyX1C0yb441LPSDz4rtVPC+1sLAVbOJ0yQhQKaLjHk3wGm3qChw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773186029; c=relaxed/simple;
	bh=DViJhxDLln51KaOp2cOnhA/rF8GsfK+fo5FVkZM5KLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F5gqWBEsiO5O5e2YsRsBWwTYffwUkoM0otfBldGKDA77IknNgE0uqSt1jkBj7eaZUB6/kMM4qUVpEORysqxJ0YiQa9y8tup/GuArfJzljM+YszFI7SD2ZvLQlEDpk8Mg/3cZiqyEWK6ULrRefcV2DpHZiXg4zVeI2dORjfD9jrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=ZYv2kC9V; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="ZYv2kC9V"
Received: from wse-pc.fritz.box (i5C75F5CE.versanet.de [92.117.245.206])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 7AC532FC0052;
	Wed, 11 Mar 2026 00:40:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1773186026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLi4UUi39JcXOpjizNFqhCU13kTBEO41ZOY3W3eag68=;
	b=ZYv2kC9V9moGyHRMKleso7ZRPYSBW0LNVv/O0WGcdanZVG0pcDxYMpi3Zoa9vTynIOSvoo
	BvhNXmIp3iAApoq8pD0Aylz+iJjhfAgE5LLkwvJmceI/MRM2crnmhNnM43a2tZTKnjRl95
	hZsNuKRuV1jgNz/JN1+HksHpyVgMTpI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v5 3/5] platform/x86: uniwill-laptop: Fix XMG Fusion 15 (L19) entries
Date: Wed, 11 Mar 2026 00:34:18 +0100
Message-ID: <20260310234022.2085232-4-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310234022.2085232-1-wse@tuxedocomputers.com>
References: <20260310234022.2085232-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add alternative XMG Fusion system vendor name and clarify edition in ident.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 22ae5fccd6a06..ff9d6a4921a29 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1911,7 +1911,7 @@ static struct uniwill_device_descriptor empty_descriptor __initdata = {};
 
 static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 	{
-		.ident = "XMG FUSION 15",
+		.ident = "XMG FUSION 15 (L19)",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
@@ -1919,13 +1919,29 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		.driver_data = &empty_descriptor,
 	},
 	{
-		.ident = "XMG FUSION 15",
+		.ident = "XMG FUSION 15 (L19)",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
 		},
 		.driver_data = &empty_descriptor,
 	},
+	{
+		.ident = "XMG FUSION 15 (L19)",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+		.driver_data = &empty_descriptor,
+	},
+	{
+		.ident = "XMG FUSION 15 (L19)",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+		.driver_data = &empty_descriptor,
+	},
 	{
 		.ident = "Intel NUC x15",
 		.matches = {
-- 
2.43.0

