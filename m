Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0A9C001B0
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Aug 2023 08:38:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjHMIiH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Aug 2023 04:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjHMIiH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2023 04:38:07 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2060.outbound.protection.outlook.com [40.107.100.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E6B81701
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2023 01:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVasZvbjemNywLRqr2V+ql2TQljb+F8g5pVCSsqb72blKXcJeolZtxiyUe7scBHKZB+uAUmy40StTRQdK9IRRTQiQxRn63CGoiPQS2Su4RgLg3XgkBj15+K70crhP9CKFVMT39hceVx0bo+r2o6y4psSM0uUcjfz20JRO9+HxvIm4/rjVRAK2QQbiYnpH0W1zIL8n6TSaA7fzVZFgOJwRpnC9Wf7OC9/fJpClCeN6di8xFqh6cinS+Ts9kLHKVXoZQq3AkXolCrFZFvd5IZxI00mMEEBwS6nlG+grRTEbI3Ua420cwP5j/lJHsAzxqkwUfDsMsrLInBQM9vPw+/Hcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4xOjVu09FTxDJxFSe3anG3Zq1Ky+79LaiZK0zLAlJo=;
 b=V3VVSeeu7W4yETHwslcIDhYf2rrsvymhi0j3SmSPsM8P3Syn8XEtnBUeVHBXeICMDIqzCc2BJleHC6kZ0D/rXktkYOzUw3MItmfoZg546nrGds+rN6jFkiU96b0P/GjKgi1i0xhfDf514Ma4kkO+xetBIz1xtFsU/RnpRbz2CiFdbwHw1VJlO4te0EWtuYaWRhznZILPvov/81V47Fiq0ukKTvZZNDE7eYdiqKxYx/6PbsqPv3+SFTSa3CFwhs+79JPx695eWhSfu4iKUHftnmSRS6a5qtoIwI53Lhxz8tl5rab/TVmp65NAQcTm4/iEiRMFtg9nw985k2wEG1UsMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4xOjVu09FTxDJxFSe3anG3Zq1Ky+79LaiZK0zLAlJo=;
 b=UabBE46kmTvXK6CpoPB2j1rzSsVm4B9gLybyIGvHiD8QRSU+AZd9ojNPOXj7W+nA2VPxy4+2A5p+WlDDf/ZQyZuh0Wu7yVkMWvJaWK9iWVXH0d0A7MWsJERIrGIU40j96B8OKV3Ql+vmSQkAYH2Tb56yj4h/LapB5oQwcCdagREXVfVPU2PvCnkwKyd8Rap/Iw5HaHeojwlVur7dsX7FTMppmEKpaZ7JR+NXiHMlgljn/4NGSUxnD5M36yet7UjVJ5Pp+hqbfEPywplz88b3GXz10F8XJPDQI2uEg7bWHE+UR/wjsV25Ylkzv6yZWjGzIOYrFfQjc2nBAe166Mklsg==
Received: from BY5PR04CA0021.namprd04.prod.outlook.com (2603:10b6:a03:1d0::31)
 by MN0PR12MB6270.namprd12.prod.outlook.com (2603:10b6:208:3c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Sun, 13 Aug
 2023 08:38:06 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::fe) by BY5PR04CA0021.outlook.office365.com
 (2603:10b6:a03:1d0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Sun, 13 Aug 2023 08:38:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Sun, 13 Aug 2023 08:38:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Sun, 13 Aug 2023
 01:37:54 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Sun, 13 Aug 2023 01:37:52 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 0/4] platform/x86: mlx-platform: Provide fixes for several issues
Date:   Sun, 13 Aug 2023 08:37:31 +0000
Message-ID: <20230813083735.39090-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|MN0PR12MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: 56661c7d-6c5d-4fda-6120-08db9bd89d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DcrFkm4mKmmpmY1TWSyQ+KOEXQuqqVnOy0I+2h8Dz+wv9YEP2vr5/MpteCPEcZg1viiJxt0Fu1kw7l7vCBiwOFXnnXVrCdpwBAhiF0izqwjb+BlYHHAnHZsKWc9MNvxMn1syUNqpT7rtv6KpMQJJHBXKf9Q23CvRiG4vU+1ClGp8YLDtlSkfyLhLPjHWsSpS2VQZxTXaOTWHa7feU6auD/3FN1EoO4jivOQimhqu4i4RJK1+da2G7dk+oBk8+WKHWi5gqJ5H89mQ5B5KFhgElxIJ5BTD4wEgTN1j92SnhYtDDF2pUMkxFI7rXX5YMVoTe3tLg8bQ38QtDjjRBSUoShkrVgJ/RgwFBUVCrxjH0S5zt/k1eEFt/GXYjqf9hr+1y+MAR9IfHMraHRIVpRtd73Ty7rXyQ9LbLTtgtwlwZKD/Wf53PXYygf4ebuagT4CTTborr0msQbs8fWnP9jXLZ/4IApdHkZCmXE+biqgY6ZxkplAEfs13Do7nhhXD52sBx3ws1hisjLk0K9285GvbblVZANn/6yXh4RV0pVFOGH1NBhRXA9arSZ1NAoCICPwZ2/Bxufy0cT5Ki6q4ogtGJO6PKF13TDkjZfqG4Yj/vXDAptB1FKJdqEduXHok4YkFlmiv6axZV3/ibyoQ+BA7ym40oWLbawnHteyqVDIcthLV2V5siBYCietN20g/5y9pIWX4dXMAKrNbzhtaPpNt+Dbleg2Qu1eX+DHiQrN85/dpecakM/s9abs/rqjMT6Sr
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(82310400008)(186006)(451199021)(1800799006)(46966006)(40470700004)(36840700001)(4326008)(8936002)(8676002)(86362001)(478600001)(82740400003)(36860700001)(70586007)(54906003)(70206006)(6666004)(6916009)(316002)(41300700001)(26005)(16526019)(5660300002)(2616005)(36756003)(107886003)(1076003)(426003)(336012)(4744005)(83380400001)(2906002)(7636003)(40460700003)(356005)(47076005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2023 08:38:05.6651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56661c7d-6c5d-4fda-6120-08db9bd89d50
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6270
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The patch set includes fixes for several issues:
Patch #1: fixes exit flow order.
Patch #2: fixes signals definitions.
Patch #3: fixes platform shutdown callback.
Patch #3: fixes register offsets

Vadim Pasternak (4):
  platform: mellanox: Fix order in exit flow
  platform: mellanox: mlx-platform: Fix signals polarity and latch mask
  platform: mellanox: mlx-platform: Modify graceful shutdown callback
    and power down mask
  platform: mellanox: Change register offset addresses

 drivers/platform/x86/mlx-platform.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

-- 
2.20.1

