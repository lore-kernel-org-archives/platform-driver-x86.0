Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BC8E743FF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Sep 2023 20:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbjI2Upa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Sep 2023 16:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233820AbjI2Up2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Sep 2023 16:45:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D696E1AA;
        Fri, 29 Sep 2023 13:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696020324; x=1727556324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EDSMQlWhSsxLzFyBq31WH4okGSdNULRVmIbq83ubD4s=;
  b=h07fzZqOZXqSnSBiO1e0ijIVjUcHmmL1l6t/cljlNsuV7r9M+cs5S8Nc
   HkGhEkak3d6NWmx01831l9QT7ci5M7u9/Hh9NHhbxB6+PLLRnQt17y96O
   a+nOGJYA3KWIHJbv3T2jWGv+jQfzUCyysOdvezSZapm4KTEBcreeJTDlt
   ioWkiVZWLxVlRG840kTEmZaU0LEHyCIOECPkBnPGnGxUGfma+cnFWtqAz
   7qDFA2QK9k/8jV8axHRcTZUmnXyV+kHjAwTkKWrqrJCkAWqtjrmelWKRt
   5SDNqi+Z7Y2lZUo3izyrSalElofqGk6QIi9pkGlgN4UIpjjWRdBuJCC/a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="468654479"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="468654479"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 13:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="893539256"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="893539256"
Received: from jithujos.sc.intel.com ([172.25.103.66])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 13:27:30 -0700
From:   Jithu Joseph <jithu.joseph@intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        rostedt@goodmis.org, jithu.joseph@intel.com, ashok.raj@intel.com,
        tony.luck@intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, patches@lists.linux.dev,
        ravi.v.shankar@intel.com, pengfei.xu@intel.com,
        ilpo.jarvinen@linux.intel.com
Subject: [PATCH v3 7/9] platform/x86/intel/ifs: Add new CPU support
Date:   Fri, 29 Sep 2023 13:24:34 -0700
Message-Id: <20230929202436.2850388-8-jithu.joseph@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230929202436.2850388-1-jithu.joseph@intel.com>
References: <20230922232606.1928026-1-jithu.joseph@intel.com>
 <20230929202436.2850388-1-jithu.joseph@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add Granite Rapids(GNR) and Sierra Forest(SRF) cpuids to x86 match table
so that IFS driver can be loaded for those.

Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Tested-by: Pengfei Xu <pengfei.xu@intel.com>
---
 drivers/platform/x86/intel/ifs/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/intel/ifs/core.c b/drivers/platform/x86/intel/ifs/core.c
index 4ff2aa4b484b..0c8927916373 100644
--- a/drivers/platform/x86/intel/ifs/core.c
+++ b/drivers/platform/x86/intel/ifs/core.c
@@ -18,6 +18,9 @@
 static const struct x86_cpu_id ifs_cpu_ids[] __initconst = {
 	X86_MATCH(SAPPHIRERAPIDS_X),
 	X86_MATCH(EMERALDRAPIDS_X),
+	X86_MATCH(GRANITERAPIDS_X),
+	X86_MATCH(GRANITERAPIDS_D),
+	X86_MATCH(ATOM_CRESTMONT_X),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, ifs_cpu_ids);
-- 
2.25.1

