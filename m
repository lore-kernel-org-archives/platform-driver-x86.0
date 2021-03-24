Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8286EC433E2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Mar 2021 12:57:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F3F161A0F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Mar 2021 12:57:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234685AbhCXM43 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Mar 2021 08:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234497AbhCXM4C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Mar 2021 08:56:02 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD48C0613DF
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Mar 2021 05:56:01 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id b16so27527440eds.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Mar 2021 05:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S9XD7LgutIthWxyh0z5JZ2FaeGZvIL8c4hnddAnFY7Q=;
        b=rHtXaN5hln2lNri4GKEYgFoML7CrNJGGG1rbRnRtjn6+dujoAalkv/r5bc4YpXj5Cl
         DgpHKHWpHsaj+oxL/GVFrHP6X6jHORAjYLcW8eWFiYdzNQ2OhDp+ZeVuw7cEXVHktoPh
         hEy1lqSNBb3W/gD7945+zLJ9s4dgRdDAI1sp2/SgiS2XWs9ZWd9xl7ki66IBex54VU1E
         pQJj939l1XAxfi/Osv89Di4fDbcPf4zde4l3IXwRPEym+O/Ax3peiaL4xCOubhomRWTq
         s4qK/dL8GotwGws6o5p8wdtGlKoGucYAh2WJZCxcpQrHGP/SxnfzOe9WmerXLNTzgeSa
         8U4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S9XD7LgutIthWxyh0z5JZ2FaeGZvIL8c4hnddAnFY7Q=;
        b=jBlFuaWpvEM1zTXHIEml9s70Ixc0ixiN+5jWVCyuDBcOjab0UFp4+pQfMMG7GrLOZZ
         fN4y6oZmnp7yH789Z09Bw6cWaEqfKBdq2afcVPgJAanbdGSc6cJRnvz73j/BvGwZCq9a
         0+MMxch0AgIrI0s04CJo4Ys7GJgL1QO8rFqJVatRhYth5cgEMF2HGdITwqUr3TzmvJ5X
         zne+N+xhPohRIo7JXrUIWnvcUGxa6KwDzCXiDugjqK8Lszoe3LVIhv5lWMZBXqphJqAw
         3U5JYj8kfvvlRbuujVf7V3fVhDBsZ9QT8+pShNicsG/5xibJi4ZZWNOYI+A9/cZ7AqEz
         VzWw==
X-Gm-Message-State: AOAM533wlYBrFPrjKkRx9Qufk6rYhJIwrKPXljnnkzOs/Vg9E6lJnWO+
        UR14brcoSm/PaZQuTHZkH8Btr+6Z+Ir6B3TK
X-Google-Smtp-Source: ABdhPJzI/SdqyKZqfR2XhPBIU6Z8i4lnkS1sHkXwoXxmHwDZKeF6Bz5Qah6Es4+NCUjdk5vfhn9U5Q==
X-Received: by 2002:a05:6402:2552:: with SMTP id l18mr3211824edb.71.1616590560162;
        Wed, 24 Mar 2021 05:56:00 -0700 (PDT)
Received: from localhost.localdomain ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id fi11sm880282ejb.73.2021.03.24.05.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:55:59 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org
Cc:     coproscefalo@gmail.com, hdegoede@redhat.com,
        mgross@linux.intel.com, jic23@kernel.org, linux@deviqon.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH 00/10] platform/x86: toshiba_acpi: move acpi add/remove to device-managed routines
Date:   Wed, 24 Mar 2021 14:55:38 +0200
Message-Id: <20210324125548.45983-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This changeset tries to do a conversion of the toshiba_acpi driver to use
only device-managed routines. The driver registers as a singleton, so no
more than one device can be registered at a time.

My main intent here is to try to convert the iio_device_alloc() and
iio_device_register() to their devm_ variants.

Usually, when converting a registration call to device-managed variant, the
init order must be preserved. And the deregistration order must be a mirror
of the registration (in reverse order).

This change tries to do that, by using devm_ variants where available and
devm_add_action_or_reset() where this isn't possible.
Some deregistration ordering is changed, because it wasn't exactly
mirroring (in reverse) the init order.

For the IIO subsystem, the toshiba_acpi driver is the only user of
iio_device_alloc(). If this changeset is accepted (after discussion), I
will propose to remove the iio_device_alloc() function.

While I admit this may look like an overzealous effort to use devm_
everywhere (in IIO at least), for me it's a fun/interesting excercise.

Alexandru Ardelean (10):
  platform/x86: toshiba_acpi: bind life-time of toshiba_acpi_dev to
    parent
  platform/x86: toshiba_acpi: use devm_add_action_or_reset() for
    singleton clear
  platform/x86: toshiba_acpi: bind registration of miscdev object to
    parent
  platform/x86: toshiba_acpi: use device-managed functions for input
    device
  platform/x86: toshiba_acpi: register backlight with device-managed
    variant
  platform/x86: toshiba_acpi: use devm_led_classdev_register() for LEDs
  platform/x86: toshiba_acpi: use device-managed functions for
    accelerometer
  platform/x86: toshiba_acpi: use device-managed for wwan_rfkill
    management
  platform/x86: toshiba_acpi: use device-managed for sysfs removal
  platform/x86: toshiba_acpi: bind proc entries creation to parent

 drivers/platform/x86/toshiba_acpi.c | 249 +++++++++++++++++-----------
 1 file changed, 150 insertions(+), 99 deletions(-)

-- 
2.30.2

