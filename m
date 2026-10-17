Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034833CEA5
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 07:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792221676; cv=pass; b=eXVyAUp23o7yqs++6j9Yk/V21zZO5LGHGhATe7jYJi/0ekqwHHIVCluIMmD5rnMOBHqFEWkNfUuY/ZUuVSUJv66lfiH2zX5O+PLEFDvMrbf0L73yeSOcjNUAR4s90lmBqk6IAJW3l04phOUwkH756mDnFnAlWZSWM4ZhKT/mlQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792221676; c=relaxed/simple;
	bh=gZr4gESrp26hvAbiwwT3Hx7yawtW/6+UzIaqsudFpCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZ8NCV6ZDJ29ykJjbgVFM0QZS0PlmTr2MchfFSppIUoXcOjn/D8QPTMsYbrqslP8PdwCNxWn0Jozpi81H+F1mdPiTPUCPqMs/jKvyfIZH6NlnytVgtRa07st4S0zsxv38zro5BsLCk8f9dO9/4jRq5zr4ncm/B2brLSvOyrW92s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoJqU3W/; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoJqU3W/"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a9841363b5so4124471fa.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 00:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792221673; cv=none;
        d=google.com; s=arc-20260327;
        b=NiuoyH3P078KGtN5OXu5DnwhlLu3v/avyGqmMFCeI8IANFKGfinv1PE5l3g5ztJjaJ
         muAKXJ/B2axHQdbseFYC7mPN9OyvWGF7mg1OQckm0BLzo4423UUshGYGMvVYAHUxOpSy
         MJDEhPw/ZEQT29aTaRpMbflEYcJPrijbIuwc7O6EhRKZkzr+kj7fpGZ2pixCK5byOLls
         LRh1JE+W3AGZKBaCZaRIOH1eqr2qWph1tTHr6lmUIqtxfdTlePjlQOyV/sXRQqqq9R0m
         ytw1EFZN2D//gn6OOCOzBtZCShF6FKSGAEU9wNY5/xlnOk82QeC9rpR0PqWrfy17PRwa
         +ZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jBeT/jDjP2xiVG5zgH5DBC3f+h4JQqHYz3J4+ny0zZs=;
        fh=K85+DENEKkE0GQpcxLtthmJcBPkdbJIXHDVfGGnxdtI=;
        b=NWOhC2UqHKSxICJbXAgsnDuqEEMcJuALiKrob5Dk0RlLSXih7dIFHfuOfzHZY9Vc9n
         UCfuP75vOHqOsfqSZ63z+jbsun7mryCUaudARJwDSCX/qJ1qrCMCPeD+Ffn5/M2H4cQb
         ELHqqr62PYbPBWXLQY3y0GV+DSBNybu2He0MPfRplqQXfEf7IbUPkaOwRtdlDkodo5lP
         EsrW+MjbdddV3VCFTiLwoI1WoV45NwvPrVG2F9Wcc51oPQy6/Kaw8ULk0OUeGxpqRFC3
         eY1qDRw+UR4FD86bcfjKHnJ0X7hJfBM4NBpY2M3a3BFo9jrqktlgQ/1VG/65k5Ngu0K6
         jkeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792221673; x=1792826473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jBeT/jDjP2xiVG5zgH5DBC3f+h4JQqHYz3J4+ny0zZs=;
        b=CoJqU3W/h1+HIkzQ735xtrOhSjPAzRIBLVbBt/KRBNMbj4emSsxVB27QfrJsfaAotB
         mcvNxeQHDXNesftVqopbF0zsNp5hcPguIxJjEHXYT3lDXCEOQTVMnjD6ET20AI260wbj
         nTLdrdnsCOjuScL+uUCr6HPt0J32fv9/QsJ/G0khrlw+JonkEbxgPk0asjzFGNqlsqDO
         Tz3vXrLJ04Dy1QHkE57nYboqOqHloT490TIT3zGX7nxESq0/gPixXGJeFpeFuY4bXRua
         jHE9DyVmWugJtQ0E6Uwc2rVdsh5wIFrS2ew/vKM9KmSX2YuV1vwAoWZDudHI6ba08vuf
         QXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792221673; x=1792826473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBeT/jDjP2xiVG5zgH5DBC3f+h4JQqHYz3J4+ny0zZs=;
        b=vtM4L2TdZwdf+10Q5DHQKbzcBHXlLdvP02R3SnMpbV4AwxpZJZuzjkung/4CN4Zs82
         Jo4BmsY9FBER9OoGaeCt6SnCHfeAs9BqnCZFMODYeyh0B0yKiYLLtVVULZZQxCZIUESR
         oO6QRpCKlMoy4OrxVUKNg2Y8kdErWDJa+oTMSENVizEBP65KfAMejFpxaMfRMA8heV4r
         4I6512T50uXAv8niqbQ2V2YMCvaO9ypBkIhGwZy0q/eCL9ZIPFxs2VsLQ3NSS2GW+z2l
         zDSijwbm6948sebxcWfcbluV7C2qh6q1nEd8ayM9LGYIf5DzlhtOCaXky0eyy+9kHOKU
         +kgw==
X-Forwarded-Encrypted: i=1; AKwUvBzZb6wLKa++pzDoaXY5/+6xek7GfeeUs2mhBQuqpyOVsQBIz4CzASRfV2OuOiIfS2VV1mEr3cdKfBJnYAmXNlKZW7Ql@vger.kernel.org
X-Gm-Message-State: AFq9FYIcM5UOylo6tUph3Ei8alBHon9lZT7MhZ2c3xBx/DJ+qSAox2rz
	VMEAgZ8NU8GA6WLr6suLK2kLJj9jBpqTHSomcFO87rF2WsuMarOS6UowcqKa48uOj1uDvFPOiLH
	m1JRjWTHsFetssoendBewFWNGE0cjWFU=
X-Gm-Gg: AYBFou0PKMxcqHkoOY9esaUTLNQpcW2kPF67pRfM2I5HrkCkmIBzSVXbuBU1WNU4Gzz
	cRfnjKDg1zpLMpPQeVM+1E2YT4pRp1N6lx80CF1EigpM70C2FPx4b0xXgV5Vg9VzxTyjenG6Dtz
	gZ0YK8/Q2wGVi9uqV6xU9MKZGSmxm1YNy6LJ4vJASVzRhSkAAzgs4aYqDVufu1WnaCbMEKiWuB3
	SheHtt8J1nNlef1paAwdCuzmWpkNr1OTWukYk/w5IyIS0qAUXba2uwv9xOHWsPoulOtGMuUrZgq
	uymRdP51H0mxf+yMAUKupfmJB9WTcjQG7fPogllhmKwqkNEKEQrJCLI2/TO8tsu0od8hT+ioAwl
	WikakUIVwHMNjX9iATBnkv+aKpP1yrRfDXrMEJmSh883+2YyIdniwLf4DXDntmMS8HB/HjLkaO/
	0+S9V9o6g5Yklp3n9nvWUCAm24Jrw5rl0chZmfjBi1
X-Received: by 2002:a05:651c:b09:b0:3ab:2a19:862b with SMTP id
 38308e7fff4ca-3ab2a198757mr3867211fa.4.1792221673027; Sat, 17 Oct 2026
 00:21:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com> <20261016141716.130220-2-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20261016141716.130220-2-johannes.goede@oss.qualcomm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 17 Oct 2026 10:20:36 +0300
X-Gm-Features: AclHuK9QqFyHHYo1Ic5DPqLD6JKANTlcGq-Ec6EaEDFXVDarK1C7PbqQUwFsB9Y
Message-ID: <CAHp75Ven826F0U_=2QzZVx-6TJTV6-LLjqDOqN9mxVC-CNmkTg@mail.gmail.com>
Subject: Re: [PATCH 1/5] media: ov05c10: Support full range of power rails
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, 
	Alexander Patrakov <patrakov@gmail.com>, Leif Skunberg <diamondback@cohunt.app>, 
	Sahan Nissanka <adee.sahan@gmail.com>, linux-media@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 5:17=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> Add support for the full standard set of power rails for Omnivision
> sensors: "dovdd", "avdd" and "dvdd", using the regulator_bulk_* APIs to
> manage to regulators.
>
> Previously the driver only supported avdd, but depending on the design
> some of the other power rails may need to be controlled by the sensor
> driver too.
>
> This is a prep patch for some INT3472 GPIO -> regulator mapping changes,
> which require sensor drivers to support all 3 rails to avoid regressions.

Seems quite straightforward.
Reviewed-by: Andy Shevchenko <andy@kernel.org>
One nit-pick below.

...

>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>

Perhaps keep it sorted?

>  #include <linux/regmap.h>

--=20
With Best Regards,
Andy Shevchenko
