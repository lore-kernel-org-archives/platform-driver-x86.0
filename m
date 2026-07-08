Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1034A36212F;
	Wed,  8 Jul 2026 01:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783472840; cv=none; b=Un6Mkxsx7F4MsB9VxnDHuXCRlIooGtSlSmuyywyRbkeS4c5GUKfri2fbgNOPl6BTyoI/NVea0tdsRDTbnLHk6jNjRKrbMByg/6CMTo5pP2LZbc96+dtQPO8eXPRQisuYaaTnM8H0LVk3fDaPZrjmyLVGLUOrxFzeeLO86yQ8Dqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783472840; c=relaxed/simple;
	bh=F2tgXvFg+qSqAQ76GcxOdjArnq6zGGukKwVaz2ODFgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nv33xXtXdKSgHJ1nsCNteBtMZsRCez2INBO00pUHkTBpsvFB8xYV5kMwwnLjnwPofhgpto9KW1eMEXgPj4wlZpjyUEryFlTt16+4wnTjfBp7ezg8yHN840qfJsRDuVQ35UHQh51mi0YBhSZidMZa/b2UedH1NB0jRK+1yZUDRms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 594e5e467a6911f1aa26b74ffac11d73-20260708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:949d070e-375f-443b-a5d0-dcdaf413e5fd,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:cf055c126f90329a6dbf1674440b9b17,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 594e5e467a6911f1aa26b74ffac11d73-20260708
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 815700878; Wed, 08 Jul 2026 09:07:11 +0800
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
Subject: [PATCH v2] platform/x86: asus-wireless: Fail probe when there is no ACPI match
Date: Wed,  8 Jul 2026 09:07:05 +0800
Message-Id: <20260708010706.718190-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260706024953.534671-1-lilinmao@kylinos.cn>
References: <20260706024953.534671-1-lilinmao@kylinos.cn>
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

asus_wireless_probe() returns success when acpi_match_acpi_device()
finds no match, leaving behind an input device that never reports
anything because the notify handler is not installed.  Worse, when the
driver is force-bound to a device without an ACPI companion, probe
still succeeds and stores a NULL companion pointer, which
asus_wireless_remove() later passes to acpi_dev_remove_notify_handler(),
leading to a NULL pointer dereference on unbind.

Return -ENODEV when the device does not match the ID table.  This also
covers the missing-companion case, because acpi_match_acpi_device()
rejects a NULL device.

Fixes: f7e648027d7e ("platform/x86: asus-wireless: Convert ACPI driver to a platform one")
Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
v2: Fail probe when the ACPI ID match fails instead of adding a
    separate ACPI companion check at the top of probe (Rafael).

 drivers/platform/x86/asus-wireless.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
index 2b494bf3cba8..d33853a1baf3 100644
--- a/drivers/platform/x86/asus-wireless.c
+++ b/drivers/platform/x86/asus-wireless.c
@@ -155,7 +155,7 @@ static int asus_wireless_probe(struct platform_device *pdev)
 
 	id = acpi_match_acpi_device(device_ids, adev);
 	if (!id)
-		return 0;
+		return -ENODEV;
 
 	data->hswc_params = (const struct hswc_params *)id->driver_data;
 
-- 
2.25.1

