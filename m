Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41392D780E
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 20:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767905308; cv=none; b=qrsA4O0fkBrSluNnYCbL3FlEVQ3dCyU75d1TdGx48BxrtrkMUGQHNrBEUs//p7ygXxlFVHSY+XHyluCPfg3fJj6OtPQdVOcbCumsQEbgMw7TObIVHzQX1MXmNXwA+MaVg1ciCHQ9rby/CR/ZNN9FufSK81lzt1/YIqOQLpnxO3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767905308; c=relaxed/simple;
	bh=Ai+1VqmHWTtzDAf9XcManam8pxSl3gVLCwxDk5EXLsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9NHbNhScXrcJlv3/055wOCAQO4c2ro98YHJw3nB2bbOZkEyDlP7P867sV+lF+yGZCjvPhYq+rRr+ysz5kYN7jodIALPE5/2n5+uZRbzxUwO0Q50MMH/5wQ4nH8e4kdZenWHy6+ZeVFR925ry5ZDwsp82O3L8xL10L4SlYWc4Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7JyQChr; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7JyQChr"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-65f59501df9so647346eaf.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Jan 2026 12:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767905306; x=1768510106; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OBTSY1EEOdxfKcvbNf6L/Emq8mbP/mtnJeN4bCR0OXI=;
        b=X7JyQChrCqoGHg+Q4yMJ2aTC9L/BXFLPJvKr+Jn79PqnaEk3xUiwPNlxYpBtIjxV9W
         xr5zsS5iMNWNUhIHBKZ6abrZs9zTpJ4oyLkYpTYpo+64l/e4lnKZZdmMJmVsvrTjDXfz
         NRC0yACL5A7cAibOza6tbOwx9DaLJMz4zKTI+e2dWXzAJTwc/Q9TpbtdUaRuLjVEaYGr
         4YT7co/q/nCd/S7N/t9I5COIatlBxLWxesToZ3Onye3ktH65vnZoSVgcbGr5JnzVxhrX
         NTiwqmin5J831Tyopq2z6c+glelcqAW45RN6F+Y8aQe/qZtEho09A9WfCmswcgscqSwh
         REaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767905306; x=1768510106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBTSY1EEOdxfKcvbNf6L/Emq8mbP/mtnJeN4bCR0OXI=;
        b=VZwSNX5qcJDaiE5tBKajcS1ORTGYivXExd/4pYFLN45lTwbYbrKZyukodYa4/RXe4R
         uQ7Vmc9rA79jq2vAFGJ4615LYEBMSeP9T6Td5VAM7z64goG0tAP788Js0e34j4QsV3v7
         ed4LBkbr65XuxeXUJs1WzBNqKYUROvJ5vHhjGO8sHOqkWE1xB2ZlAMfFqoX0zo/rKFz0
         0cpmwJb924diSF1GKKQV54JiqRg3qWvUOHmpYqeDHwy9mE108D/HC8Ur33QXbZ/HnImW
         nPyslPaqiFu1gRzKnACP9lLPipOIALbGwuAxx6wk2C75WkISjQ1lwRnp2nRvTdUuZlB4
         va3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8R7xlbaOIOre0+sbohsj7sBrPbwts5JYrezhafb60235wt230ijL0Ptxi+vfsKUD9Fp0weCil+l4pKOkIpSVrK5U1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Mq8yHCGTZGRzbUeV/tR8vXVYq/h3aw6bebaKimANDMQBB3Jp
	5jjRDgFMEIadr4WJ4q+Khgkk3Q5+YOv+95QpA7Q+e69qz7wKyzESYpA41MedxRmf
X-Gm-Gg: AY/fxX7KFNCOD0DvjzRVJxhaSvGg43005BwVvXJS6L6b3pZmw7RudVQKCYqg8DR1IEH
	tJGCx0UuETQuvqatdmxw5Lf3CzChY1GEo5uDIRJtc1KMHfasmkhjcf7y9cEBQmlAc1kidrapvXG
	W7oGBdMGplUNU2ZF9o7OCZtHyxMqdK9pHHuDlzBEAVOVfzZ61o/rIrOWAm+6UdpcH1TuoXaFkJo
	w7eScpgwmvn4AqCCou/3ip01fS788e7D4rUmkoF0He2fVfzNAIJ4uIsBJid40t+ex4pAbXIqzzl
	KWaV+8S2XQzokJ9kIQB1AKPSyY3gKDBCnDziJYQg9YJkMH1X41LZlpHTOFoOHgj/XVSnYXG1rv2
	ZWdBvtp3NynPk9UDCog13w9tczct+/HaSrCu59tvXEdkyMnGVW4bsZfNg/tRAIIecxasKZyarkm
	ULmeXKjUj+o+lo/p+yN8xxQYynEX7LjXZzfYKShKKUW8vCFWjjxFebgeoH
X-Google-Smtp-Source: AGHT+IEBVcI8dd3pG8MFhJ54e3Z7IfCjfG0ppQMLy/FK3pNInTISS7oXH3LxkoyQLORUg3pS1jlFoA==
X-Received: by 2002:a05:6820:4d5c:10b0:65d:30d:eaf3 with SMTP id 006d021491bc7-65f54f7adb9mr2462751eaf.42.1767905305818;
        Thu, 08 Jan 2026 12:48:25 -0800 (PST)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65f48cb03d4sm3792963eaf.12.2026.01.08.12.48.23
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 12:48:23 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3f13043e2fdso1426258fac.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Jan 2026 12:48:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLKhIeB7xr6grW2xPw5gE5cUd3Xq4vAMxBqItzibzyf50ndH1RgmoYOlWBhxmBSRMwXG4ouiaLaHjB+H4NAH0UHlgF@vger.kernel.org
X-Received: by 2002:a05:6870:6386:b0:3f9:b172:33e0 with SMTP id
 586e51a60fabf-3ffc098f288mr3727001fac.1.1767905303081; Thu, 08 Jan 2026
 12:48:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767818037.git.foxido@foxido.dev> <a119094f2e248587c541daf7c5b65bf4398b281b.1767818037.git.foxido@foxido.dev>
In-Reply-To: <a119094f2e248587c541daf7c5b65bf4398b281b.1767818037.git.foxido@foxido.dev>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Thu, 8 Jan 2026 22:48:12 +0200
X-Gmail-Original-Message-ID: <CAKBF=psOiiakGigJj0Kee3Z5rym41eksSZTgzsO3H1gzUP6DjA@mail.gmail.com>
X-Gm-Features: AQt7F2r4y4fMQm-Re3pQui1i037A4UVXW_kQP8DIPLiO0siB7OJeE8HUcxCwU2k
Message-ID: <CAKBF=psOiiakGigJj0Kee3Z5rym41eksSZTgzsO3H1gzUP6DjA@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: add WMI abstractions
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: "foxido @ foxido . dev-cc= Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Jan 2026 at 22:56, Gladyshev Ilya <foxido@foxido.dev> wrote:
<snip>

> +impl DeviceId {
> +    /// Constructs new DeviceId from GUID string.
> +    pub const fn new(guid: &[u8; bindings::UUID_STRING_LEN as usize]) -> Self {
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut inner: bindings::wmi_device_id = unsafe { MaybeUninit::zeroed().assume_init() };
> +
> +        build_assert!(inner.guid_string.len() == bindings::UUID_STRING_LEN as usize + 1);
> +
> +        // SAFETY: It's safe to copy UUID_STRING_LEN, because we validated lengths.
> +        // Also we leave last byte zeroed, so guid_string is valid C string.
> +        unsafe {
> +            ::core::ptr::copy_nonoverlapping(
> +                guid.as_ptr(),
> +                &raw mut inner.guid_string[0],
> +                bindings::UUID_STRING_LEN as usize,
> +            );
> +        }

Just use while here so no unsafe is needed at all. Then probably patch
1/3 is not needed.

> +
> +        Self(inner)
> +    }
> +}
