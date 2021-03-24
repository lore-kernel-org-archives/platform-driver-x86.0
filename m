Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D335BC433E6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Mar 2021 12:57:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC92E619D5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Mar 2021 12:57:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234706AbhCXM4b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Mar 2021 08:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234521AbhCXM4E (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Mar 2021 08:56:04 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA54C0613E0
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Mar 2021 05:56:03 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id e7so27428264edu.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Mar 2021 05:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vjfeStBI2DcHZmjQrx+N+dsAxgF1a/tnl6rrv3SVE6Q=;
        b=tekIiAZWW3kwi3DlNvLmMjX9jCWj63bcKAuPkI/Q5kJI1jxRdebmh1n9A/tlN0QDix
         AhF96gOTxQDa/INulpZewfZFCBHRT32NBq4aN7Wt9iCdCk3hqwXQu0HoXJcnqap2l8rT
         hp892/IN6CoTYtv4sXGNN0pSbemNt7+zWkpKgHHWadomhZp399P88VkrOkkjNOLK/EO1
         7/wbr3XDjeBjDtw3cLPZB8UFskNHxNGG40xlP5icGyEQXICCz1O9EsMJb3DXQOXP3TOD
         Ci3Pr1aUf75aTPI9Grsc2yKD1Y1687FHnbcYBoFJve456VIQJ2f1B4xhuPoI55jOS2ev
         k91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vjfeStBI2DcHZmjQrx+N+dsAxgF1a/tnl6rrv3SVE6Q=;
        b=ZxkVqnt/Zx3oy36fMo9EQSYqepPj+e9P+RXYb3GBSskhfJf+TrFTe3bvhs1P4nlTWL
         S/ZUDNi7GpyT16ePbuCeJNueOB7bh5+bLmNuiTVrm9XpqBMD91jX6v1pEm5LxShH7zCw
         Umzen71bsVbsOV4VLuFtQM6g/GDCtBKyvIZnH2GEhx2vit0o+ZBFwKq63dLTb7P9s+6e
         /1NOLGW9FrrEzhsntFw3EZ4Y8Am7TSvwZY+ojoRwBqLYe/TD42ThjVLvMKhS5FIL0G/V
         1mJdhnHUGYEHCXHBJ9Tby0Xv9Red4gn7O65toq1k5oajYjD4rDZGF9X5EiOi3/+hF+4P
         ONOw==
X-Gm-Message-State: AOAM5328jL45geu+fhFvktDl1wf/d1WkQwJ3vLZJhQ7WD6SXPMBe+9EO
        hDVJw9890O2wxiBCg2hjgDjQ8GiiZZtF8P7V
X-Google-Smtp-Source: ABdhPJyE/+A23QNDkwguoiMrfXl+jMVy6xCycwVkij0rRzaeQOah7cxBFhnpOcFlsG90OWCUZmfHRg==
X-Received: by 2002:a05:6402:2076:: with SMTP id bd22mr3260352edb.378.1616590562364;
        Wed, 24 Mar 2021 05:56:02 -0700 (PDT)
Received: from localhost.localdomain ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id fi11sm880282ejb.73.2021.03.24.05.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:56:02 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org
Cc:     coproscefalo@gmail.com, hdegoede@redhat.com,
        mgross@linux.intel.com, jic23@kernel.org, linux@deviqon.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH 02/10] platform/x86: toshiba_acpi: use devm_add_action_or_reset() for singleton clear
Date:   Wed, 24 Mar 2021 14:55:40 +0200
Message-Id: <20210324125548.45983-3-aardelean@deviqon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324125548.45983-1-aardelean@deviqon.com>
References: <20210324125548.45983-1-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The only reason to do this is to enforce the ordering of deinitialization,
when the conversion of the device-managed functions is done.

The singleton object should be cleared right before it is free'd.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/platform/x86/toshiba_acpi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 6d298810b7bf..c5284601bc2a 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2995,9 +2995,6 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
 		rfkill_destroy(dev->wwan_rfk);
 	}
 
-	if (toshiba_acpi)
-		toshiba_acpi = NULL;
-
 	return 0;
 }
 
@@ -3012,6 +3009,11 @@ static const char *find_hci_method(acpi_handle handle)
 	return NULL;
 }
 
+static void toshiba_acpi_singleton_clear(void *data)
+{
+	toshiba_acpi = NULL;
+}
+
 static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 {
 	struct device *parent = &acpi_dev->dev;
@@ -3035,6 +3037,13 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	dev = devm_kzalloc(parent, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
+
+	ret = devm_add_action_or_reset(parent,
+				       toshiba_acpi_singleton_clear,
+				       NULL);
+	if (ret)
+		return ret;
+
 	dev->acpi_dev = acpi_dev;
 	dev->method_hci = hci_method;
 	dev->miscdev.minor = MISC_DYNAMIC_MINOR;
-- 
2.30.2

