Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623A33CF207;
	Mon,  8 Jun 2026 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913704; cv=none; b=rXiFOzyBzRI/o+m6pHSiiRgjEDK/13tSJEPeClmkWn9T0jGsNJLHseeybF0Qj40ncogUCOPIWUT9wmpjDOAyBN/Y2IBpQtS+FjEHsdk1U9rRAEJkl6YblW+babl7CbryfgyUMVNNQVTiS1kKs39dlrV/D5JIHU7qO0aFSYZqX2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913704; c=relaxed/simple;
	bh=bMuOzSf6GlwniOlWMeDY2HRuSLJHXiNWLmdLRLtStwQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bGsMndtgEFW0Y7KMpiOqrd/r+cL5+md2j/BSdtQNQO6cr4IIXcHES22anUoyMnhq0xO1nL8usIfroBw4yc2l0mwx3HQGqIRyZdhDcjw97raQqjYdlNoC95kdCn81dTEFouM7UjVdrLBuILp3ziZ2AtanL7z8iOzVzBz+HADUJ2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GZ248atz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZ248atz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780913699; x=1812449699;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bMuOzSf6GlwniOlWMeDY2HRuSLJHXiNWLmdLRLtStwQ=;
  b=GZ248atzDdnpJ8r+qWGnRW2B2BujgkJaguxDYsvZuvmElWq9uTBhFxCn
   Y0k0nTSxp6KgHSKsaR4Xr6VAT+0QNkhb9e/T2vfMd1sJkUDayYKao3Aho
   RPBookp0lIdymIq5HhPfd9qjZX+STToPy4Aid62xdSGEFdSD4tq9LiY2B
   pBQiAlv3L9NHn0ZD2+fvxeT0y1pFRkNIrCekWui0aYBPRkW/qVWxZ8TZN
   q1XfwYoD/DRWLWWI5TDzqL9U9B+Pn3coMHwLHEg6WNL4LoQIubaYjzyWZ
   0Wwk5tN3i+lGbCkVj9aGb4RGlYObvp+8yLVhj16yFvVPkPejP8bqSoIwr
   A==;
X-CSE-ConnectionGUID: +7BMgFCpRwCAOxI5+9HbrQ==
X-CSE-MsgGUID: RRXT3dvwT6eolYn8VJePEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="99228518"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="99228518"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 03:14:58 -0700
X-CSE-ConnectionGUID: k+y6EWIORu6fa/QTQ7f0wg==
X-CSE-MsgGUID: hHXNZyILTZy3MYgmYA8wcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="243058881"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 03:14:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jun 2026 13:14:52 +0300 (EEST)
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
cc: mjg59@srcf.ucam.org, ali@kernel.org, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: dell-laptop: unregister notifier on init
 failure
In-Reply-To: <20260603063803.765119-1-lihaoxiang@isrc.iscas.ac.cn>
Message-ID: <66e6371d-8dc1-6aec-0888-05c946c340fa@linux.intel.com>
References: <20260603063803.765119-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Jun 2026, Haoxiang Li wrote:

> Add the missing dell_laptop_unregister_notifier() call to the
> failure path after notifier registration.
> 

Missing a Fixes tag?

> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
>  drivers/platform/x86/dell/dell-laptop.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> index 57748c3ea24f..5dd607e8d2ab 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -2551,6 +2551,7 @@ static int __init dell_init(void)
>  	if (mute_led_registered)
>  		led_classdev_unregister(&mute_led_cdev);
>  fail_led:
> +	dell_laptop_unregister_notifier(&dell_laptop_notifier);

Unfortunately, this doesn't look like to be the only problem here.

>  	dell_battery_exit();
>  	dell_cleanup_rfkill();
>  fail_rfkill:
> 

-- 
 i.

