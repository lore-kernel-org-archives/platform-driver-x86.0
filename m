Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C5FC19F28
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 15:14:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237412AbiHBPOu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 11:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237414AbiHBPOm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 11:14:42 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 526B123164
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 08:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJR4Sy64wDT2NT+yBtl4z+mNFlZgMIHJfpvxiGwP5WUOxOUHaJYIC9j++BxePR9nvouRn+9EmNJmYS/PGQ8YBngSfyb7QRy9heDj47+YAScXvs2FFiFk6csyMfkKojJ8/LFjQMu7xtmN8Ibxwj+Tu/4BGSAANEhiffVkKUCpUwL34/gFwf8FmoWqNSbgjPUeb9LpO7dbGYK3xMe9g3ijRD8Z8t/yPwoqhhpVB4zdaUpc5nYm2a9kxzxOwlhwyCw8JqJ8cLW2PnACvegM6OB6zjVBh1ia3jVd5Usg8av7dE5EuTwUKufmQ86FHcj6MI+f27PePlC9jW+rN0qW1AZh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRtQm2T7hI17ayPHw5m7xAZsZT2vxmfltbZDJZNx5xw=;
 b=hB6rxQ5D+sj1TezWtvdMldVoRk3CuzagEqQDKFApzL/MPuroXxUTAduesT1k4xkQi7Jjakyg2Y8V7I27jFxagEImev2gzs+D2D/blEV9vTJytS4B2uhTqFpEtHXYtoFqykokfIQyodkQDY3/3JHNHwVrfiZy0z3dvU/M9TA6oX32yPkz6cnGbn5st6SRZfTMzsF2IYYxcin7BGpHHHz/LhW6bDkKwKL4rXoY+LQPNVQf87wm0uTEJnxMXJ7PmXXMDcphI51bsKVyZDfp33mUTJzHzaLhrDIQd+oytat5yZFzmT4BGh9HHzgf0GQtqxVI+TQCdeOAZMoOhwO+NKf91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRtQm2T7hI17ayPHw5m7xAZsZT2vxmfltbZDJZNx5xw=;
 b=V37Yc+wfJS919/LY6A9C2DJJ04E5jbEBV9N+vs9t3vGuya7D/ao1bMz9Bf2MwXNFg3smqJPXmzH1ZX8VH4lIlY2ZdccALhXglaEQi8Dio312iUV811zp7AJoafG53YoHCcd8RtY9YcswWRz7oLY5sf2kTizZspFtYl0EljF40b8=
Received: from BN9PR03CA0636.namprd03.prod.outlook.com (2603:10b6:408:13b::11)
 by DM5PR12MB1339.namprd12.prod.outlook.com (2603:10b6:3:70::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 15:14:21 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::b0) by BN9PR03CA0636.outlook.office365.com
 (2603:10b6:408:13b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24 via Frontend
 Transport; Tue, 2 Aug 2022 15:14:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 15:14:21 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 10:14:01 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 11/11] MAINTAINERS: Add AMD PMF driver entry
Date:   Tue, 2 Aug 2022 20:41:49 +0530
Message-ID: <20220802151149.2123699-12-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
References: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1162d501-ca72-4c56-2993-08da7499ad3b
X-MS-TrafficTypeDiagnostic: DM5PR12MB1339:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P4mQAQCbIBXig9Ax3Xd1z2V2qtRQgc2aMtAUnl4dd60AQp7yhsNswGCwlppe1R/1K56vVYpvEaX2eKTzlb0Q3f5mEKwoUp0gQ2KHdQV8BUaRWEK2GKNhMpUcCNyEqdpAILIEsl/VedMd7mpKRGtNDDc9gbmbRT5glDJQP9V98PKHK/ASNgydXnW8/LUeCTcqqXIakSkSQma7CSKmTGem3Vj/fu1Hc80iifLwAPfEusLTo0VwRDbv/0omIdZKeGmRkdZ3XBwskucXtfK2FNKnPMcIKDplpvx00hcH609qL3ndYAfWN732ooFa70ZB8XEv10Aq1fomWQt15N1vEeURidlFFAbJVQtDNHumSPfEj94qnVz2D3o+fLW+dimzgiwnm7SUQFh8HIGXZHjPjEcMcdEJOy1YmTY7CvfOkl7jDwg3K4e2+N3/FbOnFohSNBx86jBKIqp/YF3TD3MOi2rmRyJRRGjeXCgLX3VGEZRMQoxVMInSPZbFKhwxKo64ZZZAx9xRoWgiyQoyCsAvsgBGbbkK3+sXbvYCC48zM6pO8cNRwRZXXM0NIxJQYDAX8CweE8oyf+l6oOOJ6TnKpWQGXPTO/X2LBW4QxOmVHMqYpJc6zaqGjOvsQk9MizWCTuTmPU4YNW3+9o7CuGoIUh9OkBBa82Oq9TWzXuGbqkRBrR8K6EuRQZArKtDPHmFAObswA58i9M9VooPM/uc/mV1SD+b6kx9pqkmWkGVXeJBdbdaAGwYkd/bFYDwEjV15vX9Omjc8oiwzW/L/SrSOMA6eEj7ej7snAjMJhNcSGwRVOJC306W54QvbMJmXicsHNdxcUoHgyZj7F0V9FbB/nxVcjw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(40470700004)(46966006)(36840700001)(356005)(4744005)(82740400003)(81166007)(8936002)(7696005)(40460700003)(5660300002)(70586007)(70206006)(41300700001)(316002)(6666004)(40480700001)(54906003)(2906002)(8676002)(4326008)(426003)(336012)(16526019)(1076003)(47076005)(186003)(36756003)(83380400001)(36860700001)(82310400005)(2616005)(478600001)(26005)(110136005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 15:14:21.0406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1162d501-ca72-4c56-2993-08da7499ad3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1339
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

