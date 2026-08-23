Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB5E1A6836
	for <platform-driver-x86@vger.kernel.org>; Sun, 23 Aug 2026 20:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787515708; cv=none; b=BCZNVfNvnY1YxzEmol32Nlvyvie5jFjqmDTLmphxArAhUodupXsHvu4MexJo7pEg+DHuHIbXzpbKjR4O/PSFVa+M2wQkY5yS40w+SA5Y6XlagHkdUiCc3/dtzr8EmESbyaV80MHcRN6s8XmjvlJBB7ZQwieYWqCjXcAXiv+oQwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787515708; c=relaxed/simple;
	bh=2s9LA7iEwnjD3DFH7HLrdnUw/V6rCflx+nUCAaQvnI4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=bzd+GOsO4G+vxq549jnTdFP4+d+dWga4A+m0b9a0ekykWsKyo/TvhDRGPFHTZRZqFfUMHvE2AKrWwCTe/OYdBB0Fs+slw98ySA0sFY0NK/WYZm1jywxZfgWRVK9AfgLiE4khWM0oy7A3fnLeYNoxUyuKyTFjPsvck3pZwz9kIyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDrpG225; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDrpG225"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d0407aedd6so29390925ad.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 23 Aug 2026 13:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787515707; x=1788120507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fMqN60KI9BnBA8fTGiERNzT5eYmN/FWgZ1xD7xZZJGM=;
        b=tDrpG225TTEDJfwouhqepmmT2mrkBHeja6GIaGKkPIu1Rks24m+1blpsE+XcKl9hkz
         V2FsPb9+/5V356GsShTjRvkyvDtehwkh3Da0qxr57stAgOAkSyagVymQziLjpVJXWptL
         Cd7iSe2sidBMUFR0xLNuVfBv6eLqhMQGSMwoDUi/ruT/0HHFrWAbQOrDrBge4HQV2w3w
         BZhUy7gvo52xURdnZ9eM+XIZxcHSE96Ch7Un0ljdGeWZQ5+aMKVcXc6G1Q0kcwA3ycpI
         ToM5D155qngWGfuqkH9CIDa9ga6jke+LM5hA8vyo9fegMUXTlyU8vtqsL+lw1RdR5WFV
         5Zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787515707; x=1788120507;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fMqN60KI9BnBA8fTGiERNzT5eYmN/FWgZ1xD7xZZJGM=;
        b=snC2Wmx0mvnLcvG9xWhXMNDMPvDg4hWnOGQsTHA92OeVPgjkHlJybZUr9CgfXxHvWT
         NaFan8zoyx059nMGFDWKO4Yi2xVq0yLrLUoCTipoorfVOUpJhqMjmu3Jo4NvXM7ZvY1i
         33iu1Er3iVOZxZ2LaX+OW6IC3iAxBw7nJZr17KU1YqU0+l5l8D/vR2IGgpi+W1wHfq5p
         J2SRi869ic+ovYK2IQ8/TjX7EkGkHlho6jMq9s07Lrn58Fv/UeJV5PUOu94IXoKMtQLm
         K/3WHajQfyflmLME4/fqrH9ljeSTQjMiqjgjb8hzJ5XMWIRvr3LnvSqpZO5UozZ0ocp4
         ZgWw==
X-Forwarded-Encrypted: i=1; AHgh+RqOjoBpQioePDoitykJVu/PCgMLQxfRU1DOPSlGxtgeJlhCQ2jARjTB7Fk17Qku3LG5onNQf2sbOg0KhO9oN6gGHSrm@vger.kernel.org
X-Gm-Message-State: AFuF++nqXj/RPXkL/3hsObuyTo1suFwF6Z1xVLfKbMt0BwoW+kBMC79T
	vy8av/48PYmgxYFEqepAvsi2wr3ryKNC3bDkw1vaiz7camaQfzEvHh209ALhQQ==
X-Gm-Gg: AR+sD114kXMLNKXTenSZLWb4WaKjx7BT5fjDupYZItM+I4jS/tsR4v00iDGMJnkAk6g
	rcKZ+tgEd2f202E6Bkx2Fizz5t4JZZ3mR1R0OrQpOkUeANoty2BT20jp9DOaKEdAoW0ZxFRGvrF
	zQ257acWLHX0ZI/G/w6DzGpH/+Oo3A6eRokm59K3K0eRpu5GZuZTeEtZanRjGzQkXgIkeec7s2/
	hTk/bCqZjnOVGkbP3JVEqMMbzEXS91qnHYlOg63tjZxgQaw0vVTvUVPXy6eOYTon/RAZ+r2d5UN
	gRDEmo7E+wt/RUnNv/j+lZwdVpd9DDnqPq3jzw22tfOG5STxQ2S+Z4C14CrgSX784MpTAXEIr5M
	yD6X3y2w6lnFz+H5GDGiJlx6MULKQcRnIRTesk1ewO2J7zMXnduZLKJ5N9CNzQj8bvRr2+289vH
	as9Urzr/HDv0HJDpl+NZfRNRCqqtMbMYSY9GE4y5vmC6sgIoqVpuXn/0ThNDG3CXYrwq1nJq0Ym
	K8JzVno9/1ZIP5pPekEZhlTdWMXzu+UIw+7dBZHMSIS/bKnOTn9g6ZUJQA=
X-Received: by 2002:a17:902:ce0b:b0:2d5:ccb7:12c3 with SMTP id d9443c01a7336-2d670b83673mr260321625ad.2.1787515707014;
        Sun, 23 Aug 2026 13:08:27 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3280af94751sm8788226eec.26.2026.08.23.13.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 13:08:26 -0700 (PDT)
Date: Sun, 23 Aug 2026 13:08:25 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Aditya Dash <mradityadash@gmail.com>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
CC: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] platform/x86: lenovo: Add Legion Go fan controls
User-Agent: Thunderbird for Android
In-Reply-To: <3dca1e1efa285d8644b8ac681a5fb41742ce06a6.camel@rong.moe>
References: <20260821214728.87773-1-mradityadash@gmail.com> <3dca1e1efa285d8644b8ac681a5fb41742ce06a6.camel@rong.moe>
Message-ID: <782FE636-A06A-4E12-9563-786374805947@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 23, 2026 12:32:02 PM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Aditya,
>
>On Sat, 2026-08-22 at 03:17 +0530, Aditya Dash wrote:
>> Capability Data does not cover all fan controls on the Legion Go=2E Ful=
l
>> Speed uses a separate Other Mode feature, some firmware exposes an RPM
>> reading that Capability Data does not advertise,=C2=A0
>>=20
>
>"does not advertise"
>
>Really? Please dump capdata via debugfs and attach it=2E
>
>> and the custom fan table
>> uses a separate Fan Method WMI interface=2E
>>=20
>
>The hwmon part of lenovo-wmi-other was done by me=2E Please CC me in your
>next revision=2E
>
Hi Rong,

I'd ack if you wanted to add yourself as a maintainer of the Lenovo driver=
s so you get picked up by the kernel scripts=2E Otherwise people won't know=
 to Cc you=2E

>> Patches 1 and 2 add Full Speed and the RPM fallback to the existing HWM=
ON
>> device=2E Patch 3 adds a Fan Method driver and attaches the ten curve p=
oints
>> to that device when both WMI interfaces belong to the same provider=2E =
Other
>> Mode continues to work without Fan Method=2E
>>=20
>> The open question is how the firmware control range should map to HWMON=
=2E
>> On the tested Legion Go 8APU1, values from 0 through 115 produce the
>> observable fan response and correspond to Lenovo's 0 through 115 percen=
t
>> range=2E Lenovo software shows 0 through 100 percent to the user, and 1=
15
>> reaches the RPM observed in Full Speed mode=2E Firmware accepts values
>> through 255, but no RPM increase was observed above 115=2E
>
>This is what we've observed in Fan Test Data=2E We chose to enforce
>constraints according to it and relax it when users set an module
>parameter=2E
>
>>=20
>> This series keeps the native values unchanged and exposes the fixed
>> temperatures as read-only automatic points=2E Should the driver map the
>> effective 0 through 115 range to the standard HWMON 0 through 255 scale=
,
>> or keep the native firmware values unchanged?
>
>In your case, if there is no range data to query, I'd prefer enforcing 0-
>100 by default and relaxing it=C2=A0when appropriate range data is provid=
ed by
>module parameters or DMI table=2E
>
>The range should always map to hwmon pwm 0-255=2E

Concur on both counts=2E

>As far as I can recall, Derek once said that he planed to introduce fan
>curve support for Legion Go, so I think he has some helpful ideas=2E

I'll post a full review once I've had time to test and review the document=
ation again=2E

Cheers,
Derek

>Thanks,
>Rong
>
>>=20
>> Aditya Dash (3):
>>   platform/x86: lenovo-wmi-other: Add Legion Go Full Speed control
>>   platform/x86: lenovo-wmi-other: Add Legion Go fan RPM fallback
>>   platform/x86: lenovo: Add Legion Go Fan Method curve driver
>>=20
>>  =2E=2E=2E/wmi/devices/lenovo-wmi-fan-method=2Erst     |  34 ++
>>  =2E=2E=2E/wmi/devices/lenovo-wmi-other=2Erst          |  14 +
>>  MAINTAINERS                                   |   1 +
>>  drivers/platform/x86/lenovo/Kconfig           |  11 +
>>  drivers/platform/x86/lenovo/Makefile          |   1 +
>>  drivers/platform/x86/lenovo/wmi-fan-method=2Ec  | 380 ++++++++++++++++=
++
>>  drivers/platform/x86/lenovo/wmi-other=2Ec       | 215 +++++++++-
>>  7 files changed, 649 insertions(+), 7 deletions(-)
>>  create mode 100644 Documentation/wmi/devices/lenovo-wmi-fan-method=2Er=
st
>>  create mode 100644 drivers/platform/x86/lenovo/wmi-fan-method=2Ec
>>=20
>>=20
>> base-commit: aca39607c1734ed976fdd65deb75b3555a5a0326

