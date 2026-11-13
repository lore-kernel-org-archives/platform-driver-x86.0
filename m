Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.201.17.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548970;
	b=Bg4bXarYGHGmm6DAZP5X525DFNTbo8LDO2OcXLpviwVtn1QvV8T80OvDult465Eou/hP
	 1s6VYg8Cg7yGcyJ952Sp4uxDghmOXaYOh2OcsGZcz9vXZnl6j4hY9Eb2ZoByTepnehuZi
	 VFVnc0gX7D/XxRh2xH2gjG3KhhpLswGPPVAxszFRdxX0jJ2uAhBrP3RtzO/uZJip/oean
	 DfaxDbsgF0NBIZbR1sdrzzlwUfG/VPbFVpv0NT3orC0ozZ56ByPqoKkOoXBQcBo325+cx
	 aCZZwtlVrg9y4S9sbJwqOSqTiye2yrf/EGXr5jC12s8GpdX4J1rwzKzjKaNpUeCsJjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548970;
	h=DMARC-Filter:Received:Received:Received-SPF:Message-ID:Subject:From:
	 To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-PPP-Message-ID:
	 X-PPP-Vhost:X-Originating-IP:X-N-ableSpamExperts-Domain:
	 X-N-ableSpamExperts-Username:X-N-ableSpamExperts-Outgoing-Class:
	 X-N-ableSpamExperts-Outgoing-Evidence:X-Recommended-Action:
	 X-Filter-ID:X-Report-Abuse-To:X-Complaints-To;
	bh=z3U/DmgEn+ArJNQl5AE8MJlIy2HYtKSotmVVNyWg8TA=;
	b=gdoBWileFWLIAV7df2Ffod2i2mOlhuvDFjOCywZ9folvDhdVBjU5LyjsZDqeGYjrAZX/
	 va1EW2Ms6CUpQMrkQYlpUUz1KvSvzfxIGo0VrI8A9KyH4I6UABpfrOtm1BzQfnJjW5d2x
	 XQgGHCumESNbX3cx15y66cXVAk48RagROSoPiY8djFDJUQkyeSHxLevwc9AlZApFSEXij
	 czymX0VhCBYpn+f8jAMRLr4FMw9Yv1P0WttejIAaXoib6wEZ2exV1uWt6rUYjGDvFc7NQ
	 oJyQgCreQ0o72N1XCYiNJt7/lOyqIx5Wv9b+Enez+/HFMLCCcEVEvajBNDXac/WU8OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=feldmeth.de;
	spf=pass smtp.mailfrom=feldmeth.de;
	arc=none smtp.remote-ip=185.201.17.18
Received: from out13-18.antispamcloud.com (out13-18.antispamcloud.com [185.201.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F7A606A31C
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 05:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9F7A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=feldmeth.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=feldmeth.de
Received: from www131.webspace.hosting ([195.242.102.131])
	by mx294.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <tobias@feldmeth.de>)
	id 1xRk9z-0024mi-C0; Fri, 13 Nov 2026 06:49:17 +0100
Received: from tobias-XPS.fritz.box (p5dd137f6.dip0.t-ipconnect.de [93.209.55.246])
	by www131.webspace.hosting (Postfix) with ESMTPSA id 6E43B814CA;
	Fri, 13 Nov 2026 06:49:14 +0100 (CET)
Authentication-Results: www131.webspace.hosting;
        spf=pass (sender IP is 93.209.55.246) smtp.mailfrom=tobias@feldmeth.de smtp.helo=tobias-XPS.fritz.box
Received-SPF: pass (www131.webspace.hosting: connection is authenticated)
Message-ID: <edaa26fd20c89589f42d73c922cfa51d2707ebaf.camel@feldmeth.de>
Subject: Re: dell-smm-hwmon: Dell XPS 13 7390 =?UTF-8?Q?=E2=80=93?= fans
 never spin up in EC auto mode (CPU reaches 82 =?UTF-8?Q?=C2=B0C?= at 0 RPM)
From: Tobias <tobias@feldmeth.de>
To: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
Cc: pali@kernel.org
Date: Fri, 13 Nov 2026 06:49:13 +0100
In-Reply-To: <b402f1b8-31ed-4c62-838a-670e47d142c8@gmx.de>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-PPP-Message-ID: 
 <179454895474.3396856.10977539386849015272@www131.webspace.hosting>
X-PPP-Vhost: feldmeth.de
X-N-ableSpamExperts-Domain: www131.webspace.hosting
X-N-ableSpamExperts-Username: 195.242.102.131
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=195.242.102.131@www131.webspace.hosting
X-N-ableSpamExperts-Outgoing-Class: ham
X-N-ableSpamExperts-Outgoing-Evidence: SB/global_tokens (0.000445191865246)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuWP/FRR3PQH9B+Z31rGhw4tfC2fBPVrv85U
 jgfGkeCDoiu2SmbhJN1U9FKs8X3+Nt2pRmlebSALpIQ19PKbPIpilZbyMm38AjouuRSQIqjxL9cV
 PSoHm0W/3adFfiYl2ntRHGLc2tBr3bIy9GYy9/cG0xFuTxT4zj7FZjRutUGTvzFyLdg06ZXED6UM
 nC21PwfXqeq4d9UOAhmwl3wi5kP0SWDshiesHrcEYBdmJouoxVhCb5pPGZiFDLd++yjSyMCRVYKU
 9W9tbmVXJBqdHHDmFMezBtsH+Fr5latICLxKTLVn5uVOziAob7UesvhGecmd63xajD2SJVrooumr
 0SMbRwUEC+5/fjk2d+y2XyP7FnWFL1ZmDWWXJaBpi+mn53e8pYrql2bx94ttenELpteubhsQsniv
 psqmceDUZWfzySCys+KP9bxH+zXSoubCr/GlxuBZ+Mv4vxGKHhd8si+EwZFNLpbyGKrt66kMI/5L
 80x/83z9OxMxfMDd9s2+hv6t553Y9rP8NmlA1EmdFNN/QMigu7ctOfwYfBYIVTl0R+rPD2U01ycQ
 3WkJG63gzCboI3ZArDcir3GLN+QMUJlahX6Kk3busV8ZB9hJUTuWZd4MrCWpE67+MrnaaTUD+E4g
 7d8n0MZYQminPHKCRVPvHlsU0TpFTeZpATQdm1IUKRKOhcObZXWnkEw+6F9CGyZ/TnaodseT0EAP
 2y/xzJt2vcshiUJTGZY1yfZ17+fQxniQ4ApFQKQRG9WpbbNtmh3qf32HRAIXLxSxjQIuPQZeLfrx
 5PFsTfKxskFcVpzxUkJBwZhasgYY61uwCfKnz/3kgTtbIGX4Gktj7c2CONol2o6vbb47UXwKX42N
 rbzFOw+kiSjdFZbmgdHzdo93IZkbsz9Ax/yx71UgxdYZARllvy6VqyxAMjf284u7KU0cBlz1pRXW
 hjh9fdbl44I0Df3BdiBVZ2fx4UthCP41eYYLR16WkeVaYs8lGUqqeyZWMWAvzBOQtUfVQcJ2YodL
 OtCxsdjH/zmWzquleeuME+/gu1BPvx965LDA8wKypYER2qX3nl0H7g+xXLBf1o+2KLby3deP8vNn
 mz84mDUvZqxnXmHRaj3V403wS9rCCUpVHLAXVgHs1585NKI2gNsSU06RyE20TLg+oK/FJcdZU/J8
 MS+4ayUpOtEhdxekWDmK9g==
X-Report-Abuse-To: spam@quarantine14.antispamcloud.com
X-Complaints-To: abuse@antispamcloud.com

Guten Morgen,

das vorl=C3=A4ufige Endergebnis

noch ausprobiert:
- Akku abkoppeln
- BIOS zur=C3=BCcksetzen

Laut KI (Claude Sonnet)
Liegt der Fehler im Embedded Controller, verursacht durch den defekten
L=C3=BCfter, und ist irreversibel.
Die Notl=C3=B6sung mit dem Skript ist also vorerst eine Dauerl=C3=B6sung

Nun folgt der Kontakt zum H=C3=A4ndler

Danke erstmal f=C3=BCr die tolle und super schnelle Unterst=C3=BCtzung :)
Gru=C3=9F
Tobias=20

Am Freitag, dem 13.11.2026 um 00:31 +0100 schrieb Armin Wolf:
> Am 13.11.26 um 00:21 schrieb Tobias:
> > Das ist korrekt. Wir haben vorhin von "balanced" auf "cool"
> > umgestellt.
> > Jetzt l=C3=A4uft der L=C3=BCfter nicht mehr st=C3=A4ndig an.
> >=20
> > Kurz nochmal was ich gemacht habe:
> > - L=C3=BCfter hat, wenn er schnell gedreht hat, Ger=C3=A4usche gemacht.=
 Hab
> > ihn
> > aufgemacht und zu h=C3=B6ren, welcher Probleme macht. Hatte ihn
> > vollst=C3=A4ndig
> > ausgebaut.
> > - Beim wieder anschlie=C3=9Fen kam eine BIOS Meldung. Ich bin der
> > Meinung,
> > dass diese sagte, er kennt den L=C3=BCfter nicht und muss ihn
> > registrieren.
> > - Dann hab ich auf den neuen L=C3=BCfter gewartet und heute haben wir
> > ihn
> > getauscht. Leider stellte sich heraus, dass der neue L=C3=BCfter defekt
> > war.
> > Ein L=C3=BCfter macht mega l=C3=A4rm, der andere zuckt nur. Die Dell-Di=
agnose
> > (F12) hat ihn auch nicht sauber erkannt (Critial Error)
> > - Schon da lief der L=C3=BCfter nicht mehr freiwillig an und die KI
> > (Claude)
> > hat mir ein Notskript geschrieben, was den L=C3=BCfter ansteuert, weil
> > der
> > Embedded Controller das wohl nicht mehr automatisch macht.
> > - Dann haben wir den Original geputzt und wieder eingebaut. Der
> > lief
> > das sch=C3=B6n und tut es noch, aber eben nicht automatisch sondern mit
> > dem
> > Not-L=C3=BCfterdienst.
> >=20
> > Vielleicht hilft das ja auch weiter
> > Danke
> > Tobias
>=20
> Hmm, merkw=C3=BCrdig.
>=20
> Schau dir mal das an:=20
> https://www.dell.com/community/en/conversations/xps/xps-13-reporting-fan-=
failed-after-replacement/647f98bbf4ccf8a8debe3697
>=20
> Ich vermute mal das entweder:
>=20
> A: Der L=C3=BCfter nicht richtig eingesteckt ist un deshalb kein RPM-
> Signal=20
> liefert
>=20
> B: Das BIOS denkt das der L=C3=BCfter defekt ist und nicht mirbekommen
> hat,
> dass ein neuer L=C3=BCfter eingebaut wurde
>=20
> Versuche mal wie im verlinkten Artikel beschrieben die=20
> BIOS-Einstellungen zur=C3=BCckzusetzen. Sonst kannst du vlt. nochmal die=
=20
> Preboot-Diagnose (erreichbar mit F12 beim Start) ausf=C3=BChren und hoffe=
n
> das ein erfolgreicher Test den Fehlerzustand zur=C3=BCcksetzt.
>=20
> Vielen Dank,
> Armin Wolf
>=20
> >=20
> > Am Freitag, dem 13.11.2026 um 00:13 +0100 schrieb Armin Wolf:
> > > Am 12.11.26 um 23:53 schrieb Tobias:
> > > > Sehr gut, das erleichtert die Konversation
> > > >=20
> > > > anbei der output.
> > > >=20
> > > > Danke schon mal f=C3=BCr die schnelle Unterst=C3=BCtzung
> > > > Gru=C3=9F
> > > > Tobias
> > >=20
> > > Danke, so wie ich das sehe wird auf diesem Ger=C3=A4t der L=C3=BCfter
> > > komplett
> > > vom
> > > Embedded Controller gesteuert, kannst du mal versuchen =C3=BCber die
> > > platform_profile-Schnittstelle ein anderes Profil auszuw=C3=A4hlen?
> > >=20
> > > Tipp:
> > > https://wiki.archlinux.org/title/Dell_XPS_13_(7390)=C2=A0Abschnitt
> > > "Change thermal settings to reduce fan noise"
> > >=20
> > > Danke,
> > > Armin Wolf
> > >=20
> > > >=20
> > > > Am Donnerstag, dem 12.11.2026 um 23:49 +0100 schrieb Armin
> > > > Wolf:
> > > > > Am 12.11.26 um 23:16 schrieb Tobias:
> > > > >=20
> > > > > > Do you speak German?
> > > > >=20
> > > > > Ja
> > > > >=20
> > > > > >=20
> > > > > > This is the final block of the output. It does not all fit
> > > > > > into
> > > > > > the
> > > > > > console.
> > > > >=20
> > > > > I suggest that you save the output inside a file compressed
> > > > > file
> > > > > and
> > > > > send
> > > > > it as an attachment:
> > > > >=20
> > > > > sudo acpidump -o <file>
> > > > >=20
> > > > > (Ich empfehle dir die Ausgabe von "acpidump" in einer Datei
> > > > > zu
> > > > > speichern
> > > > > und als Anhang zu senden, wenn n=C3=B6tig komprimiert.)
> > > > >=20
> > > > > Thanks,
> > > > > Armin Wolf
> > > > >=20
> > > > > > SSDT @ 0x0000000000000000
> > > > > > 0000: 53 53 44 54 A2 05 00 00 02 A8 50 6D 52 65 66 00
> > > > > > SSDT......PmRef.
> > > > > > 0010: 43 70 75 30 49 73 74 00 00 30 00 00 49 4E 54 4C
> > > > > > Cpu0Ist..0..INTL
> > > > > > 0020: 27 05 16 20 A0 31 00 15 5C 2E 5F 53 42 5F 4F 53 '..
> > > > > > .1..\._SB_OS
> > > > > > 0030: 43 50 01 00 15 5C 54 43 4E 54 05 00 15 5C 2E 5F
> > > > > > CP...\TCNT...\._
> > > > > > 0040: 53 42 5F 43 50 50 43 05 00 15 5C 2E 5F 53 42 5F
> > > > > > SB_CPPC...\._SB_
> > > > > > 0050: 50 52 30 30 06 00 10 4B 54 5C 2E 5F 53 42 5F 50
> > > > > > PR00...KT\._SB_P
> > > > > > 0060: 52 30 30 14 11 5F 50 50 43 00 A4 5C 2E 5F 53 42
> > > > > > R00.._PPC..\._SB
> > > > > > 0070: 5F 43 50 50 43 08 5F 50 43 54 12 2C 02 11 14 0A
> > > > > > _CPPC._PCT.,....
> > > > > > 0080: 11 82 0C 00 7F 00 00 00 00 00 00 00 00 00 00 00
> > > > > > ................
> > > > > > 0090: 79 00 11 14 0A 11 82 0C 00 7F 00 00 00 00 00 00
> > > > > > y...............
> > > > > > 00A0: 00 00 00 00 00 79 00 14 23 5F 50 53 53 00 A0 15
> > > > > > .....y..#_PSS...
> > > > > > 00B0: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0B 00 04 00 A4
> > > > > > {\._SB_OSCP.....
> > > > > > 00C0: 54 50 53 53 A1 06 A4 4C 50 53 53 08 4C 50 53 53
> > > > > > TPSS...LPSS.LPSS
> > > > > > 00D0: 12 43 21 10 12 20 06 0C FD 08 00 00 0C 98 3A 00 .C!..
> > > > > > ........:.
> > > > > > 00E0: 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 31 00 00
> > > > > > .............1..
> > > > > > 00F0: 0C 00 31 00 00 12 20 06 0C FC 08 00 00 0C 98 3A
> > > > > > ..1...
> > > > > > ........:
> > > > > > 0100: 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 17 00
> > > > > > ................
> > > > > > 0110: 00 0C 00 17 00 00 12 20 06 0C 98 08 00 00 0C 08
> > > > > > .......
> > > > > > ........
> > > > > > 0120: 37 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 16
> > > > > > 7...............
> > > > > > 0130: 00 00 0C 00 16 00 00 12 20 06 0C D0 07 00 00 0C
> > > > > > ........
> > > > > > .......
> > > > > > 0140: AE 30 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00
> > > > > > .0..............
> > > > > > 0150: 14 00 00 0C 00 14 00 00 12 20 06 0C 08 07 00 00
> > > > > > .........
> > > > > > ......
> > > > > > 0160: 0C 22 2B 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C
> > > > > > ."+.............
> > > > > > 0170: 00 12 00 00 0C 00 12 00 00 12 20 06 0C A4 06 00
> > > > > > ..........
> > > > > > .....
> > > > > > 0180: 00 0C E7 27 00 00 0C 0A 00 00 00 0C 0A 00 00 00
> > > > > > ...'............
> > > > > > 0190: 0C 00 11 00 00 0C 00 11 00 00 12 20 06 0C 40 06
> > > > > > ...........
> > > > > > ..@.
> > > > > > 01A0: 00 00 0C 46 25 00 00 0C 0A 00 00 00 0C 0A 00 00
> > > > > > ...F%.........
> > > > > > 01B0: 00 0C 00 10 00 00 0C 00 10 00 00 12 20 06 0C DC
> > > > > > ............
> > > > > > ...
> > > > > > 01C0: 05 00 00 0C B2 22 00 00 0C 0A 00 00 00 0C 0A 00
> > > > > > ....."............
> > > > > > 01D0: 00 00 0C 00 0F 00 00 0C 00 0F 00 00 12 20 06 0C
> > > > > > .............
> > > > > > ..
> > > > > > 01E0: 14 05 00 00 0C 2F 1D 00 00 0C 0A 00 00 00 0C 0A
> > > > > > ...../........
> > > > > > 01F0: 00 00 00 0C 00 0D 00 00 0C 00 0D 00 00 12 20 06
> > > > > > .............. .
> > > > > > 0200: 0C B0 04 00 00 0C C7 1A 00 00 0C 0A 00 00 00 0C
> > > > > > ................
> > > > > > 0210: 0A 00 00 00 0C 00 0C 00 00 0C 00 0C 00 00 12 20
> > > > > > ...............
> > > > > > 0220: 06 0C 4C 04 00 00 0C E9 17 00 00 0C 0A 00 00 00
> > > > > > ..L.............
> > > > > > 0230: 0C 0A 00 00 00 0C 00 0B 00 00 0C 00 0B 00 00 12
> > > > > > ................
> > > > > > 0240: 20 06 0C 84 03 00 00 0C 5B 13 00 00 0C 0A 00 00
> > > > > > .......[.......
> > > > > > 0250: 00 0C 0A 00 00 00 0C 00 09 00 00 0C 00 09 00 00
> > > > > > ................
> > > > > > 0260: 12 20 06 0C 20 03 00 00 0C AB 10 00 00 0C 0A 00 . ..
> > > > > > ...........
> > > > > > 0270: 00 00 0C 0A 00 00 00 0C 00 08 00 00 0C 00 08 00
> > > > > > ................
> > > > > > 0280: 00 12 20 06 0C BC 02 00 00 0C 86 0E 00 00 0C 0A ..
> > > > > > .............
> > > > > > 0290: 00 00 00 0C 0A 00 00 00 0C 00 07 00 00 0C 00 07
> > > > > > ................
> > > > > > 02A0: 00 00 12 20 06 0C F4 01 00 00 0C EA 09 00 00 0C ...
> > > > > > ............
> > > > > > 02B0: 0A 00 00 00 0C 0A 00 00 00 0C 00 05 00 00 0C 00
> > > > > > ................
> > > > > > 02C0: 05 00 00 12 20 06 0C 90 01 00 00 0C EC 07 00 00 ....
> > > > > > ...........
> > > > > > 02D0: 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 04 00 00 0C
> > > > > > ................
> > > > > > 02E0: 00 04 00 00 08 54 50 53 53 12 48 2B 15 12 20 06
> > > > > > .....TPSS.H+.. .
> > > > > > 02F0: 0C FD 08 00 00 0C 98 3A 00 00 0C 0A 00 00 00 0C
> > > > > > ......:........
> > > > > > 0300: 0A 00 00 00 0C 00 31 00 00 0C 00 31 00 00 12 20
> > > > > > ......1....1...
> > > > > > 0310: 06 0C FC 08 00 00 0C 98 3A 00 00 0C 0A 00 00 00
> > > > > > ........:.......
> > > > > > 0320: 0C 0A 00 00 00 0C 00 17 00 00 0C 00 17 00 00 12
> > > > > > ................
> > > > > > 0330: 20 06 0C 98 08 00 00 0C 08 37 00 00 0C 0A 00 00
> > > > > > ........7......
> > > > > > 0340: 00 0C 0A 00 00 00 0C 00 16 00 00 0C 00 16 00 00
> > > > > > ................
> > > > > > 0350: 12 20 06 0C 34 08 00 00 0C 1C 34 00 00 0C 0A 00 .
> > > > > > ..4.....4.....
> > > > > > 0360: 00 00 0C 0A 00 00 00 0C 00 15 00 00 0C 00 15 00
> > > > > > ................
> > > > > > 0370: 00 12 20 06 0C D0 07 00 00 0C AE 30 00 00 0C 0A ..
> > > > > > ........0....
> > > > > > 0380: 00 00 00 0C 0A 00 00 00 0C 00 14 00 00 0C 00 14
> > > > > > ................
> > > > > > 0390: 00 00 12 20 06 0C 6C 07 00 00 0C E1 2D 00 00 0C ...
> > > > > > ..l.....-
> > > > > > ...
> > > > > > 03A0: 0A 00 00 00 0C 0A 00 00 00 0C 00 13 00 00 0C 00
> > > > > > ................
> > > > > > 03B0: 13 00 00 12 20 06 0C 08 07 00 00 0C 22 2B 00 00 ....
> > > > > > ......."+..
> > > > > > 03C0: 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 12 00 00 0C
> > > > > > ................
> > > > > > 03D0: 00 12 00 00 12 20 06 0C A4 06 00 00 0C E7 27 00 .....
> > > > > > .......'.
> > > > > > 03E0: 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 11 00 00
> > > > > > ................
> > > > > > 03F0: 0C 00 11 00 00 12 20 06 0C 40 06 00 00 0C 46 25
> > > > > > ......
> > > > > > ..@....F%
> > > > > > 0400:0
> > > > > >=20
> > > > > > Thanks,
> > > > > > Tobias Feldmeth-Walter
> > > > > >=20
> > > > > > Am Donnerstag, dem 12.11.2026 um 23:13 +0100 schrieb Armin
> > > > > > Wolf:
> > > > > > > Am 12.11.26 um 23:08 schrieb Tobias:
> > > > > > >=20
> > > > > > > > tobias@tobias-XPS:~$ acpidump
> > > > > > > > Could not open table file:
> > > > > > > > /sys/firmware/acpi/tables/SSDT4
> > > > > > > > Could not get ACPI tables, AE_ACCESS
> > > > > > > >=20
> > > > > > > > Thanks
> > > > > > > > Tobias Feldmeth-Walter
> > > > > > > You need root privileges.
> > > > > > >=20
> > > > > > > Thanks,
> > > > > > > Armin Wolf
> > > > > > >=20
> > > > > > > > Am Donnerstag, dem 12.11.2026 um 23:06 +0100 schrieb
> > > > > > > > Armin
> > > > > > > > Wolf:
> > > > > > > > > Am 12.11.26 um 23:03 schrieb Tobias:
> > > > > > > > >=20
> > > > > > > > > > Hello,
> > > > > > > > > >=20
> > > > > > > > > > thanks for the quick response.
> > > > > > > > > > thermald is already set up.
> > > > > > > > > >=20
> > > > > > > > > > tobias@tobias-XPS:~$ sudo apt install thermald
> > > > > > > > > > thermald is already the newest version (2.5.11-
> > > > > > > > > > 0ubuntu1.1).
> > > > > > > > > > thermald set to manually installed.
> > > > > > > > > > Summary:
> > > > > > > > > > Upgrade: 0, Install: 0, Remove: 0, Not upgraded: 44
> > > > > > > > > > tobias@tobias-XPS:~$ sudo systemctl enable --now
> > > > > > > > > > thermald
> > > > > > > > > > tobias@tobias-XPS:~$ sudo systemctl status thermald
> > > > > > > > > > =E2=97=8F thermald.service - Thermal Daemon Service
> > > > > > > > > > Loaded: loaded
> > > > > > > > > > (/usr/lib/systemd/system/thermald.service;
> > > > > > > > > > enabled;
> > > > > > > > > > preset: enabled)
> > > > > > > > > > Active: active (running) since Thu 2026-11-12
> > > > > > > > > > 21:46:07
> > > > > > > > > > CET;
> > > > > > > > > > 1h
> > > > > > > > > > 10min
> > > > > > > > > > ago
> > > > > > > > > > Invocation: ab085f7c1cae4d9aa4ae51d6ebe8ea5d
> > > > > > > > > > Main PID: 1274 (thermald)
> > > > > > > > > > Tasks: 5 (limit: 16591)
> > > > > > > > > > Memory: 3M (peak: 3.7M)
> > > > > > > > > > CPU: 17.761s
> > > > > > > > > > CGroup: /system.slice/thermald.service
> > > > > > > > > > =E2=94=94=E2=94=801274 /usr/sbin/thermald --systemd --d=
bus-enable -
> > > > > > > > > > -
> > > > > > > > > > adaptive
> > > > > > > > > >=20
> > > > > > > > > > Nov 12 21:46:06 tobias-XPS systemd[1]: Starting
> > > > > > > > > > thermald.service -
> > > > > > > > > > Thermal Daemon Service...
> > > > > > > > > > Nov 12 21:46:06 tobias-XPS thermald[1274]: 22 CPUID
> > > > > > > > > > levels;
> > > > > > > > > > family:model:stepping 0x6:8e:c (6:142:12)
> > > > > > > > > > Nov 12 21:46:07 tobias-XPS thermald[1274]: 22 CPUID
> > > > > > > > > > levels;
> > > > > > > > > > family:model:stepping 0x6:8e:c (6:142:12)
> > > > > > > > > > Nov 12 21:46:07 tobias-XPS thermald[1274]: Polling
> > > > > > > > > > mode
> > > > > > > > > > is
> > > > > > > > > > enabled:
> > > > > > > > > > 4
> > > > > > > > > > Nov 12 21:46:07 tobias-XPS systemd[1]: Started
> > > > > > > > > > thermald.service
> > > > > > > > > > -
> > > > > > > > > > Thermal Daemon Service.
> > > > > > > > > > Nov 12 22:56:29 tobias-XPS systemd[1]: Started
> > > > > > > > > > thermald.service
> > > > > > > > > > -
> > > > > > > > > > Thermal Daemon Service.
> > > > > > > > > >=20
> > > > > > > > > > Thanks for the feedback.
> > > > > > > > > > Regards,
> > > > > > > > > > Tobias Feldmeth-Walter
> > > > > > > > > Strange, can you please share the output of acpidump?
> > > > > > > > >=20
> > > > > > > > > Thanks,
> > > > > > > > > Armin Wolf
> > > > > > > > >=20
> > > > > > > > > > Am Donnerstag, dem 12.11.2026 um 22:52 +0100
> > > > > > > > > > schrieb
> > > > > > > > > > Armin
> > > > > > > > > > Wolf:
> > > > > > > > > > > Am 12.11.26 um 22:01 schrieb Tobias:
> > > > > > > > > > >=20
> > > > > > > > > > > > Hello,
> > > > > > > > > > > >=20
> > > > > > > > > > > > on my Dell XPS 13 7390 (BIOS 1.29.0,
> > > > > > > > > > > > 12/17/2024,
> > > > > > > > > > > > Ubuntu,
> > > > > > > > > > > > kernel
> > > > > > > > > > > > 7.0.0-
> > > > > > > > > > > > 43-generic) the embedded controller does not
> > > > > > > > > > > > engage
> > > > > > > > > > > > automatic
> > > > > > > > > > > > fan
> > > > > > > > > > > > control. In EC auto mode the fans stay at 0 RPM
> > > > > > > > > > > > even
> > > > > > > > > > > > under
> > > > > > > > > > > > full
> > > > > > > > > > > > CPU
> > > > > > > > > > > > load.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Observations:
> > > > > > > > > > > >=20
> > > > > > > > > > > > The dell_smm hwmon device is present, with
> > > > > > > > > > > > fan1/fan2
> > > > > > > > > > > > (fan*_min=3D0,
> > > > > > > > > > > > fan*_max=3D7300), pwm1, pwm1_enable, pwm2 and
> > > > > > > > > > > > temp1..temp7.
> > > > > > > > > > > > At idle (28=E2=80=9335 =C2=B0C) both fans report 0 =
RPM. This
> > > > > > > > > > > > is
> > > > > > > > > > > > expected.
> > > > > > > > > > > > Test: I stopped my userspace fan controller,
> > > > > > > > > > > > wrote
> > > > > > > > > > > > pwm1_enable=3D2
> > > > > > > > > > > > (accepted without error) and loaded all cores
> > > > > > > > > > > > with
> > > > > > > > > > > > yes
> > > > > > > > > > > > >=20
> > > > > > > > > > > > /dev/null.
> > > > > > > > > > > > CPU
> > > > > > > > > > > > package temperature rose from 34 =C2=B0C to 63 =C2=
=B0C
> > > > > > > > > > > > after
> > > > > > > > > > > > 5 s,
> > > > > > > > > > > > 73
> > > > > > > > > > > > =C2=B0C
> > > > > > > > > > > > after
> > > > > > > > > > > > 30
> > > > > > > > > > > > s and 82 =C2=B0C after 65 s, at which point I
> > > > > > > > > > > > aborted
> > > > > > > > > > > > the
> > > > > > > > > > > > test.
> > > > > > > > > > > > Both
> > > > > > > > > > > > fans
> > > > > > > > > > > > stayed at 0 RPM the whole time.
> > > > > > > > > > > > pwm1_enable cannot be read back (Permission
> > > > > > > > > > > > denied,
> > > > > > > > > > > > even as
> > > > > > > > > > > > root),
> > > > > > > > > > > > only
> > > > > > > > > > > > written.
> > > > > > > > > > > > Platform profile is balanced (choices: cool
> > > > > > > > > > > > quiet
> > > > > > > > > > > > balanced
> > > > > > > > > > > > performance). I did not test whether other
> > > > > > > > > > > > profiles
> > > > > > > > > > > > change
> > > > > > > > > > > > the
> > > > > > > > > > > > fan
> > > > > > > > > > > > behaviour.
> > > > > > > > > > > > thermald is running and has no effect on this.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Workaround: a small userspace daemon polls the
> > > > > > > > > > > > CPU
> > > > > > > > > > > > package
> > > > > > > > > > > > temperature
> > > > > > > > > > > > every 2 s and writes pwm1_enable=3D1 plus a PWM
> > > > > > > > > > > > value
> > > > > > > > > > > > to
> > > > > > > > > > > > pwm1/pwm2
> > > > > > > > > > > > (off
> > > > > > > > > > > > below 45 =C2=B0C, 128 from 50 =C2=B0C, 255 from 65 =
=C2=B0C,
> > > > > > > > > > > > with
> > > > > > > > > > > > hysteresis).
> > > > > > > > > > > > On
> > > > > > > > > > > > exit
> > > > > > > > > > > > it leaves the fans at full speed. With it, the
> > > > > > > > > > > > system
> > > > > > > > > > > > cools
> > > > > > > > > > > > normally.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Questions:
> > > > > > > > > > > >=20
> > > > > > > > > > > > Is this a known firmware issue on the XPS 13
> > > > > > > > > > > > 7390,
> > > > > > > > > > > > and
> > > > > > > > > > > > is
> > > > > > > > > > > > there
> > > > > > > > > > > > a
> > > > > > > > > > > > BIOS
> > > > > > > > > > > > version that fixes it?
> > > > > > > > > > > > Is a different SMM call needed on this model to
> > > > > > > > > > > > re-
> > > > > > > > > > > > enable
> > > > > > > > > > > > EC
> > > > > > > > > > > > auto
> > > > > > > > > > > > control, or should the driver do something on
> > > > > > > > > > > > probe/resume?
> > > > > > > > > > > > Which additional data would help? I can provide
> > > > > > > > > > > > dmidecode
> > > > > > > > > > > > and
> > > > > > > > > > > > sensors
> > > > > > > > > > > > output and test with dell_smm_hwmon module
> > > > > > > > > > > > options
> > > > > > > > > > > > (debug,
> > > > > > > > > > > > force,
> > > > > > > > > > > > restricted) if needed.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Thanks and best regards,
> > > > > > > > > > > > Tobias Feldmeth-Walter
> > > > > > > > > > > Hi,
> > > > > > > > > > >=20
> > > > > > > > > > > i think we had a similar case not too long ago,
> > > > > > > > > > > and
> > > > > > > > > > > the
> > > > > > > > > > > solution
> > > > > > > > > > > was
> > > > > > > > > > > to setup
> > > > > > > > > > > thermald.
> > > > > > > > > > >=20
> > > > > > > > > > > Thanks,
> > > > > > > > > > > Armin Wolf
