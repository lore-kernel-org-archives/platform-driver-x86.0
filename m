Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510231;
	b=mBy1fGgmRtZlxLd+6VIvT4a9IgD2veOrlk71XEfVTfBOPjWO9swBv4tJNDLn46iL2bHE
	 r0itfP9NVI2qxpdoQy84eOEbZ+s520tXT3iZjnfG52++Qr0o9lyu1lJX2FMVsQ0SX0W+h
	 6/JsyAesEyncsbCXROK+8fxKPO5QiifHl2R4j2cEtz7/GK4vl1Q5DNt5/3u9dPxJiF9nU
	 UqX4Hd+44XTiPX/rkeBeIdESEhnmVwdQp/B4lIDLga6uWLrfbk8wvPoc/1ZOgWR5zNvvH
	 CGXmFzzXGk/y5GiscFpUFRcvKOrePTzFPveu0hJFk/LrrO7Ii6TXjcOvubdX1gTB2YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Correlation-ID;
	bh=Ytx/MmCKq4L7Gfy8rXv0iAOzT1xtWn9s97+5u9XXrhk=;
	b=K+0f7VxqfNSUNhmBjkkQh+O/VraUGNCVGAEQArgTD6Ke2VMlow/qm7aFYeNrB6SeW4V6
	 fRD+63LTZtA+tMgm5AQeW4BAjYtNhNIqRP0djnw62D0LpR8M2dmlmg4u8G8UEY/T/kNCa
	 QarcUVrQ7mScyZ7151vacvxcRPW5XDJhGZ1ulTxZWaWnzT5GJz+ObN/qfzrqQxTlXuFnz
	 sJL2WbSIML4CbyH7Jls2/GIKmT6D9iFFkVrRUGxnuDwn/x1l5tdeHk8QcOnxUYSWyDRSX
	 vsj02Fw2EYrbBj+PV/NjjHwZ3CeY0dj5e+pQ0fuGrxUi8v3936Bx6gIDuMJGX/vOTrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IwghTiG1;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C64606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 08:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C64606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IwghTiG1
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f046b0adc0so21894225ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795510230; x=1796115030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ytx/MmCKq4L7Gfy8rXv0iAOzT1xtWn9s97+5u9XXrhk=;
        b=IwghTiG1toayCj+xAgXK+k7p1cSV2MCa+Uh7VOhYwrBfMiEnGgj4R1SOZ2YePkWuTc
         MbW1zL6qvozZ64o0mUz1nYj+fb14MAiqrC27FUOBPpI/cUTF5OuDKxqIYzyYeLKzRREt
         2kCkUzFyn/3v28hWN2TK14tfcvCwIa7S4V2IIz0+wQC4TBQBDmsermQN4UJcrx6rvmNn
         3/8EAkX6z6f/OcFNpD6sl61nEAfMG+Cn7o3TLFbJSysmk5yloxbhfyhRTOtKJworbsI2
         kSzvraXhHu9f5uQpVccYhvXqnpMImKthFTZhjpLF8YOFlrn9HJvNREJIS4dgqHA0ZxQS
         k6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510230; x=1796115030;
        h=content-transfer-encoding:mime-version:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ytx/MmCKq4L7Gfy8rXv0iAOzT1xtWn9s97+5u9XXrhk=;
        b=LmilxSOXWwy5PkuPSG+050FPWOHCrEW06B25iabbvpVoVHVp3QdAak9AcSEP+5vqfH
         ijVG6g1ogkB3lKIOk4n0tnx1ouKkBPf5mEtDOrsEXWFBlwPrREABrF04Si3VvecQMWuV
         zKMGbUSRrh8j1LuBbKMCanj2fWaSnPhoZM0XJjwhEpozawryj59xpFHoxp7dtGN9XjLq
         O28Did6hgwyGV0kFg6hhU7jnyljzfN7pRaotNI+O3ik/ATswXcZgCzTwCKRDoPN7TfZM
         fj4d7xeu/wBxd8vsAKSgAHUS0olaWnlnlTnLinXBkubJwmkqP3nzZqlFP3OgYBOnfYxi
         D4Bw==
X-Forwarded-Encrypted: i=1; AL+hErGt/zKS5Ikx4sC4dpZzPaBZ5yAfiBMAnOV7X4JUOo+W/0R4RBSExtCBPyOaiF15JU+ZNWqPhnalJLymJqjNG7I5/MN3@vger.kernel.org
X-Gm-Message-State: APuU4Z+C5OxgwNAyA6PvoWZY/ZsH47J6XwNhsJAR2bNL+TBtOasY4GaC
	ozxS+HXnhjnidjU9syf2p0FbtByhm2JPMzhUsDni0wgOAclZdAOv+SCw
X-Gm-Gg: AZFdTZciZeAzKzGRQZ7tF1twWL8xG7XRBgr9FQwsLHaH5y8KxXcCYnMZrghjd+66Y/k
	faI0btoX3xBQfZBZ00dQVd3bub2ZqqS05jltdvNHA9GO3tTH6bivOLfP4TnU+EFk0BfozdbyLxv
	Obge6YkXKioY56RTYSImMoqQlQnbpvm1xM8W+4+GswdagdEVVxqHB5MrG5qYSz6GvZEJrMfD6YK
	oPcndWOaSZusBuJybzemmFjXcP0wQ83tSsoDnpGul9NRfgZLbX8Cwg+qv4Z8243TpjC0x8lYrRy
	QYu9LMgtoa/Ayng8u41b2zDKZA/TI1kw88BAbW9q+3+qK5ooeZxlb7SYNi6qW0rQu4LhGa9oC8l
	lOLD/e4OothQ/tAjp3FesdE2roR6t7s45sHZJW3/evddCRCmRcGcXqfiD2rU7j8kQzflgtwb9wO
	/YYMXMgv0LZZ/BMCZV0CG4UaXXaIF7dL5vR2jh8TNxJ/uRjYBS3vStDvq/VXS6glWGhJhZds0SC
	j7nF5Ih+rLCtJYOxd6cxDk+dtE9RRD+Iw6orm/8QG/jT9Wk8JKYgijp3oEes8/JdpUureC6cWCV
	0pGpngceYuUBiu9AmjOLsPF3wQ==
X-Received: by 2002:a17:902:d54f:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2f03f118afdmr122301645ad.12.1795510229878;
        Tue, 24 Nov 2026 00:50:29 -0800 (PST)
Received: from localhost ([2001:8004:1ee0:986a:826:47b4:7374:22bb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f146b84sm65630815ad.71.2026.11.24.00.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:50:29 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 16:50:16 +0800
Message-Id: <DN3B92I0MGTB.BJYABJ1HG9XS@gmail.com>
Subject: Re: [PATCH 1/4] platform/x86: clevo-laptop: add minimal WMI driver
 skeleton and Kbuild plumbing
From: "Nick Dowsett" <nick42d@gmail.com>
To: "Werner Sembach" <wse@tuxedocomputers.com>, <nick42d@gmail.com>, "Hans
 de Goede" <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Cc: "Armin Wolf" <W_Armin@gmx.de>, <linux-kernel@vger.kernel.org>,
 <platform-driver-x86@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
In-Reply-To: <b5f96ec9-ee4c-44c8-8451-9f40bed43290@tuxedocomputers.com>
References: <20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.com>
 <20261122-clevo-laptop-v1-1-881debf4d4b0@gmail.com>
 <b5f96ec9-ee4c-44c8-8451-9f40bed43290@tuxedocomputers.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <DN30VXQ0GPTS.KZ91F75HTGGQ@gmail.com>

On Mon Nov 23, 2026 at 10:12 PM AWST, Werner Sembach wrote:
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 9ce384e0475e..18aa4550c9f4 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -1059,6 +1059,23 @@ config OXP_EC
>> =C2=A0
>> =C2=A0 source "drivers/platform/x86/tuxedo/Kconfig"
>> =C2=A0
>> +config CLEVO_LAPTOP
>> +=C2=A0=C2=A0 tristate "Clevo Laptop Platform Driver"
>> +=C2=A0=C2=A0 depends on RUST
>> +=C2=A0=C2=A0 depends on ACPI_WMI=3Dy
>> +=C2=A0=C2=A0 depends on DMI
>> +=C2=A0=C2=A0 depends on LEDS_CLASS
>> +=C2=A0=C2=A0 help
>> +=C2=A0=C2=A0=C2=A0=C2=A0 This driver provides platform support for Clev=
o barebones and
>> +=C2=A0=C2=A0=C2=A0=C2=A0 rebranded laptops (Tuxedo, Metabox, Sager, XMG=
, etc.).
>> +=C2=A0=C2=A0=C2=A0=C2=A0 Currently only Clevo NLx0AU boards (e.g. Metab=
ox Edge NL57AU)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 with a 5-step white keyboard backlight are sup=
ported over WMI.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 It is intended to be extended with additional =
Clevo models and
>> +=C2=A0=C2=A0=C2=A0=C2=A0 EC features over time.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 To compile this driver as a module, choose M h=
ere: the module
>> +=C2=A0=C2=A0=C2=A0=C2=A0 will be called clevo-laptop.
>> +
>=20
> TUXEDO is officially all caps.
>=20
> Technically all clevo barebones are rebranded and it is sometimes more th=
en just
> rebranding.
>=20
> Maybe just drop everything behind the "and".

No concerns from my side, happy to amend this in v2. Please have a think
also about how you would like code license attributed to TUXEDO.

>> +impl kernel::InPlaceModule for ClevoLaptopModule {
>> +=C2=A0=C2=A0=C2=A0 fn init(module: &'static ThisModule) -> impl PinInit=
<Self, Error> {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pin_init::pin_init_scope(mov=
e || {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if d=
mi::get_system_info(dmi::Field::BoardName)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .is_none_or(|board| !SUPPORTED_BOARDS.contains(&board=
))
>=20
> We most likely need more complex matching here in the future.
>=20
> Is dmi_system_id table matching available in rust for the linux kernel?

Not currently, but I believe this would be a relatively straightforward
binding to write if needed, or it may even be idiomatic to write the
complex matching directly in this driver since Rust makes iteration
and string matching simpler. I'd consider this out-of-scope for the MVP
unless you have some other tested boards with the same requirements as
the NLx0AU.

Cheers Nick
