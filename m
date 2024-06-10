Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A689E1DFF7
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Jun 2024 16:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718035817; cv=none; b=ktUgcxAeruJY2BnC5vQsWHZt5QiLm7t3ybjA4uj0IEMGDPajfWd3NeBwOL38bXWw2XDZAJn5hdwZCLqsuSKrmbKWIKQX+wCtMiJED4Vop4LTae58v7TQgS52oS7yOWOiitsGSgalUJf0fWRI+LTppF2C6bx4r5HOxU8TjXS1Mvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718035817; c=relaxed/simple;
	bh=zgK/AqL9coZps00chRhbPw4u1IXvInrDFfThRt9iXuU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hptxnsYIwB0WD+uVxISNVmq6UkzWFpG8E+gLeihtnZmHk7CQRC88DYnNHawAV/QhYEHW2LEjFeN4wySMzVWZKAezDOv93D84p72resDOC2eP0UkWY/FIq27f7A3+kAkB05YTYIv0+lu/e3+UI9il6lWwuWs3tzqk7APQ1lYf4cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CvIQOm9+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CvIQOm9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718035815; x=1749571815;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zgK/AqL9coZps00chRhbPw4u1IXvInrDFfThRt9iXuU=;
  b=CvIQOm9+MXSaMscgAQwprwE2vtgVAyrVdQW7rOXsjPp0mwSkDssASFVM
   BrOZaVxUUlIIJzAsFuUaDe5hmqMgE6sRGprQ2hHLzAbNy8+MDa5eqCUCN
   pfIgOH/n1KLBtCXxOAMok9EL32xtRBBjHWSkwy+cv8sVlev2sqKLZ5dPa
   K492nsrP4Y/ljf29ay1agiCZvziI43st02OUhO5XhpNw+9hm2qvhtFHqB
   pmvOuWsiPoZ/lfU6kTNxuWfNDZPhav/pHOzrkWq7fF2p/kWGKd7nSWdcZ
   Vlz1bjDn6vWikxmFbYy1sUy9Ety63aP1tG/dyXW9WexsX1/SW0/ezC+Pp
   w==;
X-CSE-ConnectionGUID: EnIrY735QLOZcqyTKwrX/w==
X-CSE-MsgGUID: 5eN3ORnITS+7SXvqc2ovuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="12000636"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="12000636"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 09:10:14 -0700
X-CSE-ConnectionGUID: iN6H8pL2TwmpyR3r7r4fpg==
X-CSE-MsgGUID: Nt0pIbM5RVO31oLh89rIUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="38955226"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.194])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 09:10:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 10 Jun 2024 19:10:09 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH 2/2] platform/x86/amd/hsmp: Split ACPI and non-ACPI
 code
In-Reply-To: <20240607133405.1211929-3-suma.hegde@amd.com>
Message-ID: <bfc3bc47-4ca9-9616-2248-5b02ef8fc044@linux.intel.com>
References: <20240607133405.1211929-1-suma.hegde@amd.com> <20240607133405.1211929-3-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Jun 2024, Suma Hegde wrote:

> Separate the probes for ACPI and non-ACPI supported platforms.
> Provide a Kconfig option to select either the
> ACPI or the non-ACPI (platform device based driver).
> 
> This change is done to
>  - Keep the probes clean of the if else ladder
>  - Use dev_groups in platform driver structure, instead of using
>    devm_device_add_group()
>    + use is_visible() to enable the sysfs entries
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

This will be quite tedious to review in the current form because it 
combines mass-moving of code with non-move changes. I'd expect it to be 
significantly easier to review if the existing functions would be copied 
1:1 to the respective files first and then another change does the actual 
separation.

You might need to add a few extra function prototypes into the header in 
the intermediate state but I believe it's still going to be huge win even 
if you'll need to remove some of those prototypes when the actual split 
commences in the second change.

A few general comments:

- EXPORTs should be namespaced.

- Directly include <> headers in the individual files .c, don't mass 
include them through "hsmp.h" as clearly they'll be different for 
ACPI/non-ACPI to some extent.

-- 
 i.

