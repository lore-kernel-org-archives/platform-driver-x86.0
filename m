Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049ECC678D6
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Jan 2023 23:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjAMXMH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 13 Jan 2023 18:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231395AbjAMXL6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Jan 2023 18:11:58 -0500
Received: from mail.redfish-solutions.com (mail.redfish-solutions.com [24.116.100.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D11313CE4;
        Fri, 13 Jan 2023 15:11:54 -0800 (PST)
Received: from ubuntu22.redfish-solutions.com (ubuntu22.redfish-solutions.com [192.168.8.33])
        (authenticated bits=0)
        by mail.redfish-solutions.com (8.17.1/8.16.1) with ESMTPSA id 30DNBdTT669440
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Fri, 13 Jan 2023 16:11:39 -0700
From:   "Philip Prindeville" <philipp@redfish-solutions.com>
To:     platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org
Cc:     Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>,
        Philip Prindeville <philipp@redfish-solutions.com>
Subject: [PATCH v4 0/2] Expand APU2 driver to 3/4/5/6 models
Date:   Fri, 13 Jan 2023 16:11:39 -0700
Message-Id: <20230113231139.436943-1-philipp@redfish-solutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.2 on 192.168.8.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Philip Prindeville <philipp@redfish-solutions.com>

Extend PCEngines APU2 driver to derivative models APU3, 4, 5
and 6.

Of the five, the APU5 is the most dissimilar.  The APU2 is not
derivative of the APU1, and we call that out in the leds-apu
driver.  We also clarify the expanded compatibility of the
pcengines-apuv2 driver in the Kconfig menu.

We correct some line labeling for GPIO lines 4-6, and we add
appropriate definitions to the GPIO lines for the APU5 which
is mapped out differently.

The majority of the work was done by Ed Wildgoose.  Philip
Prindeville took over the effort to upstream the fixes and
made some minor cleanup.

Philip Prindeville (2):
  x86: Support APU5 & APU6 in PCEngines platform driver
  x86: Further PCEngines APU4/5/6 cleanup

 drivers/leds/leds-apu.c                |   2 +-
 drivers/platform/x86/Kconfig           |   4 +-
 drivers/platform/x86/pcengines-apuv2.c | 118 ++++++++++++++++++++++---
 3 files changed, 107 insertions(+), 17 deletions(-)

-- 
2.34.1

