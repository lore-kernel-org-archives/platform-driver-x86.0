Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179FA44C9C
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709191958; cv=fail; b=nfHztCU/Egr8kkI2utgNnsCF3k0VUZQMa9WCtYaL3tMbtLzEvCDOMgOmzaSP86/vYOxiqLso8nFfNQ5Rs+yscZ1j8LOaEk+Gxs0o0OZmVqRyWYm03xDyOcH6aZZ2JZgfD7mUaATzajpksJ9VI4X9aiVk8MU8QGOkg0uBsDlLkWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709191958; c=relaxed/simple;
	bh=VkuBDPfl0mrvDsu4wliRIEKfo6vqRbJbI8fShW/RECg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sEzdRqEgLw3HQbxZQszGalXQ78oHEe9LnD4U7VpWSDYfUxF6iYajE9EphYO918mOUHJVA4OfvQt4xuEGug8tairY3YYW0g9BDrv3EgQUaJIW0RE55/99sZN+aN5RhGX9AQ/XMDppUIJ8QyOBOgOQQYGqVhHLspUygTtEvV9ffQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2h/F4V3Q; arc=fail smtp.client-ip=40.107.237.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2h/F4V3Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMGNfkHGv6uoPXO18tg/UMG0gTX5H9E55a+jKeKEsSu/bdnX5z8jkxBOkXCuU5MTYfbB9EBiA+7y/UnmWn5747b+p/woxfRZnbGNdDEE1ns1GjZyH9YueizzGQBsZLYaWlrT1GCKIaHnLyRikEkVjsXCT2j45LqqcFispHbOSxbHkFZf7+a/AXNdoPAnD5P4zwWlbaUGuDqwgckkesYVz3UhsREYe476zMO6opbv+nfnXhR5U22RJu/Mp7+GRswuuC4zjiBBw7QwtkYnSpA6N26gEfZEKGbzkTEOMeWf7Cfy/xIdic14k3V4L72L1EZRaqx8zotDanP/KFmRPYJjug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9UeoSho8L6gBBpuA1IO1ksF9eB1d/J0aWgbxnz+35E=;
 b=Dy3FrpAf0MY5hB6+bN3njwlOrGE+kDM0fWeg8zm/4oj2YZo4hJnwSHATdVFjbrIgItc9FFxr6IO9bXcnVsRjJ199qRfMOuvfQ2keM0S5Vv7/yEcDmN7Hit+MGHg8Oxn3hwyFBBzYrmajh+rIJQ2618n/0Jai7iKu5BzTzFD+dL1eWZUL2r47EkorkoDYJKR1hlGLXjQxl4JaJ4cmDpt7McxjjxQme176z2tsj/gX3YBx45IBm7jA8B7ylFEF7PvvKJsUAKOODhOA6oLts3zMUUZDUGbuh4C6p/PC2UFt3+a0Gb7CIHdC71thVzkHY53xDor19vY1bRk87g7/5f/YCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9UeoSho8L6gBBpuA1IO1ksF9eB1d/J0aWgbxnz+35E=;
 b=2h/F4V3QqOelpqwCMSZOEbaPu3IE1BoA7XYZXqeSs9z5UJI9H2t8cVYBbhdAbEp+zLDaeXMwc73Y5zNLAqEJzW9t3fPNmlzF2scpEFzT962zu8eswlftThscyGSA89PfcACuUuf9Tbj/20v6cBU5liLfnexqbsvxYgJIRVgXyC4=
Received: from MN2PR14CA0027.namprd14.prod.outlook.com (2603:10b6:208:23e::32)
 by DS7PR12MB6190.namprd12.prod.outlook.com (2603:10b6:8:99::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Thu, 29 Feb
 2024 07:32:34 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::c8) by MN2PR14CA0027.outlook.office365.com
 (2603:10b6:208:23e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.27 via Frontend
 Transport; Thu, 29 Feb 2024 07:32:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 07:32:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 01:32:32 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/7] platform/x86/amd/pmf: Disable debugfs support for querying power thermals
Date: Thu, 29 Feb 2024 13:02:02 +0530
Message-ID: <20240229073207.4092698-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229073207.4092698-1-Shyam-sundar.S-k@amd.com>
References: <20240229073207.4092698-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|DS7PR12MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b057431-c531-4706-ce44-08dc38f898e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Aco2MRvAIZmt1rg9TUj5Una0LJxSVVOWIYwVDpSj0qWBfzPyHDxx2KG/0QaZs7TUaotanATQMHgSwrb7HLCu8A+9EUgqHmkV/VljjKgQRtkjsTlbwURlmKPdAPYlSaKCUeyg2c33O3spKb3XDZ6e/iXXZx58GGYoDADItOjMuHE3Zz/O8rr0znmDrxbKkv6bbs6rj1eyneUsakulkWCwhGLA0DmgSuZ00Zy1s0z2mBF8rPhDiBIbIK7/sxjHbdZctdMU2rw/ZR9DGqeKJn46bHuVeyl1T23palLnft7zCB/Ta7OAvur5+kcxflqkhW+Bz23kV+qlX9f8E2Y8Re2R+yICoKo/VxQhjMJf/Gyjtw5F9fRykMw3D7KSPUS/zAWvoiG0XrkNvcbkdQOxVFPWkY2nCay/uGuCf27imAkaRr4MqGfJTQ+saleeDBlsg6JYdFfhATMvljYgVu1ZmkRCgfMIg9JIPfIuVOanTB9zhV70lq3oLDEhyftV/0jR8nbPsQpd1StmDJQGOGoZgcsqHwGQJ/hSysUpfCL+PtHImbwarc/akEacusc3HFcN7U5wIfW5+FoB2JduIK422HgmpzeVgKPi2KzTn07ccapmC/HpEJ1/VWtCMlxJfYYR9pRy7LhCL9CRaFDPIGqAeq7hzDMfyhirRSYTTQujiyTEUucBBGfHZk1Bk6vU6LpBGvLyWlQw0ZofueCFP4Utgr6BwdjtkAWh/hxhSyVqw0X70FYrOAfGUtkMPtJEzBZkts2H
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 07:32:34.6694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b057431-c531-4706-ce44-08dc38f898e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6190

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

