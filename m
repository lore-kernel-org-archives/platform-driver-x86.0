Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCD7C76196
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Apr 2023 16:49:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239744AbjDFQtK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Apr 2023 12:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239881AbjDFQs5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2023 12:48:57 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C219740
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Apr 2023 09:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQnT0miNYJkugoJs9/5zyhlZ5+xQ8GHmKeQzG9vtBhUHy0rj3HOdBKFbRv0fBfenFOE6tky4ff82JjtcEHXDztaeuiJ9NyIrOJ9dSe2CFICasmgopF/unAqDj5e4fWPBfA6hIJuB3zJybCAtVgfECUk4JllW76fiei7FG5ri3VQ/VocElL+HORJHFrG+Hwe48GLDG9F69RJKg7CX2xn44X62UdIMoKIqLXlbGJ91uuYpcC1I0lCdUvwbO00iqGesGBw58CLUBfhBzYRrcGWwX/cRtBFx8xzwlnUhoNbrVTDRfPieaXgTxDuklObrb4LivAdyvjCNwOD31NGLkI3DEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hu0LsBMUFNsnL4YQKkAA7AgOt2W1C5NEdQhaxSiRSe0=;
 b=JdwmfmskhhK2qnfZEQKZwEu7Feue+zeYu/whPVWUy/eeuqmaWrfTeL9sqe/7Iaq7ahZfkxXirsZuyktVXxvNXGtOqzealSCtGQTBiORjATzQ/ObbzGJwkuBY4BpWZGKtSqZnS/4UpgwhGqzQR23I6iSwa0DDoWmd2F/LvAXZ/EVSum/oCuXX70iYz3ZTa7SVdj1UKd5wJPYCXQ4rFMQSOMHmKvMRVk49QPq8oCXLS4qKCzhABmalTJw0HKH/rZL+xZ9Gkhh4YBSWfNmm92GmQbQNlgLcgNkB+HuO2INYgScTOdJ36i3T5EtTC4mnl154WwQC20R214CMyyDr0W90Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hu0LsBMUFNsnL4YQKkAA7AgOt2W1C5NEdQhaxSiRSe0=;
 b=pb6hJLAsprVXgWkSZNrGSAI81Gq2S47Tqorq/gX0LhrHEu1Rn/19DKkBsiHa3orVdfSdKe+4gSInAkbPQ0/VhZj2IrFeLxz2OAuaLyuEd6P2glhO8K+/4SYk0ZB+xlsW6XI0VGGXajR6hQTjQTYAAjTt9iMnl1+t6YbPGC8NfuY=
Received: from MW4PR04CA0176.namprd04.prod.outlook.com (2603:10b6:303:85::31)
 by SA0PR12MB4525.namprd12.prod.outlook.com (2603:10b6:806:92::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 16:48:51 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::db) by MW4PR04CA0176.outlook.office365.com
 (2603:10b6:303:85::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.37 via Frontend
 Transport; Thu, 6 Apr 2023 16:48:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.31 via Frontend Transport; Thu, 6 Apr 2023 16:48:50 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 6 Apr
 2023 11:48:48 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/3] platform/x86/amd/pmf: Updates to AMD PMF driver
Date:   Thu, 6 Apr 2023 22:18:04 +0530
Message-ID: <20230406164807.50969-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT044:EE_|SA0PR12MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: fecd1a2d-0816-4c82-d753-08db36beccd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PeJ9Cnei+QpsryqLp2f8zEOmvJWdYXkY2P+C4RuCe0jZVijmepMe5vItJAKq47dA7w8hkovfYFhm4LBjIqFzprLGTsXXaub404nBEjKXAI6T9exjdm8GW4PeUOh5chygUXy+y0UXy6J3T4H//BgVDH+010w8DSvgeo/V9s6v5vCm4xIdZNHruMjBcevnO5HE47fVFBc11d43VaynKfnrvYjhkufqRJYQ20jJFSMNHqzRhey4MtSUgTtGziFL3Pu9Z3ayBU3NzqFKAEvPu7bAn4Nzic63Xbaf9t5UAG7RIviq3uNB4LSpC10pk5t8sh3thTQuTJxQ/QW/5sto3S0OJPox7ij4yYLk9/UH31Vm0FwSF0Nf4B05396iYTpszD8m3tMADfcL311Um5uLC0nr+qEvkhrkHGWZ+dVOwLIfuW6O6LROF751nzsqswKwOJEX4sMUDbeC8Yio0TqHkcn+zZ+OYKZymk4YiNICASR8jTGHZxEg/GT7UM0Q4oqBYAVkE+tooOce1+pXiCemuMGEXW2lV/yixmWITc0hbmGOW5F1XC5i6iRZAukEUZ6mhswONQHdWKj31TCTk5K7JYuvKNR01uw0zz4XmENkigBaW278BGBeyEv06YDtju4AnNpm0j4Oaz0JSj96cEIdZIV2NYscYhl3tFQ4qlZuahTaO/NSM2y4xu+JfbW2I+l99b3/c+SYzzI969riKaTVIhq9umE3mzAHZgLK3QYHwVLs6dA=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199021)(36840700001)(46966006)(40470700004)(1076003)(26005)(16526019)(478600001)(40460700003)(4326008)(186003)(86362001)(82310400005)(7696005)(54906003)(36860700001)(110136005)(316002)(5660300002)(36756003)(4744005)(8936002)(82740400003)(41300700001)(70586007)(2906002)(8676002)(70206006)(81166007)(356005)(40480700001)(6666004)(2616005)(83380400001)(336012)(426003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 16:48:50.9550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fecd1a2d-0816-4c82-d753-08db36beccd2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4525
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch series includes:

1.Enable more debug information in the PMF driver
  - Add ACPI debug logs to get default thermals values for SPS, Auto
    Mode and CnQF during PMF driver initialization.
  - Add the PMF debug facility to enable more debug spew.

2. Change the SMN pair index for driver probing.

Shyam Sundar S K (3):
  platform/x86/amd/pmf: Add PMF acpi debug support
  platform/x86/amd/pmf: Add PMF debug facilities
  platform/x86/amd/pmf: Move out of BIOS SMN pair for driver probe

 drivers/platform/x86/amd/pmf/Kconfig     |  22 ++++
 drivers/platform/x86/amd/pmf/auto-mode.c | 142 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/cnqf.c      |  85 +++++++++++++-
 drivers/platform/x86/amd/pmf/core.c      |  22 +---
 drivers/platform/x86/amd/pmf/sps.c       |  55 +++++++++
 5 files changed, 307 insertions(+), 19 deletions(-)

-- 
2.25.1

