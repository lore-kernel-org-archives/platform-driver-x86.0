Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.90.84.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442290;
	b=ytrfj+boPloYYUl2gg1Ju0UDJTB2nDTwwsNTM4a2Um+eVIDuFMC1dFRq10N/VFPlxK2W
	 sT6/9l8M67lE0ltg/JnusyBEtvhYKSFMIxT8h0dV4cnI0aDWH3smSh9bhOGe3rSiiiKIu
	 2WR8B2Htznzw4AzyUMsdUumkkRSeVcGFL8Nrorrdy/TnI6+GhUFWmg3ucYg/wky4U2OSi
	 Rqv+L5++1oSKd0TDL+YGMktfGk+7aUP0wiA8c96o1Y79InhbX6fFCpK+k6hbctTk9owz0
	 xCxdxUOmO1+Px8KBmLUhJI9O5AVdA5h3zR0b6brQ/mhDbtCS3ETYZ6uYAKgKjjCrUMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442290;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qpg+tCW2lV1Cb6vIJNrabJH3++RH01uL5oE5HDDVTJo=;
	b=OU+iQrd8x8VqZYikU8iYHWRVZRENTWcZIkWKm6VZuIpUP65/nZkJAn6NxZGZq4VUiBBH
	 i/b4GC1W2zKo4dI66ccc1xUB7IZJZu40Yx/pm7e1kFrQq8iTK6Ph2tkFb59ihkw3IPuQR
	 pY6ZAP+6BijIhmaMjX3ZL6/Q8D87epEAtecFELwKvDnEuQ+N2tL2RBHqiOormKUHayXGC
	 dCRBhEaAEOToTK9z8ZN0FiWcZbh9wUXbycW4BQX7xTCKJUXgCpLmi8MAfMhETWpxM4H3T
	 BIcoN3zOoXGjXSWUvHJd2f7BKHrpgKbyC9dGKSO9jx2LPgI5wmQza4w31VNkOPQ0AAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuxedocomputers.com;
	spf=pass smtp.mailfrom=tuxedocomputers.com;
	dkim=pass header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b="jyC/7Ve7";
	arc=none smtp.remote-ip=157.90.84.7
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E313E606A31A;
	Mon, 23 Nov 2026 13:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E313E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=jyC/7Ve7
Received: from [10.10.12.8] (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 55AC42FC0049;
	Mon, 23 Nov 2026 14:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1795442286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qpg+tCW2lV1Cb6vIJNrabJH3++RH01uL5oE5HDDVTJo=;
	b=jyC/7Ve7qhJJvt30qsriIrmwG63coAUqVoE7Umz5FBXrGGZNrtlNrL4B9l+2M4ZYPBBpK7
	gBqtA5T3mAVNahdzr9fMcP6VikXc6HmVkZkhSZKhkDPuRd5Z7PEkatEnA/orm3kLzKeKjw
	K6pw/Rq/iIp+7hcMOmkThye6PfwA9OA=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <a07938a4-32e8-4aa5-984c-d17df8054df1@tuxedocomputers.com>
Date: Mon, 23 Nov 2026 14:58:04 +0100
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
Subject: Re: [PATCH 0/4] platform/x86: clevo-laptop: add initial Rust driver
 for keyboard backlight
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
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

First: I never have touched rust code, but I'm not opposed to it in principle. 
Just to excuse a little bit of knowledge gap.

Am 22.11.26 um 05:35 schrieb Nick Dowsett via B4 Relay:
> This series adds a new Rust platform driver MVP (`clevo-laptop`) for
> Clevo barebones and rebranded laptops (Metabox, Tuxedo, Sager, XMG,
> etc.), starting with 5-step white keyboard backlight control.

The driver will have to interact at least with these subsystems when finished 
(If I haven't forgotten any):

- Platform/ACPI
- WMI
- Power Supply/Battery
- LEDs
- Input
- HWMon

And maybe:

- Thermal
- HID
- Component

I don't know how much this influences the feasibility of doing it in rust.

>
> It is intended as the first in-tree user of the Rust WMI abstractions,
> and a starting point to be extended to additional Clevo models and EC
> features.
>
> What's included:
> - Minimal driver skeleton, Kconfig/Makefile plumbing, and MAINTAINERS
>    entry.
> - Type-safe EC WMI query interface.
> - Driver registration and backlight type detection following
>    tuxedo-drivers business rules.

Just wanna make sure what you are referring to here exactly?

Best regards,

Werner

>
> Dependencies (not yet merged):
> - Markus Probst's Rust LED classdev abstractions (v28):
>    https://lore.kernel.org/all/20261113-rust_leds-v28-0-b8cf2f74fa57@posteo.de/
> - Rust WMI abstractions (change-id: 20261119-rust-wmi-c6b0e0fe97a7)
>    https://lore.kernel.org/all/20261122-rust-wmi-v1-0-63111d9e824c@gmail.com/
> - Rust DMI abstractions (change-id: 20261121-rust-dmi-c49d2041d7e2)
>    https://lore.kernel.org/all/20261122-rust-dmi-v1-1-4ace9449f872@gmail.com/
>
> Tested on a Clevo/Metabox NL57AU laptop.
>
> Signed-off-by: Nick Dowsett <nick42d@gmail.com>
> ---
> Nick Dowsett (4):
>        platform/x86: clevo-laptop: add minimal WMI driver skeleton and Kbuild plumbing
>        platform/x86: clevo-laptop: add EC WMI query interface and BIOS feature check
>        platform/x86: clevo-laptop: probe keyboard backlight type and detect 5-step white backlight
>        platform/x86: clevo-laptop: register 5-step white keyboard backlight LED device
>
>   MAINTAINERS                          |   6 +
>   drivers/platform/x86/Kconfig         |  17 ++
>   drivers/platform/x86/Makefile        |   3 +
>   drivers/platform/x86/clevo-laptop.rs | 387 +++++++++++++++++++++++++++++++++++
>   4 files changed, 413 insertions(+)
> ---
> base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
> change-id: 20261120-clevo-laptop-170d658cd678
>
> Best regards,
> --
> Nick Dowsett <nick42d@gmail.com>
>
>
