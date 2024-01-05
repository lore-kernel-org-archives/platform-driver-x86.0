Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2073.outbound.protection.outlook.com [40.107.212.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498DF1EA73
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uKOACcYI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9k591zg0zXzIt9OQJjHo1V2bNa5Dh5au3LbZcUXXedhdq8eub28JtuWDAlOly7S6QbMbWze1519NjcSnZujDhSOwqHXU3fdURSbGXv0gwLde1HL5lHHyEVNnRakVtu6uYvFtEDCDwolpL8AwqOtFO2B2de/kupxG8TtLsWW6Mi4nxSDzHTJWyHyoFsBdR8PZU001pOHd/TMq02VXlg2675Vq7EALey6QKiupNSKfNbgsTMcC2ktrkBb8IqIIRexnpy/H0cyXmy2VzHMsImYEPctgW6LDmdaeQoqcf1JKtUV3pOjkLU65K3Qh79ywPPeKXKTsL2y399uBPBV3pRRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfiuHXDF6nELY5npkzCO9dHxvXIHM+rfskROKhOqwpc=;
 b=le+f59aBAZcwbqMJp8X778T+RmHuO4gaBpV+liByfilNVv/A3o61Ovk9ZgvmxFWKT5A+9GbWzxvcGDoHq9+n23I+oLoGZ96/PlueEupsTDMmIy0rge+vYgbiW+D3hGOYDebEmnxHJlZCbAG1G2s8t00A2/0x6OH1clTw81CLaiUKHVa9uEhdLKeN9E04vQtaNAt8H4DCHcKmfQjQxdlHmiT7dz6EeSkzJKQCqroB7t0hx50uz4hptLLG7GLa63kPyfIMbbRxMuKvg5ghiJgcN8tasvF+Cv5FXgcN4k0kTFSwT7jFegTu9ulpBLXo6WpVFGkCvkuV1H8KL97nIjcIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfiuHXDF6nELY5npkzCO9dHxvXIHM+rfskROKhOqwpc=;
 b=uKOACcYILboB5vnoPHeJkAY3cuivBhy6vY78IM8IwRVom9QHOR0mwKXNyEKhIvYEtRFP/ng4cxuwnK92cZ77Uhb29Fs62A2vsTqrhGvNjGd1lLufhHf1+5+fHVyxuJIoaAS0RDhvVoenyLKhwp/7cDzJKEvXOb/21u1mlQbUJ/g=
Received: from BL0PR02CA0144.namprd02.prod.outlook.com (2603:10b6:208:35::49)
 by SA1PR12MB6969.namprd12.prod.outlook.com (2603:10b6:806:24c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Fri, 5 Jan
 2024 07:46:58 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:35:cafe::2b) by BL0PR02CA0144.outlook.office365.com
 (2603:10b6:208:35::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.22 via Frontend
 Transport; Fri, 5 Jan 2024 07:46:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:46:58 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:46:56 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v4 7/9] platform/x86/amd/hsmp: Non-ACPI support for AMD F1A_M00~0Fh
Date: Fri, 5 Jan 2024 07:46:16 +0000
Message-ID: <20240105074618.1667898-8-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240105074618.1667898-1-suma.hegde@amd.com>
References: <20240105074618.1667898-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|SA1PR12MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e32b11-0d56-4797-d883-08dc0dc27ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lTDnM2MoL4BxLhmo8Hc2cxKncqCxoIheiBA4IX4hiB6F+WOhQ0dEV14KP4A8gsHIvp6usaQXe8464mECyMCXUj58L1Sgj+2ZF/t6SbQgMlAGbMO4aUJdmz7gAAxqFVAJ05h1flTKm5rnpKyGmyW4ERZaKh3qDrZd/mVOZT7+WOEUcUTTRq4dEUoBPqi8Dc4zoxCVqV4SZv+TIF/P51/8e1VaNgdgUPG+jGPa69qjrqFyW2y62VP8mxwTOa0yGr7Vcu3Q2Z8VVWytpC0ncVjct+LLxNDCKnZg8pxWLz/sUaCYDGM7UPDSQgbrBtEvxYi9Hl88mktIOeFdg631J/NzQ+Wx3ys/V6XTwK2KssDMt/BZl7VAWk1TRLdSQBHp+D3/e9eZh94l+GwQ6vSfgpiWpo1WDNLmy72QgNT5qU6f1K4sHcNXOv4uFunD77mRar6wJ/7dPuxpHZbVlDN2IlyKgTUmd7RERY9jNjXWAQlquL6WV0ys+Ac0pXPcZfuretQ2gc51B8YgW0JN78MGzKCC9ZS4qUPRDoEmHfrkc1VdA1zt7ZG1fEuqyFvaoWka0jW041F0tRnqfjryE7StBVvt1m9RU7nwUwYZgarErF1Ywbkd5xHu76y8AshZ2TAuehCaInR4m0TQMHSoNLEuxyiIPds0pCX3PUGvzMFL3HZGJlO/NfoCMig44D/sOdmJlTXqk15OJJ+vcEPH++0iNe4b9N5wFyYYwqYuvgs/RukIP1vUCa8PaXFxzhLf02GNpoUYcfPDdqIquCEqj1bEhyKG6Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(82310400011)(1800799012)(186009)(40470700004)(36840700001)(46966006)(8676002)(2906002)(8936002)(44832011)(316002)(6916009)(54906003)(36756003)(5660300002)(4326008)(86362001)(478600001)(40460700003)(6666004)(41300700001)(7696005)(40480700001)(16526019)(426003)(66574015)(1076003)(2616005)(26005)(336012)(70586007)(83380400001)(356005)(70206006)(47076005)(82740400003)(36860700001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:46:58.1363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e32b11-0d56-4797-d883-08dc0dc27ec8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6969

AMD EPYC family 0x1A and Model 0x0-0xF are having different
mailbox message ID offset compared to previous
platforms. In case of ACPI based BIOS, this information will be read
from ACPI table, for non-ACPI BIOS, this needs to be #defined.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v3:
1. Correct the spelling mistake of "transitional" word
2. Move sema_init() statement
Changes since v2:
1. Change "non ACPI" to "non-ACPI"
2. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"
Changes since v1:
Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"

 drivers/platform/x86/amd/hsmp.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 723a92439438..05255102e0a0 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -44,6 +44,7 @@
  */
 #define SMN_HSMP_BASE		0x3B00000
 #define SMN_HSMP_MSG_ID		0x0010534
+#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
 #define SMN_HSMP_MSG_RESP	0x0010980
 #define SMN_HSMP_MSG_DATA	0x00109E0
 
@@ -736,6 +737,15 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
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
 static int init_platform_device(struct device *dev)
 {
 	struct hsmp_socket *sock;
@@ -749,7 +759,16 @@ static int init_platform_device(struct device *dev)
 		sock->sock_ind			= i;
 		sock->dev			= dev;
 		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
-		sock->mbinfo.msg_id_off		= SMN_HSMP_MSG_ID;
+
+		/*
+		 * This is a transitional change from non-ACPI to ACPI, only
+		 * family 0x1A, model 0x00 platform is supported for both ACPI and non-ACPI.
+		 */
+		if (is_f1a_m0h())
+			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
+		else
+			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
+
 		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
 		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
 		sema_init(&sock->hsmp_sem, 1);
-- 
2.25.1

