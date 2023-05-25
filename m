Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60FCC77B7A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 14:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241156AbjEYOUA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 10:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241613AbjEYOTz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 10:19:55 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE162199
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 07:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiO4cilss16K3D8ysAherCochi9s0iQR11Vuz7shj2l/mWethSFlmSnQKjbtOOgS5sm90xcCVwgNA56Lw5pyK3mrMqPl5jDzmw+ttQza4jmVr0QPIBbY8X1oQj4IZLTc563v7sS9pVQvASsYef93rR5vqYrV4lXnYzSyWnRcz98llTVrWqihLUsfk6YOLseI7bLS2xXEWAFb7ZA1wue8+NzkfdAQkUZP4MuryLtIBMqTj3/otRhn9qNnQW3XgO9ihKmFSu9Nq+IuufhjTSNIWGXx1ap8e+lEwcyZeAMqhrOegZnRs0fydkuLZZl/Fx7PQuIQApgm8A/YhISlgxbnJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnx04xDAQwZrnMfcqAZeLBOrLpja7+TODlzNse4BUyM=;
 b=XFVsLo93YTy47vmor3A5xpN6l+Qj6xZJQDmVTe59Ox8S0p6ae6lFaWK6TIvbzFQRVmujtQ04cUXeouklQcz2BjwEMEm32A9PiNOtuABbw2CYTrauKKJKVEaPxu4pvwZoB3i7fVw4h3Q26pOZdNoTIW0yJmTqu/Xh8MIk5NaBAKvrmoNsEXq/fetx8CDPZ+avV5gk4CmXKdJSxxW5ThjSX+jm0DNNsAddWvYSiX+czC5zEggMub592aTBtT5JX+xZO03MtCZPfR7figLRCeO+hXvwUimVh1e5F2Hf7Fgp+033aNqZwIDYaH5gK1OTPRT9x+49MdTnfW2TAQQyYAQHww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnx04xDAQwZrnMfcqAZeLBOrLpja7+TODlzNse4BUyM=;
 b=k86DtXbsikG6PSx+OzmbaQxfnzeRq81pGL8xK39u6rJehtY1zDkfn+kIK7kt/Btfs25M/wns+QKi8pC6exKyGNV+N079qRizJh8Rl58KZVjSX+Klrx8pqvupaQEiGCsKkbU+fySU/cApYzE4AOdmb460HOQQevis9yJmoQQeyWs=
Received: from BN0PR02CA0017.namprd02.prod.outlook.com (2603:10b6:408:e4::22)
 by DS7PR12MB5960.namprd12.prod.outlook.com (2603:10b6:8:7f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 14:19:51 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::d4) by BN0PR02CA0017.outlook.office365.com
 (2603:10b6:408:e4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 14:19:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 14:19:51 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 09:19:48 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 0/4] Updates to AMD PMC driver
Date:   Thu, 25 May 2023 19:49:25 +0530
Message-ID: <20230525141929.866385-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT040:EE_|DS7PR12MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e961e4-2e95-4037-803f-08db5d2b1aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQ8hSjKYC47yRO3SMlL1f35v2lyQmu5szxDtlHc2qujdRDsvIfShnuThSBA9cmpO7SxAE2DuqAvxCGtjmBSmW3ye3j50KTiMcsLpyMVafBbMYzVuridt9cbazFRQ6M6LM6gxmQSz/6gXw/t5FDL/Od37BiU1LfLJrvqdMWi5SFw0aT/wPH7I2p9xrDeUWc6uo4y0YWPQ0RLmv7uRrzsLW4Iydo7yj9IXv6k469IQ+0ZESO/3UcER6XK3K9AEq1psto8ywqWe1gkjtk4p03VivjdVXdyAXgCJNO7X+hFpOCQdJmt0V5hOfhaPbWxm3iW1o4p1xwXuRMrAqIR5TbvQrR+B1TZSfuQtrmdntq0R4+k0ZukSwX29aBF1MTtJap1WuK/7sx/vcb8MYn6A0i0g15pqUI8X4htu48/kFYMLER+rhTbKVXc8ZbfnzHt/Y0FQqJZehqpsLJDll+3spIkQix9jtIR+JVJgU4lHuSJ8trUJc88upHWkTicXRWxTRRKfoEsV0bu4KTfN/k5hEd9vpl+zWy42MH8ScLglh/D20KMjh0TMkjVE5widM0RQ7w2Im4Bh/pXJMkjd8OhOIebfitiqWci6FXOv5X54BFd8OzYDBGh5Zne9JW+APkgPiq8o3cDAslkObf5/lrXU3kYhHcech+7/E1hVHX5O4gS/HFm9JzvcKuv5xUsvc+p4cSTT4U/kFZ1C/+uZ+/lGgCLnyYcuemLvTC8nJvfWMoIF/YKB6etNrpBupfA/OefrIQQH9zs40SVUjEQ4vzInZTUqlQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199021)(36840700001)(40470700004)(46966006)(83380400001)(36860700001)(110136005)(54906003)(478600001)(86362001)(82310400005)(2616005)(426003)(70586007)(16526019)(186003)(70206006)(2906002)(336012)(4744005)(47076005)(26005)(1076003)(15650500001)(316002)(6666004)(82740400003)(40480700001)(4326008)(7696005)(41300700001)(5660300002)(40460700003)(36756003)(8936002)(8676002)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 14:19:51.4422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e961e4-2e95-4037-803f-08db5d2b1aa2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5960
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Series includes fixes and feature updates to the PMC driver.
Series has been split into 4 patches to incorporate the review
remarks from v2.

v5:
 - Change amd_pmc_is_cpu_supported() to amd_pmc_is_stb_supported()

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

