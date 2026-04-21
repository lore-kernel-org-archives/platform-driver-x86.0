Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6885E2D3A86
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776797235; cv=pass; b=XzVvGCNPd9LbGLM2xYOzHupnmpl6/IRojI+sZUBPeMB3xlZbat+ttXNCQdM5KnpwIivJbkiWJnZ33G4UTN8Gke9iZcjyoha59a08g90kmwqsDtpNcdv7hSdM+/BsCJrleXPVXC9Vcl1PuOdkz4a6fJsxTdhkF4fT1IE4xK1iAEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776797235; c=relaxed/simple;
	bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V28IkH81hPSeTl/qsQuqPm2l28AnXQh7baIGyjMf7k7QfPGJJekuLwIWt72Mf7BQezDN3kVfQEgqxFXwM3OMDCIzHuwHLiQ1dpjhtY8t+ZPWGKC6qNMCOiMv/xxlTCqbKHuv80CZnXtqmUF3vPcJ0xMLn0KSoJtkMsJEPAov+KM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lY2hPFkR; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY2hPFkR"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c87f1f8c8so202915c88.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 11:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776797233; cv=none;
        d=google.com; s=arc-20240605;
        b=gkzMCP2wqKT6VsAB6NqncTeGtIjNnC1nGOE8EL+VzqAHza1anWYItlXlrykKsWWusI
         CB92gQuVNsv1+rlCY7SxdLQwe7qrMWprVE2UT6XXF7GT59ND1ejUWUhfgEgUE+XmvXWs
         WLllxZ/wz2c/nkA5rs5/80nZ3yLqVXU8RiMuwYb46Oqc2bKRai5x20BSftJGhMdaa8V1
         3DLs4EGgI7I9p8bg9Wy2zFVjSUPtGNAao9sVGR2OxVCtcQ52Pzq8WxWANlvECzeyFEkj
         upzZeI7vIWLuSwYMzl19GBRbquOQwscKuikxr5+4XJNpJG/uyex1FsYrmwwpFc+AwScI
         14uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
        fh=wKoqImZtORqNz9aZ4u8oSfr7Qil+BW7gtL8zqrUNbDs=;
        b=SAFIEpPlNyNg/tYIiT/VyJuNYvmtATw/E8M2bYlIMRgfycDhNdTNV7uYASQlL1SdGC
         L9ORRNZpIWRsVOVed0ZzFfYun0LF018KPeUv86p1YPuQzBCLtbBx1khLUYeqK3ddKNcb
         oJ0qof6kbKyzLlfK62wUKLRmJAT2yKVXgGjCzYDsqX5puUF+dQ/CFNE2jC5QnlIwG/d6
         zLuyNxlLgi3mkq6rfus8jsLbXAhfXsGUr7JlSm62VU+5eSVaZH1MGmkwPMTESTGM5Gqs
         Q+b88330ImSlbBkLiWoTEFIP5/S2/c7lp+9l2EPGgASnCWwc9+cpX5RvBOC7KfYSe/H9
         HpNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776797233; x=1777402033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
        b=lY2hPFkRzSq0i1RtibAyiaYlSfJT9MCga6ODlOILOzE3hy3pzy1KE1XhdjDDOhFtCy
         NQpH5CwR6RJu9e67ONSkgrVu8NTubVsEdi25y5VmxyJkAmDCwh+lWkJwaQmPHIwbmroT
         PS4IrEXF7GZoTZWqGbunpMBr6IcFcqAsNsGGbAXuxhPQOUUpLTcSyyxgyzfvtWBAVjiB
         kAzh4b7q+msAEnoXUPhvFES/5vrMq69RPJ6eeZX63CsGe/idjCcrOltXmlWosmnUBj7c
         ppGhVvypCTYjmoWOdwo0EXMZ0PCgmWSB/+ucyZc9i957cNGUmYmalruc9hxNvLd/nHsI
         kUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776797233; x=1777402033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
        b=A3Z0G4cWB13DPmBOOabovIqqXI36IiVPwTzKNFjMduHpAomTvalDoHD7F0QoQKN8lI
         vkTRV7Ep65wbymjRLfYCVUI5lYxmiy4hQ7EDVJiNwehDMu17k/KPvi+haxiGOZlKnOzf
         0i4i0oAbFzd6UcnMwKX1Uwk6MXkIdc/W1h5TNy72Ye+MjYAntiASSXQcIbbCHkmvNWoe
         B2RoRBJpogeB5TvbbT8UvbotLsrAYPvb3dGKroELAthx6EkI9XQfEiSJoumVv6qmmnL4
         AuVRO1YwBSvi21Gw6EFu7k/9jFAYZa7uXd87JJ+aLy3XIpL5YBwTPLhErykm1uj/JTPs
         fthg==
X-Forwarded-Encrypted: i=1; AFNElJ9sXvFpjt6l2UlXJudaidhGliJSbJGtLVQMEJrmkRdjqjXi4+1iWxc5AdL1fXGTLYnYtc+6rH5d88DexhoVMmM6A5JC@vger.kernel.org
X-Gm-Message-State: AOJu0YxvQJbxvHKKa5FqJzH1ZYa4McVGvXkA2keDxtdvq+wLHqh1oZfz
	xgNFQAvMZlQK94+juqkQ5D8U/zrFQuuqpDtRd796FSZ8G1G1xUl345o0Rz1pOhFBYlzOcktJ1Ly
	ikhVS9CJnO9Pchk0dJ/JyT2CNZB3Wr/4=
X-Gm-Gg: AeBDietaBMlDtEqV3ztJ2QWffuJ7Rinbny/o+0jhSG3hUichUPAs7WTEyWxmfr0Ff4N
	Jga/z0bfFkGt1UCJShuKlchbYRaVr+ZCLxZTbfJhPzQpqtuvfkuW+zVhziYXzQXVdTDZdYUobB+
	dfy4PDQD2IQ4DER+eHbqpAXXAURZowrxpdHJdkoSmS1owXCvWKNkDXvM4c1ElotZ7jtU+Me0Mzs
	JlfMXixsBIN40nsuONpjkzevZZo1n52r+dZozVW+El9tGe+dIH4sDQeqv+F7cx5xWH4PJqEzUOZ
	Rf9ctGxoIPdWywWzrBMPc/WkGniqGffP0Xrf9IsDvhBlUVy/7qDXa8Ru6b+I+lHI4fKyNtpsW0y
	Hf7Rbu8YeFDl6nTnRrZnlYYqiboDswWj5V9llQi9ZLjQJ
X-Received: by 2002:a05:7300:fd07:b0:2cb:8d2f:e235 with SMTP id
 5a478bee46e88-2e466043efemr3780881eec.1.1776797233495; Tue, 21 Apr 2026
 11:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
 <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>
 <6104a5fe-a6e3-4c35-ff4f-731d1a5e4acb@linux.intel.com> <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
 <e166861c-e75d-d1c2-61e8-f611e6ee1ef2@linux.intel.com> <1cc39657ac50f3930dfa27de41a1b4605a7167d9.camel@posteo.de>
In-Reply-To: <1cc39657ac50f3930dfa27de41a1b4605a7167d9.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 20:46:59 +0200
X-Gm-Features: AQROBzD7jw36OIB5Thxw8iYFM3lU80V29LqkzQd_l1DKXUW04JWxY4nHk4yFQzg
Message-ID: <CANiq72k=8fmi0fJnNV=GgR5_HO_COWGynKDF-xzoX1nDAdxdrw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
To: Markus Probst <markus.probst@posteo.de>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, platform-driver-x86@vger.kernel.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 8:21=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> Delta stores it in nano seconds, so it will require an additional
> `.as_millis()` call on use. I assume rust will optimize that out, so it
> will be fine. I will use the `Delta` type like Miguel suggested in the
> next revision.

I think it should (at least in the 64-bit case -- we do have a
`bindings::` C call in the 32-bit case, so likely not in that case),
but please double-check the codegen.

In any case, my suggestion wasn't necessarily about using `Delta`,
which is definitely an option to consider, but rather more generally
about using newtypes, e.g. it may be that we want to have a few simple
time unit types (probably with support for `const`) for cases like
these if people are going to use primitives everywhere to define their
`const`s -- Cc'ing the timekeeping Rust folks.

Thanks!

Cheers,
Miguel
