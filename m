Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3949ECDB46E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Oct 2023 14:12:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbjJLOMO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Oct 2023 10:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234008AbjJLOMN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Oct 2023 10:12:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6EBB8
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Oct 2023 07:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697119932; x=1728655932;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ygQAs4yOCyYAtiyrVlNzmhUaY0B4YIE06sEWsgUYS1Y=;
  b=HCVocUNnJrT/kBSe3qfRF3vXMuvS829j31807IUZh1fuuVL+L3H0fPHK
   GBFcEr+RlBFi8MlQCg79e+Dz/VeVdtAHVtB3bi8H7OKw3xAs9nX5Y/kG7
   DOCcHsw/Vsroc8rtXWuMzxPDDwjbulOncyinYXHdiX2FcM6+I9t3RrXbC
   yC/yddc3GhrLFDsj6qUhdMWyTTo7vjHpMxM4dpqh3F4C4d7CLRhAfJRTN
   yM8yeqYWcHnN6kbX0lyJuREmrhOGotutt9rPnFjghFKLsrc8PhPEbw6kB
   54yJ2yIrKGab6SIJTPmnMMFTQHjyrPXtOXZwpiBZznOrnmSqkVhhA8chK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="365198291"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="365198291"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 07:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001555010"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="1001555010"
Received: from asroczyn-mobl.ger.corp.intel.com ([10.249.36.107])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 07:12:06 -0700
Date:   Thu, 12 Oct 2023 17:12:04 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Suma Hegde <suma.hegde@amd.com>
cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v5 2/3] platform/x86/amd/hsmp: add support for metrics
 tbl
In-Reply-To: <20231010120310.3464066-2-suma.hegde@amd.com>
Message-ID: <502950d-de51-85d4-1957-94ce7b99243a@linux.intel.com>
References: <20231010120310.3464066-1-suma.hegde@amd.com> <20231010120310.3464066-2-suma.hegde@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 10 Oct 2023, Suma Hegde wrote:

> AMD MI300 MCM provides GET_METRICS_TABLE message to retrieve
> all the system management information from SMU.
> 
> The metrics table is made available as hexadecimal sysfs binary file
> under per socket sysfs directory created at
> /sys/devices/platform/amd_hsmp/socket%d/metrics_bin
> 
> Metrics table definitions will be documented as part of Public PPR.
> The same is defined in the amd_hsmp.h header.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

I've applied this series to review-ilpo branch. In this patch 2/3 I made 
the following tweaks:

- lseek -> lseek()
- dram -> DRAM in dev_err()
- Added a period to terminate a documentation sentence


-- 
 i.
