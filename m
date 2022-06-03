Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03E0C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Jun 2022 17:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344174AbiFCRCu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Jun 2022 13:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235555AbiFCRCt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Jun 2022 13:02:49 -0400
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com [67.219.247.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB5B6436
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jun 2022 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1654275766; i=@lenovo.com;
        bh=HXOY7aObaRk4rfP5uyR8b/uQiToPcUmQ4f2O1dQMt60=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=kC4GAqVy8pEhaohKsFihJS7vRz/Pu9Hi3Z4huYkSVeaV8mfuQEQAn5wev6QlW76Wp
         Mq3JHWg1jQF8Zk5keWbZL6MkEieWP+PlLNIJDCaxByze9E2d13NRG7xZbzmJMzjIcc
         U3+pZnjs/tmdRXtgqT5KSCHKGeFQWT+Mc7LEk1IPbliN2mTYfcRVa8hw8Ob4PvQ0iG
         9Q9ksmrVbd9ec98z/pkURVmDjYIiox3E4veLhQEXNBMPVgOJrrnE7hETbsrU8nI+Wn
         trGHGeK3pAZ3sGhIZFZfuzeRP20yjPljsTP2bytEiQeiyJyJpZiRipbrYI7BpcsK3k
         8FUdxngYVYiYw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRWlGSWpSXmKPExsWSoS+lo7vNbla
  SwYNjIhZvjk9nsjgwdRqzxeo9L5gdmD02repk83i/7yqbx+dNcgHMUayZeUn5FQmsGVt3tLEV
  tPJV3Hp6k7mBsZGni5GTg1FgKbPE9J9GXYxcQPYiVolzp/awQDidTBKLumeygThCAnOZJNZMv
  wvlHGKSOPprLzNIv4TAcUaJ7lXuEIlORondW39AVfUzSbS1TGSBcB4zSkxccQ/KucUosf/XbL
  B+NgFtiS1bfgG1cHCICMhIfFjrCVLDDDLq85pTbCA1wgL+Et2ftzOC1LAIqEj09/qBhHkFbCT
  aey9AnSEvsWF+L5jNKWArMXnnM7BWIYEwid0nnzNC1AtKnJz5hAXEZgaqb94KcQKzgITEwRcv
  mCHqlSV+9Z+Hm9l26TYjhJ0g0fPvERuELSlx7eYFdghbVuLo2TksELavRF/fOah6XYlrTz5Bz
  bGReHtjC5SdI3F55UaoejmJU73nmCYw6s5Cct4sJOfNQnLeAkbmVYzWSUWZ6RkluYmZObqGBg
  a6hoYmumaWukbGpnqJVbqJeqXFuqmJxSW6RnqJ5cV6qcXFesWVuck5KXp5qSWbGIFpJ6XI9fU
  Oxkcrf+odYpTkYFIS5VVZODNJiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTva6tZSUKCRanpqRVp
  mTnAFAiTluDgURLhNZUHSvMWFyTmFmemQ6ROMVpyXNm2dy8zx4MTJ4HktfUL9jELseTl56VKi
  fN+sAVqEABpyCjNgxsHS9OXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz5oNM4cnMK4Hb+g
  roICagg0pezwA5qCQRISXVwGRSxRPIq5whdf6RjMaUU6uPWi75bqdm/0zGaqmaU71e5rkc2fS
  a0ylFmfvOhBxcfVWaN2QN/8GjB0/4n1txo2UL28ZlNzNnT/n8j+Gc0M07k5dUa/RL5/8+E9Gw
  qm5b1i/vt/yJrN5bhU5umJ8od+dU0cNXjxbYbkp1DClp3TLdu2XvfsXJcyLy+LgkJ5nlN6rpT
  TQ82to2/9wL7/XHfi39KWxzcfGF0M8TBATXRWq/zsqrYE58aKzXPa3/wBITrlcLZjVEVV/8sK
  /U8XSh+89lL0MK2l+l333x8cNU0d7a36I/uf81ytnWz3MuLclm51NMSglV5xERU2lq5LkdL/j
  7zIwZpR1GmjvZS54vrFRiKc5INNRiLipOBABwKO2iTgQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-13.tower-715.messagelabs.com!1654275764!20470!2
X-Originating-IP: [104.47.26.44]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29026 invoked from network); 3 Jun 2022 17:02:46 -0000
Received: from mail-psaapc01lp2044.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.44)
  by server-13.tower-715.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2022 17:02:46 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXwe4+QhM0Grmpncp532mMMVqmVW9n0jMaf+Pslss5M4fR023YkXycMoaSA4cRLKlj1wrKgpm8kGQIcjm1NoWBL9lwHbYsyNothodWOZ12x61XnFzheTJItK1+KVR/dBZ7zociWLnNq/hzOhLwBza5bvvDBnG6Dg+IS/qatNM9VC28PnXKRN6Bi02PLwIR/9vnihjsJ1CQLnPIVxX5Jzx51yp4b42keVqpiYqTv/6bj77nTXskq7paDNUha2j5jA5HF+QJMi52YqBb1tY2FBwOsMyMoqPTdZqjfF+WjgYjPD7mir3EE/9NFVdiUvTtEsui+QSGYFy5q4d3DpyWAVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXOY7aObaRk4rfP5uyR8b/uQiToPcUmQ4f2O1dQMt60=;
 b=dVJWglmLUfyk+5phhF0Y4ICIT3RYgJjF8h+6Z75reu4kxWl7bpnEFoS9MPsczCtmxgYBxuMhp6u4hfZeAjIcv6giO48XnghK7BJKJ0w1Djkh9+WkXoBdSIdMF9vxQilnStpZM7sOGVLI/DsmKnNm6FgTle8qDkFt/Skd2jjLnVT9taQKKVKBIvt1GOEYp4tgfnf2kIjzp7ltMsDHKM4cU0JhxAoN8A5EKLUwhf75q1Pnb5k/o0UYFxOCBVhQuZZTA4+KdWS4peYxvyRhM3D/gKNledOMHNwL0LKY51QRZ3CKm9Z02ThFGrB200WUqDo91cqJ3pn/PbqO/bGyk0CKUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PS2PR02CA0012.apcprd02.prod.outlook.com (2603:1096:300:41::24)
 by PU1PR03MB3095.apcprd03.prod.outlook.com (2603:1096:803:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.6; Fri, 3 Jun
 2022 17:02:43 +0000
Received: from PSAAPC01FT063.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:41:cafe::fd) by PS2PR02CA0012.outlook.office365.com
 (2603:1096:300:41::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.16 via Frontend
 Transport; Fri, 3 Jun 2022 17:02:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT063.mail.protection.outlook.com (10.13.38.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Fri, 3 Jun 2022 17:02:42 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Fri, 3 Jun
 2022 13:02:40 -0400
Received: from z13.home (10.46.51.79) by reswpmail01.lenovo.com (10.62.32.20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Fri, 3 Jun
 2022 13:02:38 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 3/4] platform/x86: thinkpad-acpi: Add support for hotkey 0x131a
Date:   Fri, 3 Jun 2022 13:02:11 -0400
Message-ID: <20220603170212.164963-3-markpearson@lenovo.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603170212.164963-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20220603170212.164963-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.46.51.79]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74da31fa-e7ae-40ba-798c-08da4582dfa2
X-MS-TrafficTypeDiagnostic: PU1PR03MB3095:EE_
X-LD-Processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
X-Microsoft-Antispam-PRVS: <PU1PR03MB309574A0911E837900393459C5A19@PU1PR03MB3095.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xguSEccWOVVgADQQrZM+Iz19OmsddtqzHKJeUFf76d00Mlag4kqV0YQMVx/xozCLZu6mfgVTrWMD2QCo7ug03gA1D44u/rty0ezA14XDht97j8pRHkrHoU/TWgaElDpd0RchLvFm4K+K7JLcXl+le4aP8B08AHKsp/In1RQmZUPMfARavvKw2QwABM3+MEnfkJoMJTTOq1DQhFs2TJ9ChitjflIL5rWqV0XGEE4L/fmDRWIXKTubaNmuILal7ELb2YNEwbVb5fuievInqUK07dz0Lk8nI+YWnnJRHQ5BW52Vcqi/gpnanxMO8u9kTysrjUzJT4ZRpm1Ut3FoPdJ1qLrmOBnFokw5q1DNgDrJPCmqtJC2VmDIE9qeujBW+jbXI2Tsmkg2+ki4BWup0jHzc2aJah1kd8dRGuPhGohMtox2iMDMLy5EArtEPowVUTu8puxP/mBOmvSYPeaCdwgeExbI13avSgDBZrEztaedgWsi1WXJD95kspGaC0RYvQeW3FrjEIh9tj91hrGYBHuHHtZ18F92ZjVcbzuPkyLXYYJ05ITNDBR07MNjUrz6pjJT0XVenl+BObBZxVDp2wwLPewNPRCRHh97co5Kr95QDmQ7OdxKmQAzMD+iPRVxnsWSu6gBTQsoIDwHwKYJjbJ4Xjx4+i+ijvhmn0vCzP28oQgdrKxGVxFGwivZXiUnKTtzo4obmDp185ik229c232Wt2ol000Yb/Rt4lnqcHk2FUt3kYWCOiA0CKSWMQpU0J32
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36860700001)(316002)(8936002)(26005)(7049001)(82310400005)(36756003)(8676002)(4326008)(6862004)(70206006)(70586007)(356005)(54906003)(36906005)(37006003)(81166007)(82960400001)(86362001)(2616005)(6200100001)(83380400001)(508600001)(16526019)(5660300002)(1076003)(186003)(40460700003)(6666004)(2906002)(426003)(47076005)(336012)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 17:02:42.1847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74da31fa-e7ae-40ba-798c-08da4582dfa2
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT063.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR03MB3095
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On some AMD platforms if you press FN+T it will toggle whether automatic
mode transitions are active.

Recognize this keycode and use it to toggle AMT.

Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 2df290cee0a1..f11866225ef3 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -159,6 +159,7 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_VOL_DOWN		= 0x1016, /* Volume down or unmute */
 	TP_HKEY_EV_VOL_MUTE		= 0x1017, /* Mixer output mute */
 	TP_HKEY_EV_PRIVACYGUARD_TOGGLE	= 0x130f, /* Toggle priv.guard on/off */
+	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
 
 	/* Reasons for waking up from S3/S4 */
 	TP_HKEY_EV_WKUP_S3_UNDOCK	= 0x2304, /* undock requested, S3 */
@@ -3735,6 +3736,7 @@ static bool hotkey_notify_extended_hotkey(const u32 hkey)
 
 	switch (hkey) {
 	case TP_HKEY_EV_PRIVACYGUARD_TOGGLE:
+	case TP_HKEY_EV_AMT_TOGGLE:
 		tpacpi_driver_event(hkey);
 		return true;
 	}
@@ -11038,6 +11040,15 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 		if (changed)
 			drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
 	}
+	if (hkey_event == TP_HKEY_EV_AMT_TOGGLE) {
+		/* If we're enabling AMT we need to force balanced mode */
+		if (!dytc_amt_active)
+			/* This will also set AMT mode enabled */
+			dytc_profile_set(NULL, PLATFORM_PROFILE_BALANCED);
+		else
+			dytc_control_amt(!dytc_amt_active);
+	}
+
 }
 
 static void hotkey_driver_event(const unsigned int scancode)
-- 
2.36.1

