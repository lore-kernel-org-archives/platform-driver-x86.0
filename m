Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA14E56A;
	Wed,  1 Jul 2026 16:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924232; cv=none; b=PiNorA+t5bR/zQMa2DsUAlIPpABBaOV7fas9cBt5Ad15WM/dsehd/l/KZs676gDhizGodGlhg3vo6SuNOThcYZt3MBFkvzEbuIQZ1OViOD19vCI87YgE8aQFrwMrv7yedXvNqS8BSIPRizPpchvQgMEdeRK721c+HIcdBj26aJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924232; c=relaxed/simple;
	bh=HLQVwlvOVl5SsVsucU4A12zdK+kVXPFc10+6Cu8ekL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axDgbuUg819kbcnHCmmb88yW1307ldHvUlXSBR7MX86R0AtWhgAvv/hIYmEbmiUYdmcGluHMy5+9VoMCSSniMPiHIAxZL+9sdbGtxmJP2TxxHfC3nH7056aHxPzGtWayBz5bc1ZJXr77dZFN+N+1zDdvm2qT7tM7/PPPSboabdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=DEEvbion; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="DEEvbion"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D6CB084142;
	Wed, 01 Jul 2026 18:43:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvNlrUplJSlG; Wed,  1 Jul 2026 18:43:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1782924228; bh=HLQVwlvOVl5SsVsucU4A12zdK+kVXPFc10+6Cu8ekL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DEEvbionk7nGEOUnijccNGr/BKHzHT7zf7R2Pw+fVsGYN1fgtortvMpCX572p0V+9
	 kWVayCnI9htaSWAijZOKFYFyoYL82NJnoeRyJF0UsjW9cTw4/gG0GWXi4Htdng6ZaS
	 VNxLByRuiPHWTgT7sWBBK6Fj2Y/pboSMwG/yWGePeY0IwdDuvPBnk7yo4F/8yW5FHz
	 YX4UiQoPjBqzI7kL1anGijbFbAWrAjEUCZW+Sz7PCYKqgFIW7PDpY36Jho7CCEZN3f
	 +xJIIVb5m89QraBNq1tZ0Igdqbs3yl8qngD8K4J1iEdkB0bDtMDzVfTGM0WzbluhX7
	 yX5KCiLIkWHIQ==
From: Marco Scardovi <scardracs@disroot.org>
To: ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v2 1/1] platform/x86: asus-armoury: fix Use-After-Free and memory leak in driver init
Date: Wed,  1 Jul 2026 18:42:03 +0200
Message-ID: <20260701164333.5219-2-scardracs@disroot.org>
In-Reply-To: <20260701164333.5219-1-scardracs@disroot.org>
References: <20260701164333.5219-1-scardracs@disroot.org>
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

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
v2:
- Restructure init_rog_tunables() to use local pointers and defer assignment
  to the global struct until all allocations succeed, eliminating the need
  to set global pointers to NULL on error.
- Use a goto-rollback pattern in asus_fw_init() for cleaner error handling
  as requested by Ilpo.

 drivers/platform/x86/asus-armoury.c | 38 ++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 495dc1e31d40..ea53a005bb25 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -989,7 +989,7 @@ static int asus_fw_attr_add(void)
 /* Init / exit ****************************************************************/
 
 /* Set up the min/max and defaults for ROG tunables */
-static void init_rog_tunables(void)
+static int init_rog_tunables(void)
 {
 	const struct power_limits *ac_limits, *dc_limits;
 	struct rog_tunables *ac_rog_tunables = NULL, *dc_rog_tunables = NULL;
@@ -1000,24 +1000,23 @@ static void init_rog_tunables(void)
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
@@ -1060,13 +1059,12 @@ static void init_rog_tunables(void)
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
@@ -1106,15 +1104,16 @@ static void init_rog_tunables(void)
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
@@ -1127,10 +1126,21 @@ static int __init asus_fw_init(void)
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

