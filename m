Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9A0C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 18:15:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237194AbiF0SPu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Jun 2022 14:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234890AbiF0SPt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 14:15:49 -0400
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9168DF65
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 11:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1656353747; i=@lenovo.com;
        bh=iY0P218GQA+f5bUtihLfWT/n4A441GshcZ+RBke8sB4=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=FVsnnm7tKMiwvrWrmMfgNbpdl/BHLt+Vf4yYgDNwrL+IHlmXan6ilx81G73OQNSYh
         Rjn6DvicBNWQTG3H8dXXyMdAUXoO0/Rr1PgrdZV8CW8T0f+LIYz69dLBNzQVrVeGDo
         GWT8lhz2BmOsb6c9r3+kMJf3Sy4pwSZlO2Nvi6lAPR/hZtLZVrxm0JMzlkQnTcocoF
         saM3zwRV90TLkENzQxl0YZLHob+sYSI/AzbDrS1YAEPAg1KboDCAMPH4Uz4/g16vO5
         AT8Z3p4SIC60Ozdlnwl4Gb9ycIqTR2H/Q0DiHqQfi8PunO+hKGFj24UDWX1dJY0WbM
         LWg7EX3b55DRA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRWlGSWpSXmKPExsWSoS9lqHvp884
  kg74VphZvjk9nsjgwdRqzxeo9L5gdmD02repk83i/7yqbx+dNcgHMUayZeUn5FQmsGQ0NO5gL
  dnFWvF/Ywd7A2MLRxcjFwSiwlFli+uGT7BDOIlaJd80XWSCcTiaJRd0z2UAcIYG5TBJT798Dy
  nACOQeZJCbOcQKxJQSOM0p0r3KHKOpklNi99QdUxyQmiYtP50N1PGGU+H/DBCLxklHi6ObLjC
  AJNgFtiS1bfgF1cHCICMhIfFjrCRJmFoiUuProOxOILSwQLtF0ejnYHBYBVYn/LU+YQWxeASu
  Jjt6d7BBXyEtsmN8LFucEqjnT9Rhqr4rE/QdL2CDqBSVOznzCAjFfXqJ562xmCFtC4uCLF8wQ
  9coSv/rPM0PMVJA4urMDyk6Q6Pn3iA3ClpS4dvMC1F5ZiaNn57BA2L4Sy35/ZQR5RUJAV2LjT
  GWIsJzEqd5zTDBn7tx4G6pcRmLingssExi1ZyG5bhaS62YhuW4BI/MqRqukosz0jJLcxMwcXU
  MDA11DQxNdSwtdCzO9xCrdRL3SYt3y1OISXSO9xPJivdTiYr3iytzknBS9vNSSTYzAhJNSlBS
  2g3F5/0+9Q4ySHExKorzXtu9MEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBe/M9UE6wKDU9tSIt
  MweY/GDSEhw8SiK86m+A0rzFBYm5xZnpEKlTjJYcV7bt3cvM8eDESSB5bf2CfcxCLHn5ealS4
  rx7PgE1CIA0ZJTmwY2DJehLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5b4BM4cnMK4Hb+g
  roICagg/wm7gA5qCQRISXVwKR9qKX8+7bITIZ1fnrzf7fK+PDzvBZrviT0gamzYZ92HceMeZx
  M0/dLXRNp29vizWmVsvzVo3npXhxq+i8zxY6+9xVg8ND+sz3Ypi7t2ko+my4/lqR5uQwr7QpV
  1ayDXUMen7JWkTq7tEfig5fcQptIBWaVJ+tW31ny9uO/rf0+G29Ouc7H6x9cyCm36d6FFRvS0
  7Z//PrpiQ9/Z7P9jOot2XNuLXHR8n639Upch9irhesfHp94p+Lcm6XpzEf9PRL/1ZyesHxS9f
  ZznA3K05Mf6LlY+UZl3Av8dehYTUZG3/W70wPL1rVbtt8+sEDp8qWVD1xSWO/92b2ic57qnhK
  dL2c9pkw5dPhDesqT5XpKLMUZiYZazEXFiQCEVXFxSwQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-13.tower-655.messagelabs.com!1656353745!19344!1
X-Originating-IP: [104.47.26.49]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13551 invoked from network); 27 Jun 2022 18:15:46 -0000
Received: from mail-psaapc01lp2049.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.49)
  by server-13.tower-655.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Jun 2022 18:15:46 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LC3wN6OoJbK/iQO2iNWors4XTMEIPidKUbjp0W7Sblxmfis/COTU2t3vM/Rzt12Wtd1INr7Qxp+tR5pZnWonxgGqltTzPcnjBxgXsnM/1iK6PUSXw7hPVQPyxluNqhudcm2sHQDILT0Uu7KhTnvN24tSQbty8VgpXN9PyU843JThAcD8SS+5NOWPp4Ubn6ucAOugBuEWuAY9ISQyQPMpCiy5tGRQyd6+JxcbN3uYw9L9r4OqYQd9lH86yqgB7xgTUpg6lbzpP/QPh9sYztRr7VZgag8PtExvcFng4kN4jUREzKkbTf6XUplJZfPy2NBBR7bxtZodUVzxsiFI2oo+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iY0P218GQA+f5bUtihLfWT/n4A441GshcZ+RBke8sB4=;
 b=krXF19QEelETEUxG8P34LHxObViEje13ySPvb5CsFARa7GfXA2esb9FYREXTnC5aXcOExSvc3lqJKpWPENOg5VSyFp4HCC1KNU8wTI7+52ikkHlT09HJl0UFK2Amxxpv2AHbaETr3HgJpH8afM2h4zmXPDSS1sZpE3yAHTxwKLSuncff96UI2tNpc3sfv2WRN4qslsT6h79+WeBG2sHINB53tWVvD5o8ffXMoala91wOzzi/kvgRJSeSES21DkYzHE2yqOMl54G5MMINt3xRekq0id20cjD7xSMp/W4vCtS64aJbJflBWz/5oW/XTNXVTRqWIcw7X7k0TKrc+vaV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from TYCPR01CA0089.jpnprd01.prod.outlook.com (2603:1096:405:3::29)
 by PSAPR03MB5318.apcprd03.prod.outlook.com (2603:1096:301:20::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.11; Mon, 27 Jun
 2022 18:15:44 +0000
Received: from TYZAPC01FT037.eop-APC01.prod.protection.outlook.com
 (2603:1096:405:3:cafe::e3) by TYCPR01CA0089.outlook.office365.com
 (2603:1096:405:3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Mon, 27 Jun 2022 18:15:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 TYZAPC01FT037.mail.protection.outlook.com (10.118.152.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Mon, 27 Jun 2022 18:15:44 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Mon, 27 Jun
 2022 14:15:42 -0400
Received: from localhost.localdomain (10.46.48.229) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Mon, 27 Jun
 2022 14:15:40 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v2] platform/x86: thinkpad_acpi: do not use PSC mode on Intel platforms
Date:   Mon, 27 Jun 2022 14:14:49 -0400
Message-ID: <20220627181449.3537-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.46.48.229]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 647fe6c1-6f1d-4d4c-f914-08da58690d4e
X-MS-TrafficTypeDiagnostic: PSAPR03MB5318:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wxSblIDE1kEGjkdX9TbuAtR98n2SiYadBmYxr7Wv2kRpx6+CcmKPg3TZQx/l15+85pm4Bmdje1XwtbJRINJxC7ausOW3Z7hm07YJ9R/wSwltow43G8k3Py53jHtWemT6a/SA2VcaTJFvSAN0sTMK7/HN2Dli0+swAZoKp17Xqs7jZSiNxwXxi3QeNsxfDVNCWSEf5zHKZBP5xhQZV8tEe8n9MOqP6qMHgYyd12qNvNnJlSS5FyGE/GoLkFndazn+zI9bnvgo6Uh9CqEWBtpM8gRimwUFrr5cHYmZo6hrfRYOMgHZQiZ8gCZ0E8xV4hUQhTMxENLbuBo5z33u2cLH9EJI3c9GztuQ+5r4aSb7XCBFDU8K9wqGbuVHpx1pOXsnQl86E9i5R92VA/Wj+zkrWr1LeMMoOWj1Hats79uGr8AF6f8bUUaZQdgVSDZoVaXGDvRtttC+NlZepvJ6fBW2hNd09pw7VJolr2XkwovuxqTPsE8+8VtoLvUWQH2bY845wc1uD7kNAKmx81BMAwiYSl2GNJsCPuEhZEj/4jbPc3v909aMLkt62WjAh39CPMis9TFjU4E8bpKxi7CQpBpo/wa0R1+hZHfZUwcrbhhw1bjSKuUSr0UgZmJr+4A5R40DWFRcrV9TXuVxMU5OmGBgXYalVnR5im0R7VLkvn8YNP0/z9srvm9C7TpcqXnQIt7Z3KfO2pfFCa6cfSZb6l03TfM+XusxC0br2PtS4yhD38+uh1pKdOqHryOLndvYcqQpYFZGBLxqDUeC7WjIWmbi6qyZ74BkYj+pbkIX1hjies03nEDqWnQ1OUJ3mPdppoNAoRgF/46asvU2PgyhDknhA7ym4GJjyF9AkgQmIASks2167q/uXS07cTtROQB/aJH+
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(39860400002)(36840700001)(46966006)(40470700004)(40480700001)(54906003)(2616005)(82310400005)(186003)(478600001)(36756003)(1076003)(356005)(82960400001)(16526019)(40460700003)(82740400003)(316002)(81166007)(37006003)(36860700001)(2906002)(41300700001)(36906005)(5660300002)(6862004)(336012)(8936002)(7049001)(6200100001)(86362001)(426003)(47076005)(8676002)(70206006)(70586007)(26005)(4326008)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 18:15:44.0531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 647fe6c1-6f1d-4d4c-f914-08da58690d4e
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: TYZAPC01FT037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5318
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
Changes in v2: rebased on for-next stream

 drivers/platform/x86/thinkpad_acpi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 17d503e65a54..09047ca14b43 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10565,6 +10565,11 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 				dytc_mmc_get_available = true;
 		}
 	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) { /* PSC MODE */
+		/* Support for this only works on AMD platforms */
+		if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD) {
+			dbg_printk(TPACPI_DBG_INIT, "PSC not support on Intel platforms\n");
+			return -ENODEV;
+		}
 		pr_debug("PSC is supported\n");
 	} else {
 		dbg_printk(TPACPI_DBG_INIT, "No DYTC support available\n");
-- 
2.36.1

