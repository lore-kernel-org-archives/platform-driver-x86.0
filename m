Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F80C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Dec 2021 16:30:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243295AbhLJQdo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Dec 2021 11:33:44 -0500
Received: from mga01.intel.com ([192.55.52.88]:57397 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235118AbhLJQdn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Dec 2021 11:33:43 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="262486337"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; 
   d="scan'208";a="262486337"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 08:30:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; 
   d="scan'208";a="480773263"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 10 Dec 2021 08:30:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4DEC615C; Fri, 10 Dec 2021 18:30:12 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        "Luke D. Jones" <luke@ljones.dev>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] platform/x86: asus-wmi: Split MODULE_AUTHOR() on per author basis
Date:   Fri, 10 Dec 2021 18:30:08 +0200
Message-Id: <20211210163009.19894-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211210163009.19894-1-andriy.shevchenko@linux.intel.com>
References: <20211210163009.19894-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There are as many as needed MODULE_AUTHOR() macro entries allowed
in the single driver. Split author list to a few macro entries.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/asus-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 30e0de9e0d81..c3e0394aa5f0 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -43,8 +43,8 @@
 
 #include "asus-wmi.h"
 
-MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>, "
-	      "Yong Wang <yong.y.wang@intel.com>");
+MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>");
+MODULE_AUTHOR("Yong Wang <yong.y.wang@intel.com>");
 MODULE_DESCRIPTION("Asus Generic WMI Driver");
 MODULE_LICENSE("GPL");
 
-- 
2.33.0

