Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0319DC001B0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 22 Jul 2023 17:36:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjGVRgs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 22 Jul 2023 13:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbjGVRgo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 22 Jul 2023 13:36:44 -0400
X-Greylist: delayed 656 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 22 Jul 2023 10:36:41 PDT
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4E12690
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Jul 2023 10:36:40 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1690047399; x=1690054599; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Subject: Cc: To: To:
 From: From: Sender: Sender; bh=gBGdbi7zMsDc4jLtV1jMwsUxbQ0E089NfPCcUt+Wu1E=;
 b=eRTbJ/S1WfiLQ/OUrYTy2eyxCf4ic8Sg3R/0VKgofdT6tb+W8se3mBHo9dJx7EfcrQc3Ryg294N3ZNFqXt8a6dNW+0Wt2Vi09yZbfAwgk1OPnXADvKfbbH0iaQbm0EIv6WcwLxcg2oBc/HBNdQKlLkj5VFDKRJRb4QqqLSyLvw3Mg47e0D8SKOH+rkOxqx9nSdzOQd2pkpr42dnOP2XwvS71O+q8q/ZUzK8EqOhWPadc/ejHIWjRtwmI/efcBUnLBqM3NcYjdexZhcQHh1NlQgiMt88+28cquMCscJLMb0zqT4x5Za1Cd5vkXxY/jwN3yg7qUgQE1LNQZBVMdDs3Bg==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyI0MzAwNyIsInBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnIiwiOTNkNWFiIl0=
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 1b08b7c1fb5c with SMTP id
 64bc11319b55128dd86e2555 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 22 Jul 2023 17:26:09 GMT
Sender: james@equiv.tech
From:   James Seo <james@equiv.tech>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     James Seo <james@equiv.tech>, linux-hwmon@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] docs: hwmon: hp-wmi-sensors: Change document title
Date:   Sat, 22 Jul 2023 10:25:14 -0700
Message-Id: <20230722172513.9324-3-james@equiv.tech>
In-Reply-To: <20230722172513.9324-1-james@equiv.tech>
References: <20230722172513.9324-1-james@equiv.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Change title to "Kernel driver hp-wmi-sensors" for consistency with
most of the rest of Documentation/hwmon.
---
 Documentation/hwmon/hp-wmi-sensors.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/hp-wmi-sensors.rst b/Documentation/hwmon/hp-wmi-sensors.rst
index a6bca9aecdde..a611c6263074 100644
--- a/Documentation/hwmon/hp-wmi-sensors.rst
+++ b/Documentation/hwmon/hp-wmi-sensors.rst
@@ -2,9 +2,9 @@
 
 .. include:: <isonum.txt>
 
-===========================
-Linux HP WMI Sensors Driver
-===========================
+============================
+Kernel driver hp-wmi-sensors
+============================
 
 :Copyright: |copy| 2023 James Seo <james@equiv.tech>
 
-- 
2.39.2

