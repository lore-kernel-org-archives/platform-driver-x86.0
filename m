Received: from mail73.out.titan.email (mail73.out.titan.email [3.216.99.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3951E22FC
	for <platform-driver-x86@vger.kernel.org>; Sun,  4 May 2025 17:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.216.99.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746378083; cv=none; b=FJcij4rEQ6DuuNDUyTUhpJiBg6X56X4cMSILm9YKv0hp634Uqg4M14bEcUIrvqZ4IToA1mbua3phzyL1V5fyNf6EuRkbLvk6/FbXuPkaqit/KwOcGdMRbN1izJAi9Vg1brlvZlS/vDl7w9UJclpGT/Pb2H+c3c8mU6gCBscffV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746378083; c=relaxed/simple;
	bh=VGy2bVJvnII8gFCvBTLW0BiEPlMwoT8ZwRAzAEkvjPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TcrF7fTQ3MVvrsbS7QCCRMcHcDTODs5boYx703273uj9RPXqVDjMaNM1ORK8QetWPW7OD40XhWlyA4g2ZrKPDShxo4cFjgePlddar9d+DqQPzmlt5jDWYtoWiePnmEJK1B9SG7ghBuILVqvEH9Y1Og5wBGQAwUU06JAPaklixb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0atlas.com; spf=pass smtp.mailfrom=0atlas.com; dkim=pass (1024-bit key) header.d=0atlas.com header.i=@0atlas.com header.b=j8nyjKpg; arc=none smtp.client-ip=3.216.99.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0atlas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0atlas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0atlas.com header.i=@0atlas.com header.b="j8nyjKpg"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 1EA586016A;
	Sun,  4 May 2025 16:55:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=0EKTRc7dcouGTgN1LxVdoVGOZgM+VQUzaLOlEeX1N2M=;
	c=relaxed/relaxed; d=0atlas.com;
	h=cc:subject:message-id:to:mime-version:from:date:from:to:cc:subject:date:message-id:in-reply-to:reply-to:references;
	q=dns/txt; s=titan3; t=1746377721; v=1;
	b=j8nyjKpg8VUX7RtRkiCKdxKpKZ2SV7PMPM1w5OZtCr2iBhL/6udumb5PhTMnigBFX24Ay6BT
	pHPPbNwBM/Yzsbh4GtDXVe0bg7k4LShZXt3iPJfK8wNp+B7+wneHDEYLkjbvX+uo5dwK+DiwQxi
	jCqZMPShWNu9KD7wRG0JeeoY=
Received: from laviux.. (n219079102104.netvigator.com [219.79.102.104])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 0122560117;
	Sun,  4 May 2025 16:55:17 +0000 (UTC)
Feedback-ID: :johnchau@0atlas.com:0atlas.com:flockmailId
From: John Chau <johnchau@0atlas.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Chau <johnchau@0atlas.com>
Subject: [PATCH] Make thinkpad_acpi to support also NEC Lavie X1475JAS
Date: Mon,  5 May 2025 01:55:13 +0900
Message-ID: <20250504165513.295135-1-johnchau@0atlas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1746377720964137638.5242.26633778875609042@prod-use1-smtp-out1001.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=O7TDvA9W c=1 sm=1 tr=0 ts=68179bf8
	a=iJ4LEHJSImB6z5Afb8xgNg==:117 a=iJ4LEHJSImB6z5Afb8xgNg==:17
	a=CEWIc4RMnpUA:10 a=2z1OXlWFAAAA:8 a=5olU5vRNAAAA:8
	a=aeDjl3ZlLZUCWRMWLv8A:9 a=SNRPda0NjyR9MlWdJ_lJ:22
	a=PF5gbd1S6XIqBhKP7f6D:22

This patch changes get_thinkpad_model_data in thinkpad_acpi.c
to check for additional vendor name "NEC" in order to support
NEC Lavie X1475JAS notebook (and perhaps more).

The reason of this works with minimal changes is because NEC
Lavie X1475JAS is a Thinkpad inside. ACPI dumps reveals its
OEM ID to be "LENOVO", BIOS version "R2PET30W" matches typical
Lenovo BIOS version, the existence of HKEY of LEN0268, with DMI
fw string is "R2PHT24W".

I compiled and tested with my own machine, attached the dmesg
below as proof of work:
[    6.288932] thinkpad_acpi: ThinkPad ACPI Extras v0.26
[    6.288937] thinkpad_acpi: http://ibm-acpi.sf.net/
[    6.288938] thinkpad_acpi: ThinkPad BIOS R2PET30W (1.11 ), EC R2PHT24W
[    6.307000] thinkpad_acpi: radio switch found; radios are enabled
[    6.307030] thinkpad_acpi: This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver
[    6.307033] thinkpad_acpi: Disabling thinkpad-acpi brightness events by default...
[    6.320322] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is unblocked
[    6.371963] thinkpad_acpi: secondary fan control detected & enabled
[    6.391922] thinkpad_acpi: battery 1 registered (start 0, stop 85, behaviours: 0x7)
[    6.398375] input: ThinkPad Extra Buttons as /devices/platform/thinkpad_acpi/input/input13

Signed-off-by: John Chau <johnchau@0atlas.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 5790095c175e..92b21e49faf6 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -11478,6 +11478,8 @@ static int __must_check __init get_thinkpad_model_data(
 		tp->vendor = PCI_VENDOR_ID_IBM;
 	else if (dmi_name_in_vendors("LENOVO"))
 		tp->vendor = PCI_VENDOR_ID_LENOVO;
+	else if (dmi_name_in_vendors("NEC"))
+		tp->vendor = PCI_VENDOR_ID_LENOVO;
 	else
 		return 0;
 
-- 
2.43.0

