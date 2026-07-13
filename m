Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0393537FF
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 18:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968014; cv=fail; b=A6D2eUQJ213XZAE+0PdGA4Ew3HWqQ067VwC65O2sBsWkbkL2EO9dbmzC+Nv70lb7Tic+nHvWNEEO1tc1MbAov4rd6onvW/nLFb394G7jfphitpRWgsKRCFX8zwDcTrKyISk6CYh/diCD+DYHjetKvqs0KiFU+booa1FuBsida0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968014; c=relaxed/simple;
	bh=Mrke1AYwxT1yQcfjeyy7es2FK3sieaIrGfrI0okYQFg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTGb3t2ffFhJRAZFtbvZWq4pgYJ+YbwP64uhVh+T9rT2M+sgd8E2AodGoEPnngRdV5jwg96aIFXeftJjrVm9kxZ9oAOQ5qkd5stKCYnQeexx/1VJMvxgjhkYQkw7h4GrOSmkb9jx76L5F6OWVUhsYX9gFi6Ab+HCL+pFaUFPjOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wnDlOYIk; arc=fail smtp.client-ip=52.101.201.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wnDlOYIk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCeu5Z778bolGe3OGSzZU50ki65xMynJw/0UwZdIZv8D0z3wB+v1p6+JKsNisKBZlr8udTpetJMY72a7YXWQbW/fuShMjIOKW3mi4kO8LK3CovCtNth6PC/4PyjptyMt/9L4hNEgex9RhRZEyesI1ZpI7tC57tyLayHa77PjdkoXF0rHQSe0TKXc0jVbUx4e3+YK7wpSVTGJ/zF+n8fIIejaI+gqOTm5UoKdVlKhYim8ESt28aiCmnHGx0yn3O1pmEOF2JhrtRRaSxuXhJIlGDIyY4TNpaa4VWCu2jNc6kGVpRU+vhCIILdJL1xs1dkYHqSjDCnxA2pCZYj3GFeFkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13RHkupv3YAfo24QSiecphbQ5w7qNQCaOUIabUK53tw=;
 b=W7DGYr/qweVedjc/ngujdMauuZ/cH2gyvpTYE0Huyg4PTS6ymGPjuPCtCaPNLUFkZZb6t9V9f2NvUZ900tiRAOPcI09vQJWFXGL0jKqxUw4gF+vSlSmrdEn53PTpYLgH2UcSnHVdg/6pUsti8Rcwu+XS4edqlpSP40fkhAan8JIRjL2EeBP4+UmX4H8NvTY7bDK/Wo1QramhBM8aDZIhiwNl4bFIfCQcvNIxJWuRtKrKrnLsTjGzoNGVZZX2/XgxuL+mlx9DaNkEiBAALSqWiQG44kBFTVDN4IyLYTVa/PP7YNHhlRVDBtfDY4Hcj4gkk3jzTNLYyInhs7LxEiBkWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13RHkupv3YAfo24QSiecphbQ5w7qNQCaOUIabUK53tw=;
 b=wnDlOYIk9YoNObGjioyARXWcuB3T1s5sMljN+2H91dkpbmMAp53m4WXbrs3K4+FI6Dqkq6lqEL+2KE2xEEFHOvPHn5C4WaPZKIsjOHG5HxVb6cLnqqJ9Xrw9BCZ2LcPEtotgT2n9m+ICFy5jghSvB89rszYlDyr+cxAvjux06pk=
Received: from SJ0PR13CA0023.namprd13.prod.outlook.com (2603:10b6:a03:2c0::28)
 by PH0PR12MB7470.namprd12.prod.outlook.com (2603:10b6:510:1e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 13 Jul
 2026 18:40:10 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::50) by SJ0PR13CA0023.outlook.office365.com
 (2603:10b6:a03:2c0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Mon, 13
 Jul 2026 18:40:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 18:40:10 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 13:40:07 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 4/6] platform/x86/amd/pmf: Use upper/lower_32_bits() in amd_pmf_set_dram_addr()
Date: Tue, 14 Jul 2026 00:09:34 +0530
Message-ID: <20260713183936.690228-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713183936.690228-1-Shyam-sundar.S-k@amd.com>
References: <20260713183936.690228-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|PH0PR12MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 043cdee9-091c-48b7-77fe-08dee10e2b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	0KpCkcE+HAngjRurgtCO/aV1GIHyOigI9IuVzYvqTQ3dcuXG17IE4iimDTmd9mvLchkjP9KAMiHx7ntvPyfTUSvSgD0y+f9PFmZeY99hbofmcObdSEZRZPhcAqWPcTh/cZZ5sJHhkQgb28z1RliPcKcWjKXzvMU+G0qYdNe4F0p4DzKc0zaQnlmyRZWB7l4gtFQTicbBp2vVTLh2ZTyD0qQM6oV2J4xRjZkwzr868E7XPj4uoryiH5NsHcEIVRfgVi6vR4DUU6ecmBlrH3cRDSrsn+qSxYBc/FotY2A/8non6WbsdsX2CC0ChvrhB4moOjONGoUgRc/ulGl/7C60GNuZZ/k9feKQDqPETER1Ddbkz0tYGN+bmDiRVqePGqGkVh94gHOI4EypJXQL+yshyonCxv3wiKLD3XJ6OI1mGvPQbGb7d4cgeZ0hdgy6WhO87F6AC5YE+su8SLISr6J/XPfIIWYBrEJakWaXxwrtFbPqC4XFcjnr/4lmNZvrDq+MDMaID5Pqpk2DMjtDvs1UyKmnJC04VubKUjPHgehDuRNWW7WSmhdy4fYeHB+dYY0m7SYEvOe8AtQOliVRtviItM1iRlA8bG+h5Wl/9aO+0oXwX6QOvU3adac7fWS59rcYQKJvHFEdUmKlkTTZhjhADnQJqtUpi2K3PxIR4gcYR0OUuv7DDCML7xmlEAjqmhCtLnx4pDKBIJYxnoWw8VBGCw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qXDYKwlQkl9d1dB0GlphjKeBAFClvLepa4T7/YiR/q6lH5GBomR0ZMX5otBt7OGbEAWkUj2noUMdEahlUkAEL5aMwTlCmD4M/MKO6ziZ+Ig/LJDZpv/3Onj4m4jIrIt74gR8XrLoUqOup3ztyIf/kyTedllXZlgT2ifpzjZfsY+fXpq9ySf1oVc6d4AvoiLx77iCVPoucWRGj/NGbmfUF1BFLoKyG0t7pbTj9ehwrYYype1vi37mlSrNl/qexl9K7Tt961mzZzZb3T1TSYy6C/3XVrBTGTbRsyJZ5PINQ4FNST7ufzKxLsXX1H+OXxuxm8yCj5Uowj675yJtTCO1Y87grEs6DBUTk2+8u7CY5cV27O2lmvMIwcn0vJPK9sRsc0lf14jmowdQbSLV9Dgn10zSW1NDTniClAxk9FCDsPF8/MCCtqqXhk/HoIqCPtr5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:40:10.3719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 043cdee9-091c-48b7-77fe-08dee10e2b42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7470

Replace the open coded manual bit shifting used to split a 64-bit
physical address into its high and low 32-bit halves with the standard
kernel helpers upper_32_bits() and lower_32_bits().

No functional changes.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/metrics.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
index 4fabe4ee4149..13dfc7fbd420 100644
--- a/drivers/platform/x86/amd/pmf/metrics.c
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -9,7 +9,6 @@
  *	    Patil Rajesh Reddy <Patil.Reddy@amd.com>
  */
 
-#include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/container_of.h>
 #include <linux/device.h>
@@ -18,6 +17,7 @@
 #include <linux/ktime.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/wordpart.h>
 #include <linux/workqueue.h>
 
 #include "pmf.h"
@@ -81,8 +81,8 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 	}
 
 	phys_addr = virt_to_phys(dev->buf);
-	hi = phys_addr >> 32;
-	low = phys_addr & GENMASK(31, 0);
+	hi = upper_32_bits(phys_addr);
+	low = lower_32_bits(phys_addr);
 
 	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, SET_CMD, hi, NULL);
 	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, SET_CMD, low, NULL);
-- 
2.34.1

