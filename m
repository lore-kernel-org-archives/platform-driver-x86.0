Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E9EC04A94
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbjHNUgx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbjHNUg3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:36:29 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44035170C
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6kVkTk/HX13AfS2QUvrkYmXI/T8kknO8wuOf2cd8KekEzuh3nP8jz5fJAhtJsQBoys1zyw9pP1j4YKHr3csZaM5GhjRYyUEucRdNFCFVLygcFHBP5Wvrd8RCSOHDErTjtvRbwhrR5BONNsBmt51277GpHfoWRTE8e+GFCUN2jzLxKXUhBALXf2/3tkGzXgVoY+mImUkFCtRj0lCQ3qGEXoumMEpSvfZCQhWWpNtAZf8xgiatiK7lvPAElKImGWj/ahN6uTg2UMUpK4kxEmphY2WjXkHg4fJ201GjmU4sef3/751GNLVsMjZu0X8/kez+BOdl3HIABBZfp1/Ug3hlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CKKGrcQfrKyBE0MRiV+0VBNQwq+o07X8knh32JM3nQ=;
 b=h5NW8cwrJVzBh4y4NU1Z5WougVfj4s6J2YNhuPlsmletumtHfQKeJBnRcjduRRdxzRg79nXn96ZEk5FxoEWPPWLy3ZpTU7gvbm4toC2+GtR/ceKPYvlXf2MSOH6eCiIxy2d2orklqjUA5XCZ1k6QROe1EJ8vTQ+FPAMRLMDdUNzKEDoqOMZRiQhDdAnW+3tuOFid75pJgS+WUZKIisfD6wv1avsVVVVos3P1wRlz5qSfgZl9Ej5Dhw16HT8FpKtL08hLU8byLUW4pjRNZGoaSk1r2iqqsdxLzO0veXLkbG5Mz7Zo2JzgfqKxHNx95+ZxxdPWJqIeMPsd6vzZBngIqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CKKGrcQfrKyBE0MRiV+0VBNQwq+o07X8knh32JM3nQ=;
 b=EQRjQqhvQsIg6aRQfoU9AQuM/FJDsmN3IzCk2qI38qfy3bBTdD1ZH8TimkOBjjBFm1w4GvvqePtQXTVK4tjzAOVGCcy3Po8HgsSpbKTAAd3TCGnMZhuT4uso6rzHjzozTbFMMi4vzaPJg1VuAPtBx7wzy36XdegDG+Swl+zWrD1J2+1BCjI960971am52KF+5tkE7H0SFALa4pxDU2lHKtEEC9rfutQyA0nLKWrYxyMdxNBnXwwSMwl0Vpslf3EcWTU6HQGs4YRk9f4AoSajH1dbm46JN1wtq9GfCHOB2yD1Ejt26VO5+U4aDoU1gT9y7jmQcJQ9TOvTmxBSl5mZ0Q==
Received: from BYAPR08CA0006.namprd08.prod.outlook.com (2603:10b6:a03:100::19)
 by CH3PR12MB8711.namprd12.prod.outlook.com (2603:10b6:610:176::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 20:36:26 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::e3) by BYAPR08CA0006.outlook.office365.com
 (2603:10b6:a03:100::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 20:36:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:36:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:36:09 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:36:08 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 07/16] platform: mellanox: mlx-platform: Modify power off callback
Date:   Mon, 14 Aug 2023 20:33:57 +0000
Message-ID: <20230814203406.12399-8-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|CH3PR12MB8711:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bdae684-a31c-48c3-7f76-08db9d062120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 92779rYFnV11tDBDG5jV5c9clSMi8TCk5X6+ALlh/w9wJjhu4+cr15xnLx1uBUcpAX/8TEWWMfCrkKqWNyJ8DBQn0Bws+xxgYnyTh3i5TlBauErfG7SERxzMXJVRjj4kBQXDFNfikmsqACyaTnzbR5FYTXi7iogGtQD6INlVpoikm/+0zbg/kzoftl6uaZPm9wC+MQOeFHHV+6qGRIkNbv0kxWFNmr4HrjM7RjJ2clZQ/unQubqsKthE2v7KJWnrAXISxb6fMdlWLXxvbNNSMPXGR4Xt5qy6RHm+OLap7Y6vY2eOaKgkuYH+Nl2CoInC3pCAtuTEXLvnmn48m1xeHO+0+8PCE+d3IZi2nzHvA58C0F2p68MYDQOzLBjp6E3HKNFsq5xucslGa5NdE5XjRw68tr/tRAWYgE9xZG3wbPimfoz2Ky75aZI53zxqi+sTQEgj/Hi8DQ7eemoTKPsoXhifVECSwCs8O8Llo2jw2FL7mJQW4bK8nZpXELgsoLu4n2YVvRzcj1tAUhEJtYR/LzsTmyvH9emvinEU5MwiHgGbaP+HXHDYnR2Z+vZhkZYmiTsfBGu8MqWsPwqBdIwIdi9EL4DoZ78mpOL7pU6GeAhGVzBsOdiWkqOLzMfxqbEPwCiYZYwKYhdMGI3QPsM1YM70a4pMIsx8a0gtqvYbyMxwi70+9C497CIQv3I323amlJIaQNR0uevJpRj8tMwR6RM+NmD7lrUjhWDY3vpS6+V8QjUmfk0gtOodtQLPadvs
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199021)(186006)(82310400008)(1800799006)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(356005)(54906003)(7636003)(478600001)(86362001)(6916009)(6666004)(41300700001)(82740400003)(5660300002)(4326008)(70206006)(316002)(70586007)(2906002)(8676002)(8936002)(107886003)(16526019)(36756003)(336012)(26005)(83380400001)(1076003)(426003)(2616005)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:36:25.2793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bdae684-a31c-48c3-7f76-08db9d062120
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8711
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend platform power off callback with kernel_halt() call.

When powering off, the process involves setting a halt bit in the
register space, which is then activated after a certain delay and
power off auxiliary power. By invoking `kernel_halt()` within this
timeframe, the intention is to facilitate a clean system power-off
sequence.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
v0->v2:
- Comments pointed out by Ilpo:
  - Amend commit text.
---
 drivers/platform/x86/mlx-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index dce35934cc37..a505f619f337 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -5539,6 +5539,7 @@ static void mlxplat_poweroff(void)
 	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
 
 	regmap_write(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET, MLXPLAT_CPLD_HALT_MASK);
+	kernel_halt();
 }
 
 static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
-- 
2.20.1

