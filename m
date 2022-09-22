Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBF6C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Sep 2022 13:12:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiIVNMm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Sep 2022 09:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiIVNMl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Sep 2022 09:12:41 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07EB2E6B7
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 06:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2rOjogS3JGH6QZ40fFy99IRc8U5LIb3TPuz1dJsWTf8vCHe8NOTG884q6QTtsNZigTDuT7yTI1QUniPXtHUxqPE7WydUgQ7ysNsksjFRbOwZfF70zbRPrD5mQwb7GSZJqGrhdHE7qRk37pNG3avgZCRELKdxU03V9Aqqmgq/wXSwWIWRFZ2R4qyuIJOxPuQA4jnPa6cSdb9o2Bs1dLuXAlzvHdRWyVxR0+RLSUf+a4gdMadklUgmEpVMndXz8xTg7ehI25CucoRncmFID9NPR/dp3nnNsqny5C6bbHjpWhjI4smenNJfoW5pqkeq9u11rrbKRBynpt7HerIHqjIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmZuDqyHnjOEZG/yZe4zXluYLzlgNJmfOc3RgKbroMY=;
 b=idYyNWnKhtTZFiBWd/FMwfSQzdD1eqZZF7B7lLdXyfliJOLBdKedT499JpTM5CTHFxLclY/aZG5hAosTqHXuZEe9qSlQz56XAK/1TT1sJABL5eBQPkZQ3eIHUUgRKee9Mri67bbziCcW1FkAnbyLvLRcXfdUyyfMt6mhqtMPSPOkdBQ2Z04xMstJ/0Xdkaz7rT57CJgglPQXqtqBkblrbraNlujT48i0AgrjV3AkaF8C6sUuhnjmb3g9g0lE6xRRMVM+gkGphkH8JCUG5rKA5BIbajg97X1F7LXW+nlCrCNMwhzlsKPPfKkrEPKMDdkdYOSxXO1p+05mJPT8ziqqwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmZuDqyHnjOEZG/yZe4zXluYLzlgNJmfOc3RgKbroMY=;
 b=qHK9zynUrmVDtwGPdXY81DKjEHlToRWmbqF4olz/IUos+HMVJcJ/ca7hj2F+s9JuTCiypheZrKqjui5CBVG4W+gPnOBXIAoRATm47uJ4WkCEYZlRnC53VrD5MH4nkWndA2kuaUpHEDVAuwNmweyuc+qv4cjFHM7JDhp0edIRf7M=
Received: from DS7PR07CA0006.namprd07.prod.outlook.com (2603:10b6:5:3af::16)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 13:12:35 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::2b) by DS7PR07CA0006.outlook.office365.com
 (2603:10b6:5:3af::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Thu, 22 Sep 2022 13:12:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 13:12:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:12:31 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <mario.limonciello@amd.com>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <bnocera@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 0/3] platform/x86/amd/pmf: Introduce CnQF feature for AMD PMF
Date:   Thu, 22 Sep 2022 18:41:59 +0530
Message-ID: <20220922131202.56529-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT023:EE_|MN2PR12MB4342:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bddeac4-5903-4363-20d1-08da9c9c1d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jw6T05K78SACs9/hzuIXUrct2TmdsoeOpSqT4mwVtoD15I3xSRbXVl631t9kNEOqBnFy6S0Y0BZqL/WEwmNz3rWtvasSsdJVhHtqCorn1In/EKZNb5hDkuZBkGcNBAQS+praySq/lVgp8KY8SUP81G3HtNlPgDU26e0z9TyFh7BECLrCs0rfISYmVHpY7zqwY7w/2NnWVqNOhSpxYGVeHzT2J4d724roLbvFYzBYKaViqxGwFSUHhSguHN4BZ5ydhTcEy0gwOxR80qT3yhkxpEAcV89LW1vbyfGUXhTIIOVWtxeYIBEU2STgLYmDSg270WxNEGoVItwkHMYRozGAobMFIQcMMXbwqbri72eLhh/Qmx+KfSv2YEkVUuszvVDwzYTWWcHTt7+w4c3gyZ0CW83OpkdJiOqt41jX3i/FCnwgJ+niHXuAqUSaqiaAwyG/x9LB6qbfuwINtYfEkccjdajZYE+d9MerONDoaErGauq5JOTsT/czbnN9TV2sedQurQIZKK+CgbzBKXA/DbOxc+oEGg+7aBuAD7uIE9MiJGUw1Zmf4nSwAJV2arqo2JCFzgaxCE/Uj5RkbfuaRx/uHOvC9ewU9/DJ0F79NL+52JnYaUWwhHBuYD/6tdDGu8pj9axBsOayGDcvSkkiakRjdSdxhW2ZvX5cMw5wyfMuOBUDGoPKswfPmltowRTDcFkvQkVdInT27SXcA5rIcc10y3LAceV0qJlKlHcxWpMd1QdzREnC52KhomZMzPFVimiYF74ojDmXkLqMuURlgg53pzjYJx74O3Ts0OfPEtvOLDDeLZ6iHEZKCTHHluGgIk8m
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(70586007)(54906003)(4326008)(110136005)(36860700001)(70206006)(478600001)(8676002)(1076003)(5660300002)(16526019)(186003)(26005)(86362001)(2906002)(7696005)(40460700003)(47076005)(426003)(336012)(41300700001)(2616005)(36756003)(6666004)(40480700001)(83380400001)(316002)(8936002)(81166007)(82310400005)(356005)(82740400003)(6636002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:12:34.6136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bddeac4-5903-4363-20d1-08da9c9c1d54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In this series, support for following features has been added.
- "Cool n Quiet Framework (CnQF)" is an extension to the static slider,
  where the system power can be boosted or throttled independent
  of the selected slider position.
- On the fly, the CnQF can be turned on/off via a sysfs knob.

v4:
-----------
- update amd_pmf_load_defaults_cnqf() and amd_pmf_init_cnqf() as
  suggested by Hans.
- Add a new amd_pmf_cnqf_get_power_source() as a wrapper for
  amd_pmf_get_power_source().
- Drop call to amd_pmf_init_sps during sysfs _store() call.
- Fix cosmetic issues

v3:
-----------
- use "is_visible" and ".dev_groups" for sysfs registration and
  handling.
- Squash patch 3/4 and 4/4 into one.
- update ABI doc with changes as suggested by Mario.
- Fix amd_pmf_load_defaults_cnqf() error handling.

v2:
-----------
- Enable CnQF only when static slider is set to "balanced" and other
  cases
  keep it turned off.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Shyam Sundar S K (3):
  platform/x86/amd/pmf: Add support for CnQF
  platform/x86/amd/pmf: Add sysfs to toggle CnQF
  Documentation/ABI/testing/sysfs-amd-pmf: Add ABI doc for AMD PMF

 Documentation/ABI/testing/sysfs-amd-pmf |  13 +
 MAINTAINERS                             |   1 +
 drivers/platform/x86/amd/pmf/Makefile   |   2 +-
 drivers/platform/x86/amd/pmf/acpi.c     |  10 +
 drivers/platform/x86/amd/pmf/cnqf.c     | 395 ++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c     |  25 +-
 drivers/platform/x86/amd/pmf/pmf.h      | 100 ++++++
 7 files changed, 544 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf
 create mode 100644 drivers/platform/x86/amd/pmf/cnqf.c

-- 
2.25.1

