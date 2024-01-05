Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7623F1EA73
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gcEiP3/h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAdNykKVoS9m1pzdT298raGiiJ3AjkXDhKaRbrGJmjnqv7nrEtgi+n/4dRpZYNGh4wrlp4zSATc3RZiRvTF/yQYo5ASc+LDgqF0d1Z6cG9la8SZz6gVBKbZ7YqBSlPP54kNJpUsekx+/k8zhfs6cHckH/jUkAtpFXFriR7gSLxkkSdxLXEOZ3LoGQIS5/1jTfAsLzkCkW2mGn09fBlPaaNuWB/zQ4kV2NVU85sJRYVvDpgSfdYfhwQXuM6nS6TmwglVaIqxFCZbQJQ/O7xrNDBe4cq58wWlLTrQJ8wf6L+Y1SEmF1ItK+uXIhJXrPP7Hh4EJgoAgt0NgW3jMlGv6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fc5uDRmpslJpeMDGH05Lp9FW0cPRHdAGGwhqIF8/qF8=;
 b=coBD7lPiUexbveuj/GAqP8EqddtGnFmupvKD9c9XwFHrvvqMhkJ7bIBuzbvcmv0fvz319lpEHNnZYOXfL/ZIS5zJlPEpNZd750lTZI9AWMe+jS2BPqGtVSU5j+uLSBbY0xFhopKXdaqI+kDxT6SpVitT8OesmKgdBOUrHmfQwqSU1U7O5whKkcQo+cQwfC7rMVzn6Mwc1k/wvZKjmSr6HkTUDse/92GN+E2rg3qiZYosnhL8rlUpJEKq/E213DyNGJ7KzC2vYQKwkoobZmgzL7jYL7eVC0BQ0W3p/FheTgkwch6qs77OMOtdzIB1UaaUCXz+5pshanCsUvYya8TpjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc5uDRmpslJpeMDGH05Lp9FW0cPRHdAGGwhqIF8/qF8=;
 b=gcEiP3/hKm8wGRTnjpuUL/VfgPyQOIM7K5Ax4Ruu/n+/FJFeO6wi8LPliNKDIVvCcHUfViUmrQmTPISpoAMyY1A/IFo8KuMSCpyRh0TjPMRdeQvjWIdqwM2ExbYstaY5zqIKe8FGAg678N7qPfRDHGkXWdwJa40jsp765hqvFkY=
Received: from BL1P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::15)
 by BL1PR12MB5850.namprd12.prod.outlook.com (2603:10b6:208:395::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Fri, 5 Jan
 2024 07:47:00 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:2c4:cafe::ee) by BL1P223CA0010.outlook.office365.com
 (2603:10b6:208:2c4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14 via Frontend
 Transport; Fri, 5 Jan 2024 07:47:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:46:59 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:46:58 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v4 8/9] platform/x86/amd/hsmp: Check num_sockets against MAX_AMD_SOCKETS
Date: Fri, 5 Jan 2024 07:46:17 +0000
Message-ID: <20240105074618.1667898-9-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240105074618.1667898-1-suma.hegde@amd.com>
References: <20240105074618.1667898-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|BL1PR12MB5850:EE_
X-MS-Office365-Filtering-Correlation-Id: 4620538c-12ed-48b3-f462-08dc0dc27fde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oaYMM8ILfSk3b2BXknfWEe7YkJ6BQCMHg4oclDZK0T4r8IXqloTcaXohpnHQlfgUgIFRjWRA82aF8Ybwr1jc1EfG5omYGZcm+JlOEkSx6XME4rOOrOLyiLRpsvZngvsaeIMryTuh2AhckVb/7OT6ZAPmC4XOLV1WjBl2xzNz6l8xk5qZMQcoiu8kYUbBKOrAiMD6D2wJS8etRFVMBQhULf+ir2018Y6Bda6VE0mDIe0u1CT++jUG8e3DWiS03fSibTxuwZSEL2FrHi4+NoftmESYfJxYmsP/nVs2KYlhczmvlvN9R57KVF9Fw+nZh4vDevNYKDA7K+N9X8MuY6qrYyG5d4KSI7GJKZJthwLlmgjE45DMrlOSWjKLQoI6n9i0e8/5Xa2toWWn/CQk/CsbF4B/gNv/04DqrH+Ai6nA/iOzrAGd0RzXrzfop9qsOKgNn3xSNkO6g9N6/Ud3GyZ7nvFhgG1M2LF/Gs+3MW1ckiLULw6N8AHhxvVdB0GhndExIc2yz/SLJj5qcDtU5lRC1OsFN8Wxr1u74urftCIIDeLsVSzsjG8I5qG4TJVXJ0MAtG8+c5Nmye2r71p+Z5/v6lWl7o2ig+G3YAm4NqPRbZnsbedLday4PT2Dg2xa4selDAgcO2zrGERUaLmVyX5c+OVjRneOi2Px9Q6vQchN7EzRV/vQM79W9wLeV9TNSjTp4imteUlQ9u6+4hVm4ypCdk1sm5TT5TGkQy2CmFAmHlMkimpu7vMCaTbEKc9pZYc5kF+swg+hKaQRDHUq2F3DoQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(2906002)(5660300002)(8936002)(4326008)(8676002)(316002)(70206006)(70586007)(6916009)(54906003)(16526019)(426003)(44832011)(2616005)(336012)(36860700001)(1076003)(26005)(83380400001)(40480700001)(40460700003)(47076005)(41300700001)(82740400003)(66899024)(81166007)(356005)(86362001)(36756003)(7696005)(6666004)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:46:59.9433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4620538c-12ed-48b3-f462-08dc0dc27fde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5850

AMD supports connecting up to 8 AMD EPYCs in a system.
Hence, verify the num_sockets returned from amd_nb_num().
Also remove the WARN_ON() since the num_sockets is already verified.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v3:
New patch

 drivers/platform/x86/amd/hsmp.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 05255102e0a0..99bebb0ca5a9 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -62,6 +62,8 @@
 #define MSG_ARGOFF_STR		"MsgArgOffset"
 #define MSG_RESPOFF_STR		"MsgRspOffset"
 
+#define MAX_AMD_SOCKETS 8
+
 struct hsmp_mbaddr_info {
 	u32 base_addr;
 	u32 msg_id_off;
@@ -671,10 +673,6 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
 	struct attribute_group *attr_grp;
 	u16 i;
 
-	/* String formatting is currently limited to u8 sockets */
-	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
-		return -ERANGE;
-
 	hsmp_attr_grps = devm_kzalloc(dev, sizeof(struct attribute_group *) *
 				      (plat_dev.num_sockets + 1), GFP_KERNEL);
 	if (!hsmp_attr_grps)
@@ -925,7 +923,7 @@ static int __init hsmp_plt_init(void)
 	 * if we have N SMN/DF interfaces that ideally means N sockets
 	 */
 	plat_dev.num_sockets = amd_nb_num();
-	if (plat_dev.num_sockets == 0)
+	if (plat_dev.num_sockets == 0 || plat_dev.num_sockets > MAX_AMD_SOCKETS)
 		return ret;
 
 	ret = platform_driver_register(&amd_hsmp_driver);
-- 
2.25.1

