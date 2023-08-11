Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17ADC001DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Aug 2023 11:24:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbjHKLYK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Aug 2023 07:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236191AbjHKLYK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Aug 2023 07:24:10 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7474B26B6
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Aug 2023 04:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdL+d0mGldeZ25Jw7LutsszTtt75NilQicLOHpNttumtlPdZfEqmIY/otcZu3GktuIys67DWtaxLVQXEuFVW0FidCnKhMn4N/JHqTvZUxlJ+/e5NXlbbyvjaLilJ+mKbA22LlSq0z7QueYREeHgrkwfuVlWhTUSLILt9dmcMWrIi8W7717tzTjzqEDdR48QGCZVILG8ih1AzFYwO7F4h71vTjH5RaNv3f+GXfQpq8JQAWKX8muL52BmxlVXqPtDImSafh7U5EAoP77UnpbunoVmme1d4c0a+pOUlJ2QDNxL5m7zj00OoO3RpoYA44+LusXr7jK9eBtYh1poZrU/dOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NswqKKqJOmLEQo30qG5+b8/1ftg3lEQDF35Ld7qGieQ=;
 b=AmmPTwBoZy5M3SyCei8F1IpyFDEruQjD8DIUtbE1P0C/e73zK+Q+NTeSM33cl4S29aDFuPs1U8GOYbDCoFHsIMsVsSqsFvv/BU6wNeN2nRI/hWTFFSre9RehA4lZE091DlfzZM+wmAUosgdOKguvotiTTcXeTBGGJHizdU4svpvf7ec8Bi87nhLnM3U5Je78/EKsDELXIaMyiGuqk2OsVqdos6LagepkatpSJy5/qfYGBObmR7a/euqF/fVD0/qkuZCvWNJjwjZcfhCU+dZ7M14PwadvOLSlLXcuYRn43piw+wRHfWkgPzYaIonYTwsCpZEB/f9Zkey94PS1aFwLdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NswqKKqJOmLEQo30qG5+b8/1ftg3lEQDF35Ld7qGieQ=;
 b=x56fIB60cnI3LX91nrJ+EyvOC/eyr28mgCX9SkoFSETmRJGMCFfR3gWG5grsKeWBDHqQMpqa+AEOJgKqY+zymB6naQhJIXgqa/ny36wg62mvmBcoLgAWlCjq/lIeXacuxvMNzZzadnbG+vsigyVa7R5cllSfC297/IUMT5nzbQc=
Received: from MW4PR04CA0259.namprd04.prod.outlook.com (2603:10b6:303:88::24)
 by DM4PR12MB6664.namprd12.prod.outlook.com (2603:10b6:8:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 11:22:10 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::58) by MW4PR04CA0259.outlook.office365.com
 (2603:10b6:303:88::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.31 via Frontend
 Transport; Fri, 11 Aug 2023 11:22:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Fri, 11 Aug 2023 11:22:10 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 06:22:06 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/4] platform/x86/amd/pmc: Read SMU version at the time of probe
Date:   Fri, 11 Aug 2023 16:51:14 +0530
Message-ID: <20230811112116.2279419-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
References: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|DM4PR12MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 7547e92e-c803-4bc8-e108-08db9a5d3464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KYyzuu2iNae8hlzjWR8x2HIumcRJKlcCFgJRwYcYtPGMel4lwj36Rf4y1scxlPj6Qf4RwQlUAhWnQBVFngMHL/vnUxL3Bh/PB5qJIXDj6ZC1swGIaY2gNKvK+V6oT82+kUNDI+fP6bLAwMCNXi7TybuzNRwmuSrGyNmrv0gJQlnyiYpnE3UW6PD7Jr9ZrOqoBo9fpAgVjVonCXjLkwkO5MZVK64QTv9ADnB0h08sLY4GBaQWKHhGuCXvRV5io7J0JbvxMUw1rXZw6TSuiuDNi+LzuxYJ7h7a2lzoY6S3FVE/GBTpaGRGokTu1Z7lIKv7945ibJ1UFtxutzWFVFG1/PlQURqtHhU74xbx9ZOV58m2I9HjJYeMsnp88zTxgFlLynqw493GjYO5k645V8q9lZXieP3OLOecJ7wQej3Nlk/3QDqRQRdnCoDwYybT/Yj5WK+E5IDKrmJZ8enS2Eh75ClimXYYyqkzSZz8c4FkUo0sK4/yxWSwSchZbKfbh7+6RnQlWfvHjVytaujsS9eVgj3E06dQQDjzvyQvRRFUVhzTh1GTrj+WJSmGHI7eeFUHxFSa2iqPKbZeV1IL028MfUlSrX0fitb9uPnUvA7xxwdf4FnvIP1pXuYwOuTvpbXcoA4jk212WLK24NUBayJpFCO6zx2ruvK88fQu8p1FGBI0UBwabPWIMxUbQuZyIPsKL44GHkbMbrdoNpZd6xuDVic2uDsAjwGn0eKFOghC6Qd6rau1CrbgRylWBR7DTgJfHjE+ID0oQYZyd8IyM6T7xQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(1800799006)(451199021)(186006)(82310400008)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(16526019)(336012)(1076003)(26005)(478600001)(6666004)(70206006)(110136005)(70586007)(54906003)(36756003)(83380400001)(36860700001)(2616005)(426003)(47076005)(41300700001)(316002)(4326008)(7696005)(2906002)(86362001)(82740400003)(81166007)(356005)(8676002)(5660300002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 11:22:10.3157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7547e92e-c803-4bc8-e108-08db9a5d3464
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6664
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently the SMU version is being read at multiple places, unify all
of them and get the SMU version at the time of probe.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 39 +++++-------------------------
 1 file changed, 6 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c1e788b67a74..043451fabbbe 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -405,12 +405,6 @@ static ssize_t smu_fw_version_show(struct device *d, struct device_attribute *at
 {
 	struct amd_pmc_dev *dev = dev_get_drvdata(d);
 
-	if (!dev->major) {
-		int rc = amd_pmc_get_smu_version(dev);
-
-		if (rc)
-			return rc;
-	}
 	return sysfs_emit(buf, "%u.%u.%u\n", dev->major, dev->minor, dev->rev);
 }
 
@@ -419,12 +413,6 @@ static ssize_t smu_program_show(struct device *d, struct device_attribute *attr,
 {
 	struct amd_pmc_dev *dev = dev_get_drvdata(d);
 
-	if (!dev->major) {
-		int rc = amd_pmc_get_smu_version(dev);
-
-		if (rc)
-			return rc;
-	}
 	return sysfs_emit(buf, "%u\n", dev->smu_program);
 }
 
@@ -526,16 +514,9 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
 				 struct seq_file *s)
 {
 	u32 val;
-	int rc;
 
 	switch (pdev->cpu_id) {
 	case AMD_CPU_ID_CZN:
-		/* we haven't yet read SMU version */
-		if (!pdev->major) {
-			rc = amd_pmc_get_smu_version(pdev);
-			if (rc)
-				return rc;
-		}
 		if (pdev->major > 56 || (pdev->major >= 55 && pdev->minor >= 37))
 			val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
 		else
@@ -717,13 +698,6 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 static int amd_pmc_czn_wa_irq1(struct amd_pmc_dev *pdev)
 {
 	struct device *d;
-	int rc;
-
-	if (!pdev->major) {
-		rc = amd_pmc_get_smu_version(pdev);
-		if (rc)
-			return rc;
-	}
 
 	if (pdev->major > 64 || (pdev->major == 64 && pdev->minor > 65))
 		return 0;
@@ -749,13 +723,6 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
 	struct rtc_time tm;
 	int rc;
 
-	/* we haven't yet read SMU version */
-	if (!pdev->major) {
-		rc = amd_pmc_get_smu_version(pdev);
-		if (rc)
-			return rc;
-	}
-
 	if (pdev->major < 64 || (pdev->major == 64 && pdev->minor < 53))
 		return 0;
 
@@ -1059,6 +1026,12 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->lock);
 
+	err = amd_pmc_get_smu_version(dev);
+	if (err) {
+		dev_err(dev->dev, "error reading SMU version\n");
+		goto err_pci_dev_put;
+	}
+
 	if (enable_stb && amd_pmc_is_stb_supported(dev)) {
 		err = amd_pmc_s2d_init(dev);
 		if (err)
-- 
2.25.1

