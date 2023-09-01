Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B438CA0FE1
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Sep 2023 06:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348342AbjIAGFA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 1 Sep 2023 02:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348340AbjIAGE7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 1 Sep 2023 02:04:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6086910CC;
        Thu, 31 Aug 2023 23:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693548295; x=1725084295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cft0NZX01jZWskmao0IZaX0TQTrymVnXyHFz/2cvU04=;
  b=NuUtxirpwI4HnP+A55v6Tpk4Nw/gfdQihL5fv0by4XjgNrAs1xDWTfGH
   aDebmMA1M/d3/pQHf3GdNzJ6MCTrPZ8MPzHD2SnNlUGPkAWLmrJKVeOB2
   HzeOkazY4fsg+L4qdYcEoFt8t3K+PpUzJzotLjQF6uulIFjqa9w1hjmfM
   fjCYPyS2I3DeK2Q/BMp3FkUniKTKfIjtEwA5mdagpbL56WvL1eB56Ythi
   WBK4s/3eq0btKpbfzTECtncebtHWLysA3q2iJZFnIngp+WpiOZi2wF4I6
   ektOl+IRBnxDFbkwKitx3cqMqueNBIM7msRdxwnBfLjXAti+4LREmIrlH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366372096"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="366372096"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 23:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805310003"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="805310003"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 31 Aug 2023 23:04:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 7DC2FDE; Fri,  1 Sep 2023 09:04:43 +0300 (EEST)
Date:   Fri, 1 Sep 2023 09:04:43 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH 2/3] platform/x86: intel_scu_ipc: Check status upon
 timeout in ipc_wait_for_interrupt()
Message-ID: <20230901060443.GU3465@black.fi.intel.com>
References: <20230831011405.3246849-1-swboyd@chromium.org>
 <20230831011405.3246849-3-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230831011405.3246849-3-swboyd@chromium.org>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Aug 30, 2023 at 06:14:02PM -0700, Stephen Boyd wrote:
> It's possible for the completion in ipc_wait_for_interrupt() to timeout,
> simply because the interrupt was delayed in being processed. A timeout
> in itself is not an error. This driver should check the status register
> upon a timeout to ensure that scheduling or interrupt processing delays
> don't affect the outcome of the IPC return value.
> 
>  CPU0                                                   SCU
>  ----                                                   ---
>  ipc_wait_for_interrupt()
>   wait_for_completion_timeout(&scu->cmd_complete)
>   [TIMEOUT]                                             status[IPC_BUSY]=0
> 
> Fix this problem by reading the status bit in all cases, regardless of
> the timeout. If the completion times out, we'll assume the problem was
> that the IPC_BUSY bit was still set, but if the status bit is cleared in
> the meantime we know that we hit some scheduling delay and we should
> just check the error bit.
> 
> Cc: Prashant Malani <pmalani@chromium.org>
> Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
