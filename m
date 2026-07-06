Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A75329396;
	Mon,  6 Jul 2026 01:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783301128; cv=none; b=ZRdkoB4pOJ5kLlJeEWBzQU0ljZxRpbtaOiufjFiuT6SJdrB3Mgm5WLnZ8SbKzdQXYJ9L7oqjXKXdpfMLKjX1Mzh5rejApozWU6q3GIeR2HJtGiojQhhwd/ohf3wFjhW1FJUkIYcN8yfCa4xgdByVidxOzmsrTYVpMoSJm0U5pU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783301128; c=relaxed/simple;
	bh=k7cbv7OBV8/75QMn3oFxL8ThzA0UVsVca2gLhGHnSC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wrr1hD7P6ez9a5G2R1GWE7AgF0BxAAyE5XDx7kWZkacDckd6iCRkpQJLJIYuRwgnku6F8IRsNy+RnOZ8erRhvBXuPVKVs1isZf8uV8PXj7vDpjRLq8TUpiZLX+sn7OxNblVocbD393EKo7V0UKma82e6ZUW2HQR6pRhhR/ZL3Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8ef78d5678d911f1aa26b74ffac11d73-20260706
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7ff7cab1-fd8c-4eb5-b6f5-70bf08a36f36,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:095917aab6ee1e56bb8bc09990215d23,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8ef78d5678d911f1aa26b74ffac11d73-20260706
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1673314497; Mon, 06 Jul 2026 09:25:22 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH 2/2] platform/surface: surfacepro3_button: Check ACPI companion before use
Date: Mon,  6 Jul 2026 09:25:12 +0800
Message-Id: <20260706012512.524359-3-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260706012512.524359-1-lilinmao@kylinos.cn>
References: <20260706012512.524359-1-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since every platform driver can be forced to match a device that doesn't
match its list of device IDs because of device_match_driver_override(),
platform drivers that rely on the existence of a device's ACPI companion
object should verify its presence.

surface_button_probe() passes the result of ACPI_COMPANION() to
acpi_device_hid(), which dereferences it, so force-binding the driver to
a device without an ACPI companion leads to a NULL pointer dereference.
The driver has been exposed to this since it was converted from an ACPI
driver to a platform driver.

Check the ACPI companion against NULL and return -ENODEV when it is
missing, like commit e4865a56d013 ("ACPI: driver: Check ACPI_COMPANION()
against NULL during probe") does for the core ACPI platform drivers.

Fixes: d913a5a12b40 ("platform/surface: surfacepro3_button: Convert to a platform driver")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 drivers/platform/surface/surfacepro3_button.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/surface/surfacepro3_button.c b/drivers/platform/surface/surfacepro3_button.c
index 0293bc517b54..29a10e6c3a3f 100644
--- a/drivers/platform/surface/surfacepro3_button.c
+++ b/drivers/platform/surface/surfacepro3_button.c
@@ -185,12 +185,17 @@ static bool surface_button_check_MSHW0040(struct device *dev, acpi_handle handle
 
 static int surface_button_probe(struct platform_device *pdev)
 {
-	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
 	struct surface_button *button;
+	struct acpi_device *device;
 	struct input_dev *input;
-	const char *hid = acpi_device_hid(device);
+	const char *hid;
 	int error;
 
+	device = ACPI_COMPANION(&pdev->dev);
+	if (!device)
+		return -ENODEV;
+
+	hid = acpi_device_hid(device);
 	if (strncmp(acpi_device_bid(device), SURFACE_BUTTON_OBJ_NAME,
 	    strlen(SURFACE_BUTTON_OBJ_NAME)))
 		return -ENODEV;
-- 
2.25.1

