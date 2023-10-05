Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18DBE92702
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Oct 2023 14:13:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjJEONv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233103AbjJEOLr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2023 10:11:47 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::602])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD2D83DD
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Oct 2023 00:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=it4TBoA8sIVb4rJWOcxzEfXI12TUpfmORn0c7crLESiM9A9FOs4ikU1RJdpCCUr952lQuj0Yepse3QwUUO/5/CRumI/C4oMr8ZySo/hj+irNxZ6rqPaGNDnS8ZXwMiCfewVHknCFs/aYApPYmvxBFqA/PXJ2nvbece8n0OieqFT6L76K2TrujGJi9FlArsC36iY1J3YHBOmyjbQPPY2Pz1xnNPbhnHCLhmmH7eKqKZx7YeLyxX9eqvk1IVP2YvOgPATNlzma6wQC8aF9e7nUlVvrir+sjxCGSH70HMs6LUW13MXojeNTXxLRfXcqReqrfaJWIk6L2OE0AqyKEXCEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9x06fgqCtpATNRw5dAFG4Towo7yIj2o+Y1vJzOuH+8=;
 b=ISUie2fSe22yHJaTDjQ/kZIBg7kWrn2SWwJGj30TdIVx+yhMLPZkFIf8ruaDOBID5igTBmKXByRrrMCISuPckNsECTwfgsNLWgOXR82MzhA7NJK6L27IFZp50dm51RpZVjYKxVORLnq2ckfsiDTFA1T8khcpNuTRQkuZtpe5NM/65n6Y9fjCQtDKpFEZBynQm067/XiIT7WhwGJhWIDXdeYg6pRw8+6pY0q/6C0sAuDRgENp1NKU9zIJwdQjEOaCqKpOVKkMtVWbkAONOUR+LHDDNTdS/thCqt1F+2xPl2qguexKUDxf7vF+nroyks6cMsJDuzxcaOa/mCBRxufCcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9x06fgqCtpATNRw5dAFG4Towo7yIj2o+Y1vJzOuH+8=;
 b=pnPbCYveZ/hbrvaQlMR9md0h4OsCfsw68pdO/+eSQSEwyYhXT9SjMd806qlhq6+GmzlF808V+aOCrTsh5n7blGo7QYZ2NYybq19RYeqbBjEDwauYJvGCRaL+juQLImW2DiauUGiY+8PFYIzyCgTEC5hfn9IadfJkalpoEjurmaT/VrOFUKLOtm1GI2DqJKziqgVPntEQ4BsODdSAIEiJJFoFA1Yf/O6DyALcWoskdRTIR6c5uEm18J9wfBFeTyqHX/iUZNeIz1mXlY1UkzN55ZNf+C1zt1S4fI5HOVS0R2j+lnpgASPlcQHoCP5QF0tqlsf8EPgaO6SSLZLhNhb7KQ==
Received: from SJ0PR05CA0152.namprd05.prod.outlook.com (2603:10b6:a03:339::7)
 by BY5PR12MB4306.namprd12.prod.outlook.com (2603:10b6:a03:206::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Thu, 5 Oct
 2023 07:56:52 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::11) by SJ0PR05CA0152.outlook.office365.com
 (2603:10b6:a03:339::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.26 via Frontend
 Transport; Thu, 5 Oct 2023 07:56:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Thu, 5 Oct 2023 07:56:52 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 5 Oct 2023
 00:56:36 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail202.nvidia.com (10.129.68.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 5 Oct 2023 00:56:35 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC:     <christophe.jaillet@wanadoo.fr>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 0/3] platform/x86: Add fixes and amendments for init()/exit() flows
Date:   Thu, 5 Oct 2023 07:56:13 +0000
Message-ID: <20231005075616.42777-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|BY5PR12MB4306:EE_
X-MS-Office365-Filtering-Correlation-Id: 887b39dc-089f-440b-79fd-08dbc578a30a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9pgowr9eerg0gM1TV4Ov6VnM3fbrsmrK3DvzgPdNDvL4Ogg+yC20T+Yr7kdn/sJP87LMXg7ptu9Q7I+kexu+MELrdPCBb5rR5yrs1bBExM2u6d5rxP4PiEOSDP+9e2YYZNA36zl1sB2e5sy4t7Xml3MnI/OtYVh7WgDrH0Ji8nzniF/uN2cVhtq9iNZEafN5D1ktTxEZEuK3ozZ0dZ/aGx+B2Cb4xpbjeMjU/oXK7Bhm6eBEgRUUZ7NGVy4r81kl7Li0+lk/34nA1fy/xkDTa6ark+KxGgEVs8LpjJV3JQKClmhz9z5yM4P5tXrCIIrNSlWSoj6WIG3AjHZWlKVwBfNUgYJjihVCyMnW3IhAvu4Y/zvJfOPnMLXeLCNGDSPorNolZxZPX+Bf039O4bSrJVS7YNHA18lkr31vfv1a+nVkvUs0bkhsHnF/s6Y+Js6xUKT+JWbhlRIPBAddiq0rBlUNvISanIiA1WCivHi9Y3BseujRKasBqQRQkFMnC/PDM9K5lzqQuHOOc1pyqTR/SKlYxgGNBTaI5VaAbpVoCiXBwitVus5naVSWZNSkjiA1A00zlzsQf7czWH3sApRK2IvfDpbLHBI4Mgmvr//yws4GQV3a+T2Uzubhseo+2jO8G9A1UPROmRjDTZs+E9oXXJLEjgyZrsor3r5oFitIFmfqbKwqsaYz9Uxz1uAFg0QsKuin1DpMihbuKlcWCFqCEMmVCWc/jqIW9gTNPf3VSFo2bFFDqaltZDWtAJnYG6lb
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(40460700003)(6666004)(1076003)(110136005)(83380400001)(478600001)(36860700001)(7636003)(47076005)(86362001)(82740400003)(356005)(41300700001)(2906002)(40480700001)(316002)(16526019)(26005)(336012)(8676002)(107886003)(426003)(2616005)(8936002)(36756003)(70586007)(70206006)(54906003)(5660300002)(4326008)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 07:56:52.4396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 887b39dc-089f-440b-79fd-08dbc578a30a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The patchset:
- Fixes memory leak in error handling flow.
- Add cosmetic changes - misspelling fix, better naming/

Patches #1: Fixes memory leak issue.
Patch #2: Fix misspelling.
Patches #3: Renames few routines for better naming convention.

Vadim Pasternak (3):
  platform: mellanox: Fix a resource leak in an error handling path in
    probing flow
  platform: mellanox: Fix misspelling error in routine name
  platform: mellanox: Rename some init()/exit() functions for consistent
    naming

 drivers/platform/x86/mlx-platform.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

-- 
2.20.1

