Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2042.outbound.protection.outlook.com [40.107.101.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398AE13A24E
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 12:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709038567; cv=fail; b=PD9IIn7uZYCpuOBKegCjUKDJPAZli/R9cRLlLN3OOlaA1Ft/PrBhkznOYkwE7qpjb6qGkutnNSA8rpyXr+PwCmQaKd14J/81GDiI/S8E5s9vDhnpdl+zKv4Ku6nalMQMC36YRvWa/ShXbEfHGQNkTRbSmBANaZnAYVflTzmBNVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709038567; c=relaxed/simple;
	bh=nieY9V8EnTJtfcsLEnfcKLUmM7eRA7/YAQjqMLNRnFY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HjCT5rMyGaaFLK4XiS9PKi6eUH1tU8mHWynC9UZxZuEkaQebBn3ioaOUJrl8ez+Zhm3t+chz2XWr5ObPqvkmt2n0nWqYhKfXvDtnPY99EoqeK66RNfd5nGVMfRZfH5xEoWiBGStDew/Ss0B4VfIxDop+uwpbB8xLfPxuoie6OX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ie9cXVf3; arc=fail smtp.client-ip=40.107.101.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ie9cXVf3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYWwgtuTSge+jL3GIO6N+c3z4fbw0JR/bH4i3aLes7US2PyRBzOaWrKuBuFFnnJTuFXA1m4tH2w9JU8aVjSl+yiU06p/lGqMiqYxyoutvwkK3k4hL/Ss9J8cCgw/NVxGQ9lfMlJ2jWdOfWU8xdFQdDv8DZXaOjt/nwIQ++vTRfej/EcATiSb29P9nX2PbqFIvdLTl6VE+TJu5zWWpGL5lCiK8hur18o35AMOo9bhsNIwuW76ONRZho0Nxx1aFZMV/U4lBFL5Dm2a/p/pIAIabV7+UXgmzTmr7IkNdwayB6s9aeuYD/8izRsWlAOULzATV24m3Ub8gaxhgB5XysicUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzScb9vySsJ2+A2abn4NzdjMtc6L+M81LFSHXfm2NQc=;
 b=flYHa5+Bbt7tx1/tfrkJMZWMJrA0TCiiPB//cZh0DBnrtS+JHZFwt7CUHmYGK/vMHTZSdOmvObtC3wj5evHsJeuSyFnAeqD7+FmG28vXUR3Cqtk9COBh6l5I8i+vpe4nmK/seTIilCH2KhIejwIpF/fJqqoI5kK9Q7LSXUyUzmkPGC0yelZAw0HTbakCWFoPvCr28p2tSGbTCfAEC+2chccnZFZ5ilRVHeNT4/agMTIHn2wL+AOt/W51D1ewghc4Mdhpy3HMQ0iM/cVv9vQ4wA625u0JDb3EQNsB5c1mVe5+PqLi4Kfw+FkuQbAC7v8v1RIkSydZLEIFrwerm8ktAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzScb9vySsJ2+A2abn4NzdjMtc6L+M81LFSHXfm2NQc=;
 b=Ie9cXVf3tVSVSuYkKh+JwPudoLXRXwgyvspnodc2RdEMEKIkyTNdX62m7zc/7qSNXzS07zNKJa6go24T3tIJvsxXaG7J8D9JE3GfqQjgVGvgdVuwYfc9zLkmavF2NsNvyOR6zyqXUlHlcZ2Kjsn3bRTmqbS80JtlMiM0q44aj+0=
Received: from DM6PR06CA0079.namprd06.prod.outlook.com (2603:10b6:5:336::12)
 by IA0PR12MB8228.namprd12.prod.outlook.com (2603:10b6:208:402::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 12:55:59 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:5:336:cafe::ba) by DM6PR06CA0079.outlook.office365.com
 (2603:10b6:5:336::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Tue, 27 Feb 2024 12:55:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 12:55:59 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 06:55:57 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/7] platform/x86/amd/pmf: Disable debugfs support for querying power thermals
Date: Tue, 27 Feb 2024 18:25:15 +0530
Message-ID: <20240227125520.3153140-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|IA0PR12MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: fd976b5e-0e5e-4d8d-1090-08dc3793724e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VNwLFftqtAdSYNVJHcUwdPTqUsr0QI2MLq1NfYhkLGJRcDUWew2hOchg1xM6RAcj4KDYVr4Iq6GvzBcYGOnCbu7fZdiY8TR8gSY38EIvdof0vR04BmUXS2JJMQpI9XRiRroI3qBL8ekS4A0+9LA1QPXUrCKezn9XtS/NUn7oaq7uMitbqQLRjkSra/lHfh0ClGBePiinlDHBq7b6yUXACOj3s/6nHADyn4p87NJ8YhVQjbMxH7h3bSFGLExHI9wEvn2mWa/j/n0XSkOw4OwumbVJAyii9fsbYTyfzXHHnAYsYDXM/ZUITDAkWOYrRRq6FBae3FKitse8yTZ+HSRP+mKogwLkpLUrfe+JVzUA8MifbGuOdmWjz4DzgdQ3qyj6TlSVRvS8ZkwHx369Rbc/8MotQt6weQUSbAOp7RTFNo0VoyE0UoLkCc2424nqzGkIkcOSsGwtePnboZ718YPbC6hlnAIXJ4+mVXl4hLW5iKjLOKsWS1Dc8l63rGtBDrl880bRkA6WjTHyiTWs4xseu4spEsEIeuVuJUrAsPooPB2Uk0JHAa80lzvUZ5pjdvq2E0BoyrmCsB5franXu44y2WJVN3LCqi1ScxkwnGqabIXw5SQh7gOQzGFml0plRH4htMGNsj8f10lVk9ucsc0mX5ZovSRw/D38DAEt/m12hjMzietQgZId7SCZPayd6PS2kbYbVOxChcFwWPTQFz3svqbLakwmmYPNmne7qu/fzkoi38onZbohuOUoSV2BZRyk
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 12:55:59.6112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd976b5e-0e5e-4d8d-1090-08dc3793724e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8228

The GET interface to receive the active power thermal information from
the PMFW has been depricated. Hence drop the debugfs support for the
newer platforms.

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

