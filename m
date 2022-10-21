Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC0DFA3741
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 Oct 2022 20:40:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiJUUko (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 21 Oct 2022 16:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJUUkQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Oct 2022 16:40:16 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C78846202;
        Fri, 21 Oct 2022 13:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666384805; x=1697920805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DyrS883OR7AFX4gN5EeEXTzT5dUJ/TdR0BLm14KTOTM=;
  b=OV1x9cnGuoy4TAKKkfdW8ht+2nXop3GUIXELd20HW4NKv153gdZtbaLY
   dqpgU6qxPBL4C8ZKxvLVUiwSonRaOV/Lask/QZHWM1zo/XU9Je9JUU4Jp
   VkScV0blhn6lRmvZeZOoOffylE0b+MSp9omHtFKDohuqOLDiZy80eSsLD
   t3toA5MPw1D/o4V0u4UvPm2/bDXm1otV66X5RxxyRN9JOUAR0ClfPTTfR
   YJ5OHMssuZQ8ltLgEGO56JJ+2yWTtaAa+Pf+m7nr88l5oUXM5pR0w4ZBu
   fidLYpDRVnW/NnoDUf6ObKXRkQBN7zg1JNKL1K6qNQBGDAwT01YAG76Rf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="369161193"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; 
   d="scan'208";a="369161193"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 13:35:37 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="735701050"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; 
   d="scan'208";a="735701050"
Received: from jithujos.sc.intel.com ([172.25.103.66])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 13:35:37 -0700
From:   Jithu Joseph <jithu.joseph@intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        gregkh@linuxfoundation.org, jithu.joseph@intel.com,
        ashok.raj@intel.com, tony.luck@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev, ravi.v.shankar@intel.com,
        thiago.macieira@intel.com, athenas.jimenez.gonzalez@intel.com
Subject: [PATCH 14/14] Revert "platform/x86/intel/ifs: Mark as BROKEN"
Date:   Fri, 21 Oct 2022 13:34:13 -0700
Message-Id: <20221021203413.1220137-15-jithu.joseph@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021203413.1220137-1-jithu.joseph@intel.com>
References: <20221021203413.1220137-1-jithu.joseph@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Issues with user interface [1] to load scan test images
has been addressed, so the following can be reverted.
commit c483e7ea10fa ("platform/x86/intel/ifs: Mark as BROKEN")

Link: https://lore.kernel.org/lkml/26102aca-a730-ddf8-d024-2e7367696757@redhat.com/ [1]

Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>
---
 drivers/platform/x86/intel/ifs/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/intel/ifs/Kconfig b/drivers/platform/x86/intel/ifs/Kconfig
index 89152d46deee..3eded966757e 100644
--- a/drivers/platform/x86/intel/ifs/Kconfig
+++ b/drivers/platform/x86/intel/ifs/Kconfig
@@ -1,9 +1,6 @@
 config INTEL_IFS
 	tristate "Intel In Field Scan"
 	depends on X86 && CPU_SUP_INTEL && 64BIT && SMP
-	# Discussion on the list has shown that the sysfs API needs a bit
-	# more work, mark this as broken for now
-	depends on BROKEN
 	help
 	  Enable support for the In Field Scan capability in select
 	  CPUs. The capability allows for running low level tests via
-- 
2.25.1

