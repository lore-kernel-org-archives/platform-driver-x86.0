Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F7CC77B7E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 21:01:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232445AbjEYVBx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 17:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241964AbjEYVBn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 17:01:43 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C411110C7
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 14:01:19 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-309438004a6so1733509f8f.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 14:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685048478; x=1687640478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JHo3JDDLra4+jfxzapcApbOLXoBnqgHSnaA0WGxS1nY=;
        b=BRiWwVYPMbvWVZDp8ShBs1StHgZBU8OCB5M4uStwsp2zAZzkslgSSEOZy8XpVdTLEe
         mWsMAJV+gUT1thHkslfhXsUh+/oq3phR6jKw5oPWn0jc8scmWeyFlo1NTvXNMUoaZj8V
         pcwHnyw7RKt5CtoXaPnw6UadvHRL7V6VcmIsUmw4loVn/eOE58eSntgrN5gfFj8WPZat
         gpjZy5c64+8grGHfqyPAljlkOc2adi4h6dhDTsVMvSMzyOybpGw2PdBdvOc6T02T4oiK
         Pu/k8N9h8ZGyEAxFjjYwOWIFnlupPxIRmU1Ibn+k3mqaKZK4MJ/v0VI/38tRxfpyUyaD
         /OLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685048478; x=1687640478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHo3JDDLra4+jfxzapcApbOLXoBnqgHSnaA0WGxS1nY=;
        b=J2yLSn9H0wgwRLPAwJ77yy7ViaWUvNY2sKffksNq+xgo7u+o8ljlk8b9Av2bOMRJpg
         M8zmD4DH/otaRmvyjwk82MNTXZ+3gl7MZDlsRhLOe7c80E1STYWoaWuWrZ5Vee0tZycd
         ApyAaH7nGEd0fSspFTQ5XlkdSFha2TZlDSnHHJWZ+Xo01RsoI5cY7IZcChWvDOaNLJEH
         cAwRIRe1UNueoXwB+b/PXlhRoeFFq6XQMkXNj/88fS5KpIoQ75GHsF1ZkPFRsLq8+iuN
         AbRyDM65N0yjibcsRWR+xoawhr6eAvGPXcEu26zmVdlg+DZzcidJxxzaAk/IuMnJR5aG
         G+Xg==
X-Gm-Message-State: AC+VfDxJZYD6e5/nedIIH2QpfnUMLQhVBjMMaWYPHmzLtrIoz2Ie8+sq
        88Ns6Y61+gZ7Jt7nC0FNfaI=
X-Google-Smtp-Source: ACHHUZ4BquDXazuuNwxIOxVam/4+45ywjzMloujwQfjSU43TgTWtJQ0oKfTR+Ig/nNouFqV/d0UTLg==
X-Received: by 2002:a5d:6088:0:b0:307:bd64:f5a4 with SMTP id w8-20020a5d6088000000b00307bd64f5a4mr3414387wrt.52.1685048478083;
        Thu, 25 May 2023 14:01:18 -0700 (PDT)
Received: from xws.localdomain (pd9e5a196.dip0.t-ipconnect.de. [217.229.161.150])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d4a49000000b003063db8f45bsm2839262wrs.23.2023.05.25.14.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 14:01:17 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH] platform/surface: aggregator: Allow completion work-items to be executed in parallel
Date:   Thu, 25 May 2023 23:01:10 +0200
Message-Id: <20230525210110.2785470-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently, event completion work-items are restricted to be run strictly
in non-parallel fashion by the respective workqueue. However, this has
lead to some problems:

In some instances, the event notifier function called inside this
completion workqueue takes a non-negligible amount of time to execute.
One such example is the battery event handling code (surface_battery.c),
which can result in a full battery information refresh, involving
further synchronous communication with the EC inside the event handler.
This is made worse if the communication fails spuriously, generally
incurring a multi-second timeout.

Since the event completions are run strictly non-parallel, this blocks
other events from being propagated to the respective subsystems. This
becomes especially noticeable for keyboard and touchpad input, which
also funnel their events through this system. Here, users have reported
occasional multi-second "freezes".

Note, however, that the event handling system was never intended to run
purely sequentially. Instead, we have one work struct per EC/SAM
subsystem, processing the event queue for that subsystem. These work
structs were intended to run in parallel, allowing sequential processing
of work items for each subsystem but parallel processing of work items
across subsystems.

The only restriction to this is the way the workqueue is created.
Therefore, replace create_workqueue() with alloc_workqueue() and do not
restrict the maximum number of parallel work items to be executed on
that queue, resolving any cross-subsystem blockage.

Fixes: c167b9c7e3d6 ("platform/surface: Add Surface Aggregator subsystem")
Link: https://github.com/linux-surface/linux-surface/issues/1026
Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/platform/surface/aggregator/controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
index 535581c0471c5..7fc602e01487d 100644
--- a/drivers/platform/surface/aggregator/controller.c
+++ b/drivers/platform/surface/aggregator/controller.c
@@ -825,7 +825,7 @@ static int ssam_cplt_init(struct ssam_cplt *cplt, struct device *dev)
 
 	cplt->dev = dev;
 
-	cplt->wq = create_workqueue(SSAM_CPLT_WQ_NAME);
+	cplt->wq = alloc_workqueue(SSAM_CPLT_WQ_NAME, WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
 	if (!cplt->wq)
 		return -ENOMEM;
 
-- 
2.40.1

