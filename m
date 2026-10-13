Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487483E5A1F;
	Tue, 13 Oct 2026 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875276; cv=none; b=tsN3uS1Qi0W+T2G8W3467cM/NtwBbouX2hkecDdxJZKJrHwpMP0Lghp+nHYBeqKinMQm8qjZFmCDVRHAJeWt3jR5yfyl2atWsyj58l4xsbBf+vMV4BNh7JtWpodQlO5hKqtNJZXj8VZbr9Fr/yYJ/lABeTQDwBdmAQv26DkzAQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875276; c=relaxed/simple;
	bh=u1wy04jYiXNsY7CjElam1NgetXf7NCyivJyhweI5ujw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZlpSEu81AXkrbp9lXmDdA31o4/aBHKe74dotE6uiykr3h7N5+P5kZRa0p34PVwNleKYzVIPDIht2r7hIU63r6FZYr5zzeSKHDYK3LCVFxWdkRwUHopchlZ8yNuGDbY8RmObv8k4U3Ah2m1PKISlcCKp5Ty8PxziewxFyqw/+FXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ca44f328c6d411f19a56ed5b684f684d-20261013
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:1ff9f200-298d-4917-868d-3499ceb19e6e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:b208e233260a534d5388f3357d4949cd,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ca44f328c6d411f19a56ed5b684f684d-20261013
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 279362715; Tue, 13 Oct 2026 15:07:45 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: [PATCH] Revert "platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to non-standard thermal/fan quirk tables"
Date: Tue, 13 Oct 2026 15:07:40 +0800
Message-Id: <20261013070740.789934-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260918161539.2676619-1-huangwei@kylinos.cn>
References: <20260918161539.2676619-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reverts commit bb0f3a5d6b9844b70ad696b9470762028f6d86ec.

Lenovo's firmware team has verified that the X9-14 Gen 1 uses EC
register offsets that are unique to this platform, rather than the
shared non-standard ECFW layout of the models already covered by the
quirk tables. Applying the generic quirk would make the driver read
the wrong registers and report bogus temperatures. Lenovo is working
on the correct solution based on an updated EC register specification.

Link: https://lore.kernel.org/all/000acb24-7aef-4718-89ea-0dffd1ab34d9@app.fastmail.com/
Signed-off-by: Huang Wei <huangwei@kylinos.cn>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 498139ac8f4b..6dd7c28fc0db 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -6021,7 +6021,6 @@ static const struct tpacpi_quirk thermal_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('R', '0', 'T', true),	/* 11e Gen5 GL*/
 	TPACPI_Q_LNV3('R', '1', 'D', true),	/* 11e Gen5 GL-R*/
 	TPACPI_Q_LNV3('R', '0', 'V', true),	/* 11e Gen5 KL-Y*/
-	TPACPI_Q_LNV3('N', '4', 'D', true),	/* X9-14 Gen 1 */
 };

 static enum thermal_access_mode thermal_read_mode;
@@ -8846,7 +8845,6 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('R', '0', 'T', TPACPI_FAN_NS),	/* 11e Gen5 GL */
 	TPACPI_Q_LNV3('R', '1', 'D', TPACPI_FAN_NS),	/* 11e Gen5 GL-R */
 	TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),	/* 11e Gen5 KL-Y */
-	TPACPI_Q_LNV3('N', '4', 'D', TPACPI_FAN_NS),	/* X9-14 Gen 1 */
 	TPACPI_Q_LNV('H', '3', TPACPI_FAN_NS),		/* Edge E330 */
 	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
 	TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */

--
2.25.1

