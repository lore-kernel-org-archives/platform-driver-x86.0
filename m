Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB924248F6F
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 21:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774387051; cv=fail; b=m8DRjZ5TGDt6r8pA42INO2l5yyIgltXGBJYs8jsaoVU/C7hXIxmbW+1wqF6zUxTKJYuQHCL3/8tQJZOI8YdJhm6k7/q86rInrrKuBFZBNrnTgszHCcJ1eDnDL6WlHVyqDCPIJOz7UVY7p72Fwyl7EXuBE1vWWElE7BRkoyYQ43I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774387051; c=relaxed/simple;
	bh=djJN0NFJKcWet7ekuXVYbmKExMR/Xh36O19+Zzakuwk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZyLNUaSWXGAF7TLkk7ST5wBH9Z22t5fyjz59HleuJikkdgrMSOL6+ptTy1m66JxUQixp4WUpF6TlGy1tWBfy7Oe7wt3WBdRKwTGidrq93G89of4KMZ2xGxNb8CrnkZL5KT+/3LP7yj3pvHDtyEPvDqjXy1HmZD6tHlkFEDMOqBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xGNhzrcO; arc=fail smtp.client-ip=52.101.52.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xGNhzrcO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uROub9kUWx1g/JYt06eXz3goBr+S0nOf74oXAUCf1dxTsn7xN9ZBEsrkAgA/kmnu1OBwI5Va8nsEuCTx8BG+ULia0AfQym6FZrU1WRJUZDXCSFbwWDRGhCMkqRWxRybNyFEupmAbNraWOkQnJIWHZ5ITBk2zR50J9FG0GF2KZ9gOE9BXmLJFxB0+3/iPrcQ/68LmiX7iVhLzcUWErkSKc1lnWaOmeSNaVUX5KlJk7uUWkvgWJh0nEAeafi9zsEuR3QTOWU/mxEacxH3QBFKF3PuhSzJzIFN6YqSx913mjjFUTEyc1Itl7Vw+MzZaimXceJPe1iTeY09Vz2LRPwdaOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFIJEotr1Rf28zDnIY2h7Z03GQoxIajf4zqC7oKK0mk=;
 b=K/VU/ttM28a8SJQZ7TrxjMVYr3FOfx8EdYlVH4OwHfqydb0BqtM+Gy0GYJihH25DBZHs/eok5dgFFCwpdCKWcPaD2VIoOxCDkF5iLu2bgg1g1uNckDOGjcrt2G9xJjaKLl8FSfPB/FgVpROC3edOlonPjl9FVW/svoief+7iWKWr4j6Gq7EffbmLIcNkwk4bsVBWGq37ZwXtyQ6MKL7Dup8URhs7drbyNPRgqnHKgk45TLaA6kBNWGvhf3EKNbFQfOr2dZoLVL0dytPoJyiVBYzhIg49mWfbW1jt9ct3smMx1ULUFsS4fn1s85uMF+iYvu6toO25FFyzRGXlI2rS5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFIJEotr1Rf28zDnIY2h7Z03GQoxIajf4zqC7oKK0mk=;
 b=xGNhzrcO8HrFerFgpjOXPQScIMVvnD2sXFUKgok490taJ0wXSgVTQ9TMCiXpHMtDB+0r8x/3TOyx71gh+Od2oeshHhEX3sCVZwGqvIgkRK7Y/9iPh86Vn5fqnBFomiL3xLN5YE5ByoWzRZ3sUpN/EhtXDEgD1HENPVjMdUXasr8=
Received: from SA1P222CA0047.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::20)
 by DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 21:17:24 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:2d0:cafe::26) by SA1P222CA0047.outlook.office365.com
 (2603:10b6:806:2d0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 21:17:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 21:17:24 +0000
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 24 Mar 2026 16:17:23 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <mario.limonciello@amd.com>, <Shyam-sundar.S-k@amd.com>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: Imrane <ihalim.me@gmail.com>, <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86/amd: pmc: Add Thinkpad L14 Gen3 to quirk_s2idle_bug
Date: Tue, 24 Mar 2026 16:16:41 -0500
Message-ID: <20260324211647.357924-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|DM6PR12MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1c9483-7681-4772-fd22-08de89eabe59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5Oym4Z4yx1eQZGR5ch75I7gUuEpjm5I1/j3w/pifmcSPuPDwP6/qzXIYnLJ+v1bCBBJGlDWGCE9Tqub2fqxDd7fbSRqusEQ1UtCbVKT4n30fY1x+3iNRGpuf4sREersVuFByah+U+pXb7pyR7nnq7iJqpPlQ215rgZ8fcIfPLMOJzoFGJUmruZz+qpLS3ls9T6NLGRWTkwJ34jPaQrwiYQ2E/9/gIrES8Wxmw0rad8sdjFaIyPQ8ujxUpjOhkH06h8i7qqMzKuy00YZovZour/tNEeoQt5OWYLqs1i52kaftCwe6Tw57SV34M3LnYVUvpX5Sqv60OqY5jcI9v4quEtesZl7KW8aR1WuM1kUX2YCh1fhqCELMLQjz53gc9ta9WYbuzl7T7k4+Ka2SbpBDNjtwVi96wqSRSKL42RTtNJo2AGOWKhTnLcan/2EDgIJZtP4MRrQbUgDrzQX03m9mnxcJy38Aj/nONd8nosihMb1kbWfi1fLXTxiadrrSXwaACv8u2aOKzjG4ACMbWOH+TOCqkeZehAfbjI1PAr2frpcIZ648nzBtXrdr39xA0zT3qBK2XvNdYfsKqCvo023H5OldmOfRJgZGg0PZ8AwHc3BgA9qxakU74WKT5RKzAceoZ8ZzQ35XcqX05Vb5xE6YKaqNjFHcsPu99RITsr6XqVqTkeIY7L79LliZJ8a6Xe3qYc5ohV4owOFZHhb24ahy4FX4KFiLl5whAUElvW2WOzY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6rkWBKLdjY1cj0y46eHfMRO+fpv7kXAT1vbr7tp1KKzNEKbS0Jp2w7GeDyJNoYOihI+AjsJJwT7UCGClxs4Sj5J34a8NHlTmSZIufNhjapXrJD9JyCNNH4cMq3kugoS4Hu00bQV3lNrrKBdCGcdl+SQKz3v7KWP5b8fURx8fl78VQaFvbISC6kjCrKuNKwojtOV2OUx9Asq18ybcKO+GHzavy7vsewnVlYUofiucKrR5f4M2LhHqjsdAO9GSxAtD/bC3k02QnnM6zme5J8XRtpej4Yo1tyahNeAIQ8a4CS7cyRf2KT0t9v1LeeT+QSzQb4e2bGM8fiIwr19ylpffPLLO3l5koXezugvAQCJW9MOaT0jkBP8HhlNVWwGwFQcAFSAs9/0zMi2ESk3CW3y+AZ3FxmuAHrB3sIBcDHZTD8t5yeQbfSjakZOPQwO6k3y9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 21:17:24.1490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1c9483-7681-4772-fd22-08de89eabe59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124

This platform is a similar vintage of platforms that had a BIOS bug
leading to a 10s delay at resume from s0i3.

Add a quirk for it.

Reported-by: Imrane <ihalim.me@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221273
Tested-by: Imrane <ihalim.me@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index ed285afaf9b0d..24506e3429430 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -203,6 +203,15 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "82XQ"),
 		}
 	},
+	/* https://bugzilla.kernel.org/show_bug.cgi?id=221273 */
+	{
+		.ident = "Thinkpad L14 Gen3",
+		.driver_data = &quirk_s2idle_bug,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21C6"),
+		}
+	},
 	/* https://gitlab.freedesktop.org/drm/amd/-/issues/4434 */
 	{
 		.ident = "Lenovo Yoga 6 13ALC6",
-- 
2.53.0

