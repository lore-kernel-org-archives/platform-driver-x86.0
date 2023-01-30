Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB78C54EED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 16:49:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236494AbjA3Qt6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 11:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237237AbjA3Qtt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 11:49:49 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42F8EF85
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 08:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbyqfHBG6k+QPWDMipvKXBnPh+7BMyQgk5YR0xR70xRD7XM3GsxtC3pAUp5CKmvWOGQAWaBd/V3QfJmapaM7G2lcMRYQwN6VLi7+wwj0FfTKc0a2ZMR91eCaYqSvVVrdkR86xd1/XoCcaZcpHPjdg9iS+2uEgiL4fbypnbVstcVfSb2TBIdBXRbB2oe9l+cwVlxi8ePNuWOu2XwUYN/pMhr4/qfwlC5NL+yOl2EUf9YNzHIa5Vo4VKj3dyHOmCDTk897Bpe8OuVTSQgNNwgUZst3OE+d7bpiHpo0rD/7HXveRXZtIisxl1d6/wkaaiqFTOZQz02Idm9bGlSL351Wgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0ioLbqG47R5Aoj09C5GlC4uRZFhm8tM1XNt8tTlEQk=;
 b=GnWOadO5EKBg+ukhEijs/WBjWMnoDkCYJjkD+dlmNKM8tKgLWdE7qLgJgtsHUAz+MDw4sPwrD1BYT4uTE238tqD/rn+Fh7tVTUdNyIfeyp4JjN58WlJMRYIEJPUPChclaDAQoPJo6Tt+tF29TQI0PK6MspvQqzWwwlWrTeiH8LKV2TuDPpv7olgfatnFpcdwTteOCZ6kJNenS4ZUB8S9RyX8WOaTaiSBZIWngPro4EVn+UtGmIZMtTG+Vmm0HPI6IAozbiXqz3fyHx2Pk+rneu75VuCx1sxWB7sIcYZ5HmxOGZx+nk4oB+AQAII/U2yVi4P7ja0Jy98k/qTBmF2oug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0ioLbqG47R5Aoj09C5GlC4uRZFhm8tM1XNt8tTlEQk=;
 b=GLHi8DKt9MAByXwPaBKmulVJq1VyKI3ALp9qfrnUFh2YQwvlGYhjw//zZdFoRHDHr+7HUJafetfjdciQ3UptUJ+ESMi7FNTpTN7nryaKfRM3EOZLKYcvtpRimpS5NPcESU12NVvcOYYzhMYzQ9ukrLzS3tU4cJqeRd8myO+DHGM=
Received: from CY5P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:b::14) by
 CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36; Mon, 30 Jan 2023 16:49:44 +0000
Received: from CY4PEPF0000C976.namprd02.prod.outlook.com
 (2603:10b6:930:b:cafe::6b) by CY5P221CA0007.outlook.office365.com
 (2603:10b6:930:b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 16:49:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C976.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.19 via Frontend Transport; Mon, 30 Jan 2023 16:49:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 10:49:40 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 4/4] platform/x86/amd: pmc: Add line break for readability
Date:   Mon, 30 Jan 2023 22:18:55 +0530
Message-ID: <20230130164855.168437-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130164855.168437-1-Shyam-sundar.S-k@amd.com>
References: <20230130164855.168437-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C976:EE_|CY8PR12MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: e6cba4a4-3be5-417d-a54e-08db02e1fc62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2qPTt2bfsmmNnFNp50IMW0vJg3ybua/JydfEt/Di+jnlxvHrsmC2ocqsg7EpzeSDdG0rIRMAqT9YDac2gb3ndgVUVY3Fwnc02+CRnoF6hvpXMVbtG2dq6rXsuqrxM5MjX6WjkAxI/HHBEipTm+DXGXObUvpqxlkGFvyVRnFDsZ5XsSzuD9VKIKv3bq0fCoj/HiB/Kwl4BixW70RXPb0rr4fH/+Z6qzVsHRKZeWrKBV63nVJXJNhf2u1ipWBRveoECc1vq+XROSQq+OFT1x2weZOvVmAyqD9PeKA/yrSk3SXkPVh7s1WgKMqhjsEFAW1O459Ma/0zcJ8xAH23S/liEAJZPOVzLGPkrlpTM7zgXrYd6vkdpH+6SsQMMeuUFbF1Q5o4fxbKl4KZcYPqd2DPFtLxC55PewXdGs/Fh0sBQR+agFv7h8v0eo4EtsldkUlrbwu6jJVeB6h0zsGF4le2Aiy8MraZ904H/USDOxDi3MiLhGnDABWb9pyC1oLxTN9NqGJyhBSPJ5xHklMmWYlybTq/uzS3pqAcYOJujMAsp4eF9kihTaU4tqEwDOKKYTRhWFDmlaEYtylMEDvqUorhSdd6JgfZqsPb2LzBZuowI8zoE+tunqeTA41aMoCLB2o/VZ+3DcJeJH2/LgVvreJZ0DgVinLpHCAJgygnAgIWs8hSBNIYHRl8Z1rLeZUaCGeBoCWmxGy8IbaLgFZxwDwgvJcKM4WN6FFkRa/LonriBBI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199018)(46966006)(40470700004)(36840700001)(8936002)(81166007)(41300700001)(356005)(40460700003)(86362001)(4744005)(5660300002)(426003)(47076005)(336012)(36860700001)(2616005)(110136005)(54906003)(82740400003)(316002)(70586007)(16526019)(70206006)(4326008)(40480700001)(8676002)(6666004)(26005)(1076003)(7696005)(186003)(36756003)(478600001)(82310400005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 16:49:42.7184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6cba4a4-3be5-417d-a54e-08db02e1fc62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C976.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7706
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a line break for the code readability.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 9c8d04a591ec..6a5ddd0f1e8c 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -105,6 +105,7 @@
 #define DELAY_MIN_US		2000
 #define DELAY_MAX_US		3000
 #define FIFO_SIZE		4096
+
 enum amd_pmc_def {
 	MSG_TEST = 0x01,
 	MSG_OS_HINT_PCO,
-- 
2.25.1

