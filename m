Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB1C36680E;
	Wed,  1 Jul 2026 11:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906826; cv=none; b=tClJUm5ktOKBmfiRpX2Q11MOGXQoDKUGLTKNrEspsfW22IfjYHAKpHzmArp1ofVG0JhbU2OVIJi0wyxVQUtXN0OVYY1RDKDqvWI58BeNC85iCA6W2+D29zb1H1YsfRKnO6zUwn+nxhEI9sXRGUQkMHjxA/t/GKTW7/+f4oBSqI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906826; c=relaxed/simple;
	bh=DuvcbyQ5E3fvbS/s+H2j35X7URNS6NVhB8YflY6LOSg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YcUZ/Uxak8w42ygzcGvrsLu5481Ndf9I741aTo9rWBjSDCBeX5Z2uP+DolsEQmu6g+hXwDBindZKTNIPXN8a1qCjo7LJYXPRY2e+BdOraa39xSxoWOy9hsZM/T47FAjXbGue3JGX4rCUvYX4d4Yd+h7zNLBJxeeGUpp/4JnscmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ep8GAI7m; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ep8GAI7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782906823; x=1814442823;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DuvcbyQ5E3fvbS/s+H2j35X7URNS6NVhB8YflY6LOSg=;
  b=Ep8GAI7mVZVuwFmUNRt3CHbvOwB0RlZO1TGW3kIVFhdS811W9hLbWW2y
   hVFfxIXYY4Xz8o1sFIUDjCstn2tKrkKyqtpnYSeXto9YxyrzfK9e0Tfgw
   z3Un76uDuPsrpzXG0ScGiZGwA1sN/3avD4cdyLBIAItW44s/RGxyJmkp9
   eMMaAGM4Bx6QFOlEBVynFXmlrMQmOxWsZ2jS4L1ZKcZIiXq91NeW/Ru12
   6VfVkO5nYwAn0U+miCtaMjcwuIJ3QLcRgUggRkijfEb/pcAEc89UgpLn+
   MiqpCPDSW9UoNtx+nbsyex+dPwIjwhVXAVtM0OiigJ8XydAj6tr5lFa4y
   Q==;
X-CSE-ConnectionGUID: rvlFLwfoSpCIHMAk/PkFNA==
X-CSE-MsgGUID: jyrnLvY1R4GyG5mCYCd5Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83509808"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="83509808"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:53:27 -0700
X-CSE-ConnectionGUID: V+ms8BW9SWKHFDb0hQvwtQ==
X-CSE-MsgGUID: oAjDr/KeQLaXl/7N1aAsLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="275764751"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:53:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 1 Jul 2026 14:53:22 +0300 (EEST)
To: Markus Elfring <Markus.Elfring@web.de>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    Jorge Lopez <jorge.lopez2@hp.com>, LKML <linux-kernel@vger.kernel.org>, 
    kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/x86: hp-bioscfg: Use more common code in
 hp_init_bios_package_attribute()
In-Reply-To: <0b2257be-a509-4c86-94ec-3f23847c9626@web.de>
Message-ID: <1b9c1471-bfc1-4b0c-c303-ed08c5fba4b3@linux.intel.com>
References: <0b2257be-a509-4c86-94ec-3f23847c9626@web.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 18 Jun 2026, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 18 Jun 2026 21:42:27 +0200
> 
> Use an existing label once more so that a bit of common code can be better
> reused at the end of this function implementation.
> 
> This issue was detected by using the Coccinelle software.

This patch leaves me quite unimpressed of Coccinelle's abilities.

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> index 27fd6cd21529..819313a4425a 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -692,8 +692,7 @@ static int hp_init_bios_package_attribute(enum hp_wmi_data_type attr_type,
>  	if (ret) {
>  		pr_debug("Failed to populate integer package data. Error [0%0x]\n",
>  			 ret);
> -		kfree(str_value);
> -		return ret;
> +		goto pack_attr_exit;

If a call fails, it's expected to handle cleanup itself --- which is 
exactly what hp_convert_hexstr_to_str() appears to be doing (by not 
writing into *str until it's committed to returning 0). So why is 
this kfree() necessary in the first place?!?

-- 
 i.

