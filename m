Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD30F5F858
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jan 2024 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706019346; cv=fail; b=KTaGtgBPZNe2bcJ0nXmi47pgAf3wLPUYmv69PNRVFk29ijQAEQTFZyFxtXIxkKXcSg7YQ+N2nULNgwjG6XPlxGaatJy0U0wbnWx+143noo1xQ6+QEGoEa2QBIXFFijlSLXBYbV8xC6EEi46H72PAYyyVDNM9b7xpXOTZ20a15Qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706019346; c=relaxed/simple;
	bh=eyZQM/kAbNOhf/D80OzOAG3D8Nkp8G3IVUGJ8IvAD4Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iAPznrCv9j5g+WTzP1RdwBU5GHh5NyWA0ARhYTeBJykUVd9Y8Ts1E3fsY0X4c5UFDrhW5PQpl1Y+ijb+Ao4AcVQKAqQtqr5J3kXzDfvEp8l8+FmFfNe8voZYcaBwl10z9Fht1oYKEZdTRFF5LLM2GxkA3ioUyR0NCCMQaRTQ/LE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T5kIbuVF; arc=fail smtp.client-ip=40.107.223.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T5kIbuVF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0Y411mMO5nIJnsCoFq0sYZE0RnuHuNFEW4km7yi/czHOnJ00VUwfTVM0B3vX9+Wqe9jtbXGGusJlv+RKlgQzTSUStxJT12C+9Gnxv+yJwbQ+5/nuZFjcP69ULKIrqvOiYZLRB0eLFIQE08luZEHUi+yo9ur+lzQ3CkKYAmspQI87xGG2Zz+SGnS/ETXTvd12PNiiNWdH8VZgrS/2BhKsIubdMfh5BfnOAMJYfoX0+BfOPF5QdrdMrkU0YYQDIcnaMJIbUuk1VvNogkociyIGBt2KvIUL1BQ3THdN+thSep0kEtMeIuRyaKg9AS3HCGkxB5a2oZQSe0OtNQuWw4hmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4X5wVjHSdrkm4rQZ+dgOehhnvvdTYqmmcPLDIPAE1c=;
 b=a3pX8hxn4/zffISx+On2gEnhB+WkD1FuddcazdkcvQc6foDJEAvbWYkaAEh+R/UM6bKNny855rzkXYuiN2AKBco2H8cnolpRq/BEeJvHmraQxTTqebts4cJ7WkGlNaGyP589+m8LyzEq8fWW3kAl6W/MBskXx0Qjnd10SvlzIGjh4JV7PleBztm0NWDGyInz9ZwTcrq5FYo4ioLdZqn3T3t6pvcvDnkR3iaLc88scIyArzH0+lJpK6eamiYJZ5mTOilmGQKmBeyjst1XoGRpat63tPE5RXQEkm9hrN8WENYIA7TMelgXZnE5R4Fpv16c0UGXTnyQM+nqnCsXNR2FpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4X5wVjHSdrkm4rQZ+dgOehhnvvdTYqmmcPLDIPAE1c=;
 b=T5kIbuVFzeP99mBQGKXpht3JQbao3G0627Ampx2KY3G4lhN0mTSukJBb4cJQpD1CrHrIajU5Jqcrsk0rRe7AekXaiCqrTkWsDmFZCfA5PUoRM9H3Ror+ha4/91dAUWkM7lnfHo1InU7kkpGM3HSh1Ju6RUcFOWDOIVadq8tQhvI=
Received: from DS7PR03CA0279.namprd03.prod.outlook.com (2603:10b6:5:3ad::14)
 by MW3PR12MB4570.namprd12.prod.outlook.com (2603:10b6:303:5f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 14:15:40 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:5:3ad:cafe::c0) by DS7PR03CA0279.outlook.office365.com
 (2603:10b6:5:3ad::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.35 via Frontend
 Transport; Tue, 23 Jan 2024 14:15:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Tue, 23 Jan 2024 14:15:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 23 Jan
 2024 08:15:37 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/2] platform/x86/amd/pmf: Get Human presence information from AMD SFH driver
Date: Tue, 23 Jan 2024 19:44:57 +0530
Message-ID: <20240123141458.3715211-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|MW3PR12MB4570:EE_
X-MS-Office365-Filtering-Correlation-Id: b45651a1-00f1-4893-118b-08dc1c1dc758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mufJ7NU+uns32BDvI89Os0ablaR2SRdQk5LkAOkB43dnHGTHXVXLnRQ3FyGF9577KcEDz2dEuWiWrPUf4o7OSzwToopReIOXMkNuPrx5OCN8MVHQTAe+mJTxtblgPKpqBNSPPT2whZeuvSYYn9aAxGJnpvy0KSXUe8l/3wuaDNdjW95TBoct8Qej/jdwiz0J+Q/TL/7IGPrTQ4S8/dk/Zr2YASShfkMwblqOHqL4IR0hl5DqlfELk05nby61U2rzQ1tH55wuQ5V+hxksuOK+7TD8VMu2fJCZeOhfAUpMCR7IW3PqdDLarscpAfI3T3fwh60kI4LvYT+8f4RATYMrgkqiQKyFdiDc09sgc82mBPGUX+upwp5b4zf2bUQY7n+mX6+fXD+2ecTTN0R+lhZoSjC0ItldPvv3nwn1DSY22M7dKtC6Jl3vi8ozaVBrc4h/q+mRM53H5YAut29eFGA0/wFmeVzSVHf7KI+JW7fJD5ViBawmYtj5elwwvUpHdNNwibNEfKGToF6+10ql3vi49CyJwsMbwEDkKuQJb/jLcPhXxh9fls2/xecQkWBYcmcV89vzcloI3QEHaTmcKxgNj3Ro1towarHaQsoGx62VN5fzSVffBz1CqbkA4+Sidc11O6WpH4MKdwftfJO+JvRi9PzYWv87jcNSurC95CpPWWs+r1o1AZVdTEq16sGBBoxtLyATeI5vb25zie0g/CIIUhL9ERpxr4Mc6KDhTGsxbXBxRKfo29iNvIE49nJU3maeH4X3gwcPL6Wdsu2lAKwMOA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(46966006)(36840700001)(40470700004)(4326008)(83380400001)(8936002)(8676002)(82740400003)(86362001)(41300700001)(356005)(36860700001)(2906002)(36756003)(81166007)(47076005)(5660300002)(70586007)(70206006)(316002)(110136005)(54906003)(2616005)(1076003)(7696005)(40460700003)(40480700001)(6666004)(478600001)(336012)(426003)(26005)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 14:15:40.2897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b45651a1-00f1-4893-118b-08dc1c1dc758
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4570

AMD SFH driver has APIs defined to export the human presence information;
use this within the PMF driver to send inputs to the PMF TA, so that PMF
driver can enact to the actions coming from the TA.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig |  1 +
 drivers/platform/x86/amd/pmf/spc.c   | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index f246252bddd8..f4fa8bd8bda8 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -10,6 +10,7 @@ config AMD_PMF
 	depends on AMD_NB
 	select ACPI_PLATFORM_PROFILE
 	depends on TEE && AMDTEE
+	depends on AMD_SFH_HID
 	help
 	  This driver provides support for the AMD Platform Management Framework.
 	  The goal is to enhance end user experience by making AMD PCs smarter,
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index a0423942f771..87ae7c41c9f8 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -10,6 +10,7 @@
  */
 
 #include <acpi/button.h>
+#include <linux/amd-pmf-io.h>
 #include <linux/power_supply.h>
 #include <linux/units.h>
 #include "pmf.h"
@@ -44,6 +45,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "Max C0 Residency: %u\n", in->ev_info.max_c0residency);
 	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
 	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
+	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
@@ -147,6 +149,31 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	return 0;
 }
 
+static int amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	struct amd_sfh_info sfh_info;
+	int ret;
+
+	/* get HPD data */
+	ret = amd_get_sfh_info(&sfh_info, MT_HPD);
+	if (ret)
+		return ret;
+
+	switch (sfh_info.user_present) {
+	case SFH_NOT_DETECTED:
+		in->ev_info.user_present = 0xff; /* assume no sensors connected */
+		break;
+	case SFH_USER_PRESENT:
+		in->ev_info.user_present = 1;
+		break;
+	case SFH_USER_AWAY:
+		in->ev_info.user_present = 0;
+		break;
+	}
+
+	return 0;
+}
+
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	/* TA side lid open is 1 and close is 0, hence the ! here */
@@ -155,4 +182,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
 	amd_pmf_get_smu_info(dev, in);
 	amd_pmf_get_battery_info(dev, in);
 	amd_pmf_get_slider_info(dev, in);
+	amd_pmf_get_sensor_info(dev, in);
 }
-- 
2.25.1

