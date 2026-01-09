Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA0D2F39DE
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Jan 2026 11:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767957485; cv=none; b=kVogC8agqk0jdFq9M+s9jab2Wk/n9ZDvYup+X/VJyVg75aF70OiY6lcxQ4Su09HW9inDNm3X2V/96SSHurmJRZIdfrXZLwyRsL8nTucJ2jcRnN3FB49wSIFym9HPm7hUEUboqI/GmhazJ7zw7I2XZvOPiBDFzANyLcb63Pg9uoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767957485; c=relaxed/simple;
	bh=X8/WMKVstLlblwrlkCF982nlFs5kTORZzTZM70moIEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jdlo9F2EslGBphEObyjvNBfYAXvmTJxcFlBQh4TrTTqwgkvfvEvK5DJeMFndjlkdfotLOlDhW+daGm1HTv4v1sRER68a9OaJOZ7PUwm3/yJQaLKwWDifJEDZo8Job6LunibG7nGBvx/duQguJwLcJyz0PFtJPdhaG1sGnCUO7jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QA16CyRP; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QA16CyRP"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c551edc745eso434596a12.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Jan 2026 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767957483; x=1768562283; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SjUDjcQuilw8JIwts0suK0wZjsghxEmkzGbdS7ChzGE=;
        b=QA16CyRP7H/Wlry6MfMuzr71lxJBipC+VLGDnAFTFJDz0knTauZoKZka5CE+021wbc
         66AkzZWQNJNe+rNQgA4A64bMch85eDpdJYSyXW/Fe4dpuq2jTdNrrUI4jKFesP1Bm8Vc
         7oJaOr8WCmUGvd+oNqUaCYiIZ2PjggHuknvXUMcuZhLVi27+iWHLPdSe9a4t8NistLWP
         Ma9k+EKfiM4i7CL28nLQ6WdhOIiDq5dr4solqjUr6btS7bjZb8Pfev9A/ALhIN/HJrgp
         NcGOmDJwdjIntHQ4uZlDhL3ze6nhXAAh+/KnjkjJ+/recf2KQ/Yhd38RoQ0oVx6dQdJj
         T8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767957483; x=1768562283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjUDjcQuilw8JIwts0suK0wZjsghxEmkzGbdS7ChzGE=;
        b=SUNpp6+oFNhMsBzjSZNFdcSJK1MurmmGoiAZekcfU8UNz3bGNLcIM/fXzarvcTtMMe
         ZjHbaZLrYyFk+0xJ8IidK8jv0V8yLAJuyHvhaxGtIiVsWUOBFXDQDDr11KrcMdM1eKNS
         xL9zAhO2DGaM0OYCIUe2vhS74tSm245gpJfzuIVaFj9xtir4Vkba4m0ZNnK6lGG0EsrI
         C3w4Bcd65fPL4Tuqtj2Db2McJ32EnBGWj089N27rqpz2wixF4L1LygrejMKDtL2CLmsD
         vjgUnU+AUkxM4YPqXWHlmf7ELCXrBrZaNfF3Hj/gW3EztHZXr47Y1XuDXuoqDlrNNsjD
         x+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm/PiJkvUc8WHIB6WE1eMu9omc1t0l+qydK0CBL6B44YMAw/ARGSKslvm/JzsB79sgjNQie8cC+nGbocPxK2Mm0BX1@vger.kernel.org
X-Gm-Message-State: AOJu0YzZRBVjvRj6y6YwITakVbUTLOESWyRY9gig3iyUs1oU+NT1+R/e
	OEKfGiIlptYelvXeHmD3InFOhxXap89FRa2ystDa2kOYlTnSHu889EXW3pAqPKUOIi6bZGnFbi4
	IgRaF3bF6NHXqkdHWmV/m74lvMB0uYeI=
X-Gm-Gg: AY/fxX41C4lqZttvayXDnXfWV+Fnt4gVQUGsKeVzExbUbp02v0UBvZTfiY8f0eq9YNx
	WAS6szAMLXwYUPSCn06s6SR+dMTICe7QhB4zg2+DyRwIcY4FaAWNFk4bytLjSvz3tP5nn2EtbR5
	eJ+A419a+i4yverjEyUB3w0K4qHlguahowD3Mj0D37tJ3AoslWuL6ORSId4AbgJ65OWGzYzPmrq
	eSU8xJLJLlhK9hKSz/ecTBu/x4TvMypMGwGLjtwYaWUt1hkENjTUTvfXBu9/NfOm1ZXRFqlphDc
	llRJel7efJqpmqU18cmrJFs6so8=
X-Google-Smtp-Source: AGHT+IHx4oPTkZGWjnk/fIhFxWXX8VfQz8sfZRQ1a4hPiuCQQJTajebNqbmfM9bRR6L7VucF04h2carmFdn7uSAQrXw=
X-Received: by 2002:a17:90b:5846:b0:32e:a8b7:e9c with SMTP id
 98e67ed59e1d1-34f68c28180mr7896138a91.29.1767957483181; Fri, 09 Jan 2026
 03:18:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767818037.git.foxido@foxido.dev> <a119094f2e248587c541daf7c5b65bf4398b281b.1767818037.git.foxido@foxido.dev>
 <CAKBF=psGUwgr7e+EM1d2OAv8H1A6zKfhQaSPS56vVcnc=Ez_KA@mail.gmail.com> <622213c0-1793-4b1f-ba9a-aa99f73047f6@foxido.dev>
In-Reply-To: <622213c0-1793-4b1f-ba9a-aa99f73047f6@foxido.dev>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Fri, 9 Jan 2026 13:17:47 +0200
X-Gm-Features: AQt7F2rayWG0pZpVs1FxNxeC6wOj6LoY8YXn2LOhC92JjlEG-eQdaJfa_fOGPrk
Message-ID: <CAC=eVgQNvsGWSbnm=V6V=S-gQ75kiw7=JPwOsaTDKQPwoXqEAw@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: add WMI abstractions
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

pe 9.1.2026 klo 13.12 Gladyshev Ilya (foxido@foxido.dev) kirjoitti:
>
> On 1/8/26 22:48, Kari Argillander wrote:
> > On Wed, 7 Jan 2026 at 22:56, Gladyshev Ilya <foxido@foxido.dev> wrote:
> [snip]
> >> +    /// WMI device notify.
> >> +    ///
> >> +    /// Called when new WMI event received from bounded device.
> >> +    fn notify(self: Pin<&Self>, _dev: &Device<device::Core>, _event: Option<&AcpiObject>) {
> >
> > This should be device::Bound
> >
> > Also probably _ marks are not needed. I think compiler does give
> > unused build warnings.
> >
> > I do not know reason but usually other drivers use this over self. And
> > device first so this
> > would be:
> >
> >      fn notify(dev: &Device<device::Bound>, this: Pin<&Self>, event:
> > Option<&AcpiObject>) {
> >
> > Same also in unbind. But like I said I'm not completely sure about this.
>
> I thought the reason for using this instead of self was because of the
> limited set of possible self types in previous versions of Rust...

Nice. Didn't know this. Thanks.

> IMO using Rust's self is more readable

Agreed.

> >> +        build_error!(VTABLE_DEFAULT_ERROR);
> >> +    }
> >> +
> >> +    /// WMI driver remove.
> >> +    fn unbind(self: Pin<&Self>, _dev: &Device<device::Core>) {
> >> +        build_error!(VTABLE_DEFAULT_ERROR);
> >> +    }
> >
> > unbind should not be mandatory so here just do
> It's not mandatory, that why there is default implementation. See
> https://rust.docs.kernel.org/macros/attr.vtable.html
>
>
> For other comments: Ack, thanks!
