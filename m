Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17C327F00A
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 18:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767898021; cv=pass; b=teDCNOs29MLjVFGde8LsPngh/SLltMSIKksj4zkX9dOj3czAYxzd0sYe1Mre3Sh+RY11jHKt/M+1aBm9FzgUFkaXSM75MDg2foE/+tfQwGJy/1Xkr6d90PI9r+UyQhgZMkOw7KWMkaK1nUYaZ8NRnZZ2QaoVwg48liSOSSTK93Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767898021; c=relaxed/simple;
	bh=9dsp03vsh+jcxxLZ27Fffy/Yxt8RGmG/mTJwiKpUiiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSPJVMDRRAIH+0ajdgDMnvRxNLiUcyCLrF0BzFOV0LT0qOt5dEzKjyEQS7C3m2zMT23JLaCNtCvShqtOqxxT6U39H1qGi+huGbtMeoh9LIc7nZOdHonqRWpcKLIZjxXel03+Ye/TDtFE28FDrcCL0zkAvcJVMicM7pe+V8e9Fcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4IuGTHh; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4IuGTHh"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ac37f8898eso57364eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Jan 2026 10:46:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767898018; cv=none;
        d=google.com; s=arc-20240605;
        b=VbCArOSFHJaQyICw1g/+DIaypBz/UQPuUBYUAhN4hk4ur7LUX/WEiSlh4KNvRQS00q
         QAYS5p/rOW6v0UsmLKL2OoixMVTn157M7vs3gi6t7GA4y4WWo1Wpah06WJzpRf8clO99
         xP+Zv7ud+BEtmL3td8pQrOwz1sd1jHXsi9IwbZXqIe31ZxcnQMYYhpTanr+iI8fH55A2
         W2FQPNb126T55Ktt0RiAHPFPSgjC7W3lCqp49KjpCdB5vYUBCcYT5djzYZckyhIBCb+v
         RZAVY78nBFJnmtnoOqaSTntrwwJxBUcZCpuyMgKG/v6E32zrKOKVxOKcgTpY6pgFqyKA
         5+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CovL4D9IWtlZK4zyQedETxH8Q9w0iNTyULXmwn7D6wQ=;
        fh=onpT7BsPR2n2vq7sXFVYPFw77kgANf9PFS9OFaxBdqw=;
        b=f3BtEkm9ZtC9hg/315ghq+ORDXoM4Wd6yJoLHVJs81Lackqns8TH1F/Cn2PH4JGoYV
         IsH/ezenaoWo2JCwWPiZrXcNza3JR8zXynYBM4jxW+5CH2FCuE6jf63ecuuJ/ejCt2Vp
         8fYkP5D04OlRtk4IFDTQlN5v6/JrT8SwUjg4HxWXpQpv6440Gj//rrzzalVYy4LQ4SQf
         +E5XzLfnxwsdXw/oazFG8z/yJJKUR8Px/17YSstaFcR2Y2ydh6G+OcO87o1d0PN1ENFo
         Vf8b/t/R5NwMfJydrrwVKtCTN7CI6jqYh5jxD8bOd6at/WuxhShw+Xfhb4Z5CrFkxB1K
         8oqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767898018; x=1768502818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CovL4D9IWtlZK4zyQedETxH8Q9w0iNTyULXmwn7D6wQ=;
        b=P4IuGTHhbFZGxKiShnqfG1k4RbNk2Ncq3UTHJEXdI5H3mg2fFuwp0JNXkLdOVVg/k/
         Axx89kspInQzcJIinfqji2bWPWJ5HPboZ/BOH84e1MrjmkJPyKnl4IZXjfFkKK8vIUXK
         xB7wPFCQRNFLQVmX7sczzRY8+BM1RIVN57YWMG1DQuR0FDKq+bCwLCcUvYBernz3lOOQ
         mPgCz7NROIK8lu9znGHIFLJN0uxN001n4vqYA+Tc0dpw6A39OihQQuqaTu2znqFDNCvP
         iajpnhotOMXjEQxXnN/8OajuKY1zUzWo4FIWaHSPF3BkfxVBzbOCzvtdYm8hnGkEqkjK
         /GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767898018; x=1768502818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CovL4D9IWtlZK4zyQedETxH8Q9w0iNTyULXmwn7D6wQ=;
        b=CNIo4OkOXiZv7sNSNEA6fLU3ozK98Lp/j+UyNO4oRT3Pd94LYE+WMJGVxursJQF7dN
         fXqdhAZdUcOogLWu5ooGADiVb9BKRoGStwpMtEVfJ7F52NDCsHDOLmiIGV+C9iRg3OJS
         kWNrzhc67iRsNu8fOPNEctY4cc+gZT9DoXH++LeeoXtKME9QbBObLzHgbAL1xdoN0Tl1
         NwTonDXo81HPlzP1qStmQBKX/4o1F4+QgbFDEMZ1mqot5Q+8+hrUg8Yr63gyoRjKfbTD
         9RWlXqwGqJ3c6piAuCO/73LpRAnNLufIAoRNofyUyvHftuVe+5F1tlS97JeRAOpsC1Bl
         2Yew==
X-Forwarded-Encrypted: i=1; AJvYcCUA4mZ5v/zAymc6IN4gDBXvxXIDUnDHW5n6zl1iQIh7iB76NE+O2KKI/PoKW9lK2FJiLQEKLV8tWCcbhYJU2nOhdNVB@vger.kernel.org
X-Gm-Message-State: AOJu0YyFilS0zEREuidFdkYckHChj4bkTR54On4cQKzWLSj/kiPgvok2
	PvnFoAIAUWGxSKM1rVlwO4U/EReWFX3WWQJicAodzN/RFr4v7p+SxLBs/d90avTrZTp/4ByYRSE
	bGplGsPTzKy2yJOVvu+gHFQaZ0EVBK7Y=
X-Gm-Gg: AY/fxX4ihmFckzp/9wqS9Vs4SJX4yjwBkIrUuTv/FIfscrX+JKcRgzDJ3/VRmuSnf5G
	gDIvxVJqV9CpZtdWernxlRfMFHYQjxZk423Sqkvvws38kqa0PUv7cEkZo1dAh28G7+rGs+xjrll
	WABywAPR6fmNqqAzzs2qUnOhMBVgVCk/w/RwnBp3d/BvVRDFtHNCfNxqMu9i2w+r3ziVkpGRIe2
	CIr4xdIjY+L2s8bGbMC8MVz00dup5pSTVgCL5fVWn4sIWBbWcqrrWDHL8fFrOp071YR4ZAeRfTi
	//SlTWshqWFC4jd+PKTSLzf+AE/uNzpUL3JzxWTiKTJ3sGlXwqFWgqyOId8TlsOCLr4Cmwb8usg
	XtN50tO2Aiw==
X-Google-Smtp-Source: AGHT+IGu9T2XibzVKy8btuxcDZZhMyLH36+M8tNqwT0uSTo7qZFAQAMpI7ByxDxoDczkqic0/esmI4Vvqc2uRrIB7lA=
X-Received: by 2002:a05:7300:1483:b0:2ae:5245:d50e with SMTP id
 5a478bee46e88-2b17d2fd32bmr3273953eec.8.1767898018039; Thu, 08 Jan 2026
 10:46:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767818037.git.foxido@foxido.dev> <05261e88ac8503e2af59d703389d94cc15f4450d.1767818037.git.foxido@foxido.dev>
 <20260108132141.6cce4827.gary@garyguo.net> <7b8130de-8096-4fcb-be84-c13209638b25@foxido.dev>
In-Reply-To: <7b8130de-8096-4fcb-be84-c13209638b25@foxido.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 19:46:45 +0100
X-Gm-Features: AQt7F2o5ZZFBECo7tHTbw4EaUh07Wub13m9AN2oeE3UmPHevRhqMf_DCW1K3HAo
Message-ID: <CANiq72=TAXwjjxFiKiiwh9m_rRK_yUVS4b+2st=QJWErz5qTpQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: implement wrapper for acpi_object
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: Gary Guo <gary@garyguo.net>, 
	"foxido @ foxido . dev-cc= Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 6:11=E2=80=AFPM Gladyshev Ilya <foxido@foxido.dev> w=
rote:
>
> Hm, I looked through ACPI_FREE() call sites and acpi_evaluate_object()
> implementation, and it seems to me that the acpi_object's lifetime is
> the same as its internal buffer. Overall, it is indeed managed
> externally, but acpi_object and acpi_object::buffer->pointer live
> together. I=E2=80=99m not an ACPI expert, though, so maybe I=E2=80=99m mi=
ssing something.
>
> Anyway, the current Rust setup seems fine for now:
> 0. AcpiObject validity is guaranteed by whoever constructed/passed it (C
> side for WMI abstractions, for example)
> 1. You can only convert &AcpiObject to &AcpiSubType (reference to
> reference), so AcpiSubType can't outlive AcpiObject
> 2. You can't steal the data pointer from &AcpiSubType either, because
> the Deref impl is "logically safe" and only gives you a reference to the
> inner data, which can't outlive AcpiSubType's reference -> can't outlive
> AcpiObject.
>
> So for now until AcpiObject lives _less_ than it's inner data,
> everything is OK.

Assuming this is correct, this sort of analysis is typically nice to
keep documented as as an implementation comment (`//`) somewhere
(instead of just in the mailing list or the commit message) -- would
that make sense?

> Using an enum would require keeping Rust's enum synced with the C side,
> as well as implementing some simple but non-trivial checks that the
> `type_` field is a valid enum value (and the valid range isn't
> continuous). I think that keeping it as an integer is simpler and better
> matches C side.

If this refers to the `ACPI_TYPE_*` constants, there seems to be a
comment in the C docs that requires it to be kept in sync already with
elsewhere, so perhaps it could be reasonable to add one more place to
sync? (Though I don't see the mentioned arrays from a quick grep?)

     * NOTE: Types must be kept in sync with the global acpi_ns_properties
     * and acpi_ns_type_names arrays.

Ideally, these would be actual `enum`s on the C side and then
eventually we should be able to have `bindgen` generate the new kind
of `enum` that keeps this in sync and generates those checks for us,
see my suggestion at:

    Support a new "enum variant" kind, similar to `rustified_enum`, that
    provides a safe method to transform a C `enum` to Rust.
    https://github.com/Rust-for-Linux/linux/issues/353

(But we can't do it just know, and even if it lands in `bindgen` we
will probably need to wait to bump the minimum etc.)

Cheers,
Miguel
