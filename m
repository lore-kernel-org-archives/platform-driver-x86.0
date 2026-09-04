Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCF13A0E99;
	Fri,  4 Sep 2026 06:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504410; cv=none; b=kuFh91MlIn0mW8kJFqZ6n6m1hSVY2aeLTbUnunsk2nTOZJKdqeJkfBCBxRPo0gvq2JLQbbsgGC+R8g8cKKF7vvW1D4H/7lF6VV1B1eUOUkRMScitWLs6UYtor4cbz4JZDY6ZWvwxBAAw1fOUqDe8BPkLrAHX5tMXe8Mn6I4vqJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504410; c=relaxed/simple;
	bh=Uv4s7+6NVe79bGgtdC3so9tDKE20mEijXN8pqBgRYI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a92xMFu1fHr3nkytt0tbc2Xu0/1mxKdeuwrZ2ubia/pmaDKnfpU5qvxaBQo17o6xk2JidRK8lgoRDyENAz8e5NnDshK5ir32dttRV3amBp/o4xTU80uc+ldT+N3UzuE2bounXRhyBHaUyxhsPUwgxkXMY7FU5lFHsc42aav9ZlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfyDrPCh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfyDrPCh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EE50C2BCC7;
	Fri,  4 Sep 2026 06:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788504410;
	bh=Uv4s7+6NVe79bGgtdC3so9tDKE20mEijXN8pqBgRYI4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=JfyDrPChMpkgHRUcvIGy8OVRXzVtmPhZaywnSu24q+AtLgiWgTtRAftUsTUQrqYjN
	 ZIqTln30fnfLTXHeL242SBPwAXI2fpmiyA93y4xyadKcSr8uSZSum9+4b/J9HN8mXV
	 5Kz/0+oA0fUb/YX0I6rzH7lLG39Nl+WQHZndFlqHlluCc0A+rsp1hMqiwu8KfB2JAl
	 bsVHMSQWrRrXJ2E4lcqVAVctfXMbt/h75VZv0QHMeFrSK4lwoBUgSIsiyCsjT24kng
	 vVizi8j1jaSK7MrIxGQxEvles98UaYGKHSI2m3tjRUmc7JJxjflTKcGF5kMtgOsIzn
	 nNPBFohvK/JFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C8FC79F80;
	Fri,  4 Sep 2026 06:46:50 +0000 (UTC)
From: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Date: Fri, 04 Sep 2026 14:46:48 +0800
Subject: [PATCH] platform/x86: dell-dw5826e: Extend _DSM support to
 revision 0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-dw5826e-acpi-reset-add-revision-v1-1-1be7153c3453@compal.com>
X-B4-Tracking: v=1; b=H4sIAFdpmmoC/zXNwQ6CMBCE4Vche3aTsoEGfBXjobSjrgckXVASw
 rtbNR6/w/yzkSErjI7VRhlPNX2MBfWhongL4xWsqZjEiXe9azi92k48OMRJOcMwc0iJ/1vuomu
 DH9CL1FQqU8ZF1+/D6fyzLcMdcf5kad/fi3xu1oMAAAA=
X-Change-ID: 20260904-dw5826e-acpi-reset-add-revision-8c05a6be9221
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jack Wu <jackbb_wu@compal.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788504409; l=2846;
 i=jackbb_wu@compal.com; s=20260526; h=from:subject:message-id;
 bh=fovlMwmuerLb6eG4K1KmkpjYm+R0JncemqL/v2DeZFs=;
 b=Qbr+okLi4FCD/FC6/l2ybR5+kxybzzasXI0nuQnPnJy0M9zfRRFMzoad/zHvXXgjT7qd0t9N6
 bfbv4y6/mbaDdM+Sc2d75VaUxW56PV8EF7F1sonCt1bSh/Mvzws1FD8
X-Developer-Key: i=jackbb_wu@compal.com; a=ed25519;
 pk=VH1prTWixNl8OEUPPSfII3p46MzJpQN8J3+ecE1tZXg=
X-Endpoint-Received: by B4 Relay for jackbb_wu@compal.com/20260526 with
 auth_id=793
X-Original-From: Jack Wu <jackbb_wu@compal.com>
Reply-To: jackbb_wu@compal.com

From: Jack Wu <jackbb_wu@compal.com>

The driver evaluates the PALC0001 _DSM with revision 1 only. Extend it
to also support firmware implementing revision 0, as found on Slate PTL
CS 14, Yukon PTL CSLW 14 and Yukon PTL 360 14.

The supported revision is detected once during probe. Revision 1 is
checked first so that existing systems keep their current behaviour, and
the accepted revision is then used for evaluating the reset _DSM.

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
 drivers/platform/x86/dell/dell-dw5826e-reset.c | 30 ++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/platform/x86/dell/dell-dw5826e-reset.c
index 64e6e9b1d7a0..c72c243b460e 100644
--- a/drivers/platform/x86/dell/dell-dw5826e-reset.c
+++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
@@ -6,8 +6,10 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/device.h>
+#include <linux/gfp_types.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
@@ -15,15 +17,23 @@
 
 #define PALC_DSM_FN_TRIGGER_PLDR    1
 
+static const u64 palc_dsm_revs[] = { 1, 0 };
+
 static guid_t palc_dsm_guid =
 	GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);
 
+struct palc_data {
+	u64 dsm_rev;
+};
+
 static int trigger_palc_pldr(struct device *dev, acpi_handle handle)
 {
+	struct palc_data *data = dev_get_drvdata(dev);
 	union acpi_object *obj;
 	int ret = 0;
 
-	obj = acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, PALC_DSM_FN_TRIGGER_PLDR, NULL);
+	obj = acpi_evaluate_dsm(handle, &palc_dsm_guid, data->dsm_rev,
+				PALC_DSM_FN_TRIGGER_PLDR, NULL);
 	if (!obj) {
 		dev_err(dev, "Failed to evaluate _DSM\n");
 		return -EIO;
@@ -60,16 +70,28 @@ ATTRIBUTE_GROUPS(palc);
 
 static int palc_probe(struct platform_device *pdev)
 {
+	struct palc_data *data;
 	acpi_handle handle;
+	unsigned int i;
 
 	handle = ACPI_HANDLE(&pdev->dev);
 	if (!handle)
 		return -ENODEV;
 
-	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, BIT(PALC_DSM_FN_TRIGGER_PLDR)))
-		return -ENODEV;
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(palc_dsm_revs); i++) {
+		if (acpi_check_dsm(handle, &palc_dsm_guid, palc_dsm_revs[i],
+				   BIT(PALC_DSM_FN_TRIGGER_PLDR))) {
+			data->dsm_rev = palc_dsm_revs[i];
+			platform_set_drvdata(pdev, data);
+			return 0;
+		}
+	}
 
-	return 0;
+	return -ENODEV;
 }
 
 static const struct acpi_device_id palc_acpi_ids[] = {

---
base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
change-id: 20260904-dw5826e-acpi-reset-add-revision-8c05a6be9221

Best regards,
--  
Jack Wu <jackbb_wu@compal.com>


