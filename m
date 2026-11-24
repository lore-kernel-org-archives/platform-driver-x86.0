Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516813;
	b=3jZhltzNJBz4OLY+20eDwViKzZKj7nY6v5DgcKk5SLqa4MmXZyiDLumb3vQKOhSHHFAn
	 FOheupjVheCSrHyTK0sPmYkPHPi4K7Eo3/HMe5/jG76m+iCyX3ehIHvLrxyDctoZLaX8q
	 2X1M5VOXVE9wf1DUN0R9qRGCqXWjLhfACzZnb6QLMOwplKaWpZTMoBeD28q54Cd8wVtVd
	 5hedcgooNELjfCCXTFHhCAOt33cgA1eG2w5qaJHBLh9ALG/IYIdG9HXlYhcFWqdQ4ZsGf
	 R7r05/S8ttvRsBqGUN/hm4J24m9CfmMa41xkDOyO13dWc4Bi9wN/6gLhlop5m/Z0BLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516813;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QxsB3bf/Ce84fX8xRs2YrrShTAJHmg2rR46h79gKFU0=;
	b=tfFfiehawhWN/XknucTMzStA/9QTyuAY3oU81+Rw8DdK3YWHJPNvkZdaVdrSnO4neKbm
	 ShdPOsuk9F3f9nJhsTAKdroQz8SSbFxbEFowOz+0+RJWbd7wUKcf+fvcyFUmySK2aQgMi
	 qJqts6UxeP2xVlx+xS/W6jpQsdNLXbA02c/oFKfhe1ZBODFUZfYrEhv4ritgrSCnSUbE3
	 OSUyGuPKmicHxo/ZvNMqDn1Y1DiwGj8X8wiotv95EGRF0AjviYAPiSp5pG5IKSTDDE0SU
	 pLwpheNPAn/NMynSPqSoim1vrvSXi3wbufn5LtJI0GFCYNBMqYaVIA3T7LOIvQt47yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D8A606A326;
	Tue, 24 Nov 2026 10:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D8A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 64984a44e7f311f19a56ed5b684f684d-20261124
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ef6b8d20-7f63-4bdd-9202-8e4b0db2cfd8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:fb9cedf8be987cd424c12f0e8300b60a,BulkI
	D:nil,BulkQuantity:0,SF:102|136|865|898,TC:nil,Content:0|15|50|99,EDM:5|-1
	00,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 64984a44e7f311f19a56ed5b684f684d-20261124
X-User: huxiaoying@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huxiaoying@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1917889131; Tue, 24 Nov 2026 18:39:57 +0800
From: Tom Hu <huxiaoying@kylinos.cn>
To: linux-kernel@vger.kernel.org
Cc: hmh@hmh.eng.br,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	i@rong.moe,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	xiaoying_hu@126.com,
	huxiaoying <huxiaoying@kylinos.cn>
Subject: [PATCH 1/2] platform/x86: thinkpad_acpi: Update charge_stop only after it was applied
Date: Tue, 24 Nov 2026 18:39:34 +0800
Message-Id: <20261124103935.897624-1-huxiaoying@kylinos.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: huxiaoying <huxiaoying@kylinos.cn>

The charge_stop_threshold store writes the new value into the cached
battery_info before the EC has accepted it.  If the ACPI call fails,
the cache and the hardware disagree, and subsequent charge_start
writes are validated against the stale-not-applied value.

Move the cache update after a successful EC write and report -ENODEV
on failure, matching the charge_start path.

Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad721..8fc5569131f6 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -9847,16 +9847,15 @@ static ssize_t tpacpi_battery_store(int what,
 			return -EINVAL;
 		if (value < battery_info.batteries[battery].charge_start)
 			return -EINVAL;
-		battery_info.batteries[battery].charge_stop = value;
 		/*
 		 * When 100 is passed to stop, we need to flip
 		 * it to 0 as that the EC understands that as
 		 * "Default", which will charge to 100%
 		 */
-		if (value == 100)
-			value = 0;
-		if (tpacpi_battery_set(THRESHOLD_STOP, battery, value))
-			return -EINVAL;
+		if (tpacpi_battery_set(THRESHOLD_STOP, battery,
+				       value == 100 ? 0 : value))
+			return -ENODEV;
+		battery_info.batteries[battery].charge_stop = value;
 		return count;
 	default:
 		pr_crit("Wrong parameter: %d", what);
-- 
2.34.1

