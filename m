Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45822C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 18:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239459AbiFVSNw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 14:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359064AbiFVSNv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 14:13:51 -0400
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com [67.219.247.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0007B3C4BD
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 11:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1655921629; i=@lenovo.com;
        bh=iK/OBnm0jZpy6VNLLuuXZOxv/ceCMlRYHjjnt3t3F4E=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=SwYAwm7OtcLdPrbmxvMV54bZhVGWHZPWgCpNsxwI3UEkWaMvk2tcAJ4S+yL+g8tE8
         OfPV754OdtpsWjsaoMobr/8lUDGog2OwGSAKidB+qZy1tq/GXqYCZEYoBL8gO2lTCK
         TsL9eGp6HMjuJNXUzvIVE3/c9c0lx7snq8taGw3PL7r8ZBPVduglJBWYQ4q9S2Etqj
         RAppwXHTSPkqO9KMrDQUoU5h0fCgflZDo/JQp+PCbSbUhLMADkmk7vURHQ+BOYIXdc
         Ziw7V5zMMDN+8OsRaY9OHwImKQ7KzewTDjyac6bvsTBdOLv/ZmyjNqfBfKAsbgvRW5
         MoJLyX2ntMlRg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLJsWRWlGSWpSXmKPExsWSoS9VoHsnenO
  SwYPPqhZvjk9nsjgwdRqzxeo9L5gdmD02repk83i/7yqbx+dNcgHMUayZeUn5FQmsGRf3drIX
  TOCs+PyEp4HxEXsXIxcHo8BSZolLJ4+zQTiLWCUuHlnFCuF0MklMnncPrExIYAaTxOzXJ1ghn
  ANMEr/OLwbrkRA4zijRfWgdE0Smk1Hix6tTLBDORCaJf9+vAw3gBHKeMEpsvykPkXjKKPH75W
  1GkASbgLbEli2/gGZxcIgIyEh8WOsJEmYWiJS4+ug7E4gtLBAi8XXpQ7A5LAKqEjuut7OA2Lw
  C1hJvj30AGyMhIC+xYX4vM4jNCVRzpusxC8ReFYn7D5awQdQLSpyc+YQFYr68RPPW2cwQtoTE
  wRcvmCHqlSV+9Z9nhpipILFo5U52CDtBouffIzYIW1Li2s0LUHFZiaNn57BA2L4SC3b3M0HYu
  hJHNjRB2TkSXR2foOrlJE71nmOCuXnnxtssExh1ZiE5bxaS82YhOW8BI/MqRuukosz0jJLcxM
  wcXUMDA11DQxNdMwsg01wvsUo3Ua+0WDc1sbhE10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyMw7aQ
  UuWTvYGxd+VPvEKMkB5OSKO+JwM1JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4A6KAcoJFqemp
  FWmZOcAUCJOW4OBREuF9EQGU5i0uSMwtzkyHSJ1i9Oa4sm3vXmaOBydOAslr6xfsY+aYOvvff
  maO5WBy5te2A8xCLHn5ealS4rzXIoFGCICMyCjNg1sAS+WXGGWlhHkZGRgYhHgKUotyM0tQ5V
  8xinMwKgnz5oJM4cnMK4G74xXQiUxAJz5ZvgHkxJJEhJRUA1PAxC8Xm2QjtLNFVj7dsWmRdde
  K7Y/b+TOCt8clmasaVC4WmbC1ynJ71OXUHGXHFvNn3w8w9R/Zu+9qZbZu1Z0lVm0bt5aw3+E5
  558at7N05t0Mm7i0ilv3JLXC/GVOC6a4WQn8UmKR4vs9P4PjC9ObsvvGn2ad8GCa1eSuYxtXv
  fxx3+mig1ozLp0xdjTQe11pkpjfN6NrMZ/Q8vhLj2L/vrkuVrXxuk7b1SeRXS8XHHP4zfXr8e
  ZTYf7H16l1M4vvLrmQHH4x4LTNTimLrUdUrCo6uMzum2m43ZT4+kJyAiOHSKe3i0dl0pmK6BT
  ZnYwKvFdtS5Q43YJ/bYl9vvNCrcXxk80L/YVW2O9mV2Ipzkg01GIuKk4EAHBdQO9gBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-4.tower-715.messagelabs.com!1655921626!142860!1
X-Originating-IP: [104.47.26.112]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12594 invoked from network); 22 Jun 2022 18:13:48 -0000
Received: from mail-sgaapc01lp2112.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.112)
  by server-4.tower-715.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Jun 2022 18:13:48 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afE/G73tlRwdxD9CIJ2OKgW7oYC8WWaPviwFh0XCJxalydgp4T/B4qblScJm2q/J2/DkFORr/d1oodjyjsB+mlJsJqWyot7y0uBIHrzSp8SE5A5rtNj01gdQ2Up2f32eTaHKBb+vBd6+MlXD5+9sALCa/yJnAESCKwnc9oXtSIWFH3rse5WyM9uK33/UBEyLmUoZwPOTcBVNENcbclRf3NXLIg8IG/KyvQkRgtrv/7M5TaoTrNPthQZ/j9IOcPq75vuxdKEnEYiaqyupEC+uCA61HoSxaow3E7tZGjkjHd/WKEQghwNNgPz4VQHAbRgYDjqPlCXW6Fo09WyHO8QMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK/OBnm0jZpy6VNLLuuXZOxv/ceCMlRYHjjnt3t3F4E=;
 b=Rr8PdVCo4gKQnPV0bf/4tri3IXGldYrpfoB89nDYaty8ETBVxtbFrKX9Gn/w7aDWIGyimw4oXS2eqFaJ9YwRZfJc0XzGxrJrnaJuQ2jpd+aESZf8+4E7SDuxjwBa628fdXedIfWO4/UnQsfJs2WEj38VcOVnvNP5Ybd8as2RC2d21SWePuTjG4uAD8en6lkYHE7L1H6mR7PpvKmSB52FjQduC73sIgbYGhKZgqlSzp4SKs0sjWRGPP3NipbawTTKZV9d5Hpg+5FaREMvURx9nw+9ecRcR4ysmiNQM47NTLL0C1k6rFuMcxY1uS421BGUqwwSzemhAJLlGjKS/3TUAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SGBP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::21) by
 SI2PR03MB5658.apcprd03.prod.outlook.com (2603:1096:4:139::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.9; Wed, 22 Jun 2022 18:13:45 +0000
Received: from SG2APC01FT0020.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:b0:cafe::6f) by SGBP274CA0009.outlook.office365.com
 (2603:1096:4:b0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Wed, 22 Jun 2022 18:13:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 SG2APC01FT0020.mail.protection.outlook.com (10.13.36.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 22 Jun 2022 18:13:45 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Wed, 22 Jun
 2022 14:13:42 -0400
Received: from fedora.Lenovo.com (10.46.55.130) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Wed, 22 Jun
 2022 14:13:41 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86: thinkpad_acpi: do not use PSC mode on Intel platforms
Date:   Wed, 22 Jun 2022 14:13:29 -0400
Message-ID: <20220622181329.63505-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.46.55.130]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f59f36b3-f3ee-4289-7cd1-08da547af28a
X-MS-TrafficTypeDiagnostic: SI2PR03MB5658:EE_
X-Microsoft-Antispam-PRVS: <SI2PR03MB5658C10BA34AB58DE1FF5DA5C5B29@SI2PR03MB5658.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wvahH/83f7AfC1eOribW0SwzRvKo1dsLt/0rxQxdlBgT8gpKZSW6/lv39lVrr//uzbP5va0EsmOJ56VVZYfyXFbYBZJTkd52u/8w7TRb4UuMArcPGhofHbz424Aesg4zM7PT9OX4QT4UywV35+6w8+XZDnw7EllB/l1HqxtEHNUFppNmuVT7y7IE5wqDEBHB7tpWkPZQG2T7kUwOTO/cZyGPszR4TMFXm8oiNgKcrYzKWYkbeKeXzqAKBQcFRB3+LIt7SIYHjbJKYroyEfnDAsPqtG3Tv1+tcmE8KGsJFH3rFvrM1kp6T7AwVKNkYHCVpAoZUsnaOsmi5jKA8KxrhdTCa7vQYckieCbMuaPXg5XBtHodinFmD4FkhjxCGErkdpQU+JpDwqcyFc1mIvbt6A1fpXBF+D4/LlM9BPbFM4o3hz9tBjYBuo3N+pGYDcBm7b2kRLX1iv1z7dBFjzDAXBsI1D50p683KQScE8xn6ehcJHdN6DVOs8wdtByS1RspEkksk0jnXYbolZgtQ6LPw7QctwlL1MGfgZGooir+KE1qC5geMjFZ2RGCi966CY+JeX6jV3qwVnz6WWV/+tuikYt8Xg+QvAmVi2XcEk1yyUhlUvm8IgFMaKs5Wh/kxbKKkjJ8BhprQsk7HOR1HwGL/r08RD7xLL8dSoU7tDMlGIMeipMBSLVxWvsu/bzCPy+5Hcqp8/BATljpSrI3t5rtKAKMP1MzrPTl9UF+Ur37HRkrrTPs8sTn1uqFdHYtjpWGU/LV3XTxWX/MukHakmczYEVnRi2t1nWtKmcAv8HQhFQ=
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(36840700001)(40470700004)(46966006)(47076005)(426003)(6200100001)(40480700001)(26005)(16526019)(186003)(41300700001)(7696005)(2616005)(336012)(1076003)(8936002)(81166007)(6666004)(82740400003)(40460700003)(356005)(86362001)(54906003)(7049001)(82960400001)(82310400005)(5660300002)(36860700001)(316002)(36756003)(70206006)(2906002)(70586007)(8676002)(4326008)(36906005)(6862004)(478600001)(37006003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 18:13:45.2939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f59f36b3-f3ee-4289-7cd1-08da547af28a
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0020.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5658
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PSC platform profile mode is only supported on Linux for AMD platforms.

Some older Intel platforms (e.g T490) are advertising it's capability
as Windows uses it - but on Linux we should only be using MMC profile
for Intel systems.

Add a check to prevent it being enabled incorrectly.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index e6cb4a14cdd4..be194be43663 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10548,6 +10548,11 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 				dytc_mmc_get_available = true;
 		}
 	} else if (output & BIT(DYTC_FC_PSC)) { /* PSC MODE */
+		/* Support for this only works on AMD platforms */
+		if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD) {
+			dbg_printk(TPACPI_DBG_INIT, "PSC not support on Intel platforms\n");
+			return -ENODEV;
+		}
 		dytc_profile_available = DYTC_FUNCMODE_PSC;
 	} else {
 		dbg_printk(TPACPI_DBG_INIT, "No DYTC support available\n");
-- 
2.35.1

