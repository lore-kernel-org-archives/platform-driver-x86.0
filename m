Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765D626AC7
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 May 2024 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715337358; cv=fail; b=PVSr2kKmB1zHHAx1GWzIBgN8PTb8RQQYMV8S8YG2M8LqyOxg3B2V9+/N3Va6bYdTsDwsqYyv7BlHPJh8QJQeAD8H6JuNarjgDqlNVUST3KQ/M1bldB3Cm65jHtgBePBVw57U04LTPssr4ky4lGr1Pf2NkqquKjRthgFPVuybcbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715337358; c=relaxed/simple;
	bh=iS30QqDXePf07n7sUqlq3NztGkagXFk4b3KNgEErS8c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NF6U4/NuGhNByb6x8iYENprxwmwaBg1s9zEN//v4I+SLgyomMNAmXrCVttsFnPLqpgpnCjjDHN7fQQE3QD1/S8AZhq9le0TcvAXEbn5Iea1faOQzYT32tBPcJQPVfI7o3oHozsSaw/Fkmp60F2xdaoUSRWFYuFeJyiEPgRk3Czc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FwgrgRfe; arc=fail smtp.client-ip=40.107.223.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FwgrgRfe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQQ9bpdKhQ9mxRvvIvRYEuXewi9O8kA22Ap7ORTuNylF/TPzJbYGD+SldZ7BnV9Rawj3Mf0RFhKWEMhMK3VALT+Yxxol0TEhl3DaP2JjWzhxJnYMBjvkJNJesBOiwDbXL5KK3Foxj4Fpdyp4LXYwdLCxYYpR/ac8mXplpq1cz7eOeP/A7gFMPZQDSWKKa1SCs2Ay27IKGHiGLLjHjsKnOqRPI3DvA18jxX+TNZfFqQk6ObEAdyTGcz14pWtoEPnapfCGqGYE0i4aQpRcJATnGUlVIfoiP76EYGBXIMkkIRJVgk3NSjxDGMUcZILnPQdg0IrX0GaLW8qFpcWzYY6YIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEnKHT6atMVjhVVOry7BflKkomJ5LFSNT4qXd3bFFLU=;
 b=AtwUaJ9mZa2FpZFmOqYtkMTGAXLoGnVIOnnJJ5gJnm6V4K7NFvNC8KjC5QDcH82gmDgMoNdCS5Bh7swCiWg9ws+qrO09Ap0wf6FhzReleFSur7sE0aUohtmrx4qwU9gDzZipijrZ8evp/cfHayVs9zFXai/W4tk6Ft0Ht+kfx4YKnMnHLfbKw7aHqwYsd70BIl9e3XOLhlKGL1PD5EP+gnGD0GNPOSYhuCcpnhsOSptXPp8f+/4uNZfyW97EokvhWn3Y07iXcQFlXiOpRbn+Y4Lhqygvu51BsuO1Zs5IDO0HRJ94hXLm9N+YdImH3nH+RVkTswFMsi5xhpUNzSlXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEnKHT6atMVjhVVOry7BflKkomJ5LFSNT4qXd3bFFLU=;
 b=FwgrgRfetMP9p7/NbajiBMEN3G7/aEVakZUYVbtFaEW+FFzERT6MmHxa/IgyQpvhMWos5TaQ8gxtO5etSTX1o4sSQYkzK18GS8/K2ztwnD+TdqqoYgdQ6wewcfNPWaegCDYjMbezoEFS3dZ6fuiP6apMY0YDge/isrJedMgN4Uk=
Received: from MW4P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::17)
 by DM6PR12MB4355.namprd12.prod.outlook.com (2603:10b6:5:2a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Fri, 10 May
 2024 10:35:52 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:303:115:cafe::16) by MW4P220CA0012.outlook.office365.com
 (2603:10b6:303:115::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49 via Frontend
 Transport; Fri, 10 May 2024 10:35:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Fri, 10 May 2024 10:35:52 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 05:35:49 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd: pmf: Add new ACPI ID AMDI0105
Date: Fri, 10 May 2024 16:05:19 +0530
Message-ID: <20240510103519.876646-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|DM6PR12MB4355:EE_
X-MS-Office365-Filtering-Correlation-Id: 02205254-1b09-43e5-90d3-08dc70dcf754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b7Jnc+z355JZ6pjbEqQxSeF8dPL/lUQv2QKnVSrAFRY/XiO2vyDPgczTTfy9?=
 =?us-ascii?Q?K65EGpBz6zJhIaIzXBBh1r6jFfP1ezEGC2RucZZ6sCM6cmTWzFCpsrY/PFAY?=
 =?us-ascii?Q?/B9s4VK2UbVqPVvmCKV+bpAU8jSgqjymiO6fC23WB+Ua9gldpPYPm7TfUx7z?=
 =?us-ascii?Q?JAPVW1TwTBnQVWqjnX0EDlE8bumneSJK4jqv4uxyWR2D6wWt558kadRTane1?=
 =?us-ascii?Q?8W7WvoEjn2ePn9tWlQimAZgKQCUu7e3/MDbb59amrdlvLcqlr+4ERr01UYya?=
 =?us-ascii?Q?KvDAjIxz9E9hgN71QlB8G2KU6D13ZAQfCAfO5dM6Mpe3Hbh4SePX1vfpB7CH?=
 =?us-ascii?Q?mTxT/3B3rHKciJdg3oV8zfl4a2BtFdqdCT+OXQ920pNohnujtXOfk/AIgaJh?=
 =?us-ascii?Q?1SAKta5ZYqzWxzafUw8Mj7JtkfIDBGcmWf05R7l71UafcQ/Etd7YztjYAjjd?=
 =?us-ascii?Q?tDH868JB+JcqlBQF3bgprUkRpAK6nijFjbv+Bk79wdDXRq/BgfYUVEbjI5UW?=
 =?us-ascii?Q?hwHWspj4Us/r7pL+ePiCUZgPlNYxiB9MI7wjRLtU153SPqfZiJI6Q4fNq8pT?=
 =?us-ascii?Q?OyUp/t48Ju9fu01d+stkmWSBLTmRVWZP0PS4TYbEqE8ikM+11dD/dWkJ5fgj?=
 =?us-ascii?Q?4kMnKTa/o0NwaoKKGKfWspGMjuX3d8FxFQ33IJaF/YbUskyfYsioNB7uRP33?=
 =?us-ascii?Q?CMAyzUma4yY0gjpcKT7fXggLytBqCxoAdHCRFohUczUOpAYuFk5dHTKT2L22?=
 =?us-ascii?Q?giiKeoYVBo6+E5wLhkIJFiIpWmwuBDOdw6vetAxw2UBDxBb76Kq31VHbI7s2?=
 =?us-ascii?Q?cL/SM4JP9s814jmGa/N87LPJFLPVY879L90+exDlgnYUzI4i/Ckw4kOHBGHk?=
 =?us-ascii?Q?Xu9OZFyhSjrv2l+a2HzNLckA2o1fFf95J7jvbEpOihxbOmSUQlYpxPa7BS84?=
 =?us-ascii?Q?4ZJbWJLgzGjt/xjxCKNUO8fNE04xgNX6Cmn7p+LADMo2Jum9q0W65FvAH6/s?=
 =?us-ascii?Q?z0BX0VKx548tphB1s9CIC9VrvM5B6JC0JCPsGXRCLWKkG2k3ujKSfwb/0PIC?=
 =?us-ascii?Q?4u9ADcqHgcStqfPJeYepbVxFf80fLPG81o9T8OBcaQFDmUCsmlnlLJaJY6fL?=
 =?us-ascii?Q?g37OT0i3qQda4JG7ac0s2kTjayNr7EsUClkqiMSeuuoyU7CsCxJ1vgEItWd9?=
 =?us-ascii?Q?dTxXVkeVeN2yHClE9ntCvKXomf39EyZRKVlXhyNYSJAUSkR4AMBmoX4Aa+wk?=
 =?us-ascii?Q?w+RtRn9zNX5g/VYJGYnVkXArcAVWoX7OgJSIJVSskfeSRh12WN4aqhYrCJfZ?=
 =?us-ascii?Q?8E714p18XC79K2S/NLWXmu+TbenKIiMBfPSSMa4a3hkfAHvbU+bBLu0ljptm?=
 =?us-ascii?Q?qj1pkPZ1xkKCvcgJamGQGZvIl0r1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 10:35:52.2523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02205254-1b09-43e5-90d3-08dc70dcf754
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4355

Add new ACPI ID AMDI0105 used by upcoming AMD platform to the PMF
supported list of devices.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 64e6e34a2a9a..2d6e2558863c 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -381,6 +381,7 @@ static const struct acpi_device_id amd_pmf_acpi_ids[] = {
 	{"AMDI0100", 0x100},
 	{"AMDI0102", 0},
 	{"AMDI0103", 0},
+	{"AMDI0105", 0},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
-- 
2.25.1

