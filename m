Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C84CC19F2C
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:21:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbiG1SVX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbiG1SVW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:21:22 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE625A89B
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWBA3AbdJl6gxlmOk3iRc8BI94SUjBFU3Qfol4SZDrsosYuOTDIGyvlR/F7jNQ8n6UGs8zAhwkoAEPiz3PZYOwxankHNRHoVVwuOlhO0VTjP5HZowRlYDcRViw+K0ZHGdBrYZgID1QbnH8icFEK7Tg1Nzk2rz3VGEBFY5rM07V2KmoJxyWOFhPmxvye91BCmLgD5+5E6pDoUlEAlNBauXjc3JWFoKfYymths4/C2zCwO4PRhaCc3xt7xGERhmAUwwufWmJuGGhFf74dhCW3TJzS2hWF8mFh2TvBWtVlYl/hG9tMbEpaUf2vVT4eYCTO7aP9Z24hbqXNUXcD0dnSP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRtQm2T7hI17ayPHw5m7xAZsZT2vxmfltbZDJZNx5xw=;
 b=GYVyGuVqBNY9uTb9/3StqtR38pdFKWB2twJVLNXWCi+SW5rWbhV6ucUw5OOAqjc0Zd7gRUBKS1HhA+ou3RBA/4IJdXjxW18eAP+MhpB2fsiCYGugjN1YKvqisLHl8o2X4gU1tWnGrMgApwNDAy2a5mh07pMvB+DrIqGuHe/bacakgDC2vlEXVbxXvmwunKH1cq4IrD15dtIugjwwCGzuxq07NCejQE7oeRDyGkPjhjupWAV9/ctGh+B7mjsyzELGEwG+0x8pPMrURf7YqdzOGyd0YumUCP5u5nnbsY2/5D/6+Rb9QgAsBkbBU3MTwEIMRvHY80jRj32tqWPb0exZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRtQm2T7hI17ayPHw5m7xAZsZT2vxmfltbZDJZNx5xw=;
 b=SeyxnDSz9Odx1InRGMj/oHJw+zAwSDN5D6Ahe/a8y0w5Fv15jWG9OrTvmXiPvJq4h1xz/HAMNyHk6OAKxMSVH0PNx/31bfYNNhGIvpQmf8WALC20r9liDHX/73iyMt2pUhh9O0VUH+WtndujFo7dqUGUayeP450e09zs9F7rvrA=
Received: from BN9P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::32)
 by MW4PR12MB6801.namprd12.prod.outlook.com (2603:10b6:303:1e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 18:21:18 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::db) by BN9P222CA0027.outlook.office365.com
 (2603:10b6:408:10c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Thu, 28 Jul 2022 18:21:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 18:21:17 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 13:21:14 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 RESEND 11/11] MAINTAINERS: Add AMD PMF driver entry
Date:   Thu, 28 Jul 2022 23:50:28 +0530
Message-ID: <20220728182028.2082096-12-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cdf0bae-348f-4dd9-26d8-08da70c5f6be
X-MS-TrafficTypeDiagnostic: MW4PR12MB6801:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ypvhBCrP79Y7+HFqhKLlkriA1DEAdW0nc3F9S9KCF8BTlCMSz/9C2xfeEkxFuornurk196nzf5Mm47sJSgWbgs5kj9bqMZGz+Y1Vr5nyd76mOJ87kok5VM2MeA4b3i4qJiZBPkVJWI2bJzsOAZmaHAXJq72Rlvlw60UdNrj5TEL4U6mZyaP4ZyDBLrpSOXX0AbavBf2Gvn9FMgvC/HNzDpU//r39ydAX8RpDBvIpkIW2n0IwOtgfsQ7LUXD9aemUG3dNdbB9LFVJZgV2WK33SNx/hML3LYFcm91me+gbTD7jKRSCMztsjqCSwv3yUHduH2Eey5XbOy4MEQf5VXZep4inlXyPiLf2Jwv/TZto1NM9hLgeIWZvFI17P1vosHLO1MjXbVfm0CjC6RftQw5R/aOzi/IZCW4zq0r7RBrghzkGH60kikTzipQqN6Voa6tvvoF7Ej0O3Op8a7voFZ18VyF4vWvfpUGQg84aiMEL/cqivbJV/HxmXqofGv7BuyzPRp5lkq8QKI4BJ+DNhO/blbesPTPR6xCaWq92wu7rzBlWmWaCGaX9Fl5QKCj990jnVeM+Qx1Bqi0xxOLhAHO5Yd0qFzO5PZUD6Zo1keXDEmNjuMU/2IfzM5X8pd/ytTX/Bihl4N3QxmgxNJ1l1JrunrLRdP5IcXsbLA8H8wDDeBXMDQWfhhN3zuZ/BjpHy/+RNPlY379k8U9gfp+mGkpF+ANYszwbbqY6rz5O7QwkBqv/ByuPtvNmnBCIDNp8TypB6bKBiJF/O9Z/q6L9NSIEPRk9eL+HjX9fd1uQ9dbtJbciIMgwlxzirU2kIDHzooRBAKaPlg5vQ3F6lv5zQKRQ4g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(39860400002)(40470700004)(36840700001)(46966006)(54906003)(2616005)(7696005)(316002)(40480700001)(36756003)(82310400005)(36860700001)(86362001)(110136005)(70206006)(70586007)(5660300002)(82740400003)(8936002)(8676002)(4326008)(40460700003)(186003)(26005)(83380400001)(1076003)(47076005)(336012)(426003)(41300700001)(6666004)(16526019)(356005)(2906002)(4744005)(478600001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:21:17.6246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdf0bae-348f-4dd9-26d8-08da70c5f6be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6801
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

