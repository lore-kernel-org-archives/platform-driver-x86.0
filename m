Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78161C001B0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbjHNJDo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235006AbjHNJDN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:03:13 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD0D1701
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVUTSJB3abF/WF3aHVDVbdN0LKU0xNMHM1y+A+upUBtZd7EX0QuTuKJc2x55y+vV6v0xsDybARTMLKuU9zAaeJQpR9dmRQLg00trgEMxMckRi/v361qTipHPnteMys/brcH4un+vVnJ+NBHA484zEBRZ2DPUmNtNzXelTOHiCqojxcpCZmC3bVlQ6MROHbtQ3GmZkRn0eXNYRHDcM4IGYzbCkNQwpT8uOn75aUSeHBPuKJw7FFdKYTz5SHYi0BF0V1a7lJYwwRQ/ZJ5ANqRwKxyb+o8p1IUxNMrq4AHgXqJmycRpYeX9A07aqdUzvLfz1Z0UtyZSMaTRObCj1o53sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mv0S/XhvKsXZlu9CtjytXYXccCQ/UPrRPjuylW54Dpw=;
 b=HZwYxqBBWszwp1/HjBXb4u1PkhCGcuhnhTo7J7CHJViTnjppfU8yAP4wfERaUR0Rf1Nso2Jak7K6Q2AewI6xap3TNyKQhpnUC/vR55XKlCq2f3hsKEpTKZ0WoDOZVXji1afG2MLfZnCIpL8xvvXeFAW8bEvV7sciiQg7gbt/nHTRMU2/2NSGcP9FcHE0LnYLpf/gffYSdb6+67bxaIpuDZmkqHzDrPe6Bx7t3xw2qLxlCYE4ERccEVVLQMlqCi9/xgC7bt2Immvg+PJ3uQq0vOjm7dv50jgIbb82r+SJrqehUGJjTIpHgjs5ShfjldwKUfVCWvanPj9RYgd2tAHdOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv0S/XhvKsXZlu9CtjytXYXccCQ/UPrRPjuylW54Dpw=;
 b=qiiuM2p+ynawThKL3qjRDLwkF/XC9iEVf8fkdOxoFz9CXh0/7gp1UTHJYV9PaHP3p6HfyrIOgXbW7Xdf8UFDJUy8iUwI5u8v1uONRT1h1zOJ4WxbjdZR1OqSpTMoK+mbjYkFAqJx9IZf907z4HFHxG6jG6l/D2+oXGjSXNqh3gnIKi0wjMuYgOqZvc1/rLuQGezvj+3rLuFj7BDISbjDylRJx4OvYhMpCDo9ZVRmtS8Ke6WoH+xy3LAvwqDQ+syaUlySEruFzWFMB46XKGh5d6FZjU5Byogc7CQsZAXcTTw/X/cRj4s1Qf4dm8IS5ahyIvM7P7+Rn6vBUy/aWP782A==
Received: from CY5P221CA0065.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:4::35) by
 BY5PR12MB4227.namprd12.prod.outlook.com (2603:10b6:a03:206::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 09:03:04 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:930:4:cafe::72) by CY5P221CA0065.outlook.office365.com
 (2603:10b6:930:4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 09:03:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.205) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 09:03:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 02:02:50 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 02:02:48 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 14/16] platform/mellanox: mlxreg-hotplug: Extend condition for notification callback processing
Date:   Mon, 14 Aug 2023 08:59:08 +0000
Message-ID: <20230814085910.56069-15-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230814085910.56069-1-vadimp@nvidia.com>
References: <20230814085910.56069-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|BY5PR12MB4227:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e93903-d3bb-45b1-8924-08db9ca5449d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f8e49ouUkF5lZYym2tP0VWbhMJNvKAe0tTasSHw6As6CNPOkwJzkH4jQ8nemH/Ah15Adyx2+IS4FeV4SfMQn0hFTjRpFn4IM0M4ICXZsOpzypsWCdDB7n1ciYWxc20dQ3eMr6yY3YMlN8b2GEQowRKP93DbTonM9A13k6NYGiP5ruGZ5Y+6kDXxgcgKwvBwsRLx59CAMsGc4PoqitfWyJXF5MpN+jtk/O5OYDLXLDFWUEp4RYztNqIQVOMRmCMhFhGhuLSuwfoRk2YTxKyOx3eau/lt1JLEzv56XzHD0MCnD+eunoD0lsGlyg72G6/f7mKwGpQiLKi/6NoTJ46qvaxW74f7uC9Wi+vrCa2jC9Hw2aG29vve4CmCNOsetf8j9zw5QHzFpqNMlQADTIsLy7MtpYnKqSNbXDScfkLVQQ4YZyk+P+yxNHsJpIpsHiiCltRN38q5zWcrvRS7h6UfhmNA5VpQtYgaXAUT1ixdo4fnLGKItXPyrdbFVCK6/OneTbDuAWCDOK4+TDDmpcqG3WqwaXCNmiqSGI4Kjy7IFrF1Qljx+1i1OROXwuhJ8cPINHW27FMKbWSjvjBxccZ20tLCRfQCXVlYft16VrvKJyEE8vWwQ4HY/eaUQ9vU04jX8rlVBr9SN6GY3Omu3/Bo7+mftnbmB9queHSBWtiycI4D7oYZUZWhtRW9IEC0LUpbv/3pqUMJB7DJcVU/q2Mb97g==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(396003)(346002)(136003)(186006)(1800799006)(82310400008)(451199021)(46966006)(36840700001)(107886003)(16526019)(26005)(1076003)(41300700001)(336012)(8936002)(70206006)(70586007)(316002)(8676002)(36860700001)(2616005)(47076005)(83380400001)(426003)(6666004)(478600001)(40480700001)(54906003)(15650500001)(36756003)(86362001)(4326008)(6916009)(82740400003)(7636003)(356005)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 09:03:03.6362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e93903-d3bb-45b1-8924-08db9ca5449d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4227
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Allow processing of notification callback in routine
mlxreg_hotplug_device_create() in case hotplug object is configured
with action "MLXREG_HOTPLUG_DEVICE_NO_ACTION" in case no I2C parent bus
is specified.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index b7dcc64cd238..c5abedd3514d 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -113,7 +113,7 @@ static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
 	 * Return if adapter number is negative. It could be in case hotplug
 	 * event is not associated with hotplug device.
 	 */
-	if (data->hpdev.nr < 0)
+	if (data->hpdev.nr < 0 && data->hpdev.action != MLXREG_HOTPLUG_DEVICE_NO_ACTION)
 		return 0;
 
 	pdata = dev_get_platdata(&priv->pdev->dev);
-- 
2.20.1

