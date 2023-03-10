Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CBEC6FD19
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 09:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbjCJJ5q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Mar 2023 04:57:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjCJJ5p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2023 04:57:45 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985A8108226
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 01:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678442218;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=jhU8bd8C7vQ22OYeaz40tYAyAw2aACJzM2sU6moYQ6Y=;
        b=Bf9FnlUwVZVVcpwFsLUab8nWv/hupw/izZ7izbNhvYIgVwq8fux8E4NLO9XlNpFhO236CL
        PKpXSjFJYiKQHCre2j1dpIB8IivX6caGTpYqaHaoCzA4yqPx+i0FTXNzOYFIiG3p5lG453
        H3dUuiwvSmQZPY9GdKd1r90qoG2BT2I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-AAao6rY5PS-THvAXyBOOng-1; Fri, 10 Mar 2023 04:56:57 -0500
X-MC-Unique: AAao6rY5PS-THvAXyBOOng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3398D101A521;
        Fri, 10 Mar 2023 09:56:57 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.100])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8E5772166B26;
        Fri, 10 Mar 2023 09:56:53 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 0/4] leds: tps68470: LED driver for TPS68470
Date:   Fri, 10 Mar 2023 17:56:31 +0800
Message-Id: <20230310095635.813262-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The v2 patch of TPS68470 LED driver includes:

1. The code improvements were based on reviewers' comments.
2. strcmp() was removed.
3. V2 also included Hans' LED look-up table for the privacy LED.

Hans de Goede (1):
  platform: x86: int3472: Register a LED lookup table entry for the
    privacy LED

Kate Hsuan (3):
  platform: x86: int3472: Add MFD cell for tps68470 LED
  include: mfd: tps68470: Add masks for LEDA and LEDB
  leds: tps68470: Add LED control for tps68470

 drivers/leds/Kconfig                          |  12 ++
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-tps68470.c                  | 182 ++++++++++++++++++
 drivers/platform/x86/intel/int3472/tps68470.c |  35 +++-
 include/linux/mfd/tps68470.h                  |   5 +
 5 files changed, 231 insertions(+), 4 deletions(-)
 create mode 100644 drivers/leds/leds-tps68470.c

-- 
2.37.3

