Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDF422D7B6
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Aug 2025 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754302578; cv=fail; b=BV2lpja9gbZkx7DcxjpnVc5OsTgxymJ4yqHQDTInUZ+9nq8CYEKggofsKQpxJdopeFAMzz6M6qRlgTUGFRCDD87k4ZEn6KSn4q+DuB6r3Bz8sF4bqmtEvf/9mCIfdd6wFexa17NYLZ0xFPyr0oTzK5jkPscSBTGiDT1kxd+xK/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754302578; c=relaxed/simple;
	bh=zkDsAckE1/kGyLKd54R3X36U/PGxk7gErPiVNYRnPIo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h1nkyngGLFJ0Ef056MgEBpqB/sNGDBH6RXyCF8T17TTYkJBElDmzi7GD8AFAoMVQVc2f+VOq9qu8Jp4vNWXuEkKqMAjGB3qLtqZLDL/w2xVXeu1WFfsrBe+Yw2/3OkLgNxBkewiMLPl0srQD642TUX9lIcmrVnZiRRxQpDUNc+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2npmIdL+; arc=fail smtp.client-ip=40.107.243.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2npmIdL+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHG9GiVX/96bBY2/u9R4yd2vziQGpVtyjdcWLHkE+CqYBAOhdJiBKq7prmWvhSOHIyqwuYWO00ssTooOBv+ZXyfb+cqqtRqUGf+USbI0IQ2DlN1uE2c0wXF7yfmwgSni3rgqGyf4TaZZJUv2Ta8qZPhaR0mfishqRjkHyytSK/PNbY87HrSXjaLuOHTNMkqcqawVhkR6scAk6VnHY2UYyiigsR8HrbywQB1FYvOYuWDYVSYDFeJ+XC9ibelSLmT7JhAgqTOyfXGQHvr+UuTQf5KdwCXZLLmKt8H5NoU6SWpO8aNr/C3TYde1+ZrLuAiEy2pzyi1apkBBznPKYID0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjqaAgyviTwSJeDxS4HRO3c+6+m+wjZmFgH/RI/Ivrk=;
 b=rBfa/bro5hNUNKM6al/TmQOVAU4GtXHcAdyTsXWp1TFmrpsyO31dtQnBw0iWdv3H0Daizbktx4imi/rBIYnXw+rJq/qU6xWeC4hoFGBpPdDQtmTrVASibGPVNXiC5viHLIQ6xAeWrnNV+JxtNs1lgzdxQIcEOJlJjbIhHTvMOg5ikRfZV2ivlHfcqSCAmsPhdBGiorMowBaRmXqNP1UwBenBiJGnaEn/+VHS+nvIckBo40xidmQH4UFCmF7J2ePhJzREvdd38afmyBk9V/h5U2Ri13r9O7GqHbzUeEvBOj4xCtXtLWI1am1fuNOY9t6QJADCwMmjM3obODRdu/0esg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjqaAgyviTwSJeDxS4HRO3c+6+m+wjZmFgH/RI/Ivrk=;
 b=2npmIdL+tZZCwfCEWbb1tcGPTzlIpYJ0uesqCk9skxl2O+HoOC86eY8Iu7XZ30+bd4LtT/mIs/GWrXd2/Pv8RBy8vA8iKmfiDRKgIl81eY/vc5NxNG+h5ZgXgXxYb2/ycprGmuXMkA9f1IYQCUeY67svdNWz2AimuV5DC/vsWUg=
Received: from BYAPR21CA0027.namprd21.prod.outlook.com (2603:10b6:a03:114::37)
 by LV3PR12MB9354.namprd12.prod.outlook.com (2603:10b6:408:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Mon, 4 Aug
 2025 10:16:12 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::29) by BYAPR21CA0027.outlook.office365.com
 (2603:10b6:a03:114::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.2 via Frontend Transport; Mon, 4
 Aug 2025 10:16:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 10:16:11 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 05:16:07 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Ensure success even if hwmon registration fails
Date: Mon, 4 Aug 2025 10:15:51 +0000
Message-ID: <20250804101551.89866-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|LV3PR12MB9354:EE_
X-MS-Office365-Filtering-Correlation-Id: 280aaf9a-9770-40e4-8ea6-08ddd33fef88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s9j/CBEm4rqMcM7537fi7Cj3glATahrfKnReVHxzrBKNtypiTGlZbyaauNnd?=
 =?us-ascii?Q?W6teQpWRb/fDlKh3/BJeGxZCGhofBZ4H27t3pTQiomCogr2os23iCb8w2uKc?=
 =?us-ascii?Q?MEqwsxaEtwlgAIscwvXRn3GsHCBrzhTaQQB/JlTxTJXTQuXIOCXZMuQnS7W+?=
 =?us-ascii?Q?N32zqaKgG5xNEnTjhIyc9fwuB3k5vNfph2eKzuzYAig3aRXOHDW2OQvRFMXJ?=
 =?us-ascii?Q?gND5UVv1OY5PI4DNMtV46c7sq9oqn94HAo+zE7/p9zrduGxgEYr75ooXzhTn?=
 =?us-ascii?Q?7WwXaOzHMPCkgECJA7X2glojyOuupl49Idm3CE821sXePeNOfJlnz6poa31D?=
 =?us-ascii?Q?2VVg1oj8iN50JeLzQbHzu5Xe+drtdXskYYLHCEkrdNvB4iQ9hifurTcslN0G?=
 =?us-ascii?Q?7MwYHbqzhBAsus1uN5hPfmy62wSpb8DH3VFKLzlhNrObE/PxjJVQjDU6+jwb?=
 =?us-ascii?Q?dRquxC8JjjeQ+oeem1SQyA9H7MGTJ+nDJLVGsDrwkQzY0tyRkS+TUDhQOkzI?=
 =?us-ascii?Q?SsRu3Z6HOhDL936PTBxLC2x2y8vUiPrSRB7pIs6w3FCGf6mQGK0e1uYwIAm3?=
 =?us-ascii?Q?owLvFK1eJFJHTp6WG3dz2U6FLRqlHVf2Gs/SoHLJG3C6vaaIcoU6zu2Eo3zf?=
 =?us-ascii?Q?6QzH7HNV+d4OOt6kokgaStSLvNTQU8qWID3sd/lhNAbxRnyShx9OW0s8VqPa?=
 =?us-ascii?Q?W66IGfFk/ji3WBtoEEpygMYVNubW+4gB/B6SUiknFMik2RCz+0sEV8Ajw7ZQ?=
 =?us-ascii?Q?ijar0J8H4+xpWgsXFUMhksc4p3/mczJ3C9vmQX+ZNMKbKW1xvBH0+kKV7oz7?=
 =?us-ascii?Q?oJ6VQxFrIHY1YaE83OwF+TVAQLcGKH79/f2aByjUnK617N2/I5y+DqmCKvD5?=
 =?us-ascii?Q?U2FfepR6CPTn4xLoH8dc/HaAgx9gNf3VaoBej7Qi5ry/VmbaodYKfURy0vy0?=
 =?us-ascii?Q?KmSPGJSp7+HtRcVUNjn3K9Uy4KOHprgwBwRAk4tB/7QRmfOrQhfx8NowR6N+?=
 =?us-ascii?Q?kv7YYQnFOWo3sXZ5rm3O8IQIBpBuUwzhtnX0pnwbwNCld4kAWXAkp7Z2pi6t?=
 =?us-ascii?Q?0EogtV46K2fgEZ6jKKjT6GjXy8b4ntFJl/ntG4+/SXAH0ZuRVIl4zxlkiqMp?=
 =?us-ascii?Q?so2p7WGpPTEeSX2Xkmh6nNH75GyyS3VnOkC+0ubY8xsgYbjtya6e583cME3P?=
 =?us-ascii?Q?jjH1NCGPoktJFbAKtQBpPfkU3tB/BqGEgSF6jxdeJDLOXiaNaleMTv/8mT4/?=
 =?us-ascii?Q?TvmrUQyVAbt0Isqnz0w/R1kKJviTGge8WPvKhQfdTbG6Mtk8O4n4FFBkvlGp?=
 =?us-ascii?Q?oIdcuy1gvmbaiJWXc+Er794X0GHMqPKNyqa7oqGSn3cyGGQT6MNUntISne3O?=
 =?us-ascii?Q?u8C6wrWxeIdZPI34lTifHiLuBGmERpXBkfDKlSU7PspKJP0EPH2rTc54R7j4?=
 =?us-ascii?Q?UonsIbLEdiab/p0z5ub/I1NnT8NBGfMOahE48psuAV4HYcizmijf5wUrGTud?=
 =?us-ascii?Q?HmHWUw0PFqVbNtgOio7vaWe/0TwQKG9j5yut?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 10:16:11.0215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 280aaf9a-9770-40e4-8ea6-08ddd33fef88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9354

Even if hwmon registration fails, HSMP remains accessible through the
device file, so the operation should return success.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
---
Rebased on review-ilpo-next

 drivers/platform/x86/amd/hsmp/acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index d974c2289f5a..19f0ca7958b6 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -504,7 +504,7 @@ static int init_acpi(struct device *dev)
 
 	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
 
-	return ret;
+	return 0;
 }
 
 static const struct bin_attribute  hsmp_metric_tbl_attr = {
-- 
2.34.1

