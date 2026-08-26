Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3A932D0FC;
	Wed, 26 Aug 2026 07:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787729430; cv=none; b=MqZX2+iazcR38t0huGKVeRnwa0AsGFg8rBryv9CdOlR6dyg1PMes0T98Ac/zPIKGKdwGIgwqZ+wUYBiKdCAX2XwXwTKeqvAonJSYk5NpIGH87hRyb5+AtrHUqRAa9IrYO0irNTHgnfHXSgKsdalkkOTDri5aJVHfal6HBryFy0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787729430; c=relaxed/simple;
	bh=RhRBn9ZguidctszjlO9BqfkPkHKcahvohgdH1fPBIYc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gIxB5ubBEAyhQYA/OJnxELusWuMtp0u56w/Ib4XOsyEyN1+cNdbK4jemO8uAWX/uek/oByOduj4Rorgcw8Hrxfk2VrHg5Dh1ahZpecj2bqghPA7rUPwZqGZWdYsbXRfx1FHF8GLXa1u7WkzpDQzSh+m732UWX9n+JtcQQjB7JZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: fe15194ca11f11f19a56ed5b684f684d-20260826
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:cb185368-5fbe-4938-bb06-55552ec3173c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:e7230014ef61a1c5d7cf4741686b0e85,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:n
	il,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fe15194ca11f11f19a56ed5b684f684d-20260826
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1722760409; Wed, 26 Aug 2026 15:30:20 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: hansg@kernel.org
Cc: hmh@hmh.eng.br,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huang Wei <huangwei@kylinos.cn>,
	thisisamirv <thisisamirv@gmail.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to non-standard thermal/fan quirk tables
Date: Wed, 26 Aug 2026 15:30:14 +0800
Message-Id: <20260826073014.2611191-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo ThinkPad X9-14 Gen 1 uses a non-standard Embedded Controller
firmware (ECFW) whose thermal and fan registers are not located at the
classic addresses. On this model the thermal registers sit at 0xA8-0xAF /
0xB8-0xBF and the fan registers use the non-standard offsets, instead of
the legacy 0x78-0x7F / 0xC0-0xC7 (thermal) and 0x2f / 0x84 (fan).

Because the model is not covered by the existing quirk tables, the driver
probes the legacy thermal addresses during init, reads back 0x00 from
every register, concludes the EC is "misbehaving" and disables all
thermal sensor access:

  thinkpad_acpi: ThinkPad ACPI EC access misbehaving, disabling thermal
  sensors access

Fan access is affected the same way, leaving fan1/fan2 reporting 0 RPM.

The infrastructure for these non-standard ECFW models is already in place
(commit 301c1904d638 ("platform/x86: thinkpad_acpi: Fix to correct wrong
temp reporting on some ThinkPads")); the X9-14 Gen 1 simply was not added
to the model lists yet. Add its BIOS model code N4D to both the thermal
and fan quirk tables so that:
  - thermal_read_mode_check() selects TPACPI_THERMAL_TPEC_12 and reads
    the 0xA8/0xB8 registers, and
  - fan_init() selects the non-standard fan register addresses.

Reported-by: thisisamirv <thisisamirv@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221228
Signed-off-by: Huang Wei <huangwei@kylinos.cn>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 6dd7c28fc0db..498139ac8f4b 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -6021,6 +6021,7 @@ static const struct tpacpi_quirk thermal_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('R', '0', 'T', true),	/* 11e Gen5 GL*/
 	TPACPI_Q_LNV3('R', '1', 'D', true),	/* 11e Gen5 GL-R*/
 	TPACPI_Q_LNV3('R', '0', 'V', true),	/* 11e Gen5 KL-Y*/
+	TPACPI_Q_LNV3('N', '4', 'D', true),	/* X9-14 Gen 1 */
 };
 
 static enum thermal_access_mode thermal_read_mode;
@@ -8845,6 +8846,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('R', '0', 'T', TPACPI_FAN_NS),	/* 11e Gen5 GL */
 	TPACPI_Q_LNV3('R', '1', 'D', TPACPI_FAN_NS),	/* 11e Gen5 GL-R */
 	TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),	/* 11e Gen5 KL-Y */
+	TPACPI_Q_LNV3('N', '4', 'D', TPACPI_FAN_NS),	/* X9-14 Gen 1 */
 	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
 	TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
 	TPACPI_Q_LNV('8', 'F', TPACPI_FAN_TPR),		/* ThinkPad x120e */
-- 
2.25.1

