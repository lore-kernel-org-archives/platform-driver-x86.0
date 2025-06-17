Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28B528C5D2
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 07:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144498; cv=fail; b=WFyAfa/+tTcHevbPw3jr3judUmn38N7X44iNYKA77/zTCTIupjpAAl0UOMz/cY9AgBAwf7DGMnhWH1QKJpvp45znFPOFrgmbiUOFY2ZZfg8jL/cACevuDDhoAI0ttLOQ7bcnrN3zHsa1/LUimWFK01l38/RyG6FV5u5OIMfUPNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144498; c=relaxed/simple;
	bh=0IzB3SAxhzRu9lrcJgJKSjMlRCVPMBhX9rMGqOkL13s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xvdqx1z7xQ3W6ORFF+CVK6ksMbT73R2OPwp5HIFCpPaUw7DBzBpP8I1F/jsfzsmzpFtNn0HsdROg82RqoHPU1/AtHKt8gl3fbnwnF+shlAK+RHXdPSsjG6HbSLkSIWXSrP/uPwDWfQJNY/fOEus1JAI9WZuWAYrihYl/5Mg/LUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LkHbBMZD; arc=fail smtp.client-ip=40.107.237.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LkHbBMZD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GghARTIJcwtWzZg+l3lh4l9UMgs9HJrCKqWqN6UgiwDj7dJjadpsOTiUVeM6t4LT6X3P11BX/m2EXy39XlgEnRJylCagG6JeZGLPIzC2pruYcJ11BeD9RXrA0uj31aiPauxpwh5RGA8jFl3H6DyuZ9Qg22X5R3lXhilh3p0nwpjkHUnVwl+6IlFIj8KJ4Pa14D6dIbT3xmdB0MnV0YUbDQDjx1qdove/3abzT8Gxt3vBv6HzAvfUwoK8q4bQXH0QJWgDlNbD4iuRdVmYzzCtRKOCn1BOOcKa1XOm+VtSD93/XBZyZ49QVa8kkeNGFCdpnMsQOz7RSq5xoVFt0NGpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CrmDSI/TsBV1CDPu3xHVySfvt2UIaUBZwu/ECI4xYc=;
 b=R7Xk6b/nEfdS7BkNC30Y8F5uBDlGtJc6nmVtWmiw3I6Rv68YLb/5ymQhH+FD0ntXL0pqzDYTIYx2nXCjDxYuHQFhuK9VbMLswHpU6kEHDf7bROfWkm1wvxNbYSHlbuI6z5mrE0Y0aE//QgyhFiSjkfRwcSq5j+2yjfnN15cbq/H581YFF/4676ohxqgOyGM/WECJiBVmS9PtfD7wOiaGwvzhd8q63VVeUJoOxWaWAmHWql1IdFrv86W2jRm+FWD9L/6QT+O5sfCPHQrsXicLJwGN9EChFiUFEG8lbWYSBZfoEPLDhq2GvkrkCeqFtPb897TPMKyrarVFXvyIKNZrqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CrmDSI/TsBV1CDPu3xHVySfvt2UIaUBZwu/ECI4xYc=;
 b=LkHbBMZDpzKPrK78Qv9mEtYO9dCjgq+fwJdSoRXlQAo+ujPCLQ5e/IQ1PaW6fNFBzvNPSd8Yg4tiuHWRMQO5IjwNoQW56w5DYyEQmISBPPgBizDeyYVa90MWnqAsbQ9xc2wv1blq5CTtdeIwlPlfctEBOTN/jhFaodJX67GJI7k=
Received: from CH0PR03CA0065.namprd03.prod.outlook.com (2603:10b6:610:cc::10)
 by SN7PR12MB7809.namprd12.prod.outlook.com (2603:10b6:806:34e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.37; Tue, 17 Jun
 2025 07:14:53 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:cc:cafe::78) by CH0PR03CA0065.outlook.office365.com
 (2603:10b6:610:cc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Tue,
 17 Jun 2025 07:14:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 07:14:53 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 02:14:50 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 9/9] platform/x86/amd/pmf: Add debug logs for pending requests and custom BIOS inputs
Date: Tue, 17 Jun 2025 12:44:12 +0530
Message-ID: <20250617071413.3906284-10-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
References: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|SN7PR12MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6e8f1c-cc9e-43c2-0065-08ddad6ea812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i5FgIfZ5KdRAtCHAl1X/I2BsVZrpTV6cpiaFjXzYjYHn/Ij/n7gfLbhVcfN1?=
 =?us-ascii?Q?8F63CBk3aFJcjE3EaFCxUWnkRl+B7EN/vDQbeXXLgbSdR387+mBDwe8rMTA5?=
 =?us-ascii?Q?ctYYcrBcjY7Bm+6ePJr5EShEdczn2QxS007+JWmX8d+te4s3PVpx/wwVyFjt?=
 =?us-ascii?Q?LLBXvH7uS8h6sQOouH73wbSZmHVuYrOKKEqnjNjwy07A2fm8LNtgRWT48Uh7?=
 =?us-ascii?Q?4Axk4oPatmFm+5uEp2GiTvL/5F/JiMYmeEN2c49v6RJKb7Bvr6H1SJSbSPp0?=
 =?us-ascii?Q?16fVOvV+vEe2B8Uz7MKfTCMdX87a+vXZ8ipzxdZsJKQib8KclMQKLtn+8QrH?=
 =?us-ascii?Q?Cj1/JGlT6UA4uh5rf/RPMYqx1gfgxS0uD3SWyQbtQxzhfPy/AcVq2lmrCWSI?=
 =?us-ascii?Q?iAUYwItHe9+1bFCSdQ2GOp8FZJh8h2iAX6ELBRmJFxHaKF4pXjKdweF8jRPt?=
 =?us-ascii?Q?GPPEErYcf8b34lA3XdQcVJ/8ZliditHEqhgj0bD0hJoC91amhWBFOs1wC1Pa?=
 =?us-ascii?Q?ljG1+499lo2Nj7lcBcQfU8fPEXYyfGLKtAl3yX1CL1EJYxkyyOTesJj8/jwR?=
 =?us-ascii?Q?SZrMs14tXEZZHTTAPMRcxbZ1vjY7kNSSMUAbfwCs0QuVtT9NlDM5cfI9x4QC?=
 =?us-ascii?Q?alB9ponaed+kX935BzJ/lLc3MT+RPcxHliH5ZjqeJWZil3UyOA673n5FauPu?=
 =?us-ascii?Q?rcXwssKrmm1HnjoMxG8/NY+LtdW8StdCQQCfH9g80wNorcQrQKh0UBKOXTD7?=
 =?us-ascii?Q?OSSuZ3lPlstB9dci9dX5lo/6nUBWwWowe2E88VIyWa0Xs948JomHz+9qeSzg?=
 =?us-ascii?Q?S/ZGxLlXi0X5FbkDS6LwHlYtEdsvvukb20nm/Sfz7xlnWnBDpeF2yKLW7vQQ?=
 =?us-ascii?Q?H9LdMGnjOhGQxEze158d4N/ZtxVmRYNYaKVbfmTIRwEj0SupTykpf1hOrfQM?=
 =?us-ascii?Q?VlAiQxi8xap71p2/pUu8UpCOsUwtpeDTCz76vA5Nrc+qcRSV9ylR5J/DJYnp?=
 =?us-ascii?Q?jRSOrdHLkfei2B6eBP3zWbeQ26UKSliyFPezKa7LBXbP03hVclqSfCGdoc4f?=
 =?us-ascii?Q?gg0C+MGsV3CwYaqcnxT+LmMRqjRuQbCl0R5DTrn2Fr+9SXDoz85moipKxfrq?=
 =?us-ascii?Q?f3fD0LODU+l2zk4giYLLRwOLJ4+p13LS5u3kUZTvU34oUKbaQTezGYDbBYpP?=
 =?us-ascii?Q?ycDFnn+JnxqFRcbRA3QWygNy80Vw0sZ7A8ixdbaiArFXNBiQ4OBBhdbmP5M8?=
 =?us-ascii?Q?Kp02Yf0U55GRMwKkrRbhAbAao5Ya3dY31AB4Y/ar76jiA2JBNJ1knRyHluNx?=
 =?us-ascii?Q?YyK2e599qWCk/G36X2fKzv9i9g1E8GBcRV5/ywAHWTLyXtE7sl/93ndDoxil?=
 =?us-ascii?Q?Ejn5nq3Aco4zLfP41YsRvMvZ1dZssyjy+3rg58ZOjHGIzAglbOB4SPmPRZG3?=
 =?us-ascii?Q?G36jGcDRs1NJpqGpr/XwPXs8SNJuqnO9VhWvUptUb7Zm32wHGBA2AjTvGGi/?=
 =?us-ascii?Q?VOcAG7lV9evu+fRUTrdTq1BZTYngZm3X6erX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:14:53.3687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6e8f1c-cc9e-43c2-0065-08ddad6ea812
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7809

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
index 97dd6025b4dc..1a165df5142e 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -117,6 +117,7 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 *bios_input
 			*bios_inputs[i] = custom_policy[i];
 			pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
 		}
+		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, *bios_inputs[i]);
 	}
 }
 
-- 
2.34.1

