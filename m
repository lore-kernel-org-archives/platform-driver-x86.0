Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFA7C0015E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Aug 2023 11:23:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236213AbjHKLXD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Aug 2023 07:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236137AbjHKLXD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Aug 2023 07:23:03 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::625])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB772130
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Aug 2023 04:22:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpFXKiIYJdBESiwTLvFwoYGJw+jd0P3lFk5PTsA7jtsllJCTlCEHlQATGApvqTWyVdpD4/bC8x/Xk9MQT/nA+qqi+Lk5AOYbUhLeaU7vfenDelASZaImO0KHf3V6bOfotEkpGN9bOiqngu2F6bfdeQ9eguxZbS9ZoVrm+PhrT9EdGloQjHFMr3y/ixOuO7LeoL4noKrvG05WYz6qaW7FrR2ev5+Pi7k81mZWC1gypn7ryRQlBBUX4zDYTgrfveD5I2XQbB3m55FI02cOuSgffUOfQyGvri020jev1en9qWwD62qQ+acWJBmzNLBg4LeTOlhgO/oD8y4Z89hzAeLCrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+66dbadwRQjZMs+fK4DdSOTws1hg8AlnBAiR4IeFz14=;
 b=ETZhuQAvZWPIaQYbgt9gcLwpWK1iCKdZM7M/7vWzqPNix+4vLRTGNLdXOvIoh4p21pCHmE6kVHUqRfcg4bKqXwrN23jAHfxoIz5VrVod4koRoBf6h8L49cwu36ugL0hehnKh+BXaCUCElN98pmlhiGMAKwBZkobkdn9IpIEa0k84Er7qgkCe4eKnFO+y8BGzXDz7PYoxr6SWD4+vza3ZVahwFmwp+bvlJgNJydjrybNMWXU4/daXrbqYNfDGQy69ZG9MaNIZiUiwT+y38Bpeu5CxFfrFdjEvNzScEgfRfw/lJaVZu3UkkUo8nafmxFv9gWSvq4AF/iPlJ4fjHs7eCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+66dbadwRQjZMs+fK4DdSOTws1hg8AlnBAiR4IeFz14=;
 b=Cql454sn0qUZ4thWknOk0x/YCORUMmAjw3grSp29ODyH3WTVGDZM9G7RnYlhFqUU77qPGi8e3y1PcKEgeqeDG3dReOLkZ5EhKSzdld5ymQEM0qzUkUouH8cjGtpLl/zrDeBeJe3eaE6xzhVoGCU5cUuglurDb+c1A0X24fttWpk=
Received: from BYAPR01CA0059.prod.exchangelabs.com (2603:10b6:a03:94::36) by
 PH7PR12MB5758.namprd12.prod.outlook.com (2603:10b6:510:1d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 11:22:09 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::69) by BYAPR01CA0059.outlook.office365.com
 (2603:10b6:a03:94::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27 via Frontend
 Transport; Fri, 11 Aug 2023 11:22:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Fri, 11 Aug 2023 11:22:09 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 06:21:59 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/4] Updates to amd-pmc driver
Date:   Fri, 11 Aug 2023 16:51:12 +0530
Message-ID: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|PH7PR12MB5758:EE_
X-MS-Office365-Filtering-Correlation-Id: c29f6069-7d93-44a7-89ed-08db9a5d33e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VZLf+eXzwq31yHu0tOQl6B02M/McJKsxw77oe4opV+PZbDFbaswaRBAvCq3tL8GCDICTJ70WdlRUjZGjUyGebSAOJvlrrlMyRbCbVarI4Z7ajMYZuR6WduwTwrmtofG9jJ+mD8dQEyMSWIT8nWdSAy4bk+2CL+PfGsw1Wu7xbl5hpVaIhV+1CdSG0SqlyFhAEFiTLoJ6ciXg43Xef3v7Sii5smT+umDhEpGzFd+fqb75lryADmsMz5CeeUoKvU1CzC4gXT3Sppd1NIdG84GXeGEUptD8S3NB+Ww+WPUtVuIfV4LmXvhCIBcV8M4SRMPR3oI9nKAFLIeVqlWgy6nEczefdNzsA9jNlxxhPksz9iBJyu3WeEbbwXIGZaFblV3pN/4iuMzLMNt6Se5Vx4ug0j6kcQjMIlxkKn52G+by7v3j032nBotGGdn2WHZMBy31P9s7k9I4Wt5yRvMlHctDWPKcHFbfKXpVVu7+zaetelJ+Hq0ztaQqtbOc/9TtGGWY83u7eRxoIsb/rC7ValLQOlINBaEfILJSyYkEP7rgGY1fSI13dzxkRPXuqQYI1REN2jDCy4lN6gQSwRYvrhdk2sC/ksYTWuuhqzyzGsNgg/w4eZTLMnHGv+Ove4Kad3XLORGcAeRQP+wowcGpQJ19cMBr/R1SAgpBt/rlXoXF+LLa+1wLFTbGzLjby1tJexvvuCt8oX2HcDAbaK8NLJRdm1GXFmPlq7+XAGHprQKmzIqcVrg4m500bcPLgrUridVrQc8lGGglzq7VUV/0U1ov5A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(1800799006)(451199021)(186006)(82310400008)(36840700001)(46966006)(40470700004)(7696005)(478600001)(6666004)(81166007)(40460700003)(36756003)(36860700001)(82740400003)(356005)(47076005)(16526019)(2906002)(26005)(426003)(336012)(83380400001)(2616005)(40480700001)(8936002)(4326008)(5660300002)(86362001)(316002)(54906003)(110136005)(41300700001)(8676002)(70586007)(70206006)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 11:22:09.4836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c29f6069-7d93-44a7-89ed-08db9a5d33e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5758
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch series includes:

- Move PMC driver to separate directory
- Read SMU version at the time of probe to avoid duplication of code
- Add a Firmware command that can force flush the Spill to DRAM contents.
- override the STB dump size with a custom one using a module_param


Shyam Sundar S K (4):
  platform/x86/amd/pmc: Move PMC driver to separate directory
  platform/x86/amd/pmc: Read SMU version at the time of probe
  platform/x86/amd/pmc: Add PMFW command id to support S2D force flush
  platform/x86/amd/pmc: Add dump_custom_stb module parameter

 MAINTAINERS                                   |  2 +-
 drivers/platform/x86/amd/Kconfig              | 16 +---
 drivers/platform/x86/amd/Makefile             |  3 +-
 drivers/platform/x86/amd/pmc/Kconfig          | 19 +++++
 drivers/platform/x86/amd/pmc/Makefile         |  8 ++
 .../platform/x86/amd/{ => pmc}/pmc-quirks.c   |  0
 drivers/platform/x86/amd/{ => pmc}/pmc.c      | 80 ++++++++-----------
 drivers/platform/x86/amd/{ => pmc}/pmc.h      |  1 +
 8 files changed, 66 insertions(+), 63 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmc/Kconfig
 create mode 100644 drivers/platform/x86/amd/pmc/Makefile
 rename drivers/platform/x86/amd/{ => pmc}/pmc-quirks.c (100%)
 rename drivers/platform/x86/amd/{ => pmc}/pmc.c (96%)
 rename drivers/platform/x86/amd/{ => pmc}/pmc.h (98%)

-- 
2.25.1

