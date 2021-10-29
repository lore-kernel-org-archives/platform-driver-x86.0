Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D927C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 17:23:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BE7960FF2
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 17:23:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhJ2R00 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Oct 2021 13:26:26 -0400
Received: from mail-bn8nam12on2076.outbound.protection.outlook.com ([40.107.237.76]:33440
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229826AbhJ2R0Z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Oct 2021 13:26:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4iltQ1GyGsD0qzeViRHrCYsFfjobZFVMgLUJiibzrLw+Yl52tmT+DHMllf7fGQAChaoFKgv40gydebF3CeVml3ozv0gsb3dEWargE0/RIn135BPAreCtzAlzqzvkghjR5CpfXcdlDOiE63H2f8YaJvsrYzgmfrWuLNEDiEKcrX550HF8X31klj2As1mmqU9EPZdWxiDaHKPOsgsO8lXdel8xEgDdGHqqwwB0xn3aMcJm6k8sJ5W3auBkf3P9GN5biimWCha1PYYpXoT/IZsgWjrG1kSgTKRaeRqwxCde6AMKmQZPP6X4be2v6iad02kr/Ad1a4x/gZT71PO3KGRaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8XX8SC3Z1VqJGsNnOulPZAmWDbfHnZQbZQ64MS7Uzs=;
 b=NT4xO5k6r1buSW3iqCrTaqUwYu/J4D1AQAYPQVXgSKk9ke8pxyqrJpTxl9PZC+htb8K1ESkL67lJweCm1kMF84A+qt9A/ilRCOKNoNrfzBIs3K+DPe8VDtWv2Q/Ky0fifTMU6U6DIC0TmkFxFI5tDAppK+9ukjHEDgX2Jn/kZmMjMGCmJv2HNyhtjO66aCMPW4JGwL/HJ9nRlwRenyXVJcOXM2KY2csrO6KxjS6N9c7b21SRPGTQL+/19RDGtxmWXJYJqTjBwUtAe73U7K9sMvfTvEdbGHwLJI6JMLb4VF1gVLTqpR3lyriSreDuZsyI1Zi+3L63QHL9u1JZ5cyyTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8XX8SC3Z1VqJGsNnOulPZAmWDbfHnZQbZQ64MS7Uzs=;
 b=PdXxUCwEAgO5Yzf7ffPgi/5uxnv444GRZtSCdjXDfJe2Ql208xdHPtbnSJzvVpkU3xq7qlLCQyGKv7YssnQzdCGHP7xyGtOZ12gHh9WVBDt/bEpEscmQkLl6CBKpi5GiWG73CSnGhSrpqh7Y4Zzb9H5qhRsNt7DMs085+61DGIs=
Received: from CO2PR05CA0004.namprd05.prod.outlook.com (2603:10b6:102:2::14)
 by CH2PR12MB3830.namprd12.prod.outlook.com (2603:10b6:610:2f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 17:23:55 +0000
Received: from CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:2:cafe::33) by CO2PR05CA0004.outlook.office365.com
 (2603:10b6:102:2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Fri, 29 Oct 2021 17:23:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT053.mail.protection.outlook.com (10.13.175.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 17:23:54 +0000
Received: from Celadon-CZN.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 29 Oct
 2021 12:23:49 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v5 0/3] Updates to amd-pmc driver
Date:   Fri, 29 Oct 2021 22:53:01 +0530
Message-ID: <20211029172304.2998-1-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5b884f5-7800-4495-10d5-08d99b00e28a
X-MS-TrafficTypeDiagnostic: CH2PR12MB3830:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3830724EEE69FAF80CF288069C879@CH2PR12MB3830.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pULfTwF+Kn5IrOe1Lc8EMUREtOZB7r5S8rqZxXUqrhj7whgXTxQtD9K1/n99UDWjOW6k3B5JXg5LawNe2LmessDGGfU/ptkZ4i/mQ6xt6Om7JeplCWtfPROzIOjUDk1WFpYOAI1wfkhV4QWJC9c7cET/q+yfj6eUD4wcO/DCIfCjSDBMs0KEEYQPH9GREtaooWjUeuDWQZpC2EAb2CWGBRkegx7tZdyAdfox/PSOA6m5V4xnsl7mr7xEkU+8DXR1VUiv/J/Qhgyxyn080vB6DKC/ZCAbYHwtP/Rru4c1+Hb/Tl9MtMf59Mpsp09sKTzMy2WLnnoSumOsk6z0KQ8tQMD9irFLYMgn1BL5UIa3dR5Jfnq7N8hbrTAqv80IWuhQbpeSCvbOXd013WA8oJcDPjiaETndcRaxUlMv5I2T2RsWyFcD5XiFyi+wbyH1UHeYQIvqQVz/8edcJLfUiYUjTAdYmFiKn/vMdv9/yhyoSW2JC+sCtO9T1S1giyyif+8pgedtHD2w/+IR/JE3VP2u9ixDE8OuRlLqJHyP6jTC+ffM3YnhYvoJ9tQP6itNfhLvO6Ir4dWq4EWyiKqdF6qyVZxTqCwv4IrDeYZ7JfdzHxfh6J23B8CFe93oxD05KQAVxkdFX77W42DWaSp3iie4KmMfL2h0CzPwVDR58yH9M3QYw0FYQWyMQ+9orZ8cIi3u8SR/NPpAq0IaH+U/dD3pxMZ1nCx51rc9OEBhFVn8rlc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(1076003)(356005)(81166007)(2906002)(70586007)(83380400001)(8676002)(6666004)(5660300002)(4326008)(4744005)(426003)(86362001)(82310400003)(36756003)(316002)(2616005)(8936002)(47076005)(54906003)(186003)(70206006)(36860700001)(7696005)(26005)(508600001)(16526019)(336012)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 17:23:54.9941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b884f5-7800-4495-10d5-08d99b00e28a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3830
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch series includes:
- Improvements to error-exits in driver probe
- Store root port information
- Introduce support for AMD Smart Trace Buffer

Sanket Goswami (3):
  platform/x86: amd-pmc: Simplify error handling path
  platform/x86: amd-pmc: Store the pci_dev instance inside struct
    amd_pmc_dev
  platform/x86: amd-pmc: Add support for AMD Smart Trace Buffer

 drivers/platform/x86/amd-pmc.c | 153 ++++++++++++++++++++++++++++++---
 1 file changed, 143 insertions(+), 10 deletions(-)

-- 
2.25.1

