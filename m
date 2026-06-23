Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DB82D739C
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 15:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229046; cv=none; b=LY5ZyLNiFZJqaat8H4ry56Bvm/WAUzsAgzzVWNQM2+hV0d0ThIchl1ut/d98m6v9mKDYv97gFkPEn0JuHYB7k206ciEIgujEvhOjzaikjPyaCn6NeNjeSoNKaWDuy2OUFhF6Z4cM46u5zRncH/gXtBTw12mapyZAybB6vKz/+44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229046; c=relaxed/simple;
	bh=hJIff6NaLI+3bG95oGNpqk3LfprvXx2YuNVMx/aFlnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dS6fmLpg+GC7bmuvIMEIE4RVyy3l/ZPvDr4DyaD5eq9eP+mhD4QDtsZPllJR8vTo5O88JmNP1rFwL8b5twzedKpgIbN71sDrZi026yIViTK120vqrmyy9u7LUM976pptWrNEo5PMplDlf8CDUS1JuIpQxgvOgE3Kiu3MMCfuW9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hwFvCFWR; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hwFvCFWR"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c6be9cd7afso25150025ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 08:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1782229044; x=1782833844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKOiGMB/GqJqkbRXgajXU2pXMmFlymIxGfwrG7XeYaw=;
        b=hwFvCFWR6ercPigrnUp9S5lU4Tek4NO8N3kdnTnckh5J88gzpb+wrVhZVypiAuTx+x
         zr4cjnn4YHA0LtHMb0sCCIOEfE0PS2tTAvfgcu0UyOd+LVXA51YPTGLXKfKsSseKmdWB
         DkSdW07tVh9jLb0lKyBbcrsxQWPU/3MSKUqpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229044; x=1782833844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lKOiGMB/GqJqkbRXgajXU2pXMmFlymIxGfwrG7XeYaw=;
        b=mS2rpzrO/ZEHmSkkfVc5qT0FAIIhzBwlayWTYPXtMVEZyJddoe8aSIN11/hOTZaeNu
         Thk9pBz0NJ0CRM+bVBkg562vKpLBue1zQS57SFAZ97yE4w2SybHyE3YPLfvCS5p907ai
         la7CXiNB6JntscXtN+r/UwPmYTKST/b2001T1fMzZ6KqoHQUfkkLLuFlCu9KbK/OwvTm
         w+B8lIl0YjiUIE5yVt86Dwrl7RqpaJj2vUy7/hCU0NrZzeVgp+jkp+oJp25oFPVCOIrl
         NRX5L6gS5lq7J3oMUqFjBhmk2lCklRu4M1I1e+fvHAxoljzwnus7wWEDfFvqMurlTE5p
         ZjeQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCKULXN4YsN684CH3TA4RxvrGgKVMQ0cs2byQhzq2bfdmxXoXE9VYZP+ddXZB2u2jqIiFj7djGA2C/OPEejPk4qIax@vger.kernel.org
X-Gm-Message-State: AOJu0YzWuYuTRlQmH0zNZuDNzIMTQ6hL35Bvc7Ba/oiv+aGXGWTlED+5
	We8NcucWPz6dLeY+9Z/AvyZkD0dpCpuzV56YRh8ATjSZqDN4a/VzAVBanVEPeHtWlehMSPPTjAa
	E7QRlZX4=
X-Gm-Gg: AfdE7cknvSmfEPd/8UXQzhik2x+Zndzwfe3A7o4RRw43PaHz9VF/HC6/gGThRBfvafK
	Ombm4B9b1YQsDcoG3vefqGGBueLaAZ2ERYzD+ytQGV7+JQw+WcZ7Oceb4bJEwPqcP2DoUg6wegf
	GuIMj5IZFHB5KJfW/vkLI8e9JF54Rfd3JZYovhpKQQF85UsaxZFYaGYTtJ9D/unXn9NUpbDu6KQ
	okGvQ4zFGjj6J6F6hyE7sl6I2R3MhU2cYQgcWy4O3qVvOjXwiVPJCfDvmpomRw2tJ8gH4Vx8VS8
	4aIGRu0pezzU8SUniWVDRzgmQ5qWSaxn3dfeYQj1LTfBEw5PlRweP1NI22haJXiRQx4oFk6EjLD
	AK2B90OxU69rR6DfoqUaCVIllZ9Bv91iJZJq3rePviWojcazMHt3HytnYW4NeSXpbDPDwWSXDJI
	Gef0B77QEAzJJ+skH63KgP3h02bmqz/bQLjCuTOms93o+BYVyccmU6UOTfe+u9p5GMlA==
X-Received: by 2002:a17:902:f601:b0:2bf:1e59:d99 with SMTP id d9443c01a7336-2c7c9908f33mr34251325ad.8.1782229043592;
        Tue, 23 Jun 2026 08:37:23 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com. [209.85.214.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8e81sm111989865ad.52.2026.06.23.08.37.22
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 08:37:22 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c6a97e1d1bso43641285ad.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 08:37:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RobJVnPAF0jhvBxAd62EpoZc93W4TYasnZCKxDwneApJR1YIhCSCLY4xgApyxZAkUOuqA3VHqFtOt90De0LIGnHLybC@vger.kernel.org
X-Received: by 2002:a17:903:2281:b0:2c2:7e17:39f6 with SMTP id
 d9443c01a7336-2c7c9a9c706mr30871045ad.36.1782229042087; Tue, 23 Jun 2026
 08:37:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pdx86-pr-20260622211510-2801419545@linux.intel.com>
In-Reply-To: <pdx86-pr-20260622211510-2801419545@linux.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 23 Jun 2026 08:37:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi=29jSstqyF8EqRFccWnA=1TfXW_jcURhSd4rJgkSxgQ@mail.gmail.com>
X-Gm-Features: AVVi8CeOD16m-ki64Kbucf0piw9pm_ldAY688oZlMK-mRYWldBOZNc6x7Z_L-Qc
Message-ID: <CAHk-=wi=29jSstqyF8EqRFccWnA=1TfXW_jcURhSd4rJgkSxgQ@mail.gmail.com>
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.2-1
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Rafael Wysocki <rafael@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Jun 2026 at 11:42, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> There is going to be a conflict with the commit 3570cb58e317 ("thermal/of=
:
> Pass cdev_id and introduce devm registration helper") and a few other
> commits that came from thermal tree effectively resulting in a change in
> devm_thermal_of_cooling_device_register() signature. It needs to be
> addressed in the merge commit or the build will fail.
>
> Mark's linux-next discovery about the build failure:
>
>   https://lore.kernel.org/all/aibZy5rrdX3ltGpr@sirena.org.uk/

That resolution makes absolutely no sense.

Now that qcom_ec_probe() goes through all the work to create a name for the=
 fan:

                char name[EC_FAN_NAME_SIZE];

                scnprintf(name, sizeof(name), "qcom_ec_fan_%u", i);

but then the name is actually never *used* after the change.

The *logical* resolution would be to make it use

   devm_thermal_of_child_cooling_device_register()

instead, which that function was renamed to in commit 8e1529e79385
("thermal/of: Rename the devm_thermal_of_cooling_device_register()
function")

I have done that resolution that at least makes sense.

But honestly, this is all a complete mess.

Why the hell was that function renamed, and then a new function
created with the old name - when that new function then has exactly
ZERO users?

Renaming a function, and then re-using the old name immediately for
something else is a BAD IDEA. It causes exactly this kind of horrible
confusion. It's an even worse idea when there are exactly zero new
users that make that confusion worthwhile.

Thermal people - you effed up. Stop doing this kind of crap. This is insani=
ty.

                  Linus
