Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794525189;
	b=XPAZNmMfY0Jccis3zsjlyUei4H9/TUBu/9/i4FXDU5l4GdGiTHUBc2Xl/NOy7pMlgiIF
	 tPWUNY6v43yzncBM698s2EjU2LuaABicvUZdebfGRHt0SfvuyyeGt03U09900NUYj5g2w
	 BeyZXVQBQ0sHHHQxU5Ti3KVpQcx3q1SSloweDgQF8T/UEOAk1J9gIGHtmlyt/9ObNjpjc
	 NJeHxMr8/iDOipkJarCU8AmcsDo9cb+t0IkbS9lpHJIepTUsv4kEsSKk+N/EWlv/7i9iP
	 p/BtzEwOSfjx2N50bFCrgg9ybOwkH5Tx8Wnc/QUZ2x3SGqrDS7lYVnBstWKYlHy80Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794525189;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=iXxDSuVu3uamoqqUzyhugV8r30b6eR7lHbpUgXuC0iY=;
	b=F7IPMbS7Xwlc2uFut3eRykPnJIiQSBqPYdhkqKw6wLgEM5ZcnvV1+UVcdrTfq7Oyt5Ye
	 XDszKqHwgZNyyJao5+VlLq5bu+X9hXH6mRZhh8Kbz0Q+xC+8R7t7U4niZZuttOK53XJrg
	 uKghB0jLzhUBOFkuv/98lX1vZaJ463SKoyFWjrmKzwTJ/LrduZmYmvVT8iu/v3cV3Xfua
	 IHotnO77uawfnVXoqIvUk/+XG1R1DkgykJ5EbUZQwZQgVLBf46F/JXrgmQ9vBaWiltfL1
	 P+CEJOEdRSiCghCGXOUCmYJUrDYVCB9UH2xe+7T4HDMR+XNuAxMyWsZBBiWSV01+UWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Bz8Z6ipQ;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8457606A321
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 23:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8457606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Bz8Z6ipQ
DKIM2-Signature:  i=1; m=1; t=1794525186;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:sQUXJH7bCQKGe0djzYImy4Q0N6IA
   y8j1gV7Fv8prSqVoYLrdI3vdw6S8Pa6UQGa+YPaVYK+iPKXfx/TdDV14K9SAOS9ENcD7eBUYBzC
   DrRQHyvXrncr3OBb1hZlYTjJpNvIQT3EWFlhbHuw8jlGh9wzPojBYou2gzS4qT7DUgZUiFv+h/Z
   MndrdzpBQo0FeBxiqTU9sho1gnx1VWucc5HreDzEGHfEU2V0fcJGb540mKoNXG8xj0LoSYL4jYJ
   P2WIg3m+PZtTtOunFtO4BatZKbBrSMOYagC88pbTgs0rw99t9mlMKp2OFeUTTznqXVVj7Q+f/CH
   6IyT175zRPS9kg==;
Message-Instance:  m=1;
 h=sha256:
   FwI3zmF3mAUzh9On1DK7bO+TX1I6eeozwvhl18PpkfQ=:
   iXxDSuVu3uamoqqUzyhugV8r30b6eR7lHbpUgXuC0iY=,
  sha512:
   kh0esgh+1r/IizRWLFZVB0aMHHPFK/c3JES1G9bnHtfSQ61r94PommzAA49cvSw9/nDOKNH0x2rrisxZZJfquw==:
   /uON8RpwxBWbDr/uDiRbXj6koea48A1YnLrj8WoNOGxlwQMpGOGTcOP9ag0bvdOanZXdU136+WumbsxTzgQKHg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794525181; x=1795129981; i=w_armin@gmx.de;
	bh=iXxDSuVu3uamoqqUzyhugV8r30b6eR7lHbpUgXuC0iY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Bz8Z6ipQDDyyv9Rfff8+zoDNA4a7PfBHIEiG1ECh9R2FLEYKPNJ0sVlf8HciZ6SZ
	 YX489X1s/vyHRe5M1nfViImcpAxWruYqk37aAligqp71ub7ITKOF9CwPLTEYgWKn2
	 TuDzRCGd2whEQgeEjeJ/Aj7h79QnBToYjorIlYFMOFuFKHAe/UdGjgIFOxUdYPMaq
	 Ao1aOxdDO6t4T34ramCOC2YFgUdsSbuhKm0DF5O7ZphlCbcVrJ7jLFpamgDZVNvUR
	 o7/Ysd1bwr5dmnDfUfUGvTe+UodC0LfO3vlf6RRBO+ULmGvbEM2wPmkPmkPIDYIhb
	 6PYWEA6mvk1la1tBoA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsYv3-1wcqTG1qX5-00vMIB; Fri, 13
 Nov 2026 00:13:01 +0100
Message-ID: <b2c6c2b8-0996-4697-977b-c71ac39375e9@gmx.de>
Date: Fri, 13 Nov 2026 00:13:00 +0100
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
 <a7844c49-41cf-49ec-92af-a236e902afdc@gmx.de>
 <cb91fd25dcd8d5154916222113c20941c0e14127.camel@feldmeth.de>
 <70a4e095-1b3b-42d0-9a1e-392b93679e0d@gmx.de>
 <15a07747836da90be73baa39dbf13ffeeedbe9b3.camel@feldmeth.de>
Content-Language: en-US, de-DE
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <15a07747836da90be73baa39dbf13ffeeedbe9b3.camel@feldmeth.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:adD5wTa0AxwWp1qwSu67YI4fCvxYoUaomhElrzRL3jDJMBr6UB+
 CPHRjop9KuP1v1IprPvMq9FE8RfEx8/4dk7Teop7slsYkcLC5Vh+ISjOg8blAMZxwJjWrCD
 eVE3UM1Mkgq/Mg1R4hyFXj/3XKSpav+a/ArWjt/ZL48HUmYex8zeC6MwmoSEdrK1CRDv4Lx
 GtBJlIY8/8b8w8Ep8Vv5g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OEl6tZU4Eyk=;Wdui7QL489MWTgjqXUsl65VK6vf
 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

Am 12.11.26 um 23:53 schrieb Tobias:
> Sehr gut, das erleichtert die Konversation
>=20
> anbei der output.
>=20
> Danke schon mal f=C3=BCr die schnelle Unterst=C3=BCtzung
> Gru=C3=9F
> Tobias

Danke, so wie ich das sehe wird auf diesem Ger=C3=A4t der L=C3=BCfter komp=
lett vom=20
Embedded Controller gesteuert, kannst du mal versuchen =C3=BCber die=20
platform_profile-Schnittstelle ein anderes Profil auszuw=C3=A4hlen?

Tipp: https://wiki.archlinux.org/title/Dell_XPS_13_(7390) Abschnitt=20
"Change thermal settings to reduce fan noise"

Danke,
Armin Wolf

>=20
> Am Donnerstag, dem 12.11.2026 um 23:49 +0100 schrieb Armin Wolf:
>> Am 12.11.26 um 23:16 schrieb Tobias:
>>
>>> Do you speak German?
>>
>> Ja
>>
>>>
>>> This is the final block of the output. It does not all fit into the
>>> console.
>>
>> I suggest that you save the output inside a file compressed file and
>> send
>> it as an attachment:
>>
>> sudo acpidump -o <file>
>>
>> (Ich empfehle dir die Ausgabe von "acpidump" in einer Datei zu
>> speichern
>> und als Anhang zu senden, wenn n=C3=B6tig komprimiert.)
>>
>> Thanks,
>> Armin Wolf
>>
>>> SSDT @ 0x0000000000000000
>>> 0000: 53 53 44 54 A2 05 00 00 02 A8 50 6D 52 65 66 00
>>> SSDT......PmRef.
>>> 0010: 43 70 75 30 49 73 74 00 00 30 00 00 49 4E 54 4C
>>> Cpu0Ist..0..INTL
>>> 0020: 27 05 16 20 A0 31 00 15 5C 2E 5F 53 42 5F 4F 53 '..
>>> .1..\._SB_OS
>>> 0030: 43 50 01 00 15 5C 54 43 4E 54 05 00 15 5C 2E 5F
>>> CP...\TCNT...\._
>>> 0040: 53 42 5F 43 50 50 43 05 00 15 5C 2E 5F 53 42 5F
>>> SB_CPPC...\._SB_
>>> 0050: 50 52 30 30 06 00 10 4B 54 5C 2E 5F 53 42 5F 50
>>> PR00...KT\._SB_P
>>> 0060: 52 30 30 14 11 5F 50 50 43 00 A4 5C 2E 5F 53 42
>>> R00.._PPC..\._SB
>>> 0070: 5F 43 50 50 43 08 5F 50 43 54 12 2C 02 11 14 0A
>>> _CPPC._PCT.,....
>>> 0080: 11 82 0C 00 7F 00 00 00 00 00 00 00 00 00 00 00
>>> ................
>>> 0090: 79 00 11 14 0A 11 82 0C 00 7F 00 00 00 00 00 00
>>> y...............
>>> 00A0: 00 00 00 00 00 79 00 14 23 5F 50 53 53 00 A0 15
>>> .....y..#_PSS...
>>> 00B0: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0B 00 04 00 A4
>>> {\._SB_OSCP.....
>>> 00C0: 54 50 53 53 A1 06 A4 4C 50 53 53 08 4C 50 53 53
>>> TPSS...LPSS.LPSS
>>> 00D0: 12 43 21 10 12 20 06 0C FD 08 00 00 0C 98 3A 00 .C!..
>>> ........:.
>>> 00E0: 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 31 00 00
>>> .............1..
>>> 00F0: 0C 00 31 00 00 12 20 06 0C FC 08 00 00 0C 98 3A ..1...
>>> ........:
>>> 0100: 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 17 00
>>> ................
>>> 0110: 00 0C 00 17 00 00 12 20 06 0C 98 08 00 00 0C 08 .......
>>> ........
>>> 0120: 37 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 16
>>> 7...............
>>> 0130: 00 00 0C 00 16 00 00 12 20 06 0C D0 07 00 00 0C ........
>>> .......
>>> 0140: AE 30 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00
>>> .0..............
>>> 0150: 14 00 00 0C 00 14 00 00 12 20 06 0C 08 07 00 00 .........
>>> ......
>>> 0160: 0C 22 2B 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C
>>> ."+.............
>>> 0170: 00 12 00 00 0C 00 12 00 00 12 20 06 0C A4 06 00 ..........
>>> .....
>>> 0180: 00 0C E7 27 00 00 0C 0A 00 00 00 0C 0A 00 00 00
>>> ...'............
>>> 0190: 0C 00 11 00 00 0C 00 11 00 00 12 20 06 0C 40 06 ...........
>>> ..@.
>>> 01A0: 00 00 0C 46 25 00 00 0C 0A 00 00 00 0C 0A 00 00
>>> ...F%.........
>>> 01B0: 00 0C 00 10 00 00 0C 00 10 00 00 12 20 06 0C DC ............
>>> ...
>>> 01C0: 05 00 00 0C B2 22 00 00 0C 0A 00 00 00 0C 0A 00
>>> ....."............
>>> 01D0: 00 00 0C 00 0F 00 00 0C 00 0F 00 00 12 20 06 0C .............
>>> ..
>>> 01E0: 14 05 00 00 0C 2F 1D 00 00 0C 0A 00 00 00 0C 0A
>>> ...../........
>>> 01F0: 00 00 00 0C 00 0D 00 00 0C 00 0D 00 00 12 20 06
>>> .............. .
>>> 0200: 0C B0 04 00 00 0C C7 1A 00 00 0C 0A 00 00 00 0C
>>> ................
>>> 0210: 0A 00 00 00 0C 00 0C 00 00 0C 00 0C 00 00 12 20
>>> ...............
>>> 0220: 06 0C 4C 04 00 00 0C E9 17 00 00 0C 0A 00 00 00
>>> ..L.............
>>> 0230: 0C 0A 00 00 00 0C 00 0B 00 00 0C 00 0B 00 00 12
>>> ................
>>> 0240: 20 06 0C 84 03 00 00 0C 5B 13 00 00 0C 0A 00 00
>>> .......[.......
>>> 0250: 00 0C 0A 00 00 00 0C 00 09 00 00 0C 00 09 00 00
>>> ................
>>> 0260: 12 20 06 0C 20 03 00 00 0C AB 10 00 00 0C 0A 00 . ..
>>> ...........
>>> 0270: 00 00 0C 0A 00 00 00 0C 00 08 00 00 0C 00 08 00
>>> ................
>>> 0280: 00 12 20 06 0C BC 02 00 00 0C 86 0E 00 00 0C 0A ..
>>> .............
>>> 0290: 00 00 00 0C 0A 00 00 00 0C 00 07 00 00 0C 00 07
>>> ................
>>> 02A0: 00 00 12 20 06 0C F4 01 00 00 0C EA 09 00 00 0C ...
>>> ............
>>> 02B0: 0A 00 00 00 0C 0A 00 00 00 0C 00 05 00 00 0C 00
>>> ................
>>> 02C0: 05 00 00 12 20 06 0C 90 01 00 00 0C EC 07 00 00 ....
>>> ...........
>>> 02D0: 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 04 00 00 0C
>>> ................
>>> 02E0: 00 04 00 00 08 54 50 53 53 12 48 2B 15 12 20 06
>>> .....TPSS.H+.. .
>>> 02F0: 0C FD 08 00 00 0C 98 3A 00 00 0C 0A 00 00 00 0C
>>> ......:........
>>> 0300: 0A 00 00 00 0C 00 31 00 00 0C 00 31 00 00 12 20
>>> ......1....1...
>>> 0310: 06 0C FC 08 00 00 0C 98 3A 00 00 0C 0A 00 00 00
>>> ........:.......
>>> 0320: 0C 0A 00 00 00 0C 00 17 00 00 0C 00 17 00 00 12
>>> ................
>>> 0330: 20 06 0C 98 08 00 00 0C 08 37 00 00 0C 0A 00 00
>>> ........7......
>>> 0340: 00 0C 0A 00 00 00 0C 00 16 00 00 0C 00 16 00 00
>>> ................
>>> 0350: 12 20 06 0C 34 08 00 00 0C 1C 34 00 00 0C 0A 00 .
>>> ..4.....4.....
>>> 0360: 00 00 0C 0A 00 00 00 0C 00 15 00 00 0C 00 15 00
>>> ................
>>> 0370: 00 12 20 06 0C D0 07 00 00 0C AE 30 00 00 0C 0A ..
>>> ........0....
>>> 0380: 00 00 00 0C 0A 00 00 00 0C 00 14 00 00 0C 00 14
>>> ................
>>> 0390: 00 00 12 20 06 0C 6C 07 00 00 0C E1 2D 00 00 0C ... ..l.....-
>>> ...
>>> 03A0: 0A 00 00 00 0C 0A 00 00 00 0C 00 13 00 00 0C 00
>>> ................
>>> 03B0: 13 00 00 12 20 06 0C 08 07 00 00 0C 22 2B 00 00 ....
>>> ......."+..
>>> 03C0: 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 12 00 00 0C
>>> ................
>>> 03D0: 00 12 00 00 12 20 06 0C A4 06 00 00 0C E7 27 00 .....
>>> .......'.
>>> 03E0: 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 11 00 00
>>> ................
>>> 03F0: 0C 00 11 00 00 12 20 06 0C 40 06 00 00 0C 46 25 ......
>>> ..@....F%
>>> 0400:0
>>>
>>> Thanks,
>>> Tobias Feldmeth-Walter
>>>
>>> Am Donnerstag, dem 12.11.2026 um 23:13 +0100 schrieb Armin Wolf:
>>>> Am 12.11.26 um 23:08 schrieb Tobias:
>>>>
>>>>> tobias@tobias-XPS:~$ acpidump
>>>>> Could not open table file: /sys/firmware/acpi/tables/SSDT4
>>>>> Could not get ACPI tables, AE_ACCESS
>>>>>
>>>>> Thanks
>>>>> Tobias Feldmeth-Walter
>>>> You need root privileges.
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>>> Am Donnerstag, dem 12.11.2026 um 23:06 +0100 schrieb Armin
>>>>> Wolf:
>>>>>> Am 12.11.26 um 23:03 schrieb Tobias:
>>>>>>
>>>>>>> Hello,
>>>>>>>
>>>>>>> thanks for the quick response.
>>>>>>> thermald is already set up.
>>>>>>>
>>>>>>> tobias@tobias-XPS:~$ sudo apt install thermald
>>>>>>> thermald is already the newest version (2.5.11-0ubuntu1.1).
>>>>>>> thermald set to manually installed.
>>>>>>> Summary:
>>>>>>> Upgrade: 0, Install: 0, Remove: 0, Not upgraded: 44
>>>>>>> tobias@tobias-XPS:~$ sudo systemctl enable --now thermald
>>>>>>> tobias@tobias-XPS:~$ sudo systemctl status thermald
>>>>>>> =E2=97=8F thermald.service - Thermal Daemon Service
>>>>>>> Loaded: loaded (/usr/lib/systemd/system/thermald.service;
>>>>>>> enabled;
>>>>>>> preset: enabled)
>>>>>>> Active: active (running) since Thu 2026-11-12 21:46:07 CET;
>>>>>>> 1h
>>>>>>> 10min
>>>>>>> ago
>>>>>>> Invocation: ab085f7c1cae4d9aa4ae51d6ebe8ea5d
>>>>>>> Main PID: 1274 (thermald)
>>>>>>> Tasks: 5 (limit: 16591)
>>>>>>> Memory: 3M (peak: 3.7M)
>>>>>>> CPU: 17.761s
>>>>>>> CGroup: /system.slice/thermald.service
>>>>>>> =E2=94=94=E2=94=801274 /usr/sbin/thermald --systemd --dbus-enable =
=2D-
>>>>>>> adaptive
>>>>>>>
>>>>>>> Nov 12 21:46:06 tobias-XPS systemd[1]: Starting
>>>>>>> thermald.service -
>>>>>>> Thermal Daemon Service...
>>>>>>> Nov 12 21:46:06 tobias-XPS thermald[1274]: 22 CPUID levels;
>>>>>>> family:model:stepping 0x6:8e:c (6:142:12)
>>>>>>> Nov 12 21:46:07 tobias-XPS thermald[1274]: 22 CPUID levels;
>>>>>>> family:model:stepping 0x6:8e:c (6:142:12)
>>>>>>> Nov 12 21:46:07 tobias-XPS thermald[1274]: Polling mode is
>>>>>>> enabled:
>>>>>>> 4
>>>>>>> Nov 12 21:46:07 tobias-XPS systemd[1]: Started
>>>>>>> thermald.service
>>>>>>> -
>>>>>>> Thermal Daemon Service.
>>>>>>> Nov 12 22:56:29 tobias-XPS systemd[1]: Started
>>>>>>> thermald.service
>>>>>>> -
>>>>>>> Thermal Daemon Service.
>>>>>>>
>>>>>>> Thanks for the feedback.
>>>>>>> Regards,
>>>>>>> Tobias Feldmeth-Walter
>>>>>> Strange, can you please share the output of acpidump?
>>>>>>
>>>>>> Thanks,
>>>>>> Armin Wolf
>>>>>>
>>>>>>> Am Donnerstag, dem 12.11.2026 um 22:52 +0100 schrieb Armin
>>>>>>> Wolf:
>>>>>>>> Am 12.11.26 um 22:01 schrieb Tobias:
>>>>>>>>
>>>>>>>>> Hello,
>>>>>>>>>
>>>>>>>>> on my Dell XPS 13 7390 (BIOS 1.29.0, 12/17/2024,
>>>>>>>>> Ubuntu,
>>>>>>>>> kernel
>>>>>>>>> 7.0.0-
>>>>>>>>> 43-generic) the embedded controller does not engage
>>>>>>>>> automatic
>>>>>>>>> fan
>>>>>>>>> control. In EC auto mode the fans stay at 0 RPM even
>>>>>>>>> under
>>>>>>>>> full
>>>>>>>>> CPU
>>>>>>>>> load.
>>>>>>>>>
>>>>>>>>> Observations:
>>>>>>>>>
>>>>>>>>> The dell_smm hwmon device is present, with fan1/fan2
>>>>>>>>> (fan*_min=3D0,
>>>>>>>>> fan*_max=3D7300), pwm1, pwm1_enable, pwm2 and
>>>>>>>>> temp1..temp7.
>>>>>>>>> At idle (28=E2=80=9335 =C2=B0C) both fans report 0 RPM. This is
>>>>>>>>> expected.
>>>>>>>>> Test: I stopped my userspace fan controller, wrote
>>>>>>>>> pwm1_enable=3D2
>>>>>>>>> (accepted without error) and loaded all cores with yes
>>>>>>>>>>
>>>>>>>>> /dev/null.
>>>>>>>>> CPU
>>>>>>>>> package temperature rose from 34 =C2=B0C to 63 =C2=B0C after 5 s=
,
>>>>>>>>> 73
>>>>>>>>> =C2=B0C
>>>>>>>>> after
>>>>>>>>> 30
>>>>>>>>> s and 82 =C2=B0C after 65 s, at which point I aborted the
>>>>>>>>> test.
>>>>>>>>> Both
>>>>>>>>> fans
>>>>>>>>> stayed at 0 RPM the whole time.
>>>>>>>>> pwm1_enable cannot be read back (Permission denied,
>>>>>>>>> even as
>>>>>>>>> root),
>>>>>>>>> only
>>>>>>>>> written.
>>>>>>>>> Platform profile is balanced (choices: cool quiet
>>>>>>>>> balanced
>>>>>>>>> performance). I did not test whether other profiles
>>>>>>>>> change
>>>>>>>>> the
>>>>>>>>> fan
>>>>>>>>> behaviour.
>>>>>>>>> thermald is running and has no effect on this.
>>>>>>>>>
>>>>>>>>> Workaround: a small userspace daemon polls the CPU
>>>>>>>>> package
>>>>>>>>> temperature
>>>>>>>>> every 2 s and writes pwm1_enable=3D1 plus a PWM value to
>>>>>>>>> pwm1/pwm2
>>>>>>>>> (off
>>>>>>>>> below 45 =C2=B0C, 128 from 50 =C2=B0C, 255 from 65 =C2=B0C, with
>>>>>>>>> hysteresis).
>>>>>>>>> On
>>>>>>>>> exit
>>>>>>>>> it leaves the fans at full speed. With it, the system
>>>>>>>>> cools
>>>>>>>>> normally.
>>>>>>>>>
>>>>>>>>> Questions:
>>>>>>>>>
>>>>>>>>> Is this a known firmware issue on the XPS 13 7390, and
>>>>>>>>> is
>>>>>>>>> there
>>>>>>>>> a
>>>>>>>>> BIOS
>>>>>>>>> version that fixes it?
>>>>>>>>> Is a different SMM call needed on this model to re-
>>>>>>>>> enable
>>>>>>>>> EC
>>>>>>>>> auto
>>>>>>>>> control, or should the driver do something on
>>>>>>>>> probe/resume?
>>>>>>>>> Which additional data would help? I can provide
>>>>>>>>> dmidecode
>>>>>>>>> and
>>>>>>>>> sensors
>>>>>>>>> output and test with dell_smm_hwmon module options
>>>>>>>>> (debug,
>>>>>>>>> force,
>>>>>>>>> restricted) if needed.
>>>>>>>>>
>>>>>>>>> Thanks and best regards,
>>>>>>>>> Tobias Feldmeth-Walter
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> i think we had a similar case not too long ago, and the
>>>>>>>> solution
>>>>>>>> was
>>>>>>>> to setup
>>>>>>>> thermald.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Armin Wolf

