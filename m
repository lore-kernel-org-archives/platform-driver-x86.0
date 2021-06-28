Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B89DC11F64
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:04:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FBBD6195B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234567AbhF1SGv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 14:06:51 -0400
Received: from mail-dm3nam07on2083.outbound.protection.outlook.com ([40.107.95.83]:1120
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233028AbhF1SGv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 14:06:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D47soDsPrM/Gh3YUtl1GCRYqrbC2D3LEFBh+bPypXvi7a43WQmh+cpVsPVidarO3exF1d6iVe4lwyn+fOURE9R0F4+YzuoZWGEE7oxi21rGupa0MbhsXGGpQOCzqbmC4ud0PYndUCNILhzlfZ5jeyMT0cQZmsGf/9Fj6/k3PRDDRFfxjkaD/fO3DVRtWzx5+9n56XHEScaL1fTFoY0TgEi+JmYxdbZhnph5YrV9zliwNTGuSK55bV5tq6JrjyebW/oonkI+UvV1CzY/0NTTMPQYv9gEq57W1tx+vJBzKudORl/LYPkqSige/GVwGiyISvmcT7MYdMkLWF0OhjTu6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evTXcMMzORmdr9CLkaeqyuxroiig5BWoBqc4csCfy9g=;
 b=FJYQFBIpJVw09LQUshVCBSgQT4EiOhMrejWAp3yhdrRTyiqb3AkDS1U/N+c0UaKGX7jcVGhyacrw42t9FltMLn5mrtzcftKPTJXRPixe5/OSjo0jCRYm2ih4BO9jaa5el1GNWH378L1LzwsoICz8eoIH5rhkoa10RxFZVX9S7XzR8OtsL0do9PnH6Xz9dqSle45mYEa8x3zdhxSN7whNFCkR6ly1P+A2++s50pZpZ5HMdnw5BV4yPQU27l70/M1uRR3At3r3FkVF36XHmf+DoV2l4UEnCeGmYCn/nI/VHaHiqyxkhLfLW9MhI+REYEUIjaSpnc3x9LjfQkxmVGKbLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evTXcMMzORmdr9CLkaeqyuxroiig5BWoBqc4csCfy9g=;
 b=5k1Ew+4Ms3JdMZbfHzEGWMRfQRN1kdq8QqwOjlADK9Uc0zRr4ToUyptRAnsUFPtEytf9D2CwqFa1o3sLjd9IGcotSuiokMvn7t7lmkmGxixA8kcl3C0/50ZRMZv1kFnCa94SFQ0WHazkHCkJpIXlXkLtqd0qAhBkrb8jFKDNL4w=
Received: from MW4PR04CA0306.namprd04.prod.outlook.com (2603:10b6:303:82::11)
 by DM6PR12MB3147.namprd12.prod.outlook.com (2603:10b6:5:11d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 18:04:24 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::48) by MW4PR04CA0306.outlook.office365.com
 (2603:10b6:303:82::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend
 Transport; Mon, 28 Jun 2021 18:04:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 18:04:23 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 13:04:21 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 0/7] updates to amd-pmc driver
Date:   Mon, 28 Jun 2021 23:33:56 +0530
Message-ID: <20210628180403.236553-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d71e4b8e-8f23-4e17-fd74-08d93a5f295b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3147:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3147BCF6096E726AE70D15879A039@DM6PR12MB3147.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3kkB5grEXek2AYP+YUVQR9yyqh/ffxak1QdJJ4CI2UCVkdH1IO6HFKA0ztqO7Xme7Txc08AZvKHyzxuxUb2242sb43CC78LlN87+LUXM2ghwjDcngw0+RfJWphBeXsCuJARmQ/aJ8O6MSGrG0KT5dxC882E5NJp9nK9wrX9qZV4o29ZQf47mRunHdTS87IGabupIVr3GDun74qE03DFtYNkUHkc8U99lrexusktRTbB6MCrq5ZRRjMvKX8XrAjHtaE0G9AQLkZDX2Mq2Qw2VwAm3rUBIUsad2He07EfpM4Zwgf1BpC/MGVIpNL0CZXI7c+RFPW6P/5Hh6c1eXKXnWct/J+ELzp38f01ATsIrDNXYhk9lumkcBmzT48exjy4Ha2elru7+1kCIXOyYRXLvzgsxYj07fVtm6yAox74aWdMG86WwK/gzMHo0nrZd5mKEtCq1v4YA2teZAudwnpTRfniw4FEV2orE/zzgHma3lgTrBPzPyazd/I7LHc3BTvnIdtmDPNmhR+C1LbJAAmV3rHj/vcrWCUMaMeszGuyA/CedXnd/BxRG0PxZgrtQXkyPYoKBhFVb9yXcDw3IFle2Vl0bv4fNJ65A/+OGHTeG0d/q4xQOSECAgQ2U1C13531vm6EgADvvnZZy/upbTOnmnLKdvM4Ig6u7U4G2/a+5KuROHz9peQkIGhvZ6le5f5SnP9++e+Z9i33swVxZKvlosZXwfPRnUO3Nf1DFK7JCm7o=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966006)(36840700001)(2616005)(47076005)(7696005)(86362001)(83380400001)(1076003)(36860700001)(16526019)(426003)(186003)(26005)(336012)(54906003)(82310400003)(110136005)(6666004)(70586007)(4744005)(4326008)(36756003)(82740400003)(5660300002)(81166007)(356005)(2906002)(8936002)(316002)(70206006)(478600001)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 18:04:23.8175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d71e4b8e-8f23-4e17-fd74-08d93a5f295b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3147
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

 drivers/platform/x86/amd-pmc.c | 245 ++++++++++++++++++++++++++++++---
 1 file changed, 223 insertions(+), 22 deletions(-)

-- 
2.25.1

