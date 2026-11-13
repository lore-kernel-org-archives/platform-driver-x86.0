Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602466;
	b=NQW4wXPpCtQTGVzchs8M9iQQPKqn5zU9PIyB4e2Of7Zfs/Bc1WYsucR9p/F6vCL/UU/9
	 IW+XJVr6YBJcfZ60DOaObIWDkZDZcJ/X7yH/lL55X8lO1Ok7eXHJi1gcR7+d7LL2Gu7QF
	 150ZcjkZcQ5cndsodAVfKCwLH2QDOoieITHuwMBQo8j5UNzGbK5xRF+MgUbKwcXKmj15B
	 8iS6klWhiRpihkmMCdmIq09QX+HctI/8IqsvyotxyKZQbghO3WkyvTykb+ohHwuh60R/A
	 jg+EgJCh4MVtjYAT/NfoEpDZ/K2ENcPdgJ8HNBUnneuOmf/MxCTQV0UXnTeKyicPS7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602466;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=a3EZxRI+PuY+8iSrprSRdx0Et4XbdEAM25kT4Ypykno=;
	b=etP20+SZzkfMs2+Vd5abYVMXk0XNtQBaDDRIobESDpuJoKHEcZ1+ki1I1nr/lJE2QSxm
	 ZHa7GouA+L1k6HoOWNWE+sAftnYWNP6cgXscwhSgAk7z4PjWnhIHviyFWwpTRlM3IpPjt
	 pXJlkqA4bn64kiOqPKUZGZA+VWhg5ms67BUSGh44MKIAPdJkOfAp8v04mNSYRFrMy3Fah
	 5bbp+U7+zeF5VkAzQ1QRRJe7PxJxzpZ7aTFtyYLahCdYSIfU9fVTzFnB5zQPzOAAw8ler
	 hMGWKc043BxDZzblTcM/hwCrbyQHMGGsvQzqjiPoGDF7B/4WEn215mJ9zdx86zjOSQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=heigHGU1;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB9B606A327
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 20:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB9B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=heigHGU1
DKIM2-Signature:  i=1; m=1; t=1794602463;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:A/FOc8XxZQtReJ/21Xh7rkdylkUu
   Fu6vwzDTNabBzf5xKpqL2qEQw0ITaw6bHoGHwfs7fVGdEidVJBkflBfo0vkwVKs/IblV+sVqgE5
   oAx16sAOBQyFiQQvjeUKZDYroGloJwiNaTiHprai2R0WTtlimCY+zlNztTsB3PC+X594JZenLQA
   P12Y01vRbX9xKrztTTlBc2dFp5+i7MEgbYfokrWHh+JsZ8IGHrjJEqpv4jCV67zWCsfxEe4jzLu
   Y5F0f9oPMfBJU+RSFeVG4mv86fC+AaIFPvjc1JnTDLtABBnHQ06E6l0FT6O6U2zUvqt+YGaWCyn
   5POFNijArYLcLA==;
Message-Instance:  m=1;
 h=sha256:
   NgfF04K/oqYlaFMl1oopM/mQBbjaivvxGEmP3IIRhEs=:
   v+2UUMuqbESj+7AZfKCmG9VgUfDwtQzDyC6qj8zhr9w=,
  sha512:
   CPL9xIqlEr2C+4GK8O11kXC+u4uJNu3t+dqCiZ7bS3ZsQGQZtd3vzj3dUE8YgcWY1ASSdLcmehCE1dfiYFhb2w==:
   R+VLVjYWPgfiP3mUsesYivL16pLnz2gNazuxlR09jb459H70sZTkCiyrpA1bin5pABU6TTj8rjvg1zKFXqPg2g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794602462; x=1795207262; i=w_armin@gmx.de;
	bh=a3EZxRI+PuY+8iSrprSRdx0Et4XbdEAM25kT4Ypykno=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=heigHGU1ms5YNo8OLjoD2lgYXUGKukdliNX7o5P5dtsYldX/b2anNSZC9pf5uKxQ
	 m1/IbV8YIAmhoUGYLZYioeqUlcrvWboFkfJkN5hYdf3bSeonEuWc9XmT93NuoSixE
	 69HAoOs+Xa57SFnzlFaAee9M7abaaLxfvo/gWsvxRUyd2Q2tDPS5H6hJsJc6zEl/G
	 2m/M6wUhYLk3g/SmnRG2xC1jj4dQzsxyef5XNmfHSMU5vMUg+ATdoNwnCGIrVtdfZ
	 tBR1qVnIO0GMCWIDXRxbGd7xH7fRqCJ7AB9HJNz9I2U2k9s7FdwjKbRpOsF24+LhA
	 ESIKibLrFUmnEp0+qw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNsw4-1x85jx3xZA-00RnCw; Fri, 13
 Nov 2026 21:41:02 +0100
Message-ID: <17a12f5c-e592-4ac7-ac7c-c23315fcca81@gmx.de>
Date: Fri, 13 Nov 2026 21:41:01 +0100
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
To: tobias@feldmeth.de, platform-driver-x86@vger.kernel.org
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
 <b402f1b8-31ed-4c62-838a-670e47d142c8@gmx.de>
 <e2bfa65d-079a-4749-a2f9-a17f96ee9074@feldmeth.de>
 <d28c196a-613f-43f3-bc2e-2f80bbada1ff@feldmeth.de>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <d28c196a-613f-43f3-bc2e-2f80bbada1ff@feldmeth.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7sUriZ6TRkOrOUP7yg5Hs16IF28Rqih5mul1qj0+cz1IdRq2GrT
 DiVAvPV+3SEHovq+ylBfenpR+CHYuvFPnW9mWFcWvSWihLr/tgxAInrAmjJjwubgLCjFp5W
 CFG1fwF1uHJzgd0j7oNfeydS7xLD724PMh/KWK05Y2/3N7az0bgEgTxe38wXBazEHumDicl
 32DQpW11MIF3rr4OLWiQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:at8R+hNvPBU=;TUTYBibS4AZbrgY1iokwrGMld6p
 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
 xUW/3r0vo9WMSADqxED2rZN0zBuxnM38Ho

Am 13.11.26 um 18:07 schrieb tobias@feldmeth.de:
> Hallo,
>=20
> ich muss es zwar noch weiter beobachten, aber scheinbar habe ich es=20
> geschafft, die Automatik nach einiger weiterer Suche wieder anzuschalten=
.
>=20
> Ich bin gespannt, ob das Problem auf Dauer behoben ist.
>=20
> Danke nochmals f=C3=BCr die super schnelle Hilfe
>=20
> Gru=C3=9F
> Tobias

Ok, dann hoffe ich mal dass das Problem damit wie auch immer behoben ist.

(He managed to somehow enable automatic BIOS fan control again, but he=20
has no idea how this was achieved)

Vielen Dank,
Armin Wolf

> Am 13.11.2026 00:38 schrieb tobias@feldmeth.de:
>=20
>     Danke
>     Ich probiere das mal aus und verschiede mich in die Nacht.
>=20
>     Morgen gibt es weitere R=C3=BCckmeldungen
>     Gru=C3=9F
>     Tobias
>=20
>     Am 13.11.2026 00:31 schrieb Armin Wolf <W_Armin@gmx.de>:
>=20
>         Am 13.11.26 um 00:21 schrieb Tobias:
>          > Das ist korrekt. Wir haben vorhin von "balanced" auf "cool"
>         umgestellt.
>          > Jetzt l=C3=A4uft der L=C3=BCfter nicht mehr st=C3=A4ndig an.
>          >
>          > Kurz nochmal was ich gemacht habe:
>          > - L=C3=BCfter hat, wenn er schnell gedreht hat, Ger=C3=A4usch=
e gemacht.
>         Hab ihn
>          > aufgemacht und zu h=C3=B6ren, welcher Probleme macht. Hatte i=
hn
>         vollst=C3=A4ndig
>          > ausgebaut.
>          > - Beim wieder anschlie=C3=9Fen kam eine BIOS Meldung. Ich bin=
 der
>         Meinung,
>          > dass diese sagte, er kennt den L=C3=BCfter nicht und muss ihn
>         registrieren.
>          > - Dann hab ich auf den neuen L=C3=BCfter gewartet und heute h=
aben
>         wir ihn
>          > getauscht. Leider stellte sich heraus, dass der neue L=C3=BCf=
ter
>         defekt war.
>          > Ein L=C3=BCfter macht mega l=C3=A4rm, der andere zuckt nur. D=
ie Dell-
>         Diagnose
>          > (F12) hat ihn auch nicht sauber erkannt (Critial Error)
>          > - Schon da lief der L=C3=BCfter nicht mehr freiwillig an und =
die
>         KI (Claude)
>          > hat mir ein Notskript geschrieben, was den L=C3=BCfter ansteu=
ert,
>         weil der
>          > Embedded Controller das wohl nicht mehr automatisch macht.
>          > - Dann haben wir den Original geputzt und wieder eingebaut.
>         Der lief
>          > das sch=C3=B6n und tut es noch, aber eben nicht automatisch
>         sondern mit dem
>          > Not-L=C3=BCfterdienst.
>          >
>          > Vielleicht hilft das ja auch weiter
>          > Danke
>          > Tobias
>=20
>         Hmm, merkw=C3=BCrdig.
>=20
>         Schau dir mal das an:
>         https://www.dell.com/community/en/conversations/xps/xps-13-
>         reporting-fan-failed-after-replacement/647f98bbf4ccf8a8debe3697
>=20
>         Ich vermute mal das entweder:
>=20
>         A: Der L=C3=BCfter nicht richtig eingesteckt ist un deshalb kein=
 RPM-
>         Signal
>         liefert
>=20
>         B: Das BIOS denkt das der L=C3=BCfter defekt ist und nicht
>         mirbekommen hat,
>         dass ein neuer L=C3=BCfter eingebaut wurde
>=20
>         Versuche mal wie im verlinkten Artikel beschrieben die
>         BIOS-Einstellungen zur=C3=BCckzusetzen. Sonst kannst du vlt. noc=
hmal die
>         Preboot-Diagnose (erreichbar mit F12 beim Start) ausf=C3=BChren =
und
>         hoffen
>         das ein erfolgreicher Test den Fehlerzustand zur=C3=BCcksetzt.
>=20
>         Vielen Dank,
>         Armin Wolf
>=20
>          >
>          > Am Freitag, dem 13.11.2026 um 00:13 +0100 schrieb Armin Wolf:
>          >> Am 12.11.26 um 23:53 schrieb Tobias:
>          >>> Sehr gut, das erleichtert die Konversation
>          >>>
>          >>> anbei der output.
>          >>>
>          >>> Danke schon mal f=C3=BCr die schnelle Unterst=C3=BCtzung
>          >>> Gru=C3=9F
>          >>> Tobias
>          >>
>          >> Danke, so wie ich das sehe wird auf diesem Ger=C3=A4t der L=
=C3=BCfter
>         komplett
>          >> vom
>          >> Embedded Controller gesteuert, kannst du mal versuchen =C3=
=BCber die
>          >> platform_profile-Schnittstelle ein anderes Profil auszuw=C3=
=A4hlen?
>          >>
>          >> Tipp: https://wiki.archlinux.org/title/
>         Dell_XPS_13_(7390)=C2=A0Abschnitt
>          >> "Change thermal settings to reduce fan noise"
>          >>
>          >> Danke,
>          >> Armin Wolf
>          >>
>          >>>
>          >>> Am Donnerstag, dem 12.11.2026 um 23:49 +0100 schrieb Armin
>         Wolf:
>          >>>> Am 12.11.26 um 23:16 schrieb Tobias:
>          >>>>
>          >>>>> Do you speak German?
>          >>>>
>          >>>> Ja
>          >>>>
>          >>>>>
>          >>>>> This is the final block of the output. It does not all
>         fit into
>          >>>>> the
>          >>>>> console.
>          >>>>
>          >>>> I suggest that you save the output inside a file
>         compressed file
>          >>>> and
>          >>>> send
>          >>>> it as an attachment:
>          >>>>
>          >>>> sudo acpidump -o <file>
>          >>>>
>          >>>> (Ich empfehle dir die Ausgabe von "acpidump" in einer
>         Datei zu
>          >>>> speichern
>          >>>> und als Anhang zu senden, wenn n=C3=B6tig komprimiert.)
>          >>>>
>          >>>> Thanks,
>          >>>> Armin Wolf
>          >>>>
>          >>>>> SSDT @ 0x0000000000000000
>          >>>>> 0000: 53 53 44 54 A2 05 00 00 02 A8 50 6D 52 65 66 00
>          >>>>> SSDT......PmRef.
>          >>>>> 0010: 43 70 75 30 49 73 74 00 00 30 00 00 49 4E 54 4C
>          >>>>> Cpu0Ist..0..INTL
>          >>>>> 0020: 27 05 16 20 A0 31 00 15 5C 2E 5F 53 42 5F 4F 53 '..
>          >>>>> .1..\._SB_OS
>          >>>>> 0030: 43 50 01 00 15 5C 54 43 4E 54 05 00 15 5C 2E 5F
>          >>>>> CP...\TCNT...\._
>          >>>>> 0040: 53 42 5F 43 50 50 43 05 00 15 5C 2E 5F 53 42 5F
>          >>>>> SB_CPPC...\._SB_
>          >>>>> 0050: 50 52 30 30 06 00 10 4B 54 5C 2E 5F 53 42 5F 50
>          >>>>> PR00...KT\._SB_P
>          >>>>> 0060: 52 30 30 14 11 5F 50 50 43 00 A4 5C 2E 5F 53 42
>          >>>>> R00.._PPC..\._SB
>          >>>>> 0070: 5F 43 50 50 43 08 5F 50 43 54 12 2C 02 11 14 0A
>          >>>>> _CPPC._PCT.,....
>          >>>>> 0080: 11 82 0C 00 7F 00 00 00 00 00 00 00 00 00 00 00
>          >>>>> ................
>          >>>>> 0090: 79 00 11 14 0A 11 82 0C 00 7F 00 00 00 00 00 00
>          >>>>> y...............
>          >>>>> 00A0: 00 00 00 00 00 79 00 14 23 5F 50 53 53 00 A0 15
>          >>>>> .....y..#_PSS...
>          >>>>> 00B0: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0B 00 04 00 A4
>          >>>>> {\._SB_OSCP.....
>          >>>>> 00C0: 54 50 53 53 A1 06 A4 4C 50 53 53 08 4C 50 53 53
>          >>>>> TPSS...LPSS.LPSS
>          >>>>> 00D0: 12 43 21 10 12 20 06 0C FD 08 00 00 0C 98 3A 00 .C!=
..
>          >>>>> ........:.
>          >>>>> 00E0: 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 31 00 00
>          >>>>> .............1..
>          >>>>> 00F0: 0C 00 31 00 00 12 20 06 0C FC 08 00 00 0C 98 3A ..1=
...
>          >>>>> ........:
>          >>>>> 0100: 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 17 00
>          >>>>> ................
>          >>>>> 0110: 00 0C 00 17 00 00 12 20 06 0C 98 08 00 00 0C
>         08 .......
>          >>>>> ........
>          >>>>> 0120: 37 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 16
>          >>>>> 7...............
>          >>>>> 0130: 00 00 0C 00 16 00 00 12 20 06 0C D0 07 00 00
>         0C ........
>          >>>>> .......
>          >>>>> 0140: AE 30 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00
>          >>>>> .0..............
>          >>>>> 0150: 14 00 00 0C 00 14 00 00 12 20 06 0C 08 07 00
>         00 .........
>          >>>>> ......
>          >>>>> 0160: 0C 22 2B 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C
>          >>>>> ."+.............
>          >>>>> 0170: 00 12 00 00 0C 00 12 00 00 12 20 06 0C A4 06 00
>          >>>>> ..........
>          >>>>> .....
>          >>>>> 0180: 00 0C E7 27 00 00 0C 0A 00 00 00 0C 0A 00 00 00
>          >>>>> ...'............
>          >>>>> 0190: 0C 00 11 00 00 0C 00 11 00 00 12 20 06 0C 40 06
>          >>>>> ...........
>          >>>>> ..@.
>          >>>>> 01A0: 00 00 0C 46 25 00 00 0C 0A 00 00 00 0C 0A 00 00
>          >>>>> ...F%.........
>          >>>>> 01B0: 00 0C 00 10 00 00 0C 00 10 00 00 12 20 06 0C DC
>          >>>>> ............
>          >>>>> ...
>          >>>>> 01C0: 05 00 00 0C B2 22 00 00 0C 0A 00 00 00 0C 0A 00
>          >>>>> ....."............
>          >>>>> 01D0: 00 00 0C 00 0F 00 00 0C 00 0F 00 00 12 20 06 0C
>          >>>>> .............
>          >>>>> ..
>          >>>>> 01E0: 14 05 00 00 0C 2F 1D 00 00 0C 0A 00 00 00 0C 0A
>          >>>>> ...../........
>          >>>>> 01F0: 00 00 00 0C 00 0D 00 00 0C 00 0D 00 00 12 20 06
>          >>>>> .............. .
>          >>>>> 0200: 0C B0 04 00 00 0C C7 1A 00 00 0C 0A 00 00 00 0C
>          >>>>> ................
>          >>>>> 0210: 0A 00 00 00 0C 00 0C 00 00 0C 00 0C 00 00 12 20
>          >>>>> ...............
>          >>>>> 0220: 06 0C 4C 04 00 00 0C E9 17 00 00 0C 0A 00 00 00
>          >>>>> ..L.............
>          >>>>> 0230: 0C 0A 00 00 00 0C 00 0B 00 00 0C 00 0B 00 00 12
>          >>>>> ................
>          >>>>> 0240: 20 06 0C 84 03 00 00 0C 5B 13 00 00 0C 0A 00 00
>          >>>>> .......[.......
>          >>>>> 0250: 00 0C 0A 00 00 00 0C 00 09 00 00 0C 00 09 00 00
>          >>>>> ................
>          >>>>> 0260: 12 20 06 0C 20 03 00 00 0C AB 10 00 00 0C 0A 00 . .=
.
>          >>>>> ...........
>          >>>>> 0270: 00 00 0C 0A 00 00 00 0C 00 08 00 00 0C 00 08 00
>          >>>>> ................
>          >>>>> 0280: 00 12 20 06 0C BC 02 00 00 0C 86 0E 00 00 0C 0A ..
>          >>>>> .............
>          >>>>> 0290: 00 00 00 0C 0A 00 00 00 0C 00 07 00 00 0C 00 07
>          >>>>> ................
>          >>>>> 02A0: 00 00 12 20 06 0C F4 01 00 00 0C EA 09 00 00 0C ...
>          >>>>> ............
>          >>>>> 02B0: 0A 00 00 00 0C 0A 00 00 00 0C 00 05 00 00 0C 00
>          >>>>> ................
>          >>>>> 02C0: 05 00 00 12 20 06 0C 90 01 00 00 0C EC 07 00 00 ...=
.
>          >>>>> ...........
>          >>>>> 02D0: 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 04 00 00 0C
>          >>>>> ................
>          >>>>> 02E0: 00 04 00 00 08 54 50 53 53 12 48 2B 15 12 20 06
>          >>>>> .....TPSS.H+.. .
>          >>>>> 02F0: 0C FD 08 00 00 0C 98 3A 00 00 0C 0A 00 00 00 0C
>          >>>>> ......:........
>          >>>>> 0300: 0A 00 00 00 0C 00 31 00 00 0C 00 31 00 00 12 20
>          >>>>> ......1....1...
>          >>>>> 0310: 06 0C FC 08 00 00 0C 98 3A 00 00 0C 0A 00 00 00
>          >>>>> ........:.......
>          >>>>> 0320: 0C 0A 00 00 00 0C 00 17 00 00 0C 00 17 00 00 12
>          >>>>> ................
>          >>>>> 0330: 20 06 0C 98 08 00 00 0C 08 37 00 00 0C 0A 00 00
>          >>>>> ........7......
>          >>>>> 0340: 00 0C 0A 00 00 00 0C 00 16 00 00 0C 00 16 00 00
>          >>>>> ................
>          >>>>> 0350: 12 20 06 0C 34 08 00 00 0C 1C 34 00 00 0C 0A 00 .
>          >>>>> ..4.....4.....
>          >>>>> 0360: 00 00 0C 0A 00 00 00 0C 00 15 00 00 0C 00 15 00
>          >>>>> ................
>          >>>>> 0370: 00 12 20 06 0C D0 07 00 00 0C AE 30 00 00 0C 0A ..
>          >>>>> ........0....
>          >>>>> 0380: 00 00 00 0C 0A 00 00 00 0C 00 14 00 00 0C 00 14
>          >>>>> ................
>          >>>>> 0390: 00 00 12 20 06 0C 6C 07 00 00 0C E1 2D 00 00 0C ...
>          >>>>> ..l.....-
>          >>>>> ...
>          >>>>> 03A0: 0A 00 00 00 0C 0A 00 00 00 0C 00 13 00 00 0C 00
>          >>>>> ................
>          >>>>> 03B0: 13 00 00 12 20 06 0C 08 07 00 00 0C 22 2B 00 00 ...=
.
>          >>>>> ......."+..
>          >>>>> 03C0: 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 12 00 00 0C
>          >>>>> ................
>          >>>>> 03D0: 00 12 00 00 12 20 06 0C A4 06 00 00 0C E7 27 00 ...=
..
>          >>>>> .......'.
>          >>>>> 03E0: 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 11 00 00
>          >>>>> ................
>          >>>>> 03F0: 0C 00 11 00 00 12 20 06 0C 40 06 00 00 0C 46 25 ...=
...
>          >>>>> ..@....F%
>          >>>>> 0400:0
>          >>>>>
>          >>>>> Thanks,
>          >>>>> Tobias Feldmeth-Walter
>          >>>>>
>          >>>>> Am Donnerstag, dem 12.11.2026 um 23:13 +0100 schrieb Armi=
n
>          >>>>> Wolf:
>          >>>>>> Am 12.11.26 um 23:08 schrieb Tobias:
>          >>>>>>
>          >>>>>>> tobias@tobias-XPS:~$ acpidump
>          >>>>>>> Could not open table file: /sys/firmware/acpi/tables/SS=
DT4
>          >>>>>>> Could not get ACPI tables, AE_ACCESS
>          >>>>>>>
>          >>>>>>> Thanks
>          >>>>>>> Tobias Feldmeth-Walter
>          >>>>>> You need root privileges.
>          >>>>>>
>          >>>>>> Thanks,
>          >>>>>> Armin Wolf
>          >>>>>>
>          >>>>>>> Am Donnerstag, dem 12.11.2026 um 23:06 +0100 schrieb Ar=
min
>          >>>>>>> Wolf:
>          >>>>>>>> Am 12.11.26 um 23:03 schrieb Tobias:
>          >>>>>>>>
>          >>>>>>>>> Hello,
>          >>>>>>>>>
>          >>>>>>>>> thanks for the quick response.
>          >>>>>>>>> thermald is already set up.
>          >>>>>>>>>
>          >>>>>>>>> tobias@tobias-XPS:~$ sudo apt install thermald
>          >>>>>>>>> thermald is already the newest version (2.5.11-
>          >>>>>>>>> 0ubuntu1.1).
>          >>>>>>>>> thermald set to manually installed.
>          >>>>>>>>> Summary:
>          >>>>>>>>> Upgrade: 0, Install: 0, Remove: 0, Not upgraded: 44
>          >>>>>>>>> tobias@tobias-XPS:~$ sudo systemctl enable --now
>          >>>>>>>>> thermald
>          >>>>>>>>> tobias@tobias-XPS:~$ sudo systemctl status thermald
>          >>>>>>>>> =E2=97=8F thermald.service - Thermal Daemon Service
>          >>>>>>>>> Loaded: loaded
>          >>>>>>>>> (/usr/lib/systemd/system/thermald.service;
>          >>>>>>>>> enabled;
>          >>>>>>>>> preset: enabled)
>          >>>>>>>>> Active: active (running) since Thu 2026-11-12 21:46:0=
7
>          >>>>>>>>> CET;
>          >>>>>>>>> 1h
>          >>>>>>>>> 10min
>          >>>>>>>>> ago
>          >>>>>>>>> Invocation: ab085f7c1cae4d9aa4ae51d6ebe8ea5d
>          >>>>>>>>> Main PID: 1274 (thermald)
>          >>>>>>>>> Tasks: 5 (limit: 16591)
>          >>>>>>>>> Memory: 3M (peak: 3.7M)
>          >>>>>>>>> CPU: 17.761s
>          >>>>>>>>> CGroup: /system.slice/thermald.service
>          >>>>>>>>> =E2=94=94=E2=94=801274 /usr/sbin/thermald --systemd -=
-dbus-enable --
>          >>>>>>>>> adaptive
>          >>>>>>>>>
>          >>>>>>>>> Nov 12 21:46:06 tobias-XPS systemd[1]: Starting
>          >>>>>>>>> thermald.service -
>          >>>>>>>>> Thermal Daemon Service...
>          >>>>>>>>> Nov 12 21:46:06 tobias-XPS thermald[1274]: 22 CPUID
>          >>>>>>>>> levels;
>          >>>>>>>>> family:model:stepping 0x6:8e:c (6:142:12)
>          >>>>>>>>> Nov 12 21:46:07 tobias-XPS thermald[1274]: 22 CPUID
>          >>>>>>>>> levels;
>          >>>>>>>>> family:model:stepping 0x6:8e:c (6:142:12)
>          >>>>>>>>> Nov 12 21:46:07 tobias-XPS thermald[1274]: Polling mo=
de
>          >>>>>>>>> is
>          >>>>>>>>> enabled:
>          >>>>>>>>> 4
>          >>>>>>>>> Nov 12 21:46:07 tobias-XPS systemd[1]: Started
>          >>>>>>>>> thermald.service
>          >>>>>>>>> -
>          >>>>>>>>> Thermal Daemon Service.
>          >>>>>>>>> Nov 12 22:56:29 tobias-XPS systemd[1]: Started
>          >>>>>>>>> thermald.service
>          >>>>>>>>> -
>          >>>>>>>>> Thermal Daemon Service.
>          >>>>>>>>>
>          >>>>>>>>> Thanks for the feedback.
>          >>>>>>>>> Regards,
>          >>>>>>>>> Tobias Feldmeth-Walter
>          >>>>>>>> Strange, can you please share the output of acpidump?
>          >>>>>>>>
>          >>>>>>>> Thanks,
>          >>>>>>>> Armin Wolf
>          >>>>>>>>
>          >>>>>>>>> Am Donnerstag, dem 12.11.2026 um 22:52 +0100 schrieb
>          >>>>>>>>> Armin
>          >>>>>>>>> Wolf:
>          >>>>>>>>>> Am 12.11.26 um 22:01 schrieb Tobias:
>          >>>>>>>>>>
>          >>>>>>>>>>> Hello,
>          >>>>>>>>>>>
>          >>>>>>>>>>> on my Dell XPS 13 7390 (BIOS 1.29.0, 12/17/2024,
>          >>>>>>>>>>> Ubuntu,
>          >>>>>>>>>>> kernel
>          >>>>>>>>>>> 7.0.0-
>          >>>>>>>>>>> 43-generic) the embedded controller does not engage
>          >>>>>>>>>>> automatic
>          >>>>>>>>>>> fan
>          >>>>>>>>>>> control. In EC auto mode the fans stay at 0 RPM
>          >>>>>>>>>>> even
>          >>>>>>>>>>> under
>          >>>>>>>>>>> full
>          >>>>>>>>>>> CPU
>          >>>>>>>>>>> load.
>          >>>>>>>>>>>
>          >>>>>>>>>>> Observations:
>          >>>>>>>>>>>
>          >>>>>>>>>>> The dell_smm hwmon device is present, with
>          >>>>>>>>>>> fan1/fan2
>          >>>>>>>>>>> (fan*_min=3D0,
>          >>>>>>>>>>> fan*_max=3D7300), pwm1, pwm1_enable, pwm2 and
>          >>>>>>>>>>> temp1..temp7.
>          >>>>>>>>>>> At idle (28=E2=80=9335 =C2=B0C) both fans report 0 =
RPM. This is
>          >>>>>>>>>>> expected.
>          >>>>>>>>>>> Test: I stopped my userspace fan controller, wrote
>          >>>>>>>>>>> pwm1_enable=3D2
>          >>>>>>>>>>> (accepted without error) and loaded all cores with
>          >>>>>>>>>>> yes
>          >>>>>>>>>>>>
>          >>>>>>>>>>> /dev/null.
>          >>>>>>>>>>> CPU
>          >>>>>>>>>>> package temperature rose from 34 =C2=B0C to 63 =C2=
=B0C after
>          >>>>>>>>>>> 5 s,
>          >>>>>>>>>>> 73
>          >>>>>>>>>>> =C2=B0C
>          >>>>>>>>>>> after
>          >>>>>>>>>>> 30
>          >>>>>>>>>>> s and 82 =C2=B0C after 65 s, at which point I abort=
ed
>          >>>>>>>>>>> the
>          >>>>>>>>>>> test.
>          >>>>>>>>>>> Both
>          >>>>>>>>>>> fans
>          >>>>>>>>>>> stayed at 0 RPM the whole time.
>          >>>>>>>>>>> pwm1_enable cannot be read back (Permission denied,
>          >>>>>>>>>>> even as
>          >>>>>>>>>>> root),
>          >>>>>>>>>>> only
>          >>>>>>>>>>> written.
>          >>>>>>>>>>> Platform profile is balanced (choices: cool quiet
>          >>>>>>>>>>> balanced
>          >>>>>>>>>>> performance). I did not test whether other profiles
>          >>>>>>>>>>> change
>          >>>>>>>>>>> the
>          >>>>>>>>>>> fan
>          >>>>>>>>>>> behaviour.
>          >>>>>>>>>>> thermald is running and has no effect on this.
>          >>>>>>>>>>>
>          >>>>>>>>>>> Workaround: a small userspace daemon polls the CPU
>          >>>>>>>>>>> package
>          >>>>>>>>>>> temperature
>          >>>>>>>>>>> every 2 s and writes pwm1_enable=3D1 plus a PWM val=
ue
>          >>>>>>>>>>> to
>          >>>>>>>>>>> pwm1/pwm2
>          >>>>>>>>>>> (off
>          >>>>>>>>>>> below 45 =C2=B0C, 128 from 50 =C2=B0C, 255 from 65 =
=C2=B0C, with
>          >>>>>>>>>>> hysteresis).
>          >>>>>>>>>>> On
>          >>>>>>>>>>> exit
>          >>>>>>>>>>> it leaves the fans at full speed. With it, the
>          >>>>>>>>>>> system
>          >>>>>>>>>>> cools
>          >>>>>>>>>>> normally.
>          >>>>>>>>>>>
>          >>>>>>>>>>> Questions:
>          >>>>>>>>>>>
>          >>>>>>>>>>> Is this a known firmware issue on the XPS 13 7390,
>          >>>>>>>>>>> and
>          >>>>>>>>>>> is
>          >>>>>>>>>>> there
>          >>>>>>>>>>> a
>          >>>>>>>>>>> BIOS
>          >>>>>>>>>>> version that fixes it?
>          >>>>>>>>>>> Is a different SMM call needed on this model to re-
>          >>>>>>>>>>> enable
>          >>>>>>>>>>> EC
>          >>>>>>>>>>> auto
>          >>>>>>>>>>> control, or should the driver do something on
>          >>>>>>>>>>> probe/resume?
>          >>>>>>>>>>> Which additional data would help? I can provide
>          >>>>>>>>>>> dmidecode
>          >>>>>>>>>>> and
>          >>>>>>>>>>> sensors
>          >>>>>>>>>>> output and test with dell_smm_hwmon module options
>          >>>>>>>>>>> (debug,
>          >>>>>>>>>>> force,
>          >>>>>>>>>>> restricted) if needed.
>          >>>>>>>>>>>
>          >>>>>>>>>>> Thanks and best regards,
>          >>>>>>>>>>> Tobias Feldmeth-Walter
>          >>>>>>>>>> Hi,
>          >>>>>>>>>>
>          >>>>>>>>>> i think we had a similar case not too long ago, and
>          >>>>>>>>>> the
>          >>>>>>>>>> solution
>          >>>>>>>>>> was
>          >>>>>>>>>> to setup
>          >>>>>>>>>> thermald.
>          >>>>>>>>>>
>          >>>>>>>>>> Thanks,
>          >>>>>>>>>> Armin Wolf
>=20

