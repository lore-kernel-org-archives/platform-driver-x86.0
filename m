Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4121E4AB;
	Wed, 22 Jan 2025 13:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737553345; cv=none; b=bA/GHE1gyVtvoi0th7iIcX5WNwihcElZlAD4wfCNT4T4VoQBtnWC6eRcB4qvWSOkm4370W/K6ssN/0MEK1lqgw0nTV8qUhhY7HzEE16q13BhmjUBFytZW4jz39Rqlx5No2hhwuqUkrSDOz4kgwcJw7p7gJiNtNOtkb676ArQMzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737553345; c=relaxed/simple;
	bh=SXy33tsJ/rzaOVEDdS65atSF2bC1XFU19Y+BYJ3leNM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VDd7Iu3BqenWvSTbxiobcUTiSZO5RaIRb/QghIs5bYUah90ZWCiLobyfFURXtKDFqLq6QbLndaBVVh+0Kox1Hve7ElhZYSFjMgNdpIVypZR/RdHfvIHb1pF+x9uJrWTmqqxmNabNz+XjiLsEJXYBRJFSP0ligGPx05UhhjjszD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbwsCXXS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbwsCXXS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737553343; x=1769089343;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SXy33tsJ/rzaOVEDdS65atSF2bC1XFU19Y+BYJ3leNM=;
  b=KbwsCXXS5Bpaazvh0i3pR2EYjANn+0oO1oaTjYnVUQXP8b+Ny+wfdJy0
   Jnn7AKtDBsQQs5ELiJrTGsCtdeiSOa1fsoVOxbilJBs7TAI82DR46IP6I
   BD85qJjTqG4kHZ8E7el0efBI4a44Pr/aFOJCFuLEvIPvk0VW2zSjcSdM5
   /1X+pnRk32VzUXX4gF6GUQFB9bg5h8R7Qkj+pA7+YpBS9aiDTAjlmSYC8
   emrMUvl0PD3ebqBhZsyP64bbaBp6yKx0dTYcZ5MzFFRKYddC/qQZPj646
   yvSa+V5bEniyNA5KLDbKE/u++XBIPhseQwd8ziMDKzcAXuHU3Vn4RqJs/
   g==;
X-CSE-ConnectionGUID: /4oQqCoSQoSua15215zWQg==
X-CSE-MsgGUID: cnYu+5r1SDyxSDMN/XBY6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49421959"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49421959"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 05:42:22 -0800
X-CSE-ConnectionGUID: uGzm6ZSXQlKTMtDpghJ1qQ==
X-CSE-MsgGUID: p2Ht3cgDR5OTlrb58XKMOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="107250922"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.141])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 05:42:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 22 Jan 2025 15:42:15 +0200 (EET)
To: Anisse Astier <anisse@astier.eu>
cc: jithu.joseph@intel.com, ashok.raj.linux@gmail.com, 
    Hans de Goede <hdegoede@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, tony.luck@intel.com
Subject: Re: [PATCH v2] platform/x86/intel/ifs: Update documentation to match
 current availability of firmware images
In-Reply-To: <20250121183930.182315-1-anisse@astier.eu>
Message-ID: <894eda78-d942-22a7-2349-b70ac3a9f836@linux.intel.com>
References: <928769f4-081c-4655-ad8a-f7b65ea21749@intel.com> <20250121183930.182315-1-anisse@astier.eu>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 Jan 2025, Anisse Astier wrote:

> Firmware images necessary for certain tests in the In-field scan[1] test
> suite are not available at the moment[2], and require having access to
> at least an Intel customer account[3].
> 
> Update documentation to match current state, it can be updated again
> when the images are finally published.
> 
> [1] https://www.intel.com/content/www/us/en/support/articles/000099537/processors/intel-xeon-processors.html
> [2] https://cdrdv2.intel.com/v1/dl/getContent/826383?explicitVersion=true
> [3] https://www.intel.com/content/www/us/en/secure/design/confidential/software-kits/kit-details.html?kitId=815180
> 
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> ---
> Changes since v1:
>  - update commit message to clarify that only some tests need the firmware
>    images, thanks Jithu for the suggestion!
> 
> Regards,
> 
> Anisse
> ---
>  drivers/platform/x86/intel/ifs/ifs.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/ifs/ifs.h b/drivers/platform/x86/intel/ifs/ifs.h
> index 5c3c0dfa1bf8..9a7ad9cc9d08 100644
> --- a/drivers/platform/x86/intel/ifs/ifs.h
> +++ b/drivers/platform/x86/intel/ifs/ifs.h
> @@ -23,9 +23,11 @@
>   * IFS Image
>   * ---------
>   *
> - * Intel provides a firmware file containing the scan tests via
> - * github [#f1]_.  Similar to microcode there is a separate file for each
> - * family-model-stepping. IFS Images are not applicable for some test types.
> + * As of early 2025, Intel provides the firmware files containing the scan tests
> + * to select customers [#f1]_. When this driver was merged in 2022, it was
> + * announced that firmware files would be available via github [#f2]_. Similar
> + * to microcode there is a separate file for each family-model-stepping. IFS
> + * Images are not applicable for some test types.
>   * Wherever applicable the sysfs directory would provide a "current_batch" file
>   * (see below) for loading the image.
>   *
> @@ -125,7 +127,8 @@
>   * 2) Hardware allows for some number of cores to be tested in parallel.
>   * The driver does not make use of this, it only tests one core at a time.
>   *
> - * .. [#f1] https://github.com/intel/TBD
> + * .. [#f1] https://www.intel.com/content/www/us/en/support/articles/000099537/processors/intel-xeon-processors.html
> + * .. [#f2] https://github.com/intel/TBD
>   *
>   *
>   * Structural Based Functional Test at Field (SBAF):
> 

Thanks for the update. My intention is to apply this patch though the 
fixes branch towards the end of the -rc cycle if those images are not 
available by then.

-- 
 i.

