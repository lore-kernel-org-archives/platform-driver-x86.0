Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672192;
	b=pAhjU27ie4duMPydrisiHHenAceuPXVYWwG1LBXJ97g0qojQbco5PT9+uAp+0FKMhUM+
	 eHwnIPBMXRZkcadJhLLbZNDuTtKr/rhh1Dih8uVw1k23gSFjnRbLfomlukDFQEr/lJcn2
	 f76kINm6p7ykorfAO1mL0Awufdv98nDl4DBsCvU0Tcbnb6PNy50XjvbZiV8vg6Mc0ts4t
	 jAtWCVJAZ5FTkmE15OknLFgCas3IAnEIzfvsOeeJGm6+Umr4SoPoZDy3bYyTihW7WaE76
	 4JsY6eBQx+8oI4sUuymd8/DDA0c8sbhIuGrzjUGUK16XlO4yBkmjAm+rLE4Ej8C8JOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672192;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=sfsMVLLnQIl2c/TSBakPGy/YmZ5fohM4IYX3/lhT36M=;
	b=A4iEKLEKgYSLihfdxHtaaSZY5D356Q1GyK20LJ/DowRBZXS9/rLNrZsRmuuYhyC8brAj
	 2ufoT04ITKwqIQJlv0AIUrZgEpXgHx7n74k8pWCKGX8PCbFzWoC/3v87BpKRdNm690Gff
	 YaSqyXFwhfqckVR4CrgxzBKwjcSrnFEVmD2KbeJq/JjH0xd1DN5W0CpAun7LjK3/HrClA
	 FZJKgwPUbqvsraMgSSpXzqqeEYgjRtLo+LV/QALvAjwnVVcgST+zZMZJcF9sa/bG+J+Xd
	 hWpZAIu36BwYEt3WqyrjvHFrCivHjNCYDg2hAMBHJD+paDt5XzOCm6ichRooaHI6mTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b="Un//uSdC";
	arc=none smtp.remote-ip=109.224.244.16
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CCF606A32D
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 16:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74CCF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Un//uSdC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794672189; x=1794931389;
	bh=sfsMVLLnQIl2c/TSBakPGy/YmZ5fohM4IYX3/lhT36M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Un//uSdCLl1gy8Pp24cfvsJS/o7ZeQBA09MtBfLEx5CX01tvZRM56yep4Ok07abHX
	 1IBd+Ay/ZH3inqH8s2VBoERiZ20XZfGPbBwSTY8ASJv1ooNerzhEVcKnbmLlLpKrbB
	 fwOSV1gRZq8nq9gqZ1OideisgijWtOKjkqdds8UBgdwGd3ys+ui6w1PkHnbZXChY6Z
	 rYGHkJ1u8tqZkJmcKT65KCrsk+61PgMh4paivKyUIU6NQEHVWIrZk0VdUSX/Xk0R/r
	 fElvix99hEp3SVNOzcG0weMtSHaiU2XJfIwFJiTMxXWYm39/z5OcwZDLrXkczxNeX4
	 b1yMeYq5Q8UGQ==
Date: Sat, 14 Nov 2026 16:03:03 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: =?utf-8?Q?Eren_=C3=96zen?= <erenozen@protonmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fuwei Xie <12313607@mail.sustech.edu.cn>
Subject: Re: [RFC PATCH 2/2] platform/x86: huawei-wmi: expose native Turbo mode as platform_profile
Message-ID: <EjBEfObhfJDnZ55NQlG2QsrN1vIwNF5koBTvhI10lceDUSg-ehU_zaxIzKjNHc7zQ4vhn2s20Lx-so3LhGaeyGYXw1goKsT7hfPmrQKq-6M=@protonmail.com>
In-Reply-To: <583B99876AEC4CF2+20261108041714.328986-3-12313607@mail.sustech.edu.cn>
References: <20261108041714.328986-1-12313607@mail.sustech.edu.cn> <583B99876AEC4CF2+20261108041714.328986-3-12313607@mail.sustech.edu.cn>
Feedback-ID: 19860221:user:proton
X-Pm-Message-ID: 03e481a96952fc2c7a30f4371100a96f6f01b115
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Fuwei,

I tested this series on a HUAWEI MateBook 16 (AMD Ryzen 7 5800H), DMI
product name "CREM-WXX9", BIOS 2.32. Its firmware has the same \GTUB and
\STUB behind WMI commands 0x0e04/0x0f04 and sends the same 0x2a0/0x2a1
events, so with one extra DMI entry the series works there as well:

=09{
=09=09.ident =3D "Huawei MateBook 16 CREM-WXX9 (BIOS 2.32)",
=09=09.matches =3D {
=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "HUAWEI"),
=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "CREM-WXX9"),
=09=09=09DMI_EXACT_MATCH(DMI_BIOS_VERSION, "2.32"),
=09=09},
=09},

I applied both patches and this entry to the driver from pdx86 for-next
and built it as a module for a 7.2.15 kernel:

- platform_profile_choices is "balanced performance", and writing either
  value switches the firmware mode (checked by reading \GTUB back).
- GNOME's Power Mode menu (tuned-ppd) switches between the two.
- Fn+P updates platform_profile, and 0x2a0/0x2a1 are no longer logged
  as "Unknown key pressed".
- On battery, writing "performance" fails and the mode stays balanced.

A few details of this firmware that may be useful:

- \STUB only checks for AC power here, not the battery level. When it
  refuses, it still returns status 0 and sends 0x2a6, so the read-back
  after the set is what catches the refusal.
- When the charger is unplugged in performance mode, the EC turns Turbo
  off by itself and sends no 0x2a0 event. The power supply notifier
  picked this up correctly in my test.
- After \STUB, the EC also runs its own Fn+P handler (_Q71/_Q72), which
  sets the SMU power limits through ALIB. Switching through
  platform_profile therefore has the same effect as Fn+P: the STAPM
  limit in the SMU PM table goes from 45 W to about 50-52 W. Each \STUB
  call produces two 0x2a1 (or 0x2a0) events about 35 ms apart, which
  the refresh work handles fine.

Tested-by: Eren =C3=96zen <erenozen@protonmail.com> # MateBook 16 CREM-WXX9=
, with the DMI entry above

Would you be OK with adding this entry in the next version? If you
prefer, I can send it as a separate patch once the series is merged.

Thanks,
Eren

