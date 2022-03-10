Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4C3C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Mar 2022 21:08:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343879AbiCJVJ7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Mar 2022 16:09:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242662AbiCJVJ6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Mar 2022 16:09:58 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D347E4E39F
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 13:08:56 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id k125so95845qkf.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 13:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hT9GBFHhgAIWzF/ewVI8GFvXyI97EyT2euSkepLdhXQ=;
        b=pQBhLzrEe7A1tdJqVp4tIJbfCzm10Sc3XMNC8gqjPuOUGekGubkIJ2zkAgjjuJS9FK
         yDJLN1xR08sQNtPkYkPDH2blSBGEiqzjOzpRmway+x5ZFZbHM8XYgiEcUAvXv8AggA/m
         E8fybQPlWDWPcbMkcPB/hq70gBz6r4TO0l0OxOLsqjTf3l+vL4iMBTCYPq3KzK3A3veS
         cbsA3nFx/C+xT0Kjf9at/1Jlgzej7Wvc+bosT2NIpUcA7s608tGQXJofHEhRRKXVJju/
         jVAaJYFgrQNGjCQ8O7FON7AnH+FKvohwsiN8m/JeAwkWp9B9PamF+0qtajZLuR0+sgN5
         uuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hT9GBFHhgAIWzF/ewVI8GFvXyI97EyT2euSkepLdhXQ=;
        b=4Nd4BTLXdCHvUZNG/9mJpitHqD/Zys/SOaN44cFitENNqP2EL7IDLvAuGRBd2QNaOp
         WFutLLHYjAqHZnaZQiDUQw/adxaHqipBoslycA5B12N31caDDcDi8N2k7h6P+kki5VwR
         e2ywTNSefpIu0igdQgr/tAF3XzU9fnb8NaSG9IT6a0IKtSaQOlvDO8hrbAOfoXJN3O5Y
         opUALsikL6dQht69BMn8A2OUr4gwVcU+hsP7QXm87P5paQbM0Do/ljCh9pKQuQMuvYxT
         BrwwgByHnbuwGIWpHQw/O1kyETTxgb1DV3n5G1nY5ohoJ5MMRyGZAz4NKcNynGi8tcsL
         0HyQ==
X-Gm-Message-State: AOAM53292rkAzeBrszOhhhfyoNRvs5qh616co4mTiM8bjM25uv2n1af8
        +U3jEx4LqMbn22DzWsY9fuOeiBi7Ajs=
X-Google-Smtp-Source: ABdhPJwqluFRzapPAZKLC9eeCEV/CiXUGu9wvAZqO2BK8W2i+JH6Mganz2gIulUMlpqSv3oY3LGRQA==
X-Received: by 2002:a05:620a:22db:b0:67d:72f5:bc60 with SMTP id o27-20020a05620a22db00b0067d72f5bc60mr775951qki.633.1646946535715;
        Thu, 10 Mar 2022 13:08:55 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c0b0:4de4:5b27:f2e7])
        by smtp.gmail.com with ESMTPSA id k6-20020a378806000000b0064915d9584fsm2881727qkd.8.2022.03.10.13.08.55
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 13:08:55 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 1/4] Fix hp_wmi_read_int() reporting error (0x05)
Date:   Thu, 10 Mar 2022 15:08:50 -0600
Message-Id: <20220310210853.28367-2-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310210853.28367-1-jorge.lopez2@hp.com>
References: <20220310210853.28367-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose of this patch is to introduce a fix to hp_wmi_read_int()
and eliminate failure error (0x05). Several WMI queries leverage
hp_wmi_read_int() to read their data and were failing with error 0x05.

HPWMI_DISPLAY_QUERY
HPWMI_HDDTEMP_QUERY
HPWMI_ALS_QUERY
HPWMI_HARDWARE_QUERY
HPWMI_WIRELESS_QUERY
HPWMI_POSTCODEERROR_QUERY

The failure occurs because hp_wmi_read_int() calls
hp_wmi_perform_query() with input parameter of size greater than zero.
Invoking those WMI commands with an input buffer size greater than
zero causes the command to be rejected and error 0x05 be returned.

All changes were validated on a HP ZBook Workstation notebook,
HP EliteBook x360, and HP EliteBook 850 G8.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 48a46466f086..103f56399ed0 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -337,7 +337,7 @@ static int hp_wmi_read_int(int query)
 	int val = 0, ret;
 
 	ret = hp_wmi_perform_query(query, HPWMI_READ, &val,
-				   sizeof(val), sizeof(val));
+				   0, sizeof(val));
 
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
-- 
2.25.1

