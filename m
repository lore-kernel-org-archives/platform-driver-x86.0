Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634DD2580EC
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475200; cv=none; b=Ghh6CpyZxJmlgj4hB74l1u2CP3QbZlXsMaTPKg/nyRdLwPUmPdIiP3fnAzS+GEcsdRbWxeYQuKkvrcUZGA0VozwxTDsSPokIKLYgjt3y/+Y+PZUoASnpve3WU3g7HoK+ZACaE7nM3eZ5x9eAJcHHdGrOfTF+HqlS9B9ZCl/Izqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475200; c=relaxed/simple;
	bh=6R4EEcIpWhwwuIu7kZ6hJM6luFEg5I1xT4+BLR7QTR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnrMUNvVTQxmCRLlOweQds7WWKh1oAAXOTsSHmMaqGsPeD2Qxb4Xlg0bXBsy9bHQji3c9hu5OU+uSgNH32jDHxMfhbNoLXCF8GlNsMe8sHi3t9XhUn7n37ZPi0YLNBKIoiHTnBz6peQmXfZhQSzzB/3aOdeAp1U6M8VjAPbDunU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjrePA2k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjrePA2k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF27C4CEEB;
	Mon,  9 Jun 2025 13:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749475200;
	bh=6R4EEcIpWhwwuIu7kZ6hJM6luFEg5I1xT4+BLR7QTR4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QjrePA2k0Tat39/S52voGfqFr/RAW7NO2fZucCsKTVDWzFyuSWjGXT1R85PG+IntC
	 9k0s9dHv0Y+4PRwobgmhAPsvraWJibJ7NIqxkqYixhDmeu56N8AdXhlQwMiaLFCHzz
	 v9MC93w2eoZ6u45EKWVzc2QRk5KIRHymC2Vs7xctUwSM+zS8f0TpNflabSC+jSr0B4
	 7bg32PyaJUhWEwp3vlVAv15b+puQjpiwE1NEObgpVXmtX1rp/tWZUtgh1MLiFDUZ6j
	 DM5gt0b1OqTZkJYNXl9A9H4a/DB0vTMaZzzTlMDY/A5JS1tzVLrkGluQk8aTxI+83x
	 IrD4h18Sjr45A==
Message-ID: <6a45d8b5-741f-4b98-b12a-5dbc7ffe3376@kernel.org>
Date: Mon, 9 Jun 2025 15:19:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] MAINTAINERS: .mailmap: Update Hans de Goede's email
 address
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20250609125653.29882-1-hansg@kernel.org>
 <20250609125653.29882-2-hansg@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250609125653.29882-2-hansg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9-Jun-25 2:56 PM, Hans de Goede wrote:
> I'm moving all my kernel work over to using my kernel.org email address.
> Update .mailmap and my platform (x86 and adjacent) MAINTAINER entries.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>

Self-nack. my split of the MAINTAINER changes into
pdx86 (and adjacent) + hwmon + drm + input still leaves
some unmodified MAINTAINERS entries. So I'm going to add
a few more changes here for v2.

Regards,

Hans




> ---
>  .mailmap    |  1 +
>  MAINTAINERS | 26 +++++++++++++-------------
>  2 files changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 9b0dc7c30e6d..6ea2677ae494 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -276,6 +276,7 @@ Gustavo Padovan <gustavo@las.ic.unicamp.br>
>  Gustavo Padovan <padovan@profusion.mobi>
>  Hamza Mahfooz <hamzamahfooz@linux.microsoft.com> <hamza.mahfooz@amd.com>
>  Hanjun Guo <guohanjun@huawei.com> <hanjun.guo@linaro.org>
> +Hans de Goede <hansg@kernel.org> <hdegoede@redhat.com>
>  Hans Verkuil <hverkuil@xs4all.nl> <hansverk@cisco.com>
>  Hans Verkuil <hverkuil@xs4all.nl> <hverkuil-cisco@xs4all.nl>
>  Harry Yoo <harry.yoo@oracle.com> <42.hyeyoo@gmail.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b8a8d8a5a2e1..9bcf277ab1be 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -371,7 +371,7 @@ S:	Maintained
>  F:	drivers/platform/x86/quickstart.c
>  
>  ACPI SERIAL MULTI INSTANTIATE DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/serial-multi-instantiate.c
> @@ -3506,7 +3506,7 @@ F:	arch/arm64/boot/Makefile
>  F:	scripts/make_fit.py
>  
>  ARM64 PLATFORM DRIVERS
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>  R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  L:	platform-driver-x86@vger.kernel.org
> @@ -3667,7 +3667,7 @@ F:	drivers/platform/x86/asus*.c
>  F:	drivers/platform/x86/eeepc*.c
>  
>  ASUS TF103C DOCK DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> @@ -6844,7 +6844,7 @@ F:	include/dt-bindings/pmu/exynos_ppmu.h
>  F:	include/linux/devfreq-event.h
>  
>  DEVICE RESOURCE MANAGEMENT HELPERS
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  R:	Matti Vaittinen <mazziesaccount@gmail.com>
>  S:	Maintained
>  F:	include/linux/devm-helpers.h
> @@ -10139,7 +10139,7 @@ F:	include/dt-bindings/clock/google,gs101.h
>  K:	[gG]oogle.?[tT]ensor
>  
>  GPD POCKET FAN DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/gpd-pocket-fan.c
> @@ -11287,7 +11287,7 @@ F:	drivers/i2c/busses/i2c-via.c
>  F:	drivers/i2c/busses/i2c-viapro.c
>  
>  I2C/SMBUS INTEL CHT WHISKEY COVE PMIC DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
>  F:	drivers/i2c/busses/i2c-cht-wc.c
> @@ -11868,13 +11868,13 @@ S:	Supported
>  F:	sound/soc/intel/
>  
>  INTEL ATOMISP2 DUMMY / POWER-MANAGEMENT DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/intel/atomisp2/pm.c
>  
>  INTEL ATOMISP2 LED DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/intel/atomisp2/led.c
> @@ -13585,7 +13585,7 @@ F:	drivers/ata/sata_gemini.c
>  F:	drivers/ata/sata_gemini.h
>  
>  LIBATA SATA AHCI PLATFORM devices support
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-ide@vger.kernel.org
>  S:	Maintained
>  F:	drivers/ata/ahci_platform.c
> @@ -15414,7 +15414,7 @@ Q:	https://patchwork.kernel.org/project/netdevbpf/list/
>  F:	drivers/net/ethernet/mellanox/mlxfw/
>  
>  MELLANOX HARDWARE PLATFORM SUPPORT
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>  M:	Vadim Pasternak <vadimp@nvidia.com>
>  L:	platform-driver-x86@vger.kernel.org
> @@ -16332,7 +16332,7 @@ S:	Maintained
>  F:	drivers/platform/surface/surface_gpe.c
>  
>  MICROSOFT SURFACE HARDWARE PLATFORM SUPPORT
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>  M:	Maximilian Luz <luzmaximilian@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> @@ -26516,14 +26516,14 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
>  F:	arch/x86/mm/
>  
>  X86 PLATFORM ANDROID TABLETS DSDT FIXUP DRIVER
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>  F:	drivers/platform/x86/x86-android-tablets/
>  
>  X86 PLATFORM DRIVERS
> -M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained

