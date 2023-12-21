Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC9B59931
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Dec 2023 17:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4NC9YS0b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHGogPgp5Ik8IOuOASvsf04FXrB/wnPEBPaqvL8c6Z6UNlN5CuFsfAGs3/om/6ZXNsFl3Xedtvt7V7/V8Z+rYj1dXS5TJy8uaWJZehVzIddnBbcV1/A8InLfKgfaptfLjZOzBNUm6t9VuE+49VsoSJO6226B9E/1Hl4YwgqyZERUs5vilki0kNAjmeRCf7iLovKQTen/UZin8fsB07pjZFm//I5IxZH4ESAba5V67KuJMqqULOuXO1nick5PSm6Kpiy2Da7MjHak0oV7ecBRo9sXoVUyfG9ozVtXGlkCSe9u3686k9tg1RPAm5TH0oZi9ejy9X99sMBRJ+EEU3Bdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGTE+gw2OBOpYjvtyxD8us138OBMp8kg4k1K9t5eLdw=;
 b=CoK3tvDUcqxGQW0Nbz3VIKZR1k6RZ27DOXQ0xnMbg4w2WyexqGa4+ugla8/WXiklnqrgxUpl7OxJdGrdnwyA9J9Q9Y7WV/hJZ8vt9V1phGxK10bXwVF41O2TXdddhWQdvTmittTxhcJLyaZXb1I3XMdW1kw7IxTX8JjphM/F6cA8desH636V7u6Zk5adPCk17YJC4SE9e9Uz0Oib5Fm9QX9Yeo62lkv33d91DBhWlA3BB9uURA3CaxRE4y8Bf31llYyqRCBrgJ0ZU99PdxgjiIGuyTmXsBhpGWxxQLBQ3uXIgq8eISasl5s5IcwPYZrOATdcRmrsurh7CpBLtgneew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGTE+gw2OBOpYjvtyxD8us138OBMp8kg4k1K9t5eLdw=;
 b=4NC9YS0bkkLZSk2pQx1KItZKFmenq9S5M1WO7/khvYISLFh3muIPCwEcylNTICDZreUfNgDpgMhH6MbYyzrdR5fQxcspwnY+Gp2cZO8WZJFKOfcMfrJAoDMw4ez9AQf68kMS8Hn604Ss5b4DGG02T3m3N138aVaI3Ius4Nk5URo=
Received: from BL1PR13CA0362.namprd13.prod.outlook.com (2603:10b6:208:2c0::7)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Thu, 21 Dec
 2023 17:21:50 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:2c0:cafe::45) by BL1PR13CA0362.outlook.office365.com
 (2603:10b6:208:2c0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21 via Frontend
 Transport; Thu, 21 Dec 2023 17:21:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 17:21:49 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 11:21:47 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v3 7/7] platform/x86: Non-ACPI support for AMD F1A_M00~0Fh
Date: Thu, 21 Dec 2023 17:21:14 +0000
Message-ID: <20231221172114.1569559-7-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231221172114.1569559-1-suma.hegde@amd.com>
References: <20231221172114.1569559-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 63910fce-c48c-4ccc-73c9-08dc02495131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xrPBucBw3wT/FoTWQE50qlue58RZmh/pJCvuIuBuLbQuKG9pa3iG5VVbgNQcsCrQ/rqqJ3jqj2MU3p82QsiB1KAcub3qM/z7cRmvR9S1D7GW2UYurKWT9XmtnfVCs8TSsySi/boE7maUrpwEz/hjo2wOHIzr6xoVt+VMSRr2JdORt0kgHxWDiWaXSJNgf9VFXarPQ7D1yTQ0mOAN40/BUeqTIsrc1d7Z6jCr1c+AcroDOEfn0S9CwK035LZXEWZJlRCzR3tMmV7mpAjwgmdMijYC3h4zgnhK7TEy6omZvmCGuLidn1dIFuLFVnMgs4xG1sbZ4vG/OAnFYOjjReiinS/EPfp6sKwhY+pzJv3+gcbenCiWzvvRNPNEKVf/pntTC6n+9Hz90HVjSDWm9GcU+lvtcbG7zgzxYJcd5v0Bibd0GtWdV/Lhs0xIU5DpJe+YLJuG0IQWebtlP1mIvdOxKONfRj7NpRlP5HFxgIFhSHYSdC7tBnH4plpBSFCrm3UF6XG59yZgFHzxYpshoTumahGceHoyNidaAnM0i7YFbd0SzDqKkMsL3EDdzptjQKtA6w0yt4FXIvXNXaR4YquMT6QorDJqw2OnZCef4f0Kr0eeUWELGgZm/LwHsIFnOGms60N6DVcohjdnrHzkWfg4PZqapVyrmdE+cRi4ccgR41+KasIjFtOQBi5SxaCij1q5RR2MSCIRi7UnJHkmy2K7j8DDHWUOLYshA3FQPzT146DZ2HG3GhhIZnGRIeZv16c2QMVj95wlLFEMUIF+pnVXgQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(186009)(1800799012)(82310400011)(451199024)(64100799003)(36840700001)(40470700004)(46966006)(70586007)(70206006)(6916009)(26005)(1076003)(54906003)(40480700001)(2616005)(36860700001)(40460700003)(478600001)(83380400001)(8676002)(4326008)(8936002)(316002)(6666004)(66574015)(16526019)(426003)(336012)(7696005)(36756003)(44832011)(47076005)(5660300002)(2906002)(41300700001)(356005)(82740400003)(81166007)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 17:21:49.7362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63910fce-c48c-4ccc-73c9-08dc02495131
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

AMD EPYC family 0x1A and Model 0x0-0xF are having different
mailbox message ID offset compared to previous
platforms. In case of ACPI based BIOS, this information will be read
from ACPI table, for non-ACPI BIOS, this needs to be #defined.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

---
Changes since v1:
Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"
Changes since v2:
1. Change "non ACPI" to "non-ACPI"
2. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"

 drivers/platform/x86/amd/hsmp.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 46924c572055..cc5e5e8124c9 100644
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
 static int init_socket_objects(struct device *dev)
 {
 	struct hsmp_socket *sock;
@@ -725,10 +735,19 @@ static int init_socket_objects(struct device *dev)
 		sock->sock_ind			= i;
 		sock->dev			= dev;
 		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
-		sock->mbinfo.msg_id_off		= SMN_HSMP_MSG_ID;
+		sema_init(&sock->hsmp_sem, 1);
+
+		/*
+		 * This is a tranisitional change from non-ACPI to ACPI, only
+		 * family 0x1A, model 0x00 platform is supported for both ACPI and non-ACPI.
+		 */
+		if (is_f1a_m0h())
+			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
+		else
+			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
+
 		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
 		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
-		sema_init(&sock->hsmp_sem, 1);
 
 		/* Test the hsmp interface on each socket */
 		ret = hsmp_test(i, 0xDEADBEEF);
-- 
2.25.1

