Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121C730F7FA;
	Sun, 14 Jun 2026 16:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781455059; cv=none; b=MNM3kcJmmOnVXEYVDUHyXIApqqbHVws8xdxqcveLRuxT4FHGgxn52rwew39pP6dx/37TfncnG9wnBfJ93gVsVCknup32IDgGLPocj0nY+qhbxbAIglr0BiFqx31cunfmjSDzlXkKL1nqURg2ENBXvy0QasX8L5bNiLbZtoVUz6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781455059; c=relaxed/simple;
	bh=kTQ89Hcpv9MLdNs0Vr2yGipwFtxLTcG8AS7qnlobxk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ho9EpH+SSU/Byh0ii6Vwh9FwiIKIb5mGk6+2VkmJKwJ5TJS03lYMC8GZxCjSuPc7ToWX7+AWRajSVZfgalQptkT3u9dOLjD/rxqg/V1AzjuFO5abaPrU6WTLFNyt8lTYjv3Ayo0lSeH9mmwUQKqTrfZtIvD+AviTW71iZyfE7Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=QFcgcNed; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="QFcgcNed"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C2EEB26E9D;
	Sun, 14 Jun 2026 18:37:33 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGAI97sKC1Li; Sun, 14 Jun 2026 18:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781455053; bh=kTQ89Hcpv9MLdNs0Vr2yGipwFtxLTcG8AS7qnlobxk8=;
	h=From:To:Cc:Subject:Date;
	b=QFcgcNedY3DEVRTojTRPObAr/bc6j6hWdPB3CbhINL9BkB51Q+ia/2MiHNd5g5no0
	 VA6mmMlJSMHB1z7CBMOYKd6o5NG/oNrIHrtqv35CPO1XKhFCZ0JVt4pVnI8t4STc2u
	 4kUTKjN7SFm32+V4bO/T+zd8UForOFzpR6OaGW3P615zd/YaJp43gTe5qg29l9ubc5
	 IVTyNr3f/77x2eKPePUK3LnbKL6eu5ovZhW8ySIbcpoquq6a9rF0i8/ZTcUjuoJLGF
	 ulayJjlD6zzqHPhVqJBeeqz3eVrPLNcrK+GkLFOVpgMCpjz3G0bBXutifP7+bqTCd9
	 t43IGxgi669Ng==
From: Marco Scardovi <scardracs@disroot.org>
To: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH] platform/x86: asus-armoury: fix Use-After-Free and memory leak in driver init
Date: Sun, 14 Jun 2026 18:37:17 +0200
Message-ID: <20260614163717.74732-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In init_rog_tunables(), if dc_limits are defined and allocating
dc_rog_tunables fails, the already allocated ac_rog_tunables gets
freed but the pointer stored in asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC]
is not cleared. Since init_rog_tunables() returns void, the driver
initialization continues, which can lead to a Use-After-Free (UAF)
when asus_fw_attr_add() accesses the freed AC tunables pointer.

Additionally, if init_rog_tunables() succeeds but asus_fw_attr_add()
fails, the allocated tunables are not freed, resulting in a memory leak.

Fix these issues by making init_rog_tunables() return an error code and
propagating it in asus_fw_init(). On failure, make sure all partially
allocated tunables are freed and their pointers are cleared to NULL.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.c | 32 ++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 495dc1e31d40..3a63f960eb3f 100644
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
@@ -1000,14 +1000,14 @@ static void init_rog_tunables(void)
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
@@ -1015,7 +1015,7 @@ static void init_rog_tunables(void)
 	if (ac_limits) {
 		ac_rog_tunables = kzalloc_obj(*asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC]);
 		if (!ac_rog_tunables)
-			goto err_nomem;
+			return -ENOMEM;
 
 		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] = ac_rog_tunables;
 		ac_rog_tunables->power_limits = ac_limits;
@@ -1063,7 +1063,8 @@ static void init_rog_tunables(void)
 		dc_rog_tunables = kzalloc_obj(*asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC]);
 		if (!dc_rog_tunables) {
 			kfree(ac_rog_tunables);
-			goto err_nomem;
+			asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] = NULL;
+			return -ENOMEM;
 		}
 
 		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC] = dc_rog_tunables;
@@ -1106,15 +1107,13 @@ static void init_rog_tunables(void)
 		pr_debug("No DC PPT limits defined\n");
 	}
 
-	return;
-
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
@@ -1127,10 +1126,19 @@ static int __init asus_fw_init(void)
 	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
 		return -ENODEV;
 
-	init_rog_tunables();
+	err = init_rog_tunables();
+	if (err)
+		return err;
 
-	/* Must always be last step to ensure data is available */
-	return asus_fw_attr_add();
+	err = asus_fw_attr_add();
+	if (err) {
+		kfree(asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC]);
+		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] = NULL;
+		kfree(asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC]);
+		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC] = NULL;
+	}
+
+	return err;
 }
 
 static void __exit asus_fw_exit(void)
-- 
2.54.0

