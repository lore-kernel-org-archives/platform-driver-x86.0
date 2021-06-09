Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFC5C48BCD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:34:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB9A261359
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:34:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237495AbhFIPgx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 11:36:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51134 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237425AbhFIPgr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 11:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623252892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=KfiuaUysjjm6b29OnnGvmDGDVpILaJ6Wzkg1WhNxQTY=;
        b=V2q87J4VrGkNuz2jsF3MQlQl45x+pRbbo6lBthUg9dwGwkDX6U4A6nM1DYJXmRLTlmuvjU
        djLFgaoYQYlow7cbEGv2lwTNo5oelzzLt1fV6OSCfBeWAHRgSV7c9+W4U0rkEpz3SISulT
        sIMBXIgWs3wK6wU9WsECHE4aBkThKM8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-ZAdFkxPnP-SCf9KwPPNtjA-1; Wed, 09 Jun 2021 11:34:50 -0400
X-MC-Unique: ZAdFkxPnP-SCf9KwPPNtjA-1
Received: by mail-ot1-f69.google.com with SMTP id w1-20020a0568304101b02902fc17224cf5so16561483ott.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jun 2021 08:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KfiuaUysjjm6b29OnnGvmDGDVpILaJ6Wzkg1WhNxQTY=;
        b=p2hZkRyYR92Fv/6fAgnCmpksE08xVGMSdi5dyO8JdU9l6nweApcoeZPsI79klyopR/
         lueN7MgemtJrm5cumKa0rVbnTdQ28exPlM20DMHM9na5gfmHmdR7E/DbO33YPC8bR5J2
         F7eZtyxQwzRgsOicF/U5CMAzYM+o3b7FK2DKRkjadu0V+cL70IuDe/rX8pChMZtvQmka
         War2BhupoKz1B5A+sxAXukcHw23+vo7RNcFZbkRQYLN44DHhHbcgQDiE+gF+RNoDZg5h
         AFg/37ClIqP1DZUsch+orqyn/3pmotfcVpQ7wqfqTNE5mPINYL4AUBrfsuRhlCEMbzdI
         4mZg==
X-Gm-Message-State: AOAM531+7uEoS+vEd48yiSBi+R+cd08CDj3DFuPZvqPd+M8FWqERKXgS
        414cxOOdUZzRi1atWrvw2IAFysB3kGUi7d6cqHj923a3bOWoSRKpxEJk1lSD9vxXvRIkDO//Oso
        JOiNjVxOOhsETU21F9wldajhoz7MMcTK90g==
X-Received: by 2002:a4a:3796:: with SMTP id r144mr381796oor.79.1623252890233;
        Wed, 09 Jun 2021 08:34:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKQsKCwsCUaNvi8dryoQlutWe8ew4Y6pgm9Uel7fwtQLSf0heqhCjC/gTWWNM6m8SCKRkUug==
X-Received: by 2002:a4a:3796:: with SMTP id r144mr381786oor.79.1623252890053;
        Wed, 09 Jun 2021 08:34:50 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id j24sm12190oou.8.2021.06.09.08.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 08:34:49 -0700 (PDT)
From:   trix@redhat.com
To:     divya.bharathi@dell.com, prasanth.ksr@dell.com,
        hdegoede@redhat.com, mgross@linux.intel.com
Cc:     Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] platform/x86: dell-wmi-sysman: set fw_attr_class storage-class to static
Date:   Wed,  9 Jun 2021 08:34:45 -0700
Message-Id: <20210609153445.3090046-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Tom Rix <trix@redhat.com>

An allyesconfig has this linking error
drivers/platform/x86/think-lmi.o:
  multiple definition of `fw_attr_class'
drivers/platform/x86/dell/dell-wmi-sysman/sysman.o:
  first defined here

fw_attr_class is only used locally, so change to static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 1378c18786582..636bdfa83284d 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -25,7 +25,7 @@ struct wmi_sysman_priv wmi_priv = {
 /* reset bios to defaults */
 static const char * const reset_types[] = {"builtinsafe", "lastknowngood", "factory", "custom"};
 static int reset_option = -1;
-struct class *fw_attr_class;
+static struct class *fw_attr_class;
 
 
 /**
-- 
2.26.3

