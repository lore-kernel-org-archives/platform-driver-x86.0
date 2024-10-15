Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AC0146D6B
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2024 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988258; cv=fail; b=CQtP8BZrEn2uGDVXVUxyrWMZq4xAn8L0cCTfG9aX5Xd4J4lKh3A3WqMNXS8ll6RlKWASXVKxF+FA0JubPbprEKrgdw4YcRwtE+18r81Qb8515NUkclUqwY6UcFpXOi8Bl/+P8yzxx5FpgY5haNGuDQuNgfxbPvV6wRQiFDgoJFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988258; c=relaxed/simple;
	bh=FNErLgjRpZhdBNSB1a2jntVthk+vfoGnr0dE/DPtHb8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oyJCicTp5CnbShn4SC5o4cOo5khp3pnQnMsSPJ++b0mUmoZqE/6gbjMDFTBAJ7b1Vagat25MKqDKY6IqOiuHTUclvimcIJNFXzb/KLBUNpWWCUK18IJ6SxRpqCtV2MMUIPN21KBHhOB2cb8mvCqOEGvh79+skFKTrqzjHCaubkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q3tyl5kP; arc=fail smtp.client-ip=40.107.236.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q3tyl5kP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pG9p2N/4yOrtrecxdfLxXCKDLaEXAmjYSQ7HQMBeRIS7io/J4zPuzzvuWTr2Ar1JTlJJ5xtMHuGPL34fauQvI5ah/o3//mS0vOfqHAgSIIJKvS7uPtdGPR5YWS7J36AK6oW4QYB7+rVjxzYh/Sg5dow+Bmr8bgYqD+fhSoy+zQnU9oTFpy5MUxx5IQ3T7zrtOa/OUdHxTobW7SJGdumqqypU9p6ITT6z9dxJoF/VU+UlY87/f+vZM+4+mBHE5THKDBP2g5+XwqY91wY8HQjuNxis7lUTQWXkn3uLW/gtBHu2FaJArluwT8VQxcS+0yIiIQBHxogNBjRp6nAmL0NHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KUWPU14Qf8c7Ktk7MKkMsuz3OR4Va4ocWiSm3ukszM=;
 b=QupwYws95J4CvlctEA6JPE5996m9avla1bCna6hFJXnArCeKqLoleKP+281PV968YdB4LUrCldkK5DevNdbmFF3CCMPFO5DZaiMTvtpwnZtcmJMjZiq+tWG6bhxkBa6vk8sMFVIuYilb6PCqbePKiY77rER0PxrJaV46AQ4od06nrmFPB/U6Ni1lG5pA7PCA2fXWlcAkQk5hggywWOQMijB9gUHxsqgtPiQmjXZAMbQHIlGVVXyAxsY5GBcjo/qjs/C66edsRDOVwFqkgm2V9QkXTozeqxwxwE8ExGCrFW7ZFYo4cgeeX3n7zrHkKczgd+i/U/8jAaM8tZ8wI+gVuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KUWPU14Qf8c7Ktk7MKkMsuz3OR4Va4ocWiSm3ukszM=;
 b=q3tyl5kPXWKq6xkdbb/bo9t40OakTlVMpjfkFLDboLERkKU30pL/PF6kfGn2iwxUnUi/m7gMyqzp7G+IffFRM0KUINkAoGSPWe+3LT5tQP+Mb7uSPdo0cTBMlNlSaItlUvyL/5+N527xCCggi0x9GrVYIIJOKGJDbiZTHybHKdA=
Received: from SA1P222CA0134.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::7)
 by SN7PR12MB7321.namprd12.prod.outlook.com (2603:10b6:806:298::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Tue, 15 Oct
 2024 10:30:53 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:3c2:cafe::f4) by SA1P222CA0134.outlook.office365.com
 (2603:10b6:806:3c2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17 via Frontend
 Transport; Tue, 15 Oct 2024 10:30:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Tue, 15 Oct 2024 10:30:52 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Oct
 2024 05:30:50 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/5] platform/x86/amd/pmf: Add SMU metrics table support for 1Ah family 60h model
Date: Tue, 15 Oct 2024 16:00:17 +0530
Message-ID: <20241015103021.1843019-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|SN7PR12MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 0588cd30-bb4e-4d40-4582-08dced0471ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IU6jr58l2iILp4MjmlAwVZ270sPrBory1BAWNs7by20LzJEud9wuMfUF+PLS?=
 =?us-ascii?Q?IvI0bEoAHCgJWjSxr7Auv/AbwLPWlTkzvGnNK2SnJCDR1bhtIGalb5NAK6ML?=
 =?us-ascii?Q?XA/yse9aBZ71EAnmY48iAmUBD+KufTCpZaTLWfgY/Aeh88vCyKwRYZpmUACD?=
 =?us-ascii?Q?rB1sPKrQUexyOoUM2WR720dFg0RAvAe41NRjcD10jZv+qsePi3dg3zD5jfC4?=
 =?us-ascii?Q?z4fpqalPqGDcIcUHDRQg08HNFPQYD/gRKFDp6fXNZ4O3lHIIB1lVgFzlqrC1?=
 =?us-ascii?Q?sWqLngOYyg7pRAvQhxqrEi96PFC+15FXp8b/nZ94VMTfquyXwIn+8ah/736W?=
 =?us-ascii?Q?RnLTNFZ0kBxS9tLHO8drIEhHg1gmlWLEGyarYw9fsayb8uIRsjYs3/nGdBsk?=
 =?us-ascii?Q?EQ4S2+oM2qAs45XvIkGYHc0MYoHtZ90CmcyHhoP43j1ilP+hkCdYDW9jSzoH?=
 =?us-ascii?Q?5h7Nv/eYaxP9BAWehvmrC1mw3vd2DQTS03IwjzyTtOMLzZTu/JDbfKUbD392?=
 =?us-ascii?Q?1v9NI4jqYqIb9+VnAyJSlrFtd/z3rj3Qsx8zQZjPKGfTXFHLp+wWlD6puskn?=
 =?us-ascii?Q?Fmb8T5Ydq5ASuU2wwQxhl8dZuGqDcPEYOk8e/z8wADyUpMd2ol63RFgXzg7e?=
 =?us-ascii?Q?2auSlq42xeZgFp9F/SbRWZkZ/fGeBkPJ6Lqs7kHzYOgW6MwjAHU0gYTnEN5W?=
 =?us-ascii?Q?Kkas9HCbIv7V7UGBGXx2g13A2Ss7uxaMOW8EJXPae88vNacHh1yj0HtRlU/6?=
 =?us-ascii?Q?hcNpIhyzdDFg+Hhfx4FWtlDmdr+U2+NHAKBLRMO/mR6H7IBokSa9mzafn6kD?=
 =?us-ascii?Q?VKOScvB9yHcGmsPvaDycPYYNmN/tKFhTzKpti17vUiWvtZH1fAIK7qjdUxt2?=
 =?us-ascii?Q?8nCiXHFZ0WQizhhE2z/L0oFD/ENFgOAh2VUL7k2SunTKhvGxJdpAVBAWDrGY?=
 =?us-ascii?Q?mAu5/bF+fvMsPLNDcuAy9wKaSbT3Qcl1++5l8ANfkGWgZtL0JPsFORcZGGY2?=
 =?us-ascii?Q?YRqFbVPv835tfQpDeC1g4E9TPNNLdbipjf/6qYdZ0bngoEaOY2/+t4U+U4Qs?=
 =?us-ascii?Q?szIU489XnfFV97mZ2P6oNSatyb81aJcaRA3IAP+DmfRkZ0nM8S1LWbX/IDhe?=
 =?us-ascii?Q?ghlk0a8R4bBD7J8dZWEq7QVNX3LYsgOlr6bCYH9rfZGsqBdKSw1x6oVizNCt?=
 =?us-ascii?Q?yB8nQlw6d3gWYyAR6BektvqD58jAas2/N30PgqIeBQMU64AxoRfFb7lpPiCK?=
 =?us-ascii?Q?uCYHNnFu+VhuqP46wAxVSQmMAm0seBetqN4aE3bVoTIWhCafCgQadj5tx+53?=
 =?us-ascii?Q?f+Rj18+FiGgejTeWVHgsCMjPbOIO4H/xV2JOSFh3emVwIr4GQ+1AaKRPg0p6?=
 =?us-ascii?Q?UtMh7wEomHjVVqV6wJ9ksx70G6eX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 10:30:52.6013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0588cd30-bb4e-4d40-4582-08dced0471ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7321

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

