Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08070C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Feb 2022 18:52:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234844AbiBVSwf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Feb 2022 13:52:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234306AbiBVSwe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Feb 2022 13:52:34 -0500
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0054E10C538
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 10:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1645555926; i=@lenovo.com;
        bh=cJwfREZ9CfCuLYwhRP26fVyyKBDlpILwnAw/mGPfWLg=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=LthSsM8ys6rxK9u9Ll11Fa/iBtWAjsURj3dRc4zW/+nBNJFwbFkVAFyTUeH3BmJna
         mUoxondcXSHL9HOuvQgJGUjORXH+Sek1OVWRfeFJP1/3+hDpLl0m4CZup8vC+gXOKk
         yox+Wb/ehhJXyHi6TssED0tJKNijQjCdRzu9SMQmuEEEe3qAPCMD1HPDQnUB1WO2mR
         0Kmlwh95ulFWQ5ZNQD+CzqovhCWAdz9DgVgBrq5bJ5VzKDKKgVj6aX1TXCWAkLYjdP
         +FeS63KqDVmRDu0y2snsdg29GDFM3THsFyQoSHEib5Uz6A3obXsrmx/sbjSp7zMOwc
         wRJZ5YELSsGIw==
Received: from [100.114.100.29] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.us-west-2.aws.ess.symcld.net id E5/BC-02723-6D035126; Tue, 22 Feb 2022 18:52:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCJsWRWlGSWpSXmKPExsWSoV9jpHvNQDT
  JYOYEZos3x6czWRyYOo3ZYvWeF8wOzB6bVnWyebzfd5XN4/MmuQDmKNbMvKT8igTWjOtzHjMW
  /BGvaP7xjLWB8aFwFyMXB6PAUmaJf+c/MHYxcgI5i1gl+g8GQSQ6mSQWdc9kA3GEBBYySRw5d
  wLK2c8kcXnbbFaQFgmB44wS3avcIRKdjBK7t/6AqprIJNF54CQjhPOEUWLtpBnsEM4bRonJJ3
  azgPSzCWhLbNnyC6iFg0NEQEbiw1pPkDCzQKTE1UffmUBsYQEHif277oNdyCKgKvF1yk52EJt
  XwEqie/VkZogz5CW6//0BG8kJVHOm6zGYLSSgInH/wRI2iHpBiZMzn7BAzJeXaN46mxnClpA4
  +OIFM0S9ssSv/vNwM6fffcoEYSdI9Px7xAZhS0pcu3mBHcKWlTh6dg4LhO0r8ffoJ6h6XYk9j
  +dDzcmRaN69A8qWkzjVe44JZv7OjbdZJjDqzEJy3iwk581Cct4CRuZVjFZJRZnpGSW5iZk5uo
  YGBrqGhia6lua6ZgZ6iVW6iXqlxbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBSSelKNF
  mB2Nn/0+9Q4ySHExKorwP5UWThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwTtUHygkWpaanVqRl
  5gATIExagoNHSYR3HzdQmre4IDG3ODMdInWK0Zjjyra9e5k5Lh26spdZiCUvPy9VSpx3E8gkA
  ZDSjNI8uEGwxHyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvI12gKTyZeSVw+14BncIEdM
  qULCGQU0oSEVJSDUzzzvxabbzT06qy46jNig3Of9W4fh7eG3+9erfTpUdVz3xPcfbzmtatzOx
  X1tgwTfisxpfDcQ6tXc2zClOSV/o7Ld/zvn/xLrVF7q9S9WxUllqe45jzyv3b/Opwj/qPs9b/
  /vPl4qt9W+1/PKxb9CzSzuRO+wS1IKNX3Zorn+5jXKNkY7uE724r76Sb4U15Cd2/llpdWGFy8
  9FT19NNvWn8fVua783Tmdf0fqsI95aENq2woChvhr1zF34+IrzGXU6lOF7pov+9J82bIzYuaU
  /bN7/2NkvFqxv329hEt2bNLTd4kxaYnyfKXnhLo8Zzw+7Hsy7NzYsyPCrdybMu67thqsvRX5V
  v5N+sWf9+yzclJZbijERDLeai4kQAydK5xEcEAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-2.tower-636.messagelabs.com!1645555924!1283!1
X-Originating-IP: [104.47.124.50]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14536 invoked from network); 22 Feb 2022 18:52:05 -0000
Received: from mail-hk2apc01lp2050.outbound.protection.outlook.com (HELO APC01-HK2-obe.outbound.protection.outlook.com) (104.47.124.50)
  by server-2.tower-636.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Feb 2022 18:52:05 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elqRQHG0csdECBGb7IKo0wSnK04YlGqSPTvk0+0qHxQiRNXuOHG7L8PneY6c1WNWeaBXVq92cJH9JgAswjGqSjD0CKesyxSqjKMaz//HX+iUiONqaTwbIHhRDuX1oUNaNF02aMpUQltOMIQht9mxx5rnePimYOgVrL+UtGqEe0wNmMThedY2muDX114g54IzZun+h53DgTO2eXJWoaWU1V3KpEwJJlieiteLI+sSqtsVVJGPLsNUpn+7elXQLfdnL6y9WfP7h5xeZ2DVo37Qq0XJqDUctFeneyXIsroBc/CFupnf9PxXg9jzbq7Q/WQh/VXoIM8pysC2kxmy6nZ6Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJwfREZ9CfCuLYwhRP26fVyyKBDlpILwnAw/mGPfWLg=;
 b=XkD2TWtpkrCPYS2ury7/aHpfXcH+nnG7wfto7abM0SJOgxhcEx5CxBBKpl1dgVxVHjD+ViVeDQLGZYluexmFBvZ7ivriOSvTJFaV6KafxkzVp42ACuDvP16m8v1m72WmIII0TQEhDyTC7KUDPc1E9dRFY2M4aSOol1h11LgZuoUhyfna/BD0CHWmkQZOUjUBj43SZY0IM+FBJgGFJFyeeHuWZzIayZpwRAnnLgeT5wQPsdOYPJS4qh7nCYY0CJY2R+h1zivS4v1JIsnC26CAT3MjBKGAol7dlTiqOikd4QCxU8tU+wOwbGKDI+dKzEhoGreO+7/fUEXJZjjcrKJhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR01CA0163.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::19) by TYZPR03MB5966.apcprd03.prod.outlook.com
 (2603:1096:400:126::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.7; Tue, 22 Feb
 2022 18:52:03 +0000
Received: from HK2APC01FT043.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:28:cafe::64) by SG2PR01CA0163.outlook.office365.com
 (2603:1096:4:28::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21 via Frontend
 Transport; Tue, 22 Feb 2022 18:52:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 HK2APC01FT043.mail.protection.outlook.com (10.152.249.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.20 via Frontend Transport; Tue, 22 Feb 2022 18:52:01 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Tue, 22 Feb
 2022 13:51:58 -0500
Received: from fjara-pc0z45gl.lenovo.com (10.46.52.68) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 22 Feb 2022 13:51:57 -0500
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86: thinkpad_acpi: Add dual fan probe
Date:   Tue, 22 Feb 2022 13:51:37 -0500
Message-ID: <20220222185137.4325-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.46.52.68]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44806ed0-44d0-446b-e699-08d9f63469dc
X-MS-TrafficTypeDiagnostic: TYZPR03MB5966:EE_
X-Microsoft-Antispam-PRVS: <TYZPR03MB59666FC597C35585158CB72DC53B9@TYZPR03MB5966.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nMYjzAsCeU+2wDpBXHy7S+vxpxEWKe/tRwWfuWczfRlkAbUeA4gGEY1C5+n/wtvNI51XTr7asCcd+BSrigzFsICLdkSH7MHcc3H4XnxPzqn9C8uoGozE0k9S5QMbZu9bMWSV3nZh8BmD6wZcWdTJyjvmgTLSF+x6mhEpJDMtZyjbozpGG8+7imHbbBhVAHv3XscC93S9nzHcG0LfPoggOZEijYMmbL9P0gROiB1DJzYBAa4WASu6dYRvluNfw26DFfcJWOEy3HM/ZZB4zY4Mbc0uW7a+FmKr1Cecp8EALnZZ/8i3MxhKbZNlqmMh9VeIbOGirHissTXfvE42NI0bYdEi74CoFe0iiEelR3+1ShiDBp0Ett/HgT6nXqpRDMQ5ciNtmiybXQ21W7Zn/P+Yghtfp6yZ4nJ6/EqRNChP8OT/5E01LY4jsfJm+0XwMLeGQwcwp4cB4eJJ0pkYtMWIhehBdanlwP9Lz0p/VUTRov+d6LKi82bI0lDbsj67B8NewEtL+I9bqWzs7LmMtjtPTsfc1b0Peo/rOldGaPLv5ZPGJ6et3L1oE9nRRLXXqTbdxavWNeXmw+vrZ6V2vveTHtrDNBGBOsJtWb3mfc7aY1tc3nQmh6O+higwhyR/ig9cBY+f2FWJxjrcSKFYOpTgkIesREtH94wXZEMIHKLFCrU9wHpToKyGRVILtde/FtzUCNFQW6mlXh3o/2kcwyOReg==
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(40460700003)(2906002)(54906003)(36860700001)(82960400001)(82310400004)(86362001)(6200100001)(81166007)(7049001)(36906005)(37006003)(356005)(6666004)(70586007)(7696005)(508600001)(70206006)(5660300002)(4326008)(6862004)(8676002)(8936002)(26005)(186003)(316002)(2616005)(83380400001)(36756003)(336012)(16526019)(47076005)(426003)(1076003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 18:52:01.6484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44806ed0-44d0-446b-e699-08d9f63469dc
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT043.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5966
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Instead of having quirks for systems that have a second fan it would
be nice to detect this setup.
Unfortunately, confirmed by the Lenovo FW team, there is no way to
retrieve this information from the EC or BIOS. Recommendation was to
attempt to read the fan and if successful then assume a 2nd fan is
present.

The fans are also supposed to spin up on boot for some time, so in
theory we could check for a speed > 0. In testing this seems to hold
true but as I couldn't test on all platforms I've avoided implementing
this. It also breaks for the corner case where you load the module
once the fans are idle.

Tested on P1G4, P1G3, X1C9 and T14 (no fans) and it works correctly.
For the platforms with dual fans where it was confirmed to work I have
removed the quirks. Potentially this could be done for all platforms
but I've left untested platforms in for now. On these platforms the
fans will be enabled and then detected - so no impact.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index e9b1574729b9..d0599e8a7b4d 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8698,10 +8698,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('N', '2', 'N', TPACPI_FAN_2CTL),	/* P53 / P73 */
 	TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (1st gen) */
 	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd gen) */
-	TPACPI_Q_LNV3('N', '2', 'V', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (3nd gen) */
-	TPACPI_Q_LNV3('N', '4', '0', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (4nd gen) */
 	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v (1st gen) */
-	TPACPI_Q_LNV3('N', '3', '2', TPACPI_FAN_2CTL),	/* X1 Carbon (9th gen) */
 	TPACPI_Q_LNV3('N', '3', '7', TPACPI_FAN_2CTL),  /* T15g (2nd gen) */
 	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
 };
@@ -8745,6 +8742,9 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 		 * ThinkPad ECs supports the fan control register */
 		if (likely(acpi_ec_read(fan_status_offset,
 					&fan_control_initial_status))) {
+			int res;
+			unsigned int speed;
+
 			fan_status_access_mode = TPACPI_FAN_RD_TPEC;
 			if (quirks & TPACPI_FAN_Q1)
 				fan_quirk1_setup();
@@ -8757,6 +8757,15 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 				tp_features.second_fan_ctl = 1;
 				pr_info("secondary fan control enabled\n");
 			}
+			/* Try and probe the 2nd fan */
+			res = fan2_get_speed(&speed);
+			if (res >= 0) {
+				/* It responded - so let's assume it's there */
+				tp_features.second_fan = 1;
+				tp_features.second_fan_ctl = 1;
+				pr_info("secondary fan control detected & enabled\n");
+			}
+
 		} else {
 			pr_err("ThinkPad ACPI EC access misbehaving, fan status and control unavailable\n");
 			return -ENODEV;
-- 
2.34.1

