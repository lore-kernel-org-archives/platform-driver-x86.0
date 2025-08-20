Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE952E6135
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 11:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690696; cv=fail; b=sepY432YHz1llmV8osDJn7B5Xuu1rYnJx7Q4F7KVwMnraKxaozDBhKV2rdzM4v2k3bMGquFg25PwMV0EafH4dAU7O9onAcKZZuGycvOhsI23psUR+ySg3Vrkar3K3jCqHKya36XBYznoFETbk5CNP6/GsZiuzuXDAaHmke+Zi+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690696; c=relaxed/simple;
	bh=FbL+OvWMwYUQTN9RuuDoWjtewvdLM6LUvZVMPEe4ly4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IiZc+eqVNAC6wUukPJsQKbTycGXXx03dh53hwYU5NG7wVSnYpXCQ4CoDIXnkZMSR0snsPOPy1lwgrZvzVj3vrLymndbS3tuNgKFC00j3QtQ0/KOmFj2O5iU/0RQoYqzoxsTvsd0gFVu9oKMUHddzMJEih2OtspkM3cAY3cBRT8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xsZVqXh7; arc=fail smtp.client-ip=40.107.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xsZVqXh7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eh6nTwjV30KV2YEyuzS4VDh1CsEngvff9GAg+q5KhoKblIxwPiv+hipLhkbJSz41OyP5YdrsDMzXzn2gb38l6IXSn33qrdGrMqEkuVO+zC1Un476qaIQqlebNx+trSBKtM+0UJsVBFUlKXUhNEwLOvZEqzFOuGq4+LPJcfI+0/pv/Z4NA3+S20FBDVWteKSEF3pPVvP1I5Gzy+0h71nzf4KlIm8cFdp67om2lIWZpzqpHnMscOGbAqGtELW5M/hWm62AVvETbsHf5EHZH3nIvTxDtJ7denmbZLucxDmPrSsaaw8kfsTn3hwYax17Hj2Epll5sUag4CQIraQHtB1bsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d90DkxXQMnIdK81YXkIXjx+KErOudQFjn0/jhUD/Xhs=;
 b=d37VAfP/ERI6FBxUDWbOCJSRuEx5Evxz7Z5QE3Aewl4rQNkTwd7iCARWT2ophRKluZje75LP49ZSNU0fyZTjJJ9zMj8nHJ2WS23cF42E1Q5EM1DH32NjrVf+nCFGcK8YWJ92IvJI2RUdSnCgKPzSoHoYBsdl5LazGKl2ID1HTe39hpzokGeYIizQz2BhW32deixRDYqU09ZVsnhSxBAhoaduGtVhQ+azKuvub9JCJ6hiKQXAZMe+O7mYjID49xkCNkBly43m/GB+WrWMqanvvEtLKwdcvN6qliKgl/dYJOgzXY80NVqDxUZof8hVaxY1LRFDYhmobnSkjGXa4prAZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d90DkxXQMnIdK81YXkIXjx+KErOudQFjn0/jhUD/Xhs=;
 b=xsZVqXh70lil0VC8FKMt+UNco0qYscXYqSki3H3i+1u9TL67+atCPrZSywrdZ6h8X2aU7Y4j06lK0/Uwt5VAkgv99RHjfTLtw3KoHhq7JNqelR5NFz4KEuxYBboGKLRhgu4V8txtJXR8d+bbXUBF7Dk2xot+sMPglnMAx40mOJc=
Received: from DM5PR07CA0092.namprd07.prod.outlook.com (2603:10b6:4:ae::21) by
 IA4PR12MB9836.namprd12.prod.outlook.com (2603:10b6:208:5d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 11:51:33 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:4:ae:cafe::3c) by DM5PR07CA0092.outlook.office365.com
 (2603:10b6:4:ae::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 11:51:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 11:51:33 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 06:51:29 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v4 7/9] platform/x86/amd/pmf: Preserve custom BIOS inputs for evaluating the policies
Date: Wed, 20 Aug 2025 17:20:09 +0530
Message-ID: <20250820115011.1448026-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
References: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|IA4PR12MB9836:EE_
X-MS-Office365-Filtering-Correlation-Id: 236f0065-0daf-49b2-43b2-08dddfdfe8f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s7lUKzsFA0YSOOLXPfw4TGxkk4/LOKyO3/1vCrbku8kcOR48Whlz7bQhnp5z?=
 =?us-ascii?Q?XgjTsrdu/vpBXiJXr7uQHespPzqHm4qbRHEenhCug5fUk1CxDzmoom2/euuI?=
 =?us-ascii?Q?Qta2xxf72bNBaOZe6tuI+BtRnui0iZJTe8MRzJMJhmR4b0Ymwe52CY5C4Tjv?=
 =?us-ascii?Q?Hh+rmwE/ccmhltZOyJ2G3paIbyyVGc0aNUdeFFlPJf7mavOSwdZLqE+CrS7T?=
 =?us-ascii?Q?brkGI7N9byZKnyAdz4HD354v3X1BO1IPHwxGVD7mfMW2ArOxuKRR1zJAGVrk?=
 =?us-ascii?Q?zLa6i3AjF1o+qB0lkrFK4XjEcbsVMcncIvN9OA4L3fGnS41jeX8J6Lk+aEIr?=
 =?us-ascii?Q?WabXj0yA4Idzvrb8gp0h5I0GoEcwxXiXR4E/8USYbFdCHKE6p1JZTKwdapOd?=
 =?us-ascii?Q?VaSgz6lx2W03IBnikdbqf8ZluIHeepXZjrniXFGwVdJRstqN+oIoBSCKeGvi?=
 =?us-ascii?Q?KZJw7QAaXkDu/2gk/Y09DMSPuAzoM0vKL6RSnE7r2r1LrrUgmvcgP3UvhTXO?=
 =?us-ascii?Q?KBMZua9SGe0LLjJDEn271Keb26VRgDiNcKPW8kLFVBAf5MANYUSG1n2HQCQR?=
 =?us-ascii?Q?XNnGezBVIqvDdCEcdeKmXWBaJtU+qfcBBeGEaE3WMB3ZodBkPHJSZ/vTJCZg?=
 =?us-ascii?Q?EFPr7oLI2NQ7a7XBvKbBPXpHLlnjFArCobZmMWkUwj4dKm+o/UdBUTsPf7Z3?=
 =?us-ascii?Q?2QSluy0/DyVzOuLBi+CFzPHUYeRaPZ1Z4NLKXmWXyfkMS2h92rAcUHkNRiIa?=
 =?us-ascii?Q?vYnBWFVlVpHQ3dSOmrHMkIV2eaqLpQlZebh/Jz1tHePl+t8wbCFD3WjCvNSf?=
 =?us-ascii?Q?njjfuJXBEtHZ66F6kHjmdttTsRJYXnY6GuT/OuNDoath9lryM1YZCgrMF4eP?=
 =?us-ascii?Q?cPWaCJPQyIsa58d1MQrRSJdjDlISI2Qoe9A/1XksVwvD8P0QDeCWbiDzSr+I?=
 =?us-ascii?Q?VdwU0hNX+uMHgFYWJCZVxovcpJXb+EjVelmJu9lWyZu2a1EsNBSZa7MQ+4kn?=
 =?us-ascii?Q?R/d7Ohu1OQ7LaXp63sGAt8Jaol8aPYOcW61JevWEp3EvBYYPbSFwtaDxFKUy?=
 =?us-ascii?Q?DPfmOCkYGGs9W4Ub+EX3uYNcsZVBQ4XJ0ZvoUgKOxzCY8ZTNRlOTDIuH1Z46?=
 =?us-ascii?Q?aXYrEy/WXHDaY/mjrj9dOBErVui22hSANnMqEVLQvrHLnvR/VH39TR8OOOl9?=
 =?us-ascii?Q?HwR5W8Y3Ku6y3W3emIJw4m4Zk5LFAeb9z4w64e0pT8NTVYBKcNO+DLZn4Xj9?=
 =?us-ascii?Q?ThBFmnvr4xbCU0yKsxv7j5t5FtbsDLcrwzre7VU9B0gQe2p+G+0rirYAu4GR?=
 =?us-ascii?Q?SlJOtCy91b4LGmjeXjRzIRO7sNhg7z/lvRUoRv7mvunqeVVWDF4HC0679fQr?=
 =?us-ascii?Q?EKiErjz3D2W3iby74o4qVFuqYaxPKcpmk6BiO88TcWoeEa4rrOUEJuC3Koht?=
 =?us-ascii?Q?NyU9/Op4jjC7iNiFJSvM71pb5FJ5HYDHtjjqmx7P9wBgmf2dkZc6VwosjSTe?=
 =?us-ascii?Q?mCGuAZaCwTLRCQLlKnVTM5Dx/EyceGa54Weq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:51:33.4399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 236f0065-0daf-49b2-43b2-08dddfdfe8f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9836

The current code fails to send multiple BIOS input data to the PMF-TA
for policy condition evaluation. Only the most recent BIOS input data is
properly sent to the PMF-TA, while previous inputs are overwritten with
the zeros.

To address this issue, the BIOS input data should be stored and passed on
to the PMF-TA.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 5 +++++
 drivers/platform/x86/amd/pmf/spc.c | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 54bd33104ded..52538adba5e5 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -353,6 +353,10 @@ enum power_modes_v2 {
 	POWER_MODE_V2_MAX,
 };
 
+struct pmf_bios_inputs_prev {
+	u32 custom_bios_inputs[10];
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -399,6 +403,7 @@ struct amd_pmf_dev {
 	struct mutex cb_mutex;
 	u32 notifications;
 	struct apmf_sbios_req_v1 req1;
+	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index f50cfd37b480..463683860db9 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -142,12 +142,18 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req
 		if (!(pending_req & inputs[i].bit_mask))
 			continue;
 		amd_pmf_set_ta_custom_bios_input(in, i, pdev->req.custom_policy[i]);
+		pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
 	}
 }
 
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
+		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
+
 	if (!(pdev->req.pending_req || pdev->req1.pending_req))
 		return;
 
-- 
2.34.1

