Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3C2C636CC
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 06:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbjBHGhb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:37:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbjBHGh3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 01:37:29 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E000F30B22
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 22:37:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kK24M+9woL/JhO+pIReYBSLMEJztfezqnNMed/7Ra9AiOmqa4+NGGj5xcQ6hZo6CV/RFt1WZsdEyIV2njzMkZfRYryY1SurbCvNjyRYU0gxyFql7Pg1NgDrmGXfB8Qg/sGdgeLSmgBW+PZzwSgm46i06G8M/6J5+sp+nMKO69WI0ttMiKziXFT+MVn6sfjpGcnu6HPF0hgnbxJfTrvxt39S2x1R01C9GbkW46DnXQ73nqTArq/ahRWjtZddAsyL/TWeu0cOmZ9LU0s7rJ9+BdlmdSKCIL6gQ1Eyr5JcukSaS2mPtXV8hRkEPF7nfgneKqdOs+iHJhExG6MbeW8hGaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWbLZoLhynsG7csh7b9ltJx/CSHw0OU8tlaYF9dKozM=;
 b=lqjOk1G8vz6IVbZ4LzvcZYXJPtBrp48mtQo94CwYDHzM049PYBybfeLn4oVfYQn+rAFUp1ZzAFxsebhv7UO0hP3DQrEvR0An+NgVLSx5b3so2Wmf7bzpRBTAtcQWQCz+mLs8cMkJ4bm0W2UCr3CYhsHBz7QMJankKY1E80psj9AqffJdhjBG9B50c4kR/xNFS8EmSIEGkNdjScY/hF/JXlN5zTbJFe5OXfEoWChIeI9hzRqlPGDtWCUiz1CfX9kLkLk8O41Dp9EQG60Dn2TuuLEueC/DDZ648tQ7snJ/8QgvlypzQMHiOMq+Vy4M5ZnfD6VZ+Rc0nkmoRVaEX2uaYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWbLZoLhynsG7csh7b9ltJx/CSHw0OU8tlaYF9dKozM=;
 b=YjjChgQVM2Y5LbtIxSO/qwCHNKVy80KbpIsu1dYVTEQremfz88rUssNNyPwkSMNc5ltl/ZJNMY1uoq6kvgxb5mdfMmU0egMpCqrl5c5q98odxFl7gI1kRBApQKYF+EwVcb+MedOt43yd2P0tVScYG/x83kNaGA92HGdkAXTg3aqb9fOY0b8sKAeIqI8C6fgHEYO/gUn7lyvFAV81xo1LcBvOy/ezvsq83Qb0jm4GGHAQEecihHe0rAXJhG3DbMDu70AhVlA94fGZh5kgolfZSRKZEBTNHejhk/6pOkMFXyyJSDx8z6RyYnoo9Ci+S0Kia540RSznUmA/KN505FDW7w==
Received: from BN9PR03CA0063.namprd03.prod.outlook.com (2603:10b6:408:fc::8)
 by IA1PR12MB6579.namprd12.prod.outlook.com (2603:10b6:208:3a1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Wed, 8 Feb
 2023 06:37:23 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::6f) by BN9PR03CA0063.outlook.office365.com
 (2603:10b6:408:fc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 06:37:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 06:37:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 22:37:10 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 22:37:09 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 10/13] platform_data/mlxreg: Add field with mapped resource address
Date:   Wed, 8 Feb 2023 08:33:27 +0200
Message-ID: <20230208063331.15560-11-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230208063331.15560-1-vadimp@nvidia.com>
References: <20230208063331.15560-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT067:EE_|IA1PR12MB6579:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d2fa4e-2fcd-41f9-5055-08db099eeff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cTIe1hUNZUj/3THeB6sLottpU4RcnCSw+sCg/e01irkRT+BUa6EjMmhCxGav7A+Eed4ezv0/b4KTrZfHqGiVEHiq8ZZ5LNyEQaeW/igQBmmiDkoUi+b10810pu6UR1s/6OFYZ76mNdB7nbJMGwqIY5YARjTbLWenxBbYclxwYOChFZQdKOYTCDMFIcHjtInFcBK+NCyv0zd/UrmBXYQY7+WAwoxmGIqFP8ztv5kbxf4Gw1hQ2TVEubL0kGxYCxlH3Nk4LtlP9ssSJ6eYIl5E0WbYJwrwSXfs6ym5E2bWQ9W+NStxK0eTK1hB4s04y5kcS26t1ih7zqYT9ICFt02XDuGABPmwpux+HmRFMxKbH6V1kRAhvbfMvT6DqLx4aSOb8h2lsJ17ZaYF9zmtnfD9ufJuusQU4c9lqqlAUrQmb28onZtrrXr5JLbxVefL/6GsMCz26qkNk4dvB4CQu0uWGiAWkt4MZ554b+C2u7CLHHfc/K3JOK53U0AHx45vw+AfOuc7xA0hPV9aSJxCz0ZzBXc/EqgS+e0ZOdIATmu8eq57GA8Ap5x/6v2Xa+5o6u9vqd0VVrpaeAgzhCgVWQP0QDZnBmmal+Itiprziq+XR/whOdGfcTJ7iF+Asi/xxeVsbDBB9v8SS9/nYhOHkoa4MDekurnZ/RVpXRSy3iyM4m+RnNonXWTH6MSqdshxoXXEXTovm1Vv9qRfn88ee62pQw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199018)(46966006)(36840700001)(40470700004)(356005)(2906002)(36756003)(47076005)(40480700001)(107886003)(83380400001)(426003)(336012)(82310400005)(54906003)(6666004)(316002)(82740400003)(478600001)(2616005)(86362001)(26005)(8676002)(5660300002)(16526019)(8936002)(70206006)(40460700003)(6916009)(186003)(4326008)(41300700001)(7636003)(70586007)(36860700001)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 06:37:23.6405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d2fa4e-2fcd-41f9-5055-08db099eeff6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6579
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add field with PCIe remapped based address for passing it across
relevant platform drivers sharing common system resources.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 include/linux/platform_data/mlxreg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index a6bd74e29b6b..0b9f81a6f753 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -216,6 +216,7 @@ struct mlxreg_core_platform_data {
  * @mask_low: low aggregation interrupt common mask;
  * @deferred_nr: I2C adapter number must be exist prior probing execution;
  * @shift_nr: I2C adapter numbers must be incremented by this value;
+ * @addr: mapped resource address;
  * @handle: handle to be passed by callback;
  * @completion_notify: callback to notify when platform driver probing is done;
  */
@@ -230,6 +231,7 @@ struct mlxreg_core_hotplug_platform_data {
 	u32 mask_low;
 	int deferred_nr;
 	int shift_nr;
+	void __iomem *addr;
 	void *handle;
 	int (*completion_notify)(void *handle, int id);
 };
-- 
2.20.1

