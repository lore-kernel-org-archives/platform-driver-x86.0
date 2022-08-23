Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77282C32772
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Aug 2022 20:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbiHWUhk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Aug 2022 16:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbiHWUhQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Aug 2022 16:37:16 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D4E4D274
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Aug 2022 13:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFyXFXawarku8mFnx4pdVtGFC9VmOx1kSAEG41Xa9mLDWhp/aEo8MUuUlWEeVf/R/uAmoTYj2cYPbha4j8TswJ6eGC6m49JXDztCZpwS3bDbYtC5F5M04A43Qq7JpXbQLu2KYVXhASxLKKDAEMFl6K7arYD18SQyCih6FwQasGV2H3cRleFctHHk4z/pq549VgxsMmw7vFQL6S9TFsieDOp7azEUQrOlRKMQpfIipXczt1i/2Wv5qznivslDX8vOdQ4I9vQXHTBplhxqi5h0kSk8QEzOqDdKcsqcmgaZuYTMDkKVdlPvdtlnsAEpBSHKZ+XdfzAs/LAkzoONwLYNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzBQDONeNvqLT9ncaCNppTQd4ueH/uLE64L728MJBJo=;
 b=hMMgVIgciQW0d/WqQ3sTHREKr4g2aXiSy0uQACo9w+xmFlSpLsoGayiGAUfCXZyBRjODqlmJlP0KsVCplXximeYQFQLEyskj7rGdjGsjp1Cqds5aYOlIh0cyGqYNsA7DCBBUvaD28tjXM7ddTaNrZ1vAk0JZTuzqX0GO6P7QqBBcVYVwvfoHhHo56sL2Dub64MVGA9o9P1Nu9KrvYZWHz48mik5fpW2tC4oEo10kJqI+Y6aps+l8gHp7jE9Aehz9KuPcJmiGJCYimvKsP1LdfiVVHYWrIXjTlEZiKlKBz4auOnkuTXXyKuRc273gFCJyqakgpoVZV+/bb0HjLZBIyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzBQDONeNvqLT9ncaCNppTQd4ueH/uLE64L728MJBJo=;
 b=OS9oQF80N2AKpvXAf7JrNcyqd5N1gxpqe0GHQwpvgmsQBWTY9jkjG1xNi+BGdE8tXAhnsh+KZYjfx1aJTGi4LPLjqfipppvbuddLRQq5Vq2OMxBaSHP8N1NDLIN/1sIurADgbi22MhiPC3o0CYIj+6Q/EdntjwcTT7x0olVvRd16OTaBHgPC2wTpY4wE6ILameKe9aFKE3RwJ9I7MWQK6dJGkF/qRKRL+Sz4nTFnHJFTCfZ2lyD02OgElbfRrmc0MYp6yfds6wkadCt7Vgwv5fFhFqpAQ3r8RxoKs66x2cbjtvBB70tz60BJdB2ALt97RyAy9AF63y/DYxRDHDrm7g==
Received: from MW4PR04CA0256.namprd04.prod.outlook.com (2603:10b6:303:88::21)
 by MN2PR12MB2863.namprd12.prod.outlook.com (2603:10b6:208:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 23 Aug
 2022 20:21:06 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::69) by MW4PR04CA0256.outlook.office365.com
 (2603:10b6:303:88::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Tue, 23 Aug 2022 20:21:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 23 Aug 2022 20:21:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Tue, 23 Aug
 2022 20:20:05 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 23 Aug 2022 13:20:03 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <dan.carpenter@oracle.comq>, <platform-driver-x86@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform 2/4] platform/mellanox: mlxreg-lc: Fix locking issue
Date:   Tue, 23 Aug 2022 23:19:35 +0300
Message-ID: <20220823201937.46855-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220823201937.46855-1-vadimp@nvidia.com>
References: <20220823201937.46855-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af032011-c657-4473-7975-08da85450277
X-MS-TrafficTypeDiagnostic: MN2PR12MB2863:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwzQVrlwbhewjnUQhzvVANW1o6clA0Iscgrzmhnr9X+fkAPN+u1VRwFe9c6Fa0+oxfAPSd1DlUIw/Y/sRXiDlpmlcmFDlzR5s6tAEZVxNcnlAywl2yoJ8nVw8dhIK6RWPSjMkEq9Ysog3CRmWsG+e8+5mdh3eFd9WMq2okcqeQC2tQydq+yanAmDt4kZM7YVVad3Oz/BMzirZNrXkas8YQsqEkwuB7yRyxOFwO8OsOukXZ357QZ0WLaaLyLRdE3KYt7eYXpiHmx9lsENrgZ2CzqO5tOsfVoI3GTBLMYP1oKZ5DoEfN+bb7+7kd3aaY0y/6cUpJn6pzj5fxMBPMsgfWndyw4ovaRmvFQBxj1gGw5TDlnas+CSnirLd5isBlstk6OuaADlFzZGKHghvoUl5fP6Zc4k9Sl7+EQjryT29CbcCSDiVOzA9gPP1jHQkl5zHt+Li41SOpeg354KOJ4s/sfvonfW2Zy9LG5CDtrt2QqhTtx8A6vwCMtk116VAhdQmrS+k8HRvSBDk1YyblTwURCLIqz9S7O7efClR7wpJSUVWlNGYxReGmRz/bk0z886YjsjgN5y8tuMGt4p0hWKX1s+gE4kBIs+bUiSfarNWA5PLuqJtK/i+BL6iIdjn8YOSWFMLg2gV5I6uT8X59fUyY5lNHVe/ElBxLY5CSS0EQRY/gIbbZsWCoecokW81UmyIKRsLiOfI0tVDxgkXiISP5U70X7m/0iHLKLgulbxkDq6VfyYZ8Rlsz1Jg/DjGQbgG0mt3R6QNeJiqRJSlYpxQkUw9otDzi9TSqy2+tsagM6/B2XqeSB4ecHQGhJvkTWJ
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(346002)(36840700001)(46966006)(40470700004)(1076003)(186003)(356005)(16526019)(336012)(81166007)(2616005)(36860700001)(426003)(47076005)(5660300002)(82740400003)(40460700003)(8936002)(70586007)(70206006)(4326008)(83380400001)(8676002)(82310400005)(40480700001)(2906002)(6666004)(41300700001)(26005)(107886003)(6916009)(54906003)(316002)(86362001)(478600001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 20:21:06.6030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af032011-c657-4473-7975-08da85450277
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix locking issues:
- mlxreg_lc_state_update() takes a lock when set or clear
  "MLXREG_LC_POWERED".
- All the devices can be deleted before MLXREG_LC_POWERED flag is cleared.

To fix it:
- Add lock() / unlock() at the beginning / end of
  mlxreg_lc_event_handler() and remove locking from
  mlxreg_lc_power_on_off() and mlxreg_lc_enable_disable()
- Add locked version of mlxreg_lc_state_update() -
  mlxreg_lc_state_update_locked() for using outside
  mlxreg_lc_event_handler().

(2) Remove redundant NULL check for of if 'data->notifier'.

Fixes: 62f9529b8d5c87b ("platform/mellanox: mlxreg-lc: Add initial support for Nvidia line card devices")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-lc.c | 37 ++++++++++++++++++---------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
index 9a1bfcd24317..e578c7bc060b 100644
--- a/drivers/platform/mellanox/mlxreg-lc.c
+++ b/drivers/platform/mellanox/mlxreg-lc.c
@@ -460,8 +460,6 @@ static int mlxreg_lc_power_on_off(struct mlxreg_lc *mlxreg_lc, u8 action)
 	u32 regval;
 	int err;
 
-	mutex_lock(&mlxreg_lc->lock);
-
 	err = regmap_read(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_pwr, &regval);
 	if (err)
 		goto regmap_read_fail;
@@ -474,7 +472,6 @@ static int mlxreg_lc_power_on_off(struct mlxreg_lc *mlxreg_lc, u8 action)
 	err = regmap_write(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_pwr, regval);
 
 regmap_read_fail:
-	mutex_unlock(&mlxreg_lc->lock);
 	return err;
 }
 
@@ -491,8 +488,6 @@ static int mlxreg_lc_enable_disable(struct mlxreg_lc *mlxreg_lc, bool action)
 	 * line card which is already has been enabled. Disabling does not affect the disabled line
 	 * card.
 	 */
-	mutex_lock(&mlxreg_lc->lock);
-
 	err = regmap_read(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_ena, &regval);
 	if (err)
 		goto regmap_read_fail;
@@ -505,7 +500,6 @@ static int mlxreg_lc_enable_disable(struct mlxreg_lc *mlxreg_lc, bool action)
 	err = regmap_write(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_ena, regval);
 
 regmap_read_fail:
-	mutex_unlock(&mlxreg_lc->lock);
 	return err;
 }
 
@@ -537,6 +531,15 @@ mlxreg_lc_sn4800_c16_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
 
 static void
 mlxreg_lc_state_update(struct mlxreg_lc *mlxreg_lc, enum mlxreg_lc_state state, u8 action)
+{
+	if (action)
+		mlxreg_lc->state |= state;
+	else
+		mlxreg_lc->state &= ~state;
+}
+
+static void
+mlxreg_lc_state_update_locked(struct mlxreg_lc *mlxreg_lc, enum mlxreg_lc_state state, u8 action)
 {
 	mutex_lock(&mlxreg_lc->lock);
 
@@ -560,8 +563,11 @@ static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind,
 	dev_info(mlxreg_lc->dev, "linecard#%d state %d event kind %d action %d\n",
 		 mlxreg_lc->data->slot, mlxreg_lc->state, kind, action);
 
-	if (!(mlxreg_lc->state & MLXREG_LC_INITIALIZED))
+	mutex_lock(&mlxreg_lc->lock);
+	if (!(mlxreg_lc->state & MLXREG_LC_INITIALIZED)) {
+		mutex_unlock(&mlxreg_lc->lock);
 		return 0;
+	}
 
 	switch (kind) {
 	case MLXREG_HOTPLUG_LC_SYNCED:
@@ -574,7 +580,7 @@ static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind,
 		if (!(mlxreg_lc->state & MLXREG_LC_POWERED) && action) {
 			err = mlxreg_lc_power_on_off(mlxreg_lc, 1);
 			if (err)
-				return err;
+				goto mlxreg_lc_power_on_off_fail;
 		}
 		/* In case line card is configured - enable it. */
 		if (mlxreg_lc->state & MLXREG_LC_CONFIGURED && action)
@@ -588,12 +594,13 @@ static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind,
 				/* In case line card is configured - enable it. */
 				if (mlxreg_lc->state & MLXREG_LC_CONFIGURED)
 					err = mlxreg_lc_enable_disable(mlxreg_lc, 1);
+				mutex_unlock(&mlxreg_lc->lock);
 				return err;
 			}
 			err = mlxreg_lc_create_static_devices(mlxreg_lc, mlxreg_lc->main_devs,
 							      mlxreg_lc->main_devs_num);
 			if (err)
-				return err;
+				goto mlxreg_lc_create_static_devices_fail;
 
 			/* In case line card is already in ready state - enable it. */
 			if (mlxreg_lc->state & MLXREG_LC_CONFIGURED)
@@ -620,6 +627,10 @@ static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind,
 		break;
 	}
 
+mlxreg_lc_power_on_off_fail:
+mlxreg_lc_create_static_devices_fail:
+	mutex_unlock(&mlxreg_lc->lock);
+
 	return err;
 }
 
@@ -665,7 +676,7 @@ static int mlxreg_lc_completion_notify(void *handle, struct i2c_adapter *parent,
 		if (err)
 			goto mlxreg_lc_create_static_devices_failed;
 
-		mlxreg_lc_state_update(mlxreg_lc, MLXREG_LC_POWERED, 1);
+		mlxreg_lc_state_update_locked(mlxreg_lc, MLXREG_LC_POWERED, 1);
 	}
 
 	/* Verify if line card is synchronized. */
@@ -676,7 +687,7 @@ static int mlxreg_lc_completion_notify(void *handle, struct i2c_adapter *parent,
 	/* Power on line card if necessary. */
 	if (regval & mlxreg_lc->data->mask) {
 		mlxreg_lc->state |= MLXREG_LC_SYNCED;
-		mlxreg_lc_state_update(mlxreg_lc, MLXREG_LC_SYNCED, 1);
+		mlxreg_lc_state_update_locked(mlxreg_lc, MLXREG_LC_SYNCED, 1);
 		if (mlxreg_lc->state & ~MLXREG_LC_POWERED) {
 			err = mlxreg_lc_power_on_off(mlxreg_lc, 1);
 			if (err)
@@ -684,7 +695,7 @@ static int mlxreg_lc_completion_notify(void *handle, struct i2c_adapter *parent,
 		}
 	}
 
-	mlxreg_lc_state_update(mlxreg_lc, MLXREG_LC_INITIALIZED, 1);
+	mlxreg_lc_state_update_locked(mlxreg_lc, MLXREG_LC_INITIALIZED, 1);
 
 	return 0;
 
@@ -904,6 +915,8 @@ static int mlxreg_lc_remove(struct platform_device *pdev)
 	struct mlxreg_core_data *data = dev_get_platdata(&pdev->dev);
 	struct mlxreg_lc *mlxreg_lc = platform_get_drvdata(pdev);
 
+	mlxreg_lc_state_update_locked(mlxreg_lc, MLXREG_LC_INITIALIZED, 0);
+
 	/*
 	 * Probing and removing are invoked by hotplug events raised upon line card insertion and
 	 * removing. If probing procedure fails all data is cleared. However, hotplug event still
-- 
2.20.1

