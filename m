Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84132C19F2B
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 11:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236598AbiHBL2L (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 07:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236938AbiHBL2H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 07:28:07 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA774B0DB
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 04:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZLI2h7hMbCXxKWPqKJpSmGohSPoc5LERvMg995ry/x4I8gHGzp2N9piyJhSrYtH5ddJvPGAWe7IkNGMrAeTnENkxxqIPetNWJ9s13fSXf3f48YjjHpPFnF6hZwVpEeyZHL8HDZpF6iLLWkGCndaeljM2ji/BnloHy03TMX0NGb44Nx/TUJFxjbFFBv/Evz40fwUohPBAQAiwnMbQ76YrMOarTfc5zuZncsm8TOdcnMA2McFJuasORb0baMEP8bBkfRQgMQo229y+1pn8wKqAQJNNp37XEGqquE6MT8SvuXNctAsVN6HSOr8j4s+EjrBlG+IPLBa8zIBhSECsV6OMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRtQm2T7hI17ayPHw5m7xAZsZT2vxmfltbZDJZNx5xw=;
 b=IZTTu7E78OJmOkqi53xNDQSgWmuC4OWkQH7TVtTGlN5JlX4OFZhrvQrJ4THKoRN0qx9IASKE6lZRAPqm1XU8DIhPqLRguV64TqSy88/ltTq5w9sqYys1hS2uNA/WGam78Myu/INuMn7x2c4PS2npHgSY8aKTqTWhnSiZoWTJAoM3B1nCDYatKYecjZBlCPS6il4aukb2JGJb3Vmkjy72cFu7A2zkj7RdwmD01/oLziFWZeJQ1dwbNV6IXwsq9tYacLMMLynF1Tlt1ttVWR8lR9ykH8BSrHoQfCGAT/QcPxmNJrTAUN48IGcBfvMuS+RfnCHdqdZ2fw9Etqmw224+Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRtQm2T7hI17ayPHw5m7xAZsZT2vxmfltbZDJZNx5xw=;
 b=5TivdtFtoMFPj2UMmRvR9ANp79cApIbXz38aQpA68rtseUDe/ejSlQ27mlzUEeZZ5p+9ZJIqjQiqjntEs3V/LQ6ZqRHRk1QSEAmw3Njl5vX4SKFZPlRLtaph7lgfl9BXiy6mnp+fB3hmy0zsDFzaHw+vAOCqEvh1oD9Lu+dcURA=
Received: from MW4PR04CA0134.namprd04.prod.outlook.com (2603:10b6:303:84::19)
 by MWHPR12MB1872.namprd12.prod.outlook.com (2603:10b6:300:10d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 11:27:57 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::2b) by MW4PR04CA0134.outlook.office365.com
 (2603:10b6:303:84::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25 via Frontend
 Transport; Tue, 2 Aug 2022 11:27:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 11:27:57 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 06:27:55 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 11/11] MAINTAINERS: Add AMD PMF driver entry
Date:   Tue, 2 Aug 2022 16:55:45 +0530
Message-ID: <20220802112545.2118632-12-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b853bea-230b-49ae-29c4-08da747a0ce9
X-MS-TrafficTypeDiagnostic: MWHPR12MB1872:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qSaqMFGvhW8YEUWnbmteHRT60ruH8ofVWiMTHprJWh6k4EMODcRdc/hXKzrKVAqrIzbrraWZo7RcP8SPyGgTlcjGOSbVpWgwkxu4sxJe0kbuF5wfyWH+1US9gAyP8JYLJLisiwDLtuldSlngOHSKFhneErAahG4i5VzJI3RNLRsytJeS51EADbpUYQxak0R9uDBufmha+35BuZ7jZWFx9crgCtrxwAzWySwfiaxo1agtbjLiLcrEsY1L3vf6ZJX2CDd4VXYLkXhTNIh2KFL3+AThHh/z39uUJzPGu3vy1igmr1y+zPfoseblcmsYBhV60PIuXWlHnQrB4O0fuWTjr5CnYtbj9pZoaG9oub1CvzxdArdy19BW0sLClIc0JT+oaxajs4ufy4VTrkhIm2PoENn5PsQU34khrN/LMZrPghoL9/Jdee6tRaXUJDqpzcxf9un7DPEvcWjQCrAHWxg8Sjj/7V3OGfAWkFn0uu9+c+qRQo/a4GN6tILAlW3Z7tNxYisFSYbw+6nE3vEcMKzgFIRCk5HLRc9X5l+ijHc+AiBQxxYwofb2RNUQcHjq59INPwQ6UUE9ORJubz7ZH+sbAdAbkGoe/Iwtk/Wc+QjZIVvtfq7t9B5tjp+58PSGjR65DWm9T3G72u3HrsVJ29Btecnt3ZZsHrFL/eutYxo6RdsKdfClq9gd8d8+D+ewspRnHMO/diSDBp/CPIbiHl/06OW4vUYc0MR3ouNOy4VShfY3tg3eNpIhqivsWK7uCHkWu/noxWQBQ7O1JiZBn+rFDo9biCGYMJzGmBOlHXYt6onk3VrjvravHwJGvU9VA6P9q0kXpcgC7CZp0ueI9EEwkA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39860400002)(40470700004)(46966006)(36840700001)(7696005)(41300700001)(26005)(6666004)(40480700001)(316002)(54906003)(110136005)(478600001)(86362001)(82310400005)(82740400003)(356005)(40460700003)(81166007)(336012)(426003)(1076003)(2616005)(16526019)(186003)(47076005)(36860700001)(83380400001)(4744005)(2906002)(36756003)(8936002)(4326008)(70206006)(8676002)(5660300002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 11:27:57.6067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b853bea-230b-49ae-29c4-08da747a0ce9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1872
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Update the MAINTAINERS file with AMD PMF driver details.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e01478062c56..d3f6cabcaab2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -998,6 +998,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/amd/pmc.c
 
+AMD PMF DRIVER
+M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-amd-pmf
+F:	drivers/platform/x86/amd/pmf/
+
 AMD HSMP DRIVER
 M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
 R:	Carlos Bilbao <carlos.bilbao@amd.com>
-- 
2.25.1

