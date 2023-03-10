Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CC4C6FA99
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 12:31:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjCJMbV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Mar 2023 07:31:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjCJMbT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2023 07:31:19 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C47810A29A;
        Fri, 10 Mar 2023 04:31:18 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso3337326wmo.0;
        Fri, 10 Mar 2023 04:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678451477;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=luzXNHAhAe8Yhdg3tb56C4zTrY7DU3hQHfSExYhU4qg=;
        b=ccr0N5tbxPM3LDVBnowbqqw6kxCGVU8KvLGs+UWh6CHiDphc14Y0wukelQZB22B1Yu
         fVpYPi9zV+c84ZzGiXXJK0q8G6vPccIGgAV0oWbJoV1HNkfaOgc8KeU1JERxosNjUhP9
         26BZq2PMDGNOXjxIXi2XFHe8O1rvs9C2Pnjr+2E/w9H+GHlBN2sdECbIdXXlN3wI+K9K
         yNYlFxEhU0iuvM6kQD3MziSu9cPbg6fe7mCPrdkG5aDvOtoiy7CtM3qkGSJHDw4n0Wj0
         Mzxuum2ZxK0ho/IX3VDgw8Pi59lKwR3FYzEIQu8wipdd6p4JRsFvypQiaL0tS5A8VCJx
         6bMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678451477;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luzXNHAhAe8Yhdg3tb56C4zTrY7DU3hQHfSExYhU4qg=;
        b=6Wn1ldSrbdO1Ua4k4DO7kiAB6L2yVN8xZUT1ZsdikBGv74Ye8Z2KNFHP2sXuD+qD+7
         y9wfY80mFDEmzCUBhiihc6YiP35e0vsvcu8w0bLQ0WWpc8N37uKKt0pwTNOdytMJ/1gz
         f6a5rqFAZq1jwXZxjdjmtIs3OarCjrePgNpv5rAX6Cv9w+bcrWUBHww0AvIKzGeOtxCE
         areTo9jLOva3Yvrhc/g4W+Q8IbmcOuY6NqLLh2Bln+ZJZefxj8r4wRpVglM42l+u/4E2
         hDN2MRWeAS8zbSe0RvwGFS0a+X2CtYg3kaGRCm1tCnPWg45Ew7fmNW2xV2t0cKOrKyhY
         g2Fg==
X-Gm-Message-State: AO0yUKXzd7zriYIhCkq8z2neAZS1wgJVeyGQUg2tuiLRyWJbnWmBlJ7/
        /MvtaBXiSHySyt/lBYkd0ZdNWrwp3o++BA==
X-Google-Smtp-Source: AK7set9y1Pft3ReICIr5ocW19F7+rRgKPx4JB9o5IpPOWpbleVzu3b57MjC+v6kT2tSzTGd8IYqGjQ==
X-Received: by 2002:a05:600c:358a:b0:3ea:c101:72b with SMTP id p10-20020a05600c358a00b003eac101072bmr2466391wmq.17.1678451476933;
        Fri, 10 Mar 2023 04:31:16 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w22-20020a1cf616000000b003e20fa01a86sm1998871wmc.13.2023.03.10.04.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 04:31:16 -0800 (PST)
Date:   Fri, 10 Mar 2023 15:31:13 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Orlando Chamberlain <orlandoch.dev@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: apple-gmux: return -EFAULT if copy fails
Message-ID: <0bdfa8c2-cb22-4bec-8773-584060613043@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The copy_to/from_user() functions return the number of bytes remaining
to be copied, but we want to return -EFAULT to the user.

Fixes: ce3fef2eb235 ("platform/x86: apple-gmux: add debugfs interface")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 787cf2a7e268..77e63d2da7b6 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -694,7 +694,6 @@ static ssize_t gmux_selected_port_data_write(struct file *file,
 		const char __user *userbuf, size_t count, loff_t *ppos)
 {
 	struct apple_gmux_data *gmux_data = file->private_data;
-	int ret;
 
 	if (*ppos)
 		return -EINVAL;
@@ -702,16 +701,16 @@ static ssize_t gmux_selected_port_data_write(struct file *file,
 	if (count == 1) {
 		u8 data;
 
-		ret = copy_from_user(&data, userbuf, 1);
-		if (ret)
-			return ret;
+		if (copy_from_user(&data, userbuf, 1))
+			return -EFAULT;
+
 		gmux_write8(gmux_data, gmux_data->selected_port, data);
 	} else if (count == 4) {
 		u32 data;
 
-		ret = copy_from_user(&data, userbuf, 4);
-		if (ret)
-			return ret;
+		if (copy_from_user(&data, userbuf, 4))
+			return -EFAULT;
+
 		gmux_write32(gmux_data, gmux_data->selected_port, data);
 	} else
 		return -EINVAL;
-- 
2.39.1

