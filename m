Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F845C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 11:31:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C00B613CB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 11:31:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbhFQLdI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Jun 2021 07:33:08 -0400
Received: from mail-bn8nam11on2075.outbound.protection.outlook.com ([40.107.236.75]:47905
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231276AbhFQLdH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Jun 2021 07:33:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kex6J/mUESkIWMmrci8+6JdPX39yzWb3dH7W1iPaoLOs7JMrEWLoUhGEwlVuvBa6N8LwQLO2Sk6E29/oPvh09AVRxsiFP83ufqPYehAJKgFtqkQeZr63ufP+kWphXOH6s5PLOM1d9Xa1JjDP+jnjxZdQT9I3ol3vnn4Qozde0TZ+sID4JfyltmHmgmo0LzUDpKpwgiCxDmaqM1V0SCnQuZvEydnZNd+4lacUDwXoCf//Ij/v2J6HGjvLz5sI7XTe8b5J2aQVvkroZrDk4IgLeiEviM+ICcp7fAK1mbqOhr0AdFrTmTCw5ijo0vBPTkzJHZcpsZ+1cdEroHQ7PWczCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lde/fob4oruYJ71O7IiOXO/xQprbVVhun87Dxl9Ilr0=;
 b=UNgbLBQIufbhasO58QqvAGNHUzTitzVI3FLico6epqABKZpDqEZQdaJ0YBn5W6tWqn+CyvsOWb27Q7aPyDGBsXX7re4NT8JRSIZXCeoO3dxSZKggwar5n6cproP6jcGVE4+JIEy6tj+MyF74nhVVViszl1Hk/F7AilnACIR3XyUqMfnZFrEr5pp7k+ARlOWFMqi7Hglq5J5Df4TDbur8wo0PIr8VSKOvmfVUEii3qInRVmjzFgt944k2lzME8nPTrcijBFB/+awRZtroQZ8hXStUzF3+5C673L+NGcu2X+bWAJT0cJrRg0pqeVEhZDmimyuCMWTIup01ZMk96FOqlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lde/fob4oruYJ71O7IiOXO/xQprbVVhun87Dxl9Ilr0=;
 b=eoreaP28D2u16XsZepsUax3HxvCedh98sRZSLjel5ishdjBEdm1FXLA9EW3tpfkNrLjN7tUmrzoyTgpt41AN+UMDT2pWMFEC7a8G/PuSwMvJwqCzA7t5dkp0FV7HVEhvlluZ2ETGSMms1iWuqqa1nuVOrp0SVmIQmNKZbgCjtL0=
Received: from DM5PR16CA0026.namprd16.prod.outlook.com (2603:10b6:4:15::12) by
 DM6PR12MB3019.namprd12.prod.outlook.com (2603:10b6:5:3d::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.24; Thu, 17 Jun 2021 11:30:58 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::e7) by DM5PR16CA0026.outlook.office365.com
 (2603:10b6:4:15::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Thu, 17 Jun 2021 11:30:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 11:30:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 17 Jun
 2021 06:30:56 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/6] updates to amd-pmc driver
Date:   Thu, 17 Jun 2021 17:00:34 +0530
Message-ID: <20210617113040.1603970-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6768d06b-72a9-4d47-eb45-08d9318360ca
X-MS-TrafficTypeDiagnostic: DM6PR12MB3019:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3019354DE9E2B500DD12D3689A0E9@DM6PR12MB3019.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/1oczwVQ0MIIZK1xJwlWu1tzqjlsP31blRFHo23j05C9MScY3h9NKlQg6MptFgMjCKzgmuemKtMd23ge926GW2guRpLS3hdSEWgNS0/QyK5IFjx/HWe79P93t0Q9QAsUB6AIqahvZTAId3c78DxCp2kdftW7v0f8wuon0ThBsXEmFkNoxOLP6RkQkKJy42oQdIh/CpGISxTANjOJ/LesPEJgAN5PLjt7w6aGq27BZ1A1iOC7qtpyCvAnz2V/2kyUWE6HDMRwznR15nQf9dNhkoQ1Ux5E0xGukzStI0eLw8Fidx4kfD7ew+hqHzQnGWmBqxOVIRDp6/sNmpJKbmLxFShKdd8bp+JDw92R9tHnEcYAj5W9KDU/q9sD2xZ+tTRmeRPM+7mUtpDlmsHsmccCBdbRsRvrj8iCLV12jI0XD4rkerhhhE+SP+rHhDV9dvl5BgwHqk3SQQEB/7TJ5xbiOaP9PhLZyIUTpmUoKNCiyh65pVrPASfcW+fZA1SRDb/oSiUFSD2YcSCBKcckY30Lp80Fr2nfaFbqSjj6ZiinpVvIW1y3QIP8AH6+bXQEVTQloXpOfal+HTEU/3QZuctweWDuiFAZ1fF81f2Q2GIb4G/DTriecf+8YoNtBkBtlTOIbcW7lFTJeiOHgZSO6+VCDtb+r3b2CrmDtdaErX7oLGPipdEQHQRnrRFp3LXrYXo
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(36840700001)(46966006)(8936002)(54906003)(7696005)(36860700001)(110136005)(26005)(5660300002)(8676002)(4326008)(478600001)(47076005)(1076003)(83380400001)(426003)(6666004)(4744005)(36756003)(16526019)(82740400003)(86362001)(81166007)(82310400003)(70586007)(186003)(336012)(356005)(2616005)(70206006)(316002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 11:30:58.3054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6768d06b-72a9-4d47-eb45-08d9318360ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3019
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Couple of existing issues on the completion codes to SMU
and a newer way to get the s0ix statistics are introduced.

Also, add acpi ids for current and future revisions of the
pmc controller.

Shyam Sundar S K (6):
  platform/x86: amd-pmc: Fix command completion code
  platform/x86: amd-pmc: Fix SMU firmware reporting mechanism
  platform/x86: amd-pmc: Add support for logging SMU metrics
  platform/x86: amd-pmc: Add support for logging s0ix counters
  platform/x86: amd-pmc: Add support for ACPI ID AMDI0006
  platform/x86: amd-pmc: Add new acpi id for future PMC controllers

 drivers/platform/x86/amd-pmc.c | 216 +++++++++++++++++++++++++++++----
 1 file changed, 195 insertions(+), 21 deletions(-)

-- 
2.25.1

