Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3A2EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235737AbjHNJIm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236681AbjHNJIJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:08:09 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24C335B8
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkhFNoTukVz4VicC+FdKKOfFuFcnxTxuJeFj5QaUUknF2F6JMgl/LMKbi6DN80DCBwexZCffjd8oGIN1tF5gaRo5jWIeNyd5ZofMLiu6MNdHX1toKkhh8YOQLcZODqWCR/kiOsiluv15FxBA7B6ke67Qf6PEQf4khgCxciVXxCzmA6qNQMIIKYFlfC3GAzUSPcpD/zBZ1B662SiKRsLRpuS4Fki41V9MovD8HtOXm4FTeAMRguTdEMXMxYIHZExHZv6dgmwiGavJnnMvX7dKHVUUUyV+IWOlCor52Ab1SKloMwhQXr99ZWZaCPIxhzsnmv+phx5IPHm9XI198baZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAi8Kkdm59FIWxf1eKWymBH92rg7i5TDcMGVZaqsMjg=;
 b=WH+eMHqfai+/j52JyXO5+NXEDriJnarCj3Yx2CQqUvY5jl/aOk21kWySrLrhLHrOcMXGqq82i5JvvSFVesjrk6S7rRZUWrWhF9th5YhyxRNZkLBa78HHvXGOmi1DenkevnAFFMCbIjPhzaHdQAHTHOFsrmNEFup33AxYNB4Mx3wGzY9f1djOtNOrRPbK1CQdGl6QXBZvv0hM0+nWLBBh49ynkPY1MXxFTaBLgvSaCMseKcRni5pTRKKrYyI24Zr/02c7yXR725yXcyBi2tDSYd8UjNs5LydW8edm4lkYIvIgqvrgvy9FTc/1qvfhiXnbU7EELR2BRcx3xx5caf9sUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAi8Kkdm59FIWxf1eKWymBH92rg7i5TDcMGVZaqsMjg=;
 b=AAVDGc+irRlLMEmhkEbFYI5U9hgCedi/6sHlkYan3xGtRNjXpxjSLmjJl9iJb0lUOuBccKDdt1ZY842SmRVSmP1xmyArPtwRe5JACOPzxA0OuZ/ued01kxtTQ20SXm0YV0SZLzyu/hcUXfzbWND0758CudUNJerdYouGjLM9VL2WHd+/0DrUjKKzIDKV0AM2kYszZfB7cgKOnS8HUjeYXdp0BAO0zx3g6llzfgNzxCELGSuCxaup4FB3fhnVByFLowCy9AOvstFJkDCN2NlmLTqbkueIZTxPfP6R0jPkEyN6pzwAPnCz71imrVYhPI/hJxY0kNacAkVLPspdZm5Pvg==
Received: from SJ0PR03CA0344.namprd03.prod.outlook.com (2603:10b6:a03:39c::19)
 by SA1PR12MB8644.namprd12.prod.outlook.com (2603:10b6:806:384::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Mon, 14 Aug
 2023 08:59:57 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::68) by SJ0PR03CA0344.outlook.office365.com
 (2603:10b6:a03:39c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 08:59:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 08:59:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 01:59:42 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 01:59:41 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 04/16] platform: mellanox: mlx-platform: Modify health and power hotplug action
Date:   Mon, 14 Aug 2023 08:58:58 +0000
Message-ID: <20230814085910.56069-5-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|SA1PR12MB8644:EE_
X-MS-Office365-Filtering-Correlation-Id: c54f93bb-4464-4b87-4aa8-08db9ca4d502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E2VzENhElnFCBE/orYXtUbsSKDDxXh6X7esdqC+WTVswF/+tU321ES5CpdhOzrhRaKyYGbZuVHo+QfKc8Z4IAZSzYU/rIcIJ6khzvPzxa9SptjBEiNldD+4692QZHadZmUNBsG4TG/rtWd5pZFO6jlE5nAZ4Ow6chevH+juTuR6gymAJ6iyBxPC7X6QTaAIEWWmbKEifG6HNOaIc3SUNXVk7T4MOIwuLYfK1xK1D1DYxquzl/vHO3aKNYMJVzmPZgbV8/sEhO/Usc6wloSO0A7OaNpSxK0jHArVV8z0imqu4nN16wm4mtJDGefPFp5JnFN3O3HVIFZBlSTS1xz/1gwmrK/B5jx84cl4YTmOtl9cF17DCwk1zftMkT0NI09yumdX7X67KM5JRqi7i0xwHb4EzgEb7cFj3H7v2ffWDZhtsoVbEGrG1DcnRIn74cPjU2YLq8HPQFnshuF/iMZuK4QgDuTqqgc/Kyb+jlYkjQNO6Oc+gK58x1Nk6IRmLzUPAO5BdxWBzBltOYk2hBZitCis+Az79cNouw/eFKqA1wW77L3VR2AJoVjOyQEHpEbRuWIvnu0yX6g2ZLeuM8lYyyAswA7JqBzRNZ+TA69+tsqTW242EJUfkISwfimoKLiNMzzbGqlwKkgbfEv/XsRTAUZuRs89AlV5TZB7L8yF2hflZNKY7Of0t2nqdZnqGiy1QXhcFgOdAxaxbXVzvGvZHeKOIgz7DEOuUDxVX6xX8X4JjTBBBdnIOZt3QmqTGzTvgCN6/adLgl25hxqlFBGMHHQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199021)(1800799006)(186006)(82310400008)(46966006)(40470700004)(36840700001)(36860700001)(36756003)(16526019)(83380400001)(426003)(2616005)(82740400003)(107886003)(1076003)(336012)(26005)(7636003)(356005)(6666004)(478600001)(47076005)(5660300002)(54906003)(41300700001)(70586007)(316002)(6916009)(70206006)(40460700003)(4326008)(8936002)(8676002)(86362001)(40480700001)(2906002)(40073004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 08:59:56.4386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c54f93bb-4464-4b87-4aa8-08db9ca4d502
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8644
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Set explicitly hotplug event action for health and power signals for
L1 switch as "MLXREG_HOTPLUG_DEVICE_NO_ACTION" in order to allow
processing of notification callback even I2C parent bus is not
specified.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 5b0579752afb..648b27eff0b0 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -2373,6 +2373,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_l1_switch_pwr_events_items_data[]
 		.reg = MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_BUTTON_MASK,
 		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
 		.hpdev.notifier = &mlxplat_mlxcpld_l1_switch_pwr_events_notifier,
 	},
 };
@@ -2433,6 +2434,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_l1_switch_health_events_items_dat
 		.reg = MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
 		.mask = MLXPLAT_CPLD_INTRUSION_MASK,
 		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
 		.hpdev.notifier = &mlxplat_mlxcpld_l1_switch_intrusion_events_notifier,
 	},
 	{
-- 
2.20.1

