Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2079.outbound.protection.outlook.com [40.107.95.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E7118787C
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 06:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730700210; cv=fail; b=cuoH7UnGk2RiwpFloPEIJNszT6MILsv+oLcCujQRyYab4oG/k0IsJW0aA87IyBbiuKUZBOCBloItNpsdRUXHWoXPHjFeb/L1uIk55hCIK+4qjbP+eM+DszFD7Jd3qrfNBbNpBYlJoJJIcJd+zqxmmYzkrhG0epUx+YDKaOwKZ04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730700210; c=relaxed/simple;
	bh=bsnL10YwYDNvES3D7rX1Y/8PSO7o3i1QKDkiorHH7uY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NvP+cCJm9tOB4bqIGHGIFmrKwakux5RSBv3myDOMajEcEne3pMtMH9tVrpz6zaxkZZAPuv4MfkPrORSBDLHse/sRVilhNJ+kh7kyFUS88FQNkFlYt4es7UIrC2qmq6fyzxinRxx/XnvCisWEG3ef391yui8wOK04xbFmmUw7wOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5P4jCrVh; arc=fail smtp.client-ip=40.107.95.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5P4jCrVh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJALMKZIvt5LaKqd5q03ErAtMOulDMoziK9MSrEcx8GiO6AXPlAH1ULZ30O9JCI1EHyUUosWI/P98EPrjtGA8MZDcFBHwQYN+++Gsa2ncXFFRoQ58tkcU51lot8Qwdid9FHEOVk2VNbQWLSDifWKbUAKoNt8MQLxRVYTME2xlAc5kky7CKLxhwylXQgeu0PT2eHnbSaLzTLpMh04hogDtal7JlSLyttBtBW54VM6whQUfdGIYZXI4eQoEH13Vsf7BbRKRCwpV+z8q5jc8RcU7xFXuJqjEtwpc9ODyWTJm08TlNXubNZ8/e45ZGkRrHbZPe9poQqoNNBLkjQB1MEd2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuLTDxRjwjExsA/nYxGb4601v/fDMgFIH3KNzURVFxk=;
 b=xJELmsUOT6JE+9FIeLY6EaIEbnPlS52Ts6vkbuI24ERAJh7k+De0P2pJ+8Ru3kHunjF56S74bri3v1k8SYPWI8cCHZYEjfC5H4GkCwj0YFJSFgOznZ6aDrjsnisbJBAKLdwne/Lz8uMmTG9KmAo48GZe47xmvY6H9oB07vu/WGo/Gk5bzWD/VidpgDzUg2u46bjpworiOHM8woKC13xALNjUQlgLcUIDty61whvBzyX/0VGZim8nk1DOLN2BGvXlKmJe8ECgf1QYQ2rpm3H20Qb4E4V8nAVtg00o9W7+R/8UwBYAyS+Hi8uMcRBFnQ7QRT66z/y7iQetQxwDsaP7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuLTDxRjwjExsA/nYxGb4601v/fDMgFIH3KNzURVFxk=;
 b=5P4jCrVhrzsT8OdlnJHtxMArMzF6kMSRBfXQyDFvFxD+vVh5O9wwkEyy817R0yOMVCQQ+Oqydn7OKUAcvwkPqeVxr/tzAdK+p9fp2yiu9ftczXADy9QY/vv7hupmuS0wa9xdX3pK2dvQyfwF/L5epXXnBomBXI0LHaGtiCdbR+w=
Received: from MW2PR2101CA0006.namprd21.prod.outlook.com (2603:10b6:302:1::19)
 by SJ2PR12MB7847.namprd12.prod.outlook.com (2603:10b6:a03:4d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 06:03:24 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:302:1:cafe::e7) by MW2PR2101CA0006.outlook.office365.com
 (2603:10b6:302:1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.16 via Frontend
 Transport; Mon, 4 Nov 2024 06:03:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.0 via Frontend Transport; Mon, 4 Nov 2024 06:03:23 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 00:03:20 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v4 1/3] platform/x86/amd/pmf: Use dev_err_probe() to simplify error handling
Date: Mon, 4 Nov 2024 11:18:27 +0530
Message-ID: <20241104054829.620858-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104054829.620858-1-Shyam-sundar.S-k@amd.com>
References: <20241104054829.620858-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|SJ2PR12MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: b50cb026-c09d-4615-99ec-08dcfc966460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vpqxotv/vDoALsgCwFUpqyTs4LM93VDqWqTHHY3rwH/sQqcdh2R3LTBLfXNK?=
 =?us-ascii?Q?38/7ghVocWJtd+Kl0PLCh3c4KcMYjVcYLUQjfHfzCs9NSVDBeUS6pI1fxslW?=
 =?us-ascii?Q?hXolPKedkirAKwnVm9dnwbTkvpRNeeaa/EIGdvP7wHmQndG91DH3MhNUOlYF?=
 =?us-ascii?Q?bczIzKYxZkX7MVhaO9XtHhbImJKoQNsYNg6p6OXA/c0GYYjIryOoc+/mKI6q?=
 =?us-ascii?Q?vXJkEjSlp/sEwzgiPoUzsmG7dAsXq+u/sABtLPCAFoedlKqlYQdo/9U4JpGe?=
 =?us-ascii?Q?mep+ag85nbx2Q1NGsCMsFAKJWZK7q/8UgjdKI9DyD6XigCAaCvr0lqI6cZ+c?=
 =?us-ascii?Q?p/L5XQP4DsYDMkrRmOdftVs17ZMyEUb3dbJ3H5I86/x9pzRO1k3g57vLPADj?=
 =?us-ascii?Q?G8GXjLoig9GnE2iv8smReTaJM9mIdo6YBxZhPpp7k187jfyqIqemwjv+lCJO?=
 =?us-ascii?Q?GOHcjDW7scRZMpqS5T8TPdvx3FQ/Ntv51UBmv0VYBbODufrBSgTnTSDJcL6y?=
 =?us-ascii?Q?cQXhXRX9jxP3PWWHhNq7NNvjYM47P1ykoqOo9YxB8gri2TdSMAXFNOedmvFD?=
 =?us-ascii?Q?EejFqoFKOTs01S94zYzoOA1H/CruJWcnYqfUlMPSN+W3KSS9gJzMGDvZjfmP?=
 =?us-ascii?Q?dTsapMwvsYE4CcBpiuZYThY7dL7Xk0UhEBL22E0Wij23DfXCoBFkD7PS2Pnm?=
 =?us-ascii?Q?lWOsHgF/90TzVevHIR3UL1fK93omqlFzE7urkF0N9YaCCpmlXqtEZTgdgBa6?=
 =?us-ascii?Q?SWT/5lHM4Ul1D3d0Cx5YhyZSJufVJSwXb9uPOJ3Jml+V6oHtMFM6LsIJn1nl?=
 =?us-ascii?Q?u7RUfp3kejh5mLHlG71XSCDI3AkGQ8rZv+r3bJIsnWRsDSzIlqA1v9pjPP8k?=
 =?us-ascii?Q?2LurgD9uUhzocdZLxGJr0PbOUVy5S5qfSrfzsNBQUMP62QO//bWot6SzCJsr?=
 =?us-ascii?Q?BPO1PVAWUFJQabHb+QUyZrBS7OipwINKNZRht5twOTqh6jwwvUNE7eklyVrB?=
 =?us-ascii?Q?Gv7gY/hOG5x1+n55Kmes793HQ7aMIk72Y60HiafW+lcLTlbnFCEJQljWR1K2?=
 =?us-ascii?Q?6IUPmwL56rCZiapwKbHdipTpF8RGa//FJ1ueqqBA45X7w2xhKvvOcyVknnup?=
 =?us-ascii?Q?WdacqMPPFFqDZLIoFLcqnFDOKT0dvdZnMANr87HNPVI0dsSRYeCV0BXTScKB?=
 =?us-ascii?Q?2II+uAEQfKtZO8VRbsS44UlCUhiWs+gdJx7PhmghAC98FStENe1SQWkg5vox?=
 =?us-ascii?Q?imHAPTyy/M7xXHJoA8fxKVBEUeN7qw087kD3YQUBnryalpwBTUYvJpm7t5Cc?=
 =?us-ascii?Q?F5NQr7RTrLojHG8nFzqDCDqEzfF1YbmpaogiLeDq3KwNXXcgs8TSit/WXJXe?=
 =?us-ascii?Q?TSUCbcgZlqjr7Rr8HZaHgkGQlN+6zysgQn47kOasNCUYTCBlWg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 06:03:23.7551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b50cb026-c09d-4615-99ec-08dcfc966460
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7847

To simplify error handling in the amd_pmf probe function and reduce code
size, dev_err() is replaced with dev_err_probe().

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index d6af0ca036f1..7ab8b7f74629 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -429,18 +429,18 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
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

