Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EF7D512
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 02:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713236186; cv=none; b=rjrwaIWK6o5V4U578TsZ9OBrIaEmBbQQBQcakMELToyRYMuq+O89F2YNkdkmuMaBUw2IiXM9YmI+tGVDsftyw/OhtVHeRc9SHBaiL88LAqfnG6eSAYCrfKUCXKPOsPW+UvGyIlOjqUx5lyqodL0SujJB4aXA8HaY8T4/6Lk/emE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713236186; c=relaxed/simple;
	bh=oL1Lz3XCJH4682IXRrccnwIYnE2gV0k84WL59InrnC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBd4xKDiU51RbGJVe1IYERScjd3fNbh/dZMfIoQn/Q+/0TNREh7JO6fM7uRQ7rZ6DfFAB37cPpdSI1T2+UY7XlGWUnr7QdpkLSXB1h61mdQICHXbS2FQbm6qUgCOzl6U0kft8euur83tgb/gBZHxeHF+9W5RQKdeQHq+u0r6U5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eaq3/LQj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eaq3/LQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713236185; x=1744772185;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oL1Lz3XCJH4682IXRrccnwIYnE2gV0k84WL59InrnC0=;
  b=eaq3/LQjZwM7jbBO5g6D6VbK823SHWCStN1PvMN5U1J1R1hsJXOJpM1m
   Y09ZGHh/C6SFf+fknvOVTgQUowzHIS/ncRIsYWx7O0TNWCw+XHZh3veUB
   t9RRH6Ju6vQTAIFHuCwHXo8Kc6S8kX3WJcLL+Tz+uuZ5dWwc1AifV9ASR
   gYdcTnwPw5n5r6FJX7JXBJzYNS+O2u1Up/35Tix7iQfownyC+yDp+AXi6
   UDmN22DjWaKN5lSC6HimnqdfPzYyS7SRKws1PuLvjeCY/2YjQcVUayY2s
   ZNeRcIAjHepuxARwbWnCgawFT7zH0bVMEmGUC+C0W3kDVGx6lZ5ajmnu2
   g==;
X-CSE-ConnectionGUID: M5noaywMQH6/DOGClDCKaw==
X-CSE-MsgGUID: hhRyxOybREmdx25X1kM7cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8572561"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8572561"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 19:56:23 -0700
X-CSE-ConnectionGUID: s47MuQHnRKKDIU0/NFxPpQ==
X-CSE-MsgGUID: cY1qbWOtRWK07Eo2GH3oqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="22186592"
Received: from garumuga-mobl1.amr.corp.intel.com (HELO [10.209.93.175]) ([10.209.93.175])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 19:56:22 -0700
Message-ID: <bacf2247-a91f-4cad-ab83-26f99cad7470@linux.intel.com>
Date: Mon, 15 Apr 2024 19:56:21 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] platform/x86/amd/pmc: Fix implicit declaration
 error on i386
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, Shyam-sundar.S-k@amd.com,
 platform-driver-x86@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20240416025312.731809-1-Basavaraj.Natikar@amd.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240416025312.731809-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 4/15/24 7:53 PM, Basavaraj Natikar wrote:
> Add depended header file to fix error on i386 due to implicit declaration
> of function ‘writeq’.
>
> Fixes: 2dc77993cb5e ("platform/x86/amd/pmc: Add AMD MP2 STB functionality")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404160320.QAHyZ0c3-lkp@intel.com/
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---

LGTM

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>  drivers/platform/x86/amd/pmc/mp2_stb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/amd/pmc/mp2_stb.c b/drivers/platform/x86/amd/pmc/mp2_stb.c
> index dfa55327e5f1..9775ddc1b27a 100644
> --- a/drivers/platform/x86/amd/pmc/mp2_stb.c
> +++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
> @@ -11,6 +11,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/iopoll.h>
>  #include <linux/pci.h>
>  #include <linux/sizes.h>

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

