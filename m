Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFFE3C1419;
	Tue, 17 Mar 2026 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752700; cv=none; b=aU7GsKi3QcsV/wEzJvkIXiS4U7CQAmS4YYO3d6MpLVhsglt9pQdwN+V3V3vUgxSJkFEvpE7fADbW+kc/YlFBagNHrFQrJvOuHf48gzIuKbYmhUjbYSWPWinP5TcjOhDjsWq/RiRX6R4ytFrtXpMz5PcYa4TR7rRlvEQmetgthgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752700; c=relaxed/simple;
	bh=09AQlTrgM8e6eHy+BpgxlQzXGuGho2uBwdGDzw+HGxE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GipwROe93BA5eEWoWKzZgZsFPszpgCGA/AKoQpf4RC2jJ8Q6TOLglEcT4k8QK6O+gGFFNpok37kZn/jFK0hHytNzNv3Vre+C9Zq5JgjS+EzIBGt1aaMjneLdTFrWraxF0oeyPcph2NobjqplRspf5Wc/PeWztr/ITkyLGcq0nbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWB4x9hI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWB4x9hI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752699; x=1805288699;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=09AQlTrgM8e6eHy+BpgxlQzXGuGho2uBwdGDzw+HGxE=;
  b=hWB4x9hIyDESgd7aaPcK2nzvoacmjHK4khMNHLfZdu/tc45E260n3HOC
   GC4NQG0smF3Yvc5IRAiOn7Uee9+/oSOMZ04NfsqbCz8Pb8zai8oyk67UY
   GFzalM+1phL8HPeEC7nPoEj3wnpFlyBEMtj1VoaSBctDzbXj/cEo39cnt
   YPcXn4W+KbmCMnBOhqZj8D5lnqOZWOBAqVA0OYciGqC93nINQY/ajdmw6
   R9QtLzg/pd8j4HVxIDJeikfMSPfQtQshx2HKpP49OjUrNaVpt9bAdKuRl
   U80lgUBaFjI4sgWoUQl5lGT/zvQQIJVl/MUqu6iihnkux02E5HMbzLtjf
   Q==;
X-CSE-ConnectionGUID: 9pqUgoZYTK+S1SX9jgQe+w==
X-CSE-MsgGUID: 6vWyQT/eQnqmjeihGYjVpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74862647"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74862647"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:04:58 -0700
X-CSE-ConnectionGUID: cJ3pBbDIQW2uAPkbcsqD7w==
X-CSE-MsgGUID: hxGn0AmVSkiA7QJSR5ztwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222217042"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:04:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 17 Mar 2026 15:04:53 +0200 (EET)
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: ISST: Correct locked bit width
In-Reply-To: <20260304214255.1748163-1-srinivas.pandruvada@linux.intel.com>
Message-ID: <c3998aaa-75b5-bc03-ed7f-a82c0e6ea8cb@linux.intel.com>
References: <20260304214255.1748163-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Mar 2026, Srinivas Pandruvada wrote:

> SST-PP locked bit width is set to three bits. It should be only one bit.
> Use SST_PP_LOCK_WIDTH define instead of SST_PP_LEVEL_WIDTH.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> index b8cdaa233ea9..fa1726185d44 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> @@ -869,7 +869,7 @@ static int isst_if_get_perf_level(void __user *argp)
>  	_read_pp_info("current_level", perf_level.current_level, SST_PP_STATUS_OFFSET,
>  		      SST_PP_LEVEL_START, SST_PP_LEVEL_WIDTH, SST_MUL_FACTOR_NONE)
>  	_read_pp_info("locked", perf_level.locked, SST_PP_STATUS_OFFSET,
> -		      SST_PP_LOCK_START, SST_PP_LEVEL_WIDTH, SST_MUL_FACTOR_NONE)
> +		      SST_PP_LOCK_START, SST_PP_LOCK_WIDTH, SST_MUL_FACTOR_NONE)

Doesn't this warrant a Fixes tag?

-- 
 i.

