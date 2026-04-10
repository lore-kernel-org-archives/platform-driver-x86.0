Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7AA3DEFF0;
	Fri, 10 Apr 2026 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839519; cv=none; b=OgVm9L7sbYwq6ufO11W7qc4DqvP0i4h4r1iiUXjQJrn7y/5FSdPpx8kueOXDNVcfSBmeE6ri1sEcaTsMkb6dj9wo68syVUguIhgaSA12siBmji6/melkuJ/8Wqd2Vlh4AWhy0lEVouNAwWr5Mtebhvh07mgwTeZ6V6MyOHLaUFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839519; c=relaxed/simple;
	bh=iebonJuHvFg042ms+FI+l28SAD/bKabMw3GkJwVSyTU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=n4N/xYJVfcKXkaZKsyngAcWaP5+UNz0Atr0HrDkkq3utxDMJM3CaNA7BSaJiVhMe7C1hup28/gLkMFIe5P/3C19/f3Te4snlCfG4TXrfsvr58N9jIvTzx2IFc+SSIN6rlvr1oEwBpgLO8MFCQvl4djHrRrlEpqnDjkiZ84XmqF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKn2t4i2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKn2t4i2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775839518; x=1807375518;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iebonJuHvFg042ms+FI+l28SAD/bKabMw3GkJwVSyTU=;
  b=jKn2t4i2zU4U9YVARvlzFe6m1zCZ377EExkpteTnevWnOmh+zqeIoKO8
   TCGMSgBH7vW0R9CLhZcGWnDY7m7M+praTLKCStAamXVPlnGjR42Zlqk5d
   ITjqSVMt8w54mo5Q9JE+6UzsV85MxTomPB+U/wHszQ671qoHMnqSjGDyY
   P5/ExLBu+se6gzzsBjcZQrFiBr5LMDVUSf5R0Nsqw4ZANJnYC+wTKvLLw
   6ks8Pj0ls4018q6Up8Zvwb886r+VRdOimjq18WuMu2tBXNXwnSm4uNU0H
   mpBRVJ9apU0O/VEzoYBdB9dE+zNhTArlMNG8DYPoqIuDeHK5hTlQliZ53
   w==;
X-CSE-ConnectionGUID: 3WvXzHnRQdidwv4f/e5wTg==
X-CSE-MsgGUID: 5ZOI9kUsQSqak5sfpPVhRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87559294"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="87559294"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:45:17 -0700
X-CSE-ConnectionGUID: kKauNfjsTmCyDDjWlfkbcg==
X-CSE-MsgGUID: oe/UpOFMTki2mW1u4g8i/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="267103261"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.118])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:45:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Apr 2026 19:45:07 +0300 (EEST)
To: ShaunV334 <shaunvarghese43@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, plotnikovanton@gmail.com
Subject: Re: [PATCH] platform/x86: hp-wmi: add Omen 14-fb0xxx (board 8C58)
 support
In-Reply-To: <20260402095707.64881-1-shaunvarghese43@gmail.com>
Message-ID: <8fdf0092-c211-3dba-ccb5-96d30fad04d0@linux.intel.com>
References: <20260402095707.64881-1-shaunvarghese43@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Apr 2026, ShaunV334 wrote:

> Board 8C58 (HP Omen Transcend Gaming Laptop 14-fb0xxx) appears to use
> the same thermal profile handling as other supported Omen systems,
> including board 8E41.
> 
> Add it to omen_thermal_profile_boards so hp-wmi can expose the firmware
> thermal profiles through the platform_profile interface.
> 
> Tested on Omen 14-fb0xxx: the profile handler exposes cool, balanced,
> and performance modes, and selecting performance increases sustained CPU
> package power under load.
> 
> Link: https://lore.kernel.org/platform-driver-x86/20260203164832.40514-1-plotnikovanton@gmail.com/

Hi,

Thanks for the patch. This Link seemed unrelated?

> Signed-off-by: ShaunV334 <shaunvarghese43@gmail.com>

For signed-off lines (that imply certainly legal significance, see 
Documentation/process/submitting-patches.rst), please use your name here, 
not some odd nick identity.

> ---
>  drivers/platform/x86/hp/hp-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 988a0acc9622..3cd5679828d6 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -153,6 +153,7 @@ static const char * const omen_thermal_profile_boards[] = {
>  	"8900", "8901", "8902", "8912", "8917", "8918", "8949", "894A", "89EB",
>  	"8A15", "8A42",
>  	"8BAD",
> +	"8C58",
>  	"8E41",
>  };
>  
> 

-- 
 i.

