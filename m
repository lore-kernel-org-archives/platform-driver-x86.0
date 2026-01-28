Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722E52264A9
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 19:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769627449; cv=fail; b=Rpr5l+U3PHtcJ1737MJeeVx4spBqNZrg8gZTSrIny5czDPqaDbvPUJVUsjMwy8nfR4dN6cMaL99j09mdAoMUdAe4lIygJ/2h1dNeebRdbwuPBZWbPMwCtnN4GZzGDrLzipQ4WXyY6/vCUlN3Vj6XBKdcFK97hcISSkuEjAJwlq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769627449; c=relaxed/simple;
	bh=IvozSz83c4Xsghx0erHUOEEXkBwo/y6Zwozd9ZtwG1k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fk4FJWYFo0qfmNVEoCBlgXvhhhQAuaEKsaysnAkY75IlsTNkFRf5jPphRYoqRR8XLWF79npAF5cZZxr8WqTyuqV6srPwetlyACqOfZNywT0zEzN5E3uhWTlkjH022SSNlzcAcnhIBjxIEsNm1RQl+gAD8iZt+d0Go0VQPNHx6lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3zeEhfQW; arc=fail smtp.client-ip=52.101.46.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3zeEhfQW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4hDdkIXGyHmzNgGOnzIlsEQ8dk3iuHE3AH2Nk6WJ4ZpCC4+tmY0Q0e1EJQ4SWNkdp+JiLwymSRzUKC/jOlNPrcqN/DyMXcwy+Eh5DuxwWrrzwkagbf3x/w4AzjaoAhOn6PQ9zJkGg/RdD1IYZijfMtv1lq+wDctqrWKNkY0qZW3DYiDpGeOyfXNIRufgNbLDm8wjs/0SshIyqJ0H0KNK1517m2dGGrekbfkc9pPVnVtGrNWA+AJndZaRz9aufdLfcVEjnNtm0Awt/kTitskQrVIQJ+w6aV/OdI63tbAhL9JYEoGBkofIq7jAdjsvb+2G/9HI1dYfMd3eZhdRu1U3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2mmbNLGkYXhelqqI9iac69nZGMPAFpVExo1MoIMPpo=;
 b=iijkgy3L9c+836lIKeFP+4HzsELFbS1o0kI6CbxiSS0CcTJt1Zdwtam+b0iDkOGoMh/yMgi9lBYfOqFUnJFrZRsD0t+hvaw2ddpN8BL+pOYOH1MOPdVTDf87Lr/ntmRL3lHKN9TwgeoFmcEb6DOZXiv8vyEHJ7nkIYm9cxZsjTpvVH6Eu+nA5up2kK5ClowkDdKaakxDxPaZ8oD8ewhrWDKqeJxEBBVGtzeSF4MMIuBRkxAA8ReJdgPWr5i0qGuVBcAv2Lv2pWo37SlIbTZmqBRo86wRZKdyY90HAnbVRI/bGHILBKusKmo7olIDNpKoWWrevR03HnZdOUxBHQYwCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=hp.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2mmbNLGkYXhelqqI9iac69nZGMPAFpVExo1MoIMPpo=;
 b=3zeEhfQW38kSR2IHCWqYkkte6B9o1tryMyUNaXNYjUs0jTqfpk7+QbRX8YX2dzlrZ5h6H92IQh1334XWO5iUaJ/f7UkKNdlHkh2uqJW7svuW9iNLel+fkhP/md/NNufGCmw0qNCFXUwdtkhHk9CV1mcuAfVIWnE2qJKgfNDGDA0=
Received: from SJ0PR05CA0167.namprd05.prod.outlook.com (2603:10b6:a03:339::22)
 by CH1PR12MB9693.namprd12.prod.outlook.com (2603:10b6:610:2b0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 19:10:43 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::44) by SJ0PR05CA0167.outlook.office365.com
 (2603:10b6:a03:339::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 19:10:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 19:10:41 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 28 Jan
 2026 13:10:34 -0600
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb10.amd.com (10.181.42.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 28 Jan 2026 13:05:24 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <mario.limonciello@amd.com>, <jorge.lopez2@hp.com>, <hansg@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <linux@weissschuh.net>
CC: Alain Cousinie <alain.cousinie@laposte.net>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86: hp-bioscfg: Skip empty attribute names
Date: Wed, 28 Jan 2026 13:04:45 -0600
Message-ID: <20260128190501.2170068-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb10.amd.com
 (10.181.42.219)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|CH1PR12MB9693:EE_
X-MS-Office365-Filtering-Correlation-Id: 066f3cea-a985-4b79-fd4c-08de5ea0ee41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lr+C1W5y+pYEMUZrYoklPSLKuFif0krVbZ0N77F4DXWne2X/mXXWMZ0g1bZ7?=
 =?us-ascii?Q?B3j39mBOrhi99+6zLpXx0YcvVkN5SDR/tQcWF78CsPsmhpBk7hDOxRIzv4wF?=
 =?us-ascii?Q?DMQoSr3ANv5k4cXGhz5/Xdfn8BCsC9IvWuY3ja5ZW6d2PpUHDZclK72szQib?=
 =?us-ascii?Q?NWiqIk9tvN+RNlwa9sr5S0YP1NwDDwBKgZ1xOmYsEg3+96UUgmSscpRbg81w?=
 =?us-ascii?Q?BjVnkYxHL39OVUPV+Qy+aCSXvyGJrLH8qhbUpk5MZ5TomKqqaF9ejvUgUtCT?=
 =?us-ascii?Q?S2yNVuIBM+3/zll/8nrcpFXSD5AjSxlQipGygR7/hBTwO7cKlTgG+YOND5EO?=
 =?us-ascii?Q?kkn4UG9nIxxSiPW60I/OiX3sZreOIE5h/S1U+5qfDQwuCblmVJATjr8TP06k?=
 =?us-ascii?Q?Q0ReyS3uJs0CdAjK5Jvy6VAhlogYNij9+ETT15WR1tbHKdpFbeaX+xrCWFpb?=
 =?us-ascii?Q?++jRTRW2AdNOwsjpKof0QikIwyW8UPfRxDC/VTm4SldpS648UcK+lEna/4lD?=
 =?us-ascii?Q?9uTYTy9aoClJpX+btuQUcR8gXXe1R0YPahCKgaH7HRaSotOBtEgpSuFmFK8h?=
 =?us-ascii?Q?uvy0HUfWeQy/KZ4Y2WWvQeaLVO4MbbCAVHLtjqwzLkcPMop/CUnIgpWlHCnh?=
 =?us-ascii?Q?VfG+cquGEVSl9unLnpxCr1nLlc6D5gPF85o9bmIQuJQgySDxAvCEJYF/cIkA?=
 =?us-ascii?Q?qO4yzCU9Gn7T6qV6xWvArYmYUci98EH8jGvkS6zMUhGyjgacFgjFEJfNCEnK?=
 =?us-ascii?Q?e3ILWhZ3J2wCMZtT2xfHlV+utiQzD0UAC8+cy2E8sLT/4611VTP81pF5LKRZ?=
 =?us-ascii?Q?ueyRS2rodS6eNFqP0BPM++kAyzr6/vTfhbcF9eYMPpnGzQOkzofZBP+A1r5C?=
 =?us-ascii?Q?8l8lQExCvfYByh9L+WBBz8eRJBIOebZV0jvlY6nk4OzpXAKCtnXtjpQfNMIq?=
 =?us-ascii?Q?/+igodHUGt8huQJWfgDv3pWUKy0ipyr9MrrGEeCjmkwORs7QG3BAF3bpRlIf?=
 =?us-ascii?Q?dCsdY6YsM9qmX87G9LJdKS3063ZvITR5RLvzG9wQ1jkr36aAy5SGuhEUOdKj?=
 =?us-ascii?Q?ueCBsao9yJrEVyXzB/JzilsCpGjbIR+ICpkApt+GGGKsjTGf1CydOH8NpwOQ?=
 =?us-ascii?Q?/Xn24LTB0PD/uQOFUsEh5fhYozrdFHl71KlRUyG2zbkv9f3SXoce9eTKjfiv?=
 =?us-ascii?Q?cBH1ZDht1UKb6Z7HXpK7Kq6l0d4CzrKIVr3iIZqPtySa+SlZoqAA+NPEGfTA?=
 =?us-ascii?Q?X06ZP/6DKhpW93TFF/83UrAi/zge+1Z5UTvM5fJBso8cQYV6MNtpK8mL8+J8?=
 =?us-ascii?Q?gMbhkEYRrbyQ4xtgkETsDPzusal4bxlm0Fuv+sbVDAZnzOhPAa2wz9zyYyrz?=
 =?us-ascii?Q?j2QdHBrXDH7Jy8H+Iq2Irl+Bew5dGFzajZ5pJY2uGV29PaC4k3dGI5C0yUtC?=
 =?us-ascii?Q?2hCZfcH+MXplPrs78d5W7CPkVoFomXMZfxlMTz8ocEyl2MfNOhfphrrIMz1r?=
 =?us-ascii?Q?ngFPwFl5VtTcTeh4feRmOWxrkEXh1vMRgo+o4O3MzSmWhlgmn8cilgyDtqKR?=
 =?us-ascii?Q?fHsEKnHsITTE2GBtlKOftlyzpOjOuKvqd37WU9WxTNixYXgnoteC2UKbru0R?=
 =?us-ascii?Q?GzEq0+AUZNNQUUBrU3dI8gZHX1Z1GFDQ2R3kGT4HvDQ/MnPy9Ux2a2LZ9mfb?=
 =?us-ascii?Q?CSXxAg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 19:10:41.7165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 066f3cea-a985-4b79-fd4c-08de5ea0ee41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9693

Avoid registering kobjects with empty names when a BIOS attribute
name decodes to an empty string.

Fixes: a34fc329b1895 ("platform/x86: hp-bioscfg: bioscfg")
Reported-by: Alain Cousinie <alain.cousinie@laposte.net>
Closes: https://lore.kernel.org/platform-driver-x86/22ed5f78-c8bf-4ab4-8c38-420cc0201e7e@laposte.net/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index dbe096eefa758..51e8977d3eb4a 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -696,6 +696,11 @@ static int hp_init_bios_package_attribute(enum hp_wmi_data_type attr_type,
 		return ret;
 	}
 
+	if (!str_value || !str_value[0]) {
+		pr_debug("Ignoring attribute with empty name\n");
+		goto pack_attr_exit;
+	}
+
 	/* All duplicate attributes found are ignored */
 	duplicate = kset_find_obj(temp_kset, str_value);
 	if (duplicate) {
-- 
2.52.0

