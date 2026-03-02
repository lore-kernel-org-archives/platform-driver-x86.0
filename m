Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F4547D943
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772480186; cv=none; b=HKjswKRiYEua4fypUn/tba12XJInL0subxu3WJLyIiCyc20OBBA3Pn5PRrAtEdYC4LDFib4tyylx45MmAG1G8aSp1svl/kV4Mabd2j5OG5+WurQ1eV+zRR0wOjhz7Qs+F4WxeORd/zWvPSPu+pHH+EZ0xt9GRzE+HfZzEAfyoq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772480186; c=relaxed/simple;
	bh=hykRQ85o3s1Gjn5iSxhnQfb+e01yQAaLRqtF/NC2jzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1xcmgf/jM4pJ5PxY2i3mSgM7zAj9AcQ+PpWOp8CZJ2IVZkEaOpj2PQQInqiNEF7niEWRVEwxNFctUyzWvQPCrX2htRI9z8ZGiUU9rKnUvmf47RWF+h6xZIkVHJlSU3r3sqdtJsltRsuMT2eJYBA7vFAkcLiylGNkfY+Kv9iE6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f07F8loa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f07F8loa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9997C19423;
	Mon,  2 Mar 2026 19:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772480186;
	bh=hykRQ85o3s1Gjn5iSxhnQfb+e01yQAaLRqtF/NC2jzw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f07F8loaDEeu7fComjbErz9dn5DwnYEbU45SqlEEuxLhZ6FJNwyJxXb4I+0htVJHT
	 p080N5uXHn5GI+bXWfEyzb1IMmsjNGwVk94wMlKq0JnSm2y0x5tX4tpIEiwXUzO2lr
	 gQBUPOQ75G3KHEJUIaq0nSZNNM+0SVi1VWK3R0JiB/FazSHK0IWzGonSr3wOIj1yt2
	 hcXBSks/VXqdsAnNj90aDMS5+ahNYbUdTfE6QQf5ak4rLTIo5VAfW8S+4T/mGSj0h5
	 oDlQmPoZepGv7wQoTYjqBfxFVQ5xbkTsg528VibV3lv4ypqb7G7mvS9T2GHq86ts7K
	 khJs8hMnkMRMw==
Message-ID: <ff438997-5d76-435e-a2e5-9ac6f8658eb1@kernel.org>
Date: Mon, 2 Mar 2026 13:36:25 -0600
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] platform/x86/amd/pmf: Introduce PMF util layer
 with userspace interface
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Yijun.Shen@Dell.com,
 Sanket.Goswami@amd.com
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/1/26 7:11 AM, Shyam Sundar S K wrote:
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
>    and socket power metrics
> - Verify BIOS input/output policy values during Smart PC operation
> 
> The util layer reads from the existing Trusted Application (TA) shared
> memory buffer and cached BIOS output values, adding no new communication
> overhead with the TA.
> 
> v3:
>   - Stop exporting battery information via util layer.
>   - Optimize the core logic for fetching BIOS outputs.
>   - Update the documentation patch to reflect the current util layer design.
>   - Consolidate amd-pmf-io.h changes into common UAPI header.
>   - Define a single unified uAPI structure and IOCTL.
>   - Address other v2 review remarks [1]
> 
> v2:
>   - address remarks from v1
>   - add a new tool that exercises the IOCTLs from PMF interface
> 
> [1] https://lore.kernel.org/platform-driver-x86/20251111071010.4179492-1-Shyam-sundar.S-k@amd.com/
> 
> Shyam Sundar S K (7):
>    platform/x86/amd/pmf: Add util layer and userspace misc device
>      interface
>    platform/x86/amd/pmf: cache BIOS output values for user-space metrics
>      via util IOCTL
>    platform/x86/amd/pmf: Add feature discovery support to util interface
>    platform/x86/amd/pmf: Store commonly used enums in the header file
>    platform/x86/amd/pmf: Move debug helper functions to UAPI header
>    platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver
>      metrics and features
>    Documentation/ABI: add testing entry for AMD PMF misc device interface
> 
>   .../ABI/testing/misc-amdpmf_interface         |  70 ++++
>   MAINTAINERS                                   |   1 +
>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |   1 +
>   drivers/platform/x86/amd/pmf/Kconfig          |  10 +
>   drivers/platform/x86/amd/pmf/Makefile         |   2 +
>   drivers/platform/x86/amd/pmf/core.c           |   8 +
>   drivers/platform/x86/amd/pmf/pmf.h            |  32 +-
>   drivers/platform/x86/amd/pmf/spc.c            |  55 +--
>   drivers/platform/x86/amd/pmf/tee-if.c         |   9 +-
>   drivers/platform/x86/amd/pmf/util.c           | 210 ++++++++++++
>   include/linux/amd-pmf-io.h                    |   9 -
>   include/uapi/linux/amd-pmf.h                  | 324 ++++++++++++++++++
>   tools/testing/selftests/Makefile              |   1 +
>   .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
>   .../drivers/platform/x86/amd/pmf/test_pmf.c   | 243 +++++++++++++
>   15 files changed, 897 insertions(+), 86 deletions(-)
>   create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
>   create mode 100644 drivers/platform/x86/amd/pmf/util.c
>   create mode 100644 include/uapi/linux/amd-pmf.h
>   create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
>   create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
> 

Thanks, looks good to me.  You can add this to the next version (which 
incorporates Randy's feedback).

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

