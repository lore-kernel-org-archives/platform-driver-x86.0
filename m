Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B425C6FA86
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Sep 2022 13:13:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbiIVNM6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Sep 2022 09:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbiIVNMw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Sep 2022 09:12:52 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2075.outbound.protection.outlook.com [40.107.96.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194EBEC56D
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 06:12:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/WovyMr9GMHY76Ziaow5IpfS7jv+4aJ73XoK+3wbIm1h6c7KAVO4SQPMITNH5LmK+KNVjCTNPpiwxlvQgcbJLuRZJuSABFaNuk94HDvSsruMxEr7rrwtieNABEvIpd/6TEzdKpFexDUB6xUnbcyixFH2ATk0m67gKDXJHXoDH7I/5OpXn3zapL/RAz71QUgVkM+rewBLxHWnMF6EfD32Ge1MjZYBRYlsUgUdF+eKu/JCSoQ61Eybk0GlGpGKxC6eh9qLNlINLQP2c4ccE27BHs/uDAGQLHPYFFK8fYqcpuamhxgydXHHU2ZbajTcRaSX7kXEIhwOFjOKv/JcdLAzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0l6tfb9yNXHLjK82CbvOUHU/87W0DXT/tsG63gXWCl8=;
 b=Gbk9w3nZAfvT792et+7mXQlYOQKk7TwvSCp0XpHxLNKr426UiMeQzvXRXxPby+LXnXykOewRQZnYhsaxdYbr99IjCvKIe6k5iPJVpTh/a1xKUlAycqmGjlqustrCSu8fQJ7TGb3eeE2nhph/yVbzmtFsbUdWgIgPQUOUtCURo6agTdsAlTrgFbGLR+GZnnbFV/KxtKWktIjJaQCgaEM1MEf7JyloW1K92+bRsY5Bxlj6/Z9yFGgXZldDJQzQ2fUFNFC1JoDnNiy+w1hU9ttR/AVzMMw+HqAiomDaYER7YavFDIwwH+S0t1WgSBsD9jCBukd5unNUiEPxp4bOJnYieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0l6tfb9yNXHLjK82CbvOUHU/87W0DXT/tsG63gXWCl8=;
 b=FeVvRmAsFG/ihKxxgaMr4kSGqCoCqqRExuf5j8G8DEclCJR430hKfl0msnwfXv2gDfYwmuEdjGbyT4lvkRO1gZXAjO8cGAPwrdibL5o5pwMUiRkyXp2bEP+SpxOG6pvt42XFJPMf11Hu6nyIYmF78dNEMm9KX5K79lAW+FFZ1yQ=
Received: from DM6PR02CA0101.namprd02.prod.outlook.com (2603:10b6:5:1f4::42)
 by DS7PR12MB6168.namprd12.prod.outlook.com (2603:10b6:8:97::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.18; Thu, 22 Sep 2022 13:12:43 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::e2) by DM6PR02CA0101.outlook.office365.com
 (2603:10b6:5:1f4::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19 via Frontend
 Transport; Thu, 22 Sep 2022 13:12:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 13:12:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:12:39 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <mario.limonciello@amd.com>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <bnocera@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 3/3] Documentation/ABI/testing/sysfs-amd-pmf: Add ABI doc for AMD PMF
Date:   Thu, 22 Sep 2022 18:42:02 +0530
Message-ID: <20220922131202.56529-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922131202.56529-1-Shyam-sundar.S-k@amd.com>
References: <20220922131202.56529-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT029:EE_|DS7PR12MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: d75af576-4fd7-4541-d901-08da9c9c21d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uqPt0z3FQYBs1vJ01MqG9bVZxNkFWe328LnX2fqgRaZZOEqFwZRX/TMwsfhKDWC8H5PuMEApzAP4NeRNoh8P010wjveHqdrsiRshxQ2IV2MHjw0Ldx4bykWDCbxr+WzX60DHOegoSYqJbxWXEhnOLIs7RUqopg7z+Hhh16zsl/KfZyPFO5cohxjW6ttUe2MAHBO/jy53G5c4x3sUTXQ2jkMOwK4n9FSFW8oO675iX7fo+QILgZ6nLO+uG9VkCPjAAjPOmG0WA1dAUgSinDusEDlJ4oCfhZfWCVGy+hf+HYDFfMEovjJpFCbKpjtj/9RqE1KRbrbZt01hLmJJCXsOwjJ+DS6lvKnl77cbn1lalSU7S/TCNZZDHA+YYQdQkzb4uskS2bsN+cZl8UUPR/lm2/oS1iR4mIbDcM/r/oSfkYsk/9qlfgmY93UqdoBKzMtj4wBqcxWu4hhAP+MJk7TJfKmudy8hAVLZUegvPjPyw8Xr4CuTDFlFOHlOSxgN/9omzkIlUvNkthk1j2GHRTCzyKMBD9Y6M0IS+r0MFoi8bmNp+fOGnmHXFHUCF+B7mvy93fBCDYq9NRMumbv1YkGqq0C13jAGwaedg3YxU7YwlgH6/TJjsBEzTTQK6kS1ehw00TBuxD7TfSlnjOYLqWYs8+JEZ/BkxotHcpm8yKVdHhbdbLsbgrCBcAsntrWD4a0kuxj/f/EKFS+YQJVXB8eL+P70qIMD1TnMcWDF8kTRuEAIqLIk9g2qqPcYuy/r1zSUNIaegjoNu6NpC/PSOsuwWtqVrToSLjTL2QBaw+VgQp9CeGVT/qVom+3xkGPeAmmR2u2RGZDnkrPgchghWgS8GA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(7696005)(86362001)(82310400005)(26005)(5660300002)(4326008)(83380400001)(8936002)(6666004)(47076005)(70206006)(40460700003)(8676002)(41300700001)(70586007)(2616005)(36860700001)(40480700001)(426003)(186003)(81166007)(36756003)(16526019)(336012)(1076003)(2906002)(356005)(82740400003)(478600001)(110136005)(316002)(54906003)(6636002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:12:42.1484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d75af576-4fd7-4541-d901-08da9c9c21d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6168
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

AMD PMF driver provides the flexibility to turn "on" or "off"
CnQF feature (introduced in the earlier patch).

Add corresponding ABI documentation for the new sysfs node and
also update MAINTAINERS file with this new information

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 Documentation/ABI/testing/sysfs-amd-pmf | 13 +++++++++++++
 MAINTAINERS                             |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf

diff --git a/Documentation/ABI/testing/sysfs-amd-pmf b/Documentation/ABI/testing/sysfs-amd-pmf
new file mode 100644
index 000000000000..7fc0e1c2b76b
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-amd-pmf
@@ -0,0 +1,13 @@
+What:		/sys/devices/platform/*/cnqf_enable
+Date:		September 2022
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:	Reading this file tells if the AMD Platform Management(PMF)
+		Cool n Quiet Framework(CnQF) feature is enabled or not.
+
+		This feature is not enabled by default and gets only turned on
+		if OEM BIOS passes a "flag" to PMF ACPI function (index 11 or 12)
+		or in case the user writes "on".
+
+		To turn off CnQF user can write "off" to the sysfs node.
+		Note: Systems that support auto mode will not have this sysfs file
+		available.
diff --git a/MAINTAINERS b/MAINTAINERS
index d74bf90f5056..255527be7e24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1026,6 +1026,7 @@ AMD PMF DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-amd-pmf
 F:	drivers/platform/x86/amd/pmf/
 
 AMD HSMP DRIVER
-- 
2.25.1

