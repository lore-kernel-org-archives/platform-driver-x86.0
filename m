Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29523C087
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Mar 2024 06:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709618894; cv=none; b=M0EgsYsxd8as8d8mU1BkqYn5f90Umjr9HvmFLaamb6HaBdP8SZu8hgAoRHA7KQtJHmdYu2rmO14AaB/CYbM5RDvPwcAwXUTZ/6aJMk/tsH40AW8FRBHED0A0iQ8Lc9VSy1x5YZi4/mmt1R6qA863eT+swi2yBickE9Ex426kKKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709618894; c=relaxed/simple;
	bh=dM4D7w9DD8d0wbriRkCoArYw4jGDzuzqEoVoQw02gzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceeGpTSigGRN5aczfQ+/5Qw5D4HLyypmf/gFcBVePjqkTzArGChIIuacKc4ueOq9yad8J162mEoIK4BqqXWYgnHoGH1UTdkoQzvpQtQm7fCQ6JOFHd6rcVnadrc6XQcv032HO5WZPn+m+3GnmKhUU/TTKzhShUuwSjhwTXZkz7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BW9dlqIR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BW9dlqIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709618891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zoFo0I1fzWwGEu4UQgAN2SUdp7pXe6Pyro6e3fwhw64=;
	b=BW9dlqIRheS6t6PiJ9tgobqHvFQ1NJfUEfw529dRC2ShLxY/qKKZNGy/Le5FOmKNwx5kev
	Smt97w46zBju96erup/Lq8ullqvvuoxzXMFX7VrbpbC2AIPvsys9a5JsQu/vPtK3dRclRv
	I1idADwDOFv6pmjpJTgC5dVvAXzut40=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-j_zeolAHNmCvh7Nke5SzQQ-1; Tue, 05 Mar 2024 01:08:10 -0500
X-MC-Unique: j_zeolAHNmCvh7Nke5SzQQ-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-299727c3e8bso4323944a91.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Mar 2024 22:08:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709618889; x=1710223689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoFo0I1fzWwGEu4UQgAN2SUdp7pXe6Pyro6e3fwhw64=;
        b=xRmJShOnHpvdTLs3q3hCQFssrP9YwDFXvPw88sbbiERxjkfmgSpTsxgHH1qIVQznFq
         nLMY4S+F1XqlkvooWBcSIrDirLvHbIg17+WvuAs9SrX1CWuE3TeJpYI2dJQuXvHx4tFh
         UTNHeQC8l8DK3uEvHY8KuGImbFDf9Wv3TwKvPVdMplbei0IceDg5ND4PJfXbfRGKKgay
         Ymnebqr5VaxgSefE5GUwLCAT2yBCd82gKxCWIv08sHWnCoDe0YPKRwJK1MJVFDQC3q7X
         IqVXJUOYzs4bW2c7WmbNlqoL+B2yaa0gQcgNBpLcCfRnA+TEiPlXHQjHIyrU4AOGLwIK
         PSag==
X-Forwarded-Encrypted: i=1; AJvYcCVwUQTcDJQoAoRwuhFheNNc4bAsNcJHtLWxOVOM61Y3IwwZLNeJOn8iR7myYLih3UxGzfU3pFtkY14W6a0c85pJy9Q1np5GGZLo90+fXW9O6MYQEw==
X-Gm-Message-State: AOJu0Yx9xesrdgd3QS7I01krCI7vLMhAvvHef+qvyiCTWX2Z59G+z6Zd
	xsqEpzoMFiW+WKa8YwHmt0vII8aIAHVc8sH4ISwUruFJZzRWTiWWA61zRlemoH2Cp8DQsT+BZrx
	zlmNj1z+Xl/TBxdbVuJmRu1Hg44k/KkOahgP1KCIxFpBFPa01/okIQlOJXYSq4eDQu/dT8N1hyD
	zOW6wsrcDjkUhB1zqdZJzN4z+qw8EEeJT44w9GB6jBrm0LcCC96NKzXQ==
X-Received: by 2002:a17:90a:fb81:b0:29a:1708:9878 with SMTP id cp1-20020a17090afb8100b0029a17089878mr10204702pjb.38.1709618889025;
        Mon, 04 Mar 2024 22:08:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd+3bX2cQVrVff7vEVTyByHc1KRVzVm4ben3RVNkqLHuCs0o7H2AoV3FE+2l+eivntYagUvGxVF64lMe0rlf0=
X-Received: by 2002:a17:90a:fb81:b0:29a:1708:9878 with SMTP id
 cp1-20020a17090afb8100b0029a17089878mr10204693pjb.38.1709618888724; Mon, 04
 Mar 2024 22:08:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301033612.11826-1-hpa@redhat.com> <20240301033612.11826-3-hpa@redhat.com>
 <7dc47181-af26-6d46-d34f-57be0fdc8421@linux.intel.com>
In-Reply-To: <7dc47181-af26-6d46-d34f-57be0fdc8421@linux.intel.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 5 Mar 2024 14:07:57 +0800
Message-ID: <CAEth8oGEB8rhEhGu2ws8UnmpmsOV3VFnGtO98cf=1m4h=REh=A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] leds: rgb: leds-ktd202x: Get device properties
 through fwnode to support ACPI
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 1, 2024 at 6:59=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Fri, 1 Mar 2024, Kate Hsuan wrote:
>
> > This LED controller also installed on a Xiaomi pad2 and it is a x86
> > platform. The original driver is based on device tree and can't be
> > used for this ACPI based system. This patch migrated the driver to
> > use fwnode to access the properties. Moreover, the fwnode API
> > supports device tree so this work won't effect the original
> > implementations.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
>
> > @@ -568,6 +574,8 @@ static int ktd202x_probe(struct i2c_client *client)
> >               return ret;
> >       }
> >
> > +     chip->num_leds =3D (int) (unsigned long)i2c_get_match_data(client=
);
>
> Casting twice.
>

Thank you for reviewing it.
I'll fix it and propose the v4 patch.

> --
>  i.
>


--=20
BR,
Kate

