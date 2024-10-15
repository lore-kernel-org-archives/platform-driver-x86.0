Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BE41F9413
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2024 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988259; cv=fail; b=ZTwiDpfWr41LJUuFLn28bltwWYCbvyQhzD1gULSPChpfdugq0kwwnv+24s7AzFRdDXHyGegM8C3Dv5Jll8ldhiuEc3OBbR9nJF8mqq4Fve9ZiOigWP8DsX9oZAFs4vuCPj5sYl4S8WN41uieP9l+bBWkggeXHsb3q9DmvcTHxX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988259; c=relaxed/simple;
	bh=HhYZm+iPGKuDtvi46VjRU3YfuuKhXqJjyF5POXDKKFc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T10WPaW4SSCKn9JCdDxV0IrcU0aro7uH3JOXun/wWRYMsDGCmy7K0aCFWJcFDjWEt1OjDEoWNzAOsCKdY0k+0SDl3vWj1UngbNsrEv5yrGNTQA8b3bXzAT+Ez7Zdjjvde/9zjdI1G9cWzUJifB0TjCM8ZQ3UX1mY/5W12uuvzMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ONOQy4NV; arc=fail smtp.client-ip=40.107.220.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ONOQy4NV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vugmAMs+jjnxZCKE66ArTkD/96c7cXNXoK/wLqE4UASg/8p7A1LVsKeEb412TjJpC6QsFqWkMpP3ZKo3r7Frs0/yDIue5aTQ4ckWle0YjIE8DmD8C11QSkc17KmDaYnVRl6DBM8YPk4C3QqARG0XsB8ypaehIEG7TgaUpnR1dULq+ah0T08G7DFGDvwQX5BmjTrHaZfXnMAJhZWDcxt3UZ+EKUI9Fegbvb/rIfoQNBDnu/UuBZWfF6mudbgAlSo8evvWmxNffOtaXoMsmUfMxQv9PajmviN9aeFGER1Mhs9TgbrYtBpnJ4tjr6oI5qc0zy4ckNkoB6GviTml//CNDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+XXZVDMc8PhO7hjdmO/cVY4l+dnrrE3jHqF8I8xcCc=;
 b=xsUXGOiKYaKTYimpV0E9PMwx2yP8RtU51raPgjr/0n/wM2HLVSZDSryl2OLLXYnIIcktSsIMBP/wkDO/J00jt3DcBHzhCexGiZARaFKwhf6LVh3PymgzZW6xxJW+sSQtSHtxHBiBXTinag7Qpu5c+HwBRP6itmD4xqISGFZ0R3ltg6KJappY9ej5XQL5GUw0CL7fIb8TdAvQ7ZmyAVrgLuGNGszPG7KXzEPBew6JkLxLGXePA7TYE7lvy6VMMKDEmDzoWdkU5leI28hOtTYSeb9ARPQf8O81rf5RaIre8lmCMluyqvZm89AnHhI/9LtE1VTV5o7cs0tK5INb32yawA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+XXZVDMc8PhO7hjdmO/cVY4l+dnrrE3jHqF8I8xcCc=;
 b=ONOQy4NVA2+Xi9+HhD6eGKTRfbiue3naMP09JuMQpy3oIhcbVLxkXpy/HuRSpK6wfJIT2kyF37NdH6xVpMWyZ4hDxx/HQ6YsRiymCQoeJ9hj29CJCEJSzzmvi0emPJ/ikIfkNA+KAQTdFHXKVVJV3FK3jzpMsOWp2tHzWsNviTo=
Received: from SA0PR11CA0204.namprd11.prod.outlook.com (2603:10b6:806:1bc::29)
 by SJ2PR12MB7963.namprd12.prod.outlook.com (2603:10b6:a03:4c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.24; Tue, 15 Oct
 2024 10:30:54 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::b0) by SA0PR11CA0204.outlook.office365.com
 (2603:10b6:806:1bc::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.29 via Frontend
 Transport; Tue, 15 Oct 2024 10:30:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Tue, 15 Oct 2024 10:30:54 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Oct
 2024 05:30:52 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/5] platform/x86/amd/pmf: Use dev_err_probe() to simplify error handling
Date: Tue, 15 Oct 2024 16:00:18 +0530
Message-ID: <20241015103021.1843019-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015103021.1843019-1-Shyam-sundar.S-k@amd.com>
References: <20241015103021.1843019-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|SJ2PR12MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 050e4db0-ff6b-4194-4ceb-08dced047334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nt1zumWneiTQ+haymZf73KixEKnhz0kPKhQ71HePgkyOts0ope/+MC4YuZt9?=
 =?us-ascii?Q?5ji4s5m+aLBOaSE2zi7cuT6pTAcUym1rXuF4jRjNvWOUQ9pdPhX6oWUlh4tr?=
 =?us-ascii?Q?M7nE8OhjBqM2W7GWuaIuJ3thmROTnoI86RjTushJm1vQ3hdMDP42fg93NCMG?=
 =?us-ascii?Q?SkBXPSkV6zvPhMtO+vIGe7X7LLUxea/zfv3upz7xjn0haZXD6YoBhbNficXN?=
 =?us-ascii?Q?YFXktxy/zF8QxmBygScZEjIfjvW5uarke0GdJ+qQDTHIEaOzbm61outv1o4e?=
 =?us-ascii?Q?T7f4wDO1ACFYrzWwvFn3xcHmXy7oPJcVtX3kpQ4N/RAmIiwOzg08msA02Ots?=
 =?us-ascii?Q?Veq6qBxc9n3DlkkUauTaNr3Jtfarppsy24syaGiDbnhpcZMJRKNnZUNQGelb?=
 =?us-ascii?Q?cGx22UStOLjpk5aALemlfOfM3+E4OURFY0VII+07z1+zq97ySJvzwwLDB4ls?=
 =?us-ascii?Q?lDtcIXtDKTtCz65qUYDAhrBuIh07hoQVlnijejmzmgJT7LftFYmETC2zr7I+?=
 =?us-ascii?Q?k47T+oz+y5k93z9EcREoq4Qnt9q1nPFN7bkiu5n5IB49GI49h65I+GHhp1nc?=
 =?us-ascii?Q?pkzVBpnCCjWFtA6cBBTHvj72FDbOak1Aotz+4G/oIBYpcwRQFVBmZf5zfPJD?=
 =?us-ascii?Q?4xUy1z6ROgHvzbKBQkNzXt9BXuEQXosI50ewZOyJ/BJEgC28z+Wpe8qJ2gUa?=
 =?us-ascii?Q?uUJeO7x9XfbgkYs+PJvHMeNVI3fr/9h4OV12RXtA7FoXL2sf9EDJOYCNn6hV?=
 =?us-ascii?Q?E+2tMmCh4QNbhl3BiGV7zeuCNiX3/ZeDQqNEK7FI0+lK90HEVjVD5N1TQ/Cm?=
 =?us-ascii?Q?8OiWU4Be6ewBPqNlIG3RXvR9exf3erELVCcpc6Rd5oItfVbldfPQoLTUgiEF?=
 =?us-ascii?Q?HzU5YbuKEU4l0Xi9aBw/yRPBjjJdFOkV5eGTft6ZICNL9Q+jkbNkIhmq8P+O?=
 =?us-ascii?Q?IyHYrNzzwQ+yHD7TZbaIkSJuU7A31i2Gfn5ubnEcwW2uz3DfnZpnZ63aMqxU?=
 =?us-ascii?Q?XbQ53v0bnXBlixTBhTBVWF79jelrgzP3AMHN6zIkO/l0rt7ra/4DGCWQbdfj?=
 =?us-ascii?Q?a9IzmEUXQ1NUF5aoByF1ho+6wmV7/U0JLrDnahe6c3DffZiMipfuUOEVAZjN?=
 =?us-ascii?Q?rBF5+WFEnA/4PSwlF8hAqVfE98w4XNchPNFiNQNJsWlIlNTg4B32xId3gjdi?=
 =?us-ascii?Q?yqdCnUjsJvmzZrClrWvvFLmpvU2JIR7KyFnKEKdWnrdHg+xI6x4UZpaK6nvB?=
 =?us-ascii?Q?9yfARkeovWF0s0/Fpt/+xDJIrbqwr42efwVd7NboN8D4lkeYy27PTalcBrSK?=
 =?us-ascii?Q?EXaLXW7n6H/doGHCaxSNIhYqGhQDQELvR3RA3+BDGd7oHKCEVI5+HIfcOsqk?=
 =?us-ascii?Q?AwQSKR0+eBYWlmxERJAdc0ZAhGPI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 10:30:54.7446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 050e4db0-ff6b-4194-4ceb-08dced047334
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7963

To simplify error handling in the amd_pmf probe function and reduce code
size, dev_err() is replaced with dev_err_probe().

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 347bb43a5f2b..12c3e929fdd1 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -430,18 +430,18 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
 	if (err) {
-		dev_err(dev->dev, "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_LO);
 		pci_dev_put(rdev);
-		return pcibios_err_to_errno(err);
+		return dev_err_probe(dev->dev, pcibios_err_to_errno(err),
+				     "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_LO);
 	}
 
 	base_addr_lo = val & AMD_PMF_BASE_ADDR_HI_MASK;
 
 	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_HI, &val);
 	if (err) {
-		dev_err(dev->dev, "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_HI);
 		pci_dev_put(rdev);
-		return pcibios_err_to_errno(err);
+		return dev_err_probe(dev->dev, pcibios_err_to_errno(err),
+				     "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_HI);
 	}
 
 	base_addr_hi = val & AMD_PMF_BASE_ADDR_LO_MASK;
-- 
2.34.1

