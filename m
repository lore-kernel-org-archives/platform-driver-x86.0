Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE7525F972
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 May 2025 10:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824189; cv=none; b=tH6oM2sN+IrKOr3HSAJVwf/E8jR96GSCIW7WIQiJbYXXXzDBnBGRBGvgXF80C7R3UbQzqoLSZ+7J28B/GdWbV/QxqeBmW7y+hS8qSKI9TwFuLkdozz73N/Ngg5OzqTomVIaIkJmIrSZ7RILQ+ZCj0kPdDk/V1BNMzcXlj2oVh3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824189; c=relaxed/simple;
	bh=d9PmIgVHBGL+BkVDjERicrdKJriKAd5dy3+4zIGfjWs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BUmKde8afpMbnsR8EgE1nQM/Vzf0z2c4r2ZDewrTx+oJYq+qM7Y5UpFAObEMJnzQqzbJKd6UYh3ZM1uWFMesTGhMaZyi8c1Cuw/gSYfcRYRfaN0Mt7OqLAh0Hut/9WpORfT74/G9RwJGGFnlrXK0k6AS0f6c/TD9k+AQP5w00x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzkVQ30/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzkVQ30/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747824187; x=1779360187;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=d9PmIgVHBGL+BkVDjERicrdKJriKAd5dy3+4zIGfjWs=;
  b=nzkVQ30/JdevPcqk+vbJfrKBCYSuaX+f3NvNpA0ViraB6Lb2wFwBbiYf
   Zn4+6DTrxfo0y9BPa8UJ+2uRJvZJe/UMZ+6SLKUPE5li5c3034oCmoeVw
   3AfVTAahMjvO5aUdBxjZm0Q4oj7UlVd8NnIBSTOOSH0c4JXGjZxlLguW0
   Bc6lBxHw5aZxbwFQmyjauu6vKAHTvotRGjPPXSL5FCHHO6iTSevrBTL/O
   8YaNCarPuMDfEXtgk/4vilOAGHaoZH+mePGTRq+k9ZrDDwz+AAoZe0D7J
   s/3X/Ub+xQ1Fhd9NyjSCU+6IWvXxlrFnCSpp6LMfkkUmHcC5JH2qLj7Mt
   w==;
X-CSE-ConnectionGUID: 3CYBd+KLSse0YsmsxCSbOg==
X-CSE-MsgGUID: x5XrYX6zTrOYl+7AFgh++w==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="75191821"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="75191821"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:42:59 -0700
X-CSE-ConnectionGUID: yZthxUi4Ry+oTaEo3bMhKw==
X-CSE-MsgGUID: mM5h0D1GRP2Ba/WnFWGcqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144003204"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.221])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:42:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 May 2025 13:42:53 +0300 (EEST)
To: kernel test robot <lkp@intel.com>, Suma Hegde <suma.hegde@amd.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    PDx86 ML <platform-driver-x86@vger.kernel.org>
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next] BUILD REGRESSION
 90b85567e45736b662d034be536a76ba0f4c7ca8
In-Reply-To: <202505162024.cljwN0DB-lkp@intel.com>
Message-ID: <891a439a-7b7f-b661-18d6-3ebe549a0208@linux.intel.com>
References: <202505162024.cljwN0DB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Suma,

Could you please fix this as well.

The relevant configs:

CONFIG_AMD_HSMP=y

#
# AMD HSMP Driver
#
CONFIG_AMD_HSMP_ACPI=y
CONFIG_AMD_HSMP_PLAT=m

CONFIG_HWMON=m

I think it tries to build HSMP's hwmon.o as non-module and therefore 
fails to find the symbol because HWMON=m. Maybe something like:

	depends on HWMON || HWMON = n

to AMD_HSMP would enforce building hsmp as module if hwmon is module.

On Fri, 16 May 2025, kernel test robot wrote:

> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
> branch HEAD: 90b85567e45736b662d034be536a76ba0f4c7ca8  platform/x86: Add AMD ISP platform config for OV05C10
> 
> Error/Warning (recently discovered and may have been fixed):
> 
>     https://lore.kernel.org/oe-kbuild-all/202505160451.uiXqsnFq-lkp@intel.com
> 
>     ERROR: modpost: "hsmp_create_sensor" [drivers/platform/x86/amd/hsmp/amd_hsmp.ko] undefined!
> 
> Error/Warning ids grouped by kconfigs:
> 
> recent_errors
> `-- x86_64-buildonly-randconfig-001-20250515
>     `-- ERROR:hsmp_create_sensor-drivers-platform-x86-amd-hsmp-amd_hsmp.ko-undefined
> 

-- 
 i.

