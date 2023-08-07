Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D212C001B0
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Aug 2023 15:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjHGP4Y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Aug 2023 11:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjHGP4X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Aug 2023 11:56:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3720F0;
        Mon,  7 Aug 2023 08:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691423782; x=1722959782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=udsAEu9C41dvA0CswFSJhLFhNgvz1he+2g/uOtdU38Y=;
  b=nkrbVUn1NPyvTBU38sHTs9MTkQKz1hyxCJXXdrqlLUwDFQKbwqrdIIMP
   Dd/cubs5Acw42DKbeqFNj6jF+QEMjn7mDqQiP7f2AkZ2IbSgFNbch8dcd
   jiwxec9VBDbsqawMYKIkqeXAEpUEI0KK4WrqbKdMQvRAUxCMyKnRtkp4i
   b8Ud+4WLQPX2uVHn2Ybfhk2pSs8ffeaQrry+NSf9j1C2EGzgK4tqZ2XtJ
   tGkCJrqhcPEDzOsJwYEQZcShpNQHz9OG8lbZw0tnn/SuRS+Aj3mGuCbsP
   zVQ5zOdpvwB4LoKn+1i61JNJlH1puyKpVG3uasX038otnEqaN35U8J2Kq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="456965930"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="456965930"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 08:56:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="724559351"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="724559351"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 07 Aug 2023 08:56:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qT2ac-000kTr-36;
        Mon, 07 Aug 2023 18:56:14 +0300
Date:   Mon, 7 Aug 2023 18:56:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     xingtong_wu@163.com
Cc:     ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
        markgross@kernel.org, xingtong.wu@siemens.com, lee@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        gerd.haeussler.ext@siemens.com, tobias.schaffner@siemens.com,
        lkp@intel.com
Subject: Re: [PATCH v2 1/2] platform/x86/siemens: simatic-ipc: fix logic
 error in BX-59A
Message-ID: <ZNEUHo0fR280O4mN@smile.fi.intel.com>
References: <7196d4b9-34fe-4a18-863b-65d07c4a348c@linux.intel.com>
 <20430731173026.2631-1-xingtong_wu@163.com>
 <20430731173026.2631-2-xingtong_wu@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20430731173026.2631-2-xingtong_wu@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Aug 01, 2043 at 01:30:26AM +0800, xingtong_wu@163.com wrote:
> From: "xingtong.wu" <xingtong.wu@siemens.com>
> 
> The variable "ledmode" is missing from if statement that leads to
> a logical error. Add the missing variable to the if condition.
> 
> Fixes: b8af77951941 ("platform/x86/siemens: simatic-ipc: add new models BX-56A/BX-59A")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307312322.Aa8upHWK-lkp@intel.com/

> 

Blank lines are not allowed in the tag block.

> Signed-off-by: xingtong.wu <xingtong.wu@siemens.com>

-- 
With Best Regards,
Andy Shevchenko


