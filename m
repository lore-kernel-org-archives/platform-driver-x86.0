Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4ACBC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 23:26:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9BAC61151
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 23:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240498AbhKHX27 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 Nov 2021 18:28:59 -0500
Received: from mail1.bemta23.messagelabs.com ([67.219.246.116]:6809 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240249AbhKHX2z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Nov 2021 18:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1636413970; i=@lenovo.com;
        bh=QYAnGsdOk2KbSuJ1bYZLQ8SSLxmbIxxKNpAaPgbUwdY=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=1zt9NoujavrJhoDwQDjUN0Y5luuRquH4Fj8X759FmmkENPx1uIzLpfgOYwarrbqHa
         8Rc3aNLHaMnWDi5u86lqG0Y0rQ8C3Ur1k84M+2jgH4qCVzLE+2dg9QfJa2KWtXxx3D
         bRabsY0suCkicEOojIdrqq/EMjBEwJU0A3QeDZu24yBnInuG0MdMEaKieLJs6NHzIw
         2A8t5FVXDirhe0W94wzxw11X8aQEp5iUofh6LG6VdqLmZbnkm60MIOwcWalA2e5PYk
         WAshFdkpGykV5UlErg35uWGRLwZkenFoA7DcIw4TlGlZ+4nLKQDe8AtC9M2bc6vS9B
         eKyNHi6cFwCYw==
Received: from [100.112.6.161] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-c.us-east-1.aws.symcld.net id D9/10-27078-212B9816; Mon, 08 Nov 2021 23:26:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGJsWRWlGSWpSXmKPExsWSoV9rriu4qTP
  RoOWwqcWb49OZLD53TGaxWL3nBbMDs8e8k4Ee7/ddZfP4vEkugDmKNTMvKb8igTVjy/3VrAUT
  +Cq69uY2MG7i7mLk5GAUWMossfwebxcjF5C9iFViWu92Jgink0li8rx77CCOkMA8JonZTUsYQ
  VqEBA4xSSzuswdJSAgcZ5ToPrSOCaKqk1Hix6tTLBDORCaJ1i4Y5zGjxO7Zm6HKnjBKNN6/xw
  YyjE1AW2LLll9ANgeHiICMxIe1niBhZoFoiea3V1hBbGGBSImO5beYQGwWARWJSRdWMIPYvAI
  2EtMPP2UHsSUE5CVOn7gGdh+ngKrEma7HLBC3qkjcf7CEDaJeUOLkzCcsEPPlJZq3zmaGsCUk
  Dr54wQxRryzxq/88M8g5EgIKEpeXm0OMT5Do+feIDcKWlLh28wLUWlmJo2fnsEDYvhLL981gh
  rC1JHo/zYSycySalrWxQthqEk/2nmSEsOUkTvWeY5rAqDsLyXWzkFw3C8l1CxiZVzGaJhVlpm
  eU5CZm5ugaGhjoGhoa6ZroGpvoJVbpJuuVFuumJhaX6BrqJZYX6xVX5ibnpOjlpZZsYgQmmZQ
  CFqUdjM1vPugdYpTkYFIS5VVd2ZkoxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3xxqgnGBRanpq
  RVpmDjDhwaQlOHiURHjVNwKleYsLEnOLM9MhUqcYdTkmvJy7iFmIJS8/L1VKnNcepEgApCijN
  A9uBCz5XmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzGsEMoUnM68EbtMroCOYgI44+KUd5I
  iSRISUVANTTihru8nMZxHHrxUc1HD+ssfvtv4Crt25vnGPcxPtLquftE7ImMZurzDJSVgk4kH
  ypjYJny/Fkx1TjKaoPIz+zS3KZrbmvbR+e+kbp/d8djusXTSEBaUUql9Xzzqoesr+XFXpG3tz
  R76kvzfnv3Hifer84tD7jUblVc42xpl7T0WcNmdpM1ypqpaa5bvXw9KF4Wtu1cqD33dF73j17
  Ez3zby3GqvVp8gbZW/xW9h/YUuKy9Jvm7yFCkPu5P0MPj//qHKfp8gv1VipaMvjZ/6oBrvpei
  fvOep5dv2nO1qZLMeiduizB+/OKXovoLgrOC/ukF+yf2FL592595R6Le8xx79dNOfa9RVX9k/
  790+JpTgj0VCLuag4EQBiEMNeOQQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-4.tower-415.messagelabs.com!1636413967!233370!1
X-Originating-IP: [104.47.125.55]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2086 invoked from network); 8 Nov 2021 23:26:09 -0000
Received: from mail-sg2apc01lp2055.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.125.55)
  by server-4.tower-415.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Nov 2021 23:26:09 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaEllv2RZY8eEX52fGsZPp2dh1O1IitsaJ5qjsekjliCbDZaie6+EAfrFtpGclOA0z1MUvVjyEzxtRWgfFIbA72tSSSsnDFKPhhvVfpVdqcDgj2WMQuJAvZV/LUORpjZp4imqg3DMBkQ3ThnQ1COHml6tYg/r0sx7pll1L2BmLx2hbwBpHAC6IPOkbe+cb61E146jerHAIftQu9OOX/qyoLbQa91lRgZ7UPaXPcapcIznl3Awz3JR2+qN33o9eHAAJAmNKI7ka6LW2OIIGffdTMOtL9CIijOgwk6prF15rGREDvLVvyzN8r+0dNS6gcgTOw6DaeEGWWNXTommAp7Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYAnGsdOk2KbSuJ1bYZLQ8SSLxmbIxxKNpAaPgbUwdY=;
 b=bOcq2lxoNpmodzOu4jkOYrbtgbL80GnXtTk7sxJECouPuOu7XodKNGEIjZ4+sAUR/YooWYphIjeTD+NGwLJrtQX2oQzCsLBF2wJewsQxJ90CptIlVGf0eG0KU6wsD0V/h+DFJq9BIqNM+0mBeWOMm1rS93RedeQC3E2UG9yz7h5rWW/XGoeNmNIJTfTkEByrc+VZrTM7sq8C36yckhhDWLzundT6bjK63cfqLEewV6fenwI1t/YGo9sqL0XiJpD08BDkJlIHtvFQzwwVppjvS6yp05887nrUMv0+LCeMEEmnJG63Bo5klj+HY36Cg9L3z4/RtQIteweUNlHgKrWKZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from HK2PR0401CA0019.apcprd04.prod.outlook.com (2603:1096:202:2::29)
 by TY2PR03MB4031.apcprd03.prod.outlook.com (2603:1096:404:b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.7; Mon, 8 Nov
 2021 23:26:04 +0000
Received: from HK2APC01FT020.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:2:cafe::35) by HK2PR0401CA0019.outlook.office365.com
 (2603:1096:202:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Mon, 8 Nov 2021 23:26:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 HK2APC01FT020.mail.protection.outlook.com (10.152.248.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Mon, 8 Nov 2021 23:26:03 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2242.12; Mon, 8 Nov
 2021 18:26:00 -0500
Received: from fedora.lenovo.com (10.64.90.185) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2242.12; Mon, 8 Nov
 2021 18:25:59 -0500
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH 1/2] Documentation: syfs-class-firmware-attributes: Lenovo Opcode support
Date:   Mon, 8 Nov 2021 18:25:32 -0500
Message-ID: <20211108232533.211693-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.64.90.185]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2246b282-0751-4ef1-68ab-08d9a30f2204
X-MS-TrafficTypeDiagnostic: TY2PR03MB4031:
X-Microsoft-Antispam-PRVS: <TY2PR03MB4031B7F03E06683738C927A8C5919@TY2PR03MB4031.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9iduGn1mZFKfGHD7V4cCbXB8MEXvMxuiEauQiAaY4S5FEAUMys35Y+JNWq0OOyz3FzdSMf5VwqmcQSUGRZqPEFKZZa47gu/Ydzc1EXHEiaah78GAiXaVkiETStuAYamUUaq/BFvHopwyMlTHtFPFkg+VkaFPWRoRQ+mElZWJZYlj31Z12B7cDSOUilbafUHRh+WZFmdUX5EDeisp+JPlCYooSjJjEAC9F5BjsofjsOKxrWGFYrqjgBjxzXfPWqjEtaHhZWJy3OfzYfNxTwDYj/Mu3cZTKKg6LmUuQ49hkUqyGbNddMQ6YTEkK02mbpqr3Ls656sg8mc1lLS3aHmsJPxGpMn+IBcAVxVcf+x7IBhxcDOPV0fAMLnfEeIV2FsDeIw9SE45jHBUG/4Q09Y7o4JnKBz29X5IJ9Jmj4ZFq3ZpKLa1gamCbVgi00UwZae94Khwb0KqimvxIZCz8F1lh8nfztzkfxmBIKcrB/w2rO2YuJ5pUmOCu0qsoLwFbw5kM57x3AMGhGV+UmM0VC42rjh2WdAAgz26Ep1QDSMdeBtsugFUm2gxrCyBUT0L4NKwaQ+Ik/EClj+VUm7+Gu4VwW70qVK+Z1FdRzCDtAU+Xl8XUhiYUeWWrj+xvSmDzV4ksMZP7NxvI5yruce1UWLWeIl26aM73NK0WuSDRwwJQjnGRIDxlhNQvZRsyD9lmd9aB//M4lF6NIoV/CSnfX2Is+Dr/C5Vk2neeFEalY2m9N0=
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(81166007)(36756003)(26005)(86362001)(6200100001)(6862004)(82960400001)(54906003)(5660300002)(37006003)(36860700001)(336012)(508600001)(7696005)(426003)(186003)(4326008)(83380400001)(36906005)(16526019)(2616005)(7049001)(82310400003)(1076003)(8676002)(356005)(6666004)(8936002)(70206006)(2906002)(70586007)(316002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 23:26:03.4719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2246b282-0751-4ef1-68ab-08d9a30f2204
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT020.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR03MB4031
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Newer Lenovo BIOS's have an opcode GUID support interface which provides
 - improved password setting control
 - ability to set System, hard drive and NVMe passwords

Add the support for these new passwords, and the ability to select
user/master mode and the drive index.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 .../ABI/testing/sysfs-class-firmware-attributes | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 3348bf80a37c..6af4c5cf3d47 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -161,6 +161,12 @@ Description:
 						power-on:
 							Representing a password required to use
 							the system
+						system-mgmt:
+							Representing System Management password
+						HDD:
+							Representing HDD password
+						NVMe:
+							Representing NVMe password
 
 		mechanism:
 					The means of authentication.  This attribute is mandatory.
@@ -185,6 +191,17 @@ Description:
 					A write only value that when used in tandem with
 					current_password will reset a system or admin password.
 
+		level:
+					Used with HDD and NVMe authentication to set 'user' or 'master'
+					privilege level
+					This attribute defaults to 'user' level
+
+		index:
+					Used with HDD and NVME authentication to set the drive index
+					that is being referenced (e.g hdd0, hdd1 etc)
+					This attribute defaults to device 0.
+
+
 		Note, password management is session specific. If Admin password is set,
 		same password must be written into current_password file (required for
 		password-validation) and must be cleared once the session is over.
-- 
2.31.1

