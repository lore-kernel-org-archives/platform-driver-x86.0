Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B200E33B6D5;
	Tue,  5 May 2026 10:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975622; cv=none; b=X1RznTw+A+FGFiscMUbgPSE5oEPrNOjv1nKu/7c7C8wwhjRwLlsIPrnIhWtyk5SqKFRzAHpRB1kJoc8cyOzXq0k7sK+GAXBSKZs1Hpu0pQgs2w0JYl7sWS+tFvHCzi+9xamhhOGFPuOCPydBGdWq7IrEaTVm/WcyUaBAWME1YiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975622; c=relaxed/simple;
	bh=rIwgXedyfqVxG7GVmq/v9ItH32UgXEm6AKqMTA9L76U=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uOpSKHfn81uFccHNsHFW6kjZTeIkD8DjLrIlFmiJ3wzxJfFntZnk02EKJk3YjBa61TJSO9uaxu8tbTmzb8slvj9cU1D5a2Ch1w6ntwUeoFsWMFRKT5jbagcLQHD0M6WFniv+/9e9Nd1MQfwCNAdap8E38G+FApNsRaDBxrx1W0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMtpFlqy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMtpFlqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777975620; x=1809511620;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rIwgXedyfqVxG7GVmq/v9ItH32UgXEm6AKqMTA9L76U=;
  b=HMtpFlqyldUOusCt51mNOPjuohwazY4V+AAIqWPW3EYPs4EBFk4ElJVy
   tEevVtHcE6zPmc0rg4H6fkMou1u6CzJH5i0ygdBj+jrXuCwkVtQIEVnut
   SUVm4mGyKa9dHZXGrdv7QBrRyRYkhCjn+5XWS7jm66LHwV6H/Kjw5CT6X
   Zf5VLRBdT/HePLDyXeTg1rvLDLTGhbPtJX7vRwnJd6dQViRXv5aAcb8I3
   rt6NbtuQzaHgE4JtzeWIRWvfWnr4Sm904W6bZetUCZEbvpybQ6efmbtnI
   65SNONGBTptsIuCb1z9VQlhziunqKb3CTkB0QAOOaDfTsoCOMqaJrngfc
   A==;
X-CSE-ConnectionGUID: YYSyFTOVTme6nXZY2mP1cg==
X-CSE-MsgGUID: d1AfM6JUSpq1K8LAgZEyeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82693497"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="82693497"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 03:07:00 -0700
X-CSE-ConnectionGUID: lAn+dtfXTiK1RWTLgDZWwA==
X-CSE-MsgGUID: Y8L6NLNqRPW7EKpFshEfBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="232629069"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.85])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 03:06:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 5 May 2026 13:06:55 +0300 (EEST)
To: Haichen Feng <2806891994@qq.com>
cc: Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: hp-wmi: Add support for Victus 16-r0xxx
 (8BC2)
In-Reply-To: <tencent_6AA70E451B0D40B766785B0909ADC12A7E05@qq.com>
Message-ID: <f1258e15-cd9f-c215-4cc6-0b3b282994ba@linux.intel.com>
References: <930ba4a0-91be-03b3-4f71-4f43ea334843@linux.intel.com> <tencent_6AA70E451B0D40B766785B0909ADC12A7E05@qq.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 May 2026, Haichen Feng wrote:

> Sorry for write wrong patch. It is my mistake. This patch move 8BC2 to 
> the front of 8BCA. 

Hi,

Thanks for the update but here you should describe the change. This text 
will be directly taken as the commit message of the resulting commit, so 
think of reviewers of your patch and those reading kernel's commit history 
later and write to those audiences.

I think the previous version had better text here (but this is based on my 
memory, I didn't actually go to fetch v2 from archives).

> Signed-off-by: Haichen Feng <2806891994@qq.com>
> ---
> Change in v3:
>  - Move 8BC2 to the front of 8BCA

If you want to have extra explanation about the process that got you here 
which should be put into the commit message, the place for such text is 
after the --- line like you have tha patch changelog (correctly) here.

-- 
 i.

> ---
>  drivers/platform/x86/hp/hp-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index d1cc6e7d1..a5cda787c 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -205,6 +205,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
>  		.driver_data = (void *)&victus_s_thermal_params,
>  	},
> +	{
> +		.matches = {DMI_MATCH(DMI_BOARD_NAME, "8BC2")},
> +		.driver_data = (void *)&omen_v1_thermal_params,
> +	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
>  		.driver_data = (void *)&omen_v1_thermal_params,
> 
