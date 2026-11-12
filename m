Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794521615;
	b=s4er2bH2CNo1f9NxE4JDTNktJhJyrwsZBZzX3QsjrFnDS6QTiTod6ffFiDSIw7CLP/PH
	 AG6S5kPmZlYneoVkHH8ZMJ583UYDWYK/KZ3UWfdOHeNEFKYB10E+lKddJg55/MsFkKfj0
	 KGvMe2Vmy2S2K45Ni/IttcSrYafu3w4AONXgXH7g/nVIxLWNiqDI/DPcTw9TwdijjPVHM
	 4EPsesFImoOY3ai+5MpYa/a61KgmR+pQF++ufiH/rrhGwPVFeHTizZpwRwMSs83o8Fwpe
	 /1XLFcy4rcV4nOYpmHg7VShoOLT+QseRMajbUmH6rS2OQjMcG4H0r893tOZHAPB+gjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521615;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=d1I/apSpl26PjMiIdtcTzIrUQIZ/A5M9o2GC96T8NS4=;
	b=jp725QocFZLuOD4bk1V41m7AX29xRXefxJdkbzax3zfErZvIS44x49/be9mGq372gymz
	 Vj+p6QL789VVDbH4QI86N7M/CwRKgVB9TbRSQdyGdlZgdrzEp/oKMPlOESfz2ds9ZZnyS
	 ic/5EeLlaMFWjoBz6+dTMt3mC1Y8z47eAZEZAuErs3Wvu5QZlVl5cdYIYX4HO8eApiEW+
	 GMJn2PCBYOIIu64qBZCwSJK1QtvWAARcSwTQOcCrLExa0zriyCYfKTB71+0NkSc1UEzjx
	 YX2xhg4oO/SW05erKjDCjzHEKBayrXtK10IccMQjJmlWKKThemsGC5tMUbtbreX7VGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="Y/V0Ly88";
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99E5606A31C
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 22:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D99E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Y/V0Ly88
DKIM2-Signature:  i=1; m=1; t=1794521613;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:fQVwSMZYLR4i3e1m4gTpG37VdS9M
   WPXrIeUqVBS5+3jaKn/diCubwkf4PY4SO+Ad3cBfoEf7f/wDCZFhul/E2/V+P063eNMQY8v3H6Z
   9o07/b2AwHH0/EPw2yxfjx2aHmb1DQagGtDZS9EB+pFZivic6sQ2uTJj4r0s0WgtpcaiLCC240S
   3h/+Y5GuRpxNEsSvLD0J064lVhydaqFdOHLlnKIgLuFkQZ+BiIk8cXF9rVbVa+jNdbVBba3DX79
   VcK8lz37WOdsEKv3peRSzo6FQtb3JpbYEggw9/2gepqIBsjfj+gZ/e48M2emvLP3cWQLtoO43vM
   M1T4xiDby9wCxA==;
Message-Instance:  m=1;
 h=sha256:
   ksIye8+fnzfobOCKn5fHMf5dPKWaeEhIdcxizbBmb4I=:
   d1I/apSpl26PjMiIdtcTzIrUQIZ/A5M9o2GC96T8NS4=,
  sha512:
   QXbgUpER5wDQ0P95iEWuZQtmVToUN6VwG++fy+e2eB06jUIJHZ5i6C5AJi/9f+WFpeHLpdjflzqrjc3ksR19bQ==:
   UGo+dkUhLg5ab8WdbvyjiWHzSehPMiVJPfNyfUj4ylEVt++WFBaEE2H0IYEvKGB7pPvqkx3vgXSPThJIze3k1A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794521608; x=1795126408; i=w_armin@gmx.de;
	bh=d1I/apSpl26PjMiIdtcTzIrUQIZ/A5M9o2GC96T8NS4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Y/V0Ly88uSo5ed9BHLcwxjUV8tgljog5ARAbLwt1D+ycsvQYA1EpNaAjlMkrEjuZ
	 ixDmmYYJgBlFABEZsOEL2O/MiSclKzqM50bQSAeYTPJoDxV1Puxp0r6x4DngR57K3
	 QU6l6TAP3eqX+wdWWtfDiI8FUojfGY8iqIHz4slge7+6wJqZBnsReoPoTb2xa4Ita
	 RZvOjfv3YIL7j5qU4TFaZQ+OHicADQwz/U649l0+2V2o431jLx+itYLiURETyGz0C
	 v0A1V9pnjNJdb4qiOyRlkm+jh0VjCQgAGlL0wylRjDoLgM1fd+0wNxnk2C71npsxV
	 dro+wxNpRQQqqf7VFA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5QF5-1xQoEX1YAP-006vtZ; Thu, 12
 Nov 2026 23:13:28 +0100
Message-ID: <a7844c49-41cf-49ec-92af-a236e902afdc@gmx.de>
Date: Thu, 12 Nov 2026 23:13:27 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_dell-smm-hwmon=3A_Dell_XPS_13_7390_=E2=80=93_fans_n?=
 =?UTF-8?Q?ever_spin_up_in_EC_auto_mode_=28CPU_reaches_82_=C2=B0C_at_0_RPM?=
 =?UTF-8?Q?=29?=
To: Tobias <tobias@feldmeth.de>, platform-driver-x86@vger.kernel.org
Cc: pali@kernel.org
References: <412372e989bcb3d2376bc4437a9257bfe94ec850.camel@feldmeth.de>
 <4c98aa15-c9a5-4e48-a9f4-66abba17744b@gmx.de>
 <1ae16be741d52ae3cb79fdb014b88a5d778bbaea.camel@feldmeth.de>
 <0303be37-e67e-46d2-973d-0111a0bf828e@gmx.de>
 <d3d1bd34785a5cbe81f55d8a1bfd58b9806da5f6.camel@feldmeth.de>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <d3d1bd34785a5cbe81f55d8a1bfd58b9806da5f6.camel@feldmeth.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AhUQ+6aX0rciIYgvjutK72czzp716hhCy1NjFXJwPePGiSgD5Xp
 3n6ZrDPKYZwPV8aghyyc9NbpzP8/pVHEpU+g+1u/4MKslObY5UYem6rPS+8tWkzGyXv0e+j
 oFCreL5xvat3VKWy46W3F+BUhaxMZPgXiSZ5PnWlBqcVo66VKeI22GQ9QIvmRuizz1XsLUc
 2gYMzBBrFMczDa84+tRUA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UvLuN68MwuI=;SlfXuDZ5LTeL+f2qYv+U3+OopP6
 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

Am 12.11.26 um 23:08 schrieb Tobias:

> tobias@tobias-XPS:~$ acpidump
> Could not open table file: /sys/firmware/acpi/tables/SSDT4
> Could not get ACPI tables, AE_ACCESS
>
> Thanks
> Tobias Feldmeth-Walter

You need root privileges.

Thanks,
Armin Wolf

> Am Donnerstag, dem 12.11.2026 um 23:06 +0100 schrieb Armin Wolf:
>> Am 12.11.26 um 23:03 schrieb Tobias:
>>
>>> Hello,
>>>
>>> thanks for the quick response.
>>> thermald is already set up.
>>>
>>> tobias@tobias-XPS:~$ sudo apt install thermald
>>> thermald is already the newest version (2.5.11-0ubuntu1.1).
>>> thermald set to manually installed.
>>> Summary:
>>> Upgrade: 0, Install: 0, Remove: 0, Not upgraded: 44
>>> tobias@tobias-XPS:~$ sudo systemctl enable --now thermald
>>> tobias@tobias-XPS:~$ sudo systemctl status thermald
>>> =E2=97=8F thermald.service - Thermal Daemon Service
>>> Loaded: loaded (/usr/lib/systemd/system/thermald.service; enabled;
>>> preset: enabled)
>>> Active: active (running) since Thu 2026-11-12 21:46:07 CET; 1h
>>> 10min
>>> ago
>>> Invocation: ab085f7c1cae4d9aa4ae51d6ebe8ea5d
>>> Main PID: 1274 (thermald)
>>> Tasks: 5 (limit: 16591)
>>> Memory: 3M (peak: 3.7M)
>>> CPU: 17.761s
>>> CGroup: /system.slice/thermald.service
>>> =E2=94=94=E2=94=801274 /usr/sbin/thermald --systemd --dbus-enable --ad=
aptive
>>>
>>> Nov 12 21:46:06 tobias-XPS systemd[1]: Starting thermald.service -
>>> Thermal Daemon Service...
>>> Nov 12 21:46:06 tobias-XPS thermald[1274]: 22 CPUID levels;
>>> family:model:stepping 0x6:8e:c (6:142:12)
>>> Nov 12 21:46:07 tobias-XPS thermald[1274]: 22 CPUID levels;
>>> family:model:stepping 0x6:8e:c (6:142:12)
>>> Nov 12 21:46:07 tobias-XPS thermald[1274]: Polling mode is enabled:
>>> 4
>>> Nov 12 21:46:07 tobias-XPS systemd[1]: Started thermald.service -
>>> Thermal Daemon Service.
>>> Nov 12 22:56:29 tobias-XPS systemd[1]: Started thermald.service -
>>> Thermal Daemon Service.
>>>
>>> Thanks for the feedback.
>>> Regards,
>>> Tobias Feldmeth-Walter
>> Strange, can you please share the output of acpidump?
>>
>> Thanks,
>> Armin Wolf
>>
>>> Am Donnerstag, dem 12.11.2026 um 22:52 +0100 schrieb Armin Wolf:
>>>> Am 12.11.26 um 22:01 schrieb Tobias:
>>>>
>>>>> Hello,
>>>>>
>>>>> on my Dell XPS 13 7390 (BIOS 1.29.0, 12/17/2024, Ubuntu, kernel
>>>>> 7.0.0-
>>>>> 43-generic) the embedded controller does not engage automatic
>>>>> fan
>>>>> control. In EC auto mode the fans stay at 0 RPM even under full
>>>>> CPU
>>>>> load.
>>>>>
>>>>> Observations:
>>>>>
>>>>> The dell_smm hwmon device is present, with fan1/fan2
>>>>> (fan*_min=3D0,
>>>>> fan*_max=3D7300), pwm1, pwm1_enable, pwm2 and temp1..temp7.
>>>>> At idle (28=E2=80=9335 =C2=B0C) both fans report 0 RPM. This is expe=
cted.
>>>>> Test: I stopped my userspace fan controller, wrote
>>>>> pwm1_enable=3D2
>>>>> (accepted without error) and loaded all cores with yes >
>>>>> /dev/null.
>>>>> CPU
>>>>> package temperature rose from 34 =C2=B0C to 63 =C2=B0C after 5 s, 73=
 =C2=B0C
>>>>> after
>>>>> 30
>>>>> s and 82 =C2=B0C after 65 s, at which point I aborted the test. Both
>>>>> fans
>>>>> stayed at 0 RPM the whole time.
>>>>> pwm1_enable cannot be read back (Permission denied, even as
>>>>> root),
>>>>> only
>>>>> written.
>>>>> Platform profile is balanced (choices: cool quiet balanced
>>>>> performance). I did not test whether other profiles change the
>>>>> fan
>>>>> behaviour.
>>>>> thermald is running and has no effect on this.
>>>>>
>>>>> Workaround: a small userspace daemon polls the CPU package
>>>>> temperature
>>>>> every 2 s and writes pwm1_enable=3D1 plus a PWM value to
>>>>> pwm1/pwm2
>>>>> (off
>>>>> below 45 =C2=B0C, 128 from 50 =C2=B0C, 255 from 65 =C2=B0C, with hys=
teresis).
>>>>> On
>>>>> exit
>>>>> it leaves the fans at full speed. With it, the system cools
>>>>> normally.
>>>>>
>>>>> Questions:
>>>>>
>>>>> Is this a known firmware issue on the XPS 13 7390, and is there
>>>>> a
>>>>> BIOS
>>>>> version that fixes it?
>>>>> Is a different SMM call needed on this model to re-enable EC
>>>>> auto
>>>>> control, or should the driver do something on probe/resume?
>>>>> Which additional data would help? I can provide dmidecode and
>>>>> sensors
>>>>> output and test with dell_smm_hwmon module options (debug,
>>>>> force,
>>>>> restricted) if needed.
>>>>>
>>>>> Thanks and best regards,
>>>>> Tobias Feldmeth-Walter
>>>> Hi,
>>>>
>>>> i think we had a similar case not too long ago, and the solution
>>>> was
>>>> to setup
>>>> thermald.
>>>>
>>>> Thanks,
>>>> Armin Wolf
