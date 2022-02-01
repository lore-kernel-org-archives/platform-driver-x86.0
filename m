Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81EBC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Feb 2022 13:53:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238904AbiBANxW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Feb 2022 08:53:22 -0500
Received: from mail-mw2nam10on2055.outbound.protection.outlook.com ([40.107.94.55]:20576
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230073AbiBANxV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Feb 2022 08:53:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RK6U3+otuce2d2REgmLQ1v6Bi4qht6JsY5nVtX0mL2oehQHYMNb7Yja8Lf11hKQV72YE7K3JNt95VMJ1K0+ERI/S7aF2o8M1AHJCGGuD0lOZX5hWaFfXzlptBplXJ/Seaq31LtEXoM+0wTZbj/yHqRqGPPCZl9NVF7M4kJ+Pti48H7bKTVjndjpPbefRN61Qz2yaZJTiTg/NQD+gLpsi1s9LhUkhDnXdo3yQZfTKQr5vjSg6z0ScbwtbdRT2hhrd7ds3V7lDOp5C45uwgE6/v0syRgjLxySthU7xGa2U9+AlV9Q/zBPOyqL6fnMoXeCW11Q7rfIg7rRo/a1+3Vmplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HmKuIxMpcQhdjXmHXgLOzNCftX+OoqYCP9bMHlVZf8=;
 b=NYzjjoE99ZkUhWCYXSsLewtrjg36a5FxO9HmL8+0LPHU8OZXVs5VfoY/vAG8D1wmBKfhFV7+9Y9pFzKseU3UpnRwTTzBLuXaIQVqTy2h53I5SSsw52kTTq7xumHiFJJGuq4HWOCDs3vFicR6gY/lz5AOuQrP1p4jiebiJ1kd+X/WmxX1mrLCuKFcq+pz0wELrdPOmCmfsraMEdMJpepx0yLTtP+BAYJYZbTwGeYk3boNN9BZSQXXl7hczrxv2UUObb9/mlXXkeoDdnCTvs7qPnNyS3MefEu7qNEqOYW7qynpySVEtg3dIdZ5uAhXKHMG8b8ZnYuxOBR81UR3pXyjcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HmKuIxMpcQhdjXmHXgLOzNCftX+OoqYCP9bMHlVZf8=;
 b=uuQccUcvA79dYoUz+fSAI1S0eI9gnLTOidFKMrlwEf5OdDLExQpWRrpEUWDPToQsB+pPfqzI+cA9u0aqaayrWNh0quUgP4z0fuk39f9wisiRJqkyfKjzKeWwnlictv3xz4c6fc3DCzoBbF7Bdq12vgy48nj//lRudSbZdOjHt84=
Received: from DS7PR05CA0091.namprd05.prod.outlook.com (2603:10b6:8:56::12) by
 BN9PR12MB5065.namprd12.prod.outlook.com (2603:10b6:408:132::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Tue, 1 Feb
 2022 13:53:20 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::35) by DS7PR05CA0091.outlook.office365.com
 (2603:10b6:8:56::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.7 via Frontend
 Transport; Tue, 1 Feb 2022 13:53:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 1 Feb 2022 13:53:19 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 07:53:16 -0600
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <hdegoede@redhat.com>, <carlos.bilbao@amd.com>,
        <siva.sathappan@amd.com>, <Shyam-sundar.S-k@amd.co>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH 0/2]  Add AMD system management interface driver
Date:   Tue, 1 Feb 2022 19:22:59 +0530
Message-ID: <20220201135301.158868-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73c1bb8f-0044-4222-ec37-08d9e58a349c
X-MS-TrafficTypeDiagnostic: BN9PR12MB5065:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5065F8DB95834014BF42C83EE8269@BN9PR12MB5065.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MzQulZjz3bR2YNWcSPFneGwBB2guRN2JabpQVc70tm1wif9X1iNkwoO+VkDF5eQ7PHQ+chIJHX2ckd23c4rBPzsJL2JoxAp2gEVHHmwy4ds0V6/1pFRUZzseX1oidbGcDCgkjbKWiwShXllMD9AQQVpiJuX+bqcPto04jmpkYGTcQGnThcro0LslZi5lsevJ0yVUpO3mXONbN7xeXhu3rsyXCCGWH7lVFJmmm6kIt1HY3luuijs2QGkWpDDV0bu6WdZkbwScCuJNYrp+qD318x0gbqGJsYHTv2WSerHsHd9+5/5b1nhvf2aj2/eU27TALDKS7GhPWpSl5reMGSLZ3pwyqgy2PFQ1joZ0cyfGpI3n9pvLQG7ln6emmYxCfWzrMkl9tBy3Ji3Xu26qDb0aFQFvYMDivTmssu0hDPSiUUar0ha50zXY2thqiRpd/vsdCZVUynotzddnVxwiJhvcGQYVmMvpjJPYmIZA+5j4FnMqMhZrzzMX32/SvhH0YJ1QjaTCB5VSBwp/HdYlwc+RW8yyN/wkkdh9YXWEhOoOB7wnivHDUYO6+bbyiYHNHMnAInM7zIFLZitwUOIdGBkToNol9co+RkdZ9DkibRXRWOnBXLlrck3x+Y7Is0QK8+4+WkEmzKCePW79UhfCOzX2XYhDWQhy3Ggs4F5YXPEPEP77o4CukK6s9KUcve9gpbJYUQGu1j/b8XbeTYdwjrcypw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(6666004)(54906003)(6916009)(81166007)(2616005)(83380400001)(2906002)(36756003)(40460700003)(336012)(186003)(426003)(4326008)(8676002)(5660300002)(508600001)(316002)(70206006)(70586007)(7696005)(1076003)(26005)(16526019)(36860700001)(47076005)(82310400004)(8936002)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 13:53:19.9489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c1bb8f-0044-4222-ec37-08d9e58a349c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5065
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Newer Fam19h EPYC server line of processors from AMD support system
management functionality via HSMP (Host System Management Port).

The Host System Management Port (HSMP) is an interface to provide
OS-level software with access to system management functions via a
set of mailbox registers.

This patchset adds a driver and documentation for the device interface.

Naveen Krishna Chatradhi (1):
  Documentation: Add x86/amd_hsmp driver

Suma Hegde (1):
  platforms/x86: Add AMD system management interface driver

 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 Documentation/x86/amd_hsmp.rst                |  93 ++++
 arch/x86/include/asm/amd_hsmp.h               |  16 +
 arch/x86/include/uapi/asm/amd_hsmp.h          |  56 +++
 drivers/platform/x86/Kconfig                  |  13 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/amd_hsmp.c               | 426 ++++++++++++++++++
 7 files changed, 607 insertions(+)
 create mode 100644 Documentation/x86/amd_hsmp.rst
 create mode 100644 arch/x86/include/asm/amd_hsmp.h
 create mode 100644 arch/x86/include/uapi/asm/amd_hsmp.h
 create mode 100644 drivers/platform/x86/amd_hsmp.c

-- 
2.17.1

