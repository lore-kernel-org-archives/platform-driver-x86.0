Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266D5C433FE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Nov 2021 19:11:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238433AbhKUTOl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Nov 2021 14:14:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26977 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236275AbhKUTOl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Nov 2021 14:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637521895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=6XIXbl+8EJQw9dZh+l4BilTITBLoNSkBH5I99dzusOY=;
        b=FYvgVq2IiKofG+HXqpn+rpva20aX5Y+qMMki4CtlOJlCQ5D+p1fV2r/lwH5DQvFgEYRsFP
        sNICS7iOxBjaP0iTRL/0znwDLqB0dl1mNBvtfTsnCttbKE5ZviIntPa4NgxlDi6Ta0X3/e
        MdHVf7iO3gXaAX/nXuEeuXcmFmKo6R8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-BYAa2SIONz6m4M5AkLnPQA-1; Sun, 21 Nov 2021 14:11:32 -0500
X-MC-Unique: BYAa2SIONz6m4M5AkLnPQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EB49102C886;
        Sun, 21 Nov 2021 19:11:31 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E83F85DF21;
        Sun, 21 Nov 2021 19:11:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/7] thinkpad_acpi: 1 bugfix + a bunch of cleanups
Date:   Sun, 21 Nov 2021 20:11:22 +0100
Message-Id: <20211121191129.256713-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

Here is a patch-series for the thinkpad_acpi driver starting with one
important bugfix which fixes a bug introduced by commit 79f960e29cfc
("platform/x86: thinkpad_acpi: Convert platform driver to use dev_groups")
in platform-drivers-x86/for-next which is causing the driver to not load
at all on many devices.

Followed by a bunch of cleanup patches.

Please test and review.

Regards,

Hans


Hans de Goede (7):
  platform/x86: thinkpad_acpi: Accept ibm_init_struct.init() returning
    -ENODEV
  platform/x86: thinkpad_acpi: Make *_init() functions return -ENODEV
    instead of 1
  platform/x86: thinkpad_acpi: Simplify dytc_version handling
  platform/x86: thinkpad_acpi: Cleanup dytc_profile_available
  platform/x86: thinkpad_acpi: Properly indent code in
    tpacpi_dytc_profile_init()
  platform/x86: thinkpad_acpi: Remove "goto err_exit" from hotkey_init()
  platform/x86: thinkpad_acpi: Fix thermal_temp_input_attr sorting

 drivers/platform/x86/thinkpad_acpi.c | 221 ++++++++++-----------------
 1 file changed, 78 insertions(+), 143 deletions(-)

-- 
2.31.1

