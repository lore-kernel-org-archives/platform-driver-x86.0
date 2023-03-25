Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EA9C76196
	for <platform-driver-x86@archiver.kernel.org>; Sat, 25 Mar 2023 11:08:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbjCYLIV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 25 Mar 2023 07:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbjCYLIT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Mar 2023 07:08:19 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1225916882;
        Sat, 25 Mar 2023 04:08:14 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id er18so6117806edb.9;
        Sat, 25 Mar 2023 04:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679742492;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zk8doAfUl+ZfcEUfEPNWLVG3j4lJKm9U9m/sCbx1TNM=;
        b=FtpzitCrL6ZLT62afUGqv+RGPSUb4kHMxanyPsMGCMcXHKtH0Lgwp0Yx80LkwKz4Du
         dlhPXqebS5qcgKZhhNyNOJ4PCuRDjE0Lo8GIDutEPpUaXno7gV8LTMG2EX+1xzWOZQi7
         wWXNGhELvKYj1duRtBUipj8qsPL+MdltXhA6jRJooW4XdV9RZySBiPg9TWccTWimAh2S
         ah3ua9bPggPDDq1j/ue0UnrZNmKKfJsqTwBeevbv8/VWvosxPYQSJRrMWZ0lcJeIdd+t
         VHANEh1R5Vh5/seHw1t1dgjo01Y2BzDHbqH5mgVl7VmX4WgZQfWZli0jNoJPinoo62j3
         Rbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742492;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zk8doAfUl+ZfcEUfEPNWLVG3j4lJKm9U9m/sCbx1TNM=;
        b=11JnEFFVPh+PVymP4KA0VDkPEZg/Phc45Nw8muC1MVbjuu4ZJWPvBfDuqukR0vM+TE
         nkFvmIQlLJ3xioZLK2NamipWQGLoyOtDW1AyDOks2a41nHYPy6aXGjW9VLL3La6F1JbU
         1Hqi1s28Tg/sQj2FdjC7ALzRXN2GUx+lypcwBX+PyhNiMYqS6Dz69nryBaIu1TIYbb6X
         fGTkSkjFkzb64M4RDSaJzbGr7GXgCIIL60xoOKVv9CLappUd3ifz44nptA4vlzWtGhrD
         2oG8tMw57i/A5CzGFbNs2FWbllnw5bLwc6uChHc2xuW0C4lkHvVse8nWM6QXxKrXrsiu
         TJIQ==
X-Gm-Message-State: AAQBX9dLPZR35BEzjm1Pn5EYc7fbuVyXPDkO7BXe+W+BF5P1eCaYvYKs
        aBIJdtnbITthzyMCyEITnco=
X-Google-Smtp-Source: AKy350bKarJZNeSl4r8cIGS0LEIUQ8mxI9D8On4pGeX5NX/8Ff+M8ADXWPdn75wS7P4bOsm30hfZBA==
X-Received: by 2002:a17:906:ecf4:b0:930:2e1c:97ba with SMTP id qt20-20020a170906ecf400b009302e1c97bamr6110457ejb.5.1679742492402;
        Sat, 25 Mar 2023 04:08:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id xd10-20020a170907078a00b0093caa021528sm3999775ejb.85.2023.03.25.04.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 04:08:12 -0700 (PDT)
Date:   Sat, 25 Mar 2023 14:08:02 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: ISST: unlock on error path in tpmi_sst_init()
Message-ID: <dcdebbb7-7de6-4d04-8e7a-43d5ca043484@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Call mutex_unlock(&isst_tpmi_dev_lock) before returning on this
error path.

Fixes: d805456c712f ("platform/x86: ISST: Enumerate TPMI SST and create framework")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index cdb56a18ea17..664d2ee60385 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -1399,8 +1399,10 @@ int tpmi_sst_init(void)
 	isst_common.sst_inst = kcalloc(topology_max_packages(),
 				       sizeof(*isst_common.sst_inst),
 				       GFP_KERNEL);
-	if (!isst_common.sst_inst)
-		return -ENOMEM;
+	if (!isst_common.sst_inst) {
+		ret = -ENOMEM;
+		goto init_done;
+	}
 
 	memset(&cb, 0, sizeof(cb));
 	cb.cmd_size = sizeof(struct isst_if_io_reg);
-- 
2.39.1

