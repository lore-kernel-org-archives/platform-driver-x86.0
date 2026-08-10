Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8D03B100A;
	Mon, 10 Aug 2026 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358528; cv=none; b=IoRsL3nrXzbr8znTi9f/tIi5E7BBefVYghrLYzk/I5iXq6LDQASIQzBwc8TfGM8SJ3R7ErDoioQitUPP3fm7maio/hnjLOENauSenxuEtGhv5cKHGZo3FpreGyfJVd6KaCvlK6sZysKYcD1PLa/a8ILtNt9gAUjobNrZXez63nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358528; c=relaxed/simple;
	bh=xWJTcy1Ky71k/7s2AfqYNR/+XMnlrvRH8NzvgYWGjEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PRfFxJcNvmvRwN26Vo9QKBw6mW47QmBoTV0/hJw8OABFsv4S+JNQhLx0xRn80vahXjyyQejCVVAcxvZ4VHOcqS1AbtIcJR4I/BkZBQ4Fh+ozqlnMRIO/3PjMakrCr7JgKxd4hmKD57y2tHHz+U8ElUtSkCy/uE8uL/QXOY3CSSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUbyEoeY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUbyEoeY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3EB7C19425;
	Mon, 10 Aug 2026 10:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786358527;
	bh=xWJTcy1Ky71k/7s2AfqYNR/+XMnlrvRH8NzvgYWGjEY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=qUbyEoeYuh4v8KJ1hHPJAGHdegYG3/zUmf8baXVBPOaU5azUAtonwizW1r4Sc0EnV
	 yS8JjgvrOiFSVMNxUMYyVzdxfdqQid9HrYnd2eTE4IrMnDxTI33hiEAaI2XY1L1Hox
	 G623gWKo7xCV0uY5orPsb330qokqWMVHS1dLZzKnucEtu+X9XI5l7RhdCtbmrmQDtn
	 i/2PtXVJwjXoCWCNnQu7aDXcCtDo6tPXG1g0zFC0N5Xvx6ky9Hx7ELJYS4C0KHZz2N
	 OW58ghGbMT3KZS5Q2TNekOJum5C7QnHtdUbyRQddwjXAfEdbzQTMVPQON8jhKm5QoN
	 6HcGhCb8u0MjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A156C5AE5D;
	Mon, 10 Aug 2026 10:42:07 +0000 (UTC)
From: busybox11 via B4 Relay <devnull+busybox11th.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 12:42:05 +0200
Subject: [PATCH] platform/x86: asus-armoury: add dGPU disable fallback
 DEVID for ProArt H7606 series
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-asus_armoury_dgpu_new_devid-v1-1-0a5c845414e4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QrCMAxA0V8ZebbQFjamvyJS4hJnBLuRWJ2M/
 btVH8/DvSsYq7DBoVlB+SkmU64IuwaGK+aRnVA1RB873wfv0Iol1PtU9J1onEvK/EpUU3Kh6xF
 bwrj3DPUwK19k+d2Pp7+tnG88PL5L2LYPB2rnT38AAAA=
X-Change-ID: 20260810-asus_armoury_dgpu_new_devid-168aa5da290e
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 busybox11 <busybox11th@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786358526; l=5396;
 i=busybox11th@gmail.com; s=20260810; h=from:subject:message-id;
 bh=Mj/LFs3Xz+yRgi3a1YthYcoxuj8/zTpklNst+WslNLE=;
 b=42lX62ttRzRI8RlgkG0xWrVEUUFKHUvyqBeaG0Q0yz5RVrve9cqzfqGmZXbN2oR3QiiikP6Fx
 cUxuEnUHJw7BruLAErB+KGRUarrZhKM8dGoFOjhA/o3+EQtDeZbBKKe
X-Developer-Key: i=busybox11th@gmail.com; a=ed25519;
 pk=tAPX0PkPp+z+auNzREFUR/SmxWxLsZK6ddLlhAN/zjA=
X-Endpoint-Received: by B4 Relay for busybox11th@gmail.com/20260810 with
 auth_id=932
X-Original-From: busybox11 <busybox11th@gmail.com>
Reply-To: busybox11th@gmail.com

From: busybox11 <busybox11th@gmail.com>

Newer ASUS ProArt laptops (e.g. H7606 series) implement dGPU power
control on WMI DEVID 0x00090120 instead of the usual 0x00090020.
The default DEVID returns 0xFFFFFFFE on these models, so the
dgpu_disable firmware attribute is never created and the dGPU cannot
be re-enabled from Linux at all.

Add a fallback probe for device ID 0x00090120 following the same
approach as the gpu_mux_dev_id probe.

Details for 0x00090120 (confirmed on H7606W using direct WMNB calls
and inspecting the DSDT DEVS handler):
  - Reading DSTS returns 0x00010001 when the dGPU is off (CUMA=1),
	or 0x00010000 when it's on.
  - Writing DEVS: 0 enables the dGPU (calls PG00._ON() + Notifies
	PEGP, Device Check), and 1 disables or ejects it.

This behavior matches the dgpu_disable attribute (1 = disabled).

Signed-off-by: busybox11 <busybox11th@gmail.com>
---
 drivers/platform/x86/asus-armoury.c        | 32 +++++++++++++++++++++++++-----
 include/linux/platform_data/x86/asus-wmi.h |  3 +++
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 495dc1e31..f39b52451 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -93,6 +93,7 @@ struct asus_armoury_priv {
 
 	u32 mini_led_dev_id;
 	u32 gpu_mux_dev_id;
+	u32 dgpu_disable_dev_id;
 };
 
 static struct asus_armoury_priv asus_armoury = {
@@ -452,8 +453,8 @@ static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
 	if (err)
 		return err;
 
-	if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU)) {
-		err = armoury_get_devstate(NULL, &result, ASUS_WMI_DEVID_DGPU);
+	if (asus_armoury.dgpu_disable_dev_id) {
+		err = armoury_get_devstate(NULL, &result, asus_armoury.dgpu_disable_dev_id);
 		if (err)
 			return err;
 		if (result && !optimus) {
@@ -507,7 +508,8 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
 	}
 
 	scoped_guard(mutex, &asus_armoury.egpu_mutex) {
-		err = armoury_set_devstate(attr, disable ? 1 : 0, NULL, ASUS_WMI_DEVID_DGPU);
+		err = armoury_set_devstate(attr, disable ? 1 : 0, NULL,
+					   asus_armoury.dgpu_disable_dev_id);
 		if (err)
 			return err;
 	}
@@ -516,7 +518,7 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
 
 	return count;
 }
-ASUS_WMI_SHOW_INT(dgpu_disable_current_value, ASUS_WMI_DEVID_DGPU);
+ASUS_WMI_SHOW_INT(dgpu_disable_current_value, asus_armoury.dgpu_disable_dev_id);
 ASUS_ATTR_GROUP_BOOL(dgpu_disable, "dgpu_disable", "Disable the dGPU");
 
 /* Values map for eGPU activation requests. */
@@ -790,7 +792,6 @@ ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(nv_base_tgp, ATTR_NV_BASE_TGP, ASUS_WMI_DEVID_
 static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
 	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
-	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
 	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
 
 	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
@@ -934,6 +935,21 @@ static int asus_fw_attr_add(void)
 		}
 	}
 
+	asus_armoury.dgpu_disable_dev_id = 0;
+	if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU))
+		asus_armoury.dgpu_disable_dev_id = ASUS_WMI_DEVID_DGPU;
+	else if (armoury_has_devstate(ASUS_WMI_DEVID_GPU_MODE))
+		asus_armoury.dgpu_disable_dev_id = ASUS_WMI_DEVID_GPU_MODE;
+
+	if (asus_armoury.dgpu_disable_dev_id) {
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+					 &dgpu_disable_attr_group);
+		if (err) {
+			pr_err("Failed to create sysfs-group for dgpu_disable\n");
+			goto err_remove_gpu_mux_group;
+		}
+	}
+
 	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
 		if (!armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
 			continue;
@@ -971,6 +987,9 @@ static int asus_fw_attr_add(void)
 			sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
 					   armoury_attr_groups[i].attr_group);
 	}
+	if (asus_armoury.dgpu_disable_dev_id)
+		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &dgpu_disable_attr_group);
+err_remove_gpu_mux_group:
 	if (asus_armoury.gpu_mux_dev_id)
 		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
 err_remove_mini_led_group:
@@ -1143,6 +1162,9 @@ static void __exit asus_fw_exit(void)
 					   armoury_attr_groups[i].attr_group);
 	}
 
+	if (asus_armoury.dgpu_disable_dev_id)
+		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &dgpu_disable_attr_group);
+
 	if (asus_armoury.gpu_mux_dev_id)
 		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
 
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index c29962d5b..faeae70f4 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -138,6 +138,9 @@
 /* dgpu on/off */
 #define ASUS_WMI_DEVID_DGPU		0x00090020
 
+/* dgpu power/mode switch, dgpu_disable fallback on some ProArt */
+#define ASUS_WMI_DEVID_GPU_MODE		0x00090120
+
 #define ASUS_WMI_DEVID_APU_MEM		0x000600C1
 
 #define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099

---
base-commit: 3f008280327ba5ad132965abab0c7846283cef0c
change-id: 20260810-asus_armoury_dgpu_new_devid-168aa5da290e

Best regards,
--  
busybox11 <busybox11th@gmail.com>


