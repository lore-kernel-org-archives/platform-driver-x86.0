Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83650C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Fri, 23 Sep 2022 13:18:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbiIWNSG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 23 Sep 2022 09:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiIWNSF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Sep 2022 09:18:05 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::628])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8438713A971
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Sep 2022 06:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jA6QSnt6fE/QT6vgjc4/Ztivaj433uCIQz/fuF72Nnm36drVkRrMHtZwQohXDyhxgt0ESfP4ejeUZtxoyv8T7Uoia+pUsN7y6zvopzPHI2g9MF/Pqq1+K75b39QcqTUgEzPrPeiuOqFLpHqsMoVpcsC3TIA9AEE99Y3Dyn24pM6x6TOy+iHSJa2oBtkTxk3CzwrFjHvqNA+Zm/H+LRICu7+YzSrt++g9ix/kKyr0iOWm9e3Z7ZU3eu5lSJmrJhZu/B8B5W4yWrxF5mHEw3Xdgq0W8j5hMFzqFByaCQ4JPUbNYfH+4PDJfkt7zd2l8XYhAhfJf5gPLZ5Eb9n/EFsXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvB+w4Jrdmfx/TNs/ZBudytYTuajeg3DolpK8WV7lbc=;
 b=HsXxcco+3r1u6KBWC/iwiSIe9hMfUAivnp6gde9rOreoW1MvuCvcPnTH66qZN1/ta76RcjNS75RdPRWxt3490MFGejEmdXb/1LDZbwTJu4yQB7hVSeOpHJXFE1ofvgN7hrjUhSC1tN14BtyntbW67UwNB0yn5ZnQic2CrDAnn1Ki7bDEpzU+o+69GzzzXs8OlyVN8z+kjNDluuFnd5pDj8/BjigyLiIpr5UnPMsUYsaUAJ9BP2BAIG1tvZDXX9cXiUqfdQeFMVu2HYQ7TnvsPt2RpjhDKF/MrGm5f9Af7YnvCUfkQkHpS+dQH1jRyLZnMSt8QUKxbmY3UVupsANbrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvB+w4Jrdmfx/TNs/ZBudytYTuajeg3DolpK8WV7lbc=;
 b=HO2Gj6bFyxNr9xS5EvW5frtyTOAehHYlMQUSNit6SX8oiyxs2cm50ueSEMLgeXYzI2+dbm+klhRGay9Y0C/XihRyH5IhI+Msw7w+p903CJqepDF8Zj8NRi5P8X8BKYtKD8D7akBDwa+W0vKMRVdlgLal1dZ/I8Qt24p0SCa4Wy8=
Received: from BN0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:408:e6::13)
 by CH0PR12MB5044.namprd12.prod.outlook.com (2603:10b6:610:e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 13:18:01 +0000
Received: from BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::3) by BN0PR03CA0008.outlook.office365.com
 (2603:10b6:408:e6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20 via Frontend
 Transport; Fri, 23 Sep 2022 13:18:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT054.mail.protection.outlook.com (10.13.177.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 13:18:00 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 08:17:57 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <mario.limonciello@amd.com>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <bnocera@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "Mark Pearson" <markpearson@lenovo.com>
Subject: [PATCH] platform/x86/amd/pmf: install notify handler after acpi init
Date:   Fri, 23 Sep 2022 18:47:24 +0530
Message-ID: <20220923131724.1812685-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT054:EE_|CH0PR12MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e9f607-001a-48b4-f5b5-08da9d660a1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3GhbPcBeOz0zOP0XR3gXMjwDte7ZeGl6yf2gPO0kcNB/V1ia3g6TIlw7NYRLDmoQNBHeKIKEOJzdvrIKXOIspszRFaAzyYRpp7v0RkkAmv9Pz5Tr9isVDT+rv9nkaEz0V7aUxcTdWhqUjUDxV+S2Y29qOCjVTRHwzrQlp6bhfP1XC2UUgOdaNy4FWN/KYRxDPUFhiAsRFclfj0B4L9OKnMuOQukOMNSPslK9i1SMjmnXfhKH7n/twd5fduBvmzQR+q2W5Z1zHEQccGX5wkief3mw1pw489X0O1urDRAasNnVZANuVZSn7ArQQUqQvfq01j5Zro9UP920AivjRL+HyShv9JyHeNDhD5rVMPGpIErwTfK6SYDy4t825BZwwHwFztobpBAk8EvtVdUWSh57CGhc4ZfDXlVQXOQGyhDdBL2vBtbL7cWmc7nc1PEg27aSQIC78E+P6rW75n+3xREWXY+yj/XA8Z+Q4l2LxJybPlldlVmGvEOhcfHpzMGpRS8OYLuNsHJVWHWbNbd17F7BfSbuNX8pkDfsdyT7lvh6+Jo/FStIorq+MRo3g9I7PxANFLZ+HHrGv+Nb8htp4CbOr6fS/K+stu7xMU1D0Bm297hAMbuFzBR8k2u1NzHBdpkF8cV1vTlFXd4CC3iwSVJPxyJw/TOP5hAfPuKl4fjHPsIRxCXEaGJ3/O39Dcco86s8bXKVuhmRC5KZFbLJnc7hv0pUttw8/C43plWbFW/GKbpzbJjwBPjRDeVqx2XSM1bp2YN6ew248VFnEu9+7eMnLcU7tQGuYuKCMqHpP+WGl8Iy89O7HZZsR8jLSGgXzefO7nWiBFa0Q60iNQVOfmIfiw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(1076003)(426003)(47076005)(2616005)(81166007)(36756003)(186003)(41300700001)(26005)(336012)(2906002)(7696005)(16526019)(5660300002)(82740400003)(8936002)(82310400005)(6666004)(40460700003)(356005)(40480700001)(86362001)(36860700001)(83380400001)(478600001)(316002)(4326008)(8676002)(54906003)(110136005)(70206006)(70586007)(6636002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 13:18:00.7747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e9f607-001a-48b4-f5b5-08da9d660a1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5044
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It is observed that when thinkpad_acpi driver loads before amd-pmf
driver, thinkpad_acpi driver sends the AMT "on" event and the request
immediately will be part of the PMF BIOS "pending requests".

With the current amd-pmf code, as soon as the amd-pmf driver gets
probed, it calls apmf_acpi_init() where the notify handler will be
installed. Handler callback would call amd_pmf_handle_amt() where the
amd_pmf_set_automode() shall update the auto-mode thermals.
In this case, the auto-mode config_store shall have "zeros", as the
auto mode init gets called during the later stage.

To fix this, change the order of the acpi notifer install and call it
after the auto mode initialization is done.

Fixes: 7d77dcc83ada ("platform/x86/amd/pmf: Handle AMT and CQL events for Auto mode")
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mark Pearson <markpearson@lenovo.com>
Cc: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 38 +++++++++++++++++------------
 drivers/platform/x86/amd/pmf/core.c |  1 +
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 3 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 05a2b8a056fc..b6453157a59d 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -243,6 +243,28 @@ int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, data, sizeof(*data));
 }
 
+int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
+{
+	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
+	acpi_status status;
+
+	/* Install the APMF Notify handler */
+	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
+	    is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS)) {
+		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
+						     apmf_event_handler, pmf_dev);
+		if (ACPI_FAILURE(status)) {
+			dev_err(pmf_dev->dev, "failed to install notify handler\n");
+			return -ENODEV;
+		}
+
+	/* Call the handler once manually to catch up with possibly missed notifies. */
+	apmf_event_handler(ahandle, 0, pmf_dev);
+}
+
+return 0;
+}
+
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 {
 	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
@@ -257,8 +279,6 @@ void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 {
-	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
-	acpi_status status;
 	int ret;
 
 	ret = apmf_if_verify_interface(pmf_dev);
@@ -279,20 +299,6 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 		schedule_delayed_work(&pmf_dev->heart_beat, 0);
 	}
 
-	/* Install the APMF Notify handler */
-	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
-	    is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS)) {
-		status = acpi_install_notify_handler(ahandle,
-						     ACPI_ALL_NOTIFY,
-						     apmf_event_handler, pmf_dev);
-		if (ACPI_FAILURE(status)) {
-			dev_err(pmf_dev->dev, "failed to install notify handler\n");
-			return -ENODEV;
-		}
-		/* Call the handler once manually to catch up with possibly missed notifies. */
-		apmf_event_handler(ahandle, 0, pmf_dev);
-	}
-
 out:
 	return ret;
 }
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 44fe30726b62..a5f5a4bcff6d 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -369,6 +369,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmf_init_features(dev);
+	apmf_install_handler(dev);
 	amd_pmf_dbgfs_register(dev);
 
 	mutex_init(&dev->lock);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index e5dc3ae238c7..84bbe2c6ea61 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -381,6 +381,7 @@ int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index);
 int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
 int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
 int amd_pmf_get_power_source(void);
+int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
-- 
2.25.1

