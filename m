Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85292C7EE29
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 11:50:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241012AbjEYLua (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 07:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbjEYLu3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 07:50:29 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEAFE97
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 04:50:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3oxYe5cxltuPPVSk4Ui9ByWHJB1IrhFNYigkNdH8xVbDExn9M+uZ7ituQe5RG3zueZO803a2H5Ihf6Pz81DrSjV4846S0X3lf/WHzMLYtY80+X2Rre5e2txtEvr4DcFnMVPHYZhJUUnuqw/HkeXUHXj6/kfsC3IAYMS5HoeydDT9K3IAqu2icQRyGCrMriF07X5hTVNthtC3OE21unIJkaL671/0sOLaaQZkkYT+pEAYJ65+3LQ+5LuGKUBcz5+8Avr8Za36uCHTrmUcPFqH20pBJ+WyDr8rjwAY3qfhC/sbtLGruN/HJEAToxznjTnB4J2dic4MeuORh0fwlQ/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+kjse9yDdjeBpMDpnOm1tmarrenW/FpArchjfQVllQ=;
 b=Rh8sIKmF00mXjCiTk3Y2Zt9vvFSs36im/xIqKJylMeODEHcpXgayAlInCo4FyplFFaGKda9X2wBsEmHmPsS2APRnBzEXG9ms4GhyqOWdQEatztihM6oUdyz6zGeSyb1ASVSFVDePrd7Jjp01A9Ci8WAAusxY2pP1EWdVQ1gaabXU1dbHTfK7DDBf3mQ1NKxemGkH5d43OgPuPN2CsvDi2uCuil3uVbea+yGmdMK0xbUD+CUQyMSN7awS5M02EUkrZwrhzL8Sx4xtBHCSVTqPnkVWfvUQJqyaMozI3Ups2xNy5+lxn4FoV2GjUGk9FpI3bZjT9Yl4GzvQo3Cky+bQ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+kjse9yDdjeBpMDpnOm1tmarrenW/FpArchjfQVllQ=;
 b=E08d1RtDZ1R/bqvtt4eRd0oJI4LCf8YOgSPsxE0x8ltrob54WpoyRU8l7DGd19Zv9n2fNMg24OpWmN/BXk5P8pXzK9w5l2hiD2HcHxWFrN+tBWHpT03sprzNzS7RfJ8S1UbHLYwmYKTywgFcisfhSAjZR9B+ihVdriNbvQqsnl8=
Received: from SJ2PR07CA0007.namprd07.prod.outlook.com (2603:10b6:a03:505::12)
 by PH7PR12MB6466.namprd12.prod.outlook.com (2603:10b6:510:1f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 11:50:26 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:505:cafe::e9) by SJ2PR07CA0007.outlook.office365.com
 (2603:10b6:a03:505::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 11:50:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 11:50:26 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 06:50:23 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 0/4] Updates to AMD PMC driver
Date:   Thu, 25 May 2023 17:20:00 +0530
Message-ID: <20230525115004.865395-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT064:EE_|PH7PR12MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: ac180d29-4b42-46e9-4ef6-08db5d163aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H76EInohfCub/nb4/6P7eqe0IP6VGRHDCxPmL8gN3qlJ3muX3wEzHzgMayixWFkQVvs2ugoH2+HUMgjKgEnEuAibOi9tTfNEY9Adt9te6ltqYd8dGIzTbYMsOGBS4Ow1LdVtBGhEXqvRXaFCgYbSETaC8RSn8zRthY9HCdOwE3trDKwv9GdK1VYt1IW+ejxoiAxVjuZWo/4NosebPNDDTsSkkxj+sDJOBMuOfDLMsXFzseUtlutoFwDIqQZOGlWwm5PbKkJG/bj8vhWCabEg198zZhWQW+lzRmB7xE4pLPeUgXulZJKcGce4waFmsmw+o3Xyre5OE6pFLzurYNKp7oL1z4/j1Ejs0+aoFT/7C/3BeiISIkT5WVOI1LubHKVmkKNaZELkTQMwS7FfIkn0Y1sLv488KmW6EzfFv6zixXivGZ6Qzg9vDG8IWlolXh4xIQV9qFFUhyRDgoQh6O14YsxEU0+cILj506F/ySn7UfqSmmcBCx65oBPxuttjX3pxhOZ9BLJxHzvKl1uPM4Fj97nHHiu+PhYjlh+Dp4t4dp9BsIHI+6epnj/bt4zdV3Ct0Qe3DLZmzagW1kpU7KwIv8LilAO4GF6zapPf3CUXhp4em7azwSExGkWqQA6lBon8vTd0YeutwvoMo6ibRV5MvG0jIEdnLSA1sg7r/x715zelnlJRCN5dMBYvbF2AahINVoqPa/5wcMo0+pHJAPAugO86fAH3+npv2yRDLnmLko7ejA0Aq1L0a/Ky7TvJFQTZnJelYTS1szyKP48varFxdQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(15650500001)(36860700001)(40460700003)(2616005)(16526019)(8676002)(8936002)(83380400001)(82740400003)(82310400005)(86362001)(36756003)(356005)(81166007)(47076005)(336012)(426003)(40480700001)(4744005)(2906002)(41300700001)(70586007)(70206006)(7696005)(6666004)(316002)(4326008)(26005)(5660300002)(110136005)(54906003)(186003)(1076003)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 11:50:26.1439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac180d29-4b42-46e9-4ef6-08db5d163aeb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6466
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Series includes fixes and feature updates to the PMC driver.
Series has been split into 4 patches to incorporate the review
remarks from v2.

v4:
 - Based on review-hans branch
 - Address review remarks from Ilpo on the commit-msg and function names

v3:
 - Based on review-hans branch
 - Pass true/false instead of 1/0 the amd_pmc_send_cmd()
 - Add helper for supported cpu id check as suggested by Ilpo.

v2:
 - Based on review-hans branch
 - Add a switch for cpu-id check based on feedback from Mario.

Shyam Sundar S K (4):
  platform/x86/amd: pmc: Pass true/false to bool argument
  platform/x86/amd: pmc: Get STB DRAM size from PMFW
  platform/x86/amd: pmc: Add helper function to check the cpu id
  platform/x86/amd: pmc: Update metrics table info for Pink Sardine

 drivers/platform/x86/amd/pmc.c | 123 ++++++++++++++++++++++++++-------
 1 file changed, 99 insertions(+), 24 deletions(-)

-- 
2.25.1

