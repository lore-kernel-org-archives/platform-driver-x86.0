Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E7F1E3DC1
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2024 10:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988269; cv=fail; b=DbNPyq14fodsbrQRfnNwjAljBeKQq0oLaHpPbUwWcoGnxChbbQxZl+a42TcDiAK/mptM8lu4WSZK+m5Y/dVFE/Kl5xwf48+OJ3Lalu+lyv7YNy73NEy+MS988HDv0Q8mW7wwVE/aw3aWXIzRk8e+UApMhbq6t1jt8RK+SPprbQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988269; c=relaxed/simple;
	bh=je8fVkpVkgeDr7N+z/t8YzpswML6S+Sr410n06+TBX0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VwhAhtiG9DJurDxROTUkl5fc/l1lxt8XbBnyHJgT4eXVVjFvNm7TM2QFIyFfTR8ozz+fcRiSg5wW8jP2DI5HS+3sbKatLAg18H6HAKGmQUtMpcl/AdQ6IARpLlC/SG/GHrdwtGS9Nh5z16Et9dj7z/6xoQ1ZJwO7aQ3o0vnUPLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FX6g168N; arc=fail smtp.client-ip=40.107.220.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FX6g168N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAUxduMMipMITh63cweQIyrJNHhErQ+D8VKbwytkLRBgyMf1XCLr+jbbfuR1LlXOtckOsOJFyfGkUDMhNuJ+bk3Id54zUZPWZGTDEHHbtdn0mVFlwBLE3ltcxgHQT5EW+rYlKI5S1BSgixnkJStShkgK3ch0ZVBwbffNcEmqD46UlNri/gV7cbUJjcN21g7SyEQhGHv4pyAK0NZpByQP/FjsO6975LIsDU8TwPGOnCrhHOuuNRR8oSj+HTYQCm2DfI2HIaz0sFzAr0khQ+Igjik8YRTgBewjfU6CPVwFWkjrU1gHHD0m7nr2mrPGc5l1HIn0v2xY1r/n3uJmEF8q9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLo4vz4q9TpTcX1oYkIVPk7XG+r0Obo4aZBC5KDX6o4=;
 b=scNV/WESO4TdLTL29S2f1MQqjN0CXQf3rkGsQVSpDPd2mbR7W2qqsn2uVaBH5mc2BFt7sq/+LVVPQnI8yW5mQ58oQ3q8jt1UWX89hTb+fERJpL717Q+I1NRy56gAbQNrELg1tOkzB2SJROKmsonSIBS51tWd9xogtmkCY0V0yG5sbZJ0cLGPYoB7Llupv7HYHQLVxdxk2MuezzSNr3sSx2fL3To4C0WRRvVHEpHAhSQuD9uauhMwODnDmMQUAzrCZkRUleOTagUv0sutu/pluzv9o6nByrimHxGt1EEUuqY1vae3Y+h0UJg2WpAaqDMSm/k4AApH66ZApdDorDq+WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLo4vz4q9TpTcX1oYkIVPk7XG+r0Obo4aZBC5KDX6o4=;
 b=FX6g168NmnkNBbDv6fmDKJ4ayRRLtDUOu+LKS1+coDoJ4gxEjApO9DPLZrFW5qJwvRz2Z910kzRpif0uU0NnmI9jfYqcf56KMOBD9nta8h/Wyb4hIAH6FHsLqcBt17uoF3jX32JGMX3FNATjGFj+4gxURRU2ovEzD8KubGg9g3Q=
Received: from SN4PR0501CA0046.namprd05.prod.outlook.com
 (2603:10b6:803:41::23) by CY8PR12MB7124.namprd12.prod.outlook.com
 (2603:10b6:930:5f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 10:31:02 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:803:41:cafe::b5) by SN4PR0501CA0046.outlook.office365.com
 (2603:10b6:803:41::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17 via Frontend
 Transport; Tue, 15 Oct 2024 10:31:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Tue, 15 Oct 2024 10:31:01 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Oct
 2024 05:30:58 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 5/5] platform/x86/amd/pmf: Add PMF driver changes to make compatible with PMF-TA
Date: Tue, 15 Oct 2024 16:00:21 +0530
Message-ID: <20241015103021.1843019-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015103021.1843019-1-Shyam-sundar.S-k@amd.com>
References: <20241015103021.1843019-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|CY8PR12MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e478a43-1084-47fb-4c85-08dced047782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tj7e6QY7r6WjHTWMaE/ScOVOiGaoRRG7WC/FBRlXp9OW0p2LdFSmKjDwA1lr?=
 =?us-ascii?Q?fJ83nrOGN4CsEXM4xTl5RzBqnTyZjjZqXRz19nEnooCae1ROrNCLpwuoCY8I?=
 =?us-ascii?Q?hjX4QKXi9M35Gyau0K4gJo/LKPTLO5WonkG0N109XMVdVR590E8mxAU9hcZS?=
 =?us-ascii?Q?qKSZHtnYMcAO3zpC9YUkZuYpRYaB8fLdaMU7rj3du8qKwjmc2nvxDzTAcWdE?=
 =?us-ascii?Q?tRUWoceUR+bLVFbDfckmSt3KW2V7UpN8SuJlQYWVyPwwDQVkrLc4EmMRsw24?=
 =?us-ascii?Q?ScwAaO+BJx5UAZFXg+aqP9ESHwDTpu9LhYw9eqVmSC8+oBwj0qzYIUvk4MUW?=
 =?us-ascii?Q?2QH6yZAvFDTX8nVytFQzLVdHRxL+nFSjSmB0Bk7N6WGRce9CjNR/lpRN1av3?=
 =?us-ascii?Q?uy3sjyGJ7VvvAzOnzHE0A0fuZGWspq0S76WVnrU62oclQTTTM8X5nahJoQpX?=
 =?us-ascii?Q?qY0XSkd6YoqJ9bTNWr3mWVseeR11zEC/7qujTnXCJp7I5ibfNReRKG179X56?=
 =?us-ascii?Q?3TZrKlDNvVVii1PqV3DieIvVYV+jAClkwoEukPpSoMpidNxgMzCcxCePFBWG?=
 =?us-ascii?Q?lYoRM6KWysVqb9SnMlZFcpRey0R3if9m6y/xm77BzlR/Ej6TLzBso/3yto5x?=
 =?us-ascii?Q?hO0VW5XuI3r4SJCCAoixc/obOsdsYHHH8zriXlq8j/gVr7fl37h6mYGh671P?=
 =?us-ascii?Q?P/v+2Te9+iqifavvfUJdRBvxI/mV7lPDMNDSEVL1pQujUB5xTP0TbeNcvCeI?=
 =?us-ascii?Q?JJyWNsC0kCU66P7KkqlBHTLlKWEju1jbk7BorNos3FPrbQenVaW7DNJDr8Wv?=
 =?us-ascii?Q?Dik5+tALmncojEHba/ozM76M0NhSnyp0AVLefMqfZO3kwdilA5dm174yPNNM?=
 =?us-ascii?Q?8XD/lxfTyy9TPEdGpwWhSIKureyEmYFiiJkzmbIXuqppGAwM2ei+L6ZbKbhf?=
 =?us-ascii?Q?zMBhKCk9/JEpICBLxPCZ4LkycnRDzQjw48somFu/aksfa78UURGO4DpD4fnz?=
 =?us-ascii?Q?iEvPHPq47W4lys0tW3jtu1nsdIgEYQDTOPF3N/bplekDIvU5+oS0Uk69/BZS?=
 =?us-ascii?Q?6FXahsbxd4HGjgayjQwjsFXHWJHbB/UYwAp4v7Sm1EvwRDMZ7EUzfJyq/4L6?=
 =?us-ascii?Q?jnmbSAnC7zo6BL/csW9EHkEM6mcAiFINy9vAit2kThZ7krUTs+vph4HP/6rH?=
 =?us-ascii?Q?DoeCFGNIItd/3i3qTi5eWL3bZ4pqD3bxWvETGUj6Ka5jkUM2yZJ9EAh60W1d?=
 =?us-ascii?Q?sljtjqFuuV5pl3TC7HklGrjvbwIzV55OtxzLdNNdqDC0yb+nYzfANOzAlmHK?=
 =?us-ascii?Q?bLEB1/EaZ85OORSkF4M+sgU+Ocit3LH0cIRrQsygZ0e9GM3xomC7lNsE/j5h?=
 =?us-ascii?Q?J8juY+w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 10:31:01.9666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e478a43-1084-47fb-4c85-08dced047782
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7124

The PMF driver will allocate shared buffer memory using the
tee_shm_alloc_kernel_buf(). This allocated memory is located in the
secure world and is used for communication with the PMF-TA.

The latest PMF-TA version introduces new structures with OEM debug
information and additional policy input conditions for evaluating the
policy binary. Consequently, the shared memory size must be increased to
ensure compatibility between the PMF driver and the updated PMF-TA.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index a79808fda1d8..18f12aad46a9 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -106,7 +106,7 @@ struct cookie_header {
 #define PMF_TA_IF_VERSION_MAJOR				1
 #define TA_PMF_ACTION_MAX					32
 #define TA_PMF_UNDO_MAX						8
-#define TA_OUTPUT_RESERVED_MEM				906
+#define TA_OUTPUT_RESERVED_MEM				922
 #define MAX_OPERATION_PARAMS					4
 
 #define PMF_IF_V1		1
-- 
2.34.1

