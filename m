Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEF8450F2
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 12:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687069; cv=none; b=ou+MXSQjRFBSHCQJY2cgR9yneiCLoBJ1QN3fKVNDBqC7ThSZJhNDqQfXe+1lHm52295g1ta0/gJsDjm/xNv1MStnceljZ7LtE+31drOsvCpSxhWTSsthH8g68pAJIwT0FWU+5u+h6RqWbVvZ2nLRuDCFSo9K7Dvsjz2d5UeiATg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687069; c=relaxed/simple;
	bh=KvHbRATfXvG0GGlewdw38nCWY6pi1KJUFiFsALk75VI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nsZ0s9efHM7Eb9UhCd/8EVcTz8/K5qnOs6zaVffM6hGkY9NTHuEkvG2k4fK2q3F90NModvMV+rg1E5FWR+70JCYa5Y47UqDe0AUh9Dsqkvo/gC8MV5jij76Si+7KQpBphydRf/P8iwbWuC9hbYbwx7pl1Bqj8BZ++8btuFasYXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJWhjkDU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJWhjkDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783687067; x=1815223067;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KvHbRATfXvG0GGlewdw38nCWY6pi1KJUFiFsALk75VI=;
  b=RJWhjkDUtdy+X7zIUtXTUoDncYxtH1gINOQEaCQuh1KcDwt6I6TaRZVU
   FOwfATkkGIVP1p8IftfyhNLs8DxKDJJjQNzh4Ld3ljpRbWdRdXRiMIHsM
   IrdUwOhlVNGOXNusH8EYNaDHTgipzASWWkn3vrwVJSBnPf/XYP+J4XTC5
   4DQpZ6SJfmG/7YFUjpCZlvEnH9xvwTJW/cLWP6/NrBfu5S8P4WEWC4i/O
   ibq2p967Tjd0HUezDXPzMdfKNigLmtFIEdXASNyzd5ilc1y5SAzMK6tIK
   XkBLQ3MUqfRjl08gwAmPEG8gPNSajCoSjbp/gK9s76W2Fji9pyQUoF9V6
   g==;
X-CSE-ConnectionGUID: mg90r+s/QVSEeYiRj/BUTg==
X-CSE-MsgGUID: /2JqYMbJRe2PShBiVrVptQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107182064"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107182064"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 05:37:47 -0700
X-CSE-ConnectionGUID: atoM5YNeQRSiUqYkY+srJw==
X-CSE-MsgGUID: wN1OrVYpRMaECu7yQ2yu1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252232772"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 05:37:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Jul 2026 15:37:20 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v7 0/7] platform/x86/amd/pmf: Introduce PMF util layer
 with userspace interface
In-Reply-To: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
Message-ID: <eaffb334-9077-6d77-bd4f-6078615d1e1d@linux.intel.com>
References: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Jun 2026, Shyam Sundar S K wrote:

> This patch series introduces a new util layer for the AMD Platform
> Management Framework (PMF) driver that exposes a minimal userspace
> interface for metrics monitoring and feature discovery.
> 
> AMD PMF currently manages power and thermal policies internally through
> Smart PC features, Auto Mode, Policy Builder, Static/Dynamic Power
> Sliders. However, system designers and OEMs need visibility into PMF
> metrics and feature status for validation, debugging, and integration
> with monitoring tools.
> 
> This series addresses that need by adding a character device interface
> that allows controlled access to PMF metrics data while maintaining
> the driver's existing automated policy management.
> 
> The primary use case is integration with userspace tools like AMD
> SystemDeck, which are widely used by system designers to:
> - Monitor real-time power and thermal behavior
> - Validate PMF feature operation during platform bring-up
> - Debug thermal issues by tracking skin temperature, C-state residency,
>   and socket power metrics
> - Verify BIOS input/output policy values during Smart PC operation
> 
> The util layer reads from the existing Trusted Application (TA) shared
> memory buffer and cached BIOS output values, adding no new communication
> overhead with the TA.
> 
> v7:
>  - Merge patch 3/8 into patch 1/8
>  - Use _IOWR(..., __u64) to keep ioctl number stable across extensions
>  - Clamp copy size with min_t() instead of -EINVAL for forward compatible
>  - Drop IS_ALIGNED() check and features_from_user read-back block

Hi,

I've now applied this to the review-ilpo-next branch.

I had to make two minor corrections while applying (one header added and 
a spacing change).

-- 
 i.

> v6:
>  - Guard misc_deregister() with pmf_dev_handle NULL check
>  - Move amd_pmf_cdev_unregister() to top of amd_pmf_remove()
>  - Fix bios_idx type from u32 to int and add negative-value bounds check
>  - Add missing #include <linux/bits.h> to uapi/linux/amd-pmf.h
>  - Rename amd_pmf_get_pt/lp/sp() to descriptive full names
>  - Add missing enum entries in platform_type and slider_position helpers
>  - Export amd_pmf_get_ta_custom_bios_inputs() for util layer use
>  - Fix stale/incorrect entries in Documentation/ABI
> 
> v5:
>  - Add actual ioctl implementation after all struct fields are defined
>  - Move features_supported field just after size for early discovery
>  - Add 8-byte alignment check for user_size to prevent odd-byte copies
>  - Add AMD_PMF prefix to all UAPI enum names to avoid namespace collisions
>  - Use size_t for loop variable instead of int with cast
>  - Use ternary operator for checkbox output
>  - Add empty line before Linux kernel headers
>  - Refactor banner to const char * for cleaner formatting
> 
> v4:
>  - Implement single amd_pmf_info structure which can cover all members.
>  - Add amd_pmf prefix for enums/functions within the UAPI header.
>  - Keep test-pmf tool outside of selftests directory.
>  - Include necessary header files.
>  - Address review comments received from Ilpo on v3.
> 
> v3:
>  - Stop exporting battery information via util layer.
>  - Optimize the core logic for fetching BIOS outputs.
>  - Update the documentation patch to reflect the current util layer design.
>  - Consolidate amd-pmf-io.h changes into common UAPI header.
>  - Define a single unified uAPI structure and IOCTL.
>  - Address other v2 review remarks [1]
> 
> v2:
>  - address remarks from v1
>  - add a new tool that exercises the IOCTLs from PMF interface
> 
> [1] https://lore.kernel.org/platform-driver-x86/20251111071010.4179492-1-
>     Shyam-sundar.S-k@amd.com/
> 
> Shyam Sundar S K (7):
>   platform/x86/amd/pmf: Add util layer and userspace character device
>     interface
>   platform/x86/amd/pmf: store BIOS output values for user-space metrics
>     via util IOCTL
>   platform/x86/amd/pmf: Store commonly used enums in the header file
>   platform/x86/amd/pmf: Move debug helper functions to UAPI header
>   platform/x86/amd/pmf: Implement util layer ioctl handler
>   platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver
>     metrics and features
>   Documentation/ABI: add testing entry for AMD PMF character device
>     interface
> 
>  Documentation/ABI/testing/amdpmf-interface    |  73 +++++++
>  MAINTAINERS                                   |   1 +
>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  13 +-
>  drivers/platform/x86/amd/pmf/Kconfig          |  10 +
>  drivers/platform/x86/amd/pmf/Makefile         |   2 +
>  drivers/platform/x86/amd/pmf/core.c           |   5 +
>  drivers/platform/x86/amd/pmf/pmf.h            |  34 ++-
>  drivers/platform/x86/amd/pmf/spc.c            |  72 +------
>  drivers/platform/x86/amd/pmf/tee-if.c         |  13 +-
>  drivers/platform/x86/amd/pmf/util.c           | 152 +++++++++++++
>  include/linux/amd-pmf-io.h                    |   9 -
>  include/uapi/linux/amd-pmf.h                  | 204 ++++++++++++++++++
>  tools/platform/x86/amd/Makefile               |  60 ++++++
>  tools/platform/x86/amd/test-pmf.c             | 142 ++++++++++++
>  14 files changed, 690 insertions(+), 100 deletions(-)
>  create mode 100644 Documentation/ABI/testing/amdpmf-interface
>  create mode 100644 drivers/platform/x86/amd/pmf/util.c
>  create mode 100644 include/uapi/linux/amd-pmf.h
>  create mode 100644 tools/platform/x86/amd/Makefile
>  create mode 100644 tools/platform/x86/amd/test-pmf.c
> 
> 
