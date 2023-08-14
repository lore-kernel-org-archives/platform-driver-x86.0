Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AC6EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:08:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234986AbjHNJIL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236196AbjHNJIE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:08:04 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3152735B7
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQFEmoeX1NwK5GR3ebwqy4xZHzkXuzAQKdSvJ1rQKdHS7gue4/UigYM15TchGg2z4gARsZUKADGvOXU2yPN8f4VPBCZY9FeT0/LeGDJG7XRwIaKAhNfa3GeeqGs4OFSBRd0BQWJf2FzJTO/kPV1NOT8LW/LnQc/M3CS6eM20rYTRf0JY/OQXmLWRDS+SN18TNKSh330BjKp1GsCxfsiuuW3lgkJjDlq939fvpJ3QtuOfmNDTsU63aiXPr/6TEwjN/l1nloOtzhxQLi8O9rHkqk5B0cjSShAijLW47ubTHaZrJwhoTU5Cw2ncq8abT35saehfD4DLxWLeqL0h2hG30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fO2y5y6YdctAZfUI0UdBNW2eRj9iD1xiqx56WROfAPg=;
 b=DUj0ARcFTANeUtoMREa4T0HA+/zOZiqK1fQTbWSXj9oVot5hwcu6i260RC6FcYCBHF5QV5WFrhkZbep3fmbG0s9JwpcBkLTOjR1YkvjKCoev3UU7v78ZY48ygUOACfpC2X8iE+E73AllsXJA7mr5b7n97uuZZ00sqDZNc2ENJvajZzVJDuShkriNY671CKOhFFyhA72rtl8aSgOSjKRmYXW688jBaycwNFgk+6CkRKNP5dr/1SRX9T3xiiNZAm3IDpN1P3HD93K2YhhN11K9iuo/rg1cIC7P3+SxRhX6hLc3vYPlpMmY2uWcd3mouiPy1LUD/WifH+R9k6ATBzEQfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fO2y5y6YdctAZfUI0UdBNW2eRj9iD1xiqx56WROfAPg=;
 b=V0nPlOSevDSlLMRK6Vfe3LoBRnoeE/JZySz4KVVNzGKAGvJzFiMsafVc2N85il1dcJwB4EgjMvldvXBKhubA+Pfvzlsyujl6vH0s/ihGWlo1BYBEChzof3s2LlozxMqCqtdVPHYoXBt0zS0bRsWSr8IeiQK2QCCI11vh5T7txKYdPkl+xH0YdbX2jVEpT6lSyjZrPaFmoV4FZsjC3CxIwHYJJ7Iaq1T3relurVzLWoXFRnRQNNrtNpU7wMjW6Uk0pWYNJSADFQYv6RRWBTOR3r8ecrSkjqP6DmmsxyebfRk6XwhOhXu1E34uC0WtaYc7yJVMyoAKgI747FWljf7Vtw==
Received: from SJ0PR03CA0355.namprd03.prod.outlook.com (2603:10b6:a03:39c::30)
 by DS0PR12MB8787.namprd12.prod.outlook.com (2603:10b6:8:14e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 08:59:54 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::f8) by SJ0PR03CA0355.outlook.office365.com
 (2603:10b6:a03:39c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 08:59:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 08:59:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 01:59:39 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 01:59:38 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 03/16] platform: mellanox: Modify reset causes description
Date:   Mon, 14 Aug 2023 08:58:57 +0000
Message-ID: <20230814085910.56069-4-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|DS0PR12MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c2a364-ff8e-47af-f85e-08db9ca4d38b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jC+OshZGlVLJ5b2b+GX9nmNTxG9lun8QTdIt503RxoHp/u1xCoKNxn5/6HXOkB+HEorCy9t/Zw9iKgZm9weH1KG5BHfl8J5KLbSYVRoi695Z6BlWc4Swb+F6Z6v2H7S6NM9jHHjai7AdKgyew66opYzc7/9AEJcDyeomC+eRZ1leeGF/+f6a9BVd0DKEO6bS263Agt6U7eVMLcxIYjBL5lpx/zoPFie3ZNFwCFlbIa8WMbUKHxTnDXZ10HAgaH8Kj3svN8IgH/BMG+9KWa/vk+jn9zWqSMtBciFrYszGbw/xcOvPxKLNG3lw+XE6vZWwty5vlbELN1zFjeFJTYA7CDEU+jWMhegM1ClyvhAH6Sdrl0F5Pdqe82IpWs8RMHu+PqSA57tnGw4BqjQlXYvxTDHcKEY9QsfOhbC4EapaBPZRrZrIvTGrhykoCEzUaGZgib50/LzG9kiYhtamqefq8uqT+M3+yW+ojf1M7Nzod18q92B4uDd5w8RvJKGvhy23iL28TRrKVGlYwfkD571Bkf9bSx5quyJLbDcn7rie0ps7GhCRHOIvGdK+PXTlBIzv/Uu2kLKsJ6XS3wcoZ5sjMSiED870lHYZB+LtnOg8JBl0R0soeFSu+8vdGHR9el9GDKN7lM5rCDPuzU5oYD7/ldB6A0ChFD8EU14IU8O9GUREpeo9paACwLRislWUcslxwZb7kmRaKeOmYzI+bHYMzcs77KkMIwf8+rE1Ou6kR1BkkmeRrMstbH+JnDNpfqBs
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(1800799006)(82310400008)(186006)(451199021)(46966006)(40470700004)(36840700001)(83380400001)(2906002)(40460700003)(7636003)(426003)(336012)(40480700001)(47076005)(356005)(82740400003)(36860700001)(316002)(6916009)(41300700001)(70586007)(6666004)(70206006)(54906003)(8676002)(8936002)(4326008)(478600001)(86362001)(36756003)(1076003)(107886003)(16526019)(26005)(2616005)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 08:59:53.9698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c2a364-ff8e-47af-f85e-08db9ca4d38b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8787
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

For system of classes VMOD0005, VMOD0010:
- remove "reset_from_comex", since this cause doesn't define specific
  reason.
- add more speicific reason "reset_sw_reset", which is set along with
  removed "reset_from_comex".

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 647a10252c2f..5b0579752afb 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -3556,12 +3556,6 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(2),
 		.mode = 0444,
 	},
-	{
-		.label = "reset_from_comex",
-		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(4),
-		.mode = 0444,
-	},
 	{
 		.label = "reset_from_asic",
 		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
@@ -3580,6 +3574,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(7),
 		.mode = 0444,
 	},
+	{
+		.label = "reset_sw_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
 	{
 		.label = "reset_comex_pwr_fail",
 		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
-- 
2.20.1

