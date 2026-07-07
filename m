Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE6B442107;
	Tue,  7 Jul 2026 21:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783460282; cv=none; b=kmj58EQiG5hFT+5s9zhh1mDzlQI1dyFaGm9/0ogeCDaYkpeugbTITOBhpxCXHiiUXZJU2EmCbEwPBVoyeehj7H4kIOoEKROpaYVhpvT+YdNBvqK7yjAzxfp6bHWQxtOssksi8ZmSFuMAIItntxoeQHscSK9p804zQfE/ppLt+D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783460282; c=relaxed/simple;
	bh=C+kA2asszLe8Cfci5JMxy/ujzhB2wcTJB3wsGeyt2dY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxWXmocLpqYk2z9kxLUzz2bnnfkbK0+mzxMI+1sM+9Z/7ONMAxQeOGxfFwiiz0Y9knvynVW+fQ1ptpQFnpKXRIdFd0E5JdKVCR7/rlFpDGkExFaDq9sz3fs4sMZFIbdcE86J/0fO2clVw9PMsMK0XZBlztzZAILt6OF3jBvT2yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=VuLzZunJ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="VuLzZunJ"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 74F22843FA;
	Tue, 07 Jul 2026 23:37:57 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ydIIcKReQRBB; Tue,  7 Jul 2026 23:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1783460276; bh=C+kA2asszLe8Cfci5JMxy/ujzhB2wcTJB3wsGeyt2dY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VuLzZunJ+oYvOaHilcvmJ8mmFALhf6s/gdNy+CY0UHxgD0RUdzb3/VzkQIYz7khZx
	 fOJU4mt8hPXSroawV8bLCvOAEMzXXvCfALujpVNesBZrLRwVT0ESGOJcNeYY2zEixx
	 sE/Ln9g62r/71rzyMtrGZ7y9dc+Vvc/c2wAFP2xW4nHc97YMb4Azq3Kg2CzzAKuhTq
	 3hX6KSUymRY01D62iH1MG2j1mgIkx9L9CG+4pWjYMp+Lo/a/PfIx97cVpRdsVjGTPI
	 CzECaK7C5Grayp0o7CuLcYTAJWnk17pcDIBxePFuUKLnrgBr3tSt4+afxh45cOojnd
	 6ptE8b3RwwM4A==
From: Marco Scardovi <scardracs@disroot.org>
To: scardracs@disroot.org
Cc: corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 1/2] platform/x86: asus-armoury: fix Use-After-Free and memory leak in driver init
Date: Tue,  7 Jul 2026 23:36:11 +0200
Message-ID: <20260707213741.6515-2-scardracs@disroot.org>
In-Reply-To: <20260707213741.6515-1-scardracs@disroot.org>
References: <20260707213741.6515-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In init_rog_tunables(), if dc_limits are defined and allocating
dc_rog_tunables fails, the already allocated ac_rog_tunables gets
freed but the pointer stored in
asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] is not cleared. Since
init_rog_tunables() returns void, the driver initialization continues,
which can lead to a Use-After-Free (UAF) when asus_fw_attr_add()
accesses the freed AC tunables pointer.

Additionally, if init_rog_tunables() succeeds but asus_fw_attr_add()
fails, the allocated tunables are not freed, resulting in a memory leak.

Fix these issues by making init_rog_tunables() return an error code and
propagating it in asus_fw_init(). Defer setting the global pointers in
asus_armoury.rog_tunables until both tunables have been successfully
allocated. If asus_fw_attr_add() fails, release the allocated resources
using a standard goto rollback block in asus_fw_init().

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.c | 38 ++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index f2a880eb0cdf..fa7d0485c712 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -1007,7 +1007,7 @@ static int asus_fw_attr_add(void)
 /* Init / exit ****************************************************************/
 
 /* Set up the min/max and defaults for ROG tunables */
-static void init_rog_tunables(void)
+static int init_rog_tunables(void)
 {
 	const struct power_limits *ac_limits, *dc_limits;
 	struct rog_tunables *ac_rog_tunables = NULL, *dc_rog_tunables = NULL;
@@ -1018,14 +1018,14 @@ static void init_rog_tunables(void)
 	dmi_id = dmi_first_match(power_limits);
 	if (!dmi_id) {
 		pr_warn("No matching power limits found for this system\n");
-		return;
+		return 0;
 	}
 
 	/* Get the power data for this system */
 	power_data = dmi_id->driver_data;
 	if (!power_data) {
 		pr_info("No power data available for this system\n");
-		return;
+		return 0;
 	}
 
 	asus_armoury.requires_fan_curve = power_data->requires_fan_curve;
@@ -1033,11 +1033,10 @@ static void init_rog_tunables(void)
 	/* Initialize AC power tunables */
 	ac_limits = power_data->ac_data;
 	if (ac_limits) {
-		ac_rog_tunables = kzalloc_obj(*asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC]);
+		ac_rog_tunables = kzalloc_obj(*ac_rog_tunables);
 		if (!ac_rog_tunables)
-			goto err_nomem;
+			return -ENOMEM;
 
-		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] = ac_rog_tunables;
 		ac_rog_tunables->power_limits = ac_limits;
 
 		/* Set initial AC values */
@@ -1080,13 +1079,12 @@ static void init_rog_tunables(void)
 	/* Initialize DC power tunables */
 	dc_limits = power_data->dc_data;
 	if (dc_limits) {
-		dc_rog_tunables = kzalloc_obj(*asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC]);
+		dc_rog_tunables = kzalloc_obj(*dc_rog_tunables);
 		if (!dc_rog_tunables) {
 			kfree(ac_rog_tunables);
-			goto err_nomem;
+			return -ENOMEM;
 		}
 
-		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC] = dc_rog_tunables;
 		dc_rog_tunables->power_limits = dc_limits;
 
 		/* Set initial DC values */
@@ -1126,15 +1124,16 @@ static void init_rog_tunables(void)
 		pr_debug("No DC PPT limits defined\n");
 	}
 
-	return;
+	asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] = ac_rog_tunables;
+	asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC] = dc_rog_tunables;
 
-err_nomem:
-	pr_err("Failed to allocate memory for tunables\n");
+	return 0;
 }
 
 static int __init asus_fw_init(void)
 {
 	char *wmi_uid;
+	int err;
 
 	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
 	if (!wmi_uid)
@@ -1147,10 +1146,21 @@ static int __init asus_fw_init(void)
 	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
 		return -ENODEV;
 
-	init_rog_tunables();
+	err = init_rog_tunables();
+	if (err)
+		return err;
 
 	/* Must always be last step to ensure data is available */
-	return asus_fw_attr_add();
+	err = asus_fw_attr_add();
+	if (err)
+		goto err_free_tunables;
+
+	return 0;
+
+err_free_tunables:
+	kfree(asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC]);
+	kfree(asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC]);
+	return err;
 }
 
 static void __exit asus_fw_exit(void)
-- 
2.55.0

