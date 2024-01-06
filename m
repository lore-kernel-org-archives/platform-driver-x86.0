Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55B2139C
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jan 2024 02:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ejBORXMh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbQcovCp8bZqc9wo+cGS/rb4Ij9/9Tb8w+UrSVSt9t3NrYnBP5TkWEeI/cE7fmVLVrlpEm+gc+iaE5GK8DLZMQGazGKdF0C5Cx6xOhX1MT7igmIf5XySf+0Hv3ijiR2QL2Hvk5cienR5fpwyyBWRMjRJksI/g1Xq0Xk2e4wceFXY5p3/8LoFNi7BJHpnsr3Nx0Ccrf36eI5U3I5B+/oC6ApKZV6rWBHukg18lP7X2NrUn8ISiZRg7RuCbo735D2JoJOUleiE/w8Y/8P8zjr+RV1qmzzdiBOJfNXQ4tsoQhQ1m1jRI1ODzuZDvqjHTT1P6gm0Mn6i7ExaRGskfbjPlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lHpL47zzSexOlDEtXEHCpJQiKMGVGuS4T3Q3gEAj4Q=;
 b=YKxUHumlLGuj9EU3o0iRZxK/VDS4DbCWE9fcZhsoXcyGYmU6i2OxhdJkcSUXRT2YlSpCiv99DhPiqIS36NEm32EwVP6qn3I4J/Y57bbYvvMiichPJkxmX4HVC04+9OASIIjAENUaBLaFr8g61bnMhQNM7qulscc2+dKuZyMzfVFReK3eNb1y2kl9yAhlKHDI8PH4xQsm8Ql1isorwF31kAFwIBqB/v2O9ZeAVqnStmulfMrpgE9r3bPusuSeaQX+cPFTkQU7LWlM33D6QdxfQhk4QeudgB9nCdM6AyM4oY9G7mF90wmLMFFUdAZYvEvbTWs1ahDZT/RYIDgox8Hwpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lHpL47zzSexOlDEtXEHCpJQiKMGVGuS4T3Q3gEAj4Q=;
 b=ejBORXMhhwP7eooWJuH/lVkuwUbhMBPE4xbTvK5jUi60kLAb5Y8zg3MCo+nXZqd9a7FTY3stZGtxz2As7+rH6oOsCisJZ6o/HNU1Fx0ul8j4CY346BJXffHA1G2QsnDgkF4rd7jHqoV4F33cJXnyP2e2XwO9bQouFFWrRc92HfA=
Received: from SN6PR08CA0003.namprd08.prod.outlook.com (2603:10b6:805:66::16)
 by PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Sat, 6 Jan
 2024 02:26:24 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:805:66:cafe::10) by SN6PR08CA0003.outlook.office365.com
 (2603:10b6:805:66::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15 via Frontend
 Transport; Sat, 6 Jan 2024 02:26:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Sat, 6 Jan 2024 02:26:24 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 20:26:22 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v5 09/11] platform/x86/amd/hsmp: Check num_sockets against MAX_AMD_SOCKETS
Date: Sat, 6 Jan 2024 02:25:30 +0000
Message-ID: <20240106022532.1746932-9-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240106022532.1746932-1-suma.hegde@amd.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|PH8PR12MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d57dee-19b5-43dc-c091-08dc0e5ee0d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZfwLE6/5R+lxGPOlqKkCvpjr78onYxnRZZ0ge8y6O2Rk9K5EJRYp8WjXiGG2OGYHNiZQwCN7nQE/xCqWDs7UIRPpmYiikj7Ait7ZYIMY5LxjvecCKSX45Q3l1xhbrqq3YvHQ2TprnKbhhl5QMzC9cASqUSaWDCFdQbdQ9C9P5it8losnh8BwmNPxeVjuGqiPfoj8Vo6DAYVbQwoiR30ejF4v+Htl5LBpc4eBb/x5FWCw43W3lzRqPo8OaV3T9qf6PyN6BE2MxB8rs3LXLV1D8T5qHzl1/dJ6rc5L6i+m3ufEq3EtDxPyWBZYPlU2rpXb1arG6okD23vvC/3lhWOYGOq2TGyhnTaDhXONkIasOWuybX0gTMiDA/Q5Kp8SVRje2eXmIRWdJ6ox7qLVrCcSkl+v53taZuO7CrxcIUpTsayCiQblm+RnKxLaSfb9kmvhh4bf2LeHym1OvZotNO0l/5wbaO1A7TIkLBeDdePvUdNqWA/ar7Iafwf2421cSSdxXRzQgveKh/I+Ha/0qbawaNjHiWheljiJysurYcHHbAgYkQ4G1+kTOI698hK+PzewJjjd07zeTToUM9nPBHXIba/WMuRWm6dDMFqRBXRlMbTGah2wiNUulVud9IceJNxzaqu0GzQMogwdhzEWikWhH37YcD42MS/8JQ/rKzguH3FRRaJIejKhwfUV1GejlmHl/9o+dMGrojFAgzcQ68bpiAP4+x142xpXlFKHNjmEYIQbYPxxoQSC1rsdGhEAL28urLrTXrYURndgD+gIFvJ8CA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799012)(46966006)(40470700004)(36840700001)(36756003)(40460700003)(86362001)(40480700001)(356005)(66899024)(81166007)(83380400001)(47076005)(2616005)(66574015)(26005)(1076003)(16526019)(426003)(336012)(82740400003)(70206006)(36860700001)(7696005)(6666004)(478600001)(70586007)(54906003)(6916009)(4326008)(44832011)(2906002)(5660300002)(41300700001)(316002)(8936002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2024 02:26:24.1249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d57dee-19b5-43dc-c091-08dc0e5ee0d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7277

AMD supports connecting up to 8 AMD EPYCs in a system.
Hence, verify the num_sockets returned from amd_nb_num().
Also remove the WARN_ON() since the num_sockets is already verified.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v4:
Add Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

