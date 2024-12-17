Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D533017BCE
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 00:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396818; cv=none; b=ERlbEgwOpIouZe2prW9CRe78vQ8ksivBwyHbohcBkUVgW0LzgfsPLnhLNfsE29VawJdYJHlQYE/bohMIyYJa2wmU7JFhdQm36RAvOzdul/PQMynCc+GSM2hrbDp1KEumdNIHQozLMKa8OZfR8uMYhEGXiSHu1B3cD/3/cKOoXQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396818; c=relaxed/simple;
	bh=QrOdYbLc3TwD++ZiBgQzncn49ox35J72zeb5wQst1+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9Vy37jMkVM4rl5labj2p/aimnyOtAb5faX1YO9NSMbvaj2UPXVbU4bVkeEMJMc4ScOIFnSEnVt36hBwSX4zhXbnVuhYxzdgWRSwtod2G/VSRN0gkPtu+ZWeYXX+09e+v8mPVyjCgZbeKkpC3UF1oFjJpJ5PuS4b/vzDO2iwBLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bKof0MO/; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bKof0MO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734396806; x=1735001606; i=w_armin@gmx.de;
	bh=o/CD4mBynA2VDONwTneSKRMYjguhqroJ7Aa2Q6qLei4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bKof0MO/G0lQo/WnKTnPHwlBX63Vy6RpyHU9Gg/Bl3DKOCg3RI48UR9g+KFBc64K
	 XyrNoiG27Bw/uUYVkiZGUG3swhfPLzwQJmZpIhbOXXdqfXNFL2EHsE6h6PjfgWENL
	 Tqhh2QOKqGTEAdMHhWtGsBaCyqK53dywxxH20wxV3fqqBesemFPtRmfLG46WIyTc3
	 +1Hx7Vn1BSqkIwaynNtGtoMBHGwCsn8QMUnc9tACOUqOwMW0MYEKXqKZebwqc9bi3
	 m3V6kzMgV6iDEMUBcfdOz+HCtt1AXd4XWYzlJMuOv/QNlfzvXT4WY4fj5Oopbbv/P
	 i2vhDaHSHWoTLEbuog==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M59C2-1tOSIc2dQi-008oE7; Tue, 17
 Dec 2024 01:53:26 +0100
Message-ID: <b0bc4e05-b8a8-4a83-ab56-ef8d6cac3d06@gmx.de>
Date: Tue, 17 Dec 2024 01:53:25 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Add samsung-galaxybook
 driver
To: Joshua Grisham <josh@joshuagrisham.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
References: <20241209163720.17597-1-josh@joshuagrisham.com>
 <9b1630fe-70af-634b-b8ba-7b065d9ce5ae@linux.intel.com>
 <CAMF+KeYHWrfEGF5mUashzE9cmC+fU-X825bRRNJc3FS2me6eMQ@mail.gmail.com>
 <CAMF+Keb98Z9hDnb-gGacZJWnRRuMJB08Gc1kyTQ2rkJiJMRTrg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAMF+Keb98Z9hDnb-gGacZJWnRRuMJB08Gc1kyTQ2rkJiJMRTrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SCqpuLtv8eibsBMxgUqKgEbya6ZqZ1RHSDB/gee6bhNrqkrxb+x
 leAKX92jcZrMdOJ4qmPJxbrrUJODD5ut3T8F8Qqjp23+HwgV9WSoi8xRbyGqsEebXbJHZPS
 2MBQ2y5mOiPbPi1LA2CcryrR8Rb6OPZ9Lu5CSv2jvlEeU1mxUBA/yFm/wsk2w5MhUV5UGG4
 RQuYw9EzMtBN9bobzmKcg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W2ZnxVVhZDg=;w387Z1tF5rYb0phwWMi8lZcK+3P
 PIWgm9KzVXoXEFAUHiNq6vBYaZ2bAjnIn8EuDlWP1N5RCa9WyCza24fR0ozkW9mh1yWaUOewH
 0Gfhuxy2Ws6eSNOgNTYTYmwf2hyZAjyoAA6a1tmzJ4j+hr/eOm3BMTLwwNfpx5xKJokktT8nW
 pLNYyggFVm4pk6rwvk9UawjxpxLB5Kl1tqaFF7gJwTNvDFSdh6ONKr2hSfwxxr+L1rVbu/C+A
 /TGwBFyib0eu6Iy7EvYO+F/It22u++odE+JQEHCuS628NXdIBZ94rs6dExM1k4jWq1sJfYur/
 TdgiK4Y2GiuTcaHexruX/Mi43DrGEQWG5f+/viHqOTCNdXKOPAjTQfiQwDSQuXi+8v9FVaO0X
 vBMG25i2WjdqAblsKuxSgYqAMJwTAeKOf3jEEkttC8RX+0rcYeVr/YSZbb9KizDg18Dq01cRL
 zrcByv5rP7AqCS39Lmz7iOzVHEiX3ruw6PH8RuCAjQIfvAggj+qpBMxSrkntNLABIo8S5TRiy
 SjpCerc/RF8SS11b8zXBLdyvGORV6+/NbmlUf+zxYfQDpx4VL8c5+c2810aVsxuBJxSMtr307
 r8B7t8n2nuA5RzMU7UkBTs7Vry1itNs4S5La5x0JIxj17x+Yc3J2vDwMZky/kp92NRKlFu6vb
 13m55td1P5zXLeVOh2OOKt56bz0WZpa2PGBerUs4CS/TSc4T4EnhVYAF4+IgELBZ7lCs77kq6
 SoFMDOo8NvHsEmbXcjJL8DpSkNazScI7c9NrDzn31acbfuaszFUyQuG0YQPex1UTYF4D12Eyj
 joOsY18eFWyoO/VQc8VhWEU8xTXfJXInhchbNgQQQ7n+gCArkdK81LgjX2kRrQYcMTw50J7na
 Qtn9oK6SUOkH7loT6EhOSn93genkYH4LYqIjNvpf1NF8LnaWKysE0bjqR/gUssi9kikC9YrNq
 LCV8PrFHHyRbZOQuD0L6lnufQ9OtxBfr2pOvJr1Yvq+Z6ID568uX9v/lth0H+Cc9d8OCA41Yp
 TywVJCbnRL31Y9PqifeAUMf9qXceHUFVD/tt6BZDTi6tI3ZJ70xwBTO9pjfgXuEqFq6s68Csb
 kdp08irtoqtEuLrIri7o0FlCPZMHA/

Am 16.12.24 um 20:42 schrieb Joshua Grisham:

> Den s=C3=B6n 15 dec. 2024 kl 18:16 skrev Joshua Grisham <josh@joshuagris=
ham.com>:
>>>> +static int charge_control_end_threshold_acpi_set(struct samsung_gala=
xybook *galaxybook,
>>>> +                                              const u8 value)
>>> While certainly not forbidden, using const on plain integer types is n=
ot
>>> extremely useful. In fact, if it wouldn't be const, you could do the 1=
00
>>> -> 0 mapping for it separately and not do it twice below.
>>>
>>> [...]
>>>
>>> Put comment on line before it so it's easier to read.
>>>
>>> "off" -> "no threshold" ?
>>>
>>> [...]
>> Good idea, now I have handled this in the v2 of the patch as follows:
>>
>> if (value > 100)
>>          return -EINVAL;
>> /* if setting to 100, should be set to 0 (no threshold) */
>> if (value =3D=3D 100)
>>          value =3D 0;
>>
>> Does this make sense now or do you see anything that should be adjusted=
 here?
>>
>>> Do you want to differentiate 0 from 0? Should this function actually
>>> return -EINVAL if somebody attempts to set 0 threshold?
>>>
>> And regarding this, the device requires that you send 0 to represent
>> that the feature is "turned off", so to speak (no threshold is enabled
>> and the battery will charge all the way to 100%). So yes, in my mind,
>> we want to send 0 to the device if you are attempting to set either 0
>> or 100. Also I seem to recall that I tried to dig into how this is
>> handled in upower and the coming features in GNOME, and have a vague
>> memory that I saw somewhere in there that they were also converting
>> 100 to a 0, but now I am having a bit of trouble finding this again.
>> Do you know if it would be better to have this driver provide an
>> interface where "100" means "no threshold" and that it should be
>> translated within the driver (that samsung_galaxybook sends a 0 to the
>> ACPI in case the user has requested "100" ?) or is it better if "0"
>> means "no threshold/charge to 100%" (or both?)?
>>
>> I can also do some testing with the device to see if it accepts the
>> value 100 anyway, and how it behaves, though I would be a little
>> concerned with this longer term as it is not how the driver and
>> settings applications work in Windows (they are hard-coded with a
>> toggle and it always sets either 0 (off) or 80 (on)), and I could see
>> where even if it works today, sending the value of 100 to mean "off"
>> could be altered by potential BIOS updates?
>>
> Just wanted to follow up on one thing here -- I tested a bit more with
> the device and how it handles trying to set 100 vs 0. Basically, if
> you just directly call the ACPI method and set the value 100, the
> device actually changes it to 0 and stores it as 0 anyway. The next
> fetch of the sysfs show attribute it will return 0 (so basically the
> device itself behaves exactly the same as the current logic in the
> driver).
>
> So the question is, how should this behave as regards to a "standard
> interface" for battery charge_control_end_threshold ? Should it prefer
> to report 100 or 0 if there is "no threshold" ?  And if it should
> prefer 100, should this driver handle the translation of 0 =3D> 100 =3D>=
 0
> ? (i.e. users set the value to 100 but the driver sends 0 to the
> device, and when the device reports 0, the driver reports 100)
>
> Thank you again!
>
> Best regards,
> Joshua

I think in this case the driver should transparently handle the 100 -> 0 t=
ranslation
and report 100 if there is no threshold.

Thanks,
Armin Wolf

>>> [...]
