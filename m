Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1227827B50C
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 18:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762970932; cv=none; b=Lz3DhS0u7kpV3S7IHbhsYuUo5gPrG8ae8A6wKBbp3tEnk9gLVsz0G2Ctnj6cqlkngxsSpJZygHEkPe9WpMiiAKvrrQYIPXPnxHCDrcMPKYIaPnTxLkClk7Zl61Pe6wTeV+rrLYx+l4l8PpDNaiPDWAXR5tAttCYMz5FgPkU974U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762970932; c=relaxed/simple;
	bh=gpUmT4QtPlWt231olB9BKB4QjSv0FHPTJu9ELXKk8sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HjK/sCHbgaX7R8v50NVttlr3Q9xOmc9OHzCM4/f3GeV9ZMfs+3djOk48cmNAIibgaeGT5y7oAoOTh8qeoq90BydV0Nt/4RKGE3HAI0FoSNOVobyN8Hc0BObV/eZVe9qZWbP94nVVu2cY0CpgFIU10odNOZT5Ik+LuPtw//iPlNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=slRr8SK6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="slRr8SK6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57A7C4CEF8;
	Wed, 12 Nov 2025 18:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762970931;
	bh=gpUmT4QtPlWt231olB9BKB4QjSv0FHPTJu9ELXKk8sg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=slRr8SK6jvBGQN6YpDwmNmUg3MDUSNG8fhqWRmZyKU7u93CfrSlqk/OAovevaULWM
	 +ATt+3eEhT5KeF1yzpPBiVGkMzxM3FdCKKFk0x/1OY7d1Yox6fli7ewZBCRttWbiBc
	 M+TrGEMrVXMmp0SsBoAWOmDET+K5QGdpYXDO28o2e7bTgb6GzOKiPi/L9NQdorz+eU
	 RkdKvghL07L+j7xsLmfg3vFvEGx+so8i992AKOgOsQxaLuzkpr/U16vNBxc81Hbhkk
	 HTBK+MpbSO6v0TKsvo0Sy4AF/OXroi0QNPSa4J2GRB/RGdYSg1eJ/Yz8S23J6x+uzA
	 aXn/BbX/1X4Lw==
Message-ID: <5856f9f1-1737-46e3-9063-536f4cf2f66c@kernel.org>
Date: Wed, 12 Nov 2025 12:08:49 -0600
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce AMD PMF util layer and user-space
 interface for SystemDeck
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Yijun.Shen@Dell.com,
 Sanket.Goswami@amd.com
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/25 1:10 AM, Shyam Sundar S K wrote:
> This series introduces a util layer to the AMD Platform Management
> Framework (PMF) and a minimal user-space interface via a misc character
> device, enabling feature discovery and smoother integration with
> user-space tools. It also adds caching of BIOS output policy values to
> prepare for user-space telemetry reporting via IOCTLs.
> 
> The motivation is to provide a stable interface for user-space tools to
> discover PMF features and consume selected metrics. Enable smoother
> integration with AMD SystemDeck, a widely used tool for monitoring and
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
>   - address remarks from v1
>   - add a new tool that exercises the IOCTLs from PMF interface
> 
> Shyam Sundar S K (5):
>    platform/x86/amd/pmf: add util layer and user-space misc device
>      interface
>    platform/x86/amd/pmf: cache BIOS output values for user-space
>      telemetry via util IOCTL
>    Documentation/ABI: add testing entry for AMD PMF misc device interface
>    platform/x86/amd/pmf: Store commonly used enums in the header file
>    platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver
>      metrics and features
> 
>   .../ABI/testing/misc-amdpmf_interface         |  49 +++
>   MAINTAINERS                                   |   1 +
>   drivers/platform/x86/amd/pmf/Kconfig          |  10 +
>   drivers/platform/x86/amd/pmf/Makefile         |   2 +
>   drivers/platform/x86/amd/pmf/core.c           |  19 +
>   drivers/platform/x86/amd/pmf/pmf.h            |  33 +-
>   drivers/platform/x86/amd/pmf/spc.c            |   1 +
>   drivers/platform/x86/amd/pmf/tee-if.c         |  10 +
>   drivers/platform/x86/amd/pmf/util.c           | 236 +++++++++++
>   include/uapi/linux/amd-pmf.h                  |  96 +++++
>   tools/testing/selftests/Makefile              |   1 +
>   .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
>   .../drivers/platform/x86/amd/pmf/test_pmf.c   | 388 ++++++++++++++++++
>   13 files changed, 832 insertions(+), 22 deletions(-)
>   create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
>   create mode 100644 drivers/platform/x86/amd/pmf/util.c
>   create mode 100644 include/uapi/linux/amd-pmf.h
>   create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
>   create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
> 

Series looks good to me now, minus one nit on the last patch.
Thanks for including an open source consumer of the new IOCTL.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

The documentation (in patch 4/5) says 6.20, but if Ilpo agrees to take 
this for 6.19 that may get updated when committing.

