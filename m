Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945DC38DE0
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 Nov 2024 20:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731874678; cv=none; b=nf2ZhmU9IOSY4odk5ZH6+ZVaW4nqvvKXTea57MunZLTkS6Mw0XOnv0ZehYf5UGh+EfstNPDlfH/P0I3jHMYQgGWF+YbCEbwYSz0Zd/LGLkjEykLw4Yq6LKBWjyi1l7Isg8n4cMn/h3FN8gUeNKmkPtjbj4TTJtIxvMoW6WlF7hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731874678; c=relaxed/simple;
	bh=mne3GKOPY69KPEkDEl4MayUGu5c1Dj4XBd77eCMzoqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FunTb3ejGjODUj7vRCIftJRKywzRiOAwaSvsSn99HHlrOTEOExh2KB0guVA9IhR8+oZOe3E8WIhlw+D894FIimWHyguJS78ZNg/qWtlZFc3nEcMck+SfIikpVtmfAOtwNiPK3pTJHrwm4FTCZ+BBsd3IOZGPW/6jfHgoZFwWawo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HA35XJdS; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HA35XJdS"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cf7aa91733so973588a12.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Nov 2024 12:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731874675; x=1732479475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mne3GKOPY69KPEkDEl4MayUGu5c1Dj4XBd77eCMzoqU=;
        b=HA35XJdS9d8eMD9DZnmN5b4b92FWCi+VMmQdRbRs0V2z2bcrCT+yAYDPxOd9YQV4kD
         NF7LNLqsTgaB2SLoFsJYBCvNnlVzdvLUDy73eD4bkKl79TET+ntCRYDxZc8jtetH02PY
         IEmCVD9ShL4NUUJDBzoL+Q4Li5TuT4GXcV//WqPuSmQARMplwJwhgCZjSFyn15Fyxlke
         E5T7pQKJeohcFey6jeCDgcnNy7mS1cB2/jRD2w8cVT8NUgWRRbeCXDxnFoeEB6UTDAeL
         uualouiDjCCCHjzn2GJnMhms8UyzETKa++RdBQO/6LktcSy8CJv/rq0MqY9R4DD5zP+W
         nrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731874675; x=1732479475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mne3GKOPY69KPEkDEl4MayUGu5c1Dj4XBd77eCMzoqU=;
        b=wjge02aU464JE9iQ2RBmFNbj/Zj38jFHEQb+sfn2/ir/t9Yqx21lRsFUxTR+zl3ItA
         jTjVeOjJgxPRfszsU5TQqfb5cM5qedUeux3DTXLBsTwdGLPZpiicoqbXGyn8KC6hqYEZ
         gxm+yYbMHh7yuPze3FyTOjmLsRiLZDzGXsC6X7ABYu5tH8jTjgQ0SGFp9SZ6VfkVtd3K
         3OU/AvC4RiM6kOIBE4K3wMk85UoUnkVUyosx50ThqE1BCAAMzhxnEE+2V7UqNBcvtFob
         m/dqRRG25c0KtkbrPU8f0RbwJ8YfChjVu3IVWrAPtW5uk2gbq9S3gIgO35RCg3WET2yM
         ouFg==
X-Forwarded-Encrypted: i=1; AJvYcCUgB6N7wybHH26OurCE0gw2XzAJ7mpINNtTN6aAp9Owl7HWdJwuS6lrdWO2Px7KDXbjV/Vriz8nbOZYO9cMRHiiI/OT@vger.kernel.org
X-Gm-Message-State: AOJu0YxjY8wgZ1xe2hGrQQh2cHNRZRoklGjjPJ0n5sa9gaeHmYCT0SbA
	OvfeMajczwQ3MJIi6oX1PS3mXdWEF/GpTm7sfcYMiRpBg3gUnI5ZA131zjfc08KbSYmwVgSTwMI
	jM3YPA+LHLrCx+LbLOap0ktAyTbw=
X-Google-Smtp-Source: AGHT+IEj8UhmRN7RoNLP7cATYgSojS/ZUo3AYLVocb6OJ54VQwuRZ5WAG7848RgakvRrv1/zhhh8iwg0sMCae6sxOps=
X-Received: by 2002:a05:6402:2688:b0:5cf:bc9a:9a9f with SMTP id
 4fb4d7f45d1cf-5cfbc9aaa8bmr4853963a12.24.1731874674768; Sun, 17 Nov 2024
 12:17:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116153533.84722-1-hdegoede@redhat.com> <20241116153533.84722-5-hdegoede@redhat.com>
In-Reply-To: <20241116153533.84722-5-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 17 Nov 2024 22:17:18 +0200
Message-ID: <CAHp75VfhmrT0NsbFJ1bnHU4QTOZZCSRVSkWEMVRu-B8dQ3czjg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] platform/x86: x86-android-tablets: Store
 serdev-controller ACPI HID + UID in a union
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 5:35=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Store the serdev-controller ACPI HID + UID in a union inside struct
> x86_serdev_info.
>
> This is a preparation patch for adding support for PCI enumerated serdev-
> controllers which will be done by the devfn value of the PCI device.

LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
