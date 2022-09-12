Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4260ECAAD5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Sep 2022 09:12:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiILJM7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Sep 2022 05:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiILJM6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2022 05:12:58 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::61d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A073419029
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Sep 2022 02:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+IoVBcCa8+QiPIRrng+Q+T8ROMSRqy2/u/N5HFEVxmvRp+dag/oDH7HyMfNgBl1wN6WjToMGPlL6oGDjSfRLgVIC6Lmx0D6vyaDFLXU0edVzkkPtqzp04T6OrvLk0aryNAYfNVC8CH0tSfcmufwRlg19fE9dfMlbWgC8vSOpMEz2FKCL6OgiYXEneFQrhxr6By/TaUu4DqCxfhKKG85ClK+qUodlGnExw09RzOVuMm9QgEAJBNAkywdIs2oOK3f7Lfg7kOGQzCI4k2ILWdNtJjwLhLyUlZH/m38YCRhApdJJ1DCHiAGFA926eVevMeKWk87YNFn0YHxPUfF7F1w3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJL2QtBKhCydE3bL2ffkK2MOQ1Ygg7QZ53zPMzqQ80U=;
 b=SGwxFEpliuUbW7kPRxInFeLnAlp+q8y0/x+k1lWsXMiiQ3cEepkQMeeHPxA2ekYkZ2lMxPlNitbEGtlh/OBST9aTa0pEJhGpOB6UsK2CaTQ88QDuxcODq+EorKuQV7yBKqdaUI2f1KvCFH66mYG0b6c/TNFrFEBEr8p9fwPMZALaaIW29Bd7+XDS9oVOgDZx/KhNYg2y3m0uY4DJ/xfov1tc6RZrtALKlg5YK30jW3QlP3l69/qCBFOdXjj/14QhCHuocbGGA9GZktXSkCdZqy1mU1dYw6CHafg/QvaEDeX5onCfJ8sxs/xIQaWwgIVES50jbej9CTHAclZF/NkuCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJL2QtBKhCydE3bL2ffkK2MOQ1Ygg7QZ53zPMzqQ80U=;
 b=inDnGf77ziKo4k51h89WunVbfDHuQbK2NW4ImGbibjv6Hzo8oWVJG9RbsD2RSpZA8zAgFsNZjS00SNuZjIRmMYP5RyWJRE9DDx6uS0gxR7fZl30+oP+6gDh4W56vktHvKhz7XmWZA8ppnF36uNvt4k/w3WCpmoMjOYp1gzGV6PU=
Received: from BN9PR03CA0989.namprd03.prod.outlook.com (2603:10b6:408:109::34)
 by PH7PR12MB7115.namprd12.prod.outlook.com (2603:10b6:510:1ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 09:12:54 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::49) by BN9PR03CA0989.outlook.office365.com
 (2603:10b6:408:109::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Mon, 12 Sep 2022 09:12:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Mon, 12 Sep 2022 09:12:53 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 12 Sep
 2022 04:12:48 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <bnocera@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 4/4] MAINTAINERS: Update ABI doc path for AMD PMF
Date:   Mon, 12 Sep 2022 14:36:41 +0530
Message-ID: <20220912090641.111658-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
References: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|PH7PR12MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0b0292-2601-4aa4-21c9-08da949ef98f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hhO6PLdyp2W2yPf5dToy58z9zW7CI+RcQNbKGwEhjKmv08nBmXB8wNb2ypT7cKMvHQ4YG12TUFZPl4XJswo2k1P7NWxPa4zBr8hz/vKiMkAn07dIimLFtOZ+ZzPCyVIbWAgbjdFNtPtkPMVNV15tbWoaZ8JXBTBrVnvxD0P+c+MkmdGOjy54iHsfttA0fM361ACbcyUBbWTjXwqNaLOxhtqIkRDZG/bQ7wVm9Poi+li1Tmsosazc3m1WmuyZPR8eadaSfVttZAbOONUQ1yvR8376GSiRcod1fn7MzlTbv3woUOMDJxZb1XEekf9BM0zvZG3a1gZ+j04EfxSkQLbpROHCAHcmbewp/SEFGQcQfKQG9X1C4C+O37EATOWEtldoueHGK2lfv16p6Z+Z124xaH/KKIW8HqxGmNfN83SsR4fXNgn7RlDK4Z3wmNZtSn0KcG71tGw9Dd6C/stBKM3ObvuuzfWMvN3HTTe2iV6DKI5ZHIpP6twrn4YJA9Uzmm2uB1j9C+r4o6TDMkSmj7ivz4W0i4K9zVn2DR5ZfAs+frMDCTW0oAOb9LLkAOiAtP5xr0L0m74V7Tdwd7q3uACJIQWXSWUa5QNe4LUGZ9m08N7KIAewzdN13QO7EcnH98ksnUerXGL1WGfW3kK4E3vFygk5Uy+pnCGxQBIXShlMaTWG/b8S3jBznHSTi4kZWcdsV+DjjMK+YJKf15i1s4XS4YNxn25N6m64V0cFRjRq5zMkaWeoYRPF16KyuSRiN8ICSte7NqoETyYnJUUpik+u5DcKPYw7NKxGF7vEe0OnTbEin5w8sLnpBghPfS7iAsqr
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(40470700004)(46966006)(36840700001)(4326008)(478600001)(8676002)(86362001)(36860700001)(70586007)(70206006)(356005)(110136005)(81166007)(316002)(54906003)(82740400003)(40460700003)(8936002)(16526019)(41300700001)(15650500001)(47076005)(40480700001)(4744005)(36756003)(26005)(83380400001)(6666004)(2906002)(426003)(7696005)(5660300002)(336012)(82310400005)(186003)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 09:12:53.8372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0b0292-2601-4aa4-21c9-08da949ef98f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7115
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Update the MAINTAINERS file with ABI doc path for AMD PMF driver.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

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

