Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010048.outbound.protection.outlook.com [52.101.85.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8691D369D66
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791713231; cv=fail; b=RW1DA6KCkugnc9xD697+cpHR3JqQQTw1xTKPFepW4Isvtx/eYMug/LuMDX8Je852JFlwjiW25/iqpHVn4s3crZNMcwmcbjRxMDrAeGsB449Iofz8JzRdj7PBQTg6HHeC084mplILZNdk8D2Tquy2Zz0KYtQXLvqY92e0RirZejY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791713231; c=relaxed/simple;
	bh=oTWrrQQoBy5yz57ZQVjdpf96o2nLyUjWhfhis4OM67I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IOoqK8vjCKNHOff/oNkszeOmXNW0l94HyKOYgHnGCnOLxzl4CcFTrI+WhaaaBDmkgSuXcOaG0hORul+nYRdSsgQpvW6QrgGOpfwpTi17KPdwuRU9noZB1uFVIdvS7X2evqN3zQfeMkrCYdBkKLkpTJmHIJiM5CKmLgA3dWIkOa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oBvzXU26; arc=fail smtp.client-ip=52.101.85.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oBvzXU26"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iadPrZYuLTHtoH3BqMFGkwC3dS37oRiUeSNgL5lRzDYHm1A8IyRhYqEIVkaOd7k7Ngm8EG4piSxB7DLJMhI3DNHBKhptoDIj6N6HX0FliEqRXYNTSxwnxXmfFL9ucBQHie17BQucKO0h8A+fGyaT0gg+etBA0MZLqSH+h+bzHBF5NqGhQ0dhxtIG1/QVd7mcqy9HRj/FZaERe0XC570A8GTXN3rvMtm8CNpKfxoGXCHQLW5iFAfdZ30SGW6C3Tue1MhAWHXdPIv6wFaCiR/NW9PD634kZAmdnF3iYesPnjW2ixIcxO1yWK9T+vtkX2TAQsCL3wR+ZYWWQMOKcSSDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABByvHWg2OLhaGgNgT1TlA7Wd0MtY4Ldrm92U3D3uug=;
 b=KRCF7yXwC6kfYbXDNKJBmd7xzpygrIGS8Km+sNnDxP6rGtvwAyFqyvxb8iZ5xV6fkHo6LQG1LUPd2qOi56VOz26ql/wpSNya9WiE7FtXn6D52/6xifOtUn2i2PvvfwXZGdgNIuB38deKS90krpQ0fMa+k4NbKUO5FzFWfuoG+P5vCYkVpq2AFR5dLfuYyvk3dx6rcYjTq3VupVMVtSnv5Pw6cjJ8SW6l06LdcbqPqJdAINj2QgEVhJJLm7LQNufOtHmlywkKa2meJ4NK/rkm0y0xV+di8j24yRIm4ORZ5ndsekZMjiWVQ1jTElEzY8huGrkjlj+WDVK1ZChnSHr+8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABByvHWg2OLhaGgNgT1TlA7Wd0MtY4Ldrm92U3D3uug=;
 b=oBvzXU26wZWaCA30Rc28mkk80jhnIhXv2QYP8rvmVRZOCS9tfE+3WA32oHvm2AblvijZLHX84pxduFp6foS9kM+KFv2uSZXmKNTkmlrjxA4tlb9LAX1vB/BYYMNk/iVP1m6aLLo6vL7vw/6dVTZR4WjdqRCkmdst5a0iJ92vRIo=
Received: from BN0PR02CA0032.namprd02.prod.outlook.com (2603:10b6:408:e5::7)
 by DM4PR12MB6136.namprd12.prod.outlook.com (2603:10b6:8:a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Sun, 11 Oct
 2026 10:07:07 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::2f) by BN0PR02CA0032.outlook.office365.com
 (2603:10b6:408:e5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Sun, 11
 Oct 2026 10:07:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sun, 11 Oct 2026 10:07:06 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 05:06:59 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/8] platform/x86/amd/pmf: Skip legacy DRAM address commands on 1AH_M80H
Date: Sun, 11 Oct 2026 15:35:47 +0530
Message-ID: <20261011100554.1841309-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
References: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|DM4PR12MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e4a3a01-a5ee-4824-52ae-08df277f67d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|10067099003|3023799007|261009223027099003|11063799006|260925021911599003|260925021311599003|260925022911599003|56012099006;
X-Microsoft-Antispam-Message-Info:
	xiv668mqc82uvoG2oBJW2SH9EAWzzfGXANaXpql0gytoj7WDXK5i9M4k5yhXbKTKF3SoafAZVhEsURjkzTiPqyXPBOOuwsOvcfa70CCmP3mNijd/RK/jwjz7BujO3V7cb79RkjMXmo2q6Y4cuvp+6PfN9jKJbO5UdWCIYACIXu5lfxNJt2igCXM8vF84sm7QWC7opvX5mPpZCoL3YhExaWS0h/9kNpFVhd5d/tQxAb1VE5nLVDL99MELKQ+VNMvKizmgKWGdKs5dHKaHn5BhglBo/2qJUJ64s65oOcP9S6hLoi3nwtSP3s4YKO3mCG0sRl+h6htUSUD3EHVVcAaj3YMoASTLESs2/9qbLqhhahFmeh8gUg+nCLjszC6VKLjIMUp4sggtTwqB9QliSEJDab/L2ZQUrawqqJYmgQ6LUuonW+08B9xY3hGqr/6OHM/s4XldDgyj2sSVQYz/0wEj2qfk+wdE0hdLUUYdDCQLOhA5q0xsKggnMXSv5E5ZsCKJO/B80RvDlD+ASqL874WRFSv9CWBuyEn0MdGN4pIup3jk3wJN9aRqyPGVDM07Z8P+dF7XyT+r/6NnuT6n40oO1xH1HSebFam+UsX0J98R+8AvGV9mYNWwGp22QWnzi+vVRU6tAP8YDLauKyXPl8yKNzTWOGXYwXg2hc0bUZuSPCd5dcMbw9YXKrHasjH3wzfKa66vp68OE+894fLpliEfFw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(3023799007)(261009223027099003)(11063799006)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Yk1BUxQNJCOqFLsk9QVNGHHK2xxM7C9OECL/b9wXWV/38Jdrvz5UvDBN3x+4knOYwi7sL3VPyaidwo/uJToNfXYoqzSus4aeAVbPrpqSJrhuaercSIQYwCr2+kPiFY/wZXB0hnSX/ASfkdFZvugLvnfuJp3Z9O5syoYxSbP7MMqVSdIhsw9WBONXdeiooloTLMjdVdkBXWzW+vypJMehvYZafypC2wghUlP1RJ/Wcg3wZGGBtW/F5o6/i05p1/0/eoc0cP0BrsJMH+zvIWuvKZrX+VViW/NBxlTSn6gbJpli+nG5g0xIMU74tZUVfRjnuCB7y9WrKWJjeC1jLutQ9soPF9IXMG5iMu5Hgzgbs4gGYj781uYeP4A0z+XjAAKS/hCGa8H7ekH6mnbEcd/mC0HeKDd1souWEfuvAiaVZl4CATpxYPJqxiABTP4Rc/zo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 10:07:06.5778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4a3a01-a5ee-4824-52ae-08df277f67d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6136

1AH_M80H gets the metrics table address from PMFW through
GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR and does not support the
SET_DRAM_ADDR_HIGH/LOW commands used by earlier platforms.

amd_pmf_set_dram_addr() is still called on this platform from the
Smart PC init path. It ends up in the default case of the CPU id
switch, allocates a zero sized buffer and sends that address to PMFW
using message IDs that mean something else on 1AH_M80H.

Return early from amd_pmf_set_dram_addr() for platforms that use
accumulator based metrics. Move amd_pmf_supports_accumulator_metrics()
to pmf.h so that it can be used from metrics.c.

Fixes: 641b41a7a125 ("platform/x86/amd/pmf: Add 1AH_M80H metrics table and NPU metrics support")
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c    | 10 ----------
 drivers/platform/x86/amd/pmf/metrics.c |  4 ++++
 drivers/platform/x86/amd/pmf/pmf.h     | 10 ++++++++++
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index ba9324448586..96e37eb56591 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -68,16 +68,6 @@ static bool smart_pc_support = true;
 module_param(smart_pc_support, bool, 0444);
 MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default = true)");
 
-static bool amd_pmf_supports_accumulator_metrics(struct amd_pmf_dev *pdev)
-{
-	switch (pdev->cpu_id) {
-	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
-		return true;
-	default:
-		return false;
-	}
-}
-
 static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
index 5c0e368ec8df..5510dba95ce5 100644
--- a/drivers/platform/x86/amd/pmf/metrics.c
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -147,6 +147,10 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 	u64 phys_addr;
 	u32 hi, low;
 
+	/* Accumulator based platforms get the table address from PMFW instead */
+	if (amd_pmf_supports_accumulator_metrics(dev))
+		return 0;
+
 	/* Get Metrics Table Address */
 	if (alloc_buffer) {
 		switch (dev->cpu_id) {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 9f64ab833c08..b29c5192d878 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -1105,6 +1105,16 @@ static inline int amd_pmf_get_power_source(void)
 		return POWER_SOURCE_DC;
 }
 
+static inline bool amd_pmf_supports_accumulator_metrics(struct amd_pmf_dev *pdev)
+{
+	switch (pdev->cpu_id) {
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /**
  * fixp_q88_fromint: Convert integer to Q8.8
  * @val: input value
-- 
2.34.1

