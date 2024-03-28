Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A1D43ABE
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Mar 2024 09:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711617426; cv=none; b=RxgV7OkgqxPYqbIAEhqT8oW+SeC/0Xwl6MPFpPA9+mcmTvK0wCdze+i3l+4jevqKwhmBE2RCMJjTQ4Ysm93HvYVKCdMCfeHD/nOGXk2wKT6Ew7Gy7BrNz5Cm9xeFtweYzeNvQedblBA/UOn6Wcjif4fOEun+t0s8y+UQgZ1cafk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711617426; c=relaxed/simple;
	bh=6Gy4ugoy8i2cxQlvWL7ALq6UFeZ+OdAO4iKWFswgcnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LeApQGT6Hxu/WCDgFJtePH6QpwjdqH4AiJ/zNKE9ikWacNxbBSMGUYo8sm0jehYqf3Ef5pYg5NYXtacc2w5vXXI6NdtmG21i2W+JG7+ALIlVLd80h/UyisXouQTKcK2OxcsDbguqq7ICDr6z6EFQ5VuuGgczbmuy08+S5INU/xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cY6JOo6N; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cY6JOo6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711617424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHdntgzQNe3U9Pl83BPn/RLVFTNLwSPTo5R9/5t/aKc=;
	b=cY6JOo6NF4hbbVQk0RWom1z9Su5sluBHObiyG68PmAYDKa3wXf5tB7xhoSUrmmCddmyZfG
	wbh0pi43JrJkDg6dCXDXx+S23L0wiX+IvNfnCbKy4DmClfs19yIKP1bwKJTv3M6o5v3d9t
	ptYzrfFgnh1D19r8B2//+y6/CRCHjiI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-S_4sZtBLN82EgsCcM8y8gw-1; Thu, 28 Mar 2024 05:17:02 -0400
X-MC-Unique: S_4sZtBLN82EgsCcM8y8gw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-29de982f09aso621182a91.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Mar 2024 02:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711617421; x=1712222221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHdntgzQNe3U9Pl83BPn/RLVFTNLwSPTo5R9/5t/aKc=;
        b=vzNZHajAflq+SgSlPrDQzQOl8+PAqpRsbYxRic2uJqYlPsCyD6dzKGk2lwKPk8pdeS
         Bu41cxOkL+F3tW0grOZqw5CKagxjJTASsXneG78T/TpSO42G0rf/PVuiCqO8sezXXCao
         nQUkzTGmwCf0UssQ4Ed/33O6HTma9Yl9iOCwHFiz0UtFGmHvbNBEhtuiJZnMbRrj2LPE
         nKx9Y83HSyiKIQlc2EPDz4c/wbA0ZMfVVg5QOJhoeruXl+cmHOrN+5fwg5CDdKTvJgLO
         auvrM4hdY0K+X25ybvVRa8cWpJPECneyBQm0QqvtXXw1HzINjOEiJVhoX1PS8iUfvbcC
         D0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrS6HRUV0+G+hcuC18YFuQhbSPvviJO8vHeS8Hckw0FTJnY6Iw3+t5C61eAGNaiRBUKcB49ZV4HJ94syz+ic+S1hzYB3Js+2Ei5YZHr6FwRAKy+Q==
X-Gm-Message-State: AOJu0Ywarg0u0b06Y3NeoGgZq7y0bSyBjGOLPTynI/D4fQsqkPmipIAF
	SeU8OLfKIZVMFCxYAIe9JoDy8ZipWhO4K8pn17vuGkchSADYipRlu+23rKnxB1xDI11Wg7sSCwm
	8METs0eT57SP85MSz6hUza3+C6dxqY+97ZV7s5I2DeV3/qVR+Siq4v/gYKercf9d6S3Jd342U/j
	3LbcEPeKOOh1BAQO+RoNJs7m9kzfkTyulDJ9yumdg7SGphRg==
X-Received: by 2002:a17:90a:3045:b0:29f:a779:1075 with SMTP id q5-20020a17090a304500b0029fa7791075mr1930918pjl.37.1711617420963;
        Thu, 28 Mar 2024 02:17:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh7LIZK1grxIAjSEbZxJU8sfdCnSCR08Lls19g/j9dBiAagox0TRBn0uSzYPXhg4LEkFCO+54lcOqzrGPqdQw=
X-Received: by 2002:a17:90a:3045:b0:29f:a779:1075 with SMTP id
 q5-20020a17090a304500b0029fa7791075mr1930908pjl.37.1711617420686; Thu, 28 Mar
 2024 02:17:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240324150107.976025-1-hpa@redhat.com> <20240324150107.976025-3-hpa@redhat.com>
 <CAHp75VdosbYNKU90QWt+6SU_i5dWC94=xZy0GXiKvoQeDF30wg@mail.gmail.com>
 <CAEth8oFuPTRq0z-YbMMFt=kKgre6x+bDhtpUkj2vJeK-u8O72A@mail.gmail.com> <CAHp75Vc6=0-eMMXYQEn9w5N09rKR9NNrqFPR8LBvZZyOiscsig@mail.gmail.com>
In-Reply-To: <CAHp75Vc6=0-eMMXYQEn9w5N09rKR9NNrqFPR8LBvZZyOiscsig@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 28 Mar 2024 17:16:49 +0800
Message-ID: <CAEth8oF_YD1dosS4a9N8UgTiQyUXuJF+HJR5xNv3+vz4KUzw-w@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 2/6] leds: rgb: leds-ktd202x: Get device
 properties through fwnode to support ACPI
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 7:08=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Mar 27, 2024 at 8:53=E2=80=AFAM Kate Hsuan <hpa@redhat.com> wrote=
:
> > On Mon, Mar 25, 2024 at 3:57=E2=80=AFAM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Sun, Mar 24, 2024 at 5:02=E2=80=AFPM Kate Hsuan <hpa@redhat.com> w=
rote:
>
> ...
>
> > > > +       .id_table =3D ktd202x_id,
> > >
> > > Seems to me that you may split the I=C2=B2C ID table addition into a =
separate change.
> >
> > Could you please describe this more clearly? Thank you
>
> I don't see how the introduction of the I=C2=B2C ID table is related to
> this patch. If needed it can be done separately, no?

Okay. I'll prepare a separate patch to describe the i2c ID table.

Thank you :)

>
> --
> With Best Regards,
> Andy Shevchenko
>


--=20
BR,
Kate

