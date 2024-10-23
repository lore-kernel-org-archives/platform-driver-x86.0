Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AAC224D6
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 06:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665204; cv=fail; b=UstzIjSnmD023XHhFJ9V9UBu5vropPoNhkT/nE+In5VfM+NtCC4VS/TGoqXIsvxxmUh4oNqDxos8D8asN3HYapmfLN41e0XLlWVgQBDibgp+GZWognYtPLxJ4uDCRlz5+P7/7kGekOVp945My36nuv45jlvSEbzEi/wz/gdZs48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665204; c=relaxed/simple;
	bh=je8fVkpVkgeDr7N+z/t8YzpswML6S+Sr410n06+TBX0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z1vtzeqP1LhVkdfzx37V0R91ccCSgKDxFJB39sHKDiimwuZQwfnXp5ire8E871zX38R/v8rCCMYeXdQ2WTVdxniLTD9+1+e2Xr7Pu99igYqS2otZ2HDC5JI9neUT7pxbI5sgTQ6hpU1mcJabPW2vhaJZjjeRLcLA4TBWpJUScG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UbCyRxy/; arc=fail smtp.client-ip=40.107.220.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UbCyRxy/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UljrlxrnPBoFgWpkZrZ+lTOtn7tS9tI2lZaxTTqYINL4NmFWFFrKksawHabfiqw7wHwdfSmYCnTkIoqwuLXisT9B4Do2r6xCBPLvOi1jEMA1USY/QuEDczuV3CLHS2hSSSEtU8qndXk+B5QWjpaP2HsJ5kvXcdy8PkwRegiEToPM7afa0lJNsHtAzVAwQOnZZ9ilw04IfKSXuiGcT/ez75sZM69ffeVT9FpIolB3UhyR7eZOD6YtnoSkfF2aXD35W0C2beT+qRuVykt7TUbi9zDxux8TuXeJiDm3MBWL7J8lMj3KMLKe2gWWvRr56UUPoA8qKzckQskA7he0iBIEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLo4vz4q9TpTcX1oYkIVPk7XG+r0Obo4aZBC5KDX6o4=;
 b=KNJv5RSZqWkmMv6TZ8Zxk9CradEtkcDCgXqelCEcbeA/dM1lPTmb6vAwGz8KLUK35dIJhVVtnWGUM1btLUdbiP+Zw2KwJEHo58Q1xOXoE58uKbor7I3geaKJf1TkIWffJhSaDQKg0Ez77o4IPQqQAHqKKXAdmyaKD3bHzY3x6QassEV6s5lCCBIHUDipIxtlBLZhO3wMXqARi8pT7JZ2gimtnK47/jUgjWY0sue72AxrxiVI/GjvgI5UxEeBJxgsIvP2WPWH3RVM90LRR2TatQgrO0Tjh/2/QETq9uzipWQ53TbF2Ib6DLgG8GFlcb7GkpVkpflAqvj7PNqawiSWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLo4vz4q9TpTcX1oYkIVPk7XG+r0Obo4aZBC5KDX6o4=;
 b=UbCyRxy/KGndxSCuajHvWYtLv0eea/rVW8dtgBGvuV/9j2c/Djo5sV+2Oh7FBlyxYl7wQxKHTYTtmKywxtEvbVW+/z9BhtN+RHEFLhOW2xlEKrf/tpbW9uMmFHgpQNoC+hsrnzpAknU4PEXfQvTQSXSrb0st439lm3dDb+pP4ds=
Received: from MW4PR04CA0301.namprd04.prod.outlook.com (2603:10b6:303:82::6)
 by CH2PR12MB4184.namprd12.prod.outlook.com (2603:10b6:610:a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 06:33:20 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::39) by MW4PR04CA0301.outlook.office365.com
 (2603:10b6:303:82::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Wed, 23 Oct 2024 06:33:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 06:33:19 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Oct
 2024 01:33:17 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to make compatible with PMF-TA
Date: Wed, 23 Oct 2024 12:02:45 +0530
Message-ID: <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|CH2PR12MB4184:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e0f4712-7fc1-486b-0448-08dcf32c95de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1DI4NsV9CSYIbTVqckz70ONPMA0FbKu21fifpmKgnJlzizYNPAG44jiuABQP?=
 =?us-ascii?Q?phWw+TIhKADaXiAVyQ5Nrj6DICDNG/5RtIjdDD3mhvdIYDM4/YCBxXfO8Lc/?=
 =?us-ascii?Q?8tmzNOoef7syTfE+KwZ4ul0yZLN92u/fXIevtssmVqXI07FpZA9udrdg5T0y?=
 =?us-ascii?Q?Z8HEcK02RNAkA0j4gqt86LurAj7hqRMw1JoPcB6pfkaJ43cKzhai5b7bRChN?=
 =?us-ascii?Q?aSJCC2Tnb1WTycMfrtPVQMNJFiPTD+pywsUnLtW3UODQO2bES8+dH3cT5klD?=
 =?us-ascii?Q?cliemcXEYMpqIMmSgR5ksX8/7rhxz/NlOGWr/Y/fKUBUIwS21+6UAMiRwG/p?=
 =?us-ascii?Q?isVQPgqOE0/YkKSC8nyeiFPhQ6x0PbuNitjdWwS172bMO0YEw0Ldmdo7WY+a?=
 =?us-ascii?Q?A46HdMzfjAHBdZPMw/JrBbW2/gxAwaA5WwZsMNXoE1BS2zblvdfI5jVU350z?=
 =?us-ascii?Q?UHxVciWIFpogCqk0lpTDrBMDuJ/BAzm/Vux4F1r6yPyYQw8y8wGmvD0Q1Hg0?=
 =?us-ascii?Q?3wwnEd5R6sAyQU3tUgRDjU8bJGXXEqR7IvqNagPgFLYevUTbdbexwczeZPlA?=
 =?us-ascii?Q?DOVL8Y6IhqwjPqBqRBzwxf3mXj9W2+khYOafvPIMGxoMwYGMc3Undrd7n7zL?=
 =?us-ascii?Q?r3aRfAXcrB0Mmt4UlTHqDAeaSAjXLvA1/7q++A+hbxGkrGPv82TMzWd1pLuk?=
 =?us-ascii?Q?/Lbse/7tVvAw9R9iUahVxsCY9CzopEKA4TARSjSyLRI8FRm8XLisIrOOJYAw?=
 =?us-ascii?Q?OyI1XfPtDLzpp/CEO12/qZJRa8aYu8jJFZytU1UqVm+2w2P01dn7VLTHsUm5?=
 =?us-ascii?Q?cf2HWFBWE+Tk5XAy4b0ErxCa8Pt/otk7mOUQdIAmJryKZOmgEE7nYcXwOt6y?=
 =?us-ascii?Q?WPyI51fQNfpNEnVL4f13tBSjS0H/6F3TgLvzKbTA/p5HptZTqNU85/615U99?=
 =?us-ascii?Q?6KdXxSsl50gfb+oWczO6kCEubFIqvj5+Vri315X+et5yUa59LuHXnw9qkhNc?=
 =?us-ascii?Q?+Y5+d1ZQSLwS1ORmcp0Y62rcIbOx9qa4YphSVgOGhGzz9bYDkPG7CAj7nnco?=
 =?us-ascii?Q?npey+64gEeIDuecBSgF5EO53Vs8ez4muFQapuh68xjh/0zhJe1/xRdOuNXP4?=
 =?us-ascii?Q?C0ZkzoogQFukv5ZHz0cx2ESUKrJY92cMYr+NK0KjoHwKZymPXOfKzIEn3zw7?=
 =?us-ascii?Q?MyrhzfmMWGGnPTX26XNvJth6CaYHCtL63lTL6rO9QvFeMeayX4sTgn0WjvFK?=
 =?us-ascii?Q?SZTHntPiz8XG+2fEzgw8MYJdc3suCLLrq3HM78rnhAtEzfKhQrhYncxacRNz?=
 =?us-ascii?Q?+MuhKcq50se1smis5H+Uk2jtGKDjdEUGBsrAwmkPt8lZMu4wTeVeerUNlLPU?=
 =?us-ascii?Q?DA1D5h7sEVUY4p9Dqc9gUnTIajLdVRcJ0QdYn+0hTNe91d1L7w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 06:33:19.6358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0f4712-7fc1-486b-0448-08dcf32c95de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4184

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

