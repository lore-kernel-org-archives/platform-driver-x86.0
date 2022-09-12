Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846E7ECAAA1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Sep 2022 09:11:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiILJLg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Sep 2022 05:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiILJLf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2022 05:11:35 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4319192B3
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Sep 2022 02:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfBxmDrW5MNulV2enitNG/fWuFu9+Gww32bVx9hmfODJ2iB71nq14wehaS2JexbtHB/FHRHOGX5vutRdBrhQ/TgY8I60uuWTkgoACuKSgVwx16w3kfJxwbF4EzgOT6gjjghteJPTzVInkdZ4BM5HjgeDSCEIUkwwRhVKFeExshM34Nig+NIYQNOFGri1xUSXX06wnX92tPG45O4kkpA25idALi/Aw020EVIEqpsNMS0O9v4FVlWNwUYUq/FKMOfFmSS2ijkR83pQ+mSPwrezf/U8HsNlxQ80J5DgdERzR0HRqsGmFecBmA64FR8hGbbqEQr7IxhVIbGWj43tamLDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQPolQJ6GhMbH4AEgueSF6HhZeDtTEwFssVvtMqL2OY=;
 b=JaJsCSUfKoNGXAlAco0ihb242g8HnAqhZ3dWpLqKlR10oGh2w8eNQ5tw4EPAd5cbrl1w5hxqJVKjW8IkARrFk12STG560IUOQKRsJFCI0H77b2Oi0KMbbwI56fXe5Z+j9LBGUSH+ifI4WDiaAFybzWoEhQHVpZmh6U+zu1BKbUmL4Z5SDKFH0xD5lQVykuBl3Af2l2V7ZHdw7xdHhq8gwLVInB4h8E+xKNCdQ8V60GEtNlOCk5mQg5wvWw0P1isFt4xtrKrnuplYqejbqelSgGKP8WXkRl/o4C+rtAnlIVb4wTpoiYTm7ZHaxzjYlvZZ3gh9GxeVxoHmdr2Qp1L3nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQPolQJ6GhMbH4AEgueSF6HhZeDtTEwFssVvtMqL2OY=;
 b=ghOJ59fDI1L8Qv5KYZbtcepiG0OE6GuadR6FY8PFyEyPpI+njCRqVFrZ/4EgSWRFt32MwO5Dr4yFyTiZzELeFjvxvl/QXekg9XLBPwNILoOINk0spK8k1YsAJPOeQCZtovBPotTA/Wrh/dF0go2obQg9/1aEZPeK2R+73UnOCdI=
Received: from BN0PR02CA0008.namprd02.prod.outlook.com (2603:10b6:408:e4::13)
 by DM6PR12MB4282.namprd12.prod.outlook.com (2603:10b6:5:223::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Mon, 12 Sep
 2022 09:11:33 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::b7) by BN0PR02CA0008.outlook.office365.com
 (2603:10b6:408:e4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Mon, 12 Sep 2022 09:11:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Mon, 12 Sep 2022 09:11:32 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 12 Sep
 2022 04:11:28 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <bnocera@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/4] platform/x86/amd/pmf: Introduce CnQF feature for AMD PMF
Date:   Mon, 12 Sep 2022 14:36:37 +0530
Message-ID: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT055:EE_|DM6PR12MB4282:EE_
X-MS-Office365-Filtering-Correlation-Id: b286e115-5f9f-4013-19db-08da949ec94b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WE6R+DL/8I8+Jv7M1GX0hdAmpIeo8BAsRMxZFaQvcqIvwy2sZ/jw0ujmOexxoK4rruU9MGoLsEgJn0v+JW/7KzfQfG5gItJzJLcUeUC7DVliN7o49pwhoPatEKzeO/hH1qSmNH71hFyGyRBTtICtepPjDsXXFCR8GhZpDOeWrtiKjwaRmzcZIa1WCKm8VDTgfmGXt+blgun0bjxga5vk6PhYu2vm+QaU6LE2xS2/uHD59jwlGa7j7EOtX7N6O6UNrMkDWsuL1com2vcFK8Ny4LknKL+oycMDSYoXIgX1qNxHZWDjYR8YTfaUVWycufskrJSVKsYa8aHqd9/uut2WxVmbGWCfe1dwP9l8KVfn/dr3zRaZvpMpa/84shWx5+fdAJ6+/rDqSELwmjtW4rVxh7ycHPkBButLMu47b4Ote5WSMnqzQlE3MTArhfY7mndNFb1V/KFZpHjBjMDkiEz38Ivzgx2Cb6UZyEdb7ee7TxhwRQuqRxlF+tzrEzUn6HIHwqh4NkWPn8jj0YO6Zig5O7OO+Egm10N7r6jEq4yhZhnnqnlWWGh1BUUikqZue184iUj54PdNDeRChZ3j6ywCUiWEEd50ooysEhBB11JtkIQ283pT37W706ic3Q7CBoL/cRWLxcN1cOv0NbexW1qoQCo/74UUkm5nZCHNAUB2AyP0OiCt5w5t9fKef3tdK2LbV6+/UyR/mzAJjeueCxGECZGmhkmSyyeMVRVU4cYbiY5R0lGdHpvEePX2Ca/kwtbblJIXx8mozkIfcPX+AN/xrVpn4M8P11WhIT71nLE65ls=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(40470700004)(36840700001)(40460700003)(6666004)(7696005)(26005)(70586007)(316002)(110136005)(70206006)(8676002)(54906003)(41300700001)(478600001)(36756003)(86362001)(8936002)(2906002)(40480700001)(47076005)(336012)(186003)(83380400001)(2616005)(16526019)(426003)(1076003)(4326008)(5660300002)(81166007)(356005)(82740400003)(36860700001)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 09:11:32.8451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b286e115-5f9f-4013-19db-08da949ec94b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4282
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In this series, support for following features has been added.
- "Cool n Quiet Framework (CnQF)" is an extension to the static slider,
  where the system power can be boosted or throttled independent
  of the selected slider position.
- On the fly, the CnQF can be turned on/off via a sysfs knob.

v2:
-----------
- Enable CnQF only when static slider is set to "balanced" and other
  cases keep it turned off.

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
 drivers/platform/x86/amd/pmf/cnqf.c     | 376 ++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c     |  16 +-
 drivers/platform/x86/amd/pmf/pmf.h      | 100 +++++++
 7 files changed, 514 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf
 create mode 100644 drivers/platform/x86/amd/pmf/cnqf.c

-- 
2.25.1

