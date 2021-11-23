Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB173C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Nov 2021 21:04:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbhKWVHk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Nov 2021 16:07:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27387 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232825AbhKWVHk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Nov 2021 16:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637701471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=l6r9TQgbkq4kbrjmUo7HbHg09EdsYXUEJhMk5b2xcCs=;
        b=E1YfSOjdq9G9Dg5+VkC3MSJ5jw77+jZo1/SmtmSUk0glFjw+5Q5d52IyXp2PjSUnQ6Wj1o
        54EC+BuTp8vgwVVvMOZeZc50PHUQxtqLpfub8Cr5TNkl+NCxMEq2BTPGZvlkEbRPeK6tQK
        LwE4rkDfdShyGWUS5Cc7vAUvdDU+nSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-58q9BCDSOhimnoYbEY4x3g-1; Tue, 23 Nov 2021 16:04:28 -0500
X-MC-Unique: 58q9BCDSOhimnoYbEY4x3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE51B1006AA0;
        Tue, 23 Nov 2021 21:04:26 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5E8F879448;
        Tue, 23 Nov 2021 21:04:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Baker <len.baker@gmx.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/6] platform/x86: thinkpad_acpi: 4 bug-fixes + 2 cleanups
Date:   Tue, 23 Nov 2021 22:04:18 +0100
Message-Id: <20211123210424.266607-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

Here is a thinkpad_acpi series with 4 bug-fixes fixing various bugs
which I missed while merging the big patch to move to dev_groups +
2 small cleanups on top.

The first bug-fixes is 5.16-rc# material since one initial patch
to move the hotkeys stuff to using is_visible already landed in 5.16-rc1.

Regards,

Hans


Hans de Goede (6):
  platform/x86: thinkpad_acpi: Restore missing hotkey_tablet_mode and
    hotkey_radio_sw sysfs-attr
  platform/x86: thinkpad_acpi: Register tpacpi_pdriver after subdriver
    init
  platform/x86: thinkpad_acpi: tpacpi_attr_group contains driver
    attributes not device attrs
  platform/x86: thinkpad_acpi: Fix the hwmon sysfs-attr showing up in
    the wrong place
  platform/x86: thinkpad_acpi: Remove unused
    sensors_pdev_attrs_registered flag
  platform/x86: thinkpad_acpi: Move input_unregister_device() to the top
    of thinkpad_acpi_module_exit()

 drivers/platform/x86/thinkpad_acpi.c | 113 ++++++++++++++++-----------
 1 file changed, 66 insertions(+), 47 deletions(-)

-- 
2.33.1

