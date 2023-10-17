Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CBACDB484
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Oct 2023 09:08:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234819AbjJQJIY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Oct 2023 05:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234773AbjJQJIW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2023 05:08:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12808E
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Oct 2023 02:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697533657;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=dIcsAdwZUgDLT3A/7Yyh01n08ShlgC6DBelKI3wgRPg=;
        b=atkKmMQ4I0b64MhaGlvsmtDJ6k+dgZuaH6rjBuZTnPPTC/aVmsdoJOZNPTv+BbyE+QDGFd
        q6nz9Umw59Z7jCFHmIKvjUbAN3wa1cNL6QQDVrQ9EJ7z7J5bGKDYlQ9cscc3BwO5zX1lpK
        o88TifMF3lTnxKXtW/LCd1NT/zJaKSk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-UeYWeEfLPK-J7ElUbOZpqg-1; Tue, 17 Oct 2023 05:07:33 -0400
X-MC-Unique: UeYWeEfLPK-J7ElUbOZpqg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 957918F15C7;
        Tue, 17 Oct 2023 09:07:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6D014492BEE;
        Tue, 17 Oct 2023 09:07:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        James John <me@donjajo.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [RFC 0/3] platform/x86: asus-wmi: Only map brightness codes when using asus-wmi backlight control
Date:   Tue, 17 Oct 2023 11:07:22 +0200
Message-ID: <20231017090725.38163-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

Here is a series to address the issue of some newer Asus laptop models
sending 0x2a - 0x2c events for various keys which fall within
the NOTIFY_BRNDOWN_MIN - NOTIFY_BRNDOWN_MAX range causing these to
wrongly get translated to KEY_BRIGHTNESSDOWN events.

To fix this change the NOTIFY_BRNUP_MIN - NOTIFY_BRNUP_MAX +
NOTIFY_BRNDOWN_MIN - NOTIFY_BRNDOWN_MAX key-mapping to only apply
to old models which use the vendor specific asus-wmi interface for
backlight control.

This series is marked as RFC because I still need to hear back
from the reporter if this series actually fixes things.

Regards,

Hans


Hans de Goede (3):
  platform/x86: asus-wmi: Change ASUS_WMI_BRN_DOWN code from 0x20 to
    0x2e
  platform/x86: asus-wmi: Only map brightness codes when using asus-wmi
    backlight control
  platform/x86: asus-wmi: Map 0x2a code, Ignore 0x2b and 0x2c events

 drivers/platform/x86/asus-nb-wmi.c |  3 +++
 drivers/platform/x86/asus-wmi.c    | 15 ++++-----------
 drivers/platform/x86/asus-wmi.h    |  2 +-
 3 files changed, 8 insertions(+), 12 deletions(-)

-- 
2.41.0

