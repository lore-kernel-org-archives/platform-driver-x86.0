Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3CDC4338F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 22 Aug 2021 17:17:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 909046124B
	for <platform-driver-x86@archiver.kernel.org>; Sun, 22 Aug 2021 17:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhHVRSc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 22 Aug 2021 13:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhHVRSb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 22 Aug 2021 13:18:31 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0968AC061575
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Aug 2021 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=y1GjeQrXokt/xCkn7Adtu5VOWszTAwTkPhmfMKOcqxQ=; b=1u59dAm9jhTyVgMNO+Dp4q6jeT
        JhvmWPdRa6HBYjxdYpQ7WTaGVSMkEdrBI0MWLULSis0Nv4/ecFZAZZKuPcLiYTvCe86X1sgjxq2eS
        CI3/Ww9aasVzIsNhL3Tqy2CEv6fhM9gm+3mPn8S4Xk9flECDUJSyFNnNu1/yxlUwsphuy+S+eTVpt
        Mb+EukuDDUSedLerTt0QB0RTbT0EVuhHKNSeINx+IRXGjBtM3NiWTO3VN8zX98xvu9RolsH4lkPkb
        ZMidON5j3nETK7GWTNdwlZZV/GvfFJIYYTHh6wdNSey99tnmkyFXbCba0F/NHhXyXYiHBlMmIDfUm
        2NsVsiew==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mHr6N-00EOqX-Oi; Sun, 22 Aug 2021 17:17:43 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/mellanox: mlxbf-pmc: fix kernel-doc notation
Date:   Sun, 22 Aug 2021 10:17:42 -0700
Message-Id: <20210822171742.26921-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix kernel-doc warnings reported by the kernel test robot:

drivers/platform/mellanox/mlxbf-pmc.c:82: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Structure to hold attribute and block info for each sysfs entry
drivers/platform/mellanox/mlxbf-pmc.c:94: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Structure to hold info for each HW block
drivers/platform/mellanox/mlxbf-pmc.c:121: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Structure to hold PMC context info
drivers/platform/mellanox/mlxbf-pmc.c:148: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Structure to hold supported events for each block

Also fix typos in a few struct member names.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Aditya Srivastava <yashsri421@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Mark Gross <mgross@linux.intel.com>
Cc: Vadim Pasternak <vadimp@nvidia.com>
Cc: platform-driver-x86@vger.kernel.org
---
 drivers/platform/mellanox/mlxbf-pmc.c |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

--- linux-next-20210820.orig/drivers/platform/mellanox/mlxbf-pmc.c
+++ linux-next-20210820/drivers/platform/mellanox/mlxbf-pmc.c
@@ -79,7 +79,8 @@
 #define MLXBF_PMC_L3C_PERF_CNT_HIGH_VAL GENMASK(24, 0)
 
 /**
- * Structure to hold attribute and block info for each sysfs entry
+ * struct mlxbf_pmc_attribute - Structure to hold attribute and block info
+ * for each sysfs entry
  * @dev_attr: Device attribute struct
  * @index: index to identify counter number within a block
  * @nr: block number to which the sysfs belongs
@@ -91,7 +92,7 @@ struct mlxbf_pmc_attribute {
 };
 
 /**
- * Structure to hold info for each HW block
+ * struct mlxbf_pmc_block_info - Structure to hold info for each HW block
  *
  * @mmio_base: The VA at which the PMC block is mapped
  * @blk_size: Size of each mapped region
@@ -102,7 +103,7 @@ struct mlxbf_pmc_attribute {
  * @attr_event_list: Attributes for "event_list" sysfs files
  * @attr_enable: Attributes for "enable" sysfs files
  * @block_attr: All attributes needed for the block
- * @blcok_attr_grp: Attribute group for the block
+ * @block_attr_grp: Attribute group for the block
  */
 struct mlxbf_pmc_block_info {
 	void __iomem *mmio_base;
@@ -118,7 +119,7 @@ struct mlxbf_pmc_block_info {
 };
 
 /**
- * Structure to hold PMC context info
+ * struct mlxbf_pmc_context - Structure to hold PMC context info
  *
  * @pdev: The kernel structure representing the device
  * @total_blocks: Total number of blocks
@@ -127,7 +128,7 @@ struct mlxbf_pmc_block_info {
  * @block_name: Block name
  * @block:  Block info
  * @groups:  Attribute groups from each block
- * @sv_sreg_support: Whether SMCs are used to access performance registers
+ * @svc_sreg_support: Whether SMCs are used to access performance registers
  * @sreg_tbl_perf: Secure register access table number
  * @event_set: Event set to use
  */
@@ -145,7 +146,7 @@ struct mlxbf_pmc_context {
 };
 
 /**
- * Structure to hold supported events for each block
+ * struct mlxbf_pmc_events - Structure to hold supported events for each block
  * @evt_num: Event number used to program counters
  * @evt_name: Name of the event
  */
