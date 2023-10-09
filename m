Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF32E95A8E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 12:09:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346440AbjJIMJw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 08:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346308AbjJIMJw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 08:09:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55786CF
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 05:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696853390; x=1728389390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=faPwkHTKJaCAvJ4EjbcRsAw/jpbnKMja67sPeIk7sJw=;
  b=PmGdBHWL8QSMYWcM65Mt2TyJ0gD6mJEp9z+kbZRg8PsPsNGdzXUX3Zxc
   POAM0ipkB0M6CjQXhEHneD3N61BEw62tpyEryeTtNy5Ij/HJOxhOVT4Y9
   lQ4CKHw4PoUl29kbd+Cx/nhhP0GzF72DjMX+TYI4jd7lxgsvbd/0dYqDt
   Z0cnRwuznnvm6XmRMy//UGoSgN/VUH9rnHOF7BJMo5GfPcZJ7srFpeRht
   KkKLEYwghtoYp678+jADNKDve+J76BRmkmUyiAPkT8aM6IvQXplGfb/Oi
   JCocsCkWrIIc6G4IURicqXWqr3xUHezmjVdr1yaPlbPKrqs7pLbMJQHnC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="384001364"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="384001364"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:09:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="746650941"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="746650941"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:09:42 -0700
Date:   Mon, 9 Oct 2023 15:09:40 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Vadim Pasternak <vadimp@nvidia.com>, christophe.jaillet@wanadoo.fr,
        platform-driver-x86@vger.kernel.org
Subject: [GIT PULL] Fixes in the mellanox init branch due for v6.6.
Message-ID: <c51fd7a6-a843-1c83-fa3b-f5dd104cf3ad@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-mellanox-init-v6.6

for you to fetch changes up to 7ec4cd3c1a12dc08c60d5e376c2c05aae23f1e41:

  platform: mellanox: Fix a resource leak in an error handling path in probing flow (2023-10-06 16:40:35 +0300)

----------------------------------------------------------------
Fixes in the mellanox init branch due for v6.6.

platform-drivers-x86-mellanox-init-v6.6: v6.6-rc1 + fixes in
the platform-drivers-x86-mellanox-init branch to avoid a feature
conflict during the v6.7 merge window.

----------------------------------------------------------------
Vadim Pasternak (1):
      platform: mellanox: Fix a resource leak in an error handling path in probing flow

 drivers/platform/x86/mlx-platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
