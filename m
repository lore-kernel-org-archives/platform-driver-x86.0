Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CE63090F5;
	Tue, 18 Nov 2025 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763473359; cv=none; b=dhf+96RnR7fMnAiuUjzG6JQvhr9BT7d5UcmxYww8IiKo2/OWTC5MSBhWjDKAnX2GohUn8G5M+pCNv2yN8dP0vh/5bWDyYFCqH+UgQQhx5NqipegWjTBIRs3z6Wu7paPuJ6Er+S3oDU7ELt9+kcqfeAROIzcnWB9zzHNWz3MQXc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763473359; c=relaxed/simple;
	bh=2nJk83KGJkFQXLxzsnLyWjB8lqjw8O0IS7xlyMtRYR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M47AozAKd9nafs2GWoULKBCt8oNZ7eiitIWKf323P2+CY8mohGoC/hzQFzaz/DlFZ/igQ537bO81gKTjEjSnKl1G1GOeepJAf3p36LVr6h8lEk6fZuIg599VUDV73LaGFgcPMQIRWyQxipZZlbuGVZ1m2N+baU2PhZ0f+M5CeYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=uJEZppfR; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="uJEZppfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763473333; x=1764078133; i=w_armin@gmx.de;
	bh=2nJk83KGJkFQXLxzsnLyWjB8lqjw8O0IS7xlyMtRYR0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uJEZppfRCcb59rMgSaV+l5Rde8GStWgS8YkrtG9HcxSGKvpvSCPkRlI0Rty2kPKn
	 qRfwtf/qDqxwrkVNyYEREw+niNOGQqIZQcx5TjCI2PLKOjRQXPAjWMkiE+ocM6qxF
	 90IRTpREQ0MLioqfNVvDsGWZ1DO2wfzomxFl0rTzbQsCg8YKDX0W7v174PDK92Ep/
	 bQNOetLY8e632ZO/AF2FMehYAc9aW2G0yg8EK9v0AUyU0yVGPDD8PUC5K3+0aNVqi
	 0F68ECg0CpVm5C/LYvtQLncswqDqB5td0OarN9FzsLa14S24yggSd8aI5xT1USU+r
	 edU1l1ILSxmEeE8eXA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.23.146] ([141.76.8.178]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MysRk-1w8Lih2iwc-00sIQV; Tue, 18
 Nov 2025 14:42:13 +0100
Message-ID: <c6c423da-e640-40ff-a35c-8e2493e4d631@gmx.de>
Date: Tue, 18 Nov 2025 14:42:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Start of Upstream Support for TUXEDO NB02 devices
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <1ce9d218-d5cd-4821-b224-b52e314b7027@gmx.de>
 <a2ad4642-cc69-419e-b599-d8f7a2e8097e@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <a2ad4642-cc69-419e-b599-d8f7a2e8097e@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BhSrEfrzZ77opy80X4f1/7SmRcLnUunFjvy3qSsfeC5BnT6X2cz
 u3zeDyjWG4i4cypNsUYgdCx4viZsXyOY0RtLIrTflKiWzuHjeRt9HirepRE1E5TEAsVbPaU
 9x0fdoaDc5deZLpJ8ZkTfw5yxjBlyXNvfwbY8pIezCcIrZi2L0WuHxuGjB4+BQcUNgGf6ok
 vnbx0zmfF+uCzz2FHp9UQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hwNRWhGTmKU=;JN89L6Xk21DUVZIiqXekh+XVR+T
 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

Am 18.11.25 um 14:17 schrieb Werner Sembach:

>
> Am 18.11.25 um 12:31 schrieb Armin Wolf:
>> Am 17.11.25 um 14:23 schrieb Werner Sembach:
>>
>>> With the Uniwill driver from Armin now accepted I want to push the=20
>>> first
>>> big addon to it that I worked on in parallel.
>>>
>>> First this adds all current Tuxedo devices to use at least the input=
=20
>>> part
>>> of the new driver.
>>>
>>> Second it adds a new feature for cTGP control on Uniwill devices with
>>> NVIDIA GPUs and enables that on the TUXEDO devices.
>>>
>>> I have not yet enabled the other features in this driver for TUXEDO=20
>>> devices
>>> as they either don't apply (Uniwill did a line with Intel that=20
>>> behaves a
>>> little different to the rest of their ECs and that line is what the=20
>>> features
>>> Armin added are based on) or are, as of now, untested.
>>>
>>> There are plenty more features currently implemented in the out of tre=
e
>>> tuxedo-drivers dkms package that I plan to port over one by one, but a=
s
>>> always: No ETA given.
>>
>> Very nice, i think that especially the cTGP control feature will be=20
>> very popular with users.
>> I am also currently working to add fan table (aka "universal fan=20
>> control"), PL1/PL2 power limit
>> and platform profile support to the driver, so you might be able to=20
>> reuse some of that
>> functionality for your devices.
>>
>> I think that we can merge the first two patches in the near future,=20
>> but the remaining ones
>> dealing with the DMI table and cTGP support need some more work. What=
=20
>> kind of control does
>> your software (Tuxedo control center) need over the cTGP values? I am=
=20
>> asking because Intel
>> devices have fixed cTGP values for each platform profile. If your=20
>> software does something
>> similar, then maybe we can integrate this into the platform profile=20
>> mechanism.
>
> On some newer Uniwill devices all the platform profile register does=20
> is changing a led, the actual TDP, cTGP, Fan Curves, etc. are set in=20
> other registers. We currently expose this flexibility to userspace and=
=20
> need to keep it that way.
>
The power mode LED i assume? The same thing happens on Intel devices, Fan =
curves and power limits are independent
settings. Perhaps the "custom" platform profile would be suitable here? Wh=
en selecting the custom platform
profile, your userspace application can modify the fan curves and power li=
mits as desired.

Thanks,
Armin Wolf

>>
>> Thanks,
>> Armin Wolf
>>
>>>
>>> Werner Sembach (6):
>>> =C2=A0=C2=A0 platform/x86/uniwill: Add TUXEDO devices
>>> =C2=A0=C2=A0 platform/x86/uniwill: Handle more WMI events required for=
 TUXEDO
>>> =C2=A0=C2=A0=C2=A0=C2=A0 devices
>>> =C2=A0=C2=A0 platform/x86/uniwill: Implement cTGP setting
>>> =C2=A0=C2=A0 platform/x86/uniwill: Make uniwill_dmi_table accessible i=
n probe
>>> =C2=A0=C2=A0 platform/x86/uniwill: Run callbacks of uniwill_dmi_table
>>> =C2=A0=C2=A0 platform/x86/uniwill: Set cTGP support based on EC for TU=
XEDO IBP=20
>>> Gen7
>>> =C2=A0=C2=A0=C2=A0=C2=A0 MK1
>>>
>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 546=20
>>> ++++++++++++++++++--
>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.h=C2=A0 |=C2=A0=C2=A0 =
2 +
>>> =C2=A0 2 files changed, 502 insertions(+), 46 deletions(-)
>>>
>
