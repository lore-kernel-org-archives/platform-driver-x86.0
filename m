Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794526274;
	b=d4DvFLet2yZncyr4ml+o8BmJUTRSCx7MZM4xl70oAo9viakOm9o4Wlx/O8lnUA4wo5EC
	 kV/ZJRZ4uONkD7dPTWS1rsOmMr3VqEfl5oBM3QgUjaNLmEH72NIp+AEn09L2pFIDpssUE
	 7P5pUDEsb1uCF5lK98dBBYngDnVYHu1MoOmriKDsVeqB7CYetcPHm7/QzpiJKDbK7eUnX
	 +dauARq1niWTyR4P3A0lqmNmmJfkx+ui7hxoiZkKrt/ESFws/wuFsFw3GDDm7eC9pi5mM
	 SpEDbDFt6xSc2b1LfR0HV2NsQH58CxpO2q9lMtwl611vqsxxaUp7Ih3qbCncf4GZ7NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794526274;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=38F4xPfli/QmVbMTSk+rHsFXcJRvg1keo9lbFr39zvc=;
	b=u1cMlD0rwPRDFQmPlH6Z8ooKvjRcdZjn6vESZiLgG4f1rn5A2WjkvhPWvIvkji1HAxqz
	 OMGQhMJDW2HYd7IXXVRkiHP20cL0yF4xCk3BvgU659TrvOXBCHswCHuKXxLnOk5G+a5Ux
	 zb7H0kfzzhbb6Up7o7h4AZKTvtKLgYGvMQTCaVybe1A1rzkrDihSsps9wjYnYrj6VMUIH
	 Arp39/jFQINyH5aYTvESAN36CKpv8C7FVwAOmyt4Z0+zQmhSssWRvX6cJs7EVj3flMnys
	 HgxVqri4dpwfRmwIEqPhIEHWHl03X5jS9fzfviQZFgcpfsoYSbqbnOE/7IU1s8yj5NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=d7ayNfF0;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7751606A327
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 23:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7751606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=d7ayNfF0
DKIM2-Signature:  i=1; m=1; t=1794526271;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:RW2hpLFlUoYFRTGX/gshzkuOyF1t
   FhFJyh7/pPN4iQt1vEXvpRvnNySw0W7BvWXcfcFT23UzHIPYvsSMQLXSXasK28ZZrYGOgH3wnFO
   AZ7CeXaERIKsF4DfJLP0ps3ggWKNYVU1fDyh4/AisijAE41AQ+PhGg40+PBWdDi1q0dSsoNyaD2
   qnNtkAHsIN9xdTbYSxldk1nzUz328ZnaJawxV/oZM9i3DF4Ou+ehSx+82a1HbklK4Ed/Lq7L2bU
   2Cged4aADN8old1FTWNYSwzjF/TUpIBgZURgT+o4c4Zh+HMvyLceVgJcxSyq3GaWw0N2uXkhe4l
   p++3zBfYxkYf+Q==;
Message-Instance:  m=1;
 h=sha256:
   8IxeC6t9q6Nd8/FJPqnhozsu8qHj9FcZRZqFMkVuFE8=:
   38F4xPfli/QmVbMTSk+rHsFXcJRvg1keo9lbFr39zvc=,
  sha512:
   Zzivvv3rCarYs+FX6suahJe7hJbp5yUWwu0ofcvjImH5kHUGK3QsMAcGR4ApmI4C+oKLS8ov4upW/RIeJvDXgw==:
   ziguyKxLiH5F1ATUZvRvdtDJfSFlNW4lvE+qkRP2P0da7LEEaGKwqOXYWdT7uwYgFC7ZZ9Y6tLRwLrFobU57Nw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794526271; x=1795131071; i=w_armin@gmx.de;
	bh=38F4xPfli/QmVbMTSk+rHsFXcJRvg1keo9lbFr39zvc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=d7ayNfF0pD3TITjaqO6WdwwxH6+2S/2ihACuxJ/p2mppCHWub8yrKypVZ66uZP21
	 N1AR+Hj0VyOQuwYL40hWVMFsv3VR5+CWwFJ2HNf1lY6Udfo6TOQqB0tfbP3O3UdU0
	 y4HDISVGX2rBihHid/MScv24bjbGBspzEC4aaRdqiCZh3max2lmDLVV3WMtQaMwHN
	 r3QBSf1/DCDIL/cJ1RRRCVPSC9VeALOuaPYGKwW1UQvwytZsFxOKtQ/qUm0Y0chx/
	 weCPphZf2DgjfBGjJ2hCHQgKwBAYN4xzRLbPWJaQBgXDpAwtxzBjLjjxwRXyqAwWK
	 bSA9wMdFOBxXMUQYcg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQkK-1wWXSZ2msC-00wecY; Fri, 13
 Nov 2026 00:31:11 +0100
Message-ID: <b402f1b8-31ed-4c62-838a-670e47d142c8@gmx.de>
Date: Fri, 13 Nov 2026 00:31:11 +0100
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
 <b2c6c2b8-0996-4697-977b-c71ac39375e9@gmx.de>
 <6d550fe087628fe9e7dbb4cc3324549bbbbcf051.camel@feldmeth.de>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <6d550fe087628fe9e7dbb4cc3324549bbbbcf051.camel@feldmeth.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zCpVddT7Pko9h9kGi77Hd4mNRFdk5ol6k0HN3IjloT28XK5UhlZ
 2uGyacOXV9jwXVx1Fd45UHhIRoJOV/EPsXhs7vG3vB8lYhH1I6i7Hj7gcSJKcw60jUAIAiY
 3lHW5UqMH8MvK/+NU17a6sdN2SfyOLcvys0dDhP6YY69i4PWrLpaWpPXNu2rORgy3mgp3vT
 ex/GTem9VQzbt2BZ9F17Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DjllwTw1Xdo=;4DOR45u7uSlCjRFiGj+16nacGDX
 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
 pjXtvrJp9bOgtzVXeG3JegDbX

Am 13.11.26 um 00:21 schrieb Tobias:
> Das ist korrekt. Wir haben vorhin von "balanced" auf "cool" umgestellt.
> Jetzt l=C3=A4uft der L=C3=BCfter nicht mehr st=C3=A4ndig an.
>=20
> Kurz nochmal was ich gemacht habe:
> - L=C3=BCfter hat, wenn er schnell gedreht hat, Ger=C3=A4usche gemacht. =
Hab ihn
> aufgemacht und zu h=C3=B6ren, welcher Probleme macht. Hatte ihn vollst=
=C3=A4ndig
> ausgebaut.
> - Beim wieder anschlie=C3=9Fen kam eine BIOS Meldung. Ich bin der Meinun=
g,
> dass diese sagte, er kennt den L=C3=BCfter nicht und muss ihn registrier=
en.
> - Dann hab ich auf den neuen L=C3=BCfter gewartet und heute haben wir ih=
n
> getauscht. Leider stellte sich heraus, dass der neue L=C3=BCfter defekt =
war.
> Ein L=C3=BCfter macht mega l=C3=A4rm, der andere zuckt nur. Die Dell-Dia=
gnose
> (F12) hat ihn auch nicht sauber erkannt (Critial Error)
> - Schon da lief der L=C3=BCfter nicht mehr freiwillig an und die KI (Cla=
ude)
> hat mir ein Notskript geschrieben, was den L=C3=BCfter ansteuert, weil d=
er
> Embedded Controller das wohl nicht mehr automatisch macht.
> - Dann haben wir den Original geputzt und wieder eingebaut. Der lief
> das sch=C3=B6n und tut es noch, aber eben nicht automatisch sondern mit =
dem
> Not-L=C3=BCfterdienst.
>=20
> Vielleicht hilft das ja auch weiter
> Danke
> Tobias

Hmm, merkw=C3=BCrdig.

Schau dir mal das an:=20
https://www.dell.com/community/en/conversations/xps/xps-13-reporting-fan-f=
ailed-after-replacement/647f98bbf4ccf8a8debe3697

Ich vermute mal das entweder:

A: Der L=C3=BCfter nicht richtig eingesteckt ist un deshalb kein RPM-Signa=
l=20
liefert

B: Das BIOS denkt das der L=C3=BCfter defekt ist und nicht mirbekommen hat=
,
dass ein neuer L=C3=BCfter eingebaut wurde

Versuche mal wie im verlinkten Artikel beschrieben die=20
BIOS-Einstellungen zur=C3=BCckzusetzen. Sonst kannst du vlt. nochmal die=
=20
Preboot-Diagnose (erreichbar mit F12 beim Start) ausf=C3=BChren und hoffen=
=20
das ein erfolgreicher Test den Fehlerzustand zur=C3=BCcksetzt.

Vielen Dank,
Armin Wolf

>=20
> Am Freitag, dem 13.11.2026 um 00:13 +0100 schrieb Armin Wolf:
>> Am 12.11.26 um 23:53 schrieb Tobias:
>>> Sehr gut, das erleichtert die Konversation
>>>
>>> anbei der output.
>>>
>>> Danke schon mal f=C3=BCr die schnelle Unterst=C3=BCtzung
>>> Gru=C3=9F
>>> Tobias
>>
>> Danke, so wie ich das sehe wird auf diesem Ger=C3=A4t der L=C3=BCfter k=
omplett
>> vom
>> Embedded Controller gesteuert, kannst du mal versuchen =C3=BCber die
>> platform_profile-Schnittstelle ein anderes Profil auszuw=C3=A4hlen?
>>
>> Tipp: https://wiki.archlinux.org/title/Dell_XPS_13_(7390)=C2=A0Abschnit=
t
>> "Change thermal settings to reduce fan noise"
>>
>> Danke,
>> Armin Wolf
>>
>>>
>>> Am Donnerstag, dem 12.11.2026 um 23:49 +0100 schrieb Armin Wolf:
>>>> Am 12.11.26 um 23:16 schrieb Tobias:
>>>>
>>>>> Do you speak German?
>>>>
>>>> Ja
>>>>
>>>>>
>>>>> This is the final block of the output. It does not all fit into
>>>>> the
>>>>> console.
>>>>
>>>> I suggest that you save the output inside a file compressed file
>>>> and
>>>> send
>>>> it as an attachment:
>>>>
>>>> sudo acpidump -o <file>
>>>>
>>>> (Ich empfehle dir die Ausgabe von "acpidump" in einer Datei zu
>>>> speichern
>>>> und als Anhang zu senden, wenn n=C3=B6tig komprimiert.)
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>>> SSDT @ 0x0000000000000000
>>>>> 0000: 53 53 44 54 A2 05 00 00 02 A8 50 6D 52 65 66 00
>>>>> SSDT......PmRef.
>>>>> 0010: 43 70 75 30 49 73 74 00 00 30 00 00 49 4E 54 4C
>>>>> Cpu0Ist..0..INTL
>>>>> 0020: 27 05 16 20 A0 31 00 15 5C 2E 5F 53 42 5F 4F 53 '..
>>>>> .1..\._SB_OS
>>>>> 0030: 43 50 01 00 15 5C 54 43 4E 54 05 00 15 5C 2E 5F
>>>>> CP...\TCNT...\._
>>>>> 0040: 53 42 5F 43 50 50 43 05 00 15 5C 2E 5F 53 42 5F
>>>>> SB_CPPC...\._SB_
>>>>> 0050: 50 52 30 30 06 00 10 4B 54 5C 2E 5F 53 42 5F 50
>>>>> PR00...KT\._SB_P
>>>>> 0060: 52 30 30 14 11 5F 50 50 43 00 A4 5C 2E 5F 53 42
>>>>> R00.._PPC..\._SB
>>>>> 0070: 5F 43 50 50 43 08 5F 50 43 54 12 2C 02 11 14 0A
>>>>> _CPPC._PCT.,....
>>>>> 0080: 11 82 0C 00 7F 00 00 00 00 00 00 00 00 00 00 00
>>>>> ................
>>>>> 0090: 79 00 11 14 0A 11 82 0C 00 7F 00 00 00 00 00 00
>>>>> y...............
>>>>> 00A0: 00 00 00 00 00 79 00 14 23 5F 50 53 53 00 A0 15
>>>>> .....y..#_PSS...
>>>>> 00B0: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0B 00 04 00 A4
>>>>> {\._SB_OSCP.....
>>>>> 00C0: 54 50 53 53 A1 06 A4 4C 50 53 53 08 4C 50 53 53
>>>>> TPSS...LPSS.LPSS
>>>>> 00D0: 12 43 21 10 12 20 06 0C FD 08 00 00 0C 98 3A 00 .C!..
>>>>> ........:.
>>>>> 00E0: 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 31 00 00
>>>>> .............1..
>>>>> 00F0: 0C 00 31 00 00 12 20 06 0C FC 08 00 00 0C 98 3A ..1...
>>>>> ........:
>>>>> 0100: 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 17 00
>>>>> ................
>>>>> 0110: 00 0C 00 17 00 00 12 20 06 0C 98 08 00 00 0C 08 .......
>>>>> ........
>>>>> 0120: 37 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 16
>>>>> 7...............
>>>>> 0130: 00 00 0C 00 16 00 00 12 20 06 0C D0 07 00 00 0C ........
>>>>> .......
>>>>> 0140: AE 30 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00
>>>>> .0..............
>>>>> 0150: 14 00 00 0C 00 14 00 00 12 20 06 0C 08 07 00 00 .........
>>>>> ......
>>>>> 0160: 0C 22 2B 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C
>>>>> ."+.............
>>>>> 0170: 00 12 00 00 0C 00 12 00 00 12 20 06 0C A4 06 00
>>>>> ..........
>>>>> .....
>>>>> 0180: 00 0C E7 27 00 00 0C 0A 00 00 00 0C 0A 00 00 00
>>>>> ...'............
>>>>> 0190: 0C 00 11 00 00 0C 00 11 00 00 12 20 06 0C 40 06
>>>>> ...........
>>>>> ..@.
>>>>> 01A0: 00 00 0C 46 25 00 00 0C 0A 00 00 00 0C 0A 00 00
>>>>> ...F%.........
>>>>> 01B0: 00 0C 00 10 00 00 0C 00 10 00 00 12 20 06 0C DC
>>>>> ............
>>>>> ...
>>>>> 01C0: 05 00 00 0C B2 22 00 00 0C 0A 00 00 00 0C 0A 00
>>>>> ....."............
>>>>> 01D0: 00 00 0C 00 0F 00 00 0C 00 0F 00 00 12 20 06 0C
>>>>> .............
>>>>> ..
>>>>> 01E0: 14 05 00 00 0C 2F 1D 00 00 0C 0A 00 00 00 0C 0A
>>>>> ...../........
>>>>> 01F0: 00 00 00 0C 00 0D 00 00 0C 00 0D 00 00 12 20 06
>>>>> .............. .
>>>>> 0200: 0C B0 04 00 00 0C C7 1A 00 00 0C 0A 00 00 00 0C
>>>>> ................
>>>>> 0210: 0A 00 00 00 0C 00 0C 00 00 0C 00 0C 00 00 12 20
>>>>> ...............
>>>>> 0220: 06 0C 4C 04 00 00 0C E9 17 00 00 0C 0A 00 00 00
>>>>> ..L.............
>>>>> 0230: 0C 0A 00 00 00 0C 00 0B 00 00 0C 00 0B 00 00 12
>>>>> ................
>>>>> 0240: 20 06 0C 84 03 00 00 0C 5B 13 00 00 0C 0A 00 00
>>>>> .......[.......
>>>>> 0250: 00 0C 0A 00 00 00 0C 00 09 00 00 0C 00 09 00 00
>>>>> ................
>>>>> 0260: 12 20 06 0C 20 03 00 00 0C AB 10 00 00 0C 0A 00 . ..
>>>>> ...........
>>>>> 0270: 00 00 0C 0A 00 00 00 0C 00 08 00 00 0C 00 08 00
>>>>> ................
>>>>> 0280: 00 12 20 06 0C BC 02 00 00 0C 86 0E 00 00 0C 0A ..
>>>>> .............
>>>>> 0290: 00 00 00 0C 0A 00 00 00 0C 00 07 00 00 0C 00 07
>>>>> ................
>>>>> 02A0: 00 00 12 20 06 0C F4 01 00 00 0C EA 09 00 00 0C ...
>>>>> ............
>>>>> 02B0: 0A 00 00 00 0C 0A 00 00 00 0C 00 05 00 00 0C 00
>>>>> ................
>>>>> 02C0: 05 00 00 12 20 06 0C 90 01 00 00 0C EC 07 00 00 ....
>>>>> ...........
>>>>> 02D0: 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 04 00 00 0C
>>>>> ................
>>>>> 02E0: 00 04 00 00 08 54 50 53 53 12 48 2B 15 12 20 06
>>>>> .....TPSS.H+.. .
>>>>> 02F0: 0C FD 08 00 00 0C 98 3A 00 00 0C 0A 00 00 00 0C
>>>>> ......:........
>>>>> 0300: 0A 00 00 00 0C 00 31 00 00 0C 00 31 00 00 12 20
>>>>> ......1....1...
>>>>> 0310: 06 0C FC 08 00 00 0C 98 3A 00 00 0C 0A 00 00 00
>>>>> ........:.......
>>>>> 0320: 0C 0A 00 00 00 0C 00 17 00 00 0C 00 17 00 00 12
>>>>> ................
>>>>> 0330: 20 06 0C 98 08 00 00 0C 08 37 00 00 0C 0A 00 00
>>>>> ........7......
>>>>> 0340: 00 0C 0A 00 00 00 0C 00 16 00 00 0C 00 16 00 00
>>>>> ................
>>>>> 0350: 12 20 06 0C 34 08 00 00 0C 1C 34 00 00 0C 0A 00 .
>>>>> ..4.....4.....
>>>>> 0360: 00 00 0C 0A 00 00 00 0C 00 15 00 00 0C 00 15 00
>>>>> ................
>>>>> 0370: 00 12 20 06 0C D0 07 00 00 0C AE 30 00 00 0C 0A ..
>>>>> ........0....
>>>>> 0380: 00 00 00 0C 0A 00 00 00 0C 00 14 00 00 0C 00 14
>>>>> ................
>>>>> 0390: 00 00 12 20 06 0C 6C 07 00 00 0C E1 2D 00 00 0C ...
>>>>> ..l.....-
>>>>> ...
>>>>> 03A0: 0A 00 00 00 0C 0A 00 00 00 0C 00 13 00 00 0C 00
>>>>> ................
>>>>> 03B0: 13 00 00 12 20 06 0C 08 07 00 00 0C 22 2B 00 00 ....
>>>>> ......."+..
>>>>> 03C0: 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 12 00 00 0C
>>>>> ................
>>>>> 03D0: 00 12 00 00 12 20 06 0C A4 06 00 00 0C E7 27 00 .....
>>>>> .......'.
>>>>> 03E0: 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 11 00 00
>>>>> ................
>>>>> 03F0: 0C 00 11 00 00 12 20 06 0C 40 06 00 00 0C 46 25 ......
>>>>> ..@....F%
>>>>> 0400:0
>>>>>
>>>>> Thanks,
>>>>> Tobias Feldmeth-Walter
>>>>>
>>>>> Am Donnerstag, dem 12.11.2026 um 23:13 +0100 schrieb Armin
>>>>> Wolf:
>>>>>> Am 12.11.26 um 23:08 schrieb Tobias:
>>>>>>
>>>>>>> tobias@tobias-XPS:~$ acpidump
>>>>>>> Could not open table file: /sys/firmware/acpi/tables/SSDT4
>>>>>>> Could not get ACPI tables, AE_ACCESS
>>>>>>>
>>>>>>> Thanks
>>>>>>> Tobias Feldmeth-Walter
>>>>>> You need root privileges.
>>>>>>
>>>>>> Thanks,
>>>>>> Armin Wolf
>>>>>>
>>>>>>> Am Donnerstag, dem 12.11.2026 um 23:06 +0100 schrieb Armin
>>>>>>> Wolf:
>>>>>>>> Am 12.11.26 um 23:03 schrieb Tobias:
>>>>>>>>
>>>>>>>>> Hello,
>>>>>>>>>
>>>>>>>>> thanks for the quick response.
>>>>>>>>> thermald is already set up.
>>>>>>>>>
>>>>>>>>> tobias@tobias-XPS:~$ sudo apt install thermald
>>>>>>>>> thermald is already the newest version (2.5.11-
>>>>>>>>> 0ubuntu1.1).
>>>>>>>>> thermald set to manually installed.
>>>>>>>>> Summary:
>>>>>>>>> Upgrade: 0, Install: 0, Remove: 0, Not upgraded: 44
>>>>>>>>> tobias@tobias-XPS:~$ sudo systemctl enable --now
>>>>>>>>> thermald
>>>>>>>>> tobias@tobias-XPS:~$ sudo systemctl status thermald
>>>>>>>>> =E2=97=8F thermald.service - Thermal Daemon Service
>>>>>>>>> Loaded: loaded
>>>>>>>>> (/usr/lib/systemd/system/thermald.service;
>>>>>>>>> enabled;
>>>>>>>>> preset: enabled)
>>>>>>>>> Active: active (running) since Thu 2026-11-12 21:46:07
>>>>>>>>> CET;
>>>>>>>>> 1h
>>>>>>>>> 10min
>>>>>>>>> ago
>>>>>>>>> Invocation: ab085f7c1cae4d9aa4ae51d6ebe8ea5d
>>>>>>>>> Main PID: 1274 (thermald)
>>>>>>>>> Tasks: 5 (limit: 16591)
>>>>>>>>> Memory: 3M (peak: 3.7M)
>>>>>>>>> CPU: 17.761s
>>>>>>>>> CGroup: /system.slice/thermald.service
>>>>>>>>> =E2=94=94=E2=94=801274 /usr/sbin/thermald --systemd --dbus-enabl=
e --
>>>>>>>>> adaptive
>>>>>>>>>
>>>>>>>>> Nov 12 21:46:06 tobias-XPS systemd[1]: Starting
>>>>>>>>> thermald.service -
>>>>>>>>> Thermal Daemon Service...
>>>>>>>>> Nov 12 21:46:06 tobias-XPS thermald[1274]: 22 CPUID
>>>>>>>>> levels;
>>>>>>>>> family:model:stepping 0x6:8e:c (6:142:12)
>>>>>>>>> Nov 12 21:46:07 tobias-XPS thermald[1274]: 22 CPUID
>>>>>>>>> levels;
>>>>>>>>> family:model:stepping 0x6:8e:c (6:142:12)
>>>>>>>>> Nov 12 21:46:07 tobias-XPS thermald[1274]: Polling mode
>>>>>>>>> is
>>>>>>>>> enabled:
>>>>>>>>> 4
>>>>>>>>> Nov 12 21:46:07 tobias-XPS systemd[1]: Started
>>>>>>>>> thermald.service
>>>>>>>>> -
>>>>>>>>> Thermal Daemon Service.
>>>>>>>>> Nov 12 22:56:29 tobias-XPS systemd[1]: Started
>>>>>>>>> thermald.service
>>>>>>>>> -
>>>>>>>>> Thermal Daemon Service.
>>>>>>>>>
>>>>>>>>> Thanks for the feedback.
>>>>>>>>> Regards,
>>>>>>>>> Tobias Feldmeth-Walter
>>>>>>>> Strange, can you please share the output of acpidump?
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Armin Wolf
>>>>>>>>
>>>>>>>>> Am Donnerstag, dem 12.11.2026 um 22:52 +0100 schrieb
>>>>>>>>> Armin
>>>>>>>>> Wolf:
>>>>>>>>>> Am 12.11.26 um 22:01 schrieb Tobias:
>>>>>>>>>>
>>>>>>>>>>> Hello,
>>>>>>>>>>>
>>>>>>>>>>> on my Dell XPS 13 7390 (BIOS 1.29.0, 12/17/2024,
>>>>>>>>>>> Ubuntu,
>>>>>>>>>>> kernel
>>>>>>>>>>> 7.0.0-
>>>>>>>>>>> 43-generic) the embedded controller does not engage
>>>>>>>>>>> automatic
>>>>>>>>>>> fan
>>>>>>>>>>> control. In EC auto mode the fans stay at 0 RPM
>>>>>>>>>>> even
>>>>>>>>>>> under
>>>>>>>>>>> full
>>>>>>>>>>> CPU
>>>>>>>>>>> load.
>>>>>>>>>>>
>>>>>>>>>>> Observations:
>>>>>>>>>>>
>>>>>>>>>>> The dell_smm hwmon device is present, with
>>>>>>>>>>> fan1/fan2
>>>>>>>>>>> (fan*_min=3D0,
>>>>>>>>>>> fan*_max=3D7300), pwm1, pwm1_enable, pwm2 and
>>>>>>>>>>> temp1..temp7.
>>>>>>>>>>> At idle (28=E2=80=9335 =C2=B0C) both fans report 0 RPM. This i=
s
>>>>>>>>>>> expected.
>>>>>>>>>>> Test: I stopped my userspace fan controller, wrote
>>>>>>>>>>> pwm1_enable=3D2
>>>>>>>>>>> (accepted without error) and loaded all cores with
>>>>>>>>>>> yes
>>>>>>>>>>>>
>>>>>>>>>>> /dev/null.
>>>>>>>>>>> CPU
>>>>>>>>>>> package temperature rose from 34 =C2=B0C to 63 =C2=B0C after
>>>>>>>>>>> 5 s,
>>>>>>>>>>> 73
>>>>>>>>>>> =C2=B0C
>>>>>>>>>>> after
>>>>>>>>>>> 30
>>>>>>>>>>> s and 82 =C2=B0C after 65 s, at which point I aborted
>>>>>>>>>>> the
>>>>>>>>>>> test.
>>>>>>>>>>> Both
>>>>>>>>>>> fans
>>>>>>>>>>> stayed at 0 RPM the whole time.
>>>>>>>>>>> pwm1_enable cannot be read back (Permission denied,
>>>>>>>>>>> even as
>>>>>>>>>>> root),
>>>>>>>>>>> only
>>>>>>>>>>> written.
>>>>>>>>>>> Platform profile is balanced (choices: cool quiet
>>>>>>>>>>> balanced
>>>>>>>>>>> performance). I did not test whether other profiles
>>>>>>>>>>> change
>>>>>>>>>>> the
>>>>>>>>>>> fan
>>>>>>>>>>> behaviour.
>>>>>>>>>>> thermald is running and has no effect on this.
>>>>>>>>>>>
>>>>>>>>>>> Workaround: a small userspace daemon polls the CPU
>>>>>>>>>>> package
>>>>>>>>>>> temperature
>>>>>>>>>>> every 2 s and writes pwm1_enable=3D1 plus a PWM value
>>>>>>>>>>> to
>>>>>>>>>>> pwm1/pwm2
>>>>>>>>>>> (off
>>>>>>>>>>> below 45 =C2=B0C, 128 from 50 =C2=B0C, 255 from 65 =C2=B0C, wi=
th
>>>>>>>>>>> hysteresis).
>>>>>>>>>>> On
>>>>>>>>>>> exit
>>>>>>>>>>> it leaves the fans at full speed. With it, the
>>>>>>>>>>> system
>>>>>>>>>>> cools
>>>>>>>>>>> normally.
>>>>>>>>>>>
>>>>>>>>>>> Questions:
>>>>>>>>>>>
>>>>>>>>>>> Is this a known firmware issue on the XPS 13 7390,
>>>>>>>>>>> and
>>>>>>>>>>> is
>>>>>>>>>>> there
>>>>>>>>>>> a
>>>>>>>>>>> BIOS
>>>>>>>>>>> version that fixes it?
>>>>>>>>>>> Is a different SMM call needed on this model to re-
>>>>>>>>>>> enable
>>>>>>>>>>> EC
>>>>>>>>>>> auto
>>>>>>>>>>> control, or should the driver do something on
>>>>>>>>>>> probe/resume?
>>>>>>>>>>> Which additional data would help? I can provide
>>>>>>>>>>> dmidecode
>>>>>>>>>>> and
>>>>>>>>>>> sensors
>>>>>>>>>>> output and test with dell_smm_hwmon module options
>>>>>>>>>>> (debug,
>>>>>>>>>>> force,
>>>>>>>>>>> restricted) if needed.
>>>>>>>>>>>
>>>>>>>>>>> Thanks and best regards,
>>>>>>>>>>> Tobias Feldmeth-Walter
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> i think we had a similar case not too long ago, and
>>>>>>>>>> the
>>>>>>>>>> solution
>>>>>>>>>> was
>>>>>>>>>> to setup
>>>>>>>>>> thermald.
>>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Armin Wolf

