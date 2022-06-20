Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D38ACCA480
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Jun 2022 15:11:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241293AbiFTPLU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Jun 2022 11:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242843AbiFTPJz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 11:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5533924961
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 07:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655736995;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i3hXaacruppG6kUtM8sezq2yF3Riu77EtzvB7/6Jqg0=;
        b=Fb0rD5HEXsv9OvqRJXkSVkVKhfKK8+t2XPAmmYlvQTfcfQ/LVT+9Mh8fg7buZK6PfU3ROb
        w92Nf7GeS1eOoYiY+4wg7FJWZq382CsJO7rCjAsGc0IH0VRRrBKOyds00u103R7KhsED1R
        e8/feoOGAXhfg1eee3N7pJm3oqGUIHU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-G0WxJfXrNimGrEfmOdpKsg-1; Mon, 20 Jun 2022 10:56:33 -0400
X-MC-Unique: G0WxJfXrNimGrEfmOdpKsg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C78F803FF1;
        Mon, 20 Jun 2022 14:56:33 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.239])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C56B09D63;
        Mon, 20 Jun 2022 14:56:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/3] platform/x86: Kconfig: Remove unnecessary "if X86"
Date:   Mon, 20 Jun 2022 16:56:27 +0200
Message-Id: <20220620145628.5882-2-hdegoede@redhat.com>
In-Reply-To: <20220620145628.5882-1-hdegoede@redhat.com>
References: <20220620145628.5882-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

drivers/platform/x86/Kconfig is wrapped in one big
if X86_PLATFORM_DEVICES .. endif and X86_PLATFORM_DEVICES already
has a "depends on X86" so the "if X86" in drivers/platform/Kconfig
is not necessary and except for mips non of the other includes
there has such an if. So lets remove it.

While at it also move the x86/Kconfig include to the end of the file
for alphabetical sorting.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Drop "if X86" from drivers/platform/Kconfig instead of dropping the
  "depends on X86" from X86_PLATFORM_DEVICES
---
 drivers/platform/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 18fc6a08569e..b437847b6237 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -1,7 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-if X86
-source "drivers/platform/x86/Kconfig"
-endif
 if MIPS
 source "drivers/platform/mips/Kconfig"
 endif
@@ -15,3 +12,5 @@ source "drivers/platform/mellanox/Kconfig"
 source "drivers/platform/olpc/Kconfig"
 
 source "drivers/platform/surface/Kconfig"
+
+source "drivers/platform/x86/Kconfig"
-- 
2.36.0

