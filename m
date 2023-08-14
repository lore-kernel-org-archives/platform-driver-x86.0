Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE80C04FDF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:39:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbjHNUic (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232459AbjHNUiF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:38:05 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA40AA
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYLdeNZ9UaHuVCiwzAb6fyia8EnW1CR6HQS2BoDlsLyEMOV6ntrZ/Kjzi222VwnL2WZwcop+u6UPy9RUNRyGPPpgdK32It8T7iJRbqvB5OP/zBiw/6E+9hjoB5KeBNQ6WF2jYZc8VpdV4s4yoImNSRs1gx7tsE6LvSjeGVlwbNqfv3RpiYsLjgD5E7vaLUxK+qH1yt4TPobdKgvUN7GhrC6Ma9TcLZnzoeo7iQiohSeaPkVL/lmk4aiohwV/4UVYovyIGCJ0/1mDsZGDhxhozO+gLASIxJdwryRVBrpHQJXu3rQvw9z5Cdb/4bzCuhjfV4NWID0reQu9+2U4eVmyKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mv0S/XhvKsXZlu9CtjytXYXccCQ/UPrRPjuylW54Dpw=;
 b=mcEA2OhsvaolAgnTRvmcgFgi6niKaG4nCjsLa9caDkDyHmGyAgzKwfSds73ftpKXnwW1wUxlc4lKdjPYVrkL6J+93gQfqhTM5woagrtoQoYrUD/GkjprKNm8yDm+0XeXd03wko2qkwvZPYOskKDwgBo9n56fQkwoOY4wxLkcZXz8xku9aRPH0yY27GVIb6D2SwrmnVHA/k06x0i9YfskYBXKNe5FQG4KXV/UQXXpYVQOXZIDP1kd0nPUU1pjJnCNeKe3C7902wJe7U/ThXTb7KS/tGN0ibAQWejyVml9Rj+5t0yvdWbLv4X8qoGxJX3VtmRND4gOAnw5b1GyYJikng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv0S/XhvKsXZlu9CtjytXYXccCQ/UPrRPjuylW54Dpw=;
 b=Gv0D7gF7CQ557/rqzBmAj3ZNfoHruYu+JLWTVV9ukGFykhs0gVee3TbFartiX8foX7P1M6QXwALTi9j2kpecVJIKFcw3L/xpMUgXPGwNAxLVamDkh46jKudfB4GRgXuFB6NyLGtR9Rwsi+GP56rW+IrkPQWO7g9ApIN8wodo8kVwzI9UWGH6NW9PD5VmEMcjjVCR05JB0EYslcRFoHw3e+I3VUncxxRDh5PU1VKYUsrVtMKVa+BoAp+nRz+FgJ898PAgkY/g8lxdmKwKHwhZUQUsHT8Nuj2YOmYnvL24/fycpm5IWsc3WtYCs645GHr30SStbvo8x4wkr13xzYYXtA==
Received: from MW3PR05CA0010.namprd05.prod.outlook.com (2603:10b6:303:2b::15)
 by DS7PR12MB8230.namprd12.prod.outlook.com (2603:10b6:8:ed::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.24; Mon, 14 Aug 2023 20:38:02 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:303:2b:cafe::44) by MW3PR05CA0010.outlook.office365.com
 (2603:10b6:303:2b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.13 via Frontend
 Transport; Mon, 14 Aug 2023 20:38:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:38:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:37:49 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:37:47 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 14/16] platform/mellanox: mlxreg-hotplug: Extend condition for notification callback processing
Date:   Mon, 14 Aug 2023 20:34:04 +0000
Message-ID: <20230814203406.12399-15-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|DS7PR12MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f47c070-c952-4c5c-bee4-08db9d065b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FkE3I1uRx1mqC4T/acFFeX569IlDdYQoyZcTc/IWqB74gUpEhBlbYTrHKe4wxtXt/Vl+sPljo9SgXuUyOJDxPxzfLMRybG3XhvrasTvUPVUEKMKKnPOThOslS4rEqSRukUcugnCu4hV29VnvO35oPT9FCANRwo7Jn9aiU7uONeABTIviEwGLliNeZxum++gPimSBl1Fv6ZaKk1Dw6sti11x+oaIAIDMF76Z1UbFC4oimN4MbRZy352F6Y0WKgjAL63rmWaFYdlDUJPwgD42uB9Xf3sxpnuntbMoueolKQEQZHu+p/srPvUKw8vNacut5zZq0Up+Nmp4Hpy+72zrKICWeJlnRB8FW3zp8mOQL7LREJzm0MECYtezN1ys9Qtb6qe/B4JeUoACubZRDNkj6jusNi3O4ru4xCFlCmHOUSYbNxz1inxifXOeilEp6T3RSrRDEVZEh87CdMC74J49VvAIrmzQLFjswoVDnpASFY6UKWRfS+/NomdNkJT5NW6pwtvc9hd+QmhUujspOPvnt/OWY5ygNqnxHST7dp4j+j1NLBwjtL/tgGgIgjCvlzH5N+skJx16Bi2x8CStB/tZBBqfM4x6ZAb1QMC5KPe9SngKicEpiGjTZ1nqixNcmYn0SEGc+20VbOepMHIC1x0Emm9qm+ICsyPJdiY5kjCYUfh0z+FtsBmz69gulFyAT8zRtRj0q3sbumHGOwT5boqtw4x1bPOUK4n3N9aeQjHWoG7VR/TlCyXptoGWWf/fxuDTV
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199021)(82310400008)(1800799006)(186006)(36840700001)(40470700004)(46966006)(40460700003)(6666004)(70206006)(70586007)(478600001)(47076005)(36860700001)(16526019)(86362001)(36756003)(83380400001)(2906002)(15650500001)(40480700001)(426003)(107886003)(1076003)(26005)(336012)(2616005)(82740400003)(356005)(7636003)(4326008)(316002)(6916009)(8676002)(54906003)(5660300002)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:38:02.4587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f47c070-c952-4c5c-bee4-08db9d065b05
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8230
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

