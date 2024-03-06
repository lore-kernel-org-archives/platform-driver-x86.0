Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284FF5FDB1
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725487; cv=fail; b=NqDwAtorZUVRbsdDqINtxRhnee+VbiohvYX8FzZRfvkWNaxC9j+Gc/n434bT5RLwQPJrz0GLMtRvtnVc9/aBNgiDBVa8CGIexB9mDcvGCczNwiUH+ZELdS0WDTIBL9ZI2ktuGP/WEK9+MzHBQIDqU+GV4ZB8x2Uhin4rebDdIK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725487; c=relaxed/simple;
	bh=lW24easOLoXi3pXkwvLjfjw33Qv4IbESKS6du9ghKfc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=klFWAYsFYyx8GLy9scVqqfkjb+J9kz3baGKcGZ5nIwv6X6zGR8VXLJP7fDuGUmUFAhpLD2ZqFv45qIwkoeIbNMq1Nd24U/f2efFliA8rgjB1zAS12McDsTo0yCBIT0b2EsoX/IpYExIl/Le/HonePqezGzYnKT2FBlIH7xNz55s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CjzMnuf/; arc=fail smtp.client-ip=40.107.220.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CjzMnuf/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gU4qBDpXr1BoEpnXqgJL7VEu2rAx13jYVeVFBEv2z3TSKALUNWXB0pJoXTbkI1QVFoqeXKm33lgaXJ7xOgJbdsAnc8sAd31m9QfgL2hhEjC7jP7ehbl1jPQuHkRJyPS+C3YqNOxsHlLtwRjoVZ3UaW/yrUFghLf+AXrvucV4uqVaXPga6ZvAXf3URcqoQ65/7eztXmemp31G1pN9rsRgEYy4e7G2871BNFVf3O5QMnul1gkc2tUpUc/B+AdFyoEAm11LCO6qECtUGEF4hNbK/SF8YmBKBprVWx13b/qw0O/cHHqjvxQ0qsTWUa6lpbwtSU1VTtgWjFNGW0c6XqhnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1wx/XA0nJFCYNuOL34vmmWUxyNPrfl967aWQyjQtlU=;
 b=VCZt2evlG463Pu9X3rWtMzV9MPXBwppWvYpnCcsg6G8sQ24zlFVJDZNQFhd8XvbKphIlu74/OsdLGhrTFaDd+0pXvFPsIiXjLzrR0Zpw1iBnWmnNZf8XKp4U9khFXTQZ7QUPAVaiJFpbkvJnD3Sf5X7TsajT4+vGrMzRvzI+/mUqta6XNAvSU6O+7NiKOgP1XW4S9kFTqfQcQNmVN8v8enjFQxTKRiQR4a9Hy6bLqU9MHam+X7/9ZIarriZjWU/pZ1YMJsumbkTjMyNm+m+n/2oPMLsBYgp4OcCuxszAXjBarngInd/lvTEOO3b05uOzg/EtW4LycC7OQyHAsJa/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1wx/XA0nJFCYNuOL34vmmWUxyNPrfl967aWQyjQtlU=;
 b=CjzMnuf/V56/zuUXg5QoOtsVVBJlnRSOkgv6R+LhKvEdDhVsSI94ia70ESaXWpoH6IikIYNtLupln5uqXEMaR4q8Onwoe+/6mR++kHwbusShQ2Lc5srT1bziDaHE9K+F5AietsQL6V1coasoNhNiukN27NWITDEBaUbJGodG054=
Received: from SJ0PR13CA0216.namprd13.prod.outlook.com (2603:10b6:a03:2c1::11)
 by IA1PR12MB8309.namprd12.prod.outlook.com (2603:10b6:208:3fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 11:44:42 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::77) by SJ0PR13CA0216.outlook.office365.com
 (2603:10b6:a03:2c1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24 via Frontend
 Transport; Wed, 6 Mar 2024 11:44:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 11:44:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 05:44:38 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v3 2/7] platform/x86/amd/pmf: Disable debugfs support for querying power thermals
Date: Wed, 6 Mar 2024 17:14:10 +0530
Message-ID: <20240306114415.3267603-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
References: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|IA1PR12MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: ba6455a9-f853-4aba-9f53-08dc3dd2cfd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BprBWocnUiICIn5ZTHixyyUAU0KTUMYJ6Q/CempLb6NDwXJugmmK1vhI7RhzaOt/BN80jQVPFIdKDDzZ/PJZ7FxW1xNCMaYjEXU+bZd/7mww3okGznweJF8jscctmu1q6qxkqysz/qaCTXL0rdzrZQzJNm/OVczaBl30w0Fj7qAPyd2mqgFWxS7apI5T0XuqfvxQktuft/2o51lq8g3TWCIxXVsmB6Dqy2G4vImt07iKytZhO9dvZmNngS+Ornf51MQf6TG/CSMrdk/KVF3/1dX8OnUKs5c1+DCy0FaSfWATSEHZ/1r/6r69CY8hq7fn6Vh5zRlgGckwXXoA9h0j8j8eIJtJfi1jjesDLdhe/iyu95LSG8JsegFvG/umAe3dwtFL1m/on48nsFzQs5WjUId5MIvQJyS/kf/mGKVRLMuhE3j7jf02CazeJEIzhpmIKca/BojNbNbVw+zfKMMYEFCWkq81oOPZKGB885vKJMI1XYuKu9NVm6+EB1QP0F3vA5fO1aDNb2YyZ9EjEqQGjNvZW/GEpWVQNjb6CgGUFPxXwjPtwwnHeX11cAgZYf9NlUDRODZB5p77t7SXPwcfAQEOpPB3Ute/NDq9qlgsJ1Iy5YjtvqwTbBut/PoA9U4nXW+rdu4WJWKLMKQIN1yS9NWm2qVOfBN/rOXMksL4iuRpDhX2/59qH2AEYVdcDYgjtt8HDKFU4kQ6mAoq6uKcoMpoPCWdeJIcun3ObS4cwL27orlqnCYw3Ywi7OoKA4z9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 11:44:41.7606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6455a9-f853-4aba-9f53-08dc3dd2cfd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8309

The GET interface to receive the active power thermal information from
the PMFW has been depricated. Hence drop the debugfs support from
version2 onwards.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 5 +++--
 drivers/platform/x86/amd/pmf/pmf.h  | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index feaa09f5b35a..a6bdde4f1c68 100644
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
index 2f23ced7da66..51e31d008ef9 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -87,6 +87,8 @@ struct cookie_header {
 #define TA_OUTPUT_RESERVED_MEM				906
 #define MAX_OPERATION_PARAMS					4
 
+#define PMF_IF_V1		1
+
 /* AMD PMF BIOS interfaces */
 struct apmf_verify_interface {
 	u16 size;
-- 
2.25.1

