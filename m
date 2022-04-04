Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D279C4167B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Apr 2022 21:29:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382543AbiDDVbF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380586AbiDDUi0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 16:38:26 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2FFB387AD
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 13:36:29 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-deb9295679so12148209fac.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Apr 2022 13:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RFWauzAcxF9+f2KuUsBcynERWFeESDCqiR4hYHgGVl8=;
        b=LTXPTSHaYS6wDtSlv5vTcZrbAmBWDYs8NKXkUEpDDe2EHjy1/6PjkKaW2lcWQcDHEi
         8CmI1TmTQbd4g/vRkH5bQY3WjQV5lsk2Jv5zMuFaFEhqrcb/nSz9sEfnhuZYMkU9Zpad
         rNdJANe5YT71u4Y93qty6wFojJkR7/J/hGVTAO4IzJkIAD/9AqHKDDZIMYCeYhq/5CNv
         z1DqPo4r16aTYCbdJdGnE3U8thy2dwz4+J4TEgrzeuJpLLvmE96CritY4+AJmju0L9Mi
         DW9VqIyin2xO3sQinP6CfcK3xN9hO7tpV6PGvTlPv/O+8LIcU0fBgyy09eKjDpB97T6t
         +Y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RFWauzAcxF9+f2KuUsBcynERWFeESDCqiR4hYHgGVl8=;
        b=o6fMCZ2gXwxSIrs8SrLbGd8Axm1mQTq4aO54Xp6Uj8uw5NIu+bEVKgVp3T+vYvLN1q
         bnwm1wovk75MMq50q6XEvtDhwJ09li8SiEaaC4Auh354xz0SeR8GQRgF/A8pr9JYSJ0d
         QJADrM9iR4eDn+2fO3UFLFjrOpzRVHP2U12m7HTwpe9j3SkX/CQofqD0cGF7wqCvnFpT
         +4NCD9GMkMjvzORRxR3odogqDUbX+6Xcm28BmslrQuyx/YRo0TLpiE3fc/HeHElpEQ9T
         +xL/MeyBdkfVVsB20tiRXn4grQjEE3fdZr5nic+OUwjghe0v5+WKo/u5S0+OSCiOI/V3
         c4+w==
X-Gm-Message-State: AOAM531HrucvlNFWhLkxNJdTiYiM4MegYhNQNgV0MejEKSQSIaDEU/He
        NUn7b5lo6kmN7uIgyyx1ykS4LF5wY0o=
X-Google-Smtp-Source: ABdhPJygdWKaULElKzyMlFcE3G7defgDYa0Zd1HlU/rDldSXOCU32rM2IFLX4unj3M1mK8jmJ3AskQ==
X-Received: by 2002:a05:6870:c142:b0:dd:d5a3:767c with SMTP id g2-20020a056870c14200b000ddd5a3767cmr548184oad.291.1649104589076;
        Mon, 04 Apr 2022 13:36:29 -0700 (PDT)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c57b:f63e:33f5:caed])
        by smtp.gmail.com with ESMTPSA id u20-20020a4a9e94000000b003291f6ac4b2sm3765786ook.28.2022.04.04.13.36.28
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 13:36:28 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 2/6] Update hp_wmi_group to simplify feature addition
Date:   Mon,  4 Apr 2022 15:36:22 -0500
Message-Id: <20220404203626.4311-3-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404203626.4311-1-jorge.lopez2@hp.com>
References: <20220404203626.4311-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Introduction of hp_wmi_groups to simplify the integration of driver
security features with sysfs.

All changes were validated on a HP ZBook Workstation,
HP EliteBook x360, and HP EliteBook 850 G8 notebooks.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next

v1-0001-Update-hp_wmi_group-to-simplify-feature-addition patch was
broken in two separate patches.  This patch is patch 2 of 2
---
 drivers/platform/x86/hp-wmi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 667f94bba905..0c7d863b8aab 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -740,7 +740,15 @@ static struct attribute *hp_wmi_attrs[] = {
 	&dev_attr_postcode.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(hp_wmi);
+
+static const struct attribute_group hp_wmi_group = {
+	.attrs = hp_wmi_attrs,
+};
+
+static const struct attribute_group *hp_wmi_groups[] = {
+	&hp_wmi_group,
+	NULL,
+};
 
 static void hp_wmi_notify(u32 value, void *context)
 {
-- 
2.25.1

