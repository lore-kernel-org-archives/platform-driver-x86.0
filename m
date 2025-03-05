Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5391F24BCFD
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 14:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184914; cv=fail; b=bEXtVPWS5PP7AX5GFZsG76Nvtf2DM7LA6S34oALJjmvwKCB1HZOSWu6HwbTiy0eb8L86X3D/W+jCI5SBr7SVcyDKLajRmrHYAKa1FCZ1MXVvILBU+gPMslBDBw+oy3YFBBbLi1coD/9vNCNtkDX/L5IIVkEJNsEv1ShhBem8ZSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184914; c=relaxed/simple;
	bh=LklFc2z0xpEyUtkKyXW9gCbEx+ETPgfEEaD4wD8JTyc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dq1Papf2wouNf9izRAGCbLBinv5XJ3gyqNBl5aymGBwDTxiYMY1T1781SjOgnb5CzH7Uf3cz6c1IcQd5FyrHRe6ls+KjZuEAQwIZuOlhpHxlbLvCsGlGzItrPpc1xWVjn2X3bw81bwLRHxFM0ORUTYlCb7XHhviEDafsefed+C8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R6ePtB9q; arc=fail smtp.client-ip=40.107.244.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R6ePtB9q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vxmx+v+exrPxF+TLmUqsSq8JLMTwVUES8n6Qoga9O3ePsZdAxCUSBEigHeodyGjssGiGsXgqNV4g2yQuxkQDMN/mi/ClIEWV4g/o6vFzPE3WbfhIZVaMCkkUyVB538jWb8FZ3R2F7llahB4mVYTEJaQhWTeY6RLPcdTVt0sT8AUOo9Ix5lZxumHaHCFTW+h4TPKJDiTv+o8rxbi6aTpKD4Zc4n9lLrBLaw9w8SGP+Pbz0DU++L4tKiq6alMWbNCWEINtKLPDSrM+7gK9YukNWmzGUbiABs+UWsv26jwV9F2ylfGOvgN6w517sZmcKXZfYkepr34zIgCrUJH5zM3p+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0RmTgU+TmAA6Ha6F4A/cJ1uhFSYCQ2TOBwlJVfehfI=;
 b=FgdhjjQuVOGhdGBjHCtxJHb6tb6K7Xa6Gh4TzxUHpWAg/qavwRLirF+0vo/9t4y/9/BDZg2mrCPD6PWDgOt1NTgdiSv+zf8oxmHaTXFLiPcQ1iP2P++cUIb39AHOriI+HHreuJ7WDHenzOu9hsNLr+J77KBSzTkfWE2ImKaFvmThzqdo4itz1pHSiuBEqKcMgiYVRXw+PGjKn9KiSijzJcpxF7sSOtomNtMMjS6O9PxqMWrG43em89fCxZyq+cvqfod2hH9tFEpep9gwjmmtBl+nY/zGTogzkUu4iu9x+jctRMpVxz9zt2ThzYuldL1S2gtYHfdVtrmu8Lrtp8l89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0RmTgU+TmAA6Ha6F4A/cJ1uhFSYCQ2TOBwlJVfehfI=;
 b=R6ePtB9qLAxy37MCyJsR61jo3zBkodTf6C7eelb5MtdbFaqaxlhLyW+Q70yhJWp8z0Jw2aO8oectjhKlaiJlL+Byg2RZed1CCDIR58NIUxlV82OcB/IFcXY8ar3khNMyPwRhMv1l6nyrtzeUHTCIU3WgbG/zOmJWuqa/K/yHj7s=
Received: from BY5PR20CA0024.namprd20.prod.outlook.com (2603:10b6:a03:1f4::37)
 by SJ1PR12MB6242.namprd12.prod.outlook.com (2603:10b6:a03:457::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 14:28:31 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::f1) by BY5PR20CA0024.outlook.office365.com
 (2603:10b6:a03:1f4::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.29 via Frontend Transport; Wed,
 5 Mar 2025 14:28:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 14:28:31 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 08:28:20 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 3/4] platform/x86/amd/pmc: Remove unnecessary line breaks
Date: Wed, 5 Mar 2025 19:56:14 +0530
Message-ID: <20250305142615.410178-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305142615.410178-1-Shyam-sundar.S-k@amd.com>
References: <20250305142615.410178-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|SJ1PR12MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d6b2f3-abfd-4a39-2609-08dd5bf200f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S5+UmGea1X3Ezd9irR5RES5shQINuLu1dRcgPjuGufFdP8fv0+7JbKOxPay0?=
 =?us-ascii?Q?RAQgk3TJAr5p1zY6zXoERyeF3Kb28Y5rM7+Y2QSkwr7Q+nY81N3mvufNYbLC?=
 =?us-ascii?Q?trdSTkjnFNllY+R7yiTbCO+/RocLtV9e1LmG64sDxOplA6SazZhQw6RnRf4J?=
 =?us-ascii?Q?iI+uBQvPCv276WfQgy1Jqm7NHZFWVkaBF9sonxFX/C8z9ew6+i863Yxb1Zv9?=
 =?us-ascii?Q?H4IoeuT/5OYo5KH0hWmrB9n8vL+GNxaDsai8caP/xu20me/IF4385DMq7ywI?=
 =?us-ascii?Q?Bx9GJVaa4h9HcdYzX7esZM7vY7GoJ6HxteD9MDFOpNCtXkKPwC/FQwZPmJtR?=
 =?us-ascii?Q?7JGdRYUFMtCwFMuA+hrUe2PUc3hLIMCcanHVtqCGe/rxQ7kiaHABTTO1Vpvd?=
 =?us-ascii?Q?az6DIsfOQek1nJdT+gBMpwfJgUZxHvgxpBPqPv2EJj4HYTReqWdGPbdJP8AX?=
 =?us-ascii?Q?DdPzEZo1BJkpSaYVioBR4Xjs4rsGtniQRdx+gL9gD15AAoA1PZVT717Rqwgh?=
 =?us-ascii?Q?SG6scR0iAEq9O7HmgdLsvpFfCi4CKSZ1p5bGDP92l1/RB6NoGIgZbWif5Tv4?=
 =?us-ascii?Q?CS1FEUGV4bX5MdVk51DSFBWBKEMC2Ue/PVkd7aUCfzuFyKQM5YDMW1B3p1GP?=
 =?us-ascii?Q?oeb2jtBMvJSGKPD94I6GWWSwPU+yyQandMdNFTryEd3rLuCciqS7tJj490Q5?=
 =?us-ascii?Q?JESMVglwKdqfK+B1e9tuvStmEVNi638/QdoYUIO06cEeBLqIR9uomBZvSRzA?=
 =?us-ascii?Q?J9pWkomawQLeA65T8YinVylNFa9TMtjV+qxPoIbdP+2FQTVtjwpWiu/rc8OS?=
 =?us-ascii?Q?9q2vOtexnKkDMkQH7wz50Yml0SA+lAtZBeg3vN/zj7suxDH/zZVsbvH+2vUA?=
 =?us-ascii?Q?K0lJszKCN0+mO39JI/3OUtHWLNl++a6d1en9XkfG9gEfPK0IKh/FGN+5hmns?=
 =?us-ascii?Q?SY607FI3SE4fEgZQ+ZW2jl/onvyaInceJ1IHKxcV4Od0oZQvVelVUw6icF+C?=
 =?us-ascii?Q?pWB/QVBBdCkclyFt9HKdkZDvidAlx1Oc9ALXDbA/TypYSmDvKoBaw4pYIgaj?=
 =?us-ascii?Q?ab+9YiiozItFoxLVZpgZDFXD4w1s5WpzRspDDFP5tNtmyqkBXvkFLAYbkhIp?=
 =?us-ascii?Q?hfk0Q3rdqhaiOPjjWVi1JWW9TRmM2RYDEl9JHuXIeMRAVEYFDzaw4uNFyYAC?=
 =?us-ascii?Q?uzKAjQBQ0Ob//z1VwDV2rE4ppNRmhIrS+ou/IN8iZ/bRogp2aNcZIT1XkmEt?=
 =?us-ascii?Q?YSz6vcAR4HOA0NN8/UisO+lEOGfNN78vE9B3wjdPE/S5Jlk9bsc0mbIXArjE?=
 =?us-ascii?Q?aS9inDosAL6ZTyoblIcPBTGp1cEDYGxsK5h7S/wrzLmqFlwik2+zw381UfsT?=
 =?us-ascii?Q?84XGugIGDcbqSRhm454UVc5KnngRtRV06BWoD6T9QDX3E7a89LTXgv8Fl3vZ?=
 =?us-ascii?Q?BhI2k4Pv4O37Mx7wSCGJ7LNHCw5rRn8Ah4XWVf6RvcGx1gsWbjDEczSE1DSD?=
 =?us-ascii?Q?17p5dmk6vgeIONs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 14:28:31.0867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d6b2f3-abfd-4a39-2609-08dd5bf200f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6242

Enhance code readability by fixing line break and blank line
inconsistencies.

Also make the return variable "rc" as function level local.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
based on mainline with tip commit 48a5eed9ad58

v2:
 - address Ilpo review comments

 drivers/platform/x86/amd/pmc/pmc.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 742920530987..1ad3eb935404 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -166,11 +166,12 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
 
 static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table)
 {
-	if (!pdev->smu_virt_addr) {
-		int ret = amd_pmc_setup_smu_logging(pdev);
+	int rc;
 
-		if (ret)
-			return ret;
+	if (!pdev->smu_virt_addr) {
+		rc = amd_pmc_setup_smu_logging(pdev);
+		if (rc)
+			return rc;
 	}
 
 	if (pdev->cpu_id == AMD_CPU_ID_PCO)
@@ -219,10 +220,10 @@ static ssize_t smu_fw_version_show(struct device *d, struct device_attribute *at
 				   char *buf)
 {
 	struct amd_pmc_dev *dev = dev_get_drvdata(d);
+	int rc;
 
 	if (!dev->major) {
-		int rc = amd_pmc_get_smu_version(dev);
-
+		rc = amd_pmc_get_smu_version(dev);
 		if (rc)
 			return rc;
 	}
@@ -233,10 +234,10 @@ static ssize_t smu_program_show(struct device *d, struct device_attribute *attr,
 				   char *buf)
 {
 	struct amd_pmc_dev *dev = dev_get_drvdata(d);
+	int rc;
 
 	if (!dev->major) {
-		int rc = amd_pmc_get_smu_version(dev);
-
+		rc = amd_pmc_get_smu_version(dev);
 		if (rc)
 			return rc;
 	}
@@ -697,14 +698,14 @@ static struct acpi_s2idle_dev_ops amd_pmc_s2idle_dev_ops = {
 static int amd_pmc_suspend_handler(struct device *dev)
 {
 	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
+	int rc;
 
 	/*
 	 * Must be called only from the same set of dev_pm_ops handlers
 	 * as i8042_pm_suspend() is called: currently just from .suspend.
 	 */
 	if (pdev->disable_8042_wakeup && !disable_workarounds) {
-		int rc = amd_pmc_wa_irq1(pdev);
-
+		rc = amd_pmc_wa_irq1(pdev);
 		if (rc) {
 			dev_err(pdev->dev, "failed to adjust keyboard wakeup: %d\n", rc);
 			return rc;
@@ -743,7 +744,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	u32 val;
 
 	dev->dev = &pdev->dev;
-
 	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
 	if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
 		err = -ENODEV;
@@ -751,7 +751,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	dev->cpu_id = rdev->device;
-
 	if (dev->cpu_id == AMD_CPU_ID_SP || dev->cpu_id == AMD_CPU_ID_SHP) {
 		dev_warn_once(dev->dev, "S0i3 is not supported on this hardware\n");
 		err = -ENODEV;
@@ -767,7 +766,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
-
 	err = amd_smn_read(0, AMD_PMC_BASE_ADDR_HI, &val);
 	if (err) {
 		dev_err(dev->dev, "error reading 0x%x\n", AMD_PMC_BASE_ADDR_HI);
-- 
2.34.1

