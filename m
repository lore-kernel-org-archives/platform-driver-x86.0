Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8216EE8FDDB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Oct 2023 09:08:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbjJDJIc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Oct 2023 05:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232862AbjJDJIb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2023 05:08:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BB9AB;
        Wed,  4 Oct 2023 02:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696410508; x=1727946508;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=fAUM8alFJUoFD0L1PilxEectH45w085cL5dpLF0qjIw=;
  b=H2Eb2BMt52irZBA9r5CeUZQOYsR0TDbcYbi2KnCbr7nfiXwVk2HARt4j
   7bQWZUFQ5QcG0SdEtRjW58S1hk5QNey9kVODIKPQo8BBBd38EkTTqE4tq
   wWw+M8UNZbK25v0E8tMKgCHk1fGmzhX3rdhP29lvevOqJeCp0cpHoLSnf
   F4USzLjk9aB9Dlqs2p0nbBclNfJLw03epMR/1Xt/iJtczjCj41a7Scitr
   qeaZh9M3v6EGhld8AwtgwjISR3Cv9jByHI09DVOKaZZRNL97W8Hyx9zMk
   lAQSVO0xwTbQYRytQdRFxv+cJaurFrvq4vR3BfppX0kGQnfdDLCmBOUfw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="368164241"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="368164241"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 02:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="998377524"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="998377524"
Received: from tkloeffe-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.41.8])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 02:08:24 -0700
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org,
        andriy.shevchenko@linux.intel.com,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231003163234.1856669-1-srinivas.pandruvada@linux.intel.com>
References: <20231003163234.1856669-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2 0/4] Minor SST optimizations
Message-Id: <169641049875.4049.6261718802541163335.b4-ty@linux.intel.com>
Date:   Wed, 04 Oct 2023 12:08:18 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 03 Oct 2023 09:32:30 -0700, Srinivas Pandruvada wrote:

> Contains some minor changes to use SST for non dynamic use cases
> for display purpose and remove hardcoded size for map.
> 
> v2
> Update commit description, no code change
> Added a new patch which was independent before
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

Once I've run some tests on the review-ilpo branch the patches
there will be added to the platform-drivers-x86/for-next branch
and eventually will be included in the pdx86 pull-request to
Linus for the next merge-window.

The list of commits applied:
[1/4] platform/x86: ISST: Use fuse enabled mask instead of allowed levels
      commit: da4082841ccf022beae73e63d3f476f59777172b
[2/4] platform/x86: ISST: Allow level 0 to be not present
      commit: a22d36eb5b150913325640cb793e13e08d1bd715
[3/4] platform/x86: intel_speed_select_if: Remove hardcoded map size
      commit: 7525cea3ef9384054a30f25ebb501234befecdcb
[4/4] platform/x86: intel_speed_select_if: Use devm_ioremap_resource
      commit: 23f392ea6d1916f68be8067e2a038ef9a746a94b

--
 i.

