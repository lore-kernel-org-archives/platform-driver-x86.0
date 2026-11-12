Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523749;
	b=d5zG1h9ccLvvY5UK4MFAdD4EsSsXGDmtfylrvCGWQW50x15LnmlO3UFZSr3gdA+TMK+p
	 7tlQT0AL4YfPkMb9QTsJ8Ov0oFbE0/J9Z/hqi+gb+bNU+he22y/PuPw7TjeSYFC9ISeqs
	 V4mS2YqcfkGimdKZYHupAnP0XNsa/ryyxCgtmYiWsFrD5/XfhcOUVngVPz+33ooNy2q27
	 f4KC9xZjeBB6w9JwbTsebyRr/GvrckiK+4NlrecnPiTajv/LukUAEL5ROBWqUzpwCantB
	 dz3RkTAkXrbr0bRkEw8pE9B48TZlkWPvDlQukmi5NSVJbqv25n4aMmDJTqi+XtbPzjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523749;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=ZI478a4ZHbwK1foZtTPWH63s0fAPNdmRLX3N/pmfVbA=;
	b=N4u/dGtj3Q9oJFbHC3K+6+7zUakjef7DUmIVAyLNljG0LD2QcwNPD/Zkm+HOfTgiEf6I
	 UT2qvjJ+5bQ7+lVd3VE1ryfo7Dwa9Lx80UgQ1k8pgzzM896OkqhoDi3hp/mFGD9py1bqQ
	 qJcIHMyZIf3eY7pQQXz299jHrccpdR7S7ymlmoWJh2v7xX2XnonhvhLJ77LZDGM1QdwZL
	 YX5IZrpUzI63gdF0ofh8y/O3oX8ftd1ThG4u8jLRWzKX3HNzgohFrvOIC5TnDtWWFHecY
	 h9IRUtS1JyaFoJSyPQ0xsP3HHzIB1vVBJP2VcmhhMcH9N0neVz3qgYE2ULzaiFVw1PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ESQRVkuG;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA8B606A33B
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 22:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DA8B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ESQRVkuG
DKIM2-Signature:  i=1; m=1; t=1794523746;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:PrhGLjDZre+B2ejvBAkWtUO8gkGP
   RScPk4nBPcIWraQzT3r9Jc5PuWlqBK/6iE9OadXSv76/IC72WveHdBrk0F+/VlJzozFRuF8qqbG
   OGn3+PRjvDomz0hXqusip/wi46qhQLQ83TEOqgSPQ2bYKMvtqrhMLIHW5w0BoVeqULhR8r+IZUi
   we4tNzwaquSKMglgiv1sT9svpzpWv+Ftxbm0DLXlbN34bpsTq4nbRqpy1gJqn2ERFmGTiSPCuDe
   paqcP7LKiP3VpVAbdIP73ISYSC1ADg8EPJQFIDgwARqEBVopsKnZlY5VDMGD5Vw52ndmE9t86PG
   k8CdDrOdN/ea8A==;
Message-Instance:  m=1;
 h=sha256:
   XQLn5FoL9frKCsDUuyQ/41PPDra02J2taw3UDnjNv+c=:
   9PkEz3e6AIaAKr0BER3V/wxr/wM+YsOrsx+J5Ib6uok=,
  sha512:
   3shJG9jAV7KfyXjD7U8gNUm0URbom6VX13+owvlDauXGtZcJYBocXay3lXIqsQl9qHm94fXnf+3o/KncwyKCZQ==:
   rqovaaqp1nasMsE6DHopcb/nJY31PR/EO+PPwTPqn7WaX5/KOVYaxrVqfM+1Q4rqCp93PMuOLmiWcrhtrChhsw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794523741; x=1795128541; i=w_armin@gmx.de;
	bh=ZI478a4ZHbwK1foZtTPWH63s0fAPNdmRLX3N/pmfVbA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ESQRVkuG2jAGQTK69J8oDppj8ulBhpGSCA+f/VtgmIJYl7TbbYHecLPOet7W5svo
	 inlkmBtZztYpqsKxmyApZMmzFirCMbGzxKw/prmwiOYyEpHjTvbJgC7cAxYk3zN+L
	 j1S3OVG84NTt81BERmCcny6v0KddyJb7V2BIAxyDq4Qood6uAeykwKXXYwH8Sny5K
	 /xEI/jKdhBuW46wZt+0ca2e8LCIuSVs9CQ53yvjOsfTlmiZyGNnPZ6TNZEjj+AHpp
	 xgmHOUcMids8kCuEuYNHT3qUZcmJApuzV2l9ABqteOcRvQ6q+4vVOr+tHnwuq9+5g
	 0rBj2nYu2HI4Szej8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSKyI-1x3Pgj2s6i-00Vzmo; Thu, 12
 Nov 2026 23:49:01 +0100
Message-ID: <70a4e095-1b3b-42d0-9a1e-392b93679e0d@gmx.de>
Date: Thu, 12 Nov 2026 23:49:01 +0100
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
Content-Language: en-US, de-DE
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <cb91fd25dcd8d5154916222113c20941c0e14127.camel@feldmeth.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:J+vIv+XtiVs+sRgcQ1K0fCgsHKrd7zEmizsr8+6aaulsVnkpCwu
 A1cPOQQ/KJSeOSkGDFdfjVs2Kn6J3jnQHj9AVbYR7ia0B9kynogHWDknotPQdcHxAm7MWPK
 myMLjJiqdHIbiSDk47OdxNHnYTLQqB+2H6CnkfR6WtLVbevIplt8YKmkrDeoL+aGyotzq+H
 hTWCaOPDIJF8JLDeB+tNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j5BoD/eoEBc=;7hy28sMOe84kMHpfFH4KxPmH8fR
 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

Am 12.11.26 um 23:16 schrieb Tobias:

> Do you speak German?

Ja

>
> This is the final block of the output. It does not all fit into the
> console.

I suggest that you save the output inside a file compressed file and send
it as an attachment:

sudo acpidump -o <file>

(Ich empfehle dir die Ausgabe von "acpidump" in einer Datei zu speichern
und als Anhang zu senden, wenn n=C3=B6tig komprimiert.)

Thanks,
Armin Wolf

> SSDT @ 0x0000000000000000
> 0000: 53 53 44 54 A2 05 00 00 02 A8 50 6D 52 65 66 00  SSDT......PmRef.
> 0010: 43 70 75 30 49 73 74 00 00 30 00 00 49 4E 54 4C Cpu0Ist..0..INTL
> 0020: 27 05 16 20 A0 31 00 15 5C 2E 5F 53 42 5F 4F 53 '.. .1..\._SB_OS
> 0030: 43 50 01 00 15 5C 54 43 4E 54 05 00 15 5C 2E 5F CP...\TCNT...\._
> 0040: 53 42 5F 43 50 50 43 05 00 15 5C 2E 5F 53 42 5F SB_CPPC...\._SB_
> 0050: 50 52 30 30 06 00 10 4B 54 5C 2E 5F 53 42 5F 50 PR00...KT\._SB_P
> 0060: 52 30 30 14 11 5F 50 50 43 00 A4 5C 2E 5F 53 42 R00.._PPC..\._SB
> 0070: 5F 43 50 50 43 08 5F 50 43 54 12 2C 02 11 14 0A _CPPC._PCT.,....
> 0080: 11 82 0C 00 7F 00 00 00 00 00 00 00 00 00 00 00 ................
> 0090: 79 00 11 14 0A 11 82 0C 00 7F 00 00 00 00 00 00 y...............
> 00A0: 00 00 00 00 00 79 00 14 23 5F 50 53 53 00 A0 15 .....y..#_PSS...
> 00B0: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0B 00 04 00 A4 {\._SB_OSCP.....
> 00C0: 54 50 53 53 A1 06 A4 4C 50 53 53 08 4C 50 53 53 TPSS...LPSS.LPSS
> 00D0: 12 43 21 10 12 20 06 0C FD 08 00 00 0C 98 3A 00 .C!.. ........:.
> 00E0: 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 31 00 00 .............1..
> 00F0: 0C 00 31 00 00 12 20 06 0C FC 08 00 00 0C 98 3A ..1... ........:
> 0100: 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 17 00 ................
> 0110: 00 0C 00 17 00 00 12 20 06 0C 98 08 00 00 0C 08 ....... ........
> 0120: 37 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 16 7...............
> 0130: 00 00 0C 00 16 00 00 12 20 06 0C D0 07 00 00 0C ........ .......
> 0140: AE 30 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 .0..............
> 0150: 14 00 00 0C 00 14 00 00 12 20 06 0C 08 07 00 00 ......... ......
> 0160: 0C 22 2B 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C ."+.............
> 0170: 00 12 00 00 0C 00 12 00 00 12 20 06 0C A4 06 00 .......... .....
> 0180: 00 0C E7 27 00 00 0C 0A 00 00 00 0C 0A 00 00 00 ...'............
> 0190: 0C 00 11 00 00 0C 00 11 00 00 12 20 06 0C 40 06 ........... ..@.
> 01A0: 00 00 0C 46 25 00 00 0C 0A 00 00 00 0C 0A 00 00 ...F%.........
> 01B0: 00 0C 00 10 00 00 0C 00 10 00 00 12 20 06 0C DC ............ ...
> 01C0: 05 00 00 0C B2 22 00 00 0C 0A 00 00 00 0C 0A 00
> ....."............
> 01D0: 00 00 0C 00 0F 00 00 0C 00 0F 00 00 12 20 06 0C ............. ..
> 01E0: 14 05 00 00 0C 2F 1D 00 00 0C 0A 00 00 00 0C 0A ...../........
> 01F0: 00 00 00 0C 00 0D 00 00 0C 00 0D 00 00 12 20 06 .............. .
> 0200: 0C B0 04 00 00 0C C7 1A 00 00 0C 0A 00 00 00 0C ................
> 0210: 0A 00 00 00 0C 00 0C 00 00 0C 00 0C 00 00 12 20 ...............
> 0220: 06 0C 4C 04 00 00 0C E9 17 00 00 0C 0A 00 00 00 ..L.............
> 0230: 0C 0A 00 00 00 0C 00 0B 00 00 0C 00 0B 00 00 12 ................
> 0240: 20 06 0C 84 03 00 00 0C 5B 13 00 00 0C 0A 00 00 .......[.......
> 0250: 00 0C 0A 00 00 00 0C 00 09 00 00 0C 00 09 00 00 ................
> 0260: 12 20 06 0C 20 03 00 00 0C AB 10 00 00 0C 0A 00 . .. ...........
> 0270: 00 00 0C 0A 00 00 00 0C 00 08 00 00 0C 00 08 00 ................
> 0280: 00 12 20 06 0C BC 02 00 00 0C 86 0E 00 00 0C 0A .. .............
> 0290: 00 00 00 0C 0A 00 00 00 0C 00 07 00 00 0C 00 07 ................
> 02A0: 00 00 12 20 06 0C F4 01 00 00 0C EA 09 00 00 0C ... ............
> 02B0: 0A 00 00 00 0C 0A 00 00 00 0C 00 05 00 00 0C 00 ................
> 02C0: 05 00 00 12 20 06 0C 90 01 00 00 0C EC 07 00 00 .... ...........
> 02D0: 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 04 00 00 0C ................
> 02E0: 00 04 00 00 08 54 50 53 53 12 48 2B 15 12 20 06 .....TPSS.H+.. .
> 02F0: 0C FD 08 00 00 0C 98 3A 00 00 0C 0A 00 00 00 0C ......:........
> 0300: 0A 00 00 00 0C 00 31 00 00 0C 00 31 00 00 12 20 ......1....1...
> 0310: 06 0C FC 08 00 00 0C 98 3A 00 00 0C 0A 00 00 00 ........:.......
> 0320: 0C 0A 00 00 00 0C 00 17 00 00 0C 00 17 00 00 12 ................
> 0330: 20 06 0C 98 08 00 00 0C 08 37 00 00 0C 0A 00 00 ........7......
> 0340: 00 0C 0A 00 00 00 0C 00 16 00 00 0C 00 16 00 00 ................
> 0350: 12 20 06 0C 34 08 00 00 0C 1C 34 00 00 0C 0A 00 . ..4.....4.....
> 0360: 00 00 0C 0A 00 00 00 0C 00 15 00 00 0C 00 15 00 ................
> 0370: 00 12 20 06 0C D0 07 00 00 0C AE 30 00 00 0C 0A .. ........0....
> 0380: 00 00 00 0C 0A 00 00 00 0C 00 14 00 00 0C 00 14 ................
> 0390: 00 00 12 20 06 0C 6C 07 00 00 0C E1 2D 00 00 0C ... ..l.....-...
> 03A0: 0A 00 00 00 0C 0A 00 00 00 0C 00 13 00 00 0C 00 ................
> 03B0: 13 00 00 12 20 06 0C 08 07 00 00 0C 22 2B 00 00 .... ......."+..
> 03C0: 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 12 00 00 0C ................
> 03D0: 00 12 00 00 12 20 06 0C A4 06 00 00 0C E7 27 00 ..... .......'.
> 03E0: 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 11 00 00 ................
> 03F0: 0C 00 11 00 00 12 20 06 0C 40 06 00 00 0C 46 25 ...... ..@....F%
> 0400:0
>
> Thanks,
> Tobias Feldmeth-Walter
>
> Am Donnerstag, dem 12.11.2026 um 23:13 +0100 schrieb Armin Wolf:
>> Am 12.11.26 um 23:08 schrieb Tobias:
>>
>>> tobias@tobias-XPS:~$ acpidump
>>> Could not open table file: /sys/firmware/acpi/tables/SSDT4
>>> Could not get ACPI tables, AE_ACCESS
>>>
>>> Thanks
>>> Tobias Feldmeth-Walter
>> You need root privileges.
>>
>> Thanks,
>> Armin Wolf
>>
>>> Am Donnerstag, dem 12.11.2026 um 23:06 +0100 schrieb Armin Wolf:
>>>> Am 12.11.26 um 23:03 schrieb Tobias:
>>>>
>>>>> Hello,
>>>>>
>>>>> thanks for the quick response.
>>>>> thermald is already set up.
>>>>>
>>>>> tobias@tobias-XPS:~$ sudo apt install thermald
>>>>> thermald is already the newest version (2.5.11-0ubuntu1.1).
>>>>> thermald set to manually installed.
>>>>> Summary:
>>>>> Upgrade: 0, Install: 0, Remove: 0, Not upgraded: 44
>>>>> tobias@tobias-XPS:~$ sudo systemctl enable --now thermald
>>>>> tobias@tobias-XPS:~$ sudo systemctl status thermald
>>>>> =E2=97=8F thermald.service - Thermal Daemon Service
>>>>> Loaded: loaded (/usr/lib/systemd/system/thermald.service;
>>>>> enabled;
>>>>> preset: enabled)
>>>>> Active: active (running) since Thu 2026-11-12 21:46:07 CET; 1h
>>>>> 10min
>>>>> ago
>>>>> Invocation: ab085f7c1cae4d9aa4ae51d6ebe8ea5d
>>>>> Main PID: 1274 (thermald)
>>>>> Tasks: 5 (limit: 16591)
>>>>> Memory: 3M (peak: 3.7M)
>>>>> CPU: 17.761s
>>>>> CGroup: /system.slice/thermald.service
>>>>> =E2=94=94=E2=94=801274 /usr/sbin/thermald --systemd --dbus-enable --=
adaptive
>>>>>
>>>>> Nov 12 21:46:06 tobias-XPS systemd[1]: Starting
>>>>> thermald.service -
>>>>> Thermal Daemon Service...
>>>>> Nov 12 21:46:06 tobias-XPS thermald[1274]: 22 CPUID levels;
>>>>> family:model:stepping 0x6:8e:c (6:142:12)
>>>>> Nov 12 21:46:07 tobias-XPS thermald[1274]: 22 CPUID levels;
>>>>> family:model:stepping 0x6:8e:c (6:142:12)
>>>>> Nov 12 21:46:07 tobias-XPS thermald[1274]: Polling mode is
>>>>> enabled:
>>>>> 4
>>>>> Nov 12 21:46:07 tobias-XPS systemd[1]: Started thermald.service
>>>>> -
>>>>> Thermal Daemon Service.
>>>>> Nov 12 22:56:29 tobias-XPS systemd[1]: Started thermald.service
>>>>> -
>>>>> Thermal Daemon Service.
>>>>>
>>>>> Thanks for the feedback.
>>>>> Regards,
>>>>> Tobias Feldmeth-Walter
>>>> Strange, can you please share the output of acpidump?
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>>> Am Donnerstag, dem 12.11.2026 um 22:52 +0100 schrieb Armin
>>>>> Wolf:
>>>>>> Am 12.11.26 um 22:01 schrieb Tobias:
>>>>>>
>>>>>>> Hello,
>>>>>>>
>>>>>>> on my Dell XPS 13 7390 (BIOS 1.29.0, 12/17/2024, Ubuntu,
>>>>>>> kernel
>>>>>>> 7.0.0-
>>>>>>> 43-generic) the embedded controller does not engage
>>>>>>> automatic
>>>>>>> fan
>>>>>>> control. In EC auto mode the fans stay at 0 RPM even under
>>>>>>> full
>>>>>>> CPU
>>>>>>> load.
>>>>>>>
>>>>>>> Observations:
>>>>>>>
>>>>>>> The dell_smm hwmon device is present, with fan1/fan2
>>>>>>> (fan*_min=3D0,
>>>>>>> fan*_max=3D7300), pwm1, pwm1_enable, pwm2 and temp1..temp7.
>>>>>>> At idle (28=E2=80=9335 =C2=B0C) both fans report 0 RPM. This is
>>>>>>> expected.
>>>>>>> Test: I stopped my userspace fan controller, wrote
>>>>>>> pwm1_enable=3D2
>>>>>>> (accepted without error) and loaded all cores with yes >
>>>>>>> /dev/null.
>>>>>>> CPU
>>>>>>> package temperature rose from 34 =C2=B0C to 63 =C2=B0C after 5 s, =
73
>>>>>>> =C2=B0C
>>>>>>> after
>>>>>>> 30
>>>>>>> s and 82 =C2=B0C after 65 s, at which point I aborted the test.
>>>>>>> Both
>>>>>>> fans
>>>>>>> stayed at 0 RPM the whole time.
>>>>>>> pwm1_enable cannot be read back (Permission denied, even as
>>>>>>> root),
>>>>>>> only
>>>>>>> written.
>>>>>>> Platform profile is balanced (choices: cool quiet balanced
>>>>>>> performance). I did not test whether other profiles change
>>>>>>> the
>>>>>>> fan
>>>>>>> behaviour.
>>>>>>> thermald is running and has no effect on this.
>>>>>>>
>>>>>>> Workaround: a small userspace daemon polls the CPU package
>>>>>>> temperature
>>>>>>> every 2 s and writes pwm1_enable=3D1 plus a PWM value to
>>>>>>> pwm1/pwm2
>>>>>>> (off
>>>>>>> below 45 =C2=B0C, 128 from 50 =C2=B0C, 255 from 65 =C2=B0C, with
>>>>>>> hysteresis).
>>>>>>> On
>>>>>>> exit
>>>>>>> it leaves the fans at full speed. With it, the system cools
>>>>>>> normally.
>>>>>>>
>>>>>>> Questions:
>>>>>>>
>>>>>>> Is this a known firmware issue on the XPS 13 7390, and is
>>>>>>> there
>>>>>>> a
>>>>>>> BIOS
>>>>>>> version that fixes it?
>>>>>>> Is a different SMM call needed on this model to re-enable
>>>>>>> EC
>>>>>>> auto
>>>>>>> control, or should the driver do something on probe/resume?
>>>>>>> Which additional data would help? I can provide dmidecode
>>>>>>> and
>>>>>>> sensors
>>>>>>> output and test with dell_smm_hwmon module options (debug,
>>>>>>> force,
>>>>>>> restricted) if needed.
>>>>>>>
>>>>>>> Thanks and best regards,
>>>>>>> Tobias Feldmeth-Walter
>>>>>> Hi,
>>>>>>
>>>>>> i think we had a similar case not too long ago, and the
>>>>>> solution
>>>>>> was
>>>>>> to setup
>>>>>> thermald.
>>>>>>
>>>>>> Thanks,
>>>>>> Armin Wolf
