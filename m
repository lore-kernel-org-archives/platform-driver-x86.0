Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947105FB8D
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Oct 2024 04:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728881916; cv=fail; b=USeGDUfLh2InElFCbADDKaqjcEKPgzq15oMLVGafywFzCIfr/h5GGtSz31MZfzBLg6dlNgrlFvlIx56SbjrW4OIYZhtHlG5fTCrLUe7EWvWr5F7/AYZn8N27yjrDFm7YmtGtlaJZHqF9DMvAsCQ7qCNsMNoTwZBnv5ZBK5t4n8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728881916; c=relaxed/simple;
	bh=FNErLgjRpZhdBNSB1a2jntVthk+vfoGnr0dE/DPtHb8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kcoo2lDSo3ndNs+v/g0A7igjjIHo3IDSlkkzAInyBAHZwGXL51NwQWZlAHmTp6GI7eCxcS64PAp+CCnkr6Qz6G/dtwZ0z/uwmDLZHSCUr7cUM4hf6KaYi8l0woCOLzLWDK2QEBn3TwhE3pMSgI38qy7Rrez0ymleAYDtWqu7aLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Yy+oURaO; arc=fail smtp.client-ip=40.107.244.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Yy+oURaO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8tg9l4ly7CBCHvPRPKbw4erh+iM2PI5h2/HYdSLtfPj8HBNiHpDS7ZGLHl8HYvIjr97jo+Ebw+zkvuEn6ELiby2jObm1fq57MNw/ck9x4kpS3LCBOp31YVWN6ebIdVPlTKcOb+PysXVU5xnHvKHJrR2YmiSC7sHcjfoYaPTt/v62FKabAeEUli7ZAbdUyiBm/rxEGZRnuFl07Lnw1DDqlmRg/ccsuhXq3JFw/kyGkZwNA38Bf6uUO9lDIQGXNZPZXtq8dXOwKUSKK3tqKXChtkRNcT58hzFG9c5NQ6r+RoGWUUpTg3fi5Dbxoft8FqLBkGpsztJzhZ+8EKmiTf+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KUWPU14Qf8c7Ktk7MKkMsuz3OR4Va4ocWiSm3ukszM=;
 b=udp2Oz9FgLRq6pBWzxU1SZnoGHLBgg250JYAFRKuMXV2Up524KsSsHFCFEg1zVu8ne/DAyzlSY0zHKcgyxjEMcVm0XEOV+vTm7hIqFWgeSVNid7Hb4quY5PbkheT6B/U823fnZrTx/D/tmqqt2TwbdhP7kH5pzesecMfvWGw43AxEm54FVb1W0PNuIuEK50HQIcrDgkjl46XaJ2EA77UblrqAFhsxQqE8Etgdxk37Iecij4r1ks0L4B4zYbaCauXuj40/EUHBlv7cUdMQCHTWX2YrkEHQMz4LQGLNlCNCzafqtGIcJUDnryQAPN2J4YLzmfMifSdGT7GoiEAIJbqBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KUWPU14Qf8c7Ktk7MKkMsuz3OR4Va4ocWiSm3ukszM=;
 b=Yy+oURaOtrn/Q5VYg+mB3HJNlMalXLNIbpcFxt9B2ACf7JEBbl6KAic2tIuhP5TQ15C6GlQA8PFeu5UtO0sX/oxJYMZUVqRIecmVMv7pxfsppoyfiP5Hu4LimkcOwwcQWmbSfmNbmSVBVIgDyqkAT7OnWSBbCZNO1RTDM4mdBGo=
Received: from CH5PR05CA0018.namprd05.prod.outlook.com (2603:10b6:610:1f0::28)
 by SJ2PR12MB8953.namprd12.prod.outlook.com (2603:10b6:a03:544::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 04:58:31 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::28) by CH5PR05CA0018.outlook.office365.com
 (2603:10b6:610:1f0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17 via Frontend
 Transport; Mon, 14 Oct 2024 04:58:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 14 Oct 2024 04:58:31 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 13 Oct
 2024 23:58:28 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/5] platform/x86/amd/pmf: Add SMU metrics table support for 1Ah family 60h model
Date: Mon, 14 Oct 2024 10:27:55 +0530
Message-ID: <20241014045759.1517226-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com>
References: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|SJ2PR12MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: f986101c-1e0f-4445-aed6-08dcec0cd96d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4IV9ak1/jfaBezDQrcnKwPZMPMnIOhbaL5sZnte3kHq8HkL9fBTEnd56ckpc?=
 =?us-ascii?Q?wFJjJv0v1KI6L+0oDv8qcJ77WR9rGFrLlxa7KCMsC9SqA/cuac0Q3F1VrxXi?=
 =?us-ascii?Q?HWXnXvLC/N5sLLb69Z3inVnVUapiQUC3Feu9bynjyvtPdwYl7rUpTmOy6atX?=
 =?us-ascii?Q?8cTAophIbydNPUZHz8+Dp04eBs5+6YXjW3Qe+hQo5rV4LCt9Fn6AcmgTOymG?=
 =?us-ascii?Q?u/BXcSuJ+68g5OOZ1bz6Xs831YQwtU/Kh901f2eHhKQusP7XqpMpJLxblKIt?=
 =?us-ascii?Q?XMsFb0BjmSsrxbDV9wp1jua06xhPY5bpU/DI74pVsQZdyDg0PG/f12G/QiuI?=
 =?us-ascii?Q?MGyPZe73ciNIm/4WsNJGyPkIslv97VR/ApZ3LvHfj++bq4bs7oKCrvDxKHFV?=
 =?us-ascii?Q?CxIP4snxKp+CfjXally4fIK96DZIBKie7e1SFFhYRKYirzPD1TXueyrPFa2s?=
 =?us-ascii?Q?Wyo55f+Z/2i7rcpBNe2LLYGrWKnDYSEEgdkgpTGM7XvAo5V5tVEjPcvG+0cw?=
 =?us-ascii?Q?0EwwrepZRVMgQdti1A5oThspE3rqSlIwoE/PJ9b1x/rWZh7nENfvb7wyrlRs?=
 =?us-ascii?Q?dNkjhEyM7pHIzPi/AOUh5p4V1943bZhyKEYvemkQjBK2aTzmZahRrCPQMfXf?=
 =?us-ascii?Q?/8cWV+r1oNSs6UfZeEQbUQRf0NZPZtHPE0fMLCE5ZsD/OBq0SJEyTXz476Qz?=
 =?us-ascii?Q?UmpZosrk1PuKsQhv6dB1ZIWHnMo78lpW0z06cnNc+ON0XQ51hkCczv4tvHog?=
 =?us-ascii?Q?MuObGUXOrS/hR4syWQTB30DVbjiMkrM4apYzfrSkkODbjw5gQ8DqMPT325SA?=
 =?us-ascii?Q?9m9PDXekdZcHqig6PeNaw7vxfjq0Z++CIMQZzRMzyiDQVM0Gju+477u0i1WV?=
 =?us-ascii?Q?LCFBCny78rKfF7eE2H8sQkrjvBADIrvJIPNKEgIN7N9buIVG6xzATfIjs3r7?=
 =?us-ascii?Q?vEpEfFAjXRc8wwG0YFDp3D8MH2RqCiUwZ7VDf5xhBlhkUTgvTtm0KPYyYZT9?=
 =?us-ascii?Q?SO9Uhd89M3ErQHVSehx2GZg3e47RlUOkbAcD9FUXu76pYJKSbBpbRAMa6YoZ?=
 =?us-ascii?Q?eMqgaXLEnokdP6upvRvlHsg4zdhzzmiSRj/E0Lqtg0wmqf21jAVTdYVdZD6X?=
 =?us-ascii?Q?WyWzW0gLPj8REonJmZLaJ7U5Cwx6A1DtRDmcMgOmWJ4DGH7XFgw47MW75xXe?=
 =?us-ascii?Q?KwN6Faoua5N7Wo6olkhq/k3cQhMIaKXD0cNw7u/Lc/0HJY3SEliV4FS12Vq3?=
 =?us-ascii?Q?Ls6JYKgyZKmvvusFTdu6FW7cI2UdsNmSTrnB0WGaFGc4P2CnfKdaJ7IBlu4U?=
 =?us-ascii?Q?yQ/veMJRWL8FeEQHaRA6MmAZwLYu9o753YcUoIEENgMfP0fFBfBr7aaaxvn3?=
 =?us-ascii?Q?ftbDKJCc4DX/CQp/baoE3KFiuiVQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 04:58:31.0593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f986101c-1e0f-4445-aed6-08dcec0cd96d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8953

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

