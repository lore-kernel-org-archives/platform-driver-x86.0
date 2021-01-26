Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_RED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8809BC433E9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jan 2021 07:01:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DB372072C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jan 2021 07:01:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S317064AbhA0BB3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 20:01:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21796 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731821AbhAZUWR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jan 2021 15:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611692450;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=jATotaGE+hSh+3mGFMkEjOKVbXsGU1PRlNTu8+Q++EM=;
        b=Km5laBsOG4DiPMBKt0qoagdaRJCeTRtksKxdk3CVU1DVAZLDJ2Ni6OemZ/Jl61Pcs/QxQF
        t8xBaR7Hr4Q00ROGYl17oG+H3FcudKDaD6IGzT/GEWLshpkqMaLWus1cj6TtyrAInCript
        0vZ0QOKuw2RG0hyz4p25IJ8njbkr9RA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-3b7Qg854MVS01qB7KN05LA-1; Tue, 26 Jan 2021 15:20:46 -0500
X-MC-Unique: 3b7Qg854MVS01qB7KN05LA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15E73801AB8;
        Tue, 26 Jan 2021 20:20:45 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-111.ams2.redhat.com [10.36.112.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 64BD119C46;
        Tue, 26 Jan 2021 20:20:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>
Subject: [PATCH] platform/x86: pmt: Make PMT Kconfig options depend on INTEL_PMT_CLASS
Date:   Tue, 26 Jan 2021 21:20:42 +0100
Message-Id: <20210126202042.95301-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Make the PMT Kconfig options depend on INTEL_PMT_CLASS instead of
selecting it. Select should only be used with hidden options and
INTEL_PMT_CLASS is not hidden.

This will stop Kconfig from asking if INTEL_PMT_TELEMETRY and
INTEL_PMT_CRASHLOG should be enabled after the user says no
to the INTEL_PMT_CLASS prompt.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9a73e7baa344..d4f32fc0e40e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1383,7 +1383,7 @@ config INTEL_PMT_CLASS
 
 config INTEL_PMT_TELEMETRY
 	tristate "Intel Platform Monitoring Technology (PMT) Telemetry driver"
-	select INTEL_PMT_CLASS
+	depends on INTEL_PMT_CLASS
 	help
 	  The Intel Platform Monitory Technology (PMT) Telemetry driver provides
 	  access to hardware telemetry metrics on devices that support the
@@ -1394,7 +1394,7 @@ config INTEL_PMT_TELEMETRY
 
 config INTEL_PMT_CRASHLOG
 	tristate "Intel Platform Monitoring Technology (PMT) Crashlog driver"
-	select INTEL_PMT_CLASS
+	depends on INTEL_PMT_CLASS
 	help
 	  The Intel Platform Monitoring Technology (PMT) crashlog driver provides
 	  access to hardware crashlog capabilities on devices that support the
-- 
2.29.2

