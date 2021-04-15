Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42F3C433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 07:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B393F6113B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 07:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbhDOH5D (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Apr 2021 03:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbhDOH5D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Apr 2021 03:57:03 -0400
X-Greylist: delayed 476 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Apr 2021 00:56:40 PDT
Received: from discovery.labus-online.de (discovery.labus-online.de [IPv6:2a01:4f8:231:4262::1001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8584C061574
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Apr 2021 00:56:40 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by discovery.labus-online.de (Postfix) with ESMTP id EAC26112000A;
        Thu, 15 Apr 2021 09:48:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=labus-online.de;
        s=modoboa; t=1618472905;
        bh=B++6G+9wNUvCubJO/1LnhjojJKOvSNuGSCGCNXw6qEY=;
        h=From:To:Cc:Subject:Date:From;
        b=GmvhLtcA0JbARpmJ51tWD+IZ9L32PK85r9SvjIgZd3YY7QU71cfDpd73iDrgxpCSK
         v91PbumOG1ar3fgM1y0yqF8EYSkY+Go2M2pfd3xMY9DKzBrh1vfNyj1pZ8Hy9/qVdF
         yBrt4lp91whd5wgakEizbLoJs74D35o6zGcUo0PeEqlmS1IrxJYtQwF4aRezg3r9df
         hYSktKxkgsIYdYKseF//h7o/FLT4oZMRCyWqomwxQgXYS0a8U/geN1tpZbRwnWJG4l
         gU1Wt8uskuN064jSh5QIwPi3z53QsvC6zz0PbWo5rdf3/Nm52nV4wbzfZNbfOFDIC4
         PQkic5KoRTKAg==
X-Virus-Scanned: Debian amavisd-new at discovery.labus-online.de
Received: from discovery.labus-online.de ([127.0.0.1])
        by localhost (mail.labus-online.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uo_4-qIXu-_P; Thu, 15 Apr 2021 09:48:09 +0200 (CEST)
Received: from supernova.fritz.box (unknown [IPv6:2a02:908:1966:3a60:b62e:99ff:fe91:d1a9])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
        (No client certificate requested)
        by discovery.labus-online.de (Postfix) with ESMTPSA;
        Thu, 15 Apr 2021 09:48:08 +0200 (CEST)
From:   Julian Labus <julian@labus-online.de>
To:     platform-driver-x86@vger.kernel.org
Cc:     Julian Labus <julian@labus-online.de>
Subject: [PATCH] platform/x86: gigabyte-wmi: add X570 AORUS ELITE
Date:   Thu, 15 Apr 2021 09:45:26 +0200
Message-Id: <20210415074526.1782-1-julian@labus-online.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add the X570 AORUS ELITE to gigabyte_wmi_known_working_platforms

Signed-off-by: Julian Labus <julian@labus-online.de>
---

I read on phoronix.com that a driver for Gigabyte WMI will be added.
I gave it a try on my Gigabyte X570 AORUS ELITE with force_load=1 and
it seem to work fine. lm_sensors shows 6 sensors with reasonable values.

gigabyte_wmi-virtual-0
Adapter: Virtual device
temp1:        +26.0°C  
temp2:        +30.0°C  
temp3:        +27.0°C  
temp4:        +34.0°C  
temp5:        +29.0°C  
temp6:        +43.0°C  

The patch was created against the for-next branch of platform-drivers-x86.git

 drivers/platform/x86/gigabyte-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
index bb1b0b205fa7..e127a2077bbc 100644
--- a/drivers/platform/x86/gigabyte-wmi.c
+++ b/drivers/platform/x86/gigabyte-wmi.c
@@ -146,6 +146,10 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
 		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
 		DMI_EXACT_MATCH(DMI_BOARD_NAME, "Z390 I AORUS PRO WIFI-CF"),
 	}},
+	{ .matches = {
+		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
+		DMI_EXACT_MATCH(DMI_BOARD_NAME, "X570 AORUS ELITE"),
+	}},
 	{ .matches = {
 		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
 		DMI_EXACT_MATCH(DMI_BOARD_NAME, "X570 I AORUS PRO WIFI"),
-- 
2.31.1

