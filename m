Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2E48C3F2
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816946; cv=none; b=a9JsPbkFT8+E6dzlv1+p3YOHoePNiJCUU830r2Xjhxzi0qPKWzH93okiYDnUj2gbimvbIo3Lh0/OD5lYhhvMC4aW+YyxvE1QoB2PCg8rQzq6xQ254csqoPEqDeyFIZcXOcb6wdWdXCPpiBINpAe4d7WpT4+x59nyfeOXRqkAplU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816946; c=relaxed/simple;
	bh=AhttMrp+PXfhsEYmvPrxm5FvbgokME69h6BPiFkGNq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvNi9SnEZscZKOLksoxxU/NFAdRXFY5R/b4DmR2amVq3Bi9bbxIarhzXigoKpHpZ9LBAVUmYFZ3d5S18xXCo+xqLV1qHZaLIgZ92qQeOQpwQikjEm3GkBWWqRi6Db+SYPLUxFJn4eapdJlaOENdJPrKc1ASoEuzFrAJGJOYceLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGAUIEG7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGAUIEG7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB751F0089B;
	Mon, 12 Oct 2026 14:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791816945;
	bh=+T1p4KFMTv/TDUyoECaxhqm8+VMkn3vBD6X2tt4V9B4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LGAUIEG7QtzbMl1Z3YAPHzt3HrUrgyuooUf/Ew0DM/Srj7tMLXI/n6tHnofMSYvZB
	 2nU8lxixAE4EHiCwaV3arUkLBwyKvHgZxe7w1Ac1DWpNnZ5OHQOv0cCtniO61mYlym
	 uVY/+CCc5SLSezA/bDt5OgSwZttad67A9YjCfb126WiFdrrI1hdyEHd6FmVDFIjEm1
	 5bVMswP4JDHAjKwBAkpCmULFKZF2eAll7lUkDoQSANcsSeiEtVXppHUz7PPfiERj56
	 LXlPEBN+h2KZaVj7an6Xgn3mvg1fgHDVlw++iPmkgQbk3PKvaYVzt28y5xIydavLoo
	 76tGQPWr6NIAg==
Message-ID: <2868d7ee-66f0-42ac-a925-eda52b63b65f@kernel.org>
Date: Mon, 12 Oct 2026 09:55:42 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] platform/x86/amd/wmi: Add AMD Overclocking (AOD) WMI
 driver
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org
References: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/10/26 14:05, Shyam Sundar S K wrote:
> AMD Ryzen platforms implement the AMD Overclocking (AOD) interface in the
> platform firmware and expose it through a WMI device. On Windows, this
> interface is used by AMD Ryzen Master to change settings like the CPU
> power and current limits.
> 
> This series adds a driver for this WMI device. This is an initial version
> of the driver that exposes a small set of settings through sysfs:
> 
>   - PPT, TDC and EDC limits along with their supported range and step size
>   - SMT enable
>   - current memory clock (read-only)
> 
> The firmware applies new values on the next reboot and does not report
> the active PPT, TDC and EDC limits, so these attributes are write-only.
> 
> AOD and HSMP both touch the socket power limit, but at different levels.
> AOD changes the firmware setup option (the PBO PPT limit), which is stored
> and applies on the next boot. HSMP changes the runtime limit in the SMU,
> which takes effect immediately and is lost on reboot. This driver only
> deals with the former.
> 
> The firmware supports many more commands, and the sysfs interface can
> grow as needed. The raw WMI methods are made available through debugfs
> for debugging and platform bring-up, this is not a stable ABI.
> 
> Patch 1 adds the driver with the sysfs interface, patch 2 adds the
> debugfs interface and patch 3 documents the WMI interface.
> 
> The new drivers/platform/x86/amd/wmi/ directory is meant to collect the
> AMD WMI drivers over time, along the lines of drivers/platform/x86/lenovo/:
> 
>   - one driver per WMI GUID, with its own Kconfig symbol
>   - aod.c (this series) is the first driver in this directory
>   - amd_halo_led.c would move here later as a separate series
>   - shared code goes into a common helper file once there is a real user
>     for it

+1 for the new directory structure and moving WMI drivers accordingly.

I have one comment about patch 2, but otherwise LGTM.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>>
> Shyam Sundar S K (3):
>    platform/x86/amd/wmi: Add AMD Overclocking (AOD) WMI driver
>    platform/x86/amd/wmi: aod: Add debugfs interface for raw WMI access
>    platform/x86/amd/wmi: aod: Document the WMI interface
> 
>   .../ABI/testing/sysfs-platform-amd-wmi-aod    |  98 ++
>   Documentation/wmi/devices/amd-wmi-aod.rst     | 291 ++++++
>   MAINTAINERS                                   |   8 +
>   drivers/platform/x86/amd/Kconfig              |   1 +
>   drivers/platform/x86/amd/Makefile             |   1 +
>   drivers/platform/x86/amd/wmi/Kconfig          |  19 +
>   drivers/platform/x86/amd/wmi/Makefile         |   8 +
>   drivers/platform/x86/amd/wmi/aod.c            | 916 ++++++++++++++++++
>   8 files changed, 1342 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
>   create mode 100644 Documentation/wmi/devices/amd-wmi-aod.rst
>   create mode 100644 drivers/platform/x86/amd/wmi/Kconfig
>   create mode 100644 drivers/platform/x86/amd/wmi/Makefile
>   create mode 100644 drivers/platform/x86/amd/wmi/aod.c
> 
> 
> base-commit: 69f80fef3153299d9c72c53d1d71eef6354b6926

