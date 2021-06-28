Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFACCC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6D5461C6A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232749AbhF1LHg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 07:07:36 -0400
Received: from mail-dm6nam10on2065.outbound.protection.outlook.com ([40.107.93.65]:2241
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232617AbhF1LHf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 07:07:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHOAKSTpocCADMFVNjJJLJUpbN3hgImE5+m72gloNTzMYv/0PbntTEpZpdjkoElsRZE82ErKzqXrEO5gYR/GmcWNsyVk+/vWfjQnoRkey0INWe4pwKmVnQOJH1FEVKX23erfYryCdHCdjdnmh8r01Uki6KkG1f4HJWvKShpQ6Z+/EAi1ELaRUKQYatfSWBlppAU5m8B4/0OJ6ZByDvyaVPYG+vKUT38eFHlpQDlK53yedgfqhkFdpe4eZum4rrXpxl+lBBhzijF6B5JKadKWITlCFH9eaT07yeOSsO/iG+121Xz+BhzaKzL5T/LbTqf3YLyNKkHS1qzdcW6dFja2RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbPTyrdC2jjjvSXj3IIrCFpwmlV19rROEHrDzocH+zk=;
 b=PO+ODwEjyWLpZXThn9N2CnKoRzIGNvOtL8gAnrD5UigQztoUOwPnmvEPHC/k2Q7Ju+V2XINEABmBLN2qBxJNFRlIjIzB239qqxykDFbwVAxKTc1TJL73nC1aG8Amhk3kUo3FlOnIP372Zf7uuXKTV+rS6l0zgSqCMoscliTS9v2pQaK1/kooO4UHfPk4XbiOteIGQpMpqmc0f+CX5SuVgKmDBEoL2RdlKUNwy91JVB0MbcvOlJLBUbtR5uI9Yrjoxg/fP+ZJiPJD25RW0NXpbe4warq1IGmhAPdGUypYz5TI5zjEHST8GDdtEGSCsMYRKKDslOtbNPs4ENvlDBryfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbPTyrdC2jjjvSXj3IIrCFpwmlV19rROEHrDzocH+zk=;
 b=DIemErsaukE+Np32B/SyCGx2eXX9Nbx9IrluqXshqc0Klbd04ErmLY/vG0UINuqFAvPNQ6268pJm6CMCBNNo9Q+pcdLeoPH3avzaWjYsu7Kyxq7HjzX17QlbjAJfedvpg5G/X28aoExUDwk9M/lHGTYl6bOhvi3lLiYxPuxUvhs=
Received: from MW4PR03CA0188.namprd03.prod.outlook.com (2603:10b6:303:b8::13)
 by BYAPR12MB4693.namprd12.prod.outlook.com (2603:10b6:a03:98::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.23; Mon, 28 Jun
 2021 11:05:08 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::c8) by MW4PR03CA0188.outlook.office365.com
 (2603:10b6:303:b8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Mon, 28 Jun 2021 11:05:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 11:05:08 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 06:05:05 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 0/7] updates to amd-pmc driver
Date:   Mon, 28 Jun 2021 16:34:44 +0530
Message-ID: <20210628110451.4047142-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32afb948-cdd8-413e-b5fc-08d93a249769
X-MS-TrafficTypeDiagnostic: BYAPR12MB4693:
X-Microsoft-Antispam-PRVS: <BYAPR12MB4693C25184D2710E7A8CB1629A039@BYAPR12MB4693.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ypDkKpw42FE1UIF+PloeGrH7bcbWOgpZQZNMo7msJcvHq23DnLi3TIINVe4taPqynioNilya5Wsbd+CX0FLRnpqWkr5e1nFEv/XK2x9qnxoANW9lSQ8QY0o2A0n2TfQ5KVCgQi6oNmWyVwrK5M5MNsg2Zjv9sNf/QB91bvw+1DxNzJVUfQbfqS0ONDBqVsfhXGjXoG9emHP8alBPnarzlNNIRZfZG8IXgnO8mj7LKYmLH/+O4p6PtdMfx37qit31VWr/9YUrwYlwrjeCtQ6doxv1j/E51hCFbhThsnKkMG8/nYZU2F+HzVRhAj3JVCWaWW2xmMIH5tM+rmRcfs4HKo2Z6Dtpsh81vKT3YOwGpAw1Ttqg2MEELXPY2iQ8W6pxY9s407lvXbvldtGyHCnSCd0wHM/CjCU0b3GX+gJykbSG5FEG5SW0TwFgNpL3BB0A0mupwKIMtzmGwIpQBa3oFp53BFtxEi5paI13jD31asob83cxWyLvsX7cJw6ZXuQkwdZVd+xqUVh0cJjiVINj8Xm6T0vDLbGnJeGjKdPZXCQu+aTi389b+rXIiJq9BsMPbnXGPBwcA3PgFAoq0RkXy3y9GpIsF0OUrCfgwKGwrRUfFHuFnIrUcDq6D8n/k1XEyocGMOywptlZfUg00MN9yBATHRkhW06bc26eWZJ4hagZJQ8WVyb3ypibIqOnM6A53rYexEvqq4HskujPhMQRb59BSE0TCuronVFrOAQTmYs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(36840700001)(46966006)(70206006)(356005)(83380400001)(16526019)(70586007)(6666004)(186003)(81166007)(7696005)(110136005)(316002)(4744005)(54906003)(86362001)(26005)(82740400003)(8676002)(8936002)(2906002)(478600001)(4326008)(36756003)(336012)(5660300002)(47076005)(2616005)(82310400003)(36860700001)(1076003)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:05:08.1537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32afb948-cdd8-413e-b5fc-08d93a249769
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4693
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

 drivers/platform/x86/amd-pmc.c | 235 ++++++++++++++++++++++++++++++---
 1 file changed, 213 insertions(+), 22 deletions(-)

-- 
2.25.1

