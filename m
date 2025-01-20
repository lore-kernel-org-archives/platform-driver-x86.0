Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ECA1DFE14;
	Mon, 20 Jan 2025 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737377046; cv=none; b=TL8lqLhfke2DfKwuNGpT3QF+xzsCXeadcFL5NQEtasyi7ZfZi5gfJ99qg9IoQxrCJlGdUbnsaRmVFBnrrumzrUIVhnwi4vy6oZ489mmoX7FoBK+3DA2BDk55LDugxtSVmzexdf6kKwboK2G95IW9BunYR/DkC0rcssCYo4SBoLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737377046; c=relaxed/simple;
	bh=U5hw+PCPxPEL1Am6IadBCl68WaQLFGdoR1kl0l4QgFg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pHlZbk70rRiBdDcCL3SRNaymT+Lj3+oQqJOboi9ZvBo0BjRgudhneeiXn0RfW/Yz3JR+pp0WGYMQU2eF242w133P8HzXiSZqSDipmzKvNR9k2s5Z0N1VyexoCBjHE09/RVGSIc/Nqwr/euUbZF9/tJExyQxBTmtKh/HxhrWroC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTSs0/Ul; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTSs0/Ul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737377045; x=1768913045;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=U5hw+PCPxPEL1Am6IadBCl68WaQLFGdoR1kl0l4QgFg=;
  b=VTSs0/Ul+iyqX9Fr3FQydKXM9dSUyPKdlU9oOYpNeG1hf4cxpD9Dc9Nx
   gri2SdnkoqEPHZ/OGcDLwTZWPJBzHVmXFV1QsEVRFHnhFGStwOgZq4VpJ
   KHXVT0mcr3mvT27OnhQqcXhlQhlPheXuxpzdVamqKu+OxaE3vs98r8mmT
   f9vaKDmjhD+U7IujyM+pxeAdMCSlA/toG00GBIJ1ku3TwDrzfitNHEC1B
   7l6tfBujNI9dYQhMyUe52U2L9D8OY3mX5fEwxwSHUL6SlNobEEvw+lR9X
   RcR/na3Hxb4G/qwD/K98rj7P/PvbGl9Y8rw1/yQn8QJVKXBaXkjtMqIlj
   A==;
X-CSE-ConnectionGUID: 76PuhZ/zScSKblh47sddOw==
X-CSE-MsgGUID: STPdiKZ6T+OGr3vP2WHghg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37460266"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="37460266"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 04:44:04 -0800
X-CSE-ConnectionGUID: RfU/0svuQc+tqWI8V8v04Q==
X-CSE-MsgGUID: u2wOuwo0SNGSEz6vK+4+Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="106522325"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.8])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 04:44:01 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 20 Jan 2025 14:43:58 +0200 (EET)
To: David Wang <00107082@163.com>
cc: w_armin@gmx.de, farhan.anwar8@gmail.com, 
    Hans de Goede <hdegoede@redhat.com>, jlee@suse.com, kuurtb@gmail.com, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    rayanmargham4@gmail.com
Subject: Re: [PATCH v4 5/5] platform/x86: acer-wmi: Ignore AC events
In-Reply-To: <20241214104505.16025-1-00107082@163.com>
Message-ID: <f9f5d603-e391-47a8-adf4-d2e0c5a6836b@linux.intel.com>
References: <20241210001657.3362-6-W_Armin@gmx.de> <20241214104505.16025-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Dec 2024, David Wang wrote:

> May I suggest pr_info() this WMID_AC_EVENT event, there were discussions
> about possible unstable adapter cord causing flood of events 8-0/1. The
> logs may help identify the cause.

I don't think flood of pr_info() would be desired if that's the case. 
While one could ratelimit the print out, it still seems useless noise for 
normal operation which this patch aimed to eliminate.

It sounds more like you'd want to print something if and only if a flood 
is detected (how to determine what is "flood", I don't know enough details 
of this particular case)?

In any case, if feels something that would be better put into own a patch 
with a proper justification and explanation what constitutes as "flood".

-- 
 i.

