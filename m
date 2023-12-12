Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Lb+bHd1/"
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF298D3
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2023 07:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKifnZvDA4kpWPJwraPMnNHBeFFmjE4KRgdKtyuMcsbTCsbvKnaqQF5SO53Bnxlh7r2CKmfSEs5Zcta/5RdEmqNHyRPHz3b+gdNfcchbUOSbnL3cB72/pGHD0AyhJ5O5OG4QFhOjMmXNxOy3jl9v2gTS+KntQqqqAkvyhFdJZKZ4q4NywSZwQ5Db2ZbUiFMdNVlmObPFsa7ER0w7TUCnExeR5r3eXb0oVmr6N5SSS5IWNvn1LwvKHmVY1ZUOacTmqZcynUii+hsGBDvbTyT8ke9ASvuUKMDDD6kYuF6Z2v0bzkb+le7P1ytgmN9MmeP2GkmtiO5l4CBx6oc8jF3FnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnVRUqb+PrbfZQbZhLedPTKd4oa6OsUffDwbmHIuOU4=;
 b=Iu+sJcODFzQS2l2bxkqlx1KATzB8aclLb0x3X4buRFlrz/eHiJVhI1/Y1a6GqT+LCiD5Wzx5furWchbC/nUrPqJ8+qSmkajBSC1PBxFwg743FOjG8aQB6gc/IFDvh+EaswegNPlbEp6cgfT4m0fKXW0lpd8k2ySbtNADEs9HnHqsEMtFhtzeZnLAeHmVWRPHEx0FZjoOB3ex330SZXRstpwleAoNaFP9hI7hZIJvwIMgZv/ttNeW150fYWgF3VMYdMm/TIvlkqWm5kIsTjcKmrH3zwqnt2uz8po9x5W7dLVuim8a4+Qm/MYMzXPxTfLi3d+2aJEkqeXgBaCAo7dhRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnVRUqb+PrbfZQbZhLedPTKd4oa6OsUffDwbmHIuOU4=;
 b=Lb+bHd1/1U5xCnYP1iGZ2cOt11Q/nfKDVuJ487QjSKmDnakf7sc4lgfbRFvY4YSdKifRtPQijrc1JlupR6IFBQV0El9T7X3AgK75t1ASm2t3M+fgeeSXtHdEfZRD9I5vLjNbAmFznSGxvDOqElMLBORaOA32GvRNKg4ukuSJwrY=
Received: from DM5PR07CA0109.namprd07.prod.outlook.com (2603:10b6:4:ae::38) by
 SA3PR12MB8763.namprd12.prod.outlook.com (2603:10b6:806:312::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Tue, 12 Dec
 2023 15:13:38 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::93) by DM5PR07CA0109.outlook.office365.com
 (2603:10b6:4:ae::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 15:13:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Tue, 12 Dec 2023 15:13:38 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 09:13:36 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Goswami Sanket
	<Sanket.Goswami@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 2/4] platform/x86/amd/pmc: Only run IRQ1 firmware version check on Cezanne
Date: Mon, 11 Dec 2023 22:50:04 -0600
Message-ID: <20231212045006.97581-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212045006.97581-1-mario.limonciello@amd.com>
References: <20231212045006.97581-1-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|SA3PR12MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: a6116ddf-31e2-4ab3-0ed2-08dbfb24eb21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	49PKtZJFF4LNZXUZcLGePQwg/IyzL4o7BDHMjWV/PJ9nDgb+A6zJ5aNcWfbuJ2c2FVT42aM2nLNcD7EI92W182f9uCn9Lso8yQ5cpTsXvkU7nl2FwkH9TBrf9GMZvUFdqnD4ZeqY5OhdRqAZFQ8Tn7raOCNDfGZBhBGlJt8vPVC0nDpHsrhlzpGtbTtLD8P0sLoFpC5nWQvbS647FYt4k7A+SNJkt2jzfjuq0RXlE8COwbpPC/0CmdMcSATJBEpZ3sbF7uwLYf2WtHnCD9cq+BUnfnIew1pb5K77RNjrU0mjf52p+S3WvhV2NmOXAmCloLY+UNKgUEQU8kHL9Ma/+rJB6L2pGsl2v2UA/JWIqc4d+jbbJgeMM7bqZnOQKwHW+KcdzSBTGzw8jk69zm5ELbneFYbNcXvBcDVGsub0fJb/b1tAQ6RXaY6TB/Dfb1pkc6Ml5ReforShTG5E/k3+2O8NY9XRKzPTcradS+3EryzgvQLVhPt2mF1i1hsoIok8V4vqwoop6Gmi2q65+p9PnNzzWGt1ff7z+5aBU3xXUXBEBSSagFTxjM8irEg0VPAMVvNEPgqFUt3o1JEHbsAgTzAZgCZMvRGaCtmr3upVWF/XzeAzY8guuR5v82Tt7kZpdGKuwYykXFfLMfF+BNYNZBqX3agVNs09G4WwqyUn9vfYDJ1+zcayitDBKyJB21WKfaWni2PZ9Br9uyiYZNwMRV1SfgHjs2gvIv/zN+qJU47aHKF4OgC/YXXv4AjJOIjho06fK7iTZh7p1UXO4dn1nw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(46966006)(36840700001)(40470700004)(40460700003)(110136005)(336012)(16526019)(426003)(26005)(83380400001)(7696005)(2616005)(1076003)(47076005)(36860700001)(44832011)(5660300002)(4326008)(8936002)(8676002)(41300700001)(2906002)(478600001)(6666004)(316002)(54906003)(70206006)(70586007)(36756003)(86362001)(82740400003)(356005)(81166007)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 15:13:38.4482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6116ddf-31e2-4ab3-0ed2-08dbfb24eb21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8763

amd_pmc_wa_czn_irq1() only runs on Cezanne platforms currently but
may be extended to other platforms in the future.  Rename the function
and only check platform firmware version when it's called for a Cezanne
based platform.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 666cc6e98267..824673a8673e 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -756,19 +756,22 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 	return -EINVAL;
 }
 
-static int amd_pmc_czn_wa_irq1(struct amd_pmc_dev *pdev)
+static int amd_pmc_wa_irq1(struct amd_pmc_dev *pdev)
 {
 	struct device *d;
 	int rc;
 
-	if (!pdev->major) {
-		rc = amd_pmc_get_smu_version(pdev);
-		if (rc)
-			return rc;
-	}
+	/* cezanne platform firmware has a fix in 64.66.0 */
+	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
+		if (!pdev->major) {
+			rc = amd_pmc_get_smu_version(pdev);
+			if (rc)
+				return rc;
+		}
 
-	if (pdev->major > 64 || (pdev->major == 64 && pdev->minor > 65))
-		return 0;
+		if (pdev->major > 64 || (pdev->major == 64 && pdev->minor > 65))
+			return 0;
+	}
 
 	d = bus_find_device_by_name(&serio_bus, NULL, "serio0");
 	if (!d)
@@ -928,7 +931,7 @@ static int amd_pmc_suspend_handler(struct device *dev)
 	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
 
 	if (pdev->cpu_id == AMD_CPU_ID_CZN && !disable_workarounds) {
-		int rc = amd_pmc_czn_wa_irq1(pdev);
+		int rc = amd_pmc_wa_irq1(pdev);
 
 		if (rc) {
 			dev_err(pdev->dev, "failed to adjust keyboard wakeup: %d\n", rc);
-- 
2.34.1

