Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF82C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Jun 2022 14:51:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236251AbiFBOvY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Jun 2022 10:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236242AbiFBOvP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Jun 2022 10:51:15 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2058.outbound.protection.outlook.com [40.107.212.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168C72ACB57
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Jun 2022 07:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGzwpuc2mHA3Ihqqh8PXClkGZvelvlxQyIzmRoT9zGPDHerTzL7ygvSenTLLXxO+UnUWN/AUD0cgEKnEqEntMeyL/0cmha9YlBoE9Fl/HiOkL8p6xhsJFOkITux0mfvBZ71Tk/N4Q/kAw0MoawQ6YUUQDj6xuIh0HAKurSC7/EzaTodATndHk+ILmpSLhHkMWEYGHtqPusg8wWXWvZMEUDNGGP8W4Pxx4xZG3vgNRnKFXtz+f8YBHgam3qqFvm9OCB8Dgr/a8DsvAVWWUrpKodtYSkVkd/BvthopHKn12fmgBIVqzEPFwrFI49x0lu7rZjCd9COL3LKGZQ7Ij5claw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8850PnLwbRU+bvXyPB++l49dOdwR69MzrKfaMsQs2o=;
 b=VhyEftJ9U9HZAI/MP23P1cEy9gozbQgUKGStw32ToCh9+h4iPdjbAtFY/wh6drKVQgZ6rgUiMsCq9Ko+e9/24ppLf5TrxAK09UpQIKnrfz/v+jbRFgV7ETYfxIq/fM8p/uGktNf3eCGTA1B7pnjnC6F1nyyCCW5/hM0RDAYwEk5w3TNdAQvr2pOkXnhJnddZOZbe70lWa2Cd/kdZNrxJhXsFU9Aq72JZD/yr8VlP6mc/N6yuRvssFGVlO9eh0qXCK3M4s687/V/NwGd4T20fq+/EWpdSE8KgfWcClSbHNXy0s2gGexAOtkKR84yV0N9gETar5vYUVKvFBR8OAISyWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8850PnLwbRU+bvXyPB++l49dOdwR69MzrKfaMsQs2o=;
 b=q39nhIYRCSNJW7LiOC7bjToRaB0hVLGhvX0ADQ+fZDT0vurXIsJpZw97kJQyPMbIbm0bJC9w06nN/k8rlC5lsodz5+E4SpmHNd0v7GKVeRuSct+1ZRir1Rp6W/906vfnkCmtKdudMhKLO7iVTxLdeb5hG5LpAZE/ZQRKs2FCnnSQzEX8gc3gSZb1r3/1W1HSNhu8kbgJnDJXg46EXUyuU9KtGw2b++lxiUyE0ab8hX5wSuZiabzNoGFAb3jMSJQWwKyUJmijq6KrE9VxYz3rbFkbjxT91LQKs63ze1wYFNzjrwFUpNKuc7HAafBo4Fg0+iwEa3g5OULGGRsOi87hMQ==
Received: from CO2PR18CA0044.namprd18.prod.outlook.com (2603:10b6:104:2::12)
 by CH2PR12MB3799.namprd12.prod.outlook.com (2603:10b6:610:21::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 14:51:10 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:2:cafe::1f) by CO2PR18CA0044.outlook.office365.com
 (2603:10b6:104:2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.14 via Frontend
 Transport; Thu, 2 Jun 2022 14:51:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5314.12 via Frontend Transport; Thu, 2 Jun 2022 14:51:09 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Thu, 2 Jun
 2022 14:51:09 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 2 Jun 2022
 07:51:08 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Thu, 2 Jun 2022 07:51:07 -0700
From:   <michaelsh@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v1 1/1] platform/mellanox: Add static in struct declaration.
Date:   Thu, 2 Jun 2022 17:51:03 +0300
Message-ID: <20220602145103.11859-1-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c74779ca-a015-42c4-babe-08da44a7548e
X-MS-TrafficTypeDiagnostic: CH2PR12MB3799:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB37993D89338FFC222DA7BA32D4DE9@CH2PR12MB3799.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MNwMiQtI8kBZgmNN69A/jGa2xU+kvTyVJXnXBKRLWIb0ef5lGQee/nijUz2GETOA7rmtX2SCjPQqL8dhmHj9j4tCVq0xA//AtSdCUwZEHxAVY1G2AEujcJFqYv35nwwixxqGEGd+sxX0A9qvvDTaSjh/y0nb6RUgQjZ2xiwEggLGXnB3cZ4l/UvNx1COU+joN0jPWiF9i1B3nVJdF7Yk+0Jo/jCytzxI7RODVjc/PbkewjRqYCYjpIz6ZXgo2FRljitbE/dhEqkwFKrpjY7yPCZjE2QkPVYgVFaUwE5cKhh21Jr36T3hfKJIcGN3ELl7RFzhZKkdCON1hcqUOM16W4Pxe9KsRS4fWLFyQNj+8YIUaHVB/62DiPiGX1YVkElZsT6n2jcm4B02RRh7xOT/vd8aKZDFH3svgPlCE0HRuhis2Cojp9N9csRRu4Y14AJZSWtH+nBxz/Y0cfYHj0IEDVBrL0EjoUIKT4h5F0toGO0IYs+ppMrCf3AyxIWzntz4ntkjY8tcEYKUMARMX4JCAbpsFbBkP5Nt3qYR7suVLA3CXAuOnmEYB4Z7mgTspGYChiuQY8oUdOUAdTP+sfjvAH/ZF/grRdY5IgU4DxbQvm+x13jbC7wKZRMK8ZUpY0A1tYXzK7H9mecQKUnDCa35AsHW8WMoM77S8pBn9W96Vu8J39cIG30Aw8M+mQoW/fyd4CJ7HHL8jDPk1r8hAaTBvA==
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2616005)(107886003)(1076003)(86362001)(82310400005)(4744005)(186003)(36860700001)(5660300002)(356005)(8936002)(2906002)(4326008)(336012)(40460700003)(426003)(47076005)(8676002)(83380400001)(70206006)(2876002)(81166007)(70586007)(26005)(6916009)(54906003)(6666004)(36756003)(508600001)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 14:51:09.4120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c74779ca-a015-42c4-babe-08da44a7548e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3799
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Fix problem of missing static in struct declaration.

Fixes: 662f24826f954 ("platform/mellanox: Add support for new SN2201 system")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/mellanox/nvsw-sn2201.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index 0bcdc7c75007..2923daf63b75 100644
--- a/drivers/platform/mellanox/nvsw-sn2201.c
+++ b/drivers/platform/mellanox/nvsw-sn2201.c
@@ -326,7 +326,7 @@ static struct resource nvsw_sn2201_lpc_res[] = {
 };
 
 /* SN2201 I2C platform data. */
-struct mlxreg_core_hotplug_platform_data nvsw_sn2201_i2c_data = {
+static struct mlxreg_core_hotplug_platform_data nvsw_sn2201_i2c_data = {
 	.irq = NVSW_SN2201_CPLD_SYSIRQ,
 };
 
-- 
2.14.1

