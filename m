Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012036.outbound.protection.outlook.com [40.93.195.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379023B8944;
	Sun, 30 Aug 2026 14:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101013; cv=fail; b=P1hhCKCuvadDOdMcMUPzK6Jyupi85aL45w42oKL5Fcqlxs0GqZ3+S2xlDdq3g1dKVwAXwsPJ8Y83DRkSKGW+G9vCgSvVzP3ZhW2ks06vhUrSD0mAOYMnUzrGndTAnCv6hiMH6leDpart13hXLzy3tR/BBJve+xT/PusxZ0cDZZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101013; c=relaxed/simple;
	bh=Cacmdihm41bpcmaX5+wN3YG8qlt7usrmVE1hDmXdpfU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sM7gMjrjNlvLT90fQUK4AH8pMdVjUbwHzIX36elZ7APRgUPnhgSUdj6xKFeNVj1psMwuy9va1mbUCHvbeByHE09t7ouJw/2ZAEZAVAREzL2mrwXnAEq5F0/ZsLL4yy1BfVvHAmRmSEpPrxYXtOTovuMG/718K5SR5JVp+X/JvZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G/FpcLeV; arc=fail smtp.client-ip=40.93.195.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G/FpcLeV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNqiFxdlQq3mc1UG/XCZ/OjrClH5VryuuNGQUkHzEZkRthA3vAQ6jMTKhjfoZS/0R27ev19NctVV+IVw0hgSaMjYt5g6ZtwylALraNtPsAi7HF4mqlgm6s0bk76ZBKkrlrALeyhUzr0a2bTuglT11st9Pr8mmw+DrOpPTCyDJY9tZ6kIx7vp9g8sGnniJTXNxuygZU+ZVFxXQlSgYx85Xftxew4FT7AECHdKtFtrNB4v1wZigbap5mOGehQyu567LIbFmK/n8+YFj6VtDGLvCeOt64RkJa8n0VJg1hiNlZYiRhzmAzCsyf/w+EOKLjN55Jy1vsxS7R4RWUMSMrwsKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3awfUbNILWS1e9cOIVKff+WkPByDYeONIWAbkGbbcH4=;
 b=noaamgzNJTO4Wup044cHqNlijEwybLWiG4YRYVcZD54/F/+cQhd1ZJe/CMIexMAx1oBsSepuYcLZwIO8+2gZ8k6uY14Eix0JQPXHioyIG93I0NoSzk7sjSuYxS0NgHbMt9sMW7Fo0OwVJ7+duxQdRk618m/L6ES1ZjdyPOgrNrNaCsFrRzUZTY7jgBQ/y4fOMHDUsx5qJZRTYg9epKPBlEOHncbAuDensG4JuyCcwl39558Xbcwu797HTPPBFuFGez5kSkonrfMGETEjgJDwbdFxZqdLDptUPjCuTHAyWksp41XM9v4IAhybPmjbZR7lNN/Xh0N1IwEKZSJ0Xep5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3awfUbNILWS1e9cOIVKff+WkPByDYeONIWAbkGbbcH4=;
 b=G/FpcLeVKv/Lo/FRwdC5f91mQt16A1jUBefFtrfY2OO9+zhNKMITITL4jwIUzzgcKCY11YiZhgOH6f3WxY6n2ccgtiVqHx0WeFtoZ4BpZMM/hiqn34WlV4KjiNO6Lf22g+O6KPcqeFYbNu87VddyoZ6qm7OTfBxj3lUUHCfqaHA=
Received: from CH2PR10CA0010.namprd10.prod.outlook.com (2603:10b6:610:4c::20)
 by SJ0PR12MB6944.namprd12.prod.outlook.com (2603:10b6:a03:47b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 14:43:26 +0000
Received: from LV8PEPF0000005E.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::ab) by CH2PR10CA0010.outlook.office365.com
 (2603:10b6:610:4c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.12 via Frontend Transport; Sun,
 30 Aug 2026 14:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF0000005E.mail.protection.outlook.com (10.167.245.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 14:43:25 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 30 Aug
 2026 09:43:23 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v4 3/4] platform/x86/amd/hsmp: Add ACPI client support for Family 1Ah
Date: Sun, 30 Aug 2026 20:12:55 +0530
Message-ID: <20260830144256.2113643-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260830144256.2113643-1-muralidhara.mk@amd.com>
References: <20260830144256.2113643-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005E:EE_|SJ0PR12MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: 61556c48-008c-4c0c-26c0-08df06a50c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|10067099003|3023799007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	+jr+g+7ShxJ+lr0giXg12xuY7fiE7KFdrb4zHIhTG7LPwpT+5MmrQto9s850E1KV13oY1lAk+zQoQ9MlRgfZZdyI706u/l0VSRhuilUgH6bTXSw0GzMCdDSuOaEEHlqyAnfosObFDgFIprQOqQREe7YliiwAhqy9Je/f6/PBzAE/FnRLGLEKQwaZ7Wjx82RELbApiz7oERD8DOl8csTdQRV6HL6VARjsXrOmbvG8NbPTITTpeNxcwePlZTO0aBjjU+4+FoaQWRi1NCxJuoaEtZTCY3+v1mOtc0taB7nGH9zomK4PP/hUiWsakcJXbztvaHe7J+ewEZw6xgtgn6YiWLjRzH9fUQ6O2e7SXOQwX1vTipWv2RXUr37d6Q7Gc1GSxUP/HV705mB8+QGRQDZm+xzwR4Y0lx4O2+WoBeedMv0fiZzdQ+KoNKa1W7bWd5tPpIs5Uv3yQaLybV4E96AK8Pc+YEAnHWAMayapXz3Deh+ywiZcLvXTc0R8DX1lVUblw+kGKzHAluPyqKbtu5eaT3qjfv9l9X9X6/JvefJbnKteuU9HYNgUwerGkUCHit1VwBZYWuEFqeXYiMRjv6/1csQFazzZuTKNUeY/a2dImeafP92W4UyMZA0DaO0L9s7TG1AR2XjKS7HCsBcF6P7yG5yzFigs8GPp8KCu0lEqGVFH0xv/V/YqQjx3Zn/4d5d8RAEmv1odycH4A2Mj6sq45g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(10067099003)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eeoCmaG+AXRaoUEudwn9G5suqovgLXuugfhxVBL7wUlC8xZ75VUzeENBSkEj05mE+cR6nuaQLywzc6lcy5GLm5oVJa4hCvwWUx2V2khx0bPxvAYGaf6W2AbYUmBWgHwF1z7xG0T8n76r7DnrGMBF70rSrjibsRzFVBxJJ7WSsjicp5yu2lWglqooEs7LESyczIyNKfO8J1kFQgIX7l8bCpohJZXFAbAwz7LxoxMMIiS0uOvX6GwD0jXey6pj+JwttNgYKKTqDs2b8037b9yWqUU8z2HHNOffp/lKXPMUqdeWCmzAYjtogNs/e+vdCFx7SbY9IeU7B3u1Btfo6ej4M30kOAH72nxSREiG8JnWQB6wGsEsMaUBcCw9saVgzYaRVbU8aiT3ibufl/WD5n8l1Cx+GIE8stRiKTGsfOnon5h07Xju7l5b3MfsiW1WAxQL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 14:43:25.3719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61556c48-008c-4c0c-26c0-08df06a50c36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6944

The ACPI HSMP device (HID AMDI0097) on the Family 1Ah client platforms
(Models 80h-8Fh and E0h-E3h) describes its mailbox the same way server
platforms already do, via _CRS/_DSD, so hsmp_parse_acpi_table() and
hsmp_get_uid() need no client-specific handling.

Client platforms don't report a server protocol version, so also gate
the metric table DRAM base lookup on is_client_platform() alongside
the existing proto_ver check, so client platforms get their metric
table base initialized too.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 8257cd1da48e..275258ee86bf 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -557,7 +557,7 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
+	if (is_client_platform() || hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
-- 
2.34.1

