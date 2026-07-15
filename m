Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4491D155757
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jul 2026 14:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126009; cv=none; b=Ah2Cm+H9iuHIS4jReV5AkS7A5B6ifln4bnxpKWF+1/vSLhKtrCHRlRpDkCD5/3U7ozAR/kV9U35M2e0k3cqv1BAeW9nXgMDuLeRmwhSgAVcc+qre4JGfxsqfz11GvG6QcqpgZlEar5oLkExrL0xT9fMH3e/BdRlERIzR+v3z5bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126009; c=relaxed/simple;
	bh=uF5pUITbswnQnKUGSmhtVdwCLQpxvDnZRSNrwOLBGMY=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=UOHetPZSL+y66+VUYVnfvZgx5YuYqdfTQRTyjJ/03wORDlL3x0Djb8/l8rlS512BzPwenoVWvTdVkrJR24j9OS15ExlX9Bd4FVGN3SUVHOxWXSdWvjZgO4xhbOHYkwThguNF7mCWFf4FvaZnmDwC//E7yqNnSzG7w3QvXLH2lBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidrodgers.com; spf=none smtp.mailfrom=davidrodgers.com; dkim=pass (2048-bit key) header.d=davidrodgers-com.20251104.gappssmtp.com header.i=@davidrodgers-com.20251104.gappssmtp.com header.b=Z5Ywfc9t; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidrodgers.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidrodgers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidrodgers-com.20251104.gappssmtp.com header.i=@davidrodgers-com.20251104.gappssmtp.com header.b="Z5Ywfc9t"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-667f0cfb2bfso934604d50.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jul 2026 07:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidrodgers-com.20251104.gappssmtp.com; s=20251104; t=1784126007; x=1784730807; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2j0EbK1fPEmwjFtYGexFvkmupz160yKU77vU6aoJAfk=;
        b=Z5Ywfc9tezjCQuBmujJwpDVO4Im4rGD1BI6DYW1d4TBEVxiI52qXnofQSjli6d7sOr
         bESWWccyOQcvYKKmZ8fCEruogstjloortTG+T+iAXx0/Z1QJzOQZRLNuL9AHF/3R0WNN
         hXhejIh9b6dn/UiwP9WA3gNs2y8HEGF/dc+Tx1Cp7FWhCFoNi/9cD4MdN8Of61Y83pwE
         hP8EE2wu13jK1nvhQ3eHv9PZ4koInTQmt7nT1qZdWzYQt7O6Onx/z7j5UYT1I+sl9gr4
         M1fy3j6XHVZlm72hEIGjLC7+/Z7jc2buWNH5qeBJXyrlvzY1vUKhy0gJci1EQmu7Mrb7
         r3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784126007; x=1784730807;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2j0EbK1fPEmwjFtYGexFvkmupz160yKU77vU6aoJAfk=;
        b=Lpmo3038ureRj+xQJTTanp2V9DOyOzObhmDkmGMe84jYTlrw/1OWbzKNlEIWj1mE8z
         YOWD+EjBz0bMJOi6Bcg3D5IeXhUCcG2g7HjZUZuJ+UWPZ+bAIiGPZy08055Lcjm7EJAO
         LiYPs2TxzBihwEkwPf8fltkkVSBOlYlGq1wMdYJJiWQf1PaHxeNieBu1JrTh1Zh+X5Rw
         ohkdyO8fvunFauSuIKZgtqU41wyN0e4VHP8I2Qpqx2dsqTlgqm4XaTfOY0uD+HyulCET
         5KbL/2P+vQRLYJvlG/3S+Dm7zMISM571DnXxiMyP3y77vc05kS5ig3KpeH7ZhsvXCvCu
         97xw==
X-Forwarded-Encrypted: i=1; AHgh+RoyQUvpQm+wqYu5qxxWWqsbJvGjD6lxYsQVcCmF/J5H3inZrrfmiV42GE6wibt6L2uJKNSSTOVzETt5B9SxkcVNj1+n@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8/O8qljPUgW8HjMM2thwxWwQhKrC10ALtCJ01aTg1iHFKjtXL
	+yHNDjq6Db5I7xmOS7H0uKLd0ZkajO8UMqPtVa1PLv/5oGoF39MXOm+OooWYaCKB8T2FsXBBSyE
	8cMCnbwk=
X-Gm-Gg: AfdE7clDJuTh0JwrBr9ljQPXsi6G583vU98qJl2MSUmLxI5YjVQDolxeOCXGO5Ha0Gz
	EkrVMPuauKyTItt/rPvdfyMKx2EMpEGQgrIM1kgZSb2Q9xP32J5bVpJ55qCNiKlVznjUXJr7EXO
	N/SgNB0J4+78z6slIZe8NnDEcW8TfVjlntgEmZDOFA3dkKw+11JRstxGyAlM6b0KLd8eSAAGzmt
	XzSKQUuSKoBBkHDNkNB+y415R0idldh/GyZ00eAg1IdtqW0L/OaZjn6Hv5tZRKmWveVtGKK0MgZ
	qnYToo8emFuwFsM5QlhAwRECfc0NwlobiW0Khc/gRZo+bNzKJhwCHyqB8ysiSMJUVPiNv0uaerl
	uO02MxJ5k1Ev4X/G1KkoMCUQYm24bepdFHJRHhwhZnZ13h3aWf17pUmyNrKmq/yF8a4J5Q72pT2
	YW0fJ3I5sKiZrDfk1PlU9awZvA7ntluKhFF1tzYw==
X-Received: by 2002:a53:ac8b:0:b0:668:17c4:1636 with SMTP id 956f58d0204a3-66817c42803mr1575139d50.31.1784126006864;
        Wed, 15 Jul 2026 07:33:26 -0700 (PDT)
Received: from smtpclient.apple ([162.230.155.43])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6681fe46cd8sm579652d50.15.2026.07.15.07.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:33:26 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: David Rodgers <david@davidrodgers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: amd_halo_led: writing 0 to brightness bounces to max and clears multi_intensity
Date: Wed, 15 Jul 2026 10:33:15 -0400
Message-Id: <BC3E5324-191E-4E8A-9643-A729157F355D@davidrodgers.com>
References: <DS0PR12MB8479028D213B439B7342F3C7FEF82@DS0PR12MB8479.namprd12.prod.outlook.com>
Cc: superm1@kernel.org, platform-driver-x86@vger.kernel.org
In-Reply-To: <DS0PR12MB8479028D213B439B7342F3C7FEF82@DS0PR12MB8479.namprd12.prod.outlook.com>
To: Leo Lin <Leo.Lin@amd.com>
X-Mailer: iPhone Mail (23F84)

Thank you for the follow up and the clarification. I look forward to the upd=
ate.=20

Thanks,=20

David=20

> On Jul 15, 2026, at 10:06=E2=80=AFAM, Lin, Leo <Leo.Lin@amd.com> wrote:
>=20
> =EF=BB=BFHi David,
>=20
> Thanks for reporting this. I can repro this with the Rex kernel you said, a=
nd I think I've identified where the problem is.
>=20
> This seems to specific to the LED driver we included in Rex kernel, and do=
esn't seem to be reproducible on the upstreamed one. I'm currently trying to=
 backport the upstream version of the LED driver to the Rex kernel, and that=
'll fix the bug you're seeing in the next update.
>=20
> For the context, due to various reasons (e.g. API changes across kernel ve=
rsions, product release timeline etc.), the LED driver we ended up shipping w=
as different from the one we upstreamed, and this bug was introduced by that=
 gap.
>=20
>=20
>>=20
>> Hi Mario,
>>=20
>> I picked up a couple of these =E2=80=9Cai halo dev platform=E2=80=9D devi=
ces and I've been using the amd_halo_led driver running AMD's shipped image:=
 kernel 6.18.35+rex+2-amd64, BIOS 03.03 (2026-06-10). I think I've hit a bug=
 in the brightness handling, and
>> since the driver is still under review on platform-driver-x86 it seemed w=
orth reporting now rather than later.
>>=20
>> Writing 0 to /sys/class/leds/amd_halo:multicolor:status/brightness does n=
ot turn the LED off. The value bounces back to 100 (max_brightness), and a m=
oment later multi_intensity is asynchronously zeroed to "0 0 0", losing the c=
onfigured color. Because
>> that second step is deferred, an immediate read-back looks correct and th=
e problem only surfaces on a later read =E2=80=94 which makes it easy to mis=
s. Every other brightness value I tried (100, 75, 50, 1) round-trips correct=
ly; only 0 misbehaves. Writing
>> multi_intensity "0 0 0" turns the LED off reliably, so that's the workaro=
und I've settled on.
>>=20
>>  =E2=96=8E Repro from a known state:
>>  =E2=96=8E
>>  =E2=96=8E     # set a color at partial brightness
>>  =E2=96=8E     $ printf '0 0 100' > multi_intensity
>>  =E2=96=8E     $ printf '60'      > brightness
>>  =E2=96=8E     $ cat multi_intensity brightness
>>  =E2=96=8E     0 0 100
>>  =E2=96=8E     60
>>  =E2=96=8E
>>  =E2=96=8E     # write 0 to brightness -> reads back as 100
>>  =E2=96=8E     $ printf '0' > brightness
>>  =E2=96=8E     $ cat multi_intensity brightness
>>  =E2=96=8E     0 0 100
>>  =E2=96=8E     100
>>  =E2=96=8E
>>  =E2=96=8E     # next brightness write reveals the color has been wiped
>>  =E2=96=8E     $ printf '50' > brightness
>>  =E2=96=8E     $ cat multi_intensity brightness
>>  =E2=96=8E     0 0 0
>>  =E2=96=8E     50
>>=20
>> I can't tell from userspace whether this originates in the driver's brigh=
tness path or in the WMI firmware underneath it =E2=80=94 everything above i=
s black-box observation via sysfs. Happy to run tests or try a debug patch i=
f that would help.
>=20
> So this is an issue in the LED driver in the Rex kernel specifically. Beha=
viors of the WMI firmware on the same BIOS look OK to me at least on my end.=

>=20
>>=20
>> One unrelated question while I'm here: the driver shipped on this platfor=
m registers the LED as amd_halo:multicolor:status, whereas the version poste=
d to platform-driver-x86 uses amd_halo:rgb:light_bar. Is the naming expected=
 to converge before it lands?
>> Anything hardcoding the sysfs path would need to account for that.
>=20
> I believe since v2 we've renamed the sysfs path to amd_halo:multicolor:sta=
tus, and the one got accepted is v8, which also uses the same path. See:
>=20
> https://lore.kernel.org/all/20260709-halo-leds-v2-plus-v8-1-b34c64277193@a=
md.com/
>=20
> BR,
> Leo
>=20
>>=20
>> Thanks,
>>=20
>> David Rodgers
