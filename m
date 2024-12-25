Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D2484A3E;
	Wed, 25 Dec 2024 20:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735158370; cv=none; b=DGsfnV1woYTLbLJXlKw80u2E5Xrz71/YJyYfHPAUc45Z2da4AKsUmZQELOmIpxQpfmNdTZXwSWRH/qlvxIsHCww4uHDSwbkcsTliGEsgUdcrGgMegx1cBul7dR5SbztXDgLDfEUYZMKeZXSosnx8+VrMGUhjbj0uODBCxtzqdCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735158370; c=relaxed/simple;
	bh=axx17N0yHN+AV6614PCCPcLavSF89yUU1z0q+u0kSjQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WpnyZPg8Itt7szuylUSoHmHXhn4NYQcM2c7wb2MGTbkg+2PlCjHooRM3/yuyf1xPQX4xQb4xwnrqX+bKhitPZmAiuOpaqQDMSi5soKuyXOcx8jOJDFENykrgqLoR2pq2oM69oSFCIMjmj3PUOr3XCOCZrQXN2f3/GQ3OayWJeQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fxAZbQJI; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fxAZbQJI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735158338; x=1735763138; i=w_armin@gmx.de;
	bh=axx17N0yHN+AV6614PCCPcLavSF89yUU1z0q+u0kSjQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fxAZbQJIIl5JTFWONlp2LzuMVnGWssI+FZNIZ6hE6Kdo8BuzF+tuKt5hkLS++Z+7
	 /Fbiu60givOpaG86xFJ6FbH7bCF/i+V/0ysKSbBoJOtRfEGv+ZB82FgoWket5N+Jk
	 la4TJz7pOxSiMlhaOlH1StHuGxtXDIceAQoFNAODx9MgUk2CFA5Vj5WPcZ9l8dumj
	 wD2h8DjlL4b83iiPpng8OMNk4P7GDmgPKxHnECk0N3Bue0P4eMA3CYUnBkUxZTRGc
	 kgR0fVYQi6e3TZ9KS3Y5jD5a3DIWpSeQ5rLvzrJ/7xMczHSZMgHTuCPsy41MSZxip
	 aDlliMswghda16xRIw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([91.137.126.34]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M42nY-1tQXwo0OVU-001QrL; Wed, 25
 Dec 2024 21:25:38 +0100
Message-ID: <d2251554-593e-4830-895a-d4c0317589a0@gmx.de>
Date: Wed, 25 Dec 2024 21:25:35 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] alienware-wmi driver rework
From: Armin Wolf <W_Armin@gmx.de>
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <66005d6f-e47e-4799-b90e-48751bff52fc@gmx.de>
Content-Language: en-US
In-Reply-To: <66005d6f-e47e-4799-b90e-48751bff52fc@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x9OFwudnF9jjhCZvJYHCCRgmXCRcMHXAF43JNmocjOACESvBYTa
 5aTbaPoKRmj6dbNVc4eFFazW37V4GRghtmQjf8p7Qsmguh1CpUSiWqHiiQKyEaCa1OkvXX+
 g4KyyAEQsUbnwc/7qdxZYbnvzlQ83RhOGFrKGcsK21HdQnV+f1IFWeEceKPSHL+vUk+ZeRe
 x86r4sar4UPcSND6hhIhw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/lj9zXglF50=;BkAInbuFpi9vc10+UL2+QhouGTg
 Hm4Eyh6epPWALdLxglsyevlfAWNfXgUP4ceYFUr0pEize6TTufW7S0pYeCkxXS6qKCRYYcXBw
 MnUwdKD0qVOT+3fzU+HHhS/lM2zX5rYTOWcifQYiqHhOY1e/V0l5Og0hRD4geqQsW2R20ubGd
 9LtZzadEWwgQlG3BCNufYl2fFtXJ3avQed6RUQ+arXyQZUFgS/dIKJ004ANjROm6qWmNTSJME
 2qxF+Uch8voPKmQbaicCsG1Reh56vSyepC6ZA2ObEGTaugEQ0yy/Gq3YjmWSXUO+d7WFejYsD
 gz8Pq9DyUDpOzK7R2HgV18Q+wYEgXp7/ZGnbs4AV4bB/ATqLCnGuTO6TGYgxs9DJYT/DHle5E
 hcUHQ7LwLOcUjVVMzy989VEbWxu0xfhp+XPIGHDWz67Hz+1tPnpfjJe3ctXqnjIeqrhAR3z7b
 MiKnfHb5fcVHI9/mAxA7N1vhOSztnYqOgJc5nps7yCLqiBWf+dfGZm7A5ydK7GeGiJwW+5Ulk
 MmRvvFEynA9wT8B0GZkbXjukL1AGE4ovvsGdc5v2vlmNyNb5glF7fRQnGVhHE5KWLzNhzdfz+
 Pj9lxG1Z+rD7ZNfzEW/H1c3d1Idfr0TP0kYaC/h3MGy3ZZUKzbmucio2mceJi/8/Y1VcqZLyJ
 ULH0jGQqpr7rBFlRHW/FLKbYkX/7DMLPMGp7bmRmDkk3nj3EyRERadSkb+VaT0NW4SV+nmyDa
 xxzvhAqshsf7WoavewncG1XQW+koBKH+qQng89Gq0GlJmU+gc3gHip28w2xqLi59q7Cc+qdj4
 eMSyZI8NN0EjKXNifheNXQiQhzyniH7ADlIN+cTBR9LHJHsM2vFPFFYOQ5sbe03ocsPEVJ9ts
 ND2SlQxHww27KsRKYBOEVYa6h6vGLmPjp0dSDJmkNQv6AYq+PwVO0mGgzOz3+N3uYEfIRRTZe
 9UnXdfSKtK9o7Hk2QpMRm5vyQUeDo5af3kZJ3XUpjDh031yl0+ylZF9WIAU5ZSB54wwDgytY2
 jEuuJH9oILO7kaxfBrpl0yDIAi7uKRERappmefiYRiz9HgmRfuur1v8LzPCFfv/XjhDYY+pAQ
 SXhVjVM76ZMy8D7/JVe0ZBXNKSYeIe

Am 23.12.24 um 00:06 schrieb Armin Wolf:

> Am 21.12.24 um 06:58 schrieb Kurt Borja:
>
>> Hi :)
>>
>> Hopefully these series are quite complete now. Your feedback is much
>> appreciated!
>>
>> Previous discussions:
>>
>> [1]
>> https://lore.kernel.org/platform-driver-x86/6m66cuivkzhcsvpjv4nunjyddqh=
r42bmjdhptu4bqm6rm7fvxf@qjwove4hg6gb/
>> [2]
>> https://lore.kernel.org/platform-driver-x86/20241205002733.2183537-3-ku=
urtb@gmail.com/
>>
>> Comments
>> =3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Patches 14 and 20 are proposals. Feel free to NACK them.
>>
>> ~ Kurt
>
> Nice work, i will take a close look at those patches tomorrow.
>
> Thanks,
> Armin Wolf
>
It seems that i overestimated my time schedule during the Christmas holida=
ys, sorry.
I will try to review those patches till new year.

Thanks,
Armin Wolf

>>
>> ---
>> Changes since RFC:
>> =C2=A0 - Incorporated comments from Ilpo which include style and organi=
zation
>> =C2=A0=C2=A0=C2=A0 issues
>> =C2=A0 - Instead of splitting functionallity blocks, split WMI drivers
>> (Due to
>> =C2=A0=C2=A0=C2=A0 Armin's comments)
>> =C2=A0 - Replaced most of the patches near the end because of the above
>> change
>> =C2=A0 - Some patches were squashed into eachother where it made sense
>> =C2=A0 - Rebased on top of recent platform_profile changes!
>>
>> Kurt Borja (20):
>> =C2=A0=C2=A0 alienware-wmi: Remove unnecessary check at module exit
>> =C2=A0=C2=A0 alienware-wmi: Move Lighting Control State
>> =C2=A0=C2=A0 alienware-wmi: Modify parse_rgb() signature
>> =C2=A0=C2=A0 alienware-wmi: Improve hdmi_mux, amplifier and deepslp gro=
up creation
>> =C2=A0=C2=A0 alienware-wmi: Improve rgb-zones group creation
>> =C2=A0=C2=A0 alienware_wmi: Clean variable declaration in thermal metho=
ds
>> =C2=A0=C2=A0 alienware-wmi: Add a state container for LED control featu=
re
>> =C2=A0=C2=A0 alienware-wmi: Add WMI Drivers
>> =C2=A0=C2=A0 alienware-wmi: Add a state container for thermal control m=
ethods
>> =C2=A0=C2=A0 alienware-wmi: Refactor LED control methods
>> =C2=A0=C2=A0 alienware-wmi: Refactor hdmi, amplifier, deepslp methods
>> =C2=A0=C2=A0 alienware-wmi: Refactor thermal control methods
>> =C2=A0=C2=A0 alienware-wmi: Split DMI table
>> =C2=A0=C2=A0 MAINTAINERS: Update ALIENWARE WMI DRIVER entry
>> =C2=A0=C2=A0 platform/x86: Rename alienware-wmi.c
>> =C2=A0=C2=A0 platform/x86: Add alienware-wmi.h
>> =C2=A0=C2=A0 platform-x86: Split the alienware-wmi driver
>> =C2=A0=C2=A0 platform/x86: dell: Modify Makefile alignment
>> =C2=A0=C2=A0 platform/x86: Update alienware-wmi config entries
>> =C2=A0=C2=A0 alienware-wmi: Update header and module information
>>
>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 4 +-
>> =C2=A0 drivers/platform/x86/dell/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 30 +-
>> =C2=A0 drivers/platform/x86/dell/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 45 +-
>> =C2=A0 .../platform/x86/dell/alienware-wmi-base.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 721 ++++++++++
>> =C2=A0 .../platform/x86/dell/alienware-wmi-legacy.c=C2=A0 |=C2=A0=C2=A0=
 89 ++
>> =C2=A0 .../platform/x86/dell/alienware-wmi-wmax.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 526 +++++++
>> =C2=A0 drivers/platform/x86/dell/alienware-wmi.c=C2=A0=C2=A0=C2=A0=C2=
=A0 | 1269 -----------------
>> =C2=A0 drivers/platform/x86/dell/alienware-wmi.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 103 ++
>> =C2=A0 8 files changed, 1491 insertions(+), 1296 deletions(-)
>> =C2=A0 create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.=
c
>> =C2=A0 create mode 100644 drivers/platform/x86/dell/alienware-wmi-legac=
y.c
>> =C2=A0 create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.=
c
>> =C2=A0 delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
>> =C2=A0 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
>>
>
