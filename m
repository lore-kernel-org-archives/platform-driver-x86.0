Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510B15FB8D
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Oct 2024 04:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728881919; cv=fail; b=rgLsxH+QxTL5mMI0+hvwPxT4J98KRRZJj5DuXxHZJ1VJWwShzdLpQVPmx/cA041pnkP1BfaoTd6axKPP4O5/xd21VBAJyUoVpMt/e2Uzap5k6ak+BsCgCKJySBTfaZKVpTMDhlyfRPc1ngHWelDCxAObh/KYrtDflHxIlzXcuRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728881919; c=relaxed/simple;
	bh=HhYZm+iPGKuDtvi46VjRU3YfuuKhXqJjyF5POXDKKFc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cxh6o4dDxGHNtQY5b7KFhVipNbjUau4e6/pU3g9KRt5SZjpKdSzKKN1SMMybnVZGVSLsVww32pPZeGLlUOUzUrPlpcztwDulyt1Qzsq4thSBq6huqymwqY2XmiJUEaZjDKJMJ2OjNyJcCK6m4Vo9RX2egGjCmUl/k4QB5U/tSkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XnWxKUTC; arc=fail smtp.client-ip=40.107.237.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XnWxKUTC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNorCqgyULDwPigtIZIrpZDZiboNm1CoRbJyteS7Jno9tW8fGBEmDVvhiMh6Ox2GgM851VgJtRwe09lWgOUe4ZFkhOs/Jjj1DY1+7cKCFvbEujY0LMZCe0+g/hJhgdbJWGGSSTcS/aEabL3WtmRek/9XtNPnWFiSKsy1atlfJPFH5sND/aZBoJrrC2XZuopS0udRCgNR2Vy/sZcyZCdawfOsapO+Sstykj6c+VC/bGGbJRKnTBbB3Io4zwW9MoHcO7FtaCYSBwCrok8quUsIFOcMlyT6V81utIPtV5Ox3v475wMh72a71Kgogo0boBh2vMqaAibcdwZmcVAV+UfTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+XXZVDMc8PhO7hjdmO/cVY4l+dnrrE3jHqF8I8xcCc=;
 b=xI/ZuWIXHcwr6txMIrB/j/PZ43eJ4dIyeyNQ1OBmqtZ+kwpTZvoXCyB+dX74VMkqD3pP2EqF4alPZCoHIoEH+tywjyr4r7yLcoHzWzFYqWc/Ga3wPOcMXN9WPnBXjk/D5BptKnwnB8w22Vod7chWlON5pwknWrIll0RlkdyX/oDLCFfFYC23GsTELPqkjY0zXwb/uSaCLC+Xe9DnHV0I7UIoVy5AHVPW7YE6YgbJa0V9EgpCQMc3rLiWFeVheuAdRQQxsp5xZkXWtUBLMn0ZzXLrXj9qWsK/Iro9zTrFBqr8Bz1fZwMVnesSn7BOGII38kuvGB5ljgLtfWaDR8X+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+XXZVDMc8PhO7hjdmO/cVY4l+dnrrE3jHqF8I8xcCc=;
 b=XnWxKUTCayauBH6Kiy2dLx29bJr/QyolIvfd+yQWO55cwZFNbgS/k982l3ZO9HudCs90b2FSYdgggmIO4VnTOqsFGMylmqeaHZ9Sd5AD9TwOwYLYlfsanBGO8jomGAhuyXuAPO+V7GAGNxSP03oMw2eGLfTX2GQz9Ln2PF37iUE=
Received: from CH5P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::6)
 by BL1PR12MB5707.namprd12.prod.outlook.com (2603:10b6:208:386::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 04:58:33 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::c8) by CH5P223CA0019.outlook.office365.com
 (2603:10b6:610:1f3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26 via Frontend
 Transport; Mon, 14 Oct 2024 04:58:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 14 Oct 2024 04:58:32 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 13 Oct
 2024 23:58:30 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/5] platform/x86/amd/pmf: Use dev_err_probe() to simplify error handling
Date: Mon, 14 Oct 2024 10:27:56 +0530
Message-ID: <20241014045759.1517226-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com>
References: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|BL1PR12MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 4021fff5-e317-4113-e471-08dcec0cda93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sCAJbU9anzK06gbWhN3weq9NpDSmI1PRj5Mk7wv9PhrVUhXRHfy4SWnU78zo?=
 =?us-ascii?Q?5qN/cUGyACR8G5TN0HKMFBYK2Md9OOSe1YS6cOidr7/MKB4WAns9HQorAjQA?=
 =?us-ascii?Q?sLzrl0oywK1UfbM8lkijhy55K39rEvFiZaxI6lJs08IR6kCHoWm/qc1Q4aaA?=
 =?us-ascii?Q?aNqthqw9rcDKiSJYl1sR60zUck2wRA8TAP6emd8l2SoIYh1Kbj69ml3WyTY0?=
 =?us-ascii?Q?1cOgWVVKIC1Ww4qVsTXCY116mTLKzWGrLW1dNePQTqVvbJN8d5Mkspy1NZzy?=
 =?us-ascii?Q?09sZgG6ZSQmycONNE0ZSFkdvdM14qzxMyWTtmUF2EFBKgdAqswsoPv4ycCJK?=
 =?us-ascii?Q?yRoQRwCAtcpsJ6uGFZ+ks5ATYWr2YW2LIPWUv9d3Angm9SV9ZwjL/gni7BWC?=
 =?us-ascii?Q?UqJL9bebaI7wJUITkb6lTqawE7Yfo/EoVXh7U0DZz86zuwOp4EtPvst6eqqX?=
 =?us-ascii?Q?aEneqA3aflr/1xzLcXT3tFC1V12PH9/8TuhUJQzFF89uIkwOrpcsPTO4SXlc?=
 =?us-ascii?Q?B9R6Udjj1VedbW5+BQD28N0dgN3ByVAKDsfIZsHqNp32sVDw1X4H8/A/pZkY?=
 =?us-ascii?Q?cKM0lm8yDk0SHx0BtPZ++wTV2RbDUTRap6N6EYI0Hc5+b2N2b324oq2BW61u?=
 =?us-ascii?Q?3it72gkWDYPrsbt0ozyJCCObnjcYxtUo/2fgrroWc9mfgJy2VlsBnvvRs4mi?=
 =?us-ascii?Q?2+s8LJq8WOFPx6+BdjSfFA1gGyqCRJk+aZrRy95yLapnrFguI2+djGgVaijB?=
 =?us-ascii?Q?Q8iTqRysS3qOtu/shFQdED9k52jdAJnSreeTAe0DHx+Hd9rMcBAlh2xZMA2/?=
 =?us-ascii?Q?LoUA/wIh9De8O8OTKTpNH3QEZJ7XS9grt2kNEbZxcF8XvaZZfNGvPkcjgPjh?=
 =?us-ascii?Q?6NcfHjRyqVV3cxfEgEUqTtGOPy21rk2l2czVVf3s56l/662Hr6r7VcnwQy+r?=
 =?us-ascii?Q?oQ6M1ytcK0H3sSI5VZ+D+2sL1cpv8/knI/U21ah84ZWLJhtMKP4X1rGuG3B8?=
 =?us-ascii?Q?tf5tynRp0PJVTuzow8JOM0JzKRwl4ruI5de1xyzmy/TzpY815QAGIePnR3B5?=
 =?us-ascii?Q?c9wRnMR/H+zocms20IQXcwSVC+9pWDD0dy5TC2l9VZ6CJCPi6yVQPPtl2qse?=
 =?us-ascii?Q?sMWnPVPkm5iRN9sx84632TUDd2WwYxsUjAJCMr++Yp1E6YWPBur4gGzX7Ghc?=
 =?us-ascii?Q?n4rGapp4XLbsvoH4YznhjDzbjcpDmTAYzeauVYYt/O2w1BObamm26hI1lked?=
 =?us-ascii?Q?poJJ3NuEqHSqhHvcc69FBO5xeemTgQBB46N1Ch1GzgxZu0wOVZo9K6gkbknC?=
 =?us-ascii?Q?XzXMUWpdIcrTZNAHHQLSu6EEI7h9D+96NupMXl0MwpngSsZ7FjPWIOcFt4iK?=
 =?us-ascii?Q?M2eOFFWf978gyFmfwjlTinVbVDN0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 04:58:32.9874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4021fff5-e317-4113-e471-08dcec0cda93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5707

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

