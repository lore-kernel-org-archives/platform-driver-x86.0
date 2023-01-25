Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9292C54E94
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Jan 2023 10:00:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235472AbjAYKAP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 05:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235179AbjAYKAI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 05:00:08 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2062.outbound.protection.outlook.com [40.107.96.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE7CE54223
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 02:00:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=db3VqCMrjLWtKylvcpNhw1tIoS+aSTdw6qcs+4q8QVXZTAUP6ZjylYuFrj+2bvmki+N7oPbattmtlnuyvM+Sso4VdVIjmwg7pyKa0dBH3ucc3VVB17ZFYUpHlBzdr47sVqzoSIIjchPDfTZ0z/hP1AaqRhmLVDCdc7uyXVj/4saNfKI1eWVyi1+UX8DeK6kV4hG3OqHrFvFu2rwxxoqeQYbjRtbV8BDVzSFv78Ji4Wn4/150JqeiHN8fu5seZ8THZuZxWUFeNIHj7VjSwPmGfkhYTHkJLkfm65CCQUslagZDPEOduwBMrthlqu2GKf3JOfzt9xn15TPx1jKDdvWePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTaenHCGB/RQm5XRGBd/n0jKTXFIH+LG9SKU8kAXmCY=;
 b=d9VyD+SpdSnarchgAGT22qe3bOGVDokaEcEKTShhC6q+VaZc43yV7vKZMhmbRjIH4mMXmx8+3Iyplut+vLeXv1uVnKK4Qn4Uje9ICFQ4hgIT3tdHbozoyZutctHGsAn1ih4o6eX6Jw7AdI3ifgjUieStePbgBbzjwJwHBUbZkBxKBV192WAjCSXt3dJ1EbUROgTG9yxhwHFzlCPYjRtmvagImZMcKpDhxOYJ30t8w2mGKyGhswX1xYsTCcCvQIIzTu7QdDSlGiyDOAyqNu+Ip2KaGqwyaZyXWCu4KF8P7n3wGr3Zwycg6AYzHRph55Kv3Wpp5mOQnmzJ2GA8cfkrfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTaenHCGB/RQm5XRGBd/n0jKTXFIH+LG9SKU8kAXmCY=;
 b=oXnzWyGnWi8NCu68/Rv6vWasXR8ZSToj2ykMDl4hMZWUMPBW7ErG7v7l9jiGscvlitlxfk1WLV7tExJHmkFa2Jc7AqhFSsGzky6lGeUOXmr9rHZc8hrZv21HXI2u/huSA7ucEijTjIEoDeXucBshREhd+cNOnaeD0bOxV36rTeI=
Received: from MW2PR2101CA0036.namprd21.prod.outlook.com (2603:10b6:302:1::49)
 by CY8PR12MB7537.namprd12.prod.outlook.com (2603:10b6:930:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 10:00:05 +0000
Received: from CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::53) by MW2PR2101CA0036.outlook.office365.com
 (2603:10b6:302:1::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.4 via Frontend
 Transport; Wed, 25 Jan 2023 10:00:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT103.mail.protection.outlook.com (10.13.174.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 10:00:05 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 04:00:02 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/5] platform/x86/amd/pmf: Updates to PMF driver
Date:   Wed, 25 Jan 2023 15:29:31 +0530
Message-ID: <20230125095936.3292883-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT103:EE_|CY8PR12MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: fa06904a-d1ba-4212-8232-08dafebaef14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4cEMx97dqCMderflrSqP3gBZzhAfETLirbZrHjvc2qT3rl0It4sFf/L/wWF5CbASnhaBBbnlHMSpGpCfstKxk+eyeOGwXmZpHgJjj1eyW/p0bQ12L+XlDTpYgNQ+ZR6RQ8502vIr/AcrjMSjPy2fsnbKs1WYe7El78M0ChbCjGA/H55eeIbejCjbyF+y3pSJw5PGUJY8fNNkZE6vwZJUqEtolqcbde9R9kMhQZ1vZru7n9h3+nFX7RVuufYv3oSYeBXYUrWhV+g0cgBfbKPSloUiPSz9B15FTI4nCSjiX1xKG/Q6cEqJyz7lIA5ShfvqrtUEqnN+oEYLntehRUFJjuPH9maVDZ8vZvVUhGi1mQXzkHAj0WwT6vUuFjfATPX/DqEFHOP3dxNvaim52RvETLeiu0ev+lLcnwNDQIxksvK2EXHKjD045d9ydGnZDlRaydvnZD4yR/JmX2/DxodkvkacvXeN26xg5mpp6FYGixtpkHKRg23K3jU8sI59nzTU9wnXPb1YEvwvUlI/wd3HewrvY6Cq/Cb3y43nrzbBNA6Mv21zaFPA363lVkF3g5qsx6Vthve9cnuQ2S74XbonIonDdYbCT2k5PChuZVwCpPBuZ3H2VboM05fLaSzPr39m9oTc8vUKKH6yYcdKFp0dOnrwYBonEthlsOHUYW9bJNxsF5k7v48OeV2q69REgaPNEdrWnJxFFt4iPo7jeopZATjES1uofay+JZH8tH8RfYU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(40470700004)(36840700001)(46966006)(83380400001)(36860700001)(426003)(336012)(54906003)(47076005)(2616005)(478600001)(8676002)(186003)(36756003)(1076003)(70206006)(70586007)(110136005)(7696005)(356005)(4744005)(2906002)(86362001)(82740400003)(41300700001)(26005)(81166007)(5660300002)(16526019)(316002)(40480700001)(40460700003)(6666004)(4326008)(82310400005)(8936002)(15650500001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:00:05.3411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa06904a-d1ba-4212-8232-08dafebaef14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7537
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch series includes general updates and bug fixes to amd_pmf
driver.

Shyam Sundar S K (5):
  platform/x86/amd/pmf: Add helper routine to update SPS thermals
  platform/x86/amd/pmf: Add helper routine to check pprof is balanced
  platform/x86/amd/pmf: update to auto-mode limits only after AMT event
  platform/x86/amd/pmf: Fix to update SPS default pprof thermals
  platform/x86/amd/pmf: Fix to update SPS thermals when power supply
    change

 drivers/platform/x86/amd/pmf/auto-mode.c |  9 +-------
 drivers/platform/x86/amd/pmf/cnqf.c      | 14 +++++-------
 drivers/platform/x86/amd/pmf/core.c      | 23 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h       |  3 +++
 drivers/platform/x86/amd/pmf/sps.c       | 28 +++++++++++++++++++-----
 5 files changed, 54 insertions(+), 23 deletions(-)

-- 
2.25.1

