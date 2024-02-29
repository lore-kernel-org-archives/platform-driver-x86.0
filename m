Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954566351C
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 11:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709204585; cv=fail; b=R6igVlZOmhYNehAzMz1z/bjQsX6IcQ+QjLEIn+lnrmc2nSkI6vovRDc1jTlXCKaXMhFPbFA3r2iUsw/UM1XU0aJG2vWecVcdwgkzKo1PqxnJPKy8aOey+gh/smTfyXamWe4SrpjY9VcOpBWhRbgiERWqXhvB/uEM78ZkernqLDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709204585; c=relaxed/simple;
	bh=VkuBDPfl0mrvDsu4wliRIEKfo6vqRbJbI8fShW/RECg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R2IKRO7kb38wQdGqCJR3hIgjzcRZjxAQvO7iV6fxdBAhTWXpuOb0QYn6AMMEcdgosLG5XEE94qpxx3Lu2BoGZkNszGPRsaw3zaIAqTvhBtbCojB0T2/m/bgxJJC78gJkIZP8krvJBD575S3NNaOwWUlQh7fFBFQMvmF1lqYLvh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PFarVpmC; arc=fail smtp.client-ip=40.107.100.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PFarVpmC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ex89Es5pe/UCshv1zWq9qII+05JYfqK90eB54AANRSHt0jlnE+jabAabITiJ8HnZKINveplq8htTYri+nji9ZVR/1GAsZM6fpjm5fb+tSy+PbYWJEWjXBefG8ZeR0UP9wMFrtP3feRwAQPbkF9eaESV9Ot5ZiX+JJYUuYvkYg/Dw2pJMx4v43KJpWlQ+VZH57Op9TPfRSnkEueIj5bx41KJoAsR0dyYAOmLKKB2ymB5WXbqKGNNsmflQ2EQv58+GlBkfluNp2w2dtd0vPr2CL+pggnlluEPtY2pcdf5OfFScD3eesRLmOcRJQWcTDrZ1c4X+Gq1CI9U+FXoQv4iawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9UeoSho8L6gBBpuA1IO1ksF9eB1d/J0aWgbxnz+35E=;
 b=Si5tPcwrLOcBqMCa33FvKRieIo54R6YbyT4R5inLGxyGzCbftc4s3TKk+3ijEkH7DiETHpDbcwWoaYAcx7pFGH8nXA5+1Z1eNEEqoy/tamiwVAKCVqrYal29iODnUWimkSmWUMXuGn6WllcMHtkxjc1DElCZT+VWMtGZLMxt8lzeuaZNXZ6B1jKHL6Y4uqhwQ82xrQj9LooHGde0kw4qFieZOxeuoc8Tq/XzG/TPt+STtT4mQ6x80mIC88TeFfmsub17ClsE57bX5t4dh8Q5e5cqav1E81KXYulMfsEKZnCZfwKLeUf15p3XXxY37fGR7LVHFQD+C3oLZdMJPULDIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9UeoSho8L6gBBpuA1IO1ksF9eB1d/J0aWgbxnz+35E=;
 b=PFarVpmC5dAq9V0L1uS+mTcuk0OIcFAOKIcb3UDs0zvHYM6x9ljUIDj6HdnuaQ/zWUsPxk1qGBXPfhyGAT/SClBCyML1+P5fbhV+CYBGn2rPQllBQQjl65MbKOqyGQf4pMAtTVLX9m3Z45+05sJPfEa3P4OM0K6bPum9ZcTtIvg=
Received: from SJ0PR13CA0180.namprd13.prod.outlook.com (2603:10b6:a03:2c7::35)
 by SN7PR12MB7936.namprd12.prod.outlook.com (2603:10b6:806:347::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Thu, 29 Feb
 2024 11:02:59 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::80) by SJ0PR13CA0180.outlook.office365.com
 (2603:10b6:a03:2c7::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.15 via Frontend
 Transport; Thu, 29 Feb 2024 11:02:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 11:01:16 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 04:59:56 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND v2 2/7] platform/x86/amd/pmf: Disable debugfs support for querying power thermals
Date: Thu, 29 Feb 2024 16:28:56 +0530
Message-ID: <20240229105901.455467-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
References: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|SN7PR12MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3a54af-e46c-409c-faf8-08dc3915fd60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ju62ghH1vA+RIIBiJrhavKkNIbeAoBS9FEfxNVzfyOG9UaQx0zbWXGQ3/LpuAusieN0Pq1Z/sIWuIVDUZaC0jxaUqClGQrZqolP4esfclkJCw+YXtFUlMsDV5bKBRJ6FfAD+6X2TbL2U6t0YjGSpz9OEDMoQ8FaH8uKRl9iZCFedUj6duyLPgdpFvK8wWtf4eOTND8UjVAllmCn6LRNK/c0o11kBqDnTGyQLsG00joKBfs6F76C0s1rnaeu0e4IQo8IAdGxGSiibNG7CSVKoLoH0gtYCmzuXiiYRfM/p509FxnWhYHEUWMOqnMxtEOWtCkvl9i0d/k/YDZvqADhwmdH/5xjhN49JhUsJzN5UtOwXanhbN5FoDtw1tl5x6K3lfHrJ9yqdQ7ILrI3k+K4cN9KFp7ZBqdZ/FVB3WCHggD1f1K2Fiv5c1CvZ0cXbXmJt1UJJJm6XLAb297q7Ga/Yb9xuiuDS7zoXXoNUlTqinaDF8GajqBuITTj32DkZxcCSdbgmN506OdqaFbsGyZGHArNCNpjT+1V8bMAh0AYKd7Op8ANM6OKmxsDuwIx6VyzlgY6KAuXFZREAPD8fijRQoQTv+WSeIxLiA3OFReuDVqJ/mRJ1p7irWNM1dbC9fxvzdmN+reoOF9HnroPh6wiL/eRMbpfjH/szilyJOXMRFQqJ25/F32ldll5HywqG2ynemPe5Z4nQnE/IESluJewwMTBRwvvDM5mKGMfltQOnMns9qoYVq+xbblBAmSNd64DI
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 11:01:16.9571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3a54af-e46c-409c-faf8-08dc3915fd60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7936

The GET interface to receive the active power thermal information from
the PMFW has been depricated. Hence drop the debugfs support from
version2 onwards.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 5 +++--
 drivers/platform/x86/amd/pmf/pmf.h  | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 4f734e049f4a..2230bc2b1f59 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -113,8 +113,9 @@ static void amd_pmf_dbgfs_unregister(struct amd_pmf_dev *dev)
 static void amd_pmf_dbgfs_register(struct amd_pmf_dev *dev)
 {
 	dev->dbgfs_dir = debugfs_create_dir("amd_pmf", NULL);
-	debugfs_create_file("current_power_limits", 0644, dev->dbgfs_dir, dev,
-			    &current_power_limits_fops);
+	if (dev->pmf_if_version == PMF_IF_V1)
+		debugfs_create_file("current_power_limits", 0644, dev->dbgfs_dir, dev,
+				    &current_power_limits_fops);
 }
 
 int amd_pmf_get_power_source(void)
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index e51ac981af73..4364af72a7a3 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -83,6 +83,8 @@
 #define TA_OUTPUT_RESERVED_MEM				906
 #define MAX_OPERATION_PARAMS					4
 
+#define PMF_IF_V1		1
+
 /* AMD PMF BIOS interfaces */
 struct apmf_verify_interface {
 	u16 size;
-- 
2.25.1

