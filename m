Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CC7240232;
	Mon, 13 Jan 2025 17:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736789923; cv=none; b=PFLJl8LtKHzuamI+9d5j+sPG6KS84aQrbSwUV3BkpYxi8MvHRguBLQmbzumHNcnKS1ieoaJ4+l6bz/arwklrKxF83pWCBS6wlXHFDwpoz1miO/NQzMiCUUFfEXOkKOCtIRO7feeGFlaMGVqVNJskLDGcTwBwwz1Iz5/F0HnfsNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736789923; c=relaxed/simple;
	bh=g/0MXdqfgV1yIa5nhhIR2VFUhh0a4IGuqEBeclQxfxA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rf2yL2cRfqNKoZO1oI/Zd0AyW7o+j2gkKEZH9aIKMck0hm9Mr3OV2ehdVjIaxGDontPgZmtU3KGEOllNAWLSlw19zH3WqpoHKdz89f6jGt0Bo/ss3Gc6xaxsraRf/++1WptW0xJtgkpBkmLz0OJUmxA+kJQq5kibmM8S4qDBWG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDTj2anV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDTj2anV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736789922; x=1768325922;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=g/0MXdqfgV1yIa5nhhIR2VFUhh0a4IGuqEBeclQxfxA=;
  b=UDTj2anVByD5mZ/NXFQXp1i5ur2ndj1qbEqnMqPyJ5M5aUKx6ISN+yIu
   uC9OMyQsBohtnddSOpzcjL1PzXe8rFg+b5lMG4Qfo8HAckAAhUjaoQLVM
   zBwjZpTlJLohOI0HmHyVIMankMuo2IRBG+c4BwW/rLS9guNv8snlMFm56
   eX5NUXDPDa5rFrq0a3kPCeW5wy7HLMHDcmm1mhxNmqtgsnbUYo4Q88NAz
   yuvjb7Z7V6lo9y0sSBtYCwu0u2FCL7bz3QWABxpiscw9iUeBdgxuCNHFv
   D3vnzG85L1Wb2AkaigOUaB0iuima56if1BMz2S9ChmlRFz7vgB8tUJucN
   g==;
X-CSE-ConnectionGUID: etU7TREwRg+68h9w12vlGA==
X-CSE-MsgGUID: W3jGjiSISgusOBDxmh+GQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="62438948"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="62438948"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 09:38:41 -0800
X-CSE-ConnectionGUID: G2y4Ig/NTaq24pOYUO47cA==
X-CSE-MsgGUID: 0U87RaYbRbyw/r6EVIwSDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141827741"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.121])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 09:38:39 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 Jan 2025 19:38:35 +0200 (EET)
To: Shravan Kumar Ramani <shravankr@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, Vadim Pasternak <vadimp@nvidia.com>, 
    David Thompson <davthompson@nvidia.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/4] Updates to mlxbf-pmc
In-Reply-To: <cover.1736412537.git.shravankr@nvidia.com>
Message-ID: <847136ae-4503-1377-b97e-32e6289501a8@linux.intel.com>
References: <cover.1736412537.git.shravankr@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Jan 2025, Shravan Kumar Ramani wrote:

> This submission contains 4 patches relating to mlxbf-pmc.
> 
> Patch 1 adds documentation for the sysfs files created by the driver.
> Patches 2 and 3 add specific functionality to the driver for supporting
> counting of cycles and clock_measure performance block.
> Patch 4 adds documentation for the newly added sysfs entries.
> 
> v3 -> v4
> Removed 64-bit counter functionality.

Thanks the update.

I was wondering myself just a few days back what's the status of this 
series.

I've now applied v4 into the review-ilpo-next branch but it will be 6.14 
material (by now, 6.13 is about to be released). I corrected the sysfs 
date/kernelversion for you while applying the last patch.

--
 i.

> 
> v2 -> v3
> Updated documentation as suggested to provide more details on the
> sysfs and driver functionality.
> 
> v1 -> v2
> Added patch 4 to document sysfs entries added in patches 2 and 3.
> 
> Shravan Kumar Ramani (4):
>   Documentation/ABI: Add document for Mellanox PMC driver
>   platform/mellanox: mlxbf-pmc: Add support for monitoring cycle count
>   platform/mellanox: mlxbf-pmc: Add support for clock_measure
>     performance block
>   Documentation/ABI: Add new sysfs fields to sysfs-platform-mellanox-pmc
> 
>  .../ABI/testing/sysfs-platform-mellanox-pmc   |  65 +++++++++++
>  drivers/platform/mellanox/mlxbf-pmc.c         | 107 +++++++++++++++++-
>  2 files changed, 168 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-mellanox-pmc
> 
> 
