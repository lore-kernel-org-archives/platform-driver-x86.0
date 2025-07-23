Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B3726E6FA
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 06:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753252938; cv=fail; b=eNZ4VUktV1w7rGmsNKK9MYBDQQYpfLJgpclQuYeZTed+8gLqqjkL7M+O+gEOiaCuptHcNWGKluF4tntJ6A2QvRmeoWQ5oe26nPj9LjLuB0FMv7g0h9rP3sUgcWPew0pLAEJaWu3KYYYvQlWbcsY7Ez/QUldzUFejaneRKt617MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753252938; c=relaxed/simple;
	bh=Ngr4/bG5VhXqA2sMhwddmUbd92OV6WZWtu/YnSDpP34=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aLyNCd75cM0i+uajt661ZLGuknhq4MT0qovmW+JhsC+ABf9E+CAPpRgEchyxGwOnU5FsxJtxb3HUAxElAjHD8yZP166Fh9y6OJmHrv5pVQ7AUeUtwHm406K4tW1929ddnwHgQLYqpphcYTK7TTfzOs9pq85FOe3KmLCJUDdI+oY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4mm79TzA; arc=fail smtp.client-ip=40.107.236.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4mm79TzA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mN2nx/7f+8n4aOqO0RtYJ5FcGbRCKhVQ8Nb4Fncx1Q0xIUjgTlR0gsqYfCYDTqIsCNDG9ubTGRJEoJkI9Hw5W+oB6rVj12QF+Vapvj1xGumEmymStCLuqwC5KcYsHe4V/jrRuVEymdjIotK9jJtAtS75234IYlsCS1rKx67sQNvjIxcu9FjLpMPjTDgjTuilIG5AZ+Kb+Kez5KCWk4ID1wSBhyACHjlMAwVQJ7Z9YO5j8Ipf/KzAECmtOW8cg4YeqJSd26upYNLdqk7GdEyGeQ0+FD1cKeRb5xCWsvl6rce/Pj85hsESOyJdmj7rcWa7VgDGgNHKtd25DREK8p8uTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cM6EvKvnvG3rNl/4l40wggDAk7aXRwWzb4NAIzjfi/U=;
 b=ArAHvFlMNQ74tUcc2GX0JUQ8SkbAy3m4UsMrfqUv65oF11ORmWo750zG3KYr1SIAEzzYvFaJCiKsB+NwnVp8zceXLRlKxi9a6ltGT+FXZAmNCVCCCgA4/1mulEIaibR4iQHDYeDhNVfXgeUjcsXB/JMvmFeqM4Jw/jm9Nbg/PdLEBfCZjvPX/8cDZ6wKUdiI/w0IvqFBvuyBIlqI2o3I6srTXfXUFBslbDzY4MAu5Tv3NT+1Do7vtCs8UEqSmVBJcWmlI523MGml+JIhqI2Ldi1oJbOBOR8ezJabA5Y8aXDwI9rvADGAI4CFMa1JstTmqLNYhTf4JpnJLNZQWnl6uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cM6EvKvnvG3rNl/4l40wggDAk7aXRwWzb4NAIzjfi/U=;
 b=4mm79TzAYhZX99RtQpwNQF2IfdctdkPOxZWtalyuSyunj8FGtW90K6wYD+nhcjQV9UVQnX2ew6WDIbk/mjNDj/p038EFlNOzSeXvYq3pXOvcesZww+CkC9AckxyBlmXtYH6RSXjl+Rn6tEV/eQFy8gmd37xat0e4y8qM9AD3w7Q=
Received: from MW3PR06CA0020.namprd06.prod.outlook.com (2603:10b6:303:2a::25)
 by DS7PR12MB5957.namprd12.prod.outlook.com (2603:10b6:8:7c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 06:42:12 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:303:2a:cafe::84) by MW3PR06CA0020.outlook.office365.com
 (2603:10b6:303:2a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Wed,
 23 Jul 2025 06:42:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 06:42:12 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 01:42:08 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 9/9] platform/x86/amd/pmf: Add debug logs for pending requests and custom BIOS inputs
Date: Wed, 23 Jul 2025 12:11:21 +0530
Message-ID: <20250723064121.2051232-10-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|DS7PR12MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ef9fec-9632-4516-c149-08ddc9b40e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rZhZfOfpn5n82sNT/obckvydwaIDQ7qzJgB5yKI7sQLxUWfPon5lUOFmG06s?=
 =?us-ascii?Q?OqlSf0khDV31wvHuSyyHjxnDz89OIxd/U68jVYcYGVqer3lUNUginmUco1hB?=
 =?us-ascii?Q?NVLoYKeygl+PICPbPCwJ9DBh9IsMGfH1aNML0nxaPemu9W5yYOhM35+QLNsG?=
 =?us-ascii?Q?SQ4mO+gG6gz0AIKOpn569TLlxx1pwkNqwasDOcJ2yLcAiv3KGMWP4cw+jKnG?=
 =?us-ascii?Q?vfsyYWIhNmzBIaXKPbKRhecKlQmYhmiaI28YHk23RubuDuDcD+R9KPJS/2F3?=
 =?us-ascii?Q?Xngh70Lx3GJL1vMRoZD3JN8wKWpJt8AUy0kHGYmQvj85MCXejFSFJU+5GErg?=
 =?us-ascii?Q?wWjqigeJ9yXLOWc+I5Zvmxri4SF7uTyzqkELCIdudM13NNL47/JHIWjP6GMw?=
 =?us-ascii?Q?4XOhLrTMqfX28ZbA4mLt8xjdxmIjgWm8lHyKtAcsEu29B+cBRI8A/Kg/HNmD?=
 =?us-ascii?Q?CsGtYpyiFby7bRmGzzRKAAyF/tLitbkpvjWmU/iJCGcHBFuL3qeuWuN0d1xC?=
 =?us-ascii?Q?yloeRIpno4P6tMgLcMGbS07AXb0r+3xeX0/MDxcs0PLXopcK8xDxOuYYSaKP?=
 =?us-ascii?Q?xCZbPKzKACyevh2AXKKmPQLHtVjdETcLjz4vakhwAfzCNnZO9MzdvhmK8Z04?=
 =?us-ascii?Q?a8s39h8pKfLP/HEwFCd3gJzlZk/bQLtGDJZCWFw98R5wpP0CqNib80GEQPaN?=
 =?us-ascii?Q?6Bur01fp9vIquYAUc1Kqox1Il0Ph1JWUSxJY87RQn8lkDQRpDByX6q28SbQN?=
 =?us-ascii?Q?kisAYpThjf96qOYT5i1ElL5VrEFeRyxtzYQGWlU1u4k6RjKJxOQ1vd4XqP1P?=
 =?us-ascii?Q?mD6q3ru7KzOoBAGNmCXAyrmURA/erao3E8kCN7TtktScZlIg4wZcAXDHOo++?=
 =?us-ascii?Q?fTuFp1PRYYllOm2+406Tilr8hRTZRogHkeovsNS39xirx5kQzNW3XZv8X8RO?=
 =?us-ascii?Q?eNw+C7OE3uz6BY6rpeuS26HsAuAmt2/4q1jIdZMg0yLXeb+NtoDPNhRT1GYG?=
 =?us-ascii?Q?pua5Z8/eltE7AvocxB4j0zWwmtfmhlwx56SuFfWe+SPt91TUZzY9rP7PwiuA?=
 =?us-ascii?Q?T7nQnvurhL9lwM+dX8zcVN/YshcR1DAmZKCU6IL/RpE5ZT9kilLJ3a5cnq52?=
 =?us-ascii?Q?JQmbrrLB5QsMJVMFujMikDk5khRx+UHyqbT/8SpvSsS0YuRxPCeqn5xCOYJf?=
 =?us-ascii?Q?dHjIsIMY5Jot4e5235HgCGwNFxTrAwT5j7q49h+kjq+Nuk4x1iyLmq2qB83+?=
 =?us-ascii?Q?jJ51GkUPW/Sb4Cq2pqEcGRtcnxw8+4dDPzUwHY5MHy8j5HUMPria+I34PJpR?=
 =?us-ascii?Q?gKPEyt6OMfCUlSmA76GSUPvMaWOLm+YBm1nDcO6yAUBRNxykUgeSOx8bIWkY?=
 =?us-ascii?Q?GcukIL1OByxV+tcgyo1rpSuehEqR3TiNrWHdLRP0fpoehraMpiulVpEjC0pD?=
 =?us-ascii?Q?yiFU1A9bieDKkyBswSre2rSjUomf645fycFF39lEeciweIs22+MN3tN0haA+?=
 =?us-ascii?Q?mmq4JJGepNRpeSn4V+YJMSKV9NRUvfW2JmYu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:42:12.2941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ef9fec-9632-4516-c149-08ddc9b40e18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5957

This patch adds debug logging capabilities to monitor early pending
requests and their associated custom BIOS inputs during runtime.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 4 ++++
 drivers/platform/x86/amd/pmf/spc.c  | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 7f95a8b6c1a7..edb785325c58 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -353,6 +353,8 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 		return;
 	}
 
+	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
+
 	amd_pmf_handle_early_preq(pmf_dev);
 }
 
@@ -369,6 +371,8 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
 		return;
 	}
 
+	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req1.pending_req);
+
 	amd_pmf_handle_early_preq(pmf_dev);
 }
 
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 6cf179c9ae8c..5284f7085904 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -148,6 +148,7 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req
 			amd_pmf_set_ta_custom_bios_input(in, i, custom_policy[i]);
 			pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
 		}
+		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, custom_policy[i]);
 	}
 }
 
-- 
2.34.1

