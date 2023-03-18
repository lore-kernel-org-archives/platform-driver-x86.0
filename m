Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D91C74A5B
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Mar 2023 09:20:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjCRJUK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 05:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjCRJUJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 05:20:09 -0400
X-Greylist: delayed 303 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 18 Mar 2023 02:20:06 PDT
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 56C299033
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 02:20:05 -0700 (PDT)
IronPort-SDR: 64158116_vB3dCd+U+FsOfZMdMn4YzTN3NOUvmm1iiWZs3S5N6pVPV0C
 sIASUsHgluicULR2Q9NdDmgdbBLLXIzH0L552IA==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AIAwBugBVkjPQc8jxagRKBRoIugk+zWIF+DwEPAQFEB?=
 =?us-ascii?q?AEBhQWFNyY2Bw4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEFAEBAQFAR?=
 =?us-ascii?q?YVoDYZYNgENAQE3AYE9E4J+gl22H4EBgggBAQaCYppogV4JgUCLboRMgTw/g?=
 =?us-ascii?q?U6CUYIsiwOZEAqBNHWBIA5Kc4EEAgkCEWuBEghngX1BAg1lCw52gUsCghIDC?=
 =?us-ascii?q?QMHBUlAAwsYDRY6Eyw1FCFebC0SEgUDCxUqRwQIOQZQEQIIDxIPLEMOQjc0E?=
 =?us-ascii?q?wZcASkLDhEDT0IZbASCCQoHJiSdDYEOgmnDZ4QEgVmfE0yBRqd4AZdqo0WEL?=
 =?us-ascii?q?AIKBxaBaQqCBE0fGYMiTwMZD445ghORU2E7AgcLAQEDCYtDAQE?=
IronPort-PHdr: A9a23:yovBcBey2LWGXqmUaDNYPfrplGM/hYqcDmcuAtIPgbNSaeKo5Z39M
 kvF6bNgiUKPXImd4u8Xw+PMuPXmXmoNqY2ErGhEapFJUAMIzMQOygIsDJTXVkTyIKzmM3NqT
 p0QBlRvpinpOkMNR67D
IronPort-Data: A9a23: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
 T3GxkDNAw==
IronPort-HdrOrdr: A9a23:3XpedqgxsN72C3CT+/Fz4YeAsHBQXvQji2hC6mlwRA09TyX5ra
 qTdTogtCMc7wxhP03J+7i7VZVoJEmxyXcb2/hzAV7PZmbbUQiTXeVfBPXZsl/d8kTFn4Y36U
 4KSchD4bPLY2STAqvBkW+F+q4bsby6GbiT9J3jJmlWPHpXgn5bnn5E4tfyKDwPeDV7
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 18 Mar 2023 19:45:02 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 32I9Ek9j3006155
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 18 Mar 2023 20:14:56 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 32I9Ek9j3006155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1679130896; bh=k80t+vfF7Ky5vf3UlMnjgHOplKsUD5JnUJH4QPVj+Ac=;
        h=From:To:Cc:Subject:Date:From;
        b=ZGRTfnqOMNEXWTnP3RPikAnCZiYb4l/d5imRQjTlMW4VH6JDfY4bxG6z72Iz2FepE
         sTfxxIFUmsTyjjZiTVPGRuMGkWhdN8rKBW9sjV1P+VYODa9GIDkTP4kYol0K8E+9YG
         Tf0Wh/ybiCAPA9sL9eUucpGOcs1xk528toR7jNYec+W/gmH1WDKDHOFm98Sy3vb6b7
         OE8W9spTlVB5m7CnWesf9ZIakUyG/ALdmqkZTB50xYBQxlGLeW/BITX4NvPn8WuMiF
         hs8Lvpyx6xzkysdL2RHABaoNEDtdOTnRtVtQrJVvfgLZBv3wYKAg4THyiDlXKcc1MZ
         j/f/ZKJsCihqg==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@weissschuh.net>
Cc:     platform-driver-x86@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH] platform/x86 (gigabyte-wmi): Add support for A320M-S2H V2
Date:   Sat, 18 Mar 2023 20:14:41 +1100
Message-Id: <20230318091441.1240921-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 18 Mar 2023 20:14:56 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for A320M-S2H V2.  Tested using module force_load option.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/platform/x86/gigabyte-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
index 322cfaeda17b..4dd39ab6ecfa 100644
--- a/drivers/platform/x86/gigabyte-wmi.c
+++ b/drivers/platform/x86/gigabyte-wmi.c
@@ -140,6 +140,7 @@ static u8 gigabyte_wmi_detect_sensor_usability(struct wmi_device *wdev)
 	}}
 
 static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
+	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("A320M-S2H V2-CF"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M DS3H-CF"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M DS3H WIFI-CF"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M S2H V2"),
-- 
2.39.2

