Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013044.outbound.protection.outlook.com [40.107.201.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B108B3E3163;
	Thu, 25 Jun 2026 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390864; cv=fail; b=ACOWp3/9iM1vNJIV+E/OipfMB1sEvITiY4ZsBBCSxQo9yxEP/wLXAWZ212TR/gv7+VjElCl6PrayJpynvF9ZKYAPf3fSmlx2yv5VgzFBtIgBbcXBSjFYKJwE7zcJ6OJNRVYs4wiY5EFXNhMBN2C3QcK6M2rLLhxzwAhP98CL7sA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390864; c=relaxed/simple;
	bh=/D+zNqfqv9WonpN8cBk+RmpqHkw3ShzUApdQmpzJBNI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bjw5XlMWKO8pp89CF3TXVuhP9VVi1rrGQV6zZ0fPRooFb6nC+uab2MNJfxgE9FD13HyZLuhfDLUP5pCTH4hlnlgzAcxXoFAngQmfQUtNHbA7b9ranvlrCmpSW2u/BYQPnQsGpQ295maoKkFMa69nj+x+3wQy6EPOsnocR6zAF6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GEH5SOFD; arc=fail smtp.client-ip=40.107.201.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GEH5SOFD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuwEhj9Xiw93C/y+dVLUvIQ35sDOTjcfi5ZP0LmY7pN5pO4W7EGYSL8n3vg87sztvbTXl9wf4O+6Nwu/c6RVtFtDoLD6Ft3+DiY6PbNR5oQCabqsR95dnOe3qHuggoBvczpNsbSaWGdtyqj2/VbZ2I8AlNp1o5RWGU8wkxdtCdJeqGlU12B0HqVyzrYnfxVBHRHp5ikQrh/rt3FjZki4dzu+xLGQCPgaJ1Wj5K3Nu3rsW2RNrJwftbfxFY5TcogdNTgMtwJzdwchLEnalj3E6Ri1Ddsg0w/YzcHqyVDzMtk+QC/eKm5cC8l7DBpeoQLPs5iVGu5T3Nl79NA7McLTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4fwXB4hDO/IXEEqVbuVgHzSTZ688EQohd4SKHS77qk=;
 b=n/zPRqnvCHUYS0eUyR9n5WMDyZJQXcSonWeTsnvVx8JZcRoJ888K/vIsedRcbw9hdBI5Fy3uEND0NzNFKZpRDE/rJreGHFQ3nL/3vMycU8b3MSRrN6sSC3FLogArI6rp5LwfDGrt2Prr+WZaGtn2suIsKlZW6wUVxMsM7B2sjhrsMw0IOyiwwGSl5lGyD7npSHjYiDN3uA+ydrxVv2tc5U14mUaYnz1Hbeqq6+YN7YlovxYKR9IFjbLD4rgzTQ6rU05Ys8sLIacM2WfQ3EVFgykTErBXurtJWgp+SAEWKkS+W55KKueSYMPvF1fp8lvgOjUVv5sW+u5Oa7xL5kbLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4fwXB4hDO/IXEEqVbuVgHzSTZ688EQohd4SKHS77qk=;
 b=GEH5SOFDK8RJAYNRYQyucXoLFopDD5/UBIYgd1uqT4kIG8C0fsLqI66nelTEP1MYJx0pbacp3TZ5HY74HT9y/foPqsw57SjEnYJriTF7mclICBGotnZ+rFk5GHyaxvAJ+mwNDfds0j87Le0teE6faF68jY69KHlUhPP+9TzlfVI=
Received: from CH2PR08CA0018.namprd08.prod.outlook.com (2603:10b6:610:5a::28)
 by CY8PR12MB7122.namprd12.prod.outlook.com (2603:10b6:930:61::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 12:34:15 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::24) by CH2PR08CA0018.outlook.office365.com
 (2603:10b6:610:5a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Thu,
 25 Jun 2026 12:34:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 12:34:14 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 25 Jun
 2026 07:34:12 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <muthusamy.ramalingam@amd.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 7/7] platform/x86/amd/hsmp: Drop stale metric table mapping on rebind
Date: Thu, 25 Jun 2026 18:03:37 +0530
Message-ID: <20260625123337.886435-8-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625123337.886435-1-muralidhara.mk@amd.com>
References: <20260625123337.886435-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|CY8PR12MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 278c62d4-0361-4d14-a5ae-08ded2b61116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kg+Tva9dtvNlIwuJTqZ5POiemGmg9ovbVYWwBN5a27qlclMxYAAp4eOlwn0kqGzO+15j+VsfenDrx6ZC/+KvfZhoKXbE8JN+UR+VZN/6+8bYCQ8IRHukSgySiKAEyMAY01XeaZGNqN3HqYZpULQh0ZvBok1pRV4mSuOJM3YWz2QJHYUWZQhpuidEGJnllD084JZM8ZT847VO4doC28lzmetIFul02G18ON/TXynrHFVqSk29IWbmctcfK/7UeFyX22/SyIiZqOuiG1PkVtUIPHkncHLBvdFgDHdUVBpHC+lJK6LIj+fKE743Zv4HT/Uturv0vACi8rzN+NKq+aXl/Nf37qAi/Betm39SnHKK9KzfgPwi2t3phlOzSBKNs3eIGg3z83DVM0oYaZI1Xl3+0s5GyOX7tVxL1QTby8EXkHgBfGsxfx0BrU87cZiC0ZYGbK/ly1U53dUdxLkxNMcTDIuB0/By/qJWACrbsyh2d+E4+p4x8kRGFXI0W49rx9bBWxWUgyYN5dNXPkfb6UBixOoEEweEBkJfTzeYP886PjW7Srqo7U8z1b6K99ieD+gGSa2oVFI+N3CiXou/VnJNOfvPiy18q3TDxN2nLnH+qInXyxTMtha/wV+Py2maSt6tc4gyN0FeFx5gHdxkjW11hMdF3Rpds6fXZGXGMmHNEHsgg91w6nCv+NOXpf6OI0IlgGZkxAWqV8CebKGoIRMCeQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3t78qgV3C7LHwzyJkbVsWRm8o/cpNo5rs5PohQKqMSCH+vJg3lvC213u8ZH7bwdMyh0IbQ1btrcJpVo8f3jCg1vpTN+fBBVd3u8/BtglQ1CKe7XaDKUIGAUD2KWAXcVhtmNwQnwx5VWHindQLcvXqN00QlLahCWNpu6th6HrPjBademGglAdKFwAySmyiVT/ix0kOvX5Hew+OU8MV/R376Kwlq4xymqUOoyPDDZi7lI8TY0ujXUb8A/wx5VlExP3pswPOilg5yQ398g2aOagaQ2In6cBRck5+ogdrupq1RiPS2373t1c9ZOuPRBX3z5fcVwKoU0ncJZSxlBzx1nVfT/evSXmcv8S01IPPIQzZh7Sm4kHgFefCRJuEUY/l54LAguQzlCqdUCIIQp5lefHfaaUb5H0L39gjVbgVWAXTqgngPo7dIoX3rBlW93qxffV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:34:14.5492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 278c62d4-0361-4d14-a5ae-08ded2b61116
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7122

Now that the ACPI socket array persists across a non-final unbind, a
stale metric_tbl_addr from a previous bind can still be recorded in the
socket when hsmp_get_tbl_dram_base() runs on a later (re)probe.
Re-ioremap()ing over it leaks one metric-table mapping per unbind/rebind
cycle.

iounmap() any existing mapping before remapping.  This runs during
(re)probe before the metric sysfs attribute is exposed, so no reader can
be using the old mapping.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 2e836124f486..a75190ea41c4 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -498,6 +498,17 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
 		return -ENOMEM;
 	}
+	/*
+	 * The ACPI socket array now persists across a non-final unbind, so a
+	 * stale mapping from a previous bind can still be recorded here.  Drop
+	 * it before remapping to avoid leaking one metric-table mapping per
+	 * unbind/rebind cycle.  This runs during (re)probe before the metric
+	 * sysfs attribute is exposed, so no reader can be using it.
+	 */
+	if (sock->metric_tbl_addr) {
+		iounmap(sock->metric_tbl_addr);
+		sock->metric_tbl_addr = NULL;
+	}
 	sock->metric_tbl_addr = ioremap(dram_addr, sizeof(struct hsmp_metric_table));
 	if (!sock->metric_tbl_addr) {
 		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
-- 
2.43.0

