Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2A2C11F66
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B325861D4D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbhF2Iuv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Jun 2021 04:50:51 -0400
Received: from mail-mw2nam10on2051.outbound.protection.outlook.com ([40.107.94.51]:42849
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232487AbhF2Iuv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Jun 2021 04:50:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxyHvcyH48okNgtWeeOvjvX6Jx5OfPEsVae45cE2AqbucOT+HVpcsDEfOYKChcaYchsFeY47GyVGCjYni4WL6ktyADIeclLw3s37PfR2gjmF6Bw1K6ydq5MIlWjX7rn3GYw63K+7QX09MpFMCR36HXlt+bM+18WxXFMIP6RoHi1I4W/HWjuoBebvi3TvraY2+qr5Lj9J4eVP0YTvW5KOwE/uI6FSMtl/5HCY1X4W6f7+SU/2gj35Csf9beMiQZbMvUhRjJk9NjFMzYOf4ycDmCWJIPqudgWo+cPP7ESSwiMZboC7/lToOS4BUOUumpt0VYVBSrdZguMqQyQJXZ8FeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuAkxEpDniZeOJnx3c3vt0m0SKQVBsnZx7jJzgI6tOM=;
 b=ThhFaN7LmXtebSyb+XFgq8sIDsEBqVwPgAkYGMslpna4Dz5EdTdo3hsKh5Wl037NzRBIzX0PW3mh846jVJwrW7Sp6VFz7kTFZnK4dIo8TkfUQdNjzEPLk8VXqwotWhpeb/HmORdEEAM4/QMdsXJP/rbbAJzCsaRUwW178QVZo3dfSJrTQ9Ti3iQIzZfOdpQpEyXWf5eM8iPRhT9B/s9adOg5K24zcEMojRU2smww7BVAWfw1s1nChG0/XEfHck700McBzoKqMNZe84h5HsoZ9S3vme+nsUmKQa/M9E9b4UPex4WBsDeJrRbeImrkLa5CaQbJkWreWZLfLpQNIPWNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuAkxEpDniZeOJnx3c3vt0m0SKQVBsnZx7jJzgI6tOM=;
 b=ZrkWeZp0aYVx9yW+64OoP8kN6Skyi6PUdju09/YQwGsaDeGFEs7XljyVyPdZiMfgvLmewf4kbyAbY9IVTxu/lZpI722qm1Udp7PmXm5g0k0LJANKTKGqdJYATalYPkfXknhnX1mbMNOsQHZ4rncnZqdlAlg4PJD1plyjYfSn/iM=
Received: from MW4PR03CA0057.namprd03.prod.outlook.com (2603:10b6:303:8e::32)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21; Tue, 29 Jun
 2021 08:48:22 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::6b) by MW4PR03CA0057.outlook.office365.com
 (2603:10b6:303:8e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend
 Transport; Tue, 29 Jun 2021 08:48:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 08:48:22 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 29 Jun
 2021 03:48:19 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 0/7] updates to amd-pmc driver
Date:   Tue, 29 Jun 2021 14:17:56 +0530
Message-ID: <20210629084803.248498-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 749fd2ba-31b7-453e-5435-08d93adaa6d8
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:
X-Microsoft-Antispam-PRVS: <SA0PR12MB43678E0E0C98029FCE2BC76D9A029@SA0PR12MB4367.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/V/VNVsHD6jHPd9fU2SIsNONTrFsnBNfKnYjyu0bK6q4qfBhFA/pK+4RFctTBNnCEILMdkflI3v6cIWrLD8gSknm125jxXC+3T0H0a4Na0fh/uGxLNYhOdPVxz8vZwf4ngicFCxfALXJt6DX17slGgfjiphzSXObR3gVmg+LG5ilzC3BSCr5XkCnkloI2KIRlVT6Bu/NXtlffxuojzTj7LeEKlwjMibl14jhYuKWfPQy+PpVfdlcUxkT9T1v0oKaYrX8eO39b6ktQSE40a4Ha8DWQCOVY2tmk6CyEYzpcHpm5Kp8tc5qNYya8Xg3nRXoRoGlbPfXKiZUcsuZB28DxZYeICDixhuVNWUa2r2zHa0VqMaB/4LdcPL3OTfwHT98uVIZZTiEcKvDtXfOo0k88gLhqFkklH/hR1+/HNTNCRy5qOlrakAGhMxjPxuOAOKf3hQCQWq+j2sMMKNWeWLh5DHwCY65aho8dSiZqS1a+UTZhtv77YP9PWTXHOZGvNzHfQkwC+C/GmHxFtZMsCRPrjI0KNp5o+FyBWnUrEfRrARN+mnxXik6kwBDh5uHvVCptRCgvTqbmjANgYKHnVGZTHE8m24LA/cNnwtmMbkSFWA0SIz1grMEMsx3oXH9OD9pcBM7rgnW1Ll9in2ZFcb7jkEiLNPLD1incx8hjgMGwdE/yF2MIRcDF/FWH4jXUw7ANw/oKiOT0C6TKX09aDB1Ypf4/7SDvc4Rb0hDrXvJg4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(36840700001)(46966006)(4744005)(2616005)(70206006)(70586007)(1076003)(36860700001)(336012)(426003)(26005)(478600001)(47076005)(82310400003)(82740400003)(16526019)(186003)(8936002)(8676002)(6666004)(36756003)(7696005)(54906003)(110136005)(316002)(4326008)(86362001)(5660300002)(2906002)(356005)(83380400001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:48:22.4343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 749fd2ba-31b7-453e-5435-08d93adaa6d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Couple of existing issues on the completion codes to SMU
and a newer way to get the s0ix statistics are introduced.

Also, add acpi ids for current and future revisions of the
pmc controller.

Shyam Sundar S K (7):
  platform/x86: amd-pmc: Fix command completion code
  platform/x86: amd-pmc: Fix SMU firmware reporting mechanism
  platform/x86: amd-pmc: call dump registers only once
  platform/x86: amd-pmc: Add support for logging SMU metrics
  amd-pmc: Add support for logging s0ix counters
  platform/x86: amd-pmc: Add support for ACPI ID AMDI0006
  platform/x86: amd-pmc: Add new acpi id for future PMC controllers

 drivers/platform/x86/amd-pmc.c | 244 ++++++++++++++++++++++++++++++---
 1 file changed, 222 insertions(+), 22 deletions(-)

-- 
2.25.1

