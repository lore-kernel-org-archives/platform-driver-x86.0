Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60422346E6D;
	Tue, 24 Mar 2026 18:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774375485; cv=none; b=CQxBXaxq2nBHNWl7zrU1FmBlGUpG6RHxouQsV4FS5Zu9QjrqrOHY3o4/8ZAsXN7vUyCFcZwKgZT5lBt9VSQIDHWUReHR3sw8in7JhD5A02GKdVzblviX/DhzcXdeDnOq8+ZwbgAkw+W13x6/rL9vPEYvlTIGo3aeJHHACt0o9Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774375485; c=relaxed/simple;
	bh=eYKskTnAnIIrj06OIOUUX8ztyKg2Eis8Ln5uj2prBxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMHI4rKyRTfy5PxnDJ5apgO4yCPkKCQ3KjNMgz7C8/s241QY6JeVASgC8dZr5mL42kT1LabhpmpXDuSVWxpJOIhxVFMOYUmsNByaKhGp28HW6OAh6hqEo3Al+005SQ2zkPh3szz4ikhZfE/4UsA0klJb8W8CjmR6hZ6fwwbPfec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=lKSwwyt0; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="lKSwwyt0"
Received: from wse-pc.fritz.box (i5C75F50F.versanet.de [92.117.245.15])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id A7E022FC021A;
	Tue, 24 Mar 2026 19:04:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1774375482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfLRm/mh8iRdR/xQaG6D4WBVu4Cl7joJ7iRzsRef0y4=;
	b=lKSwwyt02kWVZ/r8WbT8HeriecXFGguIQ4numv6gyOMUdZ0QRFEmcdZtiCCm77sQ1E03x7
	IcjaxhQNdkvzzjMKT66Q8WQ6Q4CfypqV1wfD+Mad/lJnEBQiXY9YaYAqYcHLx2W5/bMcIz
	PiQHn4sYni8oyUe7gcMQpI8schUWayg=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v7 3/5] platform/x86: uniwill-laptop: Fix XMG Fusion 15 (L19) entries
Date: Tue, 24 Mar 2026 19:02:38 +0100
Message-ID: <20260324180437.69594-4-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324180437.69594-1-wse@tuxedocomputers.com>
References: <20260324180437.69594-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add alternative XMG Fusion system vendor name and clarify edition in ident.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 3a29fa8c54a00..3d970611edd51 100644
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

