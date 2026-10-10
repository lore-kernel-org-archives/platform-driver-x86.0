Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933CD3D7D97;
	Sat, 10 Oct 2026 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791632471; cv=none; b=rH5SLSI/fRFQa/0h1htayPev4jF9wwmZVA291VyYHngLB2OtXibvPF845Uxr6Ihvo9tKgyNxDTJoHTRfiZ5GNI5QBEZ5S/loRVDbhE7+dgeuQfnB/Y9vpjWLZWxjBVLW3g0ZqjuAMBQ+hejiRfTVYVpyC0lLuKqTs6Yr02nU5MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791632471; c=relaxed/simple;
	bh=ZYidxo02IVYvWFU8lpFRO4Ud7msb9FfXKfMIKHtb0EE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psrf+q5PofoEWxXDMZohq0IQSCLTlug2ccSGYkgQSagzG5LMJlZX7/hVdE98pRaXM9aVa7AkJ18Rpwi+e15J1VlzqGVwbeZu6Cwg3B3SW4QMQY4tNVLfSpw5ot+rhpEI9tMlDUl+3eE3oSMtOW36czYAvOiZwyVz7Ttz406s6EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkEv5zFU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkEv5zFU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F131F000FF;
	Sat, 10 Oct 2026 11:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791632470;
	bh=9SjSqb1bat/dMzzvu2mKqVLDhkDoigTG6FM2iaQiuTc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZkEv5zFUodlYTzIPxYlhLNVZxaBuvWzPrk40lEHkXjq8QIe653OaWonsBuVm1KlS+
	 rSsGMO5YyvJzS8Ky57W9MwPUxWbMSi4Bf0Npc0QHVi+MKU+f4YAziMp41Rv2i1svk5
	 g+TOAJqZ2t7pO8aUtr0rHRhWVoGveDNoSdIGYID9wu6BKyk5lLbOASrbFVP30SUZZV
	 PeEpGHT8XJK2L0gF9Z1dpGQUOd8kP7Fk60r4S2SKXxWX7gazelr6uTfpApeDr1H+L+
	 kxMUV3BRFbZXA/mSF0JS3d2u+jK+oW+skoqw84U8mWjO/kBEeGSCn+hkTxuh3fdpch
	 pIZ8BGdtmKHOw==
Message-ID: <b4223bbc-888b-43af-8c47-18af5475d8ba@kernel.org>
Date: Sat, 10 Oct 2026 13:41:04 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] platform/x86: dell-uart-backlight: fall back to
 PCH PWM on UART timeout
To: chitranshmandhaniya@gmail.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chitransh_Mandhaniya@dell.com
References: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
 <20261010102012.110394-1-chitranshmandhaniya@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261010102012.110394-1-chitranshmandhaniya@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Chitransh,

On 10-Oct-26 12:20 PM, chitranshmandhaniya@gmail.com wrote:
> From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
> 
> Some Dell OptiPlex AIO 7410 (35W) ship with DELL0501 in ACPI but no
> physical UART scalar board, leaving the machine with zero backlight
> control after the UART probe times out.
> 
> Patch 1 is a preparatory refactor that extracts the UART initialization
> sequence into dell_uart_bl_init() so the probe function can inspect its
> return value.
> 
> Patch 2 adds a PCH PWM fallback path: when dell_uart_bl_init() returns
> -ETIMEDOUT, the driver reads the Intel PCH BLC_PWM registers and
> registers a BACKLIGHT_PLATFORM device.

Thank you for working on this, but directly doing mmio pokes on
an mmio range managed by the i915 driver is not okay:

NACK for this patch-series / this approach.

You should be able to work around this problem by passing:

acpi_backlight=native

on the kernel command-line which causes acpi_video_get_backlight_type()
to properly return native as type.

After confirming that that works, you can fix this permanently by
extending the existing DMI quirks for this in drivers/acpi/video_detect.c:

	/*
	 * Dell AIO (All in Ones) which advertise an UART attached backlight
	 * controller board in their ACPI tables (and may even have one), but
	 * which need native backlight control nevertheless.
	 */
	{
	 /* https://github.com/zabbly/linux/issues/26 */
	 .callback = video_detect_force_native,
	 /* Dell OptiPlex 5480 AIO */
	 .matches = {
		DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
		DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 5480 AIO"),
		},
	},
	{
	 /* https://bugzilla.redhat.com/show_bug.cgi?id=2303936 */
	 .callback = video_detect_force_native,
	 /* Dell OptiPlex 7760 AIO */
	 .matches = {
		DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
		DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7760 AIO"),
		},
	},
	{
	 .callback = video_detect_force_native,
	 /* Dell OptiPlex 7770 AIO */
	 .matches = {
		DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
		DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7770 AIO"),
		},
	},


Regards,

Hans





> 
> v3 -> v4:
>   - Revert __free(pci_dev_put) to manual pci_dev_put() calls to fix
>     build error when CONFIG_PCI is disabled (kernel test robot)
> 
> v2 -> v3:
>   - Split into two patches: preparatory refactor + fallback (Ilpo)
> 
> v1 -> v2:
>   - Use SZ_16 instead of 0x10, add linux/sizes.h (Ilpo)
>   - Name BIT(31) as PCH_BLC_PWM_ENABLE (Ilpo)
>   - Fix double-space in block comment (Ilpo)
>   - Reduce devm_backlight_device_register() to fewer lines (Ilpo)
>   - Extract dell_uart_bl_init() for the normal UART backlight path (Ilpo)
> 
> Chitransh Mandhaniya (2):
>   platform/x86: dell-uart-backlight: extract dell_uart_bl_init() from
>     probe
>   platform/x86: dell-uart-backlight: fall back to PCH PWM on UART
>     timeout
> 
>  .../platform/x86/dell/dell-uart-backlight.c   | 158 +++++++++++++++---
>  1 file changed, 135 insertions(+), 23 deletions(-)
> 

