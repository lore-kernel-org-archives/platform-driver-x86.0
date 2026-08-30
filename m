Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439043002DD;
	Sun, 30 Aug 2026 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788093128; cv=none; b=nXS8YKC96qZHURH2HU3u2vKCl6IHpBRS+1KH9bjZvj2m49CRG3JY6xlt6CgeGxAfAzfI4oZM63Ev4tSnk60Abp0HfwQgyKjW4kLGFJx32nwPh0eG2mWcb5VQZM6bvUhdnMdxjvLcTh4v1QrJNuWfpGhimLoWlC5DZKuVrRGmXgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788093128; c=relaxed/simple;
	bh=+SQlbwVsi0Xy0A0F0vLWdgCjWJgSzJyabvJ6X8kpZCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=itqvEjnY7sO/Rfc3UKxPGkjW04Hwq/02xl4eSwtqmLg5KTukVdnW5pMLl3w/voRpjOjFHMSya7jDhZP2o16bbjsujkhaQ5E3o1fthjOXad/L2tS7HYGoFRyuG1Ix5ZzPOuR2UTxOefmDOHIB0kfItC8+5aDHPVy584A3FGCg+wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9ElfUVe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9ElfUVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E5B1F000E9;
	Sun, 30 Aug 2026 12:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788093126;
	bh=L8MI8dWJKh7fTx2tojrm0Hj39u2L4UwbqCTCYCjG1Xs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=m9ElfUVehxKipxWANwQ8IbirbQZ1d71BquBtg1ufG1zIhJVM2/NjgpmXVmvyqWfZT
	 Y9r/iaFUPYwD5C68TwrlIUE7i6rOnPGb1X1YO+Qs1UZi2ZO10sCGcUY5ZYgS5z4tYY
	 u/XrVOldxy27HOh2pKM0HnhD6oGxYqEyDmE/nq6siYqvQHzVyn/2GRqAUUSyNx7pQR
	 6fF8q9XXfEN+Kn0OpOiJ1qoYmFQhMLj3J9OoCOeKmVS6dLS/dNg76o7bfKHOCsiCkq
	 hquJPF97jiUJh6uQiqE2k0TpUHzbhvXv2ZdOhd2Vjnx0ZwBNhtRGmKBx8+9R5wPrDP
	 7J8SmRWmWWkdQ==
Message-ID: <9b07fedf-57a4-4291-9db5-415dca5ad480@kernel.org>
Date: Sun, 30 Aug 2026 14:32:04 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: int3472: discrete: 4-char GPIO supply name limit and unhandled
 vendor GPIO type 0x08 leave OV8865 unpowered (Surface Pro 7+)
To: "D. Manresa" <dmanresa@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827232634.93131-1-dmanresa@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260827232634.93131-1-dmanresa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 28-Aug-26 01:26, D. Manresa wrote:
> Hi,
> 
> On the Microsoft Surface Pro 7+ the rear camera (OV8865, ACPI INT347A)
> can never be powered up by the int3472 driver, for two independent
> reasons: its second power rail is declared by ACPI with the
> vendor-specific _DSM GPIO type 0x08, which the driver does not handle,
> and even if it were handled, the supply name the ov8865 driver most
> plausibly needs ("dovdd") cannot be expressed at all because
> GPIO_SUPPLY_NAME_LENGTH only allows 4 characters plus NUL. A related
> con_id mismatch also leaves the OV7251 IR camera (INT347E) unpowered.

There already is a patch on the list fixing this:

https://lore.kernel.org/platform-driver-x86/20260829-sp7plus-int3472-v3-1-454b50485ce2@berg.pm/

Regards,

Hans






> Hardware / kernel
> -----------------
> - Microsoft Surface Pro 7+, IPU6 Tiger Lake (PCI 8086:9a19)
> - rear OV8865 at ACPI INT347A, discrete PMIC INT3472:01
> - IR OV7251 at ACPI INT347E
> - observed on linux-surface 6.19.8-surface-3 (base v6.19.8)
> 
> All file/line references below are against mainline v6.19. The
> linux-surface patchset does modify this area (see below); where the
> observed dmesg comes from its downstream patch this is marked.
> 
> 1) GPIO_SUPPLY_NAME_LENGTH cannot hold "dovdd"
> ----------------------------------------------
> include/linux/platform_data/x86/int3472.h:36:
> 
> 	/* E.g. "avdd\0" */
> 	#define GPIO_SUPPLY_NAME_LENGTH				5
> 
> and skl_int3472_register_regulator() enforces it,
> drivers/platform/x86/intel/int3472/clk_and_regulator.c:204:
> 
> 	if (strlen(supply_name) >= GPIO_SUPPLY_NAME_LENGTH) {
> 		dev_err(int3472->dev, "supply-name '%s' length too long\n",
> 			supply_name);
> 		return -E2BIG;
> 	}
> 
> "dovdd" is the standard OmniVision I/O rail name and is what sensor
> drivers actually request, e.g. drivers/media/i2c/ov8865.c:2970:
> 
> 	sensor->dovdd = devm_regulator_get(dev, "dovdd");
> 
> At 5 characters it is rejected, so no int3472_gpio_map[] entry and no
> future type mapping can ever route a GPIO-gated regulator to a sensor
> driver's "dovdd" supply. (The buffer that motivates the limit is
> supply_name_upper[GPIO_SUPPLY_NAME_LENGTH] at int3472.h:101.)
> 
> 2) GPIO type 0x08 is declared by this platform and unhandled
> ------------------------------------------------------------
> The _DSM of INT3472:01 declares a second power GPIO (pin 0xaf) with
> type 0x08. In mainline, int3472_get_con_id_and_polarity()
> (drivers/platform/x86/intel/int3472/discrete.c:169) falls through to
> the default case (con_id "unknown", discrete.c:232), and
> skl_int3472_handle_gpio_resources() then ignores the pin entirely with
> the warning at discrete.c:376:
> 
> 	"GPIO type 0x%02x unknown; the sensor may not work\n"
> 
> The warning is accurate: with only the type 0x0b rail powered
> (registered as "avdd"), the sensor's first I2C access fails with
> -EREMOTEIO and probe dies. Verbatim dmesg from this machine (note:
> this kernel carries the linux-surface downstream patch,
> patches/6.19/0013-cameras.patch, added for the Surface Pro 9, which
> registers type 0x08 as a regulator under con_id "pwr1"; the first
> three lines are from that patch and would not appear on pure
> mainline -- the end result is identical because no sensor driver
> requests a "pwr1" supply):
> 
> 	int3472-discrete INT3472:01: GPIO type 0x08 detected on pin 0xaf
> 	int3472-discrete INT3472:01:   con_id=pwr1, flags=0x0
> 	int3472-discrete INT3472:01:   register_regulator returned: 0
> 	ov8865 i2c-INT347A:00: supply dvdd not found, using dummy regulator
> 	ov8865 i2c-INT347A:00: supply dovdd not found, using dummy regulator
> 	ov8865 i2c-INT347A:00: failed to perform sw reset
> 	ov8865 i2c-INT347A:00: Error -121 runtime-resuming sensor, cannot
> 	 instantiate VCM
> 
> 3) The rail is real: mapping it powers the sensor
> -------------------------------------------------
> Mapping the type 0x08 GPIO to INT3472_GPIO_TYPE_POWER_ENABLE with
> con_id "dvdd" makes the OV8865 probe and stream correctly (verified,
> including the dw9719 VCM coming up). Which physical rail the GPIO
> gates (DVDD or DOVDD) is unknown -- ACPI provides no name, and "dovdd"
> cannot even be tried because of (1).
> 
> Related: the INT347E (OV7251) power-enable GPIO is registered with the
> default con_id "avdd" (discrete.c:222), but the ov7251 driver requests
> vdda/vddd/vdddo, so that sensor is never powered either:
> 
> 	ov7251 i2c-INT347E:00: ov7251_write_reg: write reg error -121:
> 	 reg=103, val=1
> 	ov7251 i2c-INT347E:00: probe with driver ov7251 failed with
> 	 error -121
> 
> An int3472_gpio_map[] entry mapping INT347E POWER_ENABLE to "vdda"
> fixes that one; it fits the existing mechanism.
> 
> Reproducer
> ----------
> Boot a Surface Pro 7+ on mainline v6.19 with the IPU6/ipu-bridge stack
> and the ov8865/ov7251 drivers enabled. int3472 warns about GPIO type
> 0x08 and both sensors fail probe with -121 as above. (Note the INT3472
> GPIO enumeration only happens at probe, so each test needs a fresh
> boot or driver rebind.)
> 
> Workaround
> ----------
> We currently carry a local patch (not proposed as the proper fix):
> it maps type 0x08 on INT347A to a power-enable regulator whose con_id
> is a module parameter defaulting to "dvdd", and adds the INT347E ->
> "vdda" map entry:
> 
> https://github.com/dmanresa-saes/surface-ipu6-cameras
> (patches/int3472-surface-sensors.patch)
> 
> Open questions before attempting a real fix:
> 
> - Should GPIO_SUPPLY_NAME_LENGTH simply be raised to 6 so "dovdd"
>   fits, or is the limit load-bearing somewhere beyond the two arrays
>   in int3472.h?
> - Since ACPI does not say which rail a power GPIO feeds, is a
>   per-sensor (HID + type -> con_id) table like int3472_gpio_map[] the
>   right place for these, entry by entry? That does not scale well.
> - Is there any documentation of the vendor _DSM GPIO types 0x08 (and
>   0x10, also seen on Surface devices) from the Windows camera stack
>   side that would let them be handled generically?
> 
> Happy to test patches on this hardware.
> 
> This report was drafted with AI assistance (Anthropic Claude) and
> verified on the actual hardware by the undersigned.
> 
> D. Manresa <dmanresa@gmail.com>

