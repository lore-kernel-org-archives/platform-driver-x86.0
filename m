Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244BAC636D3
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Feb 2023 15:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjBFPJ2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Feb 2023 10:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjBFPJ1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2023 10:09:27 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028492D71
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Feb 2023 07:09:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtWSJK6CKSblu0gBCA0D9FlqozlNFjiHIiTDhk5qvyClWsSQR75gHRyzb4QoAMHS8gkyP5MUrEV2cI8Glvv+OOdkok90+eiCa+PKDzp6L6VLo9MD63PWRNNZJRMxsWE5GvHkmw3kSElTIk8O8k3smT91cH8P2H4n+7mih+dVSDCGVfZDOWMlyz6sWoQsn8Sih/MeZ01XvywuWTgs/zMNJ7gZQJyHZzjW5PoXkFYEFQXFpM/tBFAw2Fjdp7SncPdBBLq3VaJi0ItZdtbYCUYbUz/9HfhRx/BdMso4tsTLiZn24skbfQRvC/N7apM/UdhqRGQ5hruzGtErWbJRdyigvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AewJnj5Ifjuy6enSa/WiYNS/+No5PRbKD3CfoV0XdeQ=;
 b=beQ8yb9PZJg2dBK7slQEb6bf0ILGRbYVsTcofPRrugjssNh3nzF/w16bMa+uP9tUUqg4SWi+aVvVk4ggregUBqDjr7w+YiY2CYryCRBNXk7wu+cxvLVVO9p6eVXN1YQFwY4k4yv8IfkDO+2LzeEFjKBsHDUMpwrh4SAmuxYiEXzhV3tSAk8VhzNFMAx8KtfktdU8Oq1t0yZhKQLIyB/7rvOXmTmiltY1h4T29AibSWAUGz6d4oe4iUuDT2yPsaFDi5xwa2aZG2Irbd6amt0Ot2w23myVttCL9/RGTPbVpR+ycIsQ6gCB8oTb7t/cV4PsBwqo9ozmziw+zi3XlKyU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AewJnj5Ifjuy6enSa/WiYNS/+No5PRbKD3CfoV0XdeQ=;
 b=MrMik+7JgM2TDXaHNk6oMoVwEBWrLpkYRfR3I7VlY4G0BgsyoYaLt3VE/BzSSVRwYx6DspFrPEXVMfO2ygAnZaaJW/AupzEH52vPW4tVmIRQlCQ03+rrkBK+kcIHBw1F+VLLWbUSwZ8m07QXNWDilGaoDAt9743poC/Y1sc/tDk=
Received: from MW2PR2101CA0019.namprd21.prod.outlook.com (2603:10b6:302:1::32)
 by MN0PR12MB6221.namprd12.prod.outlook.com (2603:10b6:208:3c3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Mon, 6 Feb
 2023 15:09:24 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::c1) by MW2PR2101CA0019.outlook.office365.com
 (2603:10b6:302:1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.4 via Frontend
 Transport; Mon, 6 Feb 2023 15:09:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.35 via Frontend Transport; Mon, 6 Feb 2023 15:09:24 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Feb
 2023 09:09:21 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 0/4] Updates to amd_pmc driver
Date:   Mon, 6 Feb 2023 20:38:51 +0530
Message-ID: <20230206150855.1938810-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT033:EE_|MN0PR12MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fcf1e3-4d9a-4174-ef09-08db08542224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GOzELxtbAls+CHPT3JVBAP0ZKE4IkEfDBQKui5mdAypTQRdKj3B+s9rHxwOqfdptQTjbb9AEHUvjfwaCqk3zjWgxwtJMAc8eLmRYkmmwAzZFKeSLQ6memJ7dvJ/AKGFnMD8w6LqgsNxGhVSRlPH50bRcoi9lGm8QljxN4Q/xOZSeoXjiTmqgvF58yp+2XzK5NnNsppiMrUc2QhVcJwD1HsL/5qzPrZkmdDiPu1pHM4AVWoCLDseDBjh1FOKHmQE6feSgUjr8CDCQn9ZqG7tPEYB5v0EEASmdRjCM74h37NFHx5fD2lWd5cjNnuWMQ/w6mkRWrLTwkW/oUnXa2qxDjEhb0PudtoXXa8TtqhhmjQeoV+hl69nJILArHPL4TANmlSZw15KsA0qnpn2sjKuxBJ0CKFyRgw2hoeM4DtgxOgXJn2oHpgy7z+v4JTClL4rGaBiYdEJFentvhT4Esg+30p5iD+6PAWdtmyakVAPGiI8XTHwQlOdfQJhW6pSa09QQvfbyjhSeVWGiARNQea25ZL6rPB5a+qJNwXaonDNNps6AA6ytg3WguB8EVxcLKGgaryuWkXp6Pvu/ak4N405NTkNndvVEyC4wq4NMccAKbRVsi9UzMRTh8YD6crQ+X6ohQIqo64CrPnpYtkJadeQGVd7mRsjQIXlAHEIX8NebmJ9C6qt6Sw9VEaukqxiThV4jtN9oH6K9gstk7UtHEBFOcmUZ+R1L0pZkzhGqeyTqxfo=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199018)(36840700001)(40470700004)(46966006)(5660300002)(4744005)(8936002)(41300700001)(336012)(83380400001)(426003)(36860700001)(15650500001)(81166007)(2906002)(47076005)(40460700003)(110136005)(82310400005)(7696005)(70206006)(70586007)(8676002)(4326008)(16526019)(26005)(186003)(316002)(82740400003)(356005)(86362001)(54906003)(36756003)(1076003)(2616005)(6666004)(478600001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 15:09:24.4615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fcf1e3-4d9a-4174-ef09-08db08542224
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6221
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch series includes:
- Add num_samples message id support to STB
- Write a dummy postcode in DRAM to get latest data
- Add proper debug print support for STB
- Add linebreak for code readability

v2->v3:
- Clear msg_port flag in case of mbox command failure

v1->v2:
- Fix incorrect pointer handling while memcpy()

Shyam Sundar S K (4):
  platform/x86/amd: pmc: Add num_samples message id support to STB
  platform/x86/amd: pmc: Write dummy postcode into the STB DRAM
  platform/x86/amd: pmc: differentiate STB/SMU messaging prints
  platform/x86/amd: pmc: Add line break for readability

 drivers/platform/x86/amd/pmc.c | 40 +++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

-- 
2.25.1

