Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626FAC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 23 Oct 2021 09:40:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E15360EBB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 23 Oct 2021 09:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhJWJnD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 23 Oct 2021 05:43:03 -0400
Received: from mail-dm6nam08on2040.outbound.protection.outlook.com ([40.107.102.40]:16672
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229908AbhJWJnC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 23 Oct 2021 05:43:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXUcov32fTXiC4J7nvSDwqugqx/4nR8DpLJNK3gG/UP5naRaQnZdUr7uryrcaaYIN+BWipRHDb0uuJdcsl7NHUbSvtX0+5vTiXexFef9DSgAs25u7cDKfsCvZ46mnGXTaGPs20KTBrf4NUxPotQMPQZY8nocRvIrH5PUzVhchuD5gdgcAJiE6EMkcw5rcvUehSFOdUhc3zifA2S96E23BiT4ldGiKKj+kfwtcbsu8V19pv8ixos2Nnav3ZD063smlr+/lJD5GL9LZ9G7TtpkWHYSlvmpyfkuyu04JiCiO0qPa6PUcedZ749cDKviV4+pL/HRV/elQOXjLz1EQn7nuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOO0N+dJ0sjRNv8VJM6Qju67m/pEWwekYrj3im5p2LM=;
 b=XuI8Lw0nmHFwu174Pv2kqmjpsf5hrxGc8CgIu2ceKeqODqtqRCFtGSg3s2Pp7vbvW7+pX4FXNUFZQg/Z+juO8fKFmNow60ZlL4dkvCRwexzJBwJo3J2BdNeh/LsFhGzBCQKIInMIllun2ehZSu/6XxEK7wZX2ugfslgHD3kc59jfB9aIZKpkWLxACPnKjwI3DOaHjuQIwzecIOX0eGaSjLW6IpCgw++G2AKTJLfI9qJMjwfz7hImt3VQCR3HZzVkUqB9wgHxuh4i2TJM42K9DcEfMJ68NsNNnsqPn+Z92F+qN+r+QG67QZXl4ALRyffLACVrmJZTbiWcAf+hv0qeiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOO0N+dJ0sjRNv8VJM6Qju67m/pEWwekYrj3im5p2LM=;
 b=HcOBTbH0Jjb9oWozi9rED9DQ9VyLhDI1gd9IbAEbzKkEN97NwJh/0tz0/j6FRe9qZE4TLWbiIFvleAajW1T3pRl28N61NRGRk0InsYFvlG3iMyhP6UPikVN/qT1MXSWKMAIrQzsOq+zZL7MVD29mGtCyN6WVecl+boxhs6/Bt37HGbMxqd5yR+GBDFYKKoaVHCjw5tQ2F/qOn7dS6NQQ2VfoOpo6nR+vSt7Jn2TXSZD0tMtUMNb9NC2czr09L7YCdMK+ahl1TLh/iaSqYTB4N3kg5uv3Uxl6a2RoZ0y8jIKeyZ802w3iOfEMocwV87SH5wJkU6Q7fYAVaLSMqcmQgA==
Received: from MWHPR15CA0045.namprd15.prod.outlook.com (2603:10b6:300:ad::31)
 by SN6PR12MB2752.namprd12.prod.outlook.com (2603:10b6:805:78::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sat, 23 Oct
 2021 09:40:41 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::65) by MWHPR15CA0045.outlook.office365.com
 (2603:10b6:300:ad::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Sat, 23 Oct 2021 09:40:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.16 via Frontend Transport; Sat, 23 Oct 2021 09:40:41 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 23 Oct 2021 09:40:39 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <oleksandrs@nvidia.com>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next 0/3] platform/x86: mlx-platform: Extend to support new systems and additional user interfaces
Date:   Sat, 23 Oct 2021 12:40:19 +0300
Message-ID: <20211023094022.4193813-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 954436f0-f5b2-43ee-86ec-08d996092ddb
X-MS-TrafficTypeDiagnostic: SN6PR12MB2752:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2752D22EDA1D2FCE598CFE86AF819@SN6PR12MB2752.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sfbzdNYh56Jb1mxPsOiNZxbBva7SyEkqw55mAyXwqEKNSoRhGM+ymNAaIBUBtZnfRghI0UWYsLcv6AAO7kRz/htOcXqJXBY6gI9Jc7tZsNLyG8gkbtES3q1wgmLj1BWkhXj2DLqRzXk3BE/tPr4TrkM3O6gXZkoyiHvtBGagbRW4fBNF4fur5NFQxNC9GVcmR+zwlVZXdkB4eIbB64nBaWFR/ZyolVNQQqPBL9dgR9AujLYEyS3t5BCPw9gUe9xCb0+sc6IN+DFCPgx5mTKjIHQMhpX4K5gdosQwhZHzr3qo0tuY0COZ0po1GexRwEzo7X8P7ddcoeVd7WhWDi/Kd2IQgzxdOr0lJPstY3XeBCz1KMKyyIZouYV0tCG7LXPhoz0/g/YJsqAgBGKpv8iXS8bgXT8XBqwZbqrTQiRHyOpWCMAaI7igHtJikPIIDeoEAsu37KE36t+4HIpHG79/FNHwMBkCG/iFX20UXF+3hQN0oJJ0NERtU6mvFqAN5MbNeNr2bu2JSoNqLrbFcb7hxPI9OLBtfy1k/SeQNJuRH2iiVwlsdOhKld++X1wTMV+Xi/Ymmitbe0mFk5rXZyguOSvdJb8Fgu1o5CDkWUQsUAit5nkp6dAhnc4HvCVRiOAi7c5r5nu2/oQz/YrhXVM63WKXzfE7QaG6Ub4/KFm32vtmdPa/6FhvNcTobycG7Itp3QJHk2SWVAmVtT+2dMh4Yg==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(336012)(16526019)(70206006)(70586007)(2906002)(8676002)(36756003)(426003)(8936002)(356005)(36906005)(6916009)(4744005)(186003)(6666004)(2616005)(7636003)(83380400001)(82310400003)(86362001)(26005)(36860700001)(107886003)(5660300002)(508600001)(316002)(47076005)(54906003)(4326008)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 09:40:41.6790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 954436f0-f5b2-43ee-86ec-08d996092ddb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2752
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for new systems:
- InfiniBand system type MQM97xx.
- Ethernet water cooling system type SGN2410.

Extend the existing system class "VMOD0010" with additional BIOS related
attributes.

Patch set contains:
Patch #1 - adds support for MQM97xx system.
Patch #2 - adds support for BIOS related attributes.
Patch #3 - adds support for SGN2410 system.

Vadim Pasternak (3):
  platform/x86: mlx-platform: Extend FAN and LED configuration to
    support new MQM97xx systems
  platform/x86: mlx-platform: Add BIOS attributes for CoffeeLake COMEx
    based systems
  platform/x86: mlx-platform: Add support for new system SGN2410

 drivers/platform/x86/mlx-platform.c | 193 +++++++++++++++++++++++++++-
 1 file changed, 192 insertions(+), 1 deletion(-)

-- 
2.20.1

