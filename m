Return-Path: <SRS0=CVlQ=DC=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1776C4363D
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Sep 2020 06:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BE4D2311B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Sep 2020 06:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K+FUKqYm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgIYG6T (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 25 Sep 2020 02:58:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53066 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727067AbgIYG6T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Sep 2020 02:58:19 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601017098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZfX6GaGTVfZmDK5UWD8UUFIx50QGAYn7sD4X5ts7lbk=;
        b=K+FUKqYmuRBbAYb9gtdZ9PLXFMXHMG4Aj+wVvJ8XVeA3HgpSe8c1n/9O/IdpsvoqRxZTHY
        UlhPHMWpdxjeOqkPq8oAd5ShtDZ+wUXEuPaEv6jhJ/qPzg/EvFvzjFG9X/KyiUgCTt6zz1
        RNYMNygtKS4njhmCeAJRmBFx8fbvPJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-rS-imlDoOXWD33sA7sgUGw-1; Fri, 25 Sep 2020 02:58:16 -0400
X-MC-Unique: rS-imlDoOXWD33sA7sgUGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B726E61266;
        Fri, 25 Sep 2020 06:58:14 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-184.ams2.redhat.com [10.36.113.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 982C73C89;
        Fri, 25 Sep 2020 06:58:13 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add Mark Gross and Hans de Goede as x86 platform drivers maintainers
Date:   Fri, 25 Sep 2020 08:58:12 +0200
Message-Id: <20200925065812.3973-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Darren Hart and Andy Shevchenko lately have not had enough time to
maintain the x86 platform drivers, dropping their status to:
"Odd Fixes".

Mark Gross and Hans de Goede will take over maintainership of
the x86 platform drivers. Replace Darren and Andy's entries with
theirs and change the status to "Maintained".

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ab6570bb2d14..1ff02b889f49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18894,10 +18894,10 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
 F:	arch/x86/mm/
 
 X86 PLATFORM DRIVERS
-M:	Darren Hart <dvhart@infradead.org>
-M:	Andy Shevchenko <andy@infradead.org>
+M:	Hans de Goede <hdegoede@redhat.com>
+M:	Mark Gross <mgross@linux.intel.com>
 L:	platform-driver-x86@vger.kernel.org
-S:	Odd Fixes
+S:	Maintained
 T:	git git://git.infradead.org/linux-platform-drivers-x86.git
 F:	drivers/platform/olpc/
 F:	drivers/platform/x86/
-- 
2.28.0

