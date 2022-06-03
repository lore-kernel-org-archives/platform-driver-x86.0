Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31736CCA473
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Jun 2022 17:02:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235555AbiFCRCv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Jun 2022 13:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344176AbiFCRCu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Jun 2022 13:02:50 -0400
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com [67.219.247.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC1826562
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jun 2022 10:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1654275769; i=@lenovo.com;
        bh=W5HasEbbVFfehRW1L8wY+7vaBIQCcPfG7zm1enN0GMc=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=y74V2ugPPKDjHyhsSfj+3r2xMuz8GCqXTxUAxzc3KnFAcr0HPj0lz1i37bHHPWNNd
         /6j6igXjpTqWnZc9DR4wwtdBVSjEYpCTbr6f+Aem44CUyAB/41gF0zeU7g9WXUlio3
         pMa4xebXAK3+UxWyEjBFawnTii1Io9fDdgGlmqC86a0ZbuWoWc0gm1LpPG2IH3qtpn
         O0fAMp1SzpOWdijkz32ZWtLF38GyuLlKYc8BoduqZMbjyvx/K2KHr1bDfu3xPa2sli
         phNzxS+p+S9tbRqKoBjFyxzwhGkFTo0k0U7v9aY47sxQLw8SB/+PEPc+B+enZTkekW
         AzUJYzFW+zGNQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSfUwbZRzmvfd6HNhuRxnwto6R1ZGo23V0YUJ
  Ip0twC4YYN//YzLZsXO3ZNumXvdZ1JCqRYIRBQJvhetWBYxvug3Vip1MoQg1jrR9zBfFzDpk4
  bEuGw0RXCdrjysR/Ls9zz8f7/PEjoXyIUJKs28k6rIxZRWTjxo1KG33pUV5XEuTLyhMjb2Llg
  0faYfnZ/mm4FVb1nmkkqm4PfE1UzfWu2QH3SExWnc1dIzGe8gShfZZ0J04o6sD1zCaQTQLqJE
  RTfQNpclyCJkM8JpJGDHmO/ZRSskg5xWPIFzooCHJqCEPxxOhiBFEjAB0OncdEpRGgv2IRXCS
  tGOq89hoUyU2Akt03JCL5HqD4z3eg0ExQ61EgkCSaAEmuolaj2Z4nBA8UqubORQjBk0vtQ+1j
  Z4GAcWod6v1NxDJKiz7ruYsLGFFF6EJHy2JnFrUFeT76lRCX70J94Vtpfw4Ke39Z9MOUv/6iD
  4oYoaHpaSj6H0DJ1qtwqfPV6A9AxDWoeWGSELECjX/3VaaIC9HwF2+lNzyJJju601ka/R2PSk
  SsRTPfBtL/zWjQk0xn16BIy5dYG6D5ZfP4ZfP4ZfM6ATwDKnQOk8HotDAmM60pKaE1mlL6kVK
  6XKNmamlG7eJoluGc9CY1c5BTsxyn5g5ZnjXr1VbW2QtSt6N3bN15Ccy8e1cdAgoSU+XJ1r3j
  1clX6Gz6Q0aGMx5wuMwsFwKrSVKFZPEKXifPcbAG1v2cyZy6wCUZkVLVKtnmopQs4+yMhTMZR
  CkCHiPHPggGITlxJZz6jvs7ByB5xLfwCZTjVpuVVRbIZrekYpQQM7qs90qXLjsKCpW5MpCRkS
  GX2lmHxeT8vx4DBSRQ5cpsQovUZHXeezuWmoWlZjnjR4VZTuY/SVmHNZFFm/aeezt/14oid8Q
  7kSjjt93qbpt3PNPXWhx9/elRaWc1X/iGwbO2KtkQ7vZ+Ht7HKdzKAy/sfz5YYVm4Wu23g4hb
  emd8ZKL+5OHa6gVtZX3DcIfd3+aaivXc2N0fyH8/cLRrI/nxHy81dDVqk2xUm7ldod5b8xDMD
  q7HDcnAtrYNE9vbC06NPci5pu6TVeo9o3i+pubKnm9yBvVD0q7z1unY/pfz7l/pup3487gOh2
  rlTMtlVfb83DEHKl2Z1/XKe3gl9CaKH29+cYMvvHP+99rdtWWfGupGx6b+8ftabyqi/sunrw+
  Ph5p1H15ryLpY3B/9sf80Mbt5LbjwlArnjIzmYejgmH8BcK1KYVQEAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-5.tower-715.messagelabs.com!1654275766!5960!2
X-Originating-IP: [104.47.26.111]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31758 invoked from network); 3 Jun 2022 17:02:48 -0000
Received: from mail-sgaapc01lp2111.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.111)
  by server-5.tower-715.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2022 17:02:48 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCk/E4wc5r4icf3xSI+Ct+WERzi77HPD8wGKYohC1S52qm+Pu/qeBTNp3Uui4S88IT9Cjg0svySLzTLJ1eX81QQWuOab7Vuo+i+k1vOImsuyVBfGaGZP7p/17hvtwbreInn3F1eDXUQkN+xmZ6Csj29FL+RtwZxTOdavZYOrswULCOcGoBnNqvm/in5S2ruEj+2k/bkyUyd0nxvHmPPih+dZ7wwx6ysvkjlR9D1j/Bj477+WXAVaTv4+FvDuMZ+sNIhh/OHyLbr7plDd1TTAgHgqygChlOq97PLnGx1SJQxDwAaRXEvsPIrolElHZ3Wn0XVQIeI+fzyW0kQHlESvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5HasEbbVFfehRW1L8wY+7vaBIQCcPfG7zm1enN0GMc=;
 b=G0Dp7ww8nxmb72v8FB2OWbwLNyuK6hePr5T46K0oEFdyK1dg12RERrh/ni/QU+jxIF0123bm1ohPkitql0npEiEDhPCVzjJ9FhOy0hfrqfQtfbtVIxdxriBqlO+u/PQX0NwgI0dh1vrvMaZkI7IfpUDZqHhbavO+PCSDHQMvHsDKxjLYpcaX83JRSLHLF1EOYR7PoB8SJovBrORk064xG+BjkYGNtFyIuANTLpbI8oGcvashXjYBjDEZq/RyJXhHYMNpVNyKG1nAjzGzBn5qboWHUp9G9d1BGrV4xXqmEXvs7Fz3xpRmoOZRU3aToYbIxF0lVBcA/WouALa0RchO9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SL2P216CA0149.KORP216.PROD.OUTLOOK.COM (2603:1096:101:35::9) by
 HK0PR03MB4882.apcprd03.prod.outlook.com (2603:1096:203:bb::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.5; Fri, 3 Jun 2022 17:02:44 +0000
Received: from PSAAPC01FT024.eop-APC01.prod.protection.outlook.com
 (2603:1096:101:35:cafe::cc) by SL2P216CA0149.outlook.office365.com
 (2603:1096:101:35::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Fri, 3 Jun 2022 17:02:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 PSAAPC01FT024.mail.protection.outlook.com (10.13.38.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Fri, 3 Jun 2022 17:02:43 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Fri, 3 Jun
 2022 13:02:42 -0400
Received: from z13.home (10.46.51.79) by reswpmail01.lenovo.com (10.62.32.20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Fri, 3 Jun
 2022 13:02:40 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 4/4] platform/x86: thinkpad-acpi: Enable AMT by default on supported systems
Date:   Fri, 3 Jun 2022 13:02:12 -0400
Message-ID: <20220603170212.164963-4-markpearson@lenovo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0c558c70-3cfc-48c1-d466-08da4582e0b4
X-MS-TrafficTypeDiagnostic: HK0PR03MB4882:EE_
X-LD-Processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
X-Microsoft-Antispam-PRVS: <HK0PR03MB48823FDA4C4A21B2D265B545C5A19@HK0PR03MB4882.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +jGA0Az2LhW+bXK+ByL6UiyQ1+L0h6Y3F5g8i9uk1UvxEGA7xy0bS6dhT0emFJzbL1NsDN8g1crATcBVe2MTiK35fKUjoZ1088uNeCRz7r9/60RDCQ89l36UseAx0yD/jlazzJxmTwxns5DXdJLDu0j7rRIlgJEOfZ2NFtOiclJIqqVHYvBXYntlcRn55OR2nhPq36/ICT6xceLKN280zACSp6dONFWS5cKSK0+hSYlpcyyu5K2Q8E72n+q8RB/OQzeIQhfhHc+Z6px4lQNhBWyCaUfDLZ5gfyEt9hK3T3wgfk8dKIPjOWX0BTpYKcNXFZqf8Up4u5mEMumotbvrEKG6rTPdZ2grYWK6m09i2aRk5zm/IMikSqgobhvy8g1IqleI/SYjNb7heGFyVSjPloBBLDyH31uy9OB4Rnuud8Mz/iv9zjuErDCXTeqTytCyQ6vDUMCNkpG8AE5em1LGrMad567wwOCcTgSULN+lSr8mjo/Esk/pAwE8BK+9E7bvyvOpE3XxBS/s3M+yXzY/WOj2+f3z0WmdeH/Wc2zqtTTZEIIgebad4g/SLPzBmmphgENhAOZ6DJubvDcGWWb8jZ+sTdnCZj2Q+QD3trDd92rLSl93EZn1ORLlUl62TaneChk92F5VDuHw4mS2vathaWKyOMd/V5ciE3Q8eM3zv7LMCidyMnuS9D0V38emww+eEyrZ9DdAdzMb++6m0pxfpw==
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(426003)(36756003)(356005)(7049001)(2616005)(82960400001)(316002)(36906005)(36860700001)(6666004)(81166007)(82310400005)(70206006)(5660300002)(54906003)(336012)(47076005)(37006003)(40460700003)(8936002)(8676002)(1076003)(6200100001)(16526019)(6862004)(508600001)(2906002)(26005)(4326008)(86362001)(186003)(70586007)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 17:02:43.9984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c558c70-3cfc-48c1-d466-08da4582e0b4
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT024.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4882
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

By default the ACPI platform profile starts in balanced mode.  On
supported systems AMT is supposed to be enabled in balanced mode
by default.

When checking the capabilities during initialization, set up AMT to be
enabled if it's supported.

Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index f11866225ef3..ae819ece9900 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10597,6 +10597,11 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	/* Ensure initial values are correct */
 	dytc_profile_refresh();
 
+	/* Set AMT correctly now we know current profile */
+	if ((dytc_capabilities & BIT(DYTC_FC_PSC)) &&
+	    (dytc_capabilities & BIT(DYTC_FC_AMT)))
+	    dytc_control_amt(dytc_current_profile == PLATFORM_PROFILE_BALANCED);
+
 	return 0;
 }
 
-- 
2.36.1

