Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E02214AD24
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 06:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665197; cv=fail; b=jV1QOaL4nRkbAxEjPGF20t3FwBoFcBO7Ar/Uk8wKAqquO1k/pvogDGgOIy6JcH4cHihvCuzywHrwbI0+8w9zegdeiOvKWNrgh2VrGTtBBM7DhiSum0QsmFjeqb/BC78oALwAMdbnV5LYCSRQUYqiWxIRF8aWtakwmD1v4OyrcFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665197; c=relaxed/simple;
	bh=FNErLgjRpZhdBNSB1a2jntVthk+vfoGnr0dE/DPtHb8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d+UrIKzZOesIfqt0Y87l4InV6GWYcFxie8AQPakeTER93aEQTwK6DhhoR7cgCQEJFQbSmekn2s6HqfDAdUT5Nqxd+JnPpR4Q1Pp9kyo/xvE0GD1S9VLmEjOPC+hIO0KiM1M812heDmQWxXqqzMbnWwXLppW9Po+ZrfI4H3/RKrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KrZkhjcT; arc=fail smtp.client-ip=40.107.244.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KrZkhjcT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oU41ugazqmKqvmHMCfNEerbLjOV2EyD/4xEiX/Bh730cEHpMepUMrAn8ynxAfsCgvl+I5DyFJQZE9GuC5SfpCh4Z0uP59VPBGOLoL6/Lzwr633FV0hbp4rroWE5h5/cBFR1A2ZI6XjqajYDDgSfE0jpBk7+3dNaaSTzcIwamXQaq8H6pfnxafKIAU94f0crS/cJ4E7069zuLEn3Qvlo6lL1MNYrUc97qnERBAHXj4UxhB8uXkkssI+rOD/i6GYRiLSBjFbuFiGBWCI2ZkNHoRskngERM7JMMWPeLPnZpPhiwtAGGSVX/tJGMd2yeA0K4WqTjc/Bpm4qRHvJoPeWf1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KUWPU14Qf8c7Ktk7MKkMsuz3OR4Va4ocWiSm3ukszM=;
 b=hml9rDOHSaNdCnMQk35J+M9qgPsHEpOeHe7fy7Q602YWfO1UI8uWkBt5SHMP2F7IHUJAjIAk8h9UsCERq+YSx0p2PpYczFy9Hb1gwIxnX+S6cVD8cgI5cu5u4B3LVn0ESGuIp6SXMP3MqtWaaxomwkf82gZbZC1E2EcvfdnZquWbdnb2DCgnoGU9AmMDVqX0/UlH9GmZKUKa1Y1b5yNsAZplz5VCGNfwcPm0e1MUZr4Son+LaW7pL4IpxJYt/O65rRyqxw0VdTQYdMMSGgaceuoNgLj0nVdC6F5s3U7K1yQruPiIlFXkjs1QZ+j7M8G01cCQwK1Po3luyI+mzK0PKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KUWPU14Qf8c7Ktk7MKkMsuz3OR4Va4ocWiSm3ukszM=;
 b=KrZkhjcTPa89XQSpotgeC4ankSppg8zJwRj7JAOWKw4b38OLOhSr4sYzlYNivzML6xKNu8wIDydbSCjmDoeCkdljv3YCLLVxMWhbI2Zw2v2sARMPl6aOI8mFCucWNQoL6aUQIgzAGEDc8izc3q2J3toiTK6jCHGBoxlKsfGOwus=
Received: from DS7P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::6) by
 CH2PR12MB4150.namprd12.prod.outlook.com (2603:10b6:610:a6::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.20; Wed, 23 Oct 2024 06:33:11 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:8:1ca:cafe::87) by DS7P220CA0001.outlook.office365.com
 (2603:10b6:8:1ca::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18 via Frontend
 Transport; Wed, 23 Oct 2024 06:33:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 06:33:11 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Oct
 2024 01:33:09 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/5] platform/x86/amd/pmf: Add SMU metrics table support for 1Ah family 60h model
Date: Wed, 23 Oct 2024 12:02:41 +0530
Message-ID: <20241023063245.1404420-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|CH2PR12MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5ac993-945d-408f-471b-08dcf32c9105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XqcaEJ80mTesxyRZcErSY+Mctv5YkswA1LlkqyTjgmF26kDzTIhqk+/qfahf?=
 =?us-ascii?Q?N0YQzAY9+HxEdaAZMQMFvjP5qVhFzKkp/xnvPK8tDbUkxQy9HnhiuXxkv1T2?=
 =?us-ascii?Q?6mXNijXnXkl3ejweadVTvCZBeZX7iQXaZ+JpdJOE+80AdYxqsOSH88Sgmq18?=
 =?us-ascii?Q?JokoPjxM8gjUVkfuWwxTRBoeNp05ZRoERyEDVP1puenz2wEM2iEbyW5+5FNh?=
 =?us-ascii?Q?7Xt2E+W9ZYyuHlmwJL7z+26UEUbpGWEy7itjY87KfaALeHpT16GSWdf0zFn+?=
 =?us-ascii?Q?dNnph9sf4whPUOuY1UzWiiKazNJmVVcWL39DQEXrjy4uKJSjkEPFFcioPS+L?=
 =?us-ascii?Q?ptya2FremOvGesoLiN4KWcn2MAYZCm+TT56XEndKEKwKPk8dWPQsSuRRMc0S?=
 =?us-ascii?Q?PuW6yGApqteVtgd1djGUqDchU6TiewcgQKsDe2pUgIQ1JtNEnSSaUKxEuLSV?=
 =?us-ascii?Q?r6ctHiD60OgzlpWrQUBzPcoDC4O7dYlVjwVJYk06PE0nZugP3G4D2BwErsJX?=
 =?us-ascii?Q?YCD5W6Vvs52I2uRShMi19lLUWM13eVKve6I0Xicecif0kHZRjsW0ZrfM8TS4?=
 =?us-ascii?Q?VO5PalCMlAw6hEf3c1++r4CJdL8ZqplncW2Wm5mXMc12CO14Sg1l4BYKxfFK?=
 =?us-ascii?Q?FKaiaPUcPkC0ssaW9x4k2PgB6sTPxTkSF7wqj6K/7fFDFMzixOvEmrTpoQD1?=
 =?us-ascii?Q?DLs2rYqg4zm4KdvJ9mTyP3LWUpfL+YqoBfM53eh76QhCKKnwIuNt7hisc/ri?=
 =?us-ascii?Q?ZDJGHL5+fwI9UD9y2Wj4la4MfJQC5jVPcSMvvBDL6xB0i10qoBL8DaMzPVH4?=
 =?us-ascii?Q?tj36FhtblGTRBHrC61a3/3m55lezZZ5vWlvCJDDQfgRqt8o3tM7NbrFSwvgf?=
 =?us-ascii?Q?uNd0t+hhJ/ItDXmXK/y2KM05YhVL4ehVm5BVYk6QXI7o7CfhR4ddPiJVmhMq?=
 =?us-ascii?Q?AX1s9SbxI5s0nzF+YgBYKwa1e+SXdqZLFhK+ybYtpwSBSRvRlsKxGOZeJ/oG?=
 =?us-ascii?Q?q51F4+VMjYJ1JjmUvWnWvqBKpCNqjXkle8W6+1ZEqlbCW3Ps4ZuqMfCVopgm?=
 =?us-ascii?Q?FBuGlkRoxRdgci37c8MXdYUp18I2LSWp47aelTNJP3rtYBsKnuMFEh8jkcZ1?=
 =?us-ascii?Q?0gl89nIAoVyBpjpLpYvzWA9hjs3iyIxCzNWwsAR7bC1lvioJQ+INN3twzTqf?=
 =?us-ascii?Q?dfe5V73V7i/rKLE8MRIfmAPM2eRsXg0QzcWIE16OHMg2yZ5cU/qLhsf+vmsB?=
 =?us-ascii?Q?dr5nXn34rF0ntL6ZhJMerHneuwcq9dCsehBZ4eWqWQ+iYr+Q1aYWUUyN8boi?=
 =?us-ascii?Q?uwoRTjf1py29C3uXVQzGlPhqd6xLVdM1De6m7Rf9+d/jiH8IKAdHT579hRjB?=
 =?us-ascii?Q?zMObfANE9TaAZ9GNdIbYFH81F38pTYhtQSTufPH+kvedGKbzCA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 06:33:11.5358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5ac993-945d-408f-471b-08dcf32c9105
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150

Add SMU metrics table support for 1Ah family 60h model. This information
will be used by the PMF driver to alter the system thermals.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 1 +
 drivers/platform/x86/amd/pmf/spc.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index d6af0ca036f1..347bb43a5f2b 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -261,6 +261,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 			dev->mtable_size = sizeof(dev->m_table);
 			break;
 		case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+		case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
 			dev->mtable_size = sizeof(dev->m_table_v2);
 			break;
 		default:
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index b5183969f9bf..06226eb0eab3 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -86,6 +86,7 @@ static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
 					 ARRAY_SIZE(dev->m_table.avg_core_c0residency), in);
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
 		memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
 		in->ev_info.socket_power = dev->m_table_v2.apu_power + dev->m_table_v2.dgpu_power;
 		in->ev_info.skin_temperature = dev->m_table_v2.skin_temp;
-- 
2.34.1

