Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D48E37B007
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778528882; cv=none; b=QaIL35b6gXimuXHhXTg/0f5VLgg8oZYE4gjCV5pnbW625wUH+fQ9jVUdz5Nam/eyVW3ae4XRICEWIUk3K34pYvHKfDAc/olQ6Qu4zlVAP0bpPCCrvMrSPLZW9ALQgTru5FE51hJCXNDxvDCUF7rG7UrRvtjiMqVKeAgIw5IKeAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778528882; c=relaxed/simple;
	bh=WuseucOiLV4JmkHY1adFdEuhwis+oc2fPKN0ITIZvHo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=dctfwnzPl/0cPj0cfbbIfd1nzpqGL4JvxIDtI8nlJ171GO9nmIzNan/x+8QkQx8vMVqOn6s34eRhyPYaVZkWXKvz7jqKg1PK2zr58FZhNtwfFlItu1KSRIxJnlHF3RDAleFmUXxUJCiRi4YIEnMs4Vj9bV+IwneAr3uhC8HsRLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ht7djv0K; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ht7djv0K"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c8ccc7755so6615724c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778528880; x=1779133680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WuseucOiLV4JmkHY1adFdEuhwis+oc2fPKN0ITIZvHo=;
        b=ht7djv0KZMbIEdoMtfjHDSX2qlv86MZ7J+LtnYgKcHvtGOne9n0sXkt9kWzBIJax34
         a4KTpPNEEzIBHTHQGsok1QxTQk8VtSB27x9zlPP9B0JJpPBVKIZOu3qb9Y0+6SEebMxI
         SnQqTRs5yZi1EEe3cKrS5DsEeZLcIYQkvB+KcgVFHl3ZtA1UpsC4GS/tbwMjn60S2oXP
         RCMfr7U9X7sAeTGUzVvzknKSdWoauJCRCgIr8RpwTDI1jLNhBF07rqx2lX9CmtIgJBFo
         44U3F0+d615BdK/vWPF2zbIfh645jBUbg5ACe3TBOU55xNgAu/Ge39P2do+hU5qaBgYd
         wbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778528880; x=1779133680;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WuseucOiLV4JmkHY1adFdEuhwis+oc2fPKN0ITIZvHo=;
        b=pVMbEIkv6gQ+OuFuBUI5m/kQ24ZMR2IFfZt1p3/XQmfkjqQc5bdq0TAXtf9dYgIq6v
         Z57A+WGd8r85ag65TJrm56JJQhkCn9Zb5j7mQ3qcSuCKV3V8jgLixjerHQOvZ5vqLP8h
         xW1r1ogyeFGVGVVLcWEStzpuwDQ1QAQTkb4A78TwkVQVXPyO4x/OdZt0XzpHkQPUrVvZ
         aMDMaR73v1jwXMXFWvHiIntEBLiCvoMImOs/0RmR1Gqslz9+vSgcRYZfWFDqlTesr/jc
         LiSzhirbycU5rznWO/knzUbN+iginJa79WoVHSeVHg0NUEh2EoEwHbZYMGclbfNyli1s
         +yqg==
X-Forwarded-Encrypted: i=1; AFNElJ/IspyiNDPQLRkp3hJsNh5NMB9w2uTG2VZeNqrYmtzxJXXTPP5XSI99eD3lQOtJvwoJm2WqJaey6acl17rjgVI1RrCO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk3EQi6PYK8qL3A+qEUxZ7q41AIsXWJCEmBU0Ke3YWcsnqSprk
	2qWNWanFQ1xz/R2uYNXFR16czE89qz8fnhO9dY/+eRAaqOjTuunCUX7V
X-Gm-Gg: Acq92OEx2loqvNcvvlajer8sZ6x1SJ1HErc5Z2A2QPhv3q2tfuAzg3Uiv6/iqYIPfoE
	8oX8auRFS5Ec65gVIwWJyBb29CZu3OEBGUxkDBxi0GnkfjRXmDi9GOAEvSvTQwsTXkq6j0OVRDK
	FFzsEXoR5pmaIPL10keGjtinlqD5ODDXsX3sMqRlnrVVEpaycCqaiEMMAKOlcCHFXCexDeCpMwJ
	RxFmmgpyzUwcQUH0EkHg2BR41ni4xLWia4bUsAfy8BqwjlSRVnGJW0cvW3gl/44zcf3ydluxu27
	KMOEZrI1oQQS5R+nvORuZqgPUI/7sVv94r0sk+qmkcn/m/hwcM169Pp7vKOfUWh7eswrfqHLKlg
	CXpK8e4jAzm7oLTq3hBuRQL1/G6k4/l/UKnjfWI7actuDFjVKUFejxj5DmT3WsGBK9RrL+DHSqR
	L/ADuWwp650Kj6YlShrYmUtvWDM7OwpHY5quQ5mCKtsCy05FVdcLjF0pXsI9ob2UnJxZPcrf4Kc
	/mU+1Kmu8oSHHP52s7mlA==
X-Received: by 2002:a05:7300:6da4:b0:2ef:8b72:1b9 with SMTP id 5a478bee46e88-2fb3ce0965dmr5248152eec.0.1778528879993;
        Mon, 11 May 2026 12:47:59 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm17449456eec.10.2026.05.11.12.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 12:47:59 -0700 (PDT)
Date: Mon, 11 May 2026 12:48:01 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Rong Zhang <i@rong.moe>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v9_14/16=5D_platform/x86=3A_lenovo-?=
 =?US-ASCII?Q?wmi-other=3A_Add_WMI_battery_charge_limiting?=
User-Agent: Thunderbird for Android
In-Reply-To: <5389eb37-61db-4c9a-b8cc-7d605ac7a4f4@kernel.org>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com> <20260411162334.25682-15-derekjohn.clark@gmail.com> <09d21c9cee8af49fa1d5b568358db0c347668ee9.camel@collabora.com> <5389eb37-61db-4c9a-b8cc-7d605ac7a4f4@kernel.org>
Message-ID: <41D66996-DE34-4162-B91D-66CE326EF927@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 11, 2026 11:48:44 AM PDT, Hans de Goede <hansg@kernel=2Eorg> wrote:
>Hi Nicolas,
>
>On 24-Apr-26 14:50, N=C3=ADcolas F=2E R=2E A=2E Prado wrote:
>> On Sat, 2026-04-11 at 16:23 +0000, Derek J=2E Clark wrote:
>>> Add charge-type power supply extension for devices that support WMI
>>> based
>>> charge enable/disable=2E
>>>
>>> Lenovo Legion devices that implement WMI function and capdata ID
>>> 0x03010001 in their BIOS are able to enable or disable charging at
>>> 80%
>>> through the lenovo-wmi-other interface=2E Add a charge_type power
>>> supply
>>> extension to expose this capability to the sysfs=2E
>>=20
>> Hi,
>>=20
>> this is not the right uAPI to expose this capability=2E
>>=20
>> If you check the ABI description for
>> /sys/class/power_supply/<supply_name>/charge_type [1], it mentions
>> "rate" and if you check the corresponding enum definition [2] it
>> mentions "speed", so the charge_type uAPI is very clearly meant to
>> expose the the charge rate/speed/current currently configured, with
>> Long Life specifically meaning a reduced charge rate, rather than
>> reduced charge capacity=2E
>
>As discussed here:
>
>https://lore=2Ekernel=2Eorg/linux-pm/49993a42-aa91-46bf-acef-4a089db4c2db=
@redhat=2Ecom/
>https://lore=2Ekernel=2Eorg/platform-driver-x86/20241209204051=2E8786-1-h=
degoede@redhat=2Ecom/
>
>and also here:
>
>https://vdwaa=2Enl/charge-types-api-upower=2Ehtml
>
>The use of charge_type[s] for this is intentional and is exactly
>the right uAPI to use in this case (especially see the first link)=2E
>
>> The uAPI you're looking for here is
>> /sys/class/power_supply/<supply_name>/charge_control_end_threshold [3],
>> which very explicitly exposes the charge threshold in percentage=2E You
>> can then accept only 100 or 80 as valid values and configure your
>> hardware accordingly=2E Unfortunately there's currently no way for
>> userspace to know that these are the only valid values (which is
>> something that I want to look into implementing soon), it can only read
>> back to see if what it wrote was accepted, but it's still the best uAPI
>> for this=2E
>
>charge_control_end_threshold only makes sense when the firmware API
>actually allows controlling the % of charge at which point the charger
>will stop charging the battery=2E
>
>In many cases there only is an option to prolong battery longevity
>aka "long life" by not charging to 100% but the exact % of charge
>at which to stop charging is not configurable=2E This is exactly
>the case for which we've decided to use a charge_type of "long life"
>and upower has also implemented support for this=2E
>

Hi Hans,

This is good information=2E Since there was understandable confusion from =
the way the documentation reads, I think taking another look at it to clari=
fy this would help avoid churn back and forth in the future=2E Specifically=
, for charge_types:

>Long Life: The charger reduces its charging rate in order to prolong the =
battery health=2E

Should probably read something more like:

> Long Life: The charger firmware reduces its charging rate and/or maximum=
 charging percentage to a hardware specified fixed limit in order to prolon=
g the battery health=2E

And for charge_control_end_threshold:

> Represents a battery percentage level, above which charging will stop=2E=
 Not all hardware is capable of setting this to an arbitrary percentage=2E =
Drivers will round written values to the nearest supported value=2E Reading=
 back the value will show the actual threshold set by the driver=2E

Should probably read more like:

> Represents a battery percentage level, above which charging will stop=2E=
 Not all hardware is capable of setting this to any arbitrary value, instea=
d providing different minimum, maximum, or step values=2E Drivers will roun=
d written values to the nearest supported value=2E Reading back the value w=
ill show the actual threshold set by the driver=2E For hardware that only s=
upports a single fixed value, use charge_types instead=2E

Ilpo,

If you want to drop v12 from fixes I can submit a v13 fairly quickly to ad=
dress this=2E I'll also address Rong's latest questions/comments when I do =
that=2E If you'd rather we go another route then please let me know soon=2E=
 I think we'd all like to put this series to bed=2E

Thanks,
Derek

>> I see that there have been 2 commits merged last year that make the
>> exact same misuse of the uAPI, which probably contributed to the
>> confusion here, but the ship has sailed for those=2E=20
>
>Those commits are working as designed and a 3th one is actually
>in the making doing the same thing:
>
>https://lore=2Ekernel=2Eorg/linux-pm/49993a42-aa91-46bf-acef-4a089db4c2db=
@redhat=2Ecom/
>
>Regards,
>
>Hans
>
>

