Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9AFC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 17:29:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 811B660F4F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 17:29:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbhJVRbf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 22 Oct 2021 13:31:35 -0400
Received: from mail-dm6nam12on2077.outbound.protection.outlook.com ([40.107.243.77]:18760
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231453AbhJVRbf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Oct 2021 13:31:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8yij00bV6cCBnOaakv2XS2rxBDRmuIjMl4Ggu4ef48AVZU4ImJNK2LkBJDffhXIAd6t6GzpHgiKjwM8bzHNHALvlq0dXSVBpz192RUs5GGRFHavUD3PAManQ9MGbPYb/D3Ej9GGznK2fGFg5YIr6lB2JUKHdJQJ6p3fIeL9gd7FtRH6MQRY5KKK1nJmEiqR/db71nJCjE7+S9AB6/AxS3vIiXVXE5Sc7G7I+hyfyck4a6o+jG4zufoglDfvw5sMs1OWTP87XfK4fT0b5BBevlSmrwn7ZAjRKF8bofQLLiIh+3tDdf+q9L4zK7b4ELw2FAwC5usJeTbSa+4+VPdwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrzfcEdWTdGsQiuxioA0s52qcelpHjcphhSt7O/etz8=;
 b=B9DNduLsr/HrBxyVKCatFDWnCkX3FYqzlsESstKMzCgVQDotqk0/a6Yw7FGa9+Wn5tiXktQyH3sws64Q61H7f2jDBP9aXUaygVxrTWS1pPH9QGHXYLMV/5fY6glZk1nhD9GlptSQkcNSmVh+NrYIi39AaTCzhAPvTcTOJD/hgR8L+/KUQL9V4PrCJPGwBWS2puo8SOA4/Mq3reda5YuNxttf+zH4BLmoy5TXcXVsoudsazFnKr1Qbt3DR8ijb8pXcy7BJ9OBBB74bmoZ2GfItqvlA4t4h6ukWZiPviwV34tEwiB6yL058I+GD/j+DvU50U+FiiAp63dHRmDHTMtklg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrzfcEdWTdGsQiuxioA0s52qcelpHjcphhSt7O/etz8=;
 b=GoAOG/ABH6c5F/ZYQQ5pKahNwV5xtV21FTMAKjTOQ4i8czZpAvbKELSHcxj1ylMRvikeFbRRUxESpwtJkAbBHun82Ad5qrQ/BYjeasKImWvnPpbTVdoovsQVCX+acs8UAHL7TsFUZPA6Nh/ssi2t3O19jT+EwPqwtEgmA4tXvlM=
Received: from BN0PR08CA0005.namprd08.prod.outlook.com (2603:10b6:408:142::20)
 by DM6PR12MB3914.namprd12.prod.outlook.com (2603:10b6:5:1c9::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Fri, 22 Oct
 2021 17:29:16 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::b7) by BN0PR08CA0005.outlook.office365.com
 (2603:10b6:408:142::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Fri, 22 Oct 2021 17:29:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Fri, 22 Oct 2021 17:29:15 +0000
Received: from amd-Mandolin-PCO.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 22 Oct
 2021 12:29:13 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v3 0/3] Updates to amd-pmc driver 
Date:   Fri, 22 Oct 2021 22:58:42 +0530
Message-ID: <20211022172845.2608-1-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddd6c120-933f-4500-96b1-08d9958178a9
X-MS-TrafficTypeDiagnostic: DM6PR12MB3914:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3914A2952C6D4C4A70B4874A9C809@DM6PR12MB3914.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: atqh9/Zw8RUNyK36JTO6ZwpxW/HOzfuiiyxvK2M6MDaPhsp4MPS3OKe0DGI7742pHDmRyUIA27RrJ3PvJ96jdT6NsaYcvYBpgsdldZTQPnZNJFtqH4XuR4TUJOWWQu+xh8zDQEbdf3D0hCx7Wy0CTFkDiQo18e7th4fFBR3t87LHtkzptQNtu3+0e/5mqsMDGDXlus9wUMlkuxYnfFISbbcc9sGxn7BnBLeCvUV+TzCk75iKUETJiLBCmaSCNf3qnPKKOq/vSabZ554amXn0bUfxIvdXe79W72AVzv7bfM+TnTNTdaRkPMHmjcJYwrkRMSWYM8SJfvh1HicSTc7thZEROskdXKgTjRvTD/uieFuvjnbbQ5jRW5V9th3rsUZIbT8+6ixKYxOA7fOjQPdmO3J97L6x4Rmy/mkJ+5KLKhVS7DlqjzC0EFchykUeTGW99pkExLLPfRiYP9Hm8coGd5h79HkmYkkKnMFplg4O1M5WdhytQXwOCceLDAnEFDGkevHlTKUX+2NxtIrJ7ygaRerENsA1MAFQK1OfwAwxWHfbtfZVmmFUxmgDcIc4UUiL2xAZMuRNjpZFU0kaiNxHMzJkVEcrzLweodw5JjESb9ZTphA6jBb3nCIkm+13veeWFI890akVUs9hIzihgenhlzoMH4yFkYqH6OpgvWF+zobeqTDcdXjAKm0wqge/BT7QqGnLPZZjvPRrusBiRZOeEoK/lNWZCUrnWj1ZVSX8Q1g=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(86362001)(4744005)(26005)(4326008)(2616005)(83380400001)(82310400003)(8676002)(4743002)(336012)(47076005)(16526019)(70586007)(70206006)(186003)(508600001)(7696005)(54906003)(36756003)(2906002)(81166007)(356005)(6666004)(110136005)(8936002)(426003)(36860700001)(316002)(5660300002)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 17:29:15.6346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd6c120-933f-4500-96b1-08d9958178a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3914
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch series includes:
- Improvements to error-exits in driver probe
- Store root port information
- Introduce support for AMD Smart Trace Buffer

Sanket Goswami (3):
  platform/x86: amd-pmc: Store the pci_dev instance inside struct
    amd_pmc_dev
  platform/x86: amd-pmc: Simplify error handling path
  platform/x86: amd-pmc: Add support for AMD Smart Trace Buffer

 drivers/platform/x86/amd-pmc.c | 146 ++++++++++++++++++++++++++++++---
 1 file changed, 133 insertions(+), 13 deletions(-)

-- 
2.25.1

