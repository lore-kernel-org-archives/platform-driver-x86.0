Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E42CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Nov 2021 18:45:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7369261BF4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Nov 2021 18:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232774AbhKQSs0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Nov 2021 13:48:26 -0500
Received: from mail1.bemta24.messagelabs.com ([67.219.250.4]:8071 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232600AbhKQSsY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Nov 2021 13:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1637174725; i=@lenovo.com;
        bh=Y2foe30YnCS8d959Kjl6e1ffCoju1AzWz7rMAEy16yM=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=wlrYxObpmBNbLM88P8WiJfQ3eksdvZtKoZnsPLXhpTvh43nZM15q0/xXWUNw8VLdN
         T3NYBH24/ybBxKbSTxEnZc7/qDrwSOmBthHAM2u4xqTgLjvPawKZgmvL9Tfepv0h19
         hcwCwKs9jhJyCpNAjuHjZcvmGthlXovx0KNMAiqDo2JveYvdyZw19H2maKVdsAJiAr
         +iUquf7JLRMtyFCgZO584dgAzkczN+umUEtHbwfkE6Q73/1MvyMFbEFjVotLKr2pUM
         TevPYYIMfMxY6JKhHANUqJVl+tFhRaTMOLwgAkusv5fF4xOJgfJJRXA8TmYRCW9Kfs
         YEzO97o6dKt5g==
Received: from [100.112.129.81] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-a.us-west-2.aws.symcld.net id C9/6E-10907-5CD45916; Wed, 17 Nov 2021 18:45:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRWlGSWpSXmKPExsWSoS+VqXvUd2q
  iwbS1/BZvjk9nsvjcMZnFYvWeF8wOzB7zTgZ6vN93lc3j8ya5AOYo1sy8pPyKBNaMu6/usRRs
  FKtY33SLsYHxsWAXIxcHo8BSZolFH44wQziLWCU67m1kgXA6mSQWdc9kA3GEBOYxSXxtaGaGc
  A4zSTx79Qsow8khIXCcUaJ7lTtEopNRYvfWH1At/UwSR5d9Y4VwnjBKPG1dywjhvGSUOLzsIB
  NIP5uAtsSWLSCzODhEBGQkPqz1BAkzC0RLNL+9wgpiCwvESHyd08oCYrMIqErcmvyCEcTmFbC
  SOHJmNRPEGfISp09cA4tzAtWc6XoMVi8koCJx/8ESNoh6QYmTM5+wQMyXl2jeOpsZwpaQOPji
  BTNEvbLEr/7zzBAzFSSmHD8EZSdI9Px7BPWypMS1mxfYIWxZiaNn57BA2L4SF6cshbpHS+LBl
  gWsEHaOxMtF66F61SQ+npsOFZeTONV7jmkCo+4sJOfNQnLeLCTnLWBkXsVonlSUmZ5RkpuYma
  NraGCga2hopGtobKBraqiXWKWbqFdarFueWlyia6SXWF6sV1yZm5yTopeXWrKJEZhuUgqajHc
  wbn7zQe8QoyQHk5Io72+tqYlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjXewPlBItS01Mr0jJz
  gKkPJi3BwaMkwsvtA5TmLS5IzC3OTIdInWK05Jjwcu4iZo6unoVActKR3duZhVjy8vNSpcR5P
  4DMEwBpyCjNgxsHS8+XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzaoOs5cnMK4Hb+groIC
  agg2QvTwY5qCQRISXVwJRscZknzOmDsstBx7adGctrTvOy13JG8+3bMlNbZkp3JqP0zCPB4t9
  E9RXXMDixMWzaMUFIbaEtg1WkbWWS/+N8K77z3wsOq8em/vG6aq1jvsz9csLS9W9e2l+t8VGe
  zhKgaLCkMlfg2FRmMY+iN1vX3d68X7/O5vgynvq/RTvfXJg2Lzi789hch9wp84yLL/0583iXm
  Pp0U9PTW0/xL+y2KlC7HXPZ9sexhoIa3duniucduXg1curs6zPXv6sUXrCXYc6Lk9NkOTZGfA
  5bqWCktW1Kzb+t/JKL73PwPV/yw5QlqZ3xwD6Hi9kOP548fNt/uqPhXP8PkUm3nrN/NN96Wyy
  961Ga/L2QNf9LlfOVWIozEg21mIuKEwEJqWYASgQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-3.tower-335.messagelabs.com!1637174723!44987!1
X-Originating-IP: [104.47.26.105]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18526 invoked from network); 17 Nov 2021 18:45:24 -0000
Received: from mail-sgaapc01lp2105.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.105)
  by server-3.tower-335.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Nov 2021 18:45:24 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZN7OQAHEXw7ajZDMTs/Lou9bc87shdV7jiMf/6XvUzh8y5lJ7i0Zc47xtEJTXQ7na9S9+TU7iuEDP00OHEcIMjPDHQYHGaCwJinprVFiOnIqTgxWcHHyJwGhHZSWmzTzXlh1rZkJMCNzPbSXnv7GfcHQvIn76kzia9UCZkCLqm/JDoiPqXk2iPvTwD6XBxlRzDBtPIm5nvhi30sXY7M8FNtg8hU6laJvZeR9hxOvI5EVmIUUOHl0XOG1WKI94/7UqYOea7Hv6bc3/nVpnAkfqFbFRJF3JulpBujrKTU7bTZyR2BAo4hkMJls5Ntia2GJsblgLuLXs76X6Ebo74oekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2foe30YnCS8d959Kjl6e1ffCoju1AzWz7rMAEy16yM=;
 b=lrN7ylKUXmLPNMdNPX5TT/DeG1r/VAh2//KxFkeGLeHykpPTl9R5Xp3Tq8nNuxbzfDCHO/E+kSVgtkC68elLVcBSwhU1caxO+V3OBXXTI9Dqg33/Tcx8C7FYQjvohgpHpbTHrMRKKPaeNnHXxKPmkXzqJ7fs70Oe1ZncHm+CuahcYrMpvehb7fQ0OaakUtWknShijF9UtXKu0wIokeIAiTlklOYY99wMZGbLxgBYDHn+CX3YmFKaBpBS9v5vyIDpIdJ4DMj7bCLleVYaShzvc/9uLrzUvQhibNXpGfG/QJxxRh/51NCEjrOc0V65/Ke+kdcNPEeKqiGuFccXdkZBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PS2P216CA0072.KORP216.PROD.OUTLOOK.COM (2603:1096:300:18::34)
 by PU1PR03MB3128.apcprd03.prod.outlook.com (2603:1096:803:2b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.17; Wed, 17 Nov
 2021 18:45:22 +0000
Received: from PSAAPC01FT015.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:18:cafe::19) by PS2P216CA0072.outlook.office365.com
 (2603:1096:300:18::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Wed, 17 Nov 2021 18:45:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT015.mail.protection.outlook.com (10.13.38.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Wed, 17 Nov 2021 18:45:21 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Wed, 17 Nov
 2021 13:45:20 -0500
Received: from localhost.localdomain (10.64.82.201) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Wed, 17 Nov
 2021 13:45:19 -0500
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v2 1/2] Documentation: syfs-class-firmware-attributes: Lenovo Opcode support
Date:   Wed, 17 Nov 2021 13:44:52 -0500
Message-ID: <20211117184453.2476-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.64.82.201]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4f6657a-bdb0-451c-9db5-08d9a9fa691d
X-MS-TrafficTypeDiagnostic: PU1PR03MB3128:
X-Microsoft-Antispam-PRVS: <PU1PR03MB31282A6DF4127FBD08A96DC1C59A9@PU1PR03MB3128.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJJPHwYHdFrLNhpkFhHGHjWNh949RbfWg/OU7cejGQkYWAdv94K60QvuJ94VWmb3u+uyWSYN6wULTFsMO+nv9wfpsXk6SsFMJU0IWY/c6rNpaXpjCvg33SQbkcVJ6YuehEHW9rL1GhTOGr7XaJQN1lsbJELsmWarxCJ3C8tTqfn+MR5QBNs71tZSxPbZ8yzKqgN4cfuJmEYU7Z+x/0iZlyf/g4PHh0LX/5Z4ZS3YMA42z70n7FxThmxn3PpjvJpO9RQlXzwHGHc8AMjlMiS7M3QxDhdOJu+U94FH7BODztXNTf5GlS5ET4wpCmbN0Lb/z9ahn1DiNToDWGrBrpVFyiiu+XXz/CeXFEHpdZ2oVlPtP6FoTYxxu5f4xK+x36gx3iMGxMRLqixhhjaUs6Z9gxy3H8LRupwPrwa3QOoiub5XKJ17T+bOIp1Kq6M4CTZNbFYE6TnbKOKJU+ZfK5/WfjfOGC3TXJkvJ8BzaVeMXj4FVuthsz8PV45Sn7WomE+72xYeNQG7mfxzhZ+LR7Lb8GJG4191r2Bf59slnRoGOCc2K0+cZ3fCuIQFrdnamPvjQupt0pcMCgo01ZuVg37RKBJPMrD5tgEMRKy8zyb/MwDO2lBEDhvnBwwDpY0Gu2ZcKN7l18XtVEUbXKxf2KI0D3jGHrgf0gTc6vG84ukFv8YZLvWseRQSuO8BTtU908c9O8NjqFfXGDMBsT7qQysSpRJPHuZuqNPo/yvx0gC6WII=
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(426003)(186003)(54906003)(82310400003)(37006003)(4326008)(36756003)(1076003)(47076005)(83380400001)(336012)(5660300002)(82960400001)(316002)(36906005)(508600001)(26005)(2616005)(36860700001)(8936002)(7049001)(81166007)(8676002)(86362001)(16526019)(2906002)(6200100001)(70586007)(6862004)(356005)(70206006)(6666004)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 18:45:21.5605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f6657a-bdb0-451c-9db5-08d9a9fa691d
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT015.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR03MB3128
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
Changes in v2:
 - Move 'level' and 'index' authentication attributes to Lenovo
   extensions section
 - Add details on system-mgmt and drive authentication roles to Lenovo
   extensions section

 .../testing/sysfs-class-firmware-attributes   | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 90fdf935aa5e..13e31c6a0e9c 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -161,6 +161,15 @@ Description:
 						power-on:
 							Representing a password required to use
 							the system
+						system-mgmt:
+							Representing System Management password.
+							See Lenovo extensions section for details
+						HDD:
+							Representing HDD password
+							See Lenovo extensions section for details
+						NVMe:
+							Representing NVMe password
+							See Lenovo extensions section for details
 
 		mechanism:
 					The means of authentication.  This attribute is mandatory.
@@ -207,6 +216,13 @@ Description:
 
 		On Lenovo systems the following additional settings are available:
 
+		role: system-mgmt	This gives the same authority as the bios-admin password to control
+					security related features. The authorities allocated can be set via
+					the BIOS menu SMP Access Control Policy
+
+		role: HDD & NVMe	This password is used to unlock access to the drive at boot. Note see
+					'level' and 'index' extensions below.
+
 		lenovo_encoding:
 					The encoding method that is used. This can be either "ascii"
 					or "scancode". Default is set to "ascii"
@@ -216,6 +232,22 @@ Description:
 					two char code (e.g. "us", "fr", "gr") and may vary per platform.
 					Default is set to "us"
 
+		level:
+					Available for HDD and NVMe authentication to set 'user' or 'master'
+					privilege level.
+					If only the user password is configured then this should be used to
+					unlock the drive at boot. If both master and user passwords are set
+					then either can be used. If a master password is set a user password
+					is required.
+					This attribute defaults to 'user' level
+
+		index:
+					Used with HDD and NVME authentication to set the drive index
+					that is being referenced (e.g hdd0, hdd1 etc)
+					This attribute defaults to device 0.
+
+
+
 What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
 Date:		February 2021
 KernelVersion:	5.11
-- 
2.31.1

