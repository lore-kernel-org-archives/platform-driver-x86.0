Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698FAC32796
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Aug 2022 15:16:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240269AbiHWPQ5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Aug 2022 11:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244276AbiHWPPa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Aug 2022 11:15:30 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2055.outbound.protection.outlook.com [40.107.95.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3AA516011E
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Aug 2022 03:31:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8Q3itRhoJD0isgR949doc+rDX725BuDnq2xmUDJ2y8NqekC5atp2xvImhvlfQK/+zkl4jIUkEpahRVXkP3A/TZrUpT2zMuIA/HQUZKmELkCxIJmo872/zjPfsWREPtTYLLuVuBI1sj790Q2u/kJPLUK5pVegLY5CRgZDfK4CW/QNzN0FdqlNlZ76suZ4DShru7OS8FjgRbxA/6VjjL+/hB674DW15hZ90zlEj6XhV9TlmIGfsdEmtWIDYyOKB2MFAM5gYAvzjTQpSrHF8UPVdhruvOWf0PYFfydXxtV8BwvKLC71dWec2X+kHQdZ4F+LFbzn/WcDRMRdjY+7mTpog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGZv40rvLde99cb90vRWRrk2OLr9veoYcxIiLje4ioU=;
 b=i/znryL5lIPZTBOHwQ2Y4unlHkTBGNByhHFpH1QFFKHJh0jVHrZYjmA/RhDViziN6jlsyTZ6senKks11WgQIXuh47Em0ZntEDlTldjIzAvAvW3BYTm/1YAq/k0w1pJYAh3bSZovAwILtKWZKK1zFoHuekWUQSKes/MYD13/dIqP8IiG6e/d7/68oYO5+Cncqp1dZ7mYAt0Wiw50XIfas77OiFtyuzbPqe3oD21/k1L2PpejhnYTXi+Vl+7wc34INEJaDsDpqos0pmQeZSWPm5SEtgsHintzwqYNe5MpiK+BX3ifpcIge2dPU8K2QVs95TbSkvbdTBJyb0SalnXT19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGZv40rvLde99cb90vRWRrk2OLr9veoYcxIiLje4ioU=;
 b=nkL/Gpz4QDXTZ9pqHB1NcNUdnH1B13IvID/suOSvjrDqW9W9MYBpJT6gTlUGEX7W8a444nPhmTy3LU+1Y9f7ZHVpnYDWh1KeeoCUJYuzDcwVi4ASDl4/Cau5+j45uwHpalmPffjjK3zeRBhyc5rHArpnU4Orz38WEO8CP3T0W4w=
Received: from DM6PR01CA0015.prod.exchangelabs.com (2603:10b6:5:296::20) by
 SJ0PR12MB5422.namprd12.prod.outlook.com (2603:10b6:a03:3ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20; Tue, 23 Aug
 2022 10:29:33 +0000
Received: from DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:296:cafe::d1) by DM6PR01CA0015.outlook.office365.com
 (2603:10b6:5:296::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22 via Frontend
 Transport; Tue, 23 Aug 2022 10:29:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT099.mail.protection.outlook.com (10.13.172.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.7 via Frontend Transport; Tue, 23 Aug 2022 10:29:33 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 23 Aug
 2022 05:29:30 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/4] platform/x86/amd/pmf: Introduce CnQF feature for AMD PMF
Date:   Tue, 23 Aug 2022 15:59:09 +0530
Message-ID: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00e5a11a-6b17-4985-1169-08da84f25eb8
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5422:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S092JAU6csad8LGtAnjv4IWJjB2TRgZ+mFwCPWXYNI56cPcgas/idneLFcgx91eumEiVCIxV6U0KY3hQn+pr1y/42SYEVFUYs5yLEvsmPspfMR//PGU3SbHo+78QCp1Gbl+vfpiqJtdxlR7f1cQbCvROYi4Cgu/L9gYB6NM+VIP/60z6I0cDD4hZCdLEjyPoipDpLN1TgEow3d6XYr8ql87n6BbZB+FLSI0WFwHqsJn3w8xFwv668ZOiv7+AzxaRsrGoU7H0SR3dawuvHPTJg58NTDm96MTMXmBeCpGQGlSYwJuJibyyXkSLK8zPfI+ZALAnjXISQwSC1uzejlonl9Ld4eLB06w6Rpj2PkqE/siFVbo+fLuGohUuZAX0zXcicR2NJNh2jZp0OFfPiPdoSsH1xtyaGqr8wWymvDDq/2FRS/c7gfY51/T035zbtEPe4xjFcmtoRwJC9+RWWpM5U1EqjuPlgRos6DJWzbJl1gzhdXwgyTfJXE+hcnqUDc5OaTycil57BBY0bWvfHrcFUfE1oXB//nrm40qzuH5ejNNwmTJ9fD/mWDukpyIkH1BpPIGs8syu+jncBnbUD/9HRHw99j+KvZvVfkZdeoNrnlIPiN3Mw63Vx/i3Io80EzVh5/FS9mEzA3sYS7uNb7A+5n52NDlSNnJI0VH/uHesIGwjxdfJlFj3MpI7rzZP6f201MspO0SLlCHfUhnUuHlYDceAok8bVfZO+tOJgenctSZNJJYKAIMYS7WAT0XBL9qlcSLiu36HXIxImblmIENz1veb90nAcAtAPgYX8h1aIdk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966006)(36840700001)(40470700004)(70586007)(70206006)(8676002)(316002)(8936002)(110136005)(5660300002)(6666004)(54906003)(2906002)(4326008)(7696005)(83380400001)(478600001)(26005)(41300700001)(36756003)(426003)(47076005)(2616005)(336012)(186003)(1076003)(16526019)(40480700001)(40460700003)(86362001)(356005)(36860700001)(81166007)(82740400003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 10:29:33.1326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e5a11a-6b17-4985-1169-08da84f25eb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5422
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In this series, support for following features has been added.
- "Cool n Quiet Framework (CnQF)" is an extension to the static slider,
  where the system power can be boosted or throttled independent
  of the selected slider position.
- On the fly, the CnQF can be turned on/off via a sysfs knob.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Shyam Sundar S K (4):
  platform/x86/amd/pmf: Add support for CnQF
  platform/x86/amd/pmf: Add sysfs to toggle CnQF
  Documentation/ABI/testing/sysfs-amd-pmf: Add ABI doc for AMD PMF
  MAINTAINERS: Update ABI doc path for AMD PMF

 Documentation/ABI/testing/sysfs-amd-pmf |  11 +
 MAINTAINERS                             |   1 +
 drivers/platform/x86/amd/pmf/Makefile   |   2 +-
 drivers/platform/x86/amd/pmf/acpi.c     |  10 +
 drivers/platform/x86/amd/pmf/cnqf.c     | 374 ++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c     |  16 +-
 drivers/platform/x86/amd/pmf/pmf.h      | 100 +++++++
 7 files changed, 512 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf
 create mode 100644 drivers/platform/x86/amd/pmf/cnqf.c

-- 
2.25.1

