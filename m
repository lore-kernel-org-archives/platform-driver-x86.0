Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F1CC197A0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 15:42:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbjKTPm4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 10:42:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233688AbjKTPmz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 10:42:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6E7F5
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 07:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700494970;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZbA4MXMz2A28aYgXj30o2IBKi3AamFwiB2D3NkKmtL8=;
        b=PJclaBB77/b0QJRc7+IO7yiWXvC50ZRO4DZVCCN8JYHSv8GPvsXXTl3/ojm4/BupjBculO
        +k6OKTNSEwDMs46DvGtljQjKmZ7G8td3Fjw8zTfTZbgAnUoNva2vUJ/bsnUZxRVqaQEJ3+
        CN2GcpV/uJUjEYfcbuHVZCYDSx54IgY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-KBb-ojvvNaGpPAx_LiE2yQ-1; Mon, 20 Nov 2023 10:42:45 -0500
X-MC-Unique: KBb-ojvvNaGpPAx_LiE2yQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C3EC811E82;
        Mon, 20 Nov 2023 15:42:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F2BFF10F45;
        Mon, 20 Nov 2023 15:42:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        "Luke D . Jones" <luke@ljones.dev>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/3] platform/x86: asus-wmi: Filter Volume key presses if also reported via atkbd
Date:   Mon, 20 Nov 2023 16:42:32 +0100
Message-ID: <20231120154235.610808-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

An issue where volume keypresses get reported through both the atkbd
and the asus-wmi interface has been reported here:

https://bbs.archlinux.org/viewtopic.php?pid=2128536#p2128536

This series addresses this. Unfortunately the reporter has fallen
quiet and has not confirmed that this fixes things, but the fix
is straight forward enough that there should be little doubt
that it works.

Ilpo, the first patch in this series is a straight forward bugfix,
can you merge this into the fixes branch ?

I guess the rest of the series is a bugfix too, but since this
is untested I'm not sure what to do wrt fixes vs for-next,
what do you think ?

Regards,

Hans


Hans de Goede (3):
  platform/x86: asus-wmi: Move i8042 filter install to shared asus-wmi
    code
  platform/x86: asus-wmi: Change q500a_i8042_filter() into a generic
    i8042-filter
  platform/x86: asus-wmi: Filter Volume key presses if also reported via
    atkbd

 drivers/platform/x86/Kconfig       |  2 +-
 drivers/platform/x86/asus-nb-wmi.c | 61 +++++++++++++++++++-----------
 drivers/platform/x86/asus-wmi.c    |  8 ++++
 drivers/platform/x86/asus-wmi.h    |  7 ++--
 4 files changed, 51 insertions(+), 27 deletions(-)

-- 
2.41.0

