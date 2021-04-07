Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074BEC433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 21:20:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3B2A61175
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 21:20:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbhDGVU7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 17:20:59 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.1]:51719 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232271AbhDGVU6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 17:20:58 -0400
Received: from [100.112.3.19] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.us-east-1.aws.symcld.net id 4D/D0-44756-0322E606; Wed, 07 Apr 2021 21:20:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsWSLveKXVdfKS/
  B4Ox2WYs3x6czWXzumMxisXrPC2YHZo95JwM93u+7yubxeZNcAHMUa2ZeUn5FAmvG8+fbGQua
  pCpen7rF2MB4UaSLkYtDSOA/o8Syqz1sXYycQM5rRombXVIgNpuAtsSWLb+A4hwcIgIyEh/We
  oKEmQWiJZrfXmEFsYUF/CU2nG4Bs1kEVCRO334BZvMK2Ei0fH0DZksIyEu0XZ/OCGJzCqhKnO
  l6zAKxSkXi/oMlbBD1ghInZz5hgZgvL9G8dTYzhC0hcfDFC2aIOQoSZw+9h5qZINHz7xHbBEa
  BWUjaZyFpn4WkfQEj8ypG06SizPSMktzEzBxdQwMDXUNDI10QqZdYpZukV1qsm5pYXKIL5JYX
  6xVX5ibnpOjlpZZsYgSGdkoBA/cOxq1vPugdYpTkYFIS5bV7kpsgxJeUn1KZkVicEV9UmpNaf
  IhRhoNDSYI3TiEvQUiwKDU9tSItMwcYZzBpCQ4eJRHe+dJAad7igsTc4sx0iNQpRkUpcV5xRa
  CEAEgiozQPrg0W25cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfPKgkzhycwrgZv+CmgxE9D
  ikoO5IItLEhFSUg1MTaybWgIsK49NlTucN33Opq9m+lODSo51nv8pYMb68Ez4VnHvFYbzvgic
  uDhRZ92u4BkmKjs0735ct/GKwcW9h+aLFXDd33/rWvPT1gZ+n4xt83ty/79/3rx5yn6NMznm6
  5OqBavvzWHv+tk10evoS+YVejP9XaVXic2ZYGZ87d58XztGr49PXy4U36M7c7+U0IeOywvqS3
  tkHzLYRtouC+H6ZeEbk8js0sNkyHaFrdLScveBzKmPwvqbJB7dnvG7YeaTyMLmf/eNgo0uZ80
  OvT+j8+HOdQZyJSdMu6KarL5N7Fw0563WDIaWDnfVTMHGA/LlDoICJdn5d2WSpk35dbrLteFp
  b7nls4x5Dy19lFiKMxINtZiLihMBbHyZUGgDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-21.tower-386.messagelabs.com!1617830443!216208!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8911 invoked from network); 7 Apr 2021 21:20:46 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-21.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Apr 2021 21:20:46 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 05B40824DB22CDD84B32;
        Thu,  8 Apr 2021 05:20:41 +0800 (CST)
Received: from localhost.localdomain.com (10.46.192.12) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 7 Apr 2021 17:20:40 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86: thinkpad_acpi: Correct thermal sensor allocation
Date:   Wed, 7 Apr 2021 17:20:15 -0400
Message-ID: <20210407212015.298222-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.46.192.12]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On recent Thinkpad platforms it was reported that temp sensor 11 was
always incorrectly displaying 66C. It turns out the reason for this is
that this location in EC RAM is not a temperature sensor but is the
power supply ID (offset 0xC2).

Based on feedback from the Lenovo firmware team the EC RAM version can
be determined and for the current version (3) only the 0x78 to 0x7F
range is used for temp sensors. I don't have any details for earlier
versions so I have left the implementation unaltered there.

Note - in this block only 0x78 and 0x79 are officially designated (CPU &
GPU sensors). The use of the other locations in the block will vary from
platform to platform; but the existing logic to detect a sensor presence
holds.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 31 ++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 07de21941..8fbe4d3d9 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6260,6 +6260,7 @@ enum thermal_access_mode {
 enum { /* TPACPI_THERMAL_TPEC_* */
 	TP_EC_THERMAL_TMP0 = 0x78,	/* ACPI EC regs TMP 0..7 */
 	TP_EC_THERMAL_TMP8 = 0xC0,	/* ACPI EC regs TMP 8..15 */
+	TP_EC_FUNCREV      = 0xEF,      /* ACPI EC Functional revision */
 	TP_EC_THERMAL_TMP_NA = -128,	/* ACPI EC sensor not available */
 
 	TPACPI_THERMAL_SENSOR_NA = -128000, /* Sensor not available */
@@ -6458,7 +6459,7 @@ static const struct attribute_group thermal_temp_input8_group = {
 
 static int __init thermal_init(struct ibm_init_struct *iibm)
 {
-	u8 t, ta1, ta2;
+	u8 t, ta1, ta2, ver;
 	int i;
 	int acpi_tmp7;
 	int res;
@@ -6473,7 +6474,14 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
 		 * 0x78-0x7F, 0xC0-0xC7.  Registers return 0x00 for
 		 * non-implemented, thermal sensors return 0x80 when
 		 * not available
+		 * The above rule is unfortunately flawed. This has been seen with
+		 * 0xC2 (power supply ID) causing thermal control problems.
+		 * The EC version can be determined by offset 0xEF and at least for
+		 * version 3 the Lenovo firmware team confirmed that registers 0xC0-0xC7
+		 * are not thermal registers.
 		 */
+		if (!acpi_ec_read(TP_EC_FUNCREV, &ver))
+			pr_warn("Thinkpad ACPI EC unable to access EC version\n");
 
 		ta1 = ta2 = 0;
 		for (i = 0; i < 8; i++) {
@@ -6483,11 +6491,13 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
 				ta1 = 0;
 				break;
 			}
-			if (acpi_ec_read(TP_EC_THERMAL_TMP8 + i, &t)) {
-				ta2 |= t;
-			} else {
-				ta1 = 0;
-				break;
+			if (ver < 3) {
+				if (acpi_ec_read(TP_EC_THERMAL_TMP8 + i, &t)) {
+					ta2 |= t;
+				} else {
+					ta1 = 0;
+					break;
+				}
 			}
 		}
 		if (ta1 == 0) {
@@ -6500,9 +6510,12 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
 				thermal_read_mode = TPACPI_THERMAL_NONE;
 			}
 		} else {
-			thermal_read_mode =
-			    (ta2 != 0) ?
-			    TPACPI_THERMAL_TPEC_16 : TPACPI_THERMAL_TPEC_8;
+			if (ver >= 3)
+				thermal_read_mode = TPACPI_THERMAL_TPEC_8;
+			else
+				thermal_read_mode =
+					(ta2 != 0) ?
+					TPACPI_THERMAL_TPEC_16 : TPACPI_THERMAL_TPEC_8;
 		}
 	} else if (acpi_tmp7) {
 		if (tpacpi_is_ibm() &&
-- 
2.30.2

