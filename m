Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E79F23EA86
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 16:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569247; cv=none; b=Y6P9UmNvWZIHVM/hhqs3lzuEVhTNYNFHtNh+K1g1m9TYmJtTdQC2b4TLRcm1aogB7n0qiEDlfilOArTNbcOhNC0ZM0//dDWaBm901aWcxADTVYCfGbSsbQrNUwH+HNyRCaYCGN5aGw76V5QRLp45xaQWhmxKwn0Ldrxr76CTk2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569247; c=relaxed/simple;
	bh=QEMTVMnkbmbRGgojblIWWU8G88dLGaETvsPmiALjbIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyYZ864zVce1BLJ+yWGubAWbABf02cU2qs1vpclxeKthfUcVp5UewvT73D4YSVL71u020oz9d0/wZPXc73fgo1GELrmRwYSL8KEMsygQoZhcbLYCvi4Ilt+PIKhz53ZbNKrFptXjw62LsmpcEhg8oLXxI5mZWaVaVYNzYNGIiG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7n9wBra; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7n9wBra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0455C113D0;
	Wed, 19 Nov 2025 16:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763569247;
	bh=QEMTVMnkbmbRGgojblIWWU8G88dLGaETvsPmiALjbIg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H7n9wBraP4rQRlI08ZKQtcpOWREGbH0VyA/mr6RaAfRzdNm6FoILKi21j9Os9116E
	 qILCWQztHdtpvwNnpptc8oMd3qFLKsprPQ3bIX9+bonq4EcjIwRA1FUY+dgsf+1qcn
	 FZfTfDiWkkDu8ccWbI8j2PpwVaCD7ft611NAKw1Hjf/dkSJra1E02PWFWJjmjBKQwf
	 cKuQ8i/hiHUI4Kb2fHJCT2A1jDHtsSMmOi0QT5z1v4y5zbtDhfriIxL2udPaJg5kNC
	 WH3VgXiY4V0j98vBmsGgt5CzFQayi9a8NOWTqjGsfp+D2SbQIzXLmlrsWxSRrM5l/d
	 zYcMdJSiI/M7w==
Message-ID: <2c40e722-ffd7-4e00-92dd-2c89ff4768a0@kernel.org>
Date: Wed, 19 Nov 2025 17:20:43 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce AMD PMF util layer and user-space
 interface for SystemDeck
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shyam,

On 11-Nov-25 8:10 AM, Shyam Sundar S K wrote:
> This series introduces a util layer to the AMD Platform Management
> Framework (PMF) and a minimal user-space interface via a misc character
> device, enabling feature discovery and smoother integration with
> user-space tools. It also adds caching of BIOS output policy values to
> prepare for user-space telemetry reporting via IOCTLs.
> 
> The motivation is to provide a stable interface for user-space tools to
> discover PMF features and consume selected metrics. Enable smoother
> integration with AMD SystemDeck

This does not really explain why you've chosen for a new character-device
with IOCTLs instead of sysfs where as so far (AFAICT) all the AMD PMF code
has been using sysfs APIs.

Is there any specific reason why to switch to IOCTLs all of a sudden?

Note that:

1. sysfs APIs can be (and must be) stable too, sysfs APIs are not allowed
to be changed once shipped in a stable kernel.
2. sysfs attributes can be used with poll() to so if you want to do
notifications of changes that can be done through sysfs too.

Note I'm not saying you must use sysfs, but so far the PMF code has been
using sysfs everywhere and this new IOCTL based API is not really consistent
with this.

So at a minimum you are going to need some pretty good arguments to
deviate from just doing this with sysfs as has been done before.

Regards,

Hans




> , a widely used tool for monitoring and
> controlling power and thermal behavior, helping designers keep components
> within thermal limits to ensure proper operation and improve system
> stability and reliability.
> 
> This series also adds a small, dependable userspace utility that leverages
> the new IOCTLs to query live power and thermal telemetry. Exposing this
> data in a scriptable interface helps users and tooling make informed,
> workload-aware decisions and supports validation and debugging.
> 
> v2:
> ----
>  - address remarks from v1
>  - add a new tool that exercises the IOCTLs from PMF interface
> 
> Shyam Sundar S K (5):
>   platform/x86/amd/pmf: add util layer and user-space misc device
>     interface
>   platform/x86/amd/pmf: cache BIOS output values for user-space
>     telemetry via util IOCTL
>   Documentation/ABI: add testing entry for AMD PMF misc device interface
>   platform/x86/amd/pmf: Store commonly used enums in the header file
>   platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver
>     metrics and features
> 
>  .../ABI/testing/misc-amdpmf_interface         |  49 +++
>  MAINTAINERS                                   |   1 +
>  drivers/platform/x86/amd/pmf/Kconfig          |  10 +
>  drivers/platform/x86/amd/pmf/Makefile         |   2 +
>  drivers/platform/x86/amd/pmf/core.c           |  19 +
>  drivers/platform/x86/amd/pmf/pmf.h            |  33 +-
>  drivers/platform/x86/amd/pmf/spc.c            |   1 +
>  drivers/platform/x86/amd/pmf/tee-if.c         |  10 +
>  drivers/platform/x86/amd/pmf/util.c           | 236 +++++++++++
>  include/uapi/linux/amd-pmf.h                  |  96 +++++
>  tools/testing/selftests/Makefile              |   1 +
>  .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
>  .../drivers/platform/x86/amd/pmf/test_pmf.c   | 388 ++++++++++++++++++
>  13 files changed, 832 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
>  create mode 100644 drivers/platform/x86/amd/pmf/util.c
>  create mode 100644 include/uapi/linux/amd-pmf.h
>  create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
>  create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
> 

