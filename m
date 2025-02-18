Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EE823ED64
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Feb 2025 12:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739880416; cv=fail; b=uiB4xi4tDtRxOOHEffEFoe2+Ppok4P+sTmMf7JruND4sX99b0dtz0opiKnQ4lYbpVDOraZwUBmi3ydn1eVrYZLb+1ehr8p2UfxMPhMkJ1qRXZLrFna3WnziATttZmpmzVK0tpwmT9HjKjOSsjzUkx8hT1FfnMvDOAEpHtJ9hu+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739880416; c=relaxed/simple;
	bh=rCYZ+vRVbzYsOysDIKM+ApEE0T6ydHctbGUTB8plzSs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QhRUPe1La9Zt2fDhcAYxsU0LYfIKBbED3zAjBmF6Uj5jjwY0Y46LjXphAgxJoYgMVSsoYpsBnssdt8HTPTsxuC1CpnZK4Y70OxCvlLvy/lK05Qud+e6C0i40WqMhCTEyy5bTU9MH+V1FakBpolN0nOEWF+1EJO+cU2HLNHmhUXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Wvthmy9v; arc=fail smtp.client-ip=40.107.92.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Wvthmy9v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3G6j2myeVAtcwp8GRHAaDe2EYgZNXWT657zxk+FH7m6UL4yVTDEt9SLvX/Kk7aHnMQTjcUeDivGmWKjWNj38lCEwiY4w5uaACV3GE3XVa4ZgrI0gdH9oiOHdNSKwRdYAkUh35En8AKPYa1y+uDsHPlODtHxUcmoNqC0US298j3ghW6PNzvMR/Wq9dAxS+WxQj0e6lKZe7ZuRp/XhHiTv26PbppQgOSbRxcav2iCRsDS3OFqygWtTsGErKnFP6DFJS4k/wrbRhDGB7kqOJWuTLkPhfxwsdAAWbvHfbbnD32ui04s+D5+TJ5wMoUR2NGN5oi34y1bAit+24mXh4/PcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piGAb+PyToqV4UqgpQMZyy1MX4BG3c2PMYMT+qibwTM=;
 b=BHpqYOXI08jHhla+9RXPJU+VEsBikaYjXYWCMd4j83OiyxKGUmE1V0ZKSp75Og5WkvfLNxocSjMEQom9yvgLhOKamx14pMwiICjKE0qKxgnLg6k2d+c7MJ94/cI71vThL7Ml7CRIsIU9SNu4qEQXLz5bU2Op9p8+Xg4LDunrsX+G/OoRAM9WSr1MULeOKRGfRosimUoSfE5LUZdnimY6ovLt8edkvDFV4E5VgaKvnmrLwI9VUhxX6Wlnu4CF9dntj8Yt+L6vfQjl1y8q+Kv96ZOWHTv5OtoaTS0/2h5oblL9yDWd1gdkj9s1K1oWT/8wLOsDoggMORbxr1fCsVFscQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piGAb+PyToqV4UqgpQMZyy1MX4BG3c2PMYMT+qibwTM=;
 b=Wvthmy9vhSEludLLOsxteuC2Geckd6ZKX/Zmv3UoHTdkm2JzujM8e8599C7bCDfUSrVkm9aZS/ucY+XyslEn4WRBtNwzepWlHj1V78zR4w0sdiPoqncnlVtsp904RyNooLN0QRU6SM+u9H+t74+pi5cK2+JbmtMib28HqZ18YXA=
Received: from PH8PR07CA0010.namprd07.prod.outlook.com (2603:10b6:510:2cd::22)
 by SA1PR12MB6703.namprd12.prod.outlook.com (2603:10b6:806:253::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 18 Feb
 2025 12:06:49 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::d7) by PH8PR07CA0010.outlook.office365.com
 (2603:10b6:510:2cd::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Tue,
 18 Feb 2025 12:06:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 12:06:48 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 06:06:45 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/2] platform/x86/amd/pmf: Propagate PMF-TA return codes
Date: Tue, 18 Feb 2025 17:36:24 +0530
Message-ID: <20250218120625.1718196-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|SA1PR12MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b40282-f8f4-46b7-82cb-08dd5014b8d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A+hMPwjT3sLfuysqZ7vZXRXTgEy5KP1BaefjQ7zNbTJBV2xaj/63bRW/Pl/d?=
 =?us-ascii?Q?V8rZBUApS/CNZ6cnEIUcDUL1pS8JWvFzfo0UD6okZu3P5AqrHUtqQDXjhh2O?=
 =?us-ascii?Q?uyCLOg9RUm9dJKqLoUMAlb1cYEGNgDCc4FgeiWryGXuC9o9GG1qx+zIhO1RF?=
 =?us-ascii?Q?Q2AWXHOJR72BEG0er/tIWDRHaXJV5tQ9/2bKBZSZqJy/atSS0UyTuAaxngiL?=
 =?us-ascii?Q?U/aXGoePdyWE1tM8TtK82uhI6L+sWgbX5ljYbBvKNLKi3TIxTDf+hi+7VSGH?=
 =?us-ascii?Q?pBnf8wxOxiowckLXb5pEoZSLLk1ENOv48+QbenEDNyoCOmzywrHoKTNYWyMo?=
 =?us-ascii?Q?JXgD9HWx+IFA8066MH8IpifEPSt40TtTYrVJixzEPJeVgm6JBpj9dUlZpa0V?=
 =?us-ascii?Q?T9KUONpggKuM9rQI8jqxuda0TlOqZYVhTRlySsxEA0xb+HPorfouHbhyLOU8?=
 =?us-ascii?Q?rH1KKTcQiz6SKCzsY2/5zZXTqYhtF2tZCdfhCH/nP2/EuUNy+jpgatiDUxCT?=
 =?us-ascii?Q?OoIlrcnE7UUHiMCEXXABCTgfLdw6HnxKKqzY6rEXcwPAJxklSJyX8aWR43mf?=
 =?us-ascii?Q?JZhMiZ21GmFI/ZucgO8LOqUCus24EGCq9j3n6l2MHaiI8eLT45Ty1kAzLjEc?=
 =?us-ascii?Q?RYv7PWjIjEFYpziwPMziQAsON7eQBR5pUjnvnsto5BnWweZkGUWkEz+SjHix?=
 =?us-ascii?Q?O4oOdo6UjS2sJXKSzINKNQPqUC3zIbFE4Fc6oThHniNHzTCEuL3JAcN2bagC?=
 =?us-ascii?Q?wtMWXRYpoETXYvo7dVMdQLLTzArSzwE5k2nxeRDdsnMpOpSkmwkBVvUKe/p+?=
 =?us-ascii?Q?eeStw4aZ00Y1hf/Tk5KKtlvaabm92iqdhQk49s7hTyyQhT/fSNH6tvriEmCz?=
 =?us-ascii?Q?/874fznPnkN92kuV0LRpD1cJNCvyDsTW4V6wm7qR/6mxYxRYAHkcc7i3bzs8?=
 =?us-ascii?Q?bLhKfelMnVawMc8uNbbLGeeH0z0dZc/xf30PSF/B3YxzeGEPKC20C035Xu7j?=
 =?us-ascii?Q?H478QG5KA7ssWXZQ7tRkL6Du7HJaLZfdw6X4aVGPEOP8laAK/2fL8iWsszDR?=
 =?us-ascii?Q?TLE+7rDB89/BGiWLtK52D6zerhMb4ypWnbIM6raH4vs0LNyiqs/MECngTpqN?=
 =?us-ascii?Q?Ev7tbxTCO1dVqrMt8rP/1LwoF4D6k0slgjwuglF4B4/jR+6iLVRIc/d/5N7P?=
 =?us-ascii?Q?2d0c4nMByLHf+Yp85XiwEWePo5UnnaSoORU+4CE0M+r2CkFzG6/FTs6Uey/N?=
 =?us-ascii?Q?h2uHzGdmgpHCmgh9eZeoHJZoI9z9+PrnWMBtIDBwysW0kQqu7rQ99hPvJiFP?=
 =?us-ascii?Q?Mex66lI41Ttrl/UsFScFjBkQz0Tv7aegGIzwVZgyjBSZvsTbcbkPoHkjSa0T?=
 =?us-ascii?Q?tbOoH+l0+vBdTPwuhp5yjJK3HX7/g6YUIcYv1PPjK7CLnlRgBFqOLAEsRB4Q?=
 =?us-ascii?Q?hzgOb27+lst3DiH/xewW/nvqhsoHpbFEC+Z7Y/zUWToXclfP8Y1Y8fk3E/iK?=
 =?us-ascii?Q?rcxZbUXNzYZqWt8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 12:06:48.5615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b40282-f8f4-46b7-82cb-08dd5014b8d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6703

In the amd_pmf_invoke_cmd_init() function within the PMF driver ensure
that the actual result from the PMF-TA is returned rather than a generic
EIO. This change allows for proper handling of errors originating from the
PMF-TA.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 8c88769ea1d8..b404764550c4 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -323,7 +323,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 	} else {
 		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
 		dev->smart_pc_enabled = false;
-		return -EIO;
+		return res;
 	}
 
 	return 0;
-- 
2.34.1

