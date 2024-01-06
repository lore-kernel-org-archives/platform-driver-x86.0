Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA8815AC
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jan 2024 02:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OgRPW+fV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAEDuZC180x9hhwtt3jkVcqKD1Y2A+oZWaTjtcQaMd4uDbG15p0SWLXc0+j4hsQFFL6PYch2JDIKEfgt1ue9MI6OzUtQ7ddJYrUTOkyRgVUUTtW2S3Bp5eibysGJZDMzucdC/NTWtIs1T5y/r+FJgVfWLtDECTBEb4eZDL1hEf3A6jXuYRXzDUM2lJQU6Kt65Vi81VKQ3/7WJwm8iFo0sYv3MLHQEMrI21a+v3k/23eUsoewXTYamq1jPNtq0w6Z+9K+b/hw9IqliZumEqEP1ghUPDTONOti0DADcildP4VHD0X9YejMC+hjfA2wHaQSIyFgjCbgH83istZWLW/JBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpcgjt6Cmy2g5vQUcHP7YXaMTE7mwsO1jz6G1le5ToE=;
 b=iv+MSLoWOCQufRSe5gXFIYdB7x7uxQJ/37iEShw7tpU9PbOLwboZ8sBIVzZhGvups3n2uHpqetwtDaqLPsLddGtXF90sRpTuQe3PglJ5DGMURucga+S5reCEKPEqrXOwi0DnrjDmbIWfXQo9GXDoW6HsRfdRNzJKapkfdrAoMtY+EFtwWe2FIa2WLH6s9uqlqncA7YFhm4DZhLXPz1Fzvm5uYWMd0w/cj/fTyG4SkXlJfvOIVko9uERTs7jZRkovtygVIKeXL8XGfqPUx60Qh96d0KNyJ4mhp17PtuLUXHWYcmF9aXtNcw/61gpmfIF2VPSh42V/gLyCkTXZPKe+9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpcgjt6Cmy2g5vQUcHP7YXaMTE7mwsO1jz6G1le5ToE=;
 b=OgRPW+fVo/KepIiyK6MmOX+H8BgyD6Tpp7mT6F2DmX8vpy7iV4zIaElsvaw1QGWEX+hhGL/EdRDqWFMB19P8KdqkjpH7Xwu7ixtl9zJIpcQrFEYbVdZUfqQnovplxnJfDUEdwp78dajTnXDdWKRqRIL2/7nZJCn1dR7jnLu4TTU=
Received: from PH8PR07CA0018.namprd07.prod.outlook.com (2603:10b6:510:2cd::15)
 by IA1PR12MB7495.namprd12.prod.outlook.com (2603:10b6:208:419::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Sat, 6 Jan
 2024 02:26:22 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::b) by PH8PR07CA0018.outlook.office365.com
 (2603:10b6:510:2cd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17 via Frontend
 Transport; Sat, 6 Jan 2024 02:26:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Sat, 6 Jan 2024 02:26:22 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 20:26:20 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v5 08/11] platform/x86/amd/hsmp: Non-ACPI support for AMD F1A_M00~0Fh
Date: Sat, 6 Jan 2024 02:25:29 +0000
Message-ID: <20240106022532.1746932-8-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|IA1PR12MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fabe21-5b7b-40b9-0930-08dc0e5edfc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ftmeJPWYBIWflZRNffye7qf1YeolYDJHfzRz3Ei5pSmclkiGpAmmmDJP+1kyOwriH12L6ykTxDUX3Zu5FYbc+yqNLEOt6Zb1wjGp3UXHtETuScWcIJNGngoT01X8Qwcu5GCofjKuLVIGFvgilFKxH+TEKp5zajSZ1FnwpghK53DMvAL+OuIDpOevpNmjLIcw2OTvHuqa4tjqfHhUKPDUebYkZ4OOwHJunm4cA/tSBp7XYlZoStIFbCVy8rV634hadmcfkSYZGeLDW/2aflXRORMQMMt7QV32srvaOJo4WmT4srkdBTnTkbBX9rP0hMaWTCuIFuN0ERX1bpQouWYOVRRiqM4vf6GW/DyczEBrH6aQltwIJ6rl/CkSJdgjPVamovYvV/UfsEEQ7y+hLQDSCGvxVrNfs3D8yLA+948jpB2isrNSZJYWO7JoRPQyK4vaMFVwEwPopvFC/jeqkK2FvA4mIH4JKLS06IrnT85j4YhBclktMpXkT9OgJyeq/jMA16xbmW+W7S1aGbW01ti3uJEIO7svnp8C4w4jgspxkHV4+IjY8tQ7LyAdLSLRoz7ppoIO/0p1z8pdYB0e5FweEV0lkBZeFh39il/TlJ7+saxoN5tJod02K8HixqVIYnOQ0eevPQLGEIRtOfH7+FTpHgMFxDn41OkATUHC2O2aKdoO3a5i8IIKK9FHgVA9TKjVX27CeFxtMx96ZN2uwJuQ6mcp5BeI+aSNE0I8WhPgj5wEHJ9GA/rjjsaAnrN3UcQZdNOx2UxyoX84MLRZB5iU+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(82310400011)(186009)(451199024)(64100799003)(1800799012)(40470700004)(36840700001)(46966006)(426003)(2616005)(336012)(1076003)(26005)(16526019)(66574015)(36756003)(2906002)(47076005)(83380400001)(86362001)(81166007)(82740400003)(356005)(41300700001)(36860700001)(4326008)(8936002)(8676002)(40480700001)(40460700003)(44832011)(478600001)(54906003)(70586007)(70206006)(6916009)(316002)(7696005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2024 02:26:22.2761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fabe21-5b7b-40b9-0930-08dc0e5edfc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7495

AMD EPYC family 0x1A and Model 0x0-0xF are having different
mailbox message ID offset compared to previous
platforms. In case of ACPI based BIOS, this information will be read
from ACPI table, for non-ACPI BIOS, this needs to be #defined.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v4:
None
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

