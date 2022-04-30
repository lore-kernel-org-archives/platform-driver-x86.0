Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E7EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 30 Apr 2022 11:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbiD3MBl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 30 Apr 2022 08:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234736AbiD3MBj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Apr 2022 08:01:39 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D0F888C2
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Apr 2022 04:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6ZiolIgtg6hc5z96nEnBRE3Lh/EWNcsMaDnW1QJ83BN53b19o5Jhw2BjJGF1TixjyfEjn34KnmX8PEMSy5yL1XOdFMrDQnp5pDveeSN6/a8AFEJRGLrP6wLS5l0JQ3W/f0oTr5zUCmdOnCxVBOn/ejExdhQTHx1AeJ6ECwvJgny7whz1dVWR1qFXFhgY9mTKZHCMiQRT2NSPLB7mrc28jyDx/QAw/y8RskeRAGvjOkXKP89QYQ2SRW9g24V22A/obdIWP1FqPCIY99aAWiYmpLgLTgUw756q5ZnRh1W+DsDGtRp0iQDS21resbhcJr+B3fNZFt/Z4teWgJ3r0HFng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2AVhux40Mrom7J7HcFJw57GyXeLfO4Fi6wrB3im8go=;
 b=QoWXVNCtV8xnMrgqsF7cy7YYFy6VftkY/PeZcfM98KYGJiagTCXhZYRvogwujnFXOl/ve1iC4zFlweE9rmE25bQT+lx9YdbHD398S+2mSv1HAzwEUomJf92GfXPR+oQHADCAxu5epaFT4GA28e1ZAkuoAFi5zKEC9KOMFhlsD6Yr5ye6riiOsfj4OcTZS5eMe8Su/Q36VKVYmKkP7HitxnyGETz0c/ah2gNufxu8dujszOesFErEYkmGedYWg97aJwyDHk3pYc8QkXidK/2jCrYR53S3hLN4cLtiN9Mp3f25/qufwx1jK0l1kB3bRsOT3eH6qr67S1/rXEPItVcmbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2AVhux40Mrom7J7HcFJw57GyXeLfO4Fi6wrB3im8go=;
 b=ubU1iqbA1yJ8vfxNh63TomVgcFpSkHYhxJYaam43DzFxgahZFeO1M8NvxEOzGxbCbXvGktzeVHEjJDDjdENpPXNmk3GGneIuSPHxSPAa0/DgaWyRgwyOW4t5AERe3IyqjH3KOgGRAENvaqL/5dbY7y24ejONVS1xorTc54d1q+OlmEpTBuzUKbbvuZVtqUbmB/RZYFI6uanZEPoPct1Sqfcxx+JhCL9MCDZRkhAGOqRBI/TnKWBEYXIQlRnfXR7YqLR7VLvntQrwwAx0cJFOrKTAKSMS7u4G2nT8EWWJIfwLzFtbXjrptLauRk9FA34KmvLv3dYUh6cd1L1D3Fg91w==
Received: from DM6PR02CA0078.namprd02.prod.outlook.com (2603:10b6:5:1f4::19)
 by MW3PR12MB4571.namprd12.prod.outlook.com (2603:10b6:303:5c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Sat, 30 Apr
 2022 11:58:16 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::b5) by DM6PR02CA0078.outlook.office365.com
 (2603:10b6:5:1f4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Sat, 30 Apr 2022 11:58:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5206.12 via Frontend Transport; Sat, 30 Apr 2022 11:58:16 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Sat, 30 Apr
 2022 11:58:15 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sat, 30 Apr
 2022 04:58:14 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Sat, 30 Apr 2022 04:58:13 -0700
From:   <michaelsh@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v1 1/3] platform_data/mlxreg: Add field for notification callback
Date:   Sat, 30 Apr 2022 14:58:07 +0300
Message-ID: <20220430115809.54565-2-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220430115809.54565-1-michaelsh@nvidia.com>
References: <20220430115809.54565-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf78a3f7-a715-417b-c0e3-08da2aa0b5e8
X-MS-TrafficTypeDiagnostic: MW3PR12MB4571:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4571596D18BE2F18CECB2FF6D4FF9@MW3PR12MB4571.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: szmcX9RU+u9uplfAq5Ti9shUU1t9wEJwbE5PAH15V6Sa+tpXn1INNSvvxUSezivus5y/KRbesZa70u0xPYiNuHkkUgPNPsFmMLjMP2wvLD9mG+glKXq0Q7CuLsNqBaugburB1zT+sf/lhDLaA2FlkMb1KB/mpXw5IkN1fZPIBpKOefXhe1u5UZzWm1O54LCCoZMyOAEnT1wjb34TAVdCY/TOari2bPp+nvG6E85XXICerOcWIlGAb1nU81ijLlRxKiK3cG7CiuRse8L6Kg+7I4uJXBGoEAErYFLyHqqOTGAuIXskwa+1Y3JWzEuOg0WY8e16JpzX7Q8vjv5MQE91Ay1b4F2xGUz4CRyGjGOKPHinv4cWCt2xoNXEZnXdSBgpaY50UkFalTp21p78vQVig0aKLJhCZNBnijcJkBOrcuGmKC4e6Fyw2IiNJBSxVOCcFyG3pHxcjfxKsTTFILc4bSzpzcK1eII1M2vhhTx0bFke58k2l0cEJUu1/nb4BB4aASrrP//j6oM6Wdhs1HR1z8r184us7BocupW1v4Xdf0p7zKm5lKphmz0vgRcbTHid9A+VJvVoICS9tsNZ2zFD5eRernK/FjPG3aJ6e/r8zX+P30djoIiOUfAp6UpJFKs8sjRLsrsYbs9LheEhTd6qfE1izXE//kqHj1KTe9dfl7kguJ8a0DYyT1UFcwNSh1SaxYLqn84FPWUdpDf0LWXcXQ==
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(86362001)(336012)(508600001)(82310400005)(47076005)(2616005)(426003)(40460700003)(107886003)(26005)(1076003)(356005)(81166007)(6666004)(186003)(2906002)(36860700001)(70206006)(2876002)(5660300002)(36756003)(316002)(70586007)(8936002)(54906003)(4326008)(6916009)(83380400001)(15650500001)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2022 11:58:16.0160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf78a3f7-a715-417b-c0e3-08da2aa0b5e8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4571
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Add notification callback to inform caller that platform driver probing
has been completed. It allows to caller to perform some initialization
flow steps depending on specific driver probing completion.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 include/linux/platform_data/mlxreg.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 40185f9d7c14..a6bd74e29b6b 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -216,6 +216,8 @@ struct mlxreg_core_platform_data {
  * @mask_low: low aggregation interrupt common mask;
  * @deferred_nr: I2C adapter number must be exist prior probing execution;
  * @shift_nr: I2C adapter numbers must be incremented by this value;
+ * @handle: handle to be passed by callback;
+ * @completion_notify: callback to notify when platform driver probing is done;
  */
 struct mlxreg_core_hotplug_platform_data {
 	struct mlxreg_core_item *items;
@@ -228,6 +230,8 @@ struct mlxreg_core_hotplug_platform_data {
 	u32 mask_low;
 	int deferred_nr;
 	int shift_nr;
+	void *handle;
+	int (*completion_notify)(void *handle, int id);
 };
 
 #endif /* __LINUX_PLATFORM_DATA_MLXREG_H */
-- 
2.14.1

