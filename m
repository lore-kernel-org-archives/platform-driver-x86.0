Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54970C04A94
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:39:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbjHNUia (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbjHNUh4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:37:56 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9996CE5E
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/I8EaeF21yZ2qk1SIBG4YGOYCQENA4mfMS/qWRoio5ELy8QqMAMr2siFn4DmiwUWaOXmkZLE8eWqfhyBOViuGU2yzDbDF/U5Vzak5jb91ZpLDxIrSy3cBsN1oip4yyqq5BoiwneXTrpSAerF3jkZX5IpTudE95W+X4eLFzlXuDrNaYb/xOQaUZT4g4e5S+DXx4pU6Xg5AAdzOreqQ14pY9ch7ngXcISvX1623Wf74Yug9b7+vGcnK/9GsykYAHcAu72XBrtPtfQVuAlHvbSLzpF1eqpKaeT6ypyawJvoK4KQFy5/2jr3gS/9xzdv7zZVkNyoUBcPnxzzq2aiKo/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shzwVEE24DAN7rR9AIqrQzmJs+Tj2qOaPzQDRSDtmVk=;
 b=OzOPjwd5ShT0kIKCdWNPlOSxU+HyyOg4ILC2zmgf1Yv6vCTYiFY1NU+v1WeHLKXyrFf/8Pl63cigOKS0aoDDNktI6a3xmhguecxqQ20lI8Uxo74x1+zkiqBsIynvbhbahJt4M2jzQDvFSTvHVxWvl/Dabb1HsEvSlLmvoKMrYeiqQ6k6xLxO5UZZzo7KzzxpVn/yeQbk+xbYFw7X9m3L6Bd6mRE5b7YvpfhZjGoE4j7MXm6Yg92JMIfdemcTA1D4dj20C3byJ10RmUG8wZZukypKvsvWgIcKeh8jrg6XVUtavT/lRJU1q332kvg5QIrCtZZM+LDq+hCGUNoSmi4lDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shzwVEE24DAN7rR9AIqrQzmJs+Tj2qOaPzQDRSDtmVk=;
 b=l04rYqE3aLA1Z6CrEiaBELnJqTkhfeUyEUrfrtOfEN4cvozn3YYW2y/Xp6twAdJmuDiMN29Uw8X25E7NawLCF8DjKKfbN+WUlLWdhrHMT3uqiGl3+27FPN8mA04WQVNr/bLFkBhXw1C5lFoU9JBgclZLhU8r0Cc+V9rPw1hIwlKIt7paeOuomDhEzwsZc4CTFTek3pF30LCHBy62EPJT1e4UeaVOCIuMRzJHS84k6JU0zU8Mfd+5SejUs8qc93S7InxHoe37asmOm3H/oNJPa56s78XpCy3kVsv2lELjdPIXaIXfk6s+zaKHU3n0lE3iLf6Sw48WmTqiGYjoTioQ/A==
Received: from SJ0PR03CA0016.namprd03.prod.outlook.com (2603:10b6:a03:33a::21)
 by CH3PR12MB9100.namprd12.prod.outlook.com (2603:10b6:610:1a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 20:37:53 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::7c) by SJ0PR03CA0016.outlook.office365.com
 (2603:10b6:a03:33a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 20:37:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:37:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:37:40 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:37:38 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 11/16] platform: mellanox: mlx-platform: Introduce ACPI init flow
Date:   Mon, 14 Aug 2023 20:34:01 +0000
Message-ID: <20230814203406.12399-12-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230814203406.12399-1-vadimp@nvidia.com>
References: <20230814203406.12399-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|CH3PR12MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: a4e73a7b-27cc-4f44-100f-08db9d06558d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hXJvO77ORZE7kY3RWv0VjRSAkaa3LNgLnBRCCR3Dc4WIvfkNPFD5QsX/U7Ob1bsFsj5v9BfseA+vhVMPTZKuyuE0KsAqUis/pc35ERN0hKUXtKVxqIG/bNChGXAtPUe7/9G+N1hqusDSRcgGz5e7OZyPNMqU90SKtjxb2sGY5ispHwEXcKzQHfCr4yjmPXuHznme0N4KMs/sk4gZqVh0jLOuW21f8BMjY1x18uNhFvBx7ULYLe5yBYDpriBxK+CvjO3+O9XSrmV9iQ1O+RTiLl3bK2EwJcu3QtE8M2bzRl0UAa4T3j+0rlh5nIUojgPV7pUFfjkWVB8IRhuDzBqcAPji0sIjBnOVycxu3ciEmi9nUb63GxlPTLJCUqO4V6ZGAjWnAfQsWmEtBMUCeyGWwYzymMBZBVM1RIRLZr33j1t7MvVzl/vsFrSU1Xg3moz3V4tIB42VqBVdlOoX9TOKKM/G/HrIZ6vxTQbs/2N44OdmOQtR+hvz52Wap/hnng6aLbD2J+zHUDc0X+Dii9Qc9EwFLD6q1d8jwO9x4oYf18QvURt5DxX3Nj2BulrvZPbf4yVR+XAaoMHgoF05mOe8VYELMDP4LEBin25RkTI7dq9z+nwX436kvRTXbkCU1gTnblXBtCgm9HVv96wq6ukXXbSyFE14jbcQznKigDUaqbywSL4O55TEqUtfi99sA8u0eL0m4JoyEtN5JoAcRW2VVRo97Fumx2BpxEyMrw2VYEQTBpLHwolX7rquzdGWB78+
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(82310400008)(1800799006)(451199021)(186006)(46966006)(40470700004)(36840700001)(36756003)(40460700003)(40480700001)(336012)(426003)(5660300002)(2616005)(107886003)(26005)(16526019)(1076003)(36860700001)(47076005)(2906002)(6666004)(70206006)(478600001)(41300700001)(8676002)(8936002)(4326008)(70586007)(6916009)(316002)(54906003)(86362001)(7636003)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:37:53.2792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e73a7b-27cc-4f44-100f-08db9d06558d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9100
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Introduce support for ACPI initialization flow - add ACPI match hook.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
v0->v2:
- Comments pointed out by Ilpo:
  - Squash few lines from the next patch to this one to have less
    churn in next.
---
 drivers/platform/x86/mlx-platform.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 73f887614e04..feedfba0acf3 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -6396,9 +6396,14 @@ static int mlxplat_probe(struct platform_device *pdev)
 {
 	unsigned int hotplug_resources_size = 0;
 	struct resource *hotplug_resources = NULL;
+	struct acpi_device *acpi_dev;
 	struct mlxplat_priv *priv;
 	int i, err;
 
+	acpi_dev = ACPI_COMPANION(&pdev->dev);
+	if (acpi_dev)
+		mlxplat_dev = pdev;
+
 	err = mlxplat_pre_init(&hotplug_resources, &hotplug_resources_size);
 	if (err)
 		return err;
@@ -6476,9 +6481,16 @@ static int mlxplat_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct acpi_device_id mlxplat_acpi_table[] = {
+	{ "MLNXBF49", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, mlxplat_acpi_table);
+
 static struct platform_driver mlxplat_driver = {
 	.driver		= {
 		.name	= "mlxplat",
+		.acpi_match_table = ACPI_PTR(mlxplat_acpi_table),
 		.probe_type = PROBE_FORCE_SYNCHRONOUS,
 	},
 	.probe		= mlxplat_probe,
-- 
2.20.1

