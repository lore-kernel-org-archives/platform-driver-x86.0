Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF9934575A
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 19:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770837280; cv=none; b=geOINhaU611+Fxt7zHUbjO03xjkuG3w2IGt8TmIfeKbDWGUXn42x2RVlQn21yWgvUu82qlwJtLaHpWzKzRXcM5Ka/1l1vquJrgGCfi112PTouVhBBjAO2xZ1AsPrz6Bq0/a13hWCXyKrA7icwPCTylK/vP++hYJxkTVhIuY+i/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770837280; c=relaxed/simple;
	bh=ee+HoRNU15ncxmF7TkRc6fBAX5rkHF4Lrdh65gTiJHg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=EaktkW/fK5i1m7kDDyD6+TMg7Oi5kC5opTgO4xPqHvq1x8NzH2sGZTqQJm1SCuN33hnkmpDvZqIwpwllRwjIgSiPXK9Ykcnw2utq+ueTmdKISUY5VqrJXGGJnRd8yRaAEJcEazq3TTdVnpfCuUG+Qe1+hCTmk4DP48e8rYB1AQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xh1k/YD8; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xh1k/YD8"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b785801c93so13574609eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 11:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770837279; x=1771442079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/59mPlMiedD8o/vH8EzLkZhlVntX0CGjZnGiL2xbkhM=;
        b=Xh1k/YD8iW5b612NG9BAAZsSG1kN4pE0o2aelH1tz6gNlyF8H1N0dkzONjW/qKHP/S
         3PmV8+Sqa9a/6fA67yW+Udim7Fpj+kHxfEGn2/QvX0LE3TleMaNhkCF7x/yF7wzEfd44
         8v+An763CKdbyLwQWCQ9py6ESZjLP6XiYjreS7jOGYmAxBC/xOxmXl6EXrwiIONsNTST
         4dveE5tKpAPnmd24VDlE7mwE96tfaBKh3wtOxR1lLl8iAQhERcvY6N2+rjh3YxY4K8+G
         W4EkmnaGaxbNCmMq1yHxHvDky+Q0VMQxRt6DvMRjCpaggFWKIFKvY05fXQLqNKYeViqL
         RRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770837279; x=1771442079;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/59mPlMiedD8o/vH8EzLkZhlVntX0CGjZnGiL2xbkhM=;
        b=dYrJLOBg54izfdZKe6eTjL5DozSv8CvDFRGAb19QgAo0xyB8lVoPxavpqT8zhl97+u
         WsW00Es74cK2KxDJ6/7mWRwWyr1cEFk6Uert7JvWvo77/SJzogjJQQgk9ADHOSRqVxiN
         PHgc8WR3t5qNf2nerEqvMzrOXiph+aV/9e+BCGlBvxwrtpE4IbLEtbL6fItcCvYd6nF5
         5Nnk4I+g2brV0cMhSHQ7XZxF6V5cRVQFvWOJWfJ3Wd7VnswE4ZzPPFfhUZLJnzeJbuym
         340RcvQ4BOTHp39MWNVbUMT2DLSvmLJGnuxuR4utILmYCqbprnur6oUIs3nZwRoAesi9
         Rg7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvyCN9alxb/x/ciU3rr7WYzhXuRgLPOQk+Nexi+NSn6Dz1rXvEgGeYSk7lXoXFfWfRfiqV/o4ueDE/ejNTxeJ+poh+@vger.kernel.org
X-Gm-Message-State: AOJu0YwoqvIfZowDU5Q6T3zAMlb6WW9gmLzbJ+3ilRQaRZk0ZZJ5qyin
	GeUc+UzwKBUbwU7wvMphisT5I+EnSrzqv6oVEpQ+kNcybHrH02o9sHba
X-Gm-Gg: AZuq6aIeC9WyswueWi2m+wr2bE9GISj7CiDy+B7E9g4R3MKH6kmFWVBx4gDjSV0m28H
	073qm+aID1+c8tOwmv5ghBH4aNa8jM75Etlkjtihq5aJXKl0s9VAaQfJLXn9GxFPo25EF010Gdx
	NU/d/0TnuDd/kvT5sikGQOfn7ZhjhuXBN3JPI35VUb9NDYNSR7YNNaDliPs2BW6eNiEEJ3P4qSU
	KnPlrQaZPtvOo7/jtT2WYVmUjOye2sQtvpBiMCXJqDp0ZCdk2aH0Yq8QkVKY42gQH1Y4HGV6rti
	2UrqDpmFpfd/lpNX7/qckGN7QRLpo2Lxa4FPvm5gunt2sTg7Ahi0SqZE/nE8mlmK+170DjhID5I
	8Jd9qQ5luJc5/eS6Bf4KGAwiKjs2ZnL+HO8lyayUGTdRFLsqRvjt/zxTJEr9qN3asi8ynWFbspR
	GNkO8sTiUgTTTnDF7mAKH2Dgd2lZag9LZjA4HaU4e+7rSMkFJYg/LUEd2GxtG7FXuurXzYs+GMx
	uf9Wr6o1qBTSoNQZNP2r+IPmKtPa2lQ
X-Received: by 2002:a05:7301:4092:b0:2ba:8cc1:7456 with SMTP id 5a478bee46e88-2baa7fda1d0mr213586eec.19.1770837278579;
        Wed, 11 Feb 2026 11:14:38 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dba2fe9sm1867732eec.7.2026.02.11.11.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 11:14:38 -0800 (PST)
Date: Wed, 11 Feb 2026 11:14:38 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/2=5D_platform/x86=3A_lenovo-wmi-ca?=
 =?US-ASCII?Q?pdata=3A_Add_debugfs_file_for_dumping_capdata?=
User-Agent: Thunderbird for Android
In-Reply-To: <06772053d9ea324117c78f83bad49e4f49222ff2.camel@rong.moe>
References: <20260210191938.137234-1-i@rong.moe> <DGBOH3NPCWFS.5SUAX6FZNZZ8@gmail.com> <2A78CD4B-9D1D-4E7E-BEC9-E567A1DBE089@gmail.com> <06772053d9ea324117c78f83bad49e4f49222ff2.camel@rong.moe>
Message-ID: <5A76941F-6099-4C51-8EED-B69AA2998CC0@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 11, 2026 3:49:43 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek and Kurt,
>
>On Tue, 2026-02-10 at 15:49 -0800, Derek J=2E Clark wrote:
>> On February 10, 2026 3:41:31 PM PST, Kurt Borja <kuurtb@gmail=2Ecom> wr=
ote:
>> > On Tue Feb 10, 2026 at 2:19 PM -05, Rong Zhang wrote:
>> > > The Lenovo GameZone/Other interfaces have some delicate divergences
>> > > among different devices=2E When making a bug report or adding suppo=
rt for
>> > > new devices/interfaces, capdata is the most important information t=
o
>> > > cross-check with=2E
>> > >=20
>> > > Add a debugfs file (lenovo_wmi/<device_name>/capdata), so that user=
s can
>> > > dump capdata and include it in their reports=2E
>> > >=20
>> > > The output is like:
>> > >=20
>> > >   LENOVO_CAPABILITY_DATA_00[0]:
>> > >     id:             0x00010000 [dev:  0, feat:  1, mode:  0, type: =
 0]
>> > >     supported:      0x00000007 [ RWV]
>> > >     default_value:  0
>> > >=20
>> > >   LENOVO_CAPABILITY_DATA_01[0]:
>> > >     id:             0x00000000 [dev:  0, feat:  0, mode:  0, type: =
 0]
>> > >     supported:      0x00000000 [    ]
>> > >     default_value:  0
>> > >     step:           0
>> > >     min_value:      0
>> > >     max_value:      0
>> > >=20
>> > >   LENOVO_FAN_TEST_DATA[0]:
>> > >     id:             1
>> > >     min_rpm:        2200
>> > >     max_rpm:        5000
>> > >=20
>> > > A helper function for creating per-devcie debugfs directories is al=
so
>> > > introduced into lenovo-wmi-helpers in order that we can maintain a =
tidy
>> > > directory structure in debugfs=2E
>> > >=20
>> > > The series is based on platform-drivers-x86/review-ilpo-next since =
it
>> > > depends on a commit there=2E I am OK to wait until the next cycle=
=2E
>> > >=20
>> > > Rong Zhang (2):
>> > >   platform/x86: lenovo-wmi-helpers: Add helper for creating per-dev=
ice
>> > >     debugfs dir
>> > >   platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping ca=
pdata
>> > >=20
>> > >  drivers/platform/x86/lenovo/Kconfig       |   1 +
>> > >  drivers/platform/x86/lenovo/wmi-capdata=2Ec | 121 ++++++++++++++++=
++++++
>> > >  drivers/platform/x86/lenovo/wmi-capdata=2Eh |   4 +-
>> > >  drivers/platform/x86/lenovo/wmi-helpers=2Ec |  34 ++++++
>> > >  drivers/platform/x86/lenovo/wmi-helpers=2Eh |   2 +
>> > >  5 files changed, 159 insertions(+), 3 deletions(-)
>> > >=20
>> > >=20
>> > > base-commit: 5a5203a45b063a594e89a2aeaf9e4923893a5b4c
>> >=20
>> > Hi Rong,
>> >=20
>> > This is indeed very useful debug information=2E
>> >=20
>> > Once you and Derek agree on the approach for this series, I'll add my
>> > Tested-by tag=2E
>> >=20
>> > One more thing though=2E Can you please explain the "supported" byte?=
 What
>> > is `+` and `V` supposed to mean?
>
>"V" means valid=2E It's consistent with the corresponding macro name=2E
>
>> Kurt,
>>=20
>> It's enumerated in the patch:
>>=20
>> +       seq_printf(s, "  supported:      0x%08x [%c%c%c%c]\n", cd00->su=
pported,
>> +                  extra ? '+' : ' ',
>> +                  get   ? 'R' : ' ',
>> +                  set   ? 'W' : ' ',
>> +                  valid ? 'V' : ' ');
>>=20
>>=20
>> From the documentation:
>> uint32 Capability //7:by project=20
>> bit 2:  0: not support SetFeatureValue(),  1: support SetFeatureValue()=
=20
>> bit 1:  0: not support GetFeatureValue(),  1: support GetFeatureValue()
>> bit 0:  0: not support feature,  1: support feature=20
>>=20
>> I don't see any examples of the "extra" bit in the docs=2E
>
>It's not a single bit=2E Instead, it's printed out when any bit other
>than RWV is set=2E I added this when I recalled the definition of
>capability 0x04050000, which has an extra bit defined:
>
>   Fan Test For Diagnostic Software
>   uint32 IDs //0x04050000
>   uint32 Capability //9:by project
>   bit 3: 0: not support LENOVO_FAN_TEST_DATA, 1 support LENOVO_FAN_TEST_=
DATA
>   bit 2: 0: not support SetFeatureValue(), 1: support SetFeatureValue()
>   bit 1: 0: not support GetFeatureValue(), 1: support GetFeatureValue()
>   bit 0: 0: not support fan test for diagnostic software, 1: support an =
test for diagnostic software
>
>(from https://lore=2Ekernel=2Eorg/r/CAFqHKTkOZUfDb8cGbGnVPCS9wNbOBsiyOk_M=
kZR-2_Za6ZPMng@mail=2Egmail=2Ecom/ )
>
>I assume extra bits are not standardized, and some (current or future)
>capabilities may have multiple extra bits defined=2E Hence, I simply
>named it "+"=2E After all, it's just a reminder for us to check the
>documentation (I don't have any, though)=2E

Okay=2E Makes sense=2E I have no issues with reporting that then=2E=20

Thanks,
Derek

>Thanks,
>Rong
>
>> Thanks,
>> Derek

