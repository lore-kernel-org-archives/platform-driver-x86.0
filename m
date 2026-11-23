Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.90.84.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443155;
	b=a5OUGrqcxftlzzlyV2tjLrvBOZa38ag0D4j8j3Ck8ME5wW3BXT+wzTCI41bazE9/UDq6
	 qSA1BHXVvB9ppOLah7OdAbqfNc2SnLwwbvJLTCfwG79y1RnQQu+1g4n9gca+hnpqTOJgT
	 uuxvFxeNaHxynIQebHo/U7E0qpe5ytNpEnan7OJodZ1LvNULrfNVDKxw866F8f7UKJh2m
	 qO7KESkKB0UoElx2TI0s5/IbfBVIo1Z9sEhjj7kf1FX0QWBPYTT5wmHxetrCBXAD1m5lM
	 XV35zKwRpiDaZ0vOrELZ3CtEkG5+w7CDhmiMxRRhYhtTB/bQ8SJpfw+vNzhKRMK2y0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443155;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5zJGdb0taAzL83pUSPdPIFK41PcMxbxbayAH1/2w8bw=;
	b=FXNN01jdLvrEDY5ImDFJzOmMDpNmeywb8KZ/mnDST0axZVYEXg/IC48FtS1NQBybV0om
	 KCN6n8iSKOJYVDaX5lVv71tZw+gyLEZaFT5yBUq10kzWS8wc+B8xLSS1B7xxdffVW7IUD
	 6LWmZT5ZqteLHHph/1BhuyB9szrVIJ6zoTkKI7llycp0reFAZ9iLgeZRY3RMX0LeTiBY8
	 be/Dd1gz5V1uXvTu60crzGxSVTPe0+73baG35TEAnnplPAcKic4Oa2Vmck0K29S0kt1z0
	 OCghxAm00l2naVzgjVC7z4hbYQUJTYBkp2Q6vkuaGcHvZ2xxk/IFCyO1Xp+kc+sQ0iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuxedocomputers.com;
	spf=pass smtp.mailfrom=tuxedocomputers.com;
	dkim=pass header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=NoVMhOMv;
	arc=none smtp.remote-ip=157.90.84.7
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83789606A31E;
	Mon, 23 Nov 2026 14:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83789606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=NoVMhOMv
Received: from [10.10.12.8] (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 01E562FC0049;
	Mon, 23 Nov 2026 15:12:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1795443152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5zJGdb0taAzL83pUSPdPIFK41PcMxbxbayAH1/2w8bw=;
	b=NoVMhOMvEZzJDP8kbZWNq53uQKVF3ZvJQdSFMC9wPonzxeDdIeUJ0u+Tv116lQbUK6nOsd
	5NOwBUb/9L4loq6RpVy+D+p+j3xhVkwd/OhaVwbu+GWRMu5xSgUcfJlpfEQq4VgJ/YTumN
	g2lGMKRixbl3xWbkhCxOcl2ybp1M62Q=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <b5f96ec9-ee4c-44c8-8451-9f40bed43290@tuxedocomputers.com>
Date: Mon, 23 Nov 2026 15:12:30 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] platform/x86: clevo-laptop: add minimal WMI driver
 skeleton and Kbuild plumbing
To: nick42d@gmail.com, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.com>
 <20261122-clevo-laptop-v1-1-881debf4d4b0@gmail.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20261122-clevo-laptop-v1-1-881debf4d4b0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 22.11.26 um 05:35 schrieb Nick Dowsett via B4 Relay:
> From: Nick Dowsett <nick42d@gmail.com>
>
> - Add `drivers/platform/x86/clevo-laptop.rs` with module implementation,
>    DMI board check, and Driver registration.
> - Add Kconfig and MAINTAINERS entries and Makefile wiring.
>
> Signed-off-by: Nick Dowsett <nick42d@gmail.com>
> ---
>   MAINTAINERS                          |  6 +++
>   drivers/platform/x86/Kconfig         | 17 +++++++++
>   drivers/platform/x86/Makefile        |  3 ++
>   drivers/platform/x86/clevo-laptop.rs | 72 ++++++++++++++++++++++++++++++++++++
>   4 files changed, 98 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 44540a1eb2b8..1130c293e84d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6566,6 +6566,12 @@ F:	scripts/Makefile.clang
>   F:	scripts/clang-tools/
>   K:	\b(?i:clang|llvm)\b
>   
> +CLEVO LAPTOP DRIVER
> +M:	Nick Dowsett <nick42d@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/clevo-laptop.rs
> +
>   CLK API
>   M:	Russell King <linux@armlinux.org.uk>
>   L:	linux-clk@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 9ce384e0475e..18aa4550c9f4 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1059,6 +1059,23 @@ config OXP_EC
>   
>   source "drivers/platform/x86/tuxedo/Kconfig"
>   
> +config CLEVO_LAPTOP
> +	tristate "Clevo Laptop Platform Driver"
> +	depends on RUST
> +	depends on ACPI_WMI=y
> +	depends on DMI
> +	depends on LEDS_CLASS
> +	help
> +	  This driver provides platform support for Clevo barebones and
> +	  rebranded laptops (Tuxedo, Metabox, Sager, XMG, etc.).
> +	  Currently only Clevo NLx0AU boards (e.g. Metabox Edge NL57AU)
> +	  with a 5-step white keyboard backlight are supported over WMI.
> +	  It is intended to be extended with additional Clevo models and
> +	  EC features over time.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called clevo-laptop.
> +

TUXEDO is officially all caps.

Technically all clevo barebones are rebranded and it is sometimes more then just 
rebranding.

Maybe just drop everything behind the "and".

>   endif # X86_PLATFORM_DEVICES
>   
>   config P2SB
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 229057234d00..070af05a2064 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -158,6 +158,9 @@ obj-$(CONFIG_SILICOM_PLATFORM)		+= silicom-platform.o
>   # TUXEDO
>   obj-y					+= tuxedo/
>   
> +# Clevo
> +obj-$(CONFIG_CLEVO_LAPTOP)		+= clevo-laptop.o
> +
>   # Winmate
>   obj-$(CONFIG_WINMATE_FM07_KEYS)		+= winmate-fm07-keys.o
>   
> diff --git a/drivers/platform/x86/clevo-laptop.rs b/drivers/platform/x86/clevo-laptop.rs
> new file mode 100644
> index 000000000000..1d862c57b3fe
> --- /dev/null
> +++ b/drivers/platform/x86/clevo-laptop.rs
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Clevo Laptop Driver.
> +//!
> +//! Currently supports only the 5-step white keyboard backlight on Clevo
> +//! NLx0AU boards (e.g., Metabox Edge NL57AU).
> +//!
> +//! Copyright (C) 2026 Nick Dowsett <nick42d@gmail.com>.
> +//!
> +//! Inspired by Tuxedo Computers' drivers.
> +
> +use kernel::{
> +    device,
> +    dmi,
> +    prelude::*,
> +    wmi, //
> +};
> +
> +/// # Note
> +///
> +/// This GUID is non-unique (shared by Uniwill for example) and cannot be trusted
> +/// to uniquely identify a Clevo device.
> +const CLEVO_WMI_METHOD_GUID: &CStr = c"ABBC0F6D-8EA1-11D1-00A0-C90629100000";
> +/// DMI board name allowlist, restricted to tested boards since the WMI GUID is not
> +/// unique.
> +const SUPPORTED_BOARDS: &[&CStr] = &[c"NLx0AU"];
> +
> +module! {
> +    type: ClevoLaptopModule,
> +    name: "clevo-laptop",
> +    authors: ["Nick Dowsett <nick42d@gmail.com>"],
> +    description: "Clevo Laptop Driver (Keyboard Backlight)",
> +    license: "GPL",
> +}
> +
> +/// RAII guard for Clevo Laptop Module holding all subsystem drivers e.g WMI.
> +#[pin_data]
> +struct ClevoLaptopModule {
> +    #[pin]
> +    _wmi_driver: wmi::Registration<WmiDriver>,
> +}
> +
> +impl kernel::InPlaceModule for ClevoLaptopModule {
> +    fn init(module: &'static ThisModule) -> impl PinInit<Self, Error> {
> +        pin_init::pin_init_scope(move || {
> +            if dmi::get_system_info(dmi::Field::BoardName)
> +                .is_none_or(|board| !SUPPORTED_BOARDS.contains(&board))

We most likely need more complex matching here in the future.

Is dmi_system_id table matching available in rust for the linux kernel?

> +            {
> +                return Err(ENODEV);
> +            }
> +            Ok(try_pin_init!(Self {
> +                _wmi_driver <- wmi::Registration::new(c"clevo-laptop", module),
> +            }))
> +        })
> +    }
> +}
> +
> +/// RAII guard for Clevo WMI driver holding all subsystem devices e.g LED device.
> +#[pin_data]
> +struct WmiDriver {}
> +
> +kernel::wmi_device_table!(WMI_TABLE, [wmi::DeviceId::new(CLEVO_WMI_METHOD_GUID)]);
> +
> +impl wmi::Driver for WmiDriver {
> +    type Data<'bound> = WmiDriver;
> +    const ID_TABLE: wmi::IdTable = &WMI_TABLE;
> +    fn probe<'bound>(
> +        _dev: &'bound wmi::Device<device::Core<'_>>,
> +    ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
> +        try_pin_init!(WmiDriver {})
> +    }
> +}
>
