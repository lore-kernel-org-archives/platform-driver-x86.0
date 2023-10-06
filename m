Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51758E81E04
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Oct 2023 14:55:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbjJFOzo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Oct 2023 10:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232506AbjJFOzn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2023 10:55:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44158F
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 Oct 2023 07:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696604142; x=1728140142;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3T4VAuH/h5ow20mDcWbZtlnRJppUqHnckI9h5+d819U=;
  b=OtJ1bW/zeXDXND3xT+dLpiZjUycOScBtkosVqpfDPi19LaqWk/0mtcxT
   YZeyV3Zscdp+6zN2Pnv639X5bG/TJlfabrYktZ8x4yY4xRhV0WcyVyjbe
   Pj0hxwHJ12a2hj/abwXHajUQClO3fJmNste5iOnukM6f+HbZPcfhlFiRc
   +Eq34l2RuoI8zIhvFpuGMLDKlOqs2QAb9HmoKvBnvaKDkz4uHxHb43uwm
   Sl5cygMk3904p/2Sn1EZLnmW4CmKfZh25DpLccYhCTJefXl+ZkC9Zmq52
   BExLBolJInOF5lfzy7XqgqcqPdoQFxWDuyEPDF9q1eXDi7lI26o3YwcsL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="381044693"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="381044693"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 07:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="999349100"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="999349100"
Received: from srab-mobl1.ger.corp.intel.com ([10.252.43.69])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 07:55:31 -0700
Date:   Fri, 6 Oct 2023 17:55:28 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Vadim Pasternak <vadimp@nvidia.com>
cc:     Hans de Goede <hdegoede@redhat.com>, christophe.jaillet@wanadoo.fr,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform 0/3] platform/x86: Add fixes and amendments for
 init()/exit() flows
In-Reply-To: <20231005075616.42777-1-vadimp@nvidia.com>
Message-ID: <c2aa7fdd-fa8a-9fac-7b4e-a09fe821aabc@linux.intel.com>
References: <20231005075616.42777-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 5 Oct 2023, Vadim Pasternak wrote:

> The patchset:
> - Fixes memory leak in error handling flow.
> - Add cosmetic changes - misspelling fix, better naming/
> 
> Patches #1: Fixes memory leak issue.
> Patch #2: Fix misspelling.
> Patches #3: Renames few routines for better naming convention.
> 
> Vadim Pasternak (3):
>   platform: mellanox: Fix a resource leak in an error handling path in
>     probing flow
>   platform: mellanox: Fix misspelling error in routine name
>   platform: mellanox: Rename some init()/exit() functions for consistent
>     naming

Thanks for the patches. I've applied these into 
platform-drivers-x86-mellanox-init branch and merged that into 
review-ilpo. (I decided to reorder the patches 2 and 3 though as it felt 
more logical ordering.)


-- 
 i.

