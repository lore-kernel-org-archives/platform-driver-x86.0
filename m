Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7CA4AFE3B
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2026 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638933; cv=none; b=aVPI+Lw0nrQdAvVe8SL61o2FRVIHQt9l6VXigz6Jqx6ssRnCs6W+cQ2pt/8uVYPEzELH4o881PQT7scVqV3N98qK7u41jGaK2jUtTH4SsiMYQhHhoLaIwx+aaf7YsRIW1GV6MNcm0jE47GVZF7MwoP8vJepuOaPPSJY6DtLErwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638933; c=relaxed/simple;
	bh=GmIhGUIbp4hhVMAyPIxmUS4gllPo9slVR3Wxb4ovvbE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=t3C0GqJGckpGakVdfVEK4CZXLDU83MRWo8J2dZcxKVM5D9+4S5xIHxg5v733WEiRfU/ds2dJFSe2gaYEp4Z7Daa+CiXdNIuW7JgSGmxW+4f8OaKP6NqZBLz6pKSMPPCLqmOX4nlYKQxq9aETyafvFw7yfWT7CBzQwBILqhJpbms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TB61NqEy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TB61NqEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789638920; x=1821174920;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GmIhGUIbp4hhVMAyPIxmUS4gllPo9slVR3Wxb4ovvbE=;
  b=TB61NqEyuWXQTr3xL169DbBExq9gD54kaqrhoKcL15dwjqaRTapJDe2/
   hcmwHqcI5LduYdjEdWM77vyNfudYhUiqaNVGYy79DQAPIDTeSLxdJ6Cxc
   aVXlapLOKnyVVecr18MCcBVhZr+XpwbRmK20MD46ALJ1l5G0p08gkzma0
   cLHaH+6GZYXe3y6u1Dp4+QotOw6j2r/ifm6dR0Hz9e3jP8dUE5LQXUY2A
   MNze+Owe+y4ZG6UfvwF5B/CTKJl6+xK2qASFA8TAWaGQgrSUmXUMfJ3Px
   FkeU49tDzmXFNdrL3vRSnffpHG1Kab4UDh2wPs+uGn644hv2qSRmW9/nT
   w==;
X-CSE-ConnectionGUID: aqp+bLcfSEOneX46keWfUw==
X-CSE-MsgGUID: GcM3kDMbQJOqzbI/AkRZRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115581172"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115581172"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:55:15 -0700
X-CSE-ConnectionGUID: TcJcPbTsRSyRzyW4l+xnrA==
X-CSE-MsgGUID: njtQzaIeR+eX1NGiw9ZkJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275640284"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:55:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 12:55:06 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
    anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
    matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v9 03/20] platform/x86/intel/pmt: refactor rc with a
 return value
In-Reply-To: <20260916201139.2374531-25-michael.j.ruhl@intel.com>
Message-ID: <b5c31da5-99f4-1474-53e0-46359fbcdcd8@linux.intel.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com> <20260916201139.2374531-25-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Sep 2026, Michael J. Ruhl wrote:

> Upcoming changes will include possible failures from HW accesses.
> 
> Refactor pmt_crashlog_rw() with a return value.
> 
> Update all necessary usage to use the return code.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 101 ++++++++++++++++------
>  1 file changed, 74 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index 831cff743803..b6540f3a9a17 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -144,27 +144,29 @@ static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  }
>  
>  /* Read the status register and see if the specified @bit is set */
> -static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
> +static int pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit, bool *state)
>  {
>  	const struct crashlog_status *status = &crashlog->info->status;
>  	u32 reg = readl(crashlog->entry.disc_table + status->offset);
>  
> -	return !!(reg & bit);
> +	*state = !!(reg & bit);
> +
> +	return 0;
>  }
>  
> -static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_complete(struct crashlog_entry *crashlog, bool *state)
>  {
>  	/* return current value of the crashlog complete flag */
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.complete);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.complete, state);
>  }
>  
> -static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_disabled(struct crashlog_entry *crashlog, bool *state)
>  {
>  	/* return current value of the crashlog disabled flag */
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled, state);
>  }
>  
> -static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
> +static int pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
>  {
>  	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
>  

This function still contains return true and false within even if you 
changed the return type (and it "works" because of implicit conversions 
but better to correct that inconsistency).

(Found by sashiko.)

-- 
 i.

