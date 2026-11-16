Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867122;
	b=Gl6CxNrM3T2Li+LzGowP4x+wr8ak/5WjycXm0Zdt6t8hWO8Gz9o0yI9AvZ/m86jsnoKb
	 bg4KHxcACcREFFcxki+1MO6M+CT2m/Uo5aRURYyWKTSjD6ijbKtmKtYm1Emx4fSHmAolQ
	 JZBveXWUvrjB8BfFQxo008AH5mXXcTP7S6KO/NByhKk59nIHUgsPisJt3zh1YfAD7v/i3
	 ghCZ86rorwRJVUYcJSKLz/62OS0FpvWgSpbtVEAM6jPLwmmw1G023H1K0KVsfguFPZCwo
	 GObuU8QIPZyUAfd55S665lDdJpqicEmRFN2eEBL687rv0ctkSSZzooIrazorbrva8Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867122;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=66pVsRU+9wX1uNXH4TwCq95KvOZFrAZMMsMxsudr9CI=;
	b=Qq5ZJzt5ZxgklPUjuxOFzHYiO8y2GY+62E0I15eISGmi0u18wJGiB70dPRMPVw6N+dsl
	 ANiKO3dQfjyZcl7juVMHh7E5eI0N0dX5zZIoN8Yn16EwovbuuZ3jwX8p7umM4HMqB/FR/
	 myRpQXJlFvXqvUtAWIWHhuIPYROZgVRog7Y+ERXzbb+uXId26vroiK0dEt6YMCWA8T90S
	 tKYaw9X+TaZSdmY2cGoYgoEXaTFnuUf9y9j4zYKKkJtZuH9qrrHVUyOTjHTAeBpyM/rY3
	 FXoO3nqlXB7E1nch4cu8YysUSm6BojyuF7NvYnKbE6gKh+Ewwx6ieTO/yEWSNus6V+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VmeBXaul;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6216606A31C;
	Mon, 16 Nov 2026 22:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6216606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VmeBXaul
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794867122; x=1826403122;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=477b2FbJa4VbA8vxaka9UB2xBE2Wl9BGhk0xcBeJRfk=;
  b=VmeBXaulGAaCMa/CC8VERLpoZogafawZ8ZwDbxRG4N6mPbENLq0kujoL
   KsS1mZq9ezeVmb+4SGTAGjG9gaF/WMtaSqHOjGAA11uI3+kcLG0q+m2j1
   VIAAJ13YleCqHLqaG4gigkGD5eHUP22m30njtOh/rZ6b5JqO5yvW1nXdG
   XXTnPJ6Hs6J2jborPGkxZhxJ3/UiK630YGLAxp50vHei8sZIy7Qb4u6WG
   qKD1vu9X+EM6gXAgHUiYiFbyAiE+5EHfSYwm8uSSapnXQYl5ZJaiK/6Nn
   t0gjYqkH3LBjsOEpGSCVIu08gTBrbADKQerjea/huIKsqct2MX9lp7ckJ
   A==;
X-CSE-ConnectionGUID: BqpSX8o3TJep5ahQRphpEg==
X-CSE-MsgGUID: kLtQK9e9TyKEUNgYtl4HOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3607920"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3607920"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 14:12:01 -0800
X-CSE-ConnectionGUID: htZpXQbfTm2iSNxLqRMxFw==
X-CSE-MsgGUID: LLH7WwEORLaz/5vZs8iMBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9673203"
Received: from xpardee-mobl.amr.corp.intel.com (HELO [10.124.33.127]) ([10.124.33.127])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 14:12:01 -0800
Message-ID: <90493af0-6008-4447-8338-d6eced29c25c@linux.intel.com>
Date: Mon, 16 Nov 2026 14:11:48 -0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/pmc: Add Sunrise Point-H support
To: angellindo@gmail.com, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261005-intel-pmc-spt-h-v1-1-78c98e4f4620@gmail.com>
Content-Language: en-US
From: Xi Pardee <xi.pardee@linux.intel.com>
In-Reply-To: <20261005-intel-pmc-spt-h-v1-1-78c98e4f4620@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Angel,

Thanks for the patch, and for the detailed testing notes.
The change looks reasonable to me. Without it, SPT-H systems fall into 
the Cannon Point path, and the debugfs output (e.g. ltr_show) is wrong. 
Your comparison against direct PWRMBASE reads is helpful.

A few comments:
1. Fixes tag: This adds support for a new device ID rather than fixing a 
regression introduced by 661405bd817b, so I'd drop the Fixes tag. It 
would also pull the patch into stable backports.
2. PFEAR map: As you note, spt_pfear_map is the SPT-LP layout and SPT-H 
has two more PCIe controllers (SPD/SPE). I couldn't find public 
documentation for the PCH-H PFEAR bits either, so I'm fine leaving the 
map as is. Please state in the commit message that the map is reused 
from SPT-LP and that SPD/SPE are not covered, so 
pch_ip_power_gating_status is incomplete for those controllers. If you 
can, a cross-check of PFEAR against the root ports present on your 
system would be useful, but it isn't required. A follow-up fixing the 
map is welcome once the bits can be confirmed.

With the Fixes tag dropped and the commit message updated, please send a 
v2. I'm happy to give a Reviewed-by after that.
Thanks,
Xi

On 10/5/2026 1:00 PM, Angel Lindo via B4 Relay wrote:
> From: Angel Lindo <angellindo@gmail.com>
>
> spt_core_init() decides between the Sunrise Point and Cannon Point
> register maps by looking for the Sunrise Point PMC PCI device, but only
> the SPT-LP ID (0x9d21) is listed. On Skylake-H/Kaby Lake-H systems with
> a Sunrise Point-H PCH (PMC 8086:a121), pci_dev_present() fails and the
> driver takes the Coffee Lake path, using cnp_pmc_dev. That map does not
> describe this PCH, so the debugfs output is wrong.
>
> Seen on a MacBookPro14,3 (i7-7820HQ, PCH-H, PMC 8086:a121). With the
> stock driver, ltr_show lists Cannon Point IP names (SOUTHPORT_A, CNV,
> EVA, ...) and every entry reads RAW 0xffffffff. I was debugging why
> the package never goes deeper than PC3 on this machine, and without a
> working PMC map there is no way to see which PCH IP blocks it.
>
> Add the SPT-H PMC ID to spt_pmc_pci_id[] so these systems use the
> Sunrise Point map.
>
> Tested on MacBookPro14,3 (Apple firmware 529.140.2.0.0), kernel 7.2.5,
> with the module built with this ID:
> - ltr_show lists the Sunrise Point IP names, and the values match a
>    direct read of the PWRMBASE registers through /dev/mem bit for bit.
> - pch_ip_power_gating_status follows device state: LPSS reads On while
>    the Bluetooth UART (00:1e.0) is bound and turns Off once it is
>    unbound and the UART enters D3hot.
> - No warnings on load.
>
> Limitations:
> - spt_pfear_map is the SPT-LP layout and is reused as is. SPT-H has
>    two more PCIe controllers (SPD and SPE). Bits 13 and 21 are RSVD in
>    the SPT map but SPD/SPE in the Cannon Point map; I could not verify
>    this on PCH-H, so the map is left unchanged.
> - slp_s0_residency_usec reads 0 on this machine.
>
> Fixes: 661405bd817b ("platform/x86: intel_pmc_core: Special case for Coffeelake")
> Assisted-by: claude-opus-5-5
> Signed-off-by: Angel Lindo <angellindo@gmail.com>
> ---
> On the same machine and firmware, macOS reaches PC10 (~81%) at idle,
> while Linux never goes deeper than PC3. This patch only fixes the PMC
> detection so pch_ip_power_gating_status and ltr_show become usable for
> that investigation. With it, the PCH IPs report gating states consistent
> with device state (LPSS confirmed by toggling the Bluetooth UART); PC6
> and SLP_S0 residency are still 0.
> I plan to send a separate report on the PC3 limit to linux-pm.
> ---
>   drivers/platform/x86/intel/pmc/core.h | 1 +
>   drivers/platform/x86/intel/pmc/spt.c  | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
> index b4c7399f8..5822dbbda 100644
> --- a/drivers/platform/x86/intel/pmc/core.h
> +++ b/drivers/platform/x86/intel/pmc/core.h
> @@ -36,6 +36,7 @@ DEFINE_FREE(pmc_acpi_free, void *, if (_T) ACPI_FREE(_T))
>   
>   /* Sunrise Point Power Management Controller PCI Device ID */
>   #define SPT_PMC_PCI_DEVICE_ID			0x9d21
> +#define SPT_H_PMC_PCI_DEVICE_ID			0xa121
>   #define SPT_PMC_BASE_ADDR_OFFSET		0x48
>   #define SPT_PMC_SLP_S0_RES_COUNTER_OFFSET	0x13c
>   #define SPT_PMC_PM_CFG_OFFSET			0x18
> diff --git a/drivers/platform/x86/intel/pmc/spt.c b/drivers/platform/x86/intel/pmc/spt.c
> index b50534aa2..5c4b8d536 100644
> --- a/drivers/platform/x86/intel/pmc/spt.c
> +++ b/drivers/platform/x86/intel/pmc/spt.c
> @@ -138,6 +138,7 @@ static const struct pmc_reg_map spt_reg_map = {
>   
>   static const struct pci_device_id spt_pmc_pci_id[] = {
>   	{ PCI_VDEVICE(INTEL, SPT_PMC_PCI_DEVICE_ID) },
> +	{ PCI_VDEVICE(INTEL, SPT_H_PMC_PCI_DEVICE_ID) },
>   	{ }
>   };
>   
>
> ---
> base-commit: cf963c9359dd6c5d0bc6af16df5cf1f691bba4f3
> change-id: 20261005-intel-pmc-spt-h-3ebe43d206fb
>
> Best regards,
> --
> Angel Lindo <angellindo@gmail.com>
