Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFCCC43334
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Jul 2022 14:07:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiGJOHt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Jul 2022 10:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGJOHs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 10:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 19355BF4A
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 07:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657462066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=4vbL9jUGmPQC0Irg8dVSBSYzig/Un15Mw9GqYcI2bHA=;
        b=QHDUaxD3B42+5mTTz5ensRp0Li8kjeCfTXv4TncCJDPphcSCWkBlrAMHDeE1Eq3ZL913aG
        jXwFcxS/vI7gAvVNa69CjkKHOX/xtx9z8UwPfZDqUTVXn51pGMYo01O2TmaaQoJR5TC2v5
        pXQcbMx4dhCwDGPkmgKj7VlxPifFU30=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-szeUAhSxPrKYV3pFkm0cwQ-1; Sun, 10 Jul 2022 10:07:43 -0400
X-MC-Unique: szeUAhSxPrKYV3pFkm0cwQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 186108032F2;
        Sun, 10 Jul 2022 14:07:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.26])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BCB11400DFD4;
        Sun, 10 Jul 2022 14:07:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Jithu Joseph <jithu.joseph@intel.com>,
        Ashok Raj <ashok.raj@intel.com>,
        Tony Luck <tony.luck@intel.com>
Subject: [PATCH] platform/x86/intel/ifs: Mark as BROKEN
Date:   Sun, 10 Jul 2022 16:07:36 +0200
Message-Id: <20220710140736.6492-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

A recent suggested change to the IFS code has shown that the userspace
API needs a bit more work, see:
https://lore.kernel.org/platform-driver-x86/20220708151938.986530-1-jithu.joseph@intel.com/

Mark it as BROKEN before 5.19 ships, to give ourselves one more
kernel-devel cycle to get the userspace API right.

Link: https://lore.kernel.org/platform-driver-x86/20220708151938.986530-1-jithu.joseph@intel.com/
Cc: Jithu Joseph <jithu.joseph@intel.com>
Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Tony Luck <tony.luck@intel.com>
Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/ifs/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/intel/ifs/Kconfig b/drivers/platform/x86/intel/ifs/Kconfig
index 7ce896434b8f..c341a27cc1a3 100644
--- a/drivers/platform/x86/intel/ifs/Kconfig
+++ b/drivers/platform/x86/intel/ifs/Kconfig
@@ -1,6 +1,9 @@
 config INTEL_IFS
 	tristate "Intel In Field Scan"
 	depends on X86 && CPU_SUP_INTEL && 64BIT && SMP
+	# Discussion on the list has shown that the sysfs API needs a bit
+	# more work, mark this as broken for now
+	depends on BROKEN
 	select INTEL_IFS_DEVICE
 	help
 	  Enable support for the In Field Scan capability in select
-- 
2.36.0

