Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953EA3D9DD4
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 14:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776783521; cv=pass; b=tNld05Dlv3MNKiVzSWoWIsCCic5RI90WE53NtpCj09/HAWsec24rBQvQhyf9akK3dXBcpNmgmTbXrouJZd+49HYvsHxadM8/BfuMGxrmjradfKL40guO4WAKCY3gjawyDwuLZgPz8mYKXTN49spAOD5nbNrDexwQd0JvumVZe/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776783521; c=relaxed/simple;
	bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWBsfqgph99prz3vp+IsF5v2XBaI4rFoQHOQRoMsi1w290r9NVesrWp6d3ZO5DEuKH6C9k4FzWMzhYp/ed/J6avZXitbCmfwbRYVUDV2m/OkMYQKepnZO7RKHmdDPnVVm9pB7zCO8mrAu5fpdyIrHq+eq7HKylxQ3bOVyCvl70E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaFszFYD; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaFszFYD"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a40008be82so374552e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 07:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776783518; cv=none;
        d=google.com; s=arc-20240605;
        b=JZe/4bRNWJErk4vp3Kf/gONDmMGO0SDO6mddgysfrGlIY7Le8k7V7jmX420wczC7kH
         fSu1o+L85Xfz2RrpuIDamQ89eiXwg/0PjQLHfTRqlKP0ZG178SILdXq74RdE+eMBUuQR
         tHXNY5EUP5VoRUqAbkEW13GqdMEj1+vuXLwf5XjwMPWlkkXANUeKLLnsYnk1WPS52vpz
         +oZfgg3D/bs+SDCkCJsbX/yRoR/TktaATLTZAzfEFtioZ9amggDiHg+316kv6icbYH/R
         YpvWp0nM3EAmGJUOdfxLuc+BuiKqmysu3UKvBIjdx8FmnzqQTEalAG3lwiLlHklQMkHH
         5I/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
        fh=EM4Xa114mqYPomGmWMTtOtQNiOxlSmqvAO/hz4G77Wk=;
        b=IY7zRGmO3NVqo50yjBt9vY3eNABxe8mQBqjZx1CzIWSbcfhA7GQJZXa1tolI3DozLF
         /3IWH1KKcgQCj3HsLy7VGOWbmb42gubrRYckYxK3FqftZzWl+UwVEnKFd/wtKjY/sM4F
         DoroEtSffw0JF9/DK68xqxMUrFOiWerrgGa627VFslaI5oKzDoXFRgCbt6vxfXaJzElL
         ynGvwI4ddW7y48r2DAP/mVynUDtj8DWT+cOjrAPjyzpwz+B73t4/vA2NxZeIjTxbMVv0
         cHgudDNj2B5bndFad1upGpF4kqd6HhGRphgDQkEWfMA49MFxK4aMeRjyvqXVRK5efHRi
         Wpgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776783518; x=1777388318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
        b=JaFszFYDrshnwzFa3kQyqTJBIHAvDFqsjJcqq5bLvELWN0bwQQ/zDZ/tY7pEZdp7uo
         TxFX7zmJhMlmeQy64Lf6yyBm0n9V5P6D2Ik/De2Z1Z4hIH4ENXJP56UmkPOkfWNokCjI
         9wjSgCuEmpELtoGvM0+49oveIm2ECy394HDPeb7qhNxnB12/laI4jUh7gN+8U2vAlVDK
         V97lLZLHpAFw+PuFqlYZ6SlOUO+ci/Dwa8tJKgUR2QtKKBUEEedxxxHYztLe19AzIY5L
         5UidHlWqhfyt/zbea7e48poCO5Eh4VKb3j0PTITd73ELQLaep+xll1HTfCdAQwYjfD9G
         KR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776783518; x=1777388318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
        b=Xim4yuV6mmZ+Fo/4RwXRwnjyLbnt8lqlmUvu/XCW/0D8ZZpklqp4cL6484ue6xTzky
         dnAuTTcUOojnGbHWn7f0DJ6Si69C7wLuYjCHe5bJ7ZkVWzDYz5GB5dyr8TPJjzRLjoOb
         Wojuvjl+6cyd155KG2Hj35ztFEvkY3v4lupS3epcoQT+wTAhPyG3TblwkpAp123nbkDa
         XePvTbnVI9q61zQs0Vk1v9k9sYtfMBSGdxdsSE3WyUrqOJ1osclfgDxosGFFgmKYT1KP
         Aw2glMig6+Sludqc1HqARvyUJHAybNARvQDlu5ySY+uLAmeVosquxtdFJP0hJIji7Wd7
         nDhg==
X-Forwarded-Encrypted: i=1; AFNElJ9ekHB0ALRdnaVeEddL2OuE9V0S4riwSc6pb3k4qabSheR8rUDmApH28qMYjJQamxmKm3DeVo23NiiI6SsOZwDR+1AE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6p8ddUMWSAKVYFQbCigxlQzCdjtiIPkZVazyusJlAx2fitkaf
	GwGguAsqbMHSRh+fy68j3C3EpAwvmvG/y1JqWRrX+Cw6TD3glPm2OWf8Ot6qrMEBZ9BF+ZcBUgL
	0z+csfaJbYfAJPb7hvf2iCgb1F74NB4M=
X-Gm-Gg: AeBDieupsfTi1auASqjlnb0zm1/y9lFTbiFa/PiYf+LZImBGHqwE+Dwj5lonHFwpVRk
	A+i8miJDP3yDUY0PtDCRZdcTC9LzvxN39G7dC52Y5IIOzVdnf6LZzioWdjqAAQ4hRnmG82tBhoB
	Yytw7PuiF/EPeoUyIvUw/1uJ6UZo/Z9V0qmbzEYsH06PP3GWdGm9ZH+Bv55vvD8cxEmY5JkA4Sx
	8+6H63W481Lhc9zL04CoUvKAqf23Bp03DzyCPKilf9SgC3W5oWwmHdkcYvwkXeMh6yw22iK1FtM
	s6CLoQekd6eI7C7PdA6lqhd9bjwoe7UA1zd5ZLPEGUXcMvwJw0N81o7N9/28Dr6ObnAZNBRxcBC
	wswjgR2eTpLlt2uHjKOS10/P2zycbtsG6RQ==
X-Received: by 2002:a05:6512:3087:b0:5a4:1099:b16a with SMTP id
 2adb3069b0e04-5a41728bbfdmr2620883e87.0.1776783517486; Tue, 21 Apr 2026
 07:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
 <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>
 <6104a5fe-a6e3-4c35-ff4f-731d1a5e4acb@linux.intel.com> <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
In-Reply-To: <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 16:58:19 +0200
X-Gm-Features: AQROBzAd0frbr7R0K910eLnzr-MgLF13a89W0lNL0YdA7DVIARYBXkrGGHdY4e4
Message-ID: <CANiq72=P+bA_eR5xd9rCXio_kBY_p8ehgRyCWN-KTpZDVfiusQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
To: Markus Probst <markus.probst@posteo.de>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, platform-driver-x86@vger.kernel.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 4:17=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> How about `const BLINK_DELAY: Msecs` ? The unit would be implied
> through the already existing type alias `kernel::time::Msecs` for u32.

Ideally we would use strong types for things like this, i.e. Rust
newtypes, rather than using type aliases.

e.g. see our `Delta` type.

Cheers,
Miguel
