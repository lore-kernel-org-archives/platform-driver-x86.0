Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA073C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Nov 2022 04:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239145AbiKQEBY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Nov 2022 23:01:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238955AbiKQEBC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Nov 2022 23:01:02 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C554FF8D;
        Wed, 16 Nov 2022 20:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668657662; x=1700193662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EtYtqZMiGDkYTtbAS2nrgHVe2sA1SvP2kavBie+6b6s=;
  b=km1EZE/aXwM6C5cThVqqrxSyXCF63AWsH05X282RxoSxvBH/iDmu0v/E
   0bQf7ui7/56sO56VTzhGBDxiR+9hG0VxJPv3pWmi/sA6DU8RA+6mxIB10
   N/EyblNR/Jb2437GNIECmRlX5ylScC+qD7h31PsM/RCPLp8rcy+DaP7Rl
   Sa5QKx55CcAHtdS8za/CTKMZuM/PTdLhcVT/PkU4pRiBroZgtWknAa0DX
   hTHXZnU+C8a9aKctHd9h+PDKwBxd3sldWkIA+ZGlDG6oh5DYJKEMEW0rL
   e6JPvQ8shtLvPtSUgXH5fgjygVEuW5nYRPs6zMMSiqxhstGeY/r8eFGAk
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="292455994"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="292455994"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 20:01:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="590462731"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="590462731"
Received: from jithujos.sc.intel.com ([172.25.103.66])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 20:01:01 -0800
From:   Jithu Joseph <jithu.joseph@intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        gregkh@linuxfoundation.org, jithu.joseph@intel.com,
        ashok.raj@intel.com, tony.luck@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev, ravi.v.shankar@intel.com,
        thiago.macieira@intel.com, athenas.jimenez.gonzalez@intel.com,
        sohil.mehta@intel.com
Subject: [PATCH v3 16/16] Revert "platform/x86/intel/ifs: Mark as BROKEN"
Date:   Wed, 16 Nov 2022 19:59:35 -0800
Message-Id: <20221117035935.4136738-17-jithu.joseph@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117035935.4136738-1-jithu.joseph@intel.com>
References: <20221107225323.2733518-1-jithu.joseph@intel.com>
 <20221117035935.4136738-1-jithu.joseph@intel.com>
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
Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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

