Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C43E95A9B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 15:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376839AbjJIPja (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 11:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376690AbjJIPj3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 11:39:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C438F
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 08:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696865968; x=1728401968;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FyfilAfnmgV5dcey72LyGChgMLd0EbWHLSWFFZn2lzU=;
  b=lFIXndflD8oAjrJXoyjJvdP3mfOX/aqAQ3gHnjy+VIsZ71E55nm1fPgZ
   jHhtH4gFBDLw0LZKkjskMlh+j6/TZj8WdEfdPvgZmlq1dNCB5i9bg8mAq
   17JFomCdo3XuxrMIIsx+j2ndk9aUSnCezfAF8Slq9Z7JDdIXpEh5drr/e
   uJuXAieTrsQNHWJ2Zisj7D49bF7LljNl7Ov09o0Hx8RHL89De/UyuFScW
   OJAFCL8tXmLEp50vmCyQr9VHI98MRnGuYaQVEjYerAnVJsI2rbArJkYj0
   r62Fa2HTKlEZfoOlhJlTa/fKRWrPMaxrjRA4qf83KzpEd4ISfMIBpe+DM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="383048684"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="383048684"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 08:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="788214764"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="788214764"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 08:39:25 -0700
Date:   Mon, 9 Oct 2023 18:39:23 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86/amd/pmc: Move structures to pmc
 header
In-Reply-To: <20231009144748.24054-2-Shyam-sundar.S-k@amd.com>
Message-ID: <95a0ef77-ea2-a698-9ba7-3049195c7481@linux.intel.com>
References: <20231009144748.24054-1-Shyam-sundar.S-k@amd.com> <20231009144748.24054-2-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 9 Oct 2023, Shyam Sundar S K wrote:

> As we have a separate header for amd_pmc driver, move the common strutures,
> enums, and macros to the header file.
> 
> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

> +#define RESPONSE_REGISTER_LOOP_MAX	20000

This is borderline, I'd add prefix for this.

> +#define DELAY_MIN_US		2000
> +#define DELAY_MAX_US		3000
> +#define FIFO_SIZE		4096

These look way too generic names when they are now disconnected from the
code using them, not that DELAY_* ever was a good name for anything :-).

> +enum amd_pmc_def {
> +       MSG_TEST = 0x01,
> +       MSG_OS_HINT_PCO,
> +       MSG_OS_HINT_RN,
> +};

I suggest you consider adding a prefix for these too.


-- 
 i.

