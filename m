Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HBtYgebz"
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2179F
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2023 02:39:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LB89/iINtRCRzdJISsGIDBj0GtfdM1OQiD5ds0qqxEsD+N9jLDzd8Oul+SVmUmQgEMcPg9Q8Gu1ePbk05ECuA584hYEfAdaJiPFrbkXKBBD92skycgl0LYHwW74wqRjwo3WjcNJ5UNWhbwDvDU5z6jvw5Vcpf77kLHHvbhEyBhKOY2VFE+o8yJvuJi6hquLIbdyqSqRJ/quuIkqYD9DmjQ1y2pfE7hhYywrRNeYNL/m6T6foENBKgTTVDjwYq8hPeT6HR7YnGr+U6M03JNkSpSE6pS9Fkdhjf7iwQ20G2E3MzjezYj4Hi0yqyn/7+O0WDMHY8pnnhYGqLSIFw8jeRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t36k3Xo/N+CWwHYwEqb9MLRiQrny7NLEZHqzI6WZIfc=;
 b=GSX57Ggs/0f1vmMaS2QnA01f7yC36M6qRvxXtP5Q2HdXQylWYLNPzU/PV5WOI8aDUmINu4Tc7QFRu4pZqUNpZUNOhk+jnbYLiR5H193hL/kLQWUU6h53NH9Nxi4C0+NEwqWZWpBWCcnGuo0MpyyLEuS2dyQ0HLedIRM8TPFC5H/mDwo1ra6ssu7XhJUrRaJzRMZhwj4Fd1nIyzzkrl0mdT/QyjiMW/DamFFDgcmuL9Yv/MxrdO9/bs4cP9o4vuC1YOO92cUo4HB2MRGGI1vXoFRyp3H6aLcatraZbXjgWr4SXfP7e5GFc3zaa2/2F3rAlKNSUij2AFKAvhsluzOlCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t36k3Xo/N+CWwHYwEqb9MLRiQrny7NLEZHqzI6WZIfc=;
 b=HBtYgebzKuzHiK89UY8arYp2AnktKalvWIR2h53bbG8EAc4g/oViF8vsat+d0rqUwKwtdClX6Tn4QWOXB+X4EdgzUcyUXaDIrfB2xhGMG9FXga9D5mvIKgMAnbigJ2heVaRAGFw1LLYaMtMmlwK3iSyg84QV8DuCFWRsjYxMyPk=
Received: from CYZPR11CA0017.namprd11.prod.outlook.com (2603:10b6:930:8d::11)
 by SA3PR12MB8764.namprd12.prod.outlook.com (2603:10b6:806:31f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Tue, 12 Dec
 2023 10:38:59 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:8d:cafe::70) by CYZPR11CA0017.outlook.office365.com
 (2603:10b6:930:8d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Tue, 12 Dec 2023 10:38:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 10:38:58 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 04:38:56 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH] platform/x86: Non-ACPI support for AMD F1A~M0Fh
Date: Tue, 12 Dec 2023 10:36:44 +0000
Message-ID: <20231212103644.768460-8-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212103644.768460-1-suma.hegde@amd.com>
References: <20231212103644.768460-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|SA3PR12MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 100cde58-a0ca-4900-2761-08dbfafe8c94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nz77DTqqFiBq9fXChBTXmvwaSr9dcSNCSIQwdw01hh4uvXbmF+Q9L18FOfWt9nTyw4ENKdeVGvvLTL75VZoISU5x7M2AuBCkkTDU+14hhpkxqbLKMl0JH1qgpYzfZOdCAhV0030+rRpB/HMOa3U5b8OW3DdnRncfJzNI2tswDudqcpXpApFGATC7wNbjEY/hp8BIMY38UtUnWOIZYjwhwFRMJ4KQ6Q1zlnBLZbBREYKRwM3D3Md0QlmksU9se9yENO+gAxfMGSR77jH54mSyD2j0QLddOw0zKI6iyrLyaNT7S7LupjHwH7JPSYQh893FgYIC2Jt086Y85KQTBJFZ3FjYjMQz7ZWmAK3iDWGuGfSmlUaYtu4lNcdqo2e97io0k0qEu8iMMgP4UmZvbayWliOUGah0LpiNFOCMhxnxq1qBMGAgyvYGCTOnks5eh+N6MMTT+j111oIyE1joapN0YhYIRJKyZukk55d7ptk/jEV0JyqDhHw5cKBHkOIV2rLEmKdFBgL1Mjv4BS4XiPlcxs4mGGiGAquBXb1sQ/djp+zie7kYks3DJlpJWoJKVUdAzMGnb3NR7UcJGp32BgmIw3RhRQCoHjYg4reat9zH7gsewBs2jWGcgdVY6B+TXckCDNGtbkYVAggDXp906qu2LxWVF8Fsa1RA/fTmWczvwXI4iCWFjBq+8he69bd1Ufn2f3+O9XMG1L2eY+xZuPQcyngTwpZiOCoUOmBAZQxfsg/z8mT/mP+rAYCDtQqtQntODxLRlMwOAdJ2erBRnM42CvB+OHQgWsJFE70dvSvadhs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(46966006)(36840700001)(40470700004)(40460700003)(426003)(26005)(336012)(16526019)(83380400001)(7696005)(2616005)(1076003)(47076005)(36860700001)(44832011)(5660300002)(4326008)(8936002)(8676002)(41300700001)(478600001)(2906002)(6666004)(316002)(6916009)(54906003)(70206006)(70586007)(86362001)(36756003)(356005)(81166007)(82740400003)(40480700001)(81973001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 10:38:58.9120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 100cde58-a0ca-4900-2761-08dbfafe8c94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8764

AMD EPYC family 0x1A and Model 0x0-0xF are having different
mailbox message ID offset compared to previous
platforms. In case of ACPI based BIOS, this information will be read
from ACPI table, for non ACPI BIOS, this needs to be #defined.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Co-developed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 82bd4189cbd3..2c256a7f50b3 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -44,6 +44,7 @@
  */
 #define SMN_HSMP_BASE		0x3B00000
 #define SMN_HSMP_MSG_ID		0x0010534
+#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
 #define SMN_HSMP_MSG_RESP	0x0010980
 #define SMN_HSMP_MSG_DATA	0x00109E0
 
@@ -700,6 +701,15 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
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
 	int i;
@@ -711,7 +721,16 @@ static int initialize_platdev(struct device *dev)
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

