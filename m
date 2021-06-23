Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B8CC48BC2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:02:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17BA26112D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:02:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhFWUEb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Jun 2021 16:04:31 -0400
Received: from mail-dm6nam12on2056.outbound.protection.outlook.com ([40.107.243.56]:7552
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229523AbhFWUE1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Jun 2021 16:04:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Km9GLXPOmUqRsMwcaZB4lWIyD1ZZcb68NbYL4E1y7+0jCSjwesa/lCRCcpbeKav8WXdsd0ErJmHniXnatsI/86so4BhG3aYpIjanb5vP6zNxgkDuph9bJK29DjZ8jZ1RiJ9FnGnVULaCGNL3WEm4XNluA/DiQ1WiuGJKZVxVbsUV2k8965gMY0UoCm5WAZLrsq5lzibNS4avqup8nmIis+hKG2a2zBHPips10Ll1KZOuxZnQMo2/8KU0xQhS9X6WOioOHyVJZXgyMw3StO10tyjWjh/3h7e0msGay2zHEVwJ9NvoMNMZy9i96s2Ty9H1WAKxTJkmHbnK5QSinYfRQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Gr4l8fyypNwIw/8kKZDY82OLMmo3Mx0g7IwFJsf5lo=;
 b=mMhmeLeaKxufx5vSX/0WE+jcCPAZX16sxqp/TyqOLmKbLAD8ubYjksq07LsV4tUO7jUy/TZ75aZYxE9ltaCumRR4+yPI6jj/D46T9/MVNbGOt/L1EllY1IVBLa+HCAhM8ITAIPaqJtx6oPekfu129xaPggh/J18ZQZPZ1Uhw6NUYn/pvvYr35Cnj4n3rgWNNhwxI9PshG5Y66nEE2t1+G+4qNgz53xTJghUS55AzfEyDLelUGiWHNKpBW5QsV+juGFXOk/Yh1KjYNaTs/PmWIWkEMmfomswq/dL2H4QcMy+2+jnQ8/pwLORorSnOoTX7B9gJgj4wX4ESywz7yniKlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Gr4l8fyypNwIw/8kKZDY82OLMmo3Mx0g7IwFJsf5lo=;
 b=pN08g1h+S/IdlLdlz96NDFIPBork8ZDX+iow6uP/7Zarlt+R87+Qu05X3madcP3GuoMGOvg1XhNDNAinN2Iv+9VN1i4oSpFkwfzNGi0oZmo5fB2J+LbJquxi5jscJ76DRWy2yqJzPvBX0zssAaTmZwRSi6IO2b0G2b3YeqpMHO0=
Received: from MWHPR08CA0053.namprd08.prod.outlook.com (2603:10b6:300:c0::27)
 by DM6PR12MB2636.namprd12.prod.outlook.com (2603:10b6:5:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 20:02:08 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c0:cafe::44) by MWHPR08CA0053.outlook.office365.com
 (2603:10b6:300:c0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Wed, 23 Jun 2021 20:02:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 20:02:07 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 23 Jun
 2021 15:02:05 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/7] updates to amd-pmc driver
Date:   Thu, 24 Jun 2021 01:31:42 +0530
Message-ID: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20346cad-1dfb-41d2-12e0-08d93681c7ba
X-MS-TrafficTypeDiagnostic: DM6PR12MB2636:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2636105FAAC93D678DEA54299A089@DM6PR12MB2636.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 24I+ndBzH22AZ9+zG9IZTxvM/fN8+6CxRqAHUqg0qM5sZ2dxi8As2O8mMZNUexRP+NB0icihYfJN3RDUchDN0bqzV/qvOThasjT7bCbMkYK9D/CaQ+2UFNAnFajs/MbEFCDVam/5OW6syDmjdMBPs6rM4ldTrNzaz6e7wbPwXYtOr8zhLm+8gqLyQoiEPMRfC4REl3anxi2IAdo/lvnjAwv2/NhYwjRgGKn6FIP4QFdxFilQogrkJS9dyYQS/edti7+rAvvbZN6NtmofHW4jcGvGBcQNpEe9w4cDYpCGXehiT17lBKl3UJJqav93FcV4tjdfQfonoycjzmKWyMIouILyn+s5Cy3RhfigFBlgqXYQw0y4V7I/Jv/aVlZiHSY5FSwCFicb+M3LyNj45TjBPojsSSWrYk2iU44yWkIUYbF8YOmYJooJ9/8Hwq3SaaIL1yJx/jEPh49ek8N8NJyqf1YY7kxoW0ivGLHTNXtG28Gm34u/wzPAiQaWE2dZhu9KXk88C715gnPpiO2T61kw4Ptv07a+fzvQ8vVVa5M09SFDGMrof1D3hgRcEVpZIzXQ1W+cF8ujiil2x90vZAYc3vj0hIYWiKZsCSrTOawcQUn7PaKI2IS1nMzlKB/VbPGrtbuZKDUi4xT/UGUlmuMuBz+aB/PhKyOiMhN4v++9VLHEwqXYVdnYVGU40XBCMoNtzN4gy8CiQtOtpMq7sTqtNJ+XS1pp/NGgw7YcRC6KsMg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(46966006)(1076003)(36860700001)(82310400003)(336012)(110136005)(83380400001)(8676002)(2616005)(316002)(54906003)(478600001)(426003)(7696005)(8936002)(4326008)(86362001)(356005)(70586007)(81166007)(2906002)(82740400003)(47076005)(26005)(36756003)(16526019)(186003)(6666004)(4744005)(5660300002)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 20:02:07.7508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20346cad-1dfb-41d2-12e0-08d93681c7ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2636
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
  platform/x86: amd-pmc: Add support for logging s0ix counters
  platform/x86: amd-pmc: Add support for ACPI ID AMDI0006
  platform/x86: amd-pmc: Add new acpi id for future PMC controllers

 drivers/platform/x86/amd-pmc.c | 216 +++++++++++++++++++++++++++++----
 1 file changed, 195 insertions(+), 21 deletions(-)

-- 
2.25.1

