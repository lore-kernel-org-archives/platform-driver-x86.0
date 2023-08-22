Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4D6EE49A3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:38:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbjHVLiy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235341AbjHVLiU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:38:20 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::61d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE78B10EB
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0R/zh+BhL+jfijD820c4K7IJezn4mbsZeayvG2GLT3+MUdSJxQTb5UOHdwstF1bgCwztA1jBxKZMVq8xL+lbFb0qtnUrzWbTJCAW4QhpVesa2R990meyjbhCtjGfmq3cKtQa5/wInuXNp3S7FcB1MY2imvecT+rkUQgMU4rtrdrFot67fjiM6BGgshxe9sj1Q3kD9pnriZEmYySYncPakRsxUCR4Ty79b97K7XACTlh0xSdsuJEuNbIoQsly76e4wAUcHqT8rNRb64CRYKHNzBXaPoOEUcA9s8rg0zg9RQ2SCvHvFu14MUOS+A1tTUN9E3Ya1+VrAJ9kx3K2K6VNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4yNlCOriH9zVe1v4p0DTxg4mvO4Mr6WJQPA+/WIcpQ=;
 b=aRWw0AZ54CpBFwL7vGmbyhWW5tzJmtvUZl3pYFKEkbxM+fB/+Fk7HFj/7Cj9Rya1bXYi/KVxM1tOvmKYReoRbDqE90GRxOwnops0nUQOosoMgZZl32bLf4qfJD5ZsojAyR1pEe4ll+q8UOydr5t77iu2wyLbJebAcTrA7TrUj0VSoguzMr26VfWLrDSjtdYEZ8gQ9cIzn3ZOwa6i036xlV5tHtM/5r4yqCzWatYghEapCExV//iN01ZpC/thCInxzFw0pZaFMTeK5H6GUgzM4oJbR7RTPWj5cpTq1T1vmoAW9K/ao1nbemugFLwwoBXrNK5GgHlbVw9dBaLzGwwD7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4yNlCOriH9zVe1v4p0DTxg4mvO4Mr6WJQPA+/WIcpQ=;
 b=qjIMANFqclfxpehNjORk9O0j8ZvTgPLuINnvGWK5S84tDe/p9wXHQ8A4dkkekW2nNIqc6aL+bstug4gg265ZYwKBL6YxCD44bzLLdCx7DH8Qh/E9+lY02BqoNHeh8Xchki7KZhM4NEz4dhAD2uOGq5dcx3ymlQoDjJZnxNXYjyk86xzGkw4gaeGdIzJ9wao8pVJWkBF5SZiV1+LE5THFbo0s5ql0v3vHAN/Q8siTHhLNZrtPaPD9MkkaGc8uC/1TMX7Vwurudxp3uEnl1CjG4XK3qk3YpXtVifKzdfYJqkq41Fe/TSijMYfBibXXisEeaH1QfbQ9Ps+ht2EHDQf1pg==
Received: from SN1PR12CA0084.namprd12.prod.outlook.com (2603:10b6:802:21::19)
 by DM4PR12MB5940.namprd12.prod.outlook.com (2603:10b6:8:6b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 11:36:52 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:802:21:cafe::8e) by SN1PR12CA0084.outlook.office365.com
 (2603:10b6:802:21::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:36:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 11:36:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:36:45 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:36:43 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 05/16] platform: mellanox: mlx-platform: Add reset cause attribute
Date:   Tue, 22 Aug 2023 11:34:40 +0000
Message-ID: <20230822113451.13785-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822113451.13785-1-vadimp@nvidia.com>
References: <20230822113451.13785-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|DM4PR12MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: c7067ae8-3607-4424-3873-08dba30414cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f55ee3h5oz0pvhWWq0H62UVbZ8jaa1RrmHjId+ObdgmEe82sx4U/BWGd9wG/70KcHIoImln28+WMGlJkfKc7NZrF++PbRtWx1nHSz5BKEW+zcwowDeqGAFc6gugetM0rE/cz9Wz0q8oYDlVh0hVlNtcaPbaSk+2Ki3VJGdn8Kk3wKVgQtBQ+vuGsY2CE0XSp/zWtj78XlwiY0kr/vDUWCcA+V/3tIRy5WQhMg72JRx4odunBkPyP7XRU2kZjjzURjrahu2YED3Yc0jmIkZnrGVXA8+kaFA4NkstVp7mvgDtila8yLK7aCdtRsRt/StvT63u6AaD7g7nl/A/gj5Oubl7pCLFeegGrk3RIfS24lubPoUipTQFJC0XOY8LaC6eDuj7Z1R6AIap5GxIS+pGPy4UHRtqUy3EXWaIfQ52n624o/zSjdX2lZGB7PoUzgTCWhgSgiz8+pqWu+KfQt5ccQCvv/loGVFpbamBZv0RzYbQj0eclFJx7/rDjTHShJ89N5gDzS4Fp8TzqwrJ1zH12+fvwU03BuaLrW7pyz/BtN4f4bGe/kkAypdTnjykZ8DsyAILi0KfgFalKDwv7eG/jSUeBXb8H/Rv9IO/njd8XjQqF/YpvAoML11aIT37xwKcGCLDiVpUqHPcIS3Hn9z1XITPdtxu9SvWFFSJ2+nmzu29kHFUFetSSpU3vBDxchbOrDCOmft9JZZuS2CKjdWvvYohofaN3H/HgK0xFulT2gVERPfZhxPoskwNArcBkkH7p
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(6916009)(316002)(70586007)(70206006)(8676002)(8936002)(2616005)(107886003)(4326008)(7636003)(36756003)(40460700003)(41300700001)(1076003)(82740400003)(356005)(478600001)(40480700001)(83380400001)(66574015)(2906002)(86362001)(47076005)(36860700001)(336012)(426003)(5660300002)(26005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:36:52.5775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7067ae8-3607-4424-3873-08dba30414cc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5940
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend IO registers description for some system types with reset cause
attribute "reset_swb_dc_dc_pwr_fail" to indicate reset caused by switch
board DC-DC power failure.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/mlx-platform.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 648b27eff0b0..8e07ed3dc552 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -3558,6 +3558,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(2),
 		.mode = 0444,
 	},
+	{
+		.label = "reset_swb_dc_dc_pwr_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
 	{
 		.label = "reset_from_asic",
 		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
-- 
2.20.1

