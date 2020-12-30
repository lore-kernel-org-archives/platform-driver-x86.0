Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952E5C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Dec 2020 02:53:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A8F2207CC
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Dec 2020 02:53:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgL3CxT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Dec 2020 21:53:19 -0500
Received: from mail1.bemta23.messagelabs.com ([67.219.246.115]:42883 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726190AbgL3CxT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Dec 2020 21:53:19 -0500
Received: from [100.112.5.40] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-c.us-east-1.aws.symcld.net id 2A/5F-56876-85AEBEF5; Wed, 30 Dec 2020 02:47:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsWSLveKTTf81et
  4g6fTjC3eHJ/OZPG5YzKLxeo9L5gdmD3mnQz0eL/vKpvH501yAcxRrJl5SfkVCawZTx9tYinY
  xllx69dD9gbGRo4uRi4OIYH/jBJHPjcxQTivgZzJ84AcTg42AW2JLVt+sXUxcnCICMhIfFjrC
  RJmFoiWaH57hRXEFhbwl/j4+RYbiM0ioCrx6PQpRhCbV8BKYsLWx2BjJATkJZ72LmcGsTmBas
  50PWYBsYUEVCTuP1jCBlEvKHFy5hMWiPnyEs1bZzND2BISB1+8YIab8/QC1MwEiWUv7zBPYBS
  YhaR9FpL2WUjaFzAyr2I0TSrKTM8oyU3MzNE1NDDQNTQ00jXRNTbRS6zSTdYrLdZNTSwu0TXU
  Sywv1iuuzE3OSdHLSy3ZxAgM7pQCFqUdjM1vPugdYpTkYFIS5T1//nW8EF9SfkplRmJxRnxRa
  U5q8SFGGQ4OJQlewZdAOcGi1PTUirTMHGCkwaQlOHiURHj7QdK8xQWJucWZ6RCpU4yKUuK8y1
  4AJQRAEhmleXBtsOi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYNxlkPE9mXgnc9FdAi5m
  AFjPmgC0uSURISTUw8VcL8MTcvlFlP3mi3wKVqIxAzdVvKjt836ZcUZoS7NnzpWv3oTuJFov2
  BXYtO/97YcOecB0z++JHzRsq+Pk+ilz2dizIMm1M/vd00er17906VoYtaFwWt1knmPNW+CnHk
  mtvX1msyMv6xP30jtXNvWe+cklfC91nn/NV5fanjTdmb5e4dOGP2p2EoLMF3ZLhz8ykMxXkVF
  xj1sy3eP4punrH5YzdpuxvDlRNPWO1b5nfdA4p5keMkw/VzmXekpxZlebxVlBx60Xmf5eveSd
  GLQ5trHG/3mt+h8u8S6Dtsc1vse9xp9OLOg/Yn73k33Wm0Wyz5U+lqQ/WSb6w9bcqdH8l2/RL
  ySJIk9HpfvIUJZbijERDLeai4kQAOsPLi2kDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-18.tower-416.messagelabs.com!1609296469!735642!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23723 invoked from network); 30 Dec 2020 02:47:51 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-18.tower-416.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 Dec 2020 02:47:51 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id A9C7768F0218EF3AA706;
        Wed, 30 Dec 2020 10:47:48 +0800 (CST)
Received: from localhost.localdomain.com (10.64.81.85) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2044.4; Tue, 29 Dec 2020 18:47:45 -0800
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86: thinkpad_acpi: correct palmsensor error checking
Date:   Tue, 29 Dec 2020 21:47:26 -0500
Message-ID: <20201230024726.7861-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.81.85]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The previous commit adding functionality for the palm sensor had a
mistake which meant the error conditions on initialisation was not checked
correctly. On some older platforms this meant that if the sensor wasn't
available an error would be returned and the driver would fail to load.

This commit corrects the error condition. Many thanks to Mario Oenning
for reporting and determining the issue

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index e03df2881dc6..c102657b3eb3 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9951,9 +9951,9 @@ static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
 	if ((palm_err == -ENODEV) && (lap_err == -ENODEV))
 		return 0;
 	/* Otherwise, if there was an error return it */
-	if (palm_err && (palm_err != ENODEV))
+	if (palm_err && (palm_err != -ENODEV))
 		return palm_err;
-	if (lap_err && (lap_err != ENODEV))
+	if (lap_err && (lap_err != -ENODEV))
 		return lap_err;
 
 	if (has_palmsensor) {
-- 
2.28.0

