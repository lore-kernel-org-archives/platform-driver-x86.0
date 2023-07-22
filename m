Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2355FC001B0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 22 Jul 2023 17:46:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjGVRqd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 22 Jul 2023 13:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbjGVRqb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 22 Jul 2023 13:46:31 -0400
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F39270B
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Jul 2023 10:46:30 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1690047989; x=1690055189; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Subject: Cc: To: To:
 From: From: Sender: Sender; bh=KTX5c2W9IC0se4k6UfvNshruBo0qc1MufVYnBdWH05Q=;
 b=H9QyQor4vUVnn83kEZuTmIONUPixaPnsxjPzHpADBEAlNk7kKOy+tYl6kCKpEupsKrMyNPTjw8BgSLlxD6ocvS1jb216L4xhL2pMQBuzgKMo1yWb2WjHdQcQ6/y0XvrwS5Gh6AL5pNIDjqFyZKGk9tQ6JC5ELK/aKOV4La0WghWBxTvfpTnhepBJX3leGh1OIguMMkfkHV7mXFwcMQB4IutWE7xaO1W6HhsFccsX8nkD95IcfBAK8nFHusoE30j9SsHVP8N0cF7PZdOzRHUtD3/AlDe6jX5t8hYSAx6kl+HALYhhcwC/YKzKo0FlOiNTK0wpMX+UpTKyvhvYUbtG1w==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyI0MzAwNyIsInBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnIiwiOTNkNWFiIl0=
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 34081948f2f3 with SMTP id
 64bc11259b55128dd86df00b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 22 Jul 2023 17:25:57 GMT
Sender: james@equiv.tech
From:   James Seo <james@equiv.tech>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     James Seo <james@equiv.tech>, linux-hwmon@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: hp-wmi-sensors: Get WMI instance count from WMI driver core
Date:   Sat, 22 Jul 2023 10:25:13 -0700
Message-Id: <20230722172513.9324-2-james@equiv.tech>
In-Reply-To: <20230722172513.9324-1-james@equiv.tech>
References: <20230722172513.9324-1-james@equiv.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

2a2b13ae50cf ("platform/x86: wmi: Allow retrieving the number of WMI
object instances") means we no longer need to find this ourselves.

Signed-off-by: James Seo <james@equiv.tech>
---
 drivers/hwmon/hp-wmi-sensors.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
index ebe2fb513480..3a99cc5f44b2 100644
--- a/drivers/hwmon/hp-wmi-sensors.c
+++ b/drivers/hwmon/hp-wmi-sensors.c
@@ -435,25 +435,11 @@ static union acpi_object *hp_wmi_get_wobj(const char *guid, u8 instance)
 /* hp_wmi_wobj_instance_count - find count of WMI object instances */
 static u8 hp_wmi_wobj_instance_count(const char *guid)
 {
-	u8 hi = HP_WMI_MAX_INSTANCES;
-	union acpi_object *wobj;
-	u8 lo = 0;
-	u8 mid;
-
-	while (lo < hi) {
-		mid = (lo + hi) / 2;
-
-		wobj = hp_wmi_get_wobj(guid, mid);
-		if (!wobj) {
-			hi = mid;
-			continue;
-		}
+	int count;
 
-		lo = mid + 1;
-		kfree(wobj);
-	}
+	count = wmi_instance_count(guid);
 
-	return lo;
+	return clamp(count, 0, (int)HP_WMI_MAX_INSTANCES);
 }
 
 static int check_wobj(const union acpi_object *wobj,
-- 
2.39.2

