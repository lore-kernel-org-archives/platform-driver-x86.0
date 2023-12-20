Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3714653E
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 16:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fIzZt9Ls"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZ5spCRxyJqoalEa/A8SxfMk+cllwpvCL6iDjdCbeaen8faSpWnzDp5N3ZhYsglWCN3weSlrpUGKweg9EAy8hZ2FYoQewxnw32gadClR/q5L789Mq/hLC6vgKhnEYLvkFP5Ba+w43GvOz7lvKgGMBNmbMsLAu1jjrW4D3yC8zDVdCoi5H6F4NNCX+DyztBgQiXiXC1aklkrO+nyFoz7Y6CxQdvGKyD6wo8F3NxUGGqCJlOCGcPRnAwf3nOWSmYU6FNOan1zYNwkvokOQNxeCa5lIa/luxsV4A/76SvM/Gu5usMYDngRFERI2LNp1SYct4/pdK/CkBK5qORfKhIQgSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2P9E9v58S8vgx4ZD7xhAjhK4gS7oQ2UrXUsuMbfckg=;
 b=nf3VLL1YN+PaEIdtc87+NBFaHMNObkv1KFnXtJv/SHe4lV84ngSTITSyBu9wCw2hR2gLTQk+ujFMa/y6vz5QRIEyPAu/V0xdIkfmxuArleBM5qWQvf6/DxrrTmR8TBunhDwoVz4kGCxwl9KLUsNgbPGU/3BSPUY3itMgMbRV2Ubd1ZV6edwar5UXIN3w+s5k/sIhTRqhGuSEOHr/cyQek7l/YxuqVgBnTkjbAS2OcFSMlKg7jPud5CXpMXZHl6cboSnXoBKCtX7LtGagKwtx4MWbeLmmiSheQj48E4DOmFE+vxtqIVZmjJCDPNqOuU/OF9jYWqeBNBfVB1YLF8Vxmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2P9E9v58S8vgx4ZD7xhAjhK4gS7oQ2UrXUsuMbfckg=;
 b=fIzZt9Lsf2TX1ELj4jdjTtarfgv9owMHiTStmchMLMR/Z4V+mTcXMQvynRSOD6n5m4OH7r6dm5u4KWOzguWUVKlMvHe4sd2OuF8uB5hdpMrigHa801f0NYU5Z4as2CINrNCSSXWp++STLT7vhkOyH8nAfNeFflzA2m9fZaScdQ8=
Received: from BLAPR03CA0142.namprd03.prod.outlook.com (2603:10b6:208:32e::27)
 by MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 16:56:00 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::79) by BLAPR03CA0142.outlook.office365.com
 (2603:10b6:208:32e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Wed, 20 Dec 2023 16:56:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 16:56:00 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 10:55:58 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 7/7] platform/x86: Non-ACPI support for AMD F1A_M00~0Fh
Date: Wed, 20 Dec 2023 16:55:28 +0000
Message-ID: <20231220165528.1351200-8-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220165528.1351200-1-suma.hegde@amd.com>
References: <20231220165528.1351200-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|MN0PR12MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: 8704487f-3250-4896-b1a0-08dc017c8b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8Dsomg1f4RzVTbXGnmZdENZ3W5d390+u4r2rO67EWyR9Zw7lza1HGEAFhYxF2fNOQvgDmSREAByE2ProXfl54GZuiG0gVBbipughOmHwUWTPgCxx6qEg3BGkdsuZ4y9pdedLVv6VN7jgBeE5O9wO/6coYj/H/XeRATsunuqT39eJt3h99GoBvVItbZUJ71eEWIFL3lBd5g1YIVvSs28dd3cFu1qoJwvUYWU4Ke53IUyx5e7LITO5NzyvCyRADT2J8fx5zps6I+FRAe8g8aeTYbPuiXVkl7FhTv6Vp/qkqrNF+Ne21/qIQnqJmWtZXtEaT/9qYa/2dffJ1d6L3KPoIoM7I1KTlyaHMEE/ophIhnkRzb/BuQWfM4mse0B64HIofxEebJ6r7RaDAj9zOijf7TOA1ff8ouK7qnVOLhm72bBIh22qZsMxigbk7C8xxoPr+8GROvkx4bBvYEdQJSHLsjr5zcEwj3eisU5v2N9xkZ3ne5o5HNM1Im9ew+Gq/ZfAgtHtwvTCpd/foUJGBtgzbbLXMxt3+UZql/sUHiqtG42MD5cp+Dyk6KsLJPC266mZJGlhWmnmFTbMlFRegUy1nGl+LUr0VgGrCEDhyAUtqUi31vQo82AQ5WhMcIyOF4xrGFbGttlwLsMtvfcxJB3hsAHb1kdObiB/3IqWANZ8RnMiItDBt0wKrOw38W49SKpZzLhuJ/JDZoWnsCnZ5qxTkG0G2UrWlYjYXWY09qT3RpCxKNaAK3uiOOffYdM2TaE5wVpXjtjZwfsJqYr/W9nGSQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(36840700001)(46966006)(40470700004)(8676002)(8936002)(4326008)(47076005)(81166007)(36756003)(82740400003)(41300700001)(86362001)(356005)(2906002)(36860700001)(44832011)(5660300002)(26005)(16526019)(2616005)(1076003)(40480700001)(6666004)(7696005)(478600001)(54906003)(83380400001)(70206006)(70586007)(40460700003)(316002)(6916009)(426003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:56:00.2095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8704487f-3250-4896-b1a0-08dc017c8b30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5786

AMD EPYC family 0x1A and Model 0x0-0xF are having different
mailbox message ID offset compared to previous
platforms. In case of ACPI based BIOS, this information will be read
from ACPI table, for non ACPI BIOS, this needs to be #defined.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Changes since v1:
Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"

---
 drivers/platform/x86/amd/hsmp.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 726ba73e23dd..95afea56d333 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -44,6 +44,7 @@
  */
 #define SMN_HSMP_BASE		0x3B00000
 #define SMN_HSMP_MSG_ID		0x0010534
+#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
 #define SMN_HSMP_MSG_RESP	0x0010980
 #define SMN_HSMP_MSG_DATA	0x00109E0
 
@@ -712,6 +713,15 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
 	return ret;
 }
 
+static inline bool is_f1a_m0h(void)
+{
+	if (boot_cpu_data.x86 == 0x1A &&
+	    (boot_cpu_data.x86_model >= 0x00 && boot_cpu_data.x86_model <= 0x0F))
+		return true;
+
+	return false;
+}
+
 static int initialize_platdev(struct device *dev)
 {
 	int ret, i;
@@ -723,7 +733,16 @@ static int initialize_platdev(struct device *dev)
 		plat_dev.sock[i].sock_ind		= i;
 		plat_dev.sock[i].dev			= dev;
 		plat_dev.sock[i].mbinfo.base_addr	= SMN_HSMP_BASE;
-		plat_dev.sock[i].mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
+
+		/*
+		 * This is a tranisitional change from non ACPI to ACPI, only
+		 * family 0x1A, model 0x00 platform is supported for both ACPI and non ACPI.
+		 */
+		if (is_f1a_m0h())
+			plat_dev.sock[i].mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
+		else
+			plat_dev.sock[i].mbinfo.msg_id_off      = SMN_HSMP_MSG_ID;
+
 		plat_dev.sock[i].mbinfo.msg_resp_off    = SMN_HSMP_MSG_RESP;
 		plat_dev.sock[i].mbinfo.msg_arg_off     = SMN_HSMP_MSG_DATA;
 		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
-- 
2.25.1

