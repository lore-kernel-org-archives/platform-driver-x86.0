Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37435ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Sun,  4 Sep 2022 14:11:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234284AbiIDOLo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 4 Sep 2022 10:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234115AbiIDOLn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 4 Sep 2022 10:11:43 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA79F32B8F
        for <platform-driver-x86@vger.kernel.org>; Sun,  4 Sep 2022 07:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgUhXuhuqib04pMRnqVkgkQcpVDQXfsSoyRzdqqGx8U9EKZbW7gj0d7uzeJ7XofXUnoJW+WXCSfrqtIOin1l/sITAPALzau8wJD3KiHvNGwoBQnHt6qgTgrx1oPdFzwSAJ4FhWzIPZlCkMzFK0R4eyU9mavb9mSMG28KU4GC7aoFtLdK4hqhIE6fRHBisOrDX7sFAK/bXPNz6JgYmQN/LI2ix9KoiQMKgxTr6kFo8h8Pz2fMQRjvcReoXaQzGwFk7uMsDuWbiCnSdqJZEwB9QxUIQ/I3IJdu2Mlvulq/iaR4bVInodhKiBiH3Uu6xmiyIeAnw7gWkhyn7bPJOkVrLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQ8DinFb+lsHOKw42G4HQ0/zqtZGLrK8f2tXOCg1MPs=;
 b=G+gPzl1qLaWYovWcCJa+UtM+PIxiTCilwfHgCgbVsx99dGWyPdROPXFvggybjBPkwd+06ujJKfN1EIvS/uxzDh6VwiOg4WfiYW0AAVbgNbccwfHgqMeXLVtdAUa8OwKrTqCHY9IlfLwJSd9t2uEDtfMXayfxB+OeFj7JRP5nbLrWy36P7rCNrYMgzbxmX6sXPbXzsqazamcSQn6Z2GgHImE89HU4IxJH4wgFFiA+yw9pcjcLwO5imHhWRG9WhD99LjvKlDQZS13tpVU67HHKd8veL92x5slgjGuXaqTt0999V3SsXWQ1ch4By4l9Jeb80nwMUvNWoGrbVy1/1zStUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQ8DinFb+lsHOKw42G4HQ0/zqtZGLrK8f2tXOCg1MPs=;
 b=Wzl6EetgVpKVb5FvXknZ5dADhcUOL6uZtbM+RFG1iI6gvLop7LbrTDUv9w3Lwgd+hgO+KzT/UTTYjOj/MCJwLU4FSAz5o4ScicRzef6dHZA+SBCGVtgDwz+5Y3HCpEVf3rk9B/BG67aGGETjuYYym3gkV8qJkgVQV/DIQrTvzk8yoYQNSZmd5IzvDKnrFJE+zDjpAaU9Bv+YqHqJoBLDeNqb5g8DrHU6Xcw/5Xam59VR9RpeM72u+08Xu5p4leo/JN7mbnghTpveuKRyVk4obHQNm8j71APVv6KJOQPt+7cTZFnVTAOCN0NhSCQHbxp3YkegyyOY/WTxxyXrVl+8dg==
Received: from MW4PR03CA0274.namprd03.prod.outlook.com (2603:10b6:303:b5::9)
 by MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Sun, 4 Sep
 2022 14:11:40 +0000
Received: from CO1NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::15) by MW4PR03CA0274.outlook.office365.com
 (2603:10b6:303:b5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14 via Frontend
 Transport; Sun, 4 Sep 2022 14:11:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT082.mail.protection.outlook.com (10.13.175.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5588.10 via Frontend Transport; Sun, 4 Sep 2022 14:11:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Sun, 4 Sep
 2022 14:11:39 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Sun, 4 Sep 2022 07:11:37 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 1/1] platform/mellanox: mlxreg-lc: Make error handling flow consistent
Date:   Sun, 4 Sep 2022 17:11:13 +0300
Message-ID: <20220904141113.49048-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c760a241-7af0-429e-c226-08da8e7f631a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4175:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rjEeP7UwKfBwrMMp2eNNu6bWDg0QKM59CvAsfStGw6uNdwkw4kE1pTfEc4K0J03D4IsA3/3CcUmu0Epl5V0taQ5Q+2gHxt5xD0YH5jXvcOASPDCIg1S3eJvQTPWcUNr3HIQd7yh1xz8mhP0Y6qXFT7k+WkTFmSdobzl65GtCSrrNgkvet+j5e3CMbcD4caau39luSB1nUu3Ou8kX5ETcMtSS7HqY6YK7jZu8I4u+/bKaG7pBTDAFBElnVVw5P8J9fJOJ15jMmYy32dPa8Ihebn2prmkTS3Xj9pK6wAt31XvaqCMOtePGP4+URH6PN7G9S5ny2LNwZ8+zp84skcFH1qTaiGY4iXYxIPaGwGTZvnLjAbzQnzmnDjHhwHT5I0HrEKPGFI5N41qkSEZYwdj9xONSEKDx9pinFjl9IP5eNGWETOgDorwLjBW0Q28W4w+VGrBhtRc93vjizbuV/WXondvSFcoV/eCdNQQLYvkyb3di1YcHLpcKQC3y9YBy8YnELpFd+lL+TtEQL5bCwUWAS7BuWO0EHROq6a8R/6H760L4pvxjjS9GNdoDiHDhUkPrg9eIobk2+z3mcK74m7UbMCGDAiCn8W+C3psJpwN641yimeE7mcK/B7vPLOJ2Opt9Pc43XBvvqFuNNm0VcYhWQ8xuWNLqsXwG0A/WmA8mQibv/BKEH69NJAGWOnxaFIxU3gMj8aMGbV5951wO55A3/yw1lomra8oMDgvtw5C/0z1/xeyJzpT0LafUKD8BTGHaBclpffq6vTpI9TVjFN550Ov5/ix84raItGBLNQQXxbZM1kZLeWUfHQurbV4gB2KtCi6UALpcWsA5RLYQIrxUsaJlzf05Ez1I3hnmMViYgjoU/HQAcA4CD0wSEUj3BY75
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966006)(36840700001)(40470700004)(40460700003)(36756003)(36860700001)(478600001)(83380400001)(8936002)(47076005)(426003)(16526019)(186003)(336012)(966005)(5660300002)(356005)(2906002)(2616005)(82310400005)(70586007)(8676002)(41300700001)(81166007)(54906003)(4326008)(1076003)(26005)(6666004)(40480700001)(82740400003)(70206006)(316002)(86362001)(6916009)(107886003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2022 14:11:39.9785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c760a241-7af0-429e-c226-08da8e7f631a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use 'goto' statement in error flow of mlxreg_lc_event_handler() at all
places for consistency.

This follow-up patch implementing comments from
https://www.spinics.net/lists/platform-driver-x86/msg34587.html

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-lc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
index 1e071df4c9f5..d47fe22080e6 100644
--- a/drivers/platform/mellanox/mlxreg-lc.c
+++ b/drivers/platform/mellanox/mlxreg-lc.c
@@ -564,10 +564,8 @@ static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind,
 		 mlxreg_lc->data->slot, mlxreg_lc->state, kind, action);
 
 	mutex_lock(&mlxreg_lc->lock);
-	if (!(mlxreg_lc->state & MLXREG_LC_INITIALIZED)) {
-		mutex_unlock(&mlxreg_lc->lock);
-		return 0;
-	}
+	if (!(mlxreg_lc->state & MLXREG_LC_INITIALIZED))
+		goto mlxreg_lc_non_initialzed_exit;
 
 	switch (kind) {
 	case MLXREG_HOTPLUG_LC_SYNCED:
@@ -594,8 +592,7 @@ static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind,
 				/* In case line card is configured - enable it. */
 				if (mlxreg_lc->state & MLXREG_LC_CONFIGURED)
 					err = mlxreg_lc_enable_disable(mlxreg_lc, 1);
-				mutex_unlock(&mlxreg_lc->lock);
-				return err;
+					goto mlxreg_lc_enable_disable_exit;
 			}
 			err = mlxreg_lc_create_static_devices(mlxreg_lc, mlxreg_lc->main_devs,
 							      mlxreg_lc->main_devs_num);
@@ -627,8 +624,10 @@ static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind,
 		break;
 	}
 
+mlxreg_lc_enable_disable_exit:
 mlxreg_lc_power_on_off_fail:
 mlxreg_lc_create_static_devices_fail:
+mlxreg_lc_non_initialzed_exit:
 	mutex_unlock(&mlxreg_lc->lock);
 
 	return err;
-- 
2.20.1

