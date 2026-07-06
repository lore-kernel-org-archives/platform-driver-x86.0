Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ABD233948;
	Mon,  6 Jul 2026 02:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783306293; cv=none; b=SIGp7cV537PdE8SHXsdd3142/rqw/eYGcUSiC9HXipP0ugqlWGRu6XNc6NaVBTidS+UoWd7HgcqinZdhzHtBQFpvVAYiCq0zIYQoNxEdjXEdsQUHzH2L1SdvEfoTUWqu+JqjMuIGW7MkrhD3UcwGnrXWCRgT/RKgfeivztpTCxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783306293; c=relaxed/simple;
	bh=ok5SkxK4Uhj+DHcIqbNf1F96B/ScNSZlM2jPxOaEIl8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l6B3lv3savCpLCjt4Moz4l8PAbtLERGk2wfcLIo0yLtewy3+KsKUyZdQNAIARf2iYV1jQTNZSeRL+UUq5ubyr21cvC0+y2REchD27Px7PnJVSXjPp3dNx6auU0L/dq3ieeb6evCIJm+dRV3NYBud0pc8wzByH7ETEIeUSRJ6idM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9426f83c78e511f1aa26b74ffac11d73-20260706
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:6f2678b8-7ed7-4878-bc84-c62302513042,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:2e1dd9090011de8b1cad2f172bf3f976,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9426f83c78e511f1aa26b74ffac11d73-20260706
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1091795503; Mon, 06 Jul 2026 10:51:25 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Linmao Li <lilinmao@kylinos.cn>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wireless: Check ACPI_COMPANION() against NULL
Date: Mon,  6 Jul 2026 10:49:53 +0800
Message-Id: <20260706024953.534671-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every platform driver can be forced to match a device that doesn't match
its list of device IDs because of device_match_driver_override(), so
platform drivers that rely on the existence of a device's ACPI companion
object need to verify its presence.

asus_wireless_probe() stores the result of ACPI_COMPANION() without
checking it and still succeeds when it is NULL, because
acpi_match_acpi_device() handles a NULL device gracefully.  Unbinding
the driver afterwards leads to a NULL pointer dereference when
asus_wireless_remove() passes the stored NULL pointer to
acpi_dev_remove_notify_handler(), which dereferences it.

Accordingly, add a requisite ACPI_COMPANION() check against NULL to the
platform/x86 asus-wireless driver.

Fixes: f7e648027d7e ("platform/x86: asus-wireless: Convert ACPI driver to a platform one")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 drivers/platform/x86/asus-wireless.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
index 2b494bf3cba8..2a43d76a5d19 100644
--- a/drivers/platform/x86/asus-wireless.c
+++ b/drivers/platform/x86/asus-wireless.c
@@ -127,11 +127,15 @@ static void asus_wireless_notify(acpi_handle handle, u32 event, void *context)
 
 static int asus_wireless_probe(struct platform_device *pdev)
 {
-	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
 	struct asus_wireless_data *data;
 	const struct acpi_device_id *id;
+	struct acpi_device *adev;
 	int err;
 
+	adev = ACPI_COMPANION(&pdev->dev);
+	if (!adev)
+		return -ENODEV;
+
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
-- 
2.25.1

