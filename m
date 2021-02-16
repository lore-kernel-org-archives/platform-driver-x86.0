Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CF2C433DB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Feb 2021 15:26:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 815A664DF0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Feb 2021 15:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhBPP02 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Feb 2021 10:26:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42926 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229880AbhBPP01 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Feb 2021 10:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613489102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=IUDp6jeygFsKWjWIBMH3h4A7hRjO7NUoMGcja8ua/yE=;
        b=Iy2eD2hLv41Ur7GKYrsFHYNYqnu1sqLtPfCnMLd4FLG7A1JlzjIqUFE0SDiL6RQTUdoegQ
        zkmHwPD1A7flxNMxSbkDEcgWjw+GbQN76kWqC1YEfRcN8gqsOhpD9LABh7Y2sR87cchpLR
        83MCPip/eCpcexHnWdmikw7Dul28RHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-4aO5XeJ8OXOvB1RelKCXtw-1; Tue, 16 Feb 2021 10:24:58 -0500
X-MC-Unique: 4aO5XeJ8OXOvB1RelKCXtw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 235C3107ACE4;
        Tue, 16 Feb 2021 15:24:57 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-22.ams2.redhat.com [10.36.113.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DB02D60C15;
        Tue, 16 Feb 2021 15:24:55 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] MAINTAINERS: update MELLANOX HARDWARE PLATFORM SUPPORT maintainers
Date:   Tue, 16 Feb 2021 16:24:54 +0100
Message-Id: <20210216152454.11878-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The "MELLANOX HARDWARE PLATFORM SUPPORT" is maintained as part of the
pdx86 tree. But when Mark and I took over as new pdx86 maintainers the
"MELLANOX HARDWARE PLATFORM SUPPORT" MAINTAINERS entry was not updated.

Update the entry now.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 452f0f7b7c21..aa800d6829ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11367,8 +11367,8 @@ Q:	https://patchwork.kernel.org/project/netdevbpf/list/
 F:	drivers/net/ethernet/mellanox/mlxfw/
 
 MELLANOX HARDWARE PLATFORM SUPPORT
-M:	Andy Shevchenko <andy@infradead.org>
-M:	Darren Hart <dvhart@infradead.org>
+M:	Hans de Goede <hdegoede@redhat.com>
+M:	Mark Gross <mgross@linux.intel.com>
 M:	Vadim Pasternak <vadimp@nvidia.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
-- 
2.30.1

