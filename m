Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792460567;
	b=5PViPp2yiMtJl2bNFCnbyPQ2FOy4M34NTMmj3MuhrolKuQdMpYqrefdgmg9aqMz/phvi
	 M7gxPKqJABgMxBk7OQhjN2speHJCL6B+VvCM7Jpsti8BelYYE7XBj5Ewao1/wCqO/FMFQ
	 +InYV9IP4DKTBlihJ1wAZFZ4nXJUm6yxtfmjq72vDsoLF6TWswpEuK0ysCibtmwO6xAjq
	 D2s/TLLNjXhP/HK9Ncv9iONR6+khnvOsF3EdG4K83+nIPT/dB4CLE/vS5DwyHKgZ1jNQv
	 8ATrcfe2HwUft8rJIww/6//HB1geDezBf0pxoi8f/xPiJzjM/ueOo5uuoQ2Akc4ew1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Rp8Ffr7i1kQdoqttTgj80eUef2QxAuNHO9ZKaqh7x74=;
	b=Abj1wIQh8s249IscAOd6Z4Qmkys+YstDvuSOR0Qg8F7iIgkciaHIA4ADrd5E/t4wVnO3
	 paddrEb0Ty0B/onGATL7MmHJJSTJb1dO5Iwd0zEvRzRQ+IDWPf5qvOKGP+M7/UpmFciIc
	 ZL9OH5eJWuestlBbPVz/ncTB2d+fDlVbtRc7FxDsfw2/0dsujhw8o54twkc4H5Gls4bDO
	 6KQE8rzVAH0QOEQKrzfibxgj/bL22aB+b/mOOARDLkkOm1w1K/V/ImahSctFlw7SNbfpT
	 qu5rx12ERLX9WAVwgcCuPqjBgX2dTljqpVy6gW2ntjoI9RGVetaECgFoPeGa2MO5kQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=omGHA01z;
	arc=fail smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6A1606A319
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 01:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC6A1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=omGHA01z
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-14394530ec6so1749336c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 18:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792460566; cv=none;
        d=google.com; s=arc-20260327;
        b=eDe/EU7XiItlcNdgywGBT+G7EfP6ZyHESVUUPsug3puipGTHGdtfRAwIM1DGtIlFc+
         7LGQpCtOXH+NtGSQqFXNodaSkWXAvBq5/xa+WenLcYKN6F6JUfhtYEneXQmR1QQPnEJ8
         so06tdpKbWDg1xcq34UCI3mGCMz9MTtIQY4+gUZfGvYs4D4esmBzgFhNAbmE8wybRkbM
         /KfqmiCmCNNGJ7rqvo7Q0rAWJg6H9zkiit5xFm2IZqU0UQSO5GVZpw/Z0Lsxbm9weebq
         vN36k8Dqyoze2qlbarbubL0asSb+TykJ4z4e+nReMiCrGw6nj+UvR0pG0cqS+qzxV8Pk
         uCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rp8Ffr7i1kQdoqttTgj80eUef2QxAuNHO9ZKaqh7x74=;
        fh=D/TlMEA3xx6kKMz+/rRuvQobHrRaXZeT0LazgngBUc8=;
        b=PkHo/tqDawEbXLUBoEembZ5l/4JYmFg/ngbxmknmY85ZpvZWmdVB9B1A+gUFW9Y5nr
         64zVre8vYRhF8PiClhzuiX57vQonyVLAss+wFNGzC2or/UbAOX3ElsIldf205jUtu5X8
         2/CGGhu38IXd4XbXm776g+NXp3IJrczKqxkQwAVlcaGW15iKgEy4NreoBMAKxEhCDOuh
         t2W9q7tj1Pc3TcL7TMk1mL9RWzRK4QK876kl55/3MeWZlTubDfnxs3NUYZvTyUFaVDyx
         zZ2T4zw8WzCf+ysUoL9bVueDR4OwCzUYe2rGB92jZkS7UQ4t9ExyYc+Eoi31K610SpGm
         C5jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460566; x=1793065366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rp8Ffr7i1kQdoqttTgj80eUef2QxAuNHO9ZKaqh7x74=;
        b=omGHA01zmyPq1CHM7hp2/yWfhaEtC1zIvrXr/bzStVHNjFKYIIG/GvZZT1wo7o14+6
         1L+VjmU0hTrHADB1UCD2yD+o9VorZm8Fjcq8BOKSsuc0mZtL8wj389Omu5qKyfzjsLQJ
         JpS6Vmt+fhy9E2Wv65b9rKEknL7NWkWY7SAhc4WpwrsQxlgMfcRLh7QxNWlVIDFmptdb
         Z6cGKvgjX8riTied9zP/BqVJTbhP6GTHYYtWJ1GL2libTRGh2zq70t/ZvBsap9DO7uAp
         DFMfPiSPjabPV2lHgSjIXw1lBlHcETOh7+JSN9nWqo3biBldacQj1DvDkljq1JotLpkj
         R7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460566; x=1793065366;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rp8Ffr7i1kQdoqttTgj80eUef2QxAuNHO9ZKaqh7x74=;
        b=SqWdxKHJdRx1adCi9fCGp0ceJ17CWvNli3h9HWg/RZpC6UzbX9BCC6TV9fFlw5b2HW
         1zw7ZC/IzknVvUfpHzb7Lo25umX9y2ylY2K1Ld3YtXxOHW7wPpwxMsgCMnTANBYztMQz
         utJH01pQ8MhHzCCGAjwNqraLNHbYAiaqZlGbsVhpFUOT4OLoH/1+IkKGpnxo9covhw0I
         8f/tJ8YZqljW1Bc4UcRFSdDxe61fiiXYQ3QBR7h5/5NFsLLrfmX3Mv3x7Tdi17/AnSaI
         phLICt4eVVt3ASu8Bqk44zf/PAQTSHTsCV0BGZq4XfGoSMVOnm0VqU5Eex52L9ppXW2j
         ZD+g==
X-Forwarded-Encrypted: i=1; AKwUvBwin/redhXePtjmb6KEZOUcIUE9MDEq3ssMNw6kJPdn+F2eNFH3d+eiusXmWueBxJWn78aJvvuLMswOpv5rptalUqUF@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7H83M5hX7PfwvNnGkcBQFWn7Yf3V5Sk84iUp+zHakxGZpx+KL
	f4SOTDatLdv5FELlVG/5vyU3nfx8dYGjddAndigoFRHwdM+UAHvPazm+4ddXoNNmOZLhjl5r/Am
	e2f1dy/mzCb9AnSBl4mb3GJVdyrz01r5rnQ==
X-Gm-Gg: AYBFou2IU33vhIq18EvzpisJMJJyLI3Gr5U/ydroJe3CkI0hrD1Y/PeNEZiCaLzPf5I
	Ts7YOOv7jxvK8KeNvqZFs79ydJO7BkTpmVMzKXuWnA2oVmaakZ4CCs6jBjdaiWA+gsqgd5jpDGA
	zPJyVOVaWOtBhwvTnaB/V6Z37G5Szt/ECZdpQaNx6TIA0thEj+Ve7b1OQMi7gSEHCWe6ab4x9pR
	WjdyCsscfweFfyWq34w1SOpEQ+c2P0lYKUM6+/zQblAM0WRlypW4ZRBjwQAWsYv3uf3bmGRU+B2
	E95Kl02aJTAJmGROUbnR9RVN0YsYGkaWv3UuBy+TLm/JBm5BICqKw6+oQOzN1kYLkXHMN4Hkv3Q
	u6Azx2knPcjWqRegN8wE69JjPYpuLcCMtewOykpNR/JTZk3+qOrxNXmLhCdRYslAvGbCY/D8Ygg
	==
X-Received: by 2002:a05:701b:4291:10b0:166:9e0d:3b56 with SMTP id
 a92af1059eb24-18513e7c690mr13539809c88.38.1792460565679; Mon, 19 Oct 2026
 18:42:45 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
From: Alexander Patrakov <patrakov@gmail.com>
Date: Tue, 20 Oct 2026 09:41:38 +0800
X-Gm-Features: AclHuK-hKUi6ptQ0VuUKNJ_EDPqfEHSaqDvIfagtlke9vieQerUGIlASU92TZLY
Message-ID: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
Subject: Re: [PATCH 0/5] platform/x86: int3472: Fix AVDD and add DOVDD + DVDD mappings
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, 
	Leif Skunberg <diamondback@cohunt.app>, Sahan Nissanka <adee.sahan@gmail.com>, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 10:17=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> Hi All,
>
> Here is a patch-set to sort out the problems with the Linux INT3472 code
> mapping the 0x10 GPIO type which is meant for AVDD to DOVDD.
>
> This should allow the OV5678 front camera of the Lenovo Yoga Duet 7 13ITL=
6
> to properly get powered-on by Linux, without breaking any existing setups=
.
>
> See "[PATCH 5/5] platform/x86: int3472: Properly map the AVDD GPIO type t=
o
> a "avdd" regulator" for more details on this. The other patches are prett=
y
> trivial prep patches.
>
> Note this series is ordered so that if [PATCH 5/5] somehow does cause
> regressions it can be easily reverted without needing to revert any of
> the other changes (which should all be safe).

For the whole series:

Tested-by: Alexander Patrakov <patrakov@gmail.com>

I finally found time to test your patch series (on top of
next-20261016) together with three more patches that Claude made for
me, which I will post in response to this message. The camera "works"
to the degree limited by the incorrect format declaration.

AI was also able to generate a standalone tool that demosaics this
complex layout to a proper color image and feeds v4l2loopback, and
that's how I participate in online meetings.

--=20
Alexander Patrakov
