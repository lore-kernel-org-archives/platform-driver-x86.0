Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB6915EFBD
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712758263; cv=fail; b=PUMaDzEseGPsU3Lqxb/W99wy3b6fwPAeo2INLOlBWTBXPbm8vPCKbPEQbZrlo8xiUJWHbcz49QYbEE80exSD+nKE/lniSy8pPnd4uddugFwEA/ReeHVprcrO3a6RRzjd9SHZ85aA0A9tM+sflLp7A4F7Xz/mIGMGG/LeYVeZcac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712758263; c=relaxed/simple;
	bh=Naa3ZyTbejOY3gfJn++5ltk9l3K+p9X50BtG+fApo4A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CxNmAIvQoK09Tyzzv/E/8PQ3lOl2c+Bw+dXnzynoWXPXHWsoEAhJbkpbRvcnSHRokAYJJMUwILiHDSZrXLW/hkkCEeTY9ocFwGw+GvX7EQQx8oLOSN+BTMsAB3oQr2FHWLmrgbBX0T0nx5eth0j8RFnsI9rIhnRYgB6WphyleGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=e3feakmQ; arc=fail smtp.client-ip=40.107.244.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="e3feakmQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anwbWoTryVLQH13uduPrETuX2rdEB4+eGkXY0AbYRdbydf9up+FcQqjFtsVTuDnOAL+Bg/ePdZg9icq1rlIsjAao2cXTQ/osQU1KtzBpXacAr0GrAFh2cWcSQAuBniA5CRp79FtHLnDv4wblPOkVsJUOHmEvzb7ZNmzbZrEz750K3f85Y/2hu+7P80WsYXRDjv3h6xTxABjoLzyDqorRRnhu/3ESO1STMnjvPlRJ6GzbtDkkQZXwfUQx5hiWanS25G4IO7/VH44fB/A9i4tDRLndmJScDMQQmpvvy51LcPvOarfW32q8Bipnk7iWNilk8znSpJjy3OwB6ZlEOmFbww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuQfL4OoDH3f/TnIPZNHKbvWa3NhFRqRZzHPip3u8RE=;
 b=mIubricJ5851OILs11pRgo6WuRwMPDi0SfdxLMJZSBsbd1zOALdt9GmhdLsdYHMkNO5oLuXXyQHQKEzUCO77aLzEQTyNbp3l1+Coqtw3LuR9SycsKLa6K1Wk1q66oOX/qDbGyQY08Sagm3BafPstAFWjnQja8dT+eeeWKBCFwj5VwjdI4lkUAZhRgaumWRxT8gpvrZcpvdDsass4HUMMYrZCO+muULj+B8yPtyx77OIh7eip/uVurVLfANqGpd8mdo3OJW1ULQNubN5szRgg0wEHkOvaVKf6tjNReW4Xgq4ZCriRdx/wwCwQI1BcylTFu0FIusdm1V97o4n70/UkPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuQfL4OoDH3f/TnIPZNHKbvWa3NhFRqRZzHPip3u8RE=;
 b=e3feakmQQ5v4r0xFK5AFowyb3nf/wjMFOfPHg8+XWNuazNq+Udqy14nELndRkyT8m1EvUJrxzEP+c7sajyTao00NFwwYpGJc2iu+Rtpk2V7JkVDUB6p+gigkB6YtivuBk+sBtM5uB6Kx+XrueqKlsrws/jO0Bz3E1UXISMYujeE=
Received: from CH2PR18CA0049.namprd18.prod.outlook.com (2603:10b6:610:55::29)
 by DM3PR12MB9287.namprd12.prod.outlook.com (2603:10b6:8:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 14:10:57 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::1d) by CH2PR18CA0049.outlook.office365.com
 (2603:10b6:610:55::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 14:10:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 14:10:56 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 09:10:56 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH] platform/x86/amd: Extend Framework 13 quirk to more BIOSes
Date: Wed, 10 Apr 2024 09:10:46 -0500
Message-ID: <20240410141046.433-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|DM3PR12MB9287:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b4d264c-6ce7-4460-7204-08dc59680aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZssmX/VAKOf4F/m1KDcyZ3FkVjcrbSV2QerozcpaXlQRk5yvm7GAZMV0GRbxBmTBEVrp6yemmi27ikbwqph74QZfI9Ym2tKOrnce86aJWFZWHigd5BvMOivizWKSD3Q583jvYgcATElSqtb+KtPNimDGI6hQWKS5IZg5/OAjCi7exUTd5pHh63klID1fgebgwbL5N7IvYzaASJVV0/O5X5ZjpjzNq1ux+vRP6go+NIPJ8K4GBmu1J7VbEv6nzUi7Rm+SM2O+j12Hush50zMyKriDPpdw5ViHgGAp3XNBPW9QGIx7h3nDaEHK9spU8mwdm3Eo9ZVV/zajNEhirhIcUzd4DlRTPYh5yzzky+0udNNvTCgrywmLVpi4FMjC5Td4ZoJKu0/PcmUXiUivPSXgafNXnqZ3On/Q8H43nfUJ9SdFFOhChePtxpbQoKtooDc8JcsDn35jyuU7lBLlw7ZbR+COxU+ajNswQfr9ntuSsL/kWofFUtGvVRARCaPS4t98Tjz/0f7WwrqhzFFBBqkWv3YuMmDc0ersZGrl4UG1XdpTJGeNYDgV7o/dL0dFds9stn+uYVKWzh/Iq3m6D8EhK8wo+qQZuLIuqTbql5DDyi2EJdDNUoGRqCK3FZhARH/RNGDpGqClUfFmwTY2UkZl4OaZr/2CRqqUMy6ClEEgZ14u0CDu+69bSjLRWJLiUE1VF2RSVu9WsKVejRwuDPyLhJnoeqSLbIuX+DySahxgjFO2qTuOcN1WoTyX+yjurpEm
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 14:10:56.8880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4d264c-6ce7-4460-7204-08dc59680aae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9287

BIOS 03.05 still hasn't fixed the spurious IRQ1 issue.  As it's still
being worked on there is still a possiblitiy that it won't need to
apply to future BIOS releases.

Add a quirk for BIOS 03.05 as well.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index b456370166b6..b4f49720c87f 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -208,6 +208,15 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "03.03"),
 		}
 	},
+	{
+		.ident = "Framework Laptop 13 (Phoenix)",
+		.driver_data = &quirk_spurious_8042,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Laptop 13 (AMD Ryzen 7040Series)"),
+			DMI_MATCH(DMI_BIOS_VERSION, "03.05"),
+		}
+	},
 	{}
 };
 
-- 
2.34.1

