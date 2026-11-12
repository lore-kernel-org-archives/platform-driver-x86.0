Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.201.19.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794521804;
	b=WJL7Jv2Ul6XGbNT0s48WcCjuWlawd8caNOZO0kbpTAv4IIC8IzuCNCYvFVJutuviOVRT
	 lAIyA7TsMs6xAFfuOQQ6teycm+hNp/uh6YpVt2DcAtaCGN1zsYCIo8FhBvYm/eYsmbBVl
	 n/COWarXQSRbiGSEZZ7pbFfZAEpyWpHSRM5vTWs9WlD2wcyKr2vhzgjq9RpHSjDMVhqsg
	 yQmu6HWwUB22k9BWteah1lHx/VyHYGrSjsBa+3kq1k8bY/hnCcwejKcS224C74wLTZyEd
	 /u/TkFvHLmTGORa7sYjyIxwcbEVQpWh7HxPd0g4VfTE9ihpHybuwtYpB94/aSA9dA4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521804;
	h=DMARC-Filter:Received:Received:Received-SPF:Message-ID:Subject:From:
	 To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-PPP-Message-ID:
	 X-PPP-Vhost:X-Originating-IP:X-N-ableSpamExperts-Domain:
	 X-N-ableSpamExperts-Username:X-N-ableSpamExperts-Outgoing-Class:
	 X-N-ableSpamExperts-Outgoing-Evidence:X-Recommended-Action:
	 X-Filter-ID:X-Report-Abuse-To:X-Complaints-To;
	bh=Vj0s7rFsARD4kt14BY/R4KDdqOGF8uHO1LqFbmEex20=;
	b=ETMl7qcfzt1s19VGurVeFS3cAe31b0WjMoEbYHArPWJAnFsgNK/aZt86clb66mxUC92e
	 wDvb9GYG2Z/wajc26eF9OcfzbC9at2tH/nboyfXW3B6F2kTiFbiq9XhhOp3Z/tsl+2ajX
	 eRLg71Y18tMPlOtprEfIGyB83vpq8cA1dL5d47d1HSssPj27arxBIwhXe53ok0Tt7OrgW
	 /fYCB6XD9xit1tCvHbuOtkXy8Kkv0JJNHSyTSfY5cxuthP5UTuXl6pkls4bVMK/uNao03
	 pTtvqtB2PuNiTMtqch9LgNRY+tt1sO0pcKVa5aIfrYcFGVxMmdjlEcxse3Er2eMKKiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=feldmeth.de;
	spf=pass smtp.mailfrom=feldmeth.de;
	arc=none smtp.remote-ip=185.201.19.18
Received: from out15-18.antispamcloud.com (out15-18.antispamcloud.com [185.201.19.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA41606A31C
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 22:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FA41606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=feldmeth.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=feldmeth.de
Received: from www131.webspace.hosting ([195.242.102.131])
	by mx298.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <tobias@feldmeth.de>)
	id 1xRd8R-000Tzo-TZ; Thu, 12 Nov 2026 23:16:33 +0100
Received: from tobias-XPS.fritz.box (p5dd137f6.dip0.t-ipconnect.de [93.209.55.246])
	by www131.webspace.hosting (Postfix) with ESMTPSA id BF7F782571;
	Thu, 12 Nov 2026 23:16:30 +0100 (CET)
Authentication-Results: www131.webspace.hosting;
        spf=pass (sender IP is 93.209.55.246) smtp.mailfrom=tobias@feldmeth.de smtp.helo=tobias-XPS.fritz.box
Received-SPF: pass (www131.webspace.hosting: connection is authenticated)
Message-ID: <cb91fd25dcd8d5154916222113c20941c0e14127.camel@feldmeth.de>
Subject: Re: dell-smm-hwmon: Dell XPS 13 7390 =?UTF-8?Q?=E2=80=93?= fans
 never spin up in EC auto mode (CPU reaches 82 =?UTF-8?Q?=C2=B0C?= at 0 RPM)
From: Tobias <tobias@feldmeth.de>
To: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
Cc: pali@kernel.org
Date: Thu, 12 Nov 2026 23:16:29 +0100
In-Reply-To: <a7844c49-41cf-49ec-92af-a236e902afdc@gmx.de>
References: <412372e989bcb3d2376bc4437a9257bfe94ec850.camel@feldmeth.de>
	 <4c98aa15-c9a5-4e48-a9f4-66abba17744b@gmx.de>
	 <1ae16be741d52ae3cb79fdb014b88a5d778bbaea.camel@feldmeth.de>
	 <0303be37-e67e-46d2-973d-0111a0bf828e@gmx.de>
	 <d3d1bd34785a5cbe81f55d8a1bfd58b9806da5f6.camel@feldmeth.de>
	 <a7844c49-41cf-49ec-92af-a236e902afdc@gmx.de>
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
 <179452179107.1991249.12196001598994821866@www131.webspace.hosting>
X-PPP-Vhost: feldmeth.de
X-N-ableSpamExperts-Domain: www131.webspace.hosting
X-N-ableSpamExperts-Username: 195.242.102.131
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=195.242.102.131@www131.webspace.hosting
X-N-ableSpamExperts-Outgoing-Class: ham
X-N-ableSpamExperts-Outgoing-Evidence: Combined (0.05)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuWdkVtrL4oKCbXFmhQub+8pJtFuKt70+Avb
 M+c1JI3vICu2SmbhJN1U9FKs8X3+Nt2pRmlebSALpIQ19PKbPIpilZbyMm38AjouuRSQIqjxL9cV
 PSoHm0W/3adFfiYl2nvpfB5yWkzTTM0yqElRumhE0xFuTxT4zj7FZjRutUGTvzFyLdg06ZXED6UM
 nC21PwfXqeq4d9UOAhmwl3wi5kP0SWDshiesHrcEYBdmJouoxXXDj97PShRdxMQPCMeZ4aiRVYKU
 9W9tbmVXJBqdHHDmFMezBtsH+Fr5latICLxKTLVn5uVOziAob7UesvhGecnH3nfv/utnYfV8/jAb
 G6uKQ7uD0x/9Y/MF6exFt7k4K/hhiKkY5DM9o76pUDkoCG1MgBJQ06ZysZrotEbTlMSOLyi+iP6q
 F/sZfiHdy2sjhcLLzYa/aWu2M+Frs39a2pecgdLW1FiHdhy+9H6d8wNbt8C9mOBdONdnsxgsk1D2
 p3PDeigk86fj3jQywcHPhURFfRcBF4mo1QiiDttRPor8+VAiE6sDDd3gcu2iId2CZ43hxnsWt7dS
 hgOsXo3GkC53IT05PNbdeIwvWH1XotnfCAV4AnLnR+CLS7X5DFvk8Ea8fDgSYs8UeSpbn8mj1swg
 JoEZMUcYxZFeBZEze/nH++DuIQUs/5JJj4C/n4CILollNXE64uK2XGYetVICK7E7OPp+fmTU7CnU
 54DcPpTleC3uoypZ94mFl8ORpZy028tNxTwvt017lI023cYDLFwZsWd+KIcHhjWZ8sIUKX4X3uR7
 f9nIOaYL2j9xfQd174sEMysPur9wmiDBurOy6iS7stTs+Nx4X0bya+ndKS2/o91Ip8QP34qHrHbz
 0CzkmOhh8zKfWDx9hrDSUYNOxi/3cIxkCmm0m2f7d7tJwe66Ibtf63VNbf0lrvssY+k7AGWacor6
 hhipqzHUk46cBlSlyrS8lIlr3lB6va1r7f+29xEdIpc278bfjfGIPbnWt0KY+dKofFlyjX3/aDPB
 t+4Aqz4wRXbtpHLY3hLOKyM5cIvI/yiT5V5CRfRrHuSPppFVgpT1b21uZVckGp0ccOaQApPlf1et
 B+iXyZ7IO9sBY6RUnnc0zIYuhG/qTtiktYYMSfoTNKcPWld2iTglr0A=
X-Report-Abuse-To: spam@quarantine14.antispamcloud.com
X-Complaints-To: abuse@antispamcloud.com

Do you speak German?

This is the final block of the output. It does not all fit into the
console.

SSDT @ 0x0000000000000000
0000: 53 53 44 54 A2 05 00 00 02 A8 50 6D 52 65 66 00  SSDT......PmRef.
0010: 43 70 75 30 49 73 74 00 00 30 00 00 49 4E 54 4C Cpu0Ist..0..INTL=20
0020: 27 05 16 20 A0 31 00 15 5C 2E 5F 53 42 5F 4F 53 '.. .1..\._SB_OS=20
0030: 43 50 01 00 15 5C 54 43 4E 54 05 00 15 5C 2E 5F CP...\TCNT...\._=20
0040: 53 42 5F 43 50 50 43 05 00 15 5C 2E 5F 53 42 5F SB_CPPC...\._SB_=20
0050: 50 52 30 30 06 00 10 4B 54 5C 2E 5F 53 42 5F 50 PR00...KT\._SB_P=20
0060: 52 30 30 14 11 5F 50 50 43 00 A4 5C 2E 5F 53 42 R00.._PPC..\._SB=20
0070: 5F 43 50 50 43 08 5F 50 43 54 12 2C 02 11 14 0A _CPPC._PCT.,....=20
0080: 11 82 0C 00 7F 00 00 00 00 00 00 00 00 00 00 00 ................=20
0090: 79 00 11 14 0A 11 82 0C 00 7F 00 00 00 00 00 00 y...............=20
00A0: 00 00 00 00 00 79 00 14 23 5F 50 53 53 00 A0 15 .....y..#_PSS...=20
00B0: 7B 5C 2E 5F 53 42 5F 4F 53 43 50 0B 00 04 00 A4 {\._SB_OSCP.....=20
00C0: 54 50 53 53 A1 06 A4 4C 50 53 53 08 4C 50 53 53 TPSS...LPSS.LPSS=20
00D0: 12 43 21 10 12 20 06 0C FD 08 00 00 0C 98 3A 00 .C!.. ........:.=20
00E0: 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 31 00 00 .............1..=20
00F0: 0C 00 31 00 00 12 20 06 0C FC 08 00 00 0C 98 3A ..1... ........:=20
0100: 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 17 00 ................=20
0110: 00 0C 00 17 00 00 12 20 06 0C 98 08 00 00 0C 08 ....... ........=20
0120: 37 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 16 7...............=20
0130: 00 00 0C 00 16 00 00 12 20 06 0C D0 07 00 00 0C ........ .......=20
0140: AE 30 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 .0..............=20
0150: 14 00 00 0C 00 14 00 00 12 20 06 0C 08 07 00 00 ......... ......=20
0160: 0C 22 2B 00 00 0C 0A 00 00 00 0C 0A 00 00 00 0C ."+.............=20
0170: 00 12 00 00 0C 00 12 00 00 12 20 06 0C A4 06 00 .......... .....=20
0180: 00 0C E7 27 00 00 0C 0A 00 00 00 0C 0A 00 00 00 ...'............=20
0190: 0C 00 11 00 00 0C 00 11 00 00 12 20 06 0C 40 06 ........... ..@.=20
01A0: 00 00 0C 46 25 00 00 0C 0A 00 00 00 0C 0A 00 00 ...F%.........=20
01B0: 00 0C 00 10 00 00 0C 00 10 00 00 12 20 06 0C DC ............ ...=20
01C0: 05 00 00 0C B2 22 00 00 0C 0A 00 00 00 0C 0A 00
....."............=20
01D0: 00 00 0C 00 0F 00 00 0C 00 0F 00 00 12 20 06 0C ............. ..=20
01E0: 14 05 00 00 0C 2F 1D 00 00 0C 0A 00 00 00 0C 0A ...../........=20
01F0: 00 00 00 0C 00 0D 00 00 0C 00 0D 00 00 12 20 06 .............. .=20
0200: 0C B0 04 00 00 0C C7 1A 00 00 0C 0A 00 00 00 0C ................=20
0210: 0A 00 00 00 0C 00 0C 00 00 0C 00 0C 00 00 12 20 ...............=20
0220: 06 0C 4C 04 00 00 0C E9 17 00 00 0C 0A 00 00 00 ..L.............=20
0230: 0C 0A 00 00 00 0C 00 0B 00 00 0C 00 0B 00 00 12 ................=20
0240: 20 06 0C 84 03 00 00 0C 5B 13 00 00 0C 0A 00 00 .......[.......=20
0250: 00 0C 0A 00 00 00 0C 00 09 00 00 0C 00 09 00 00 ................=20
0260: 12 20 06 0C 20 03 00 00 0C AB 10 00 00 0C 0A 00 . .. ...........=20
0270: 00 00 0C 0A 00 00 00 0C 00 08 00 00 0C 00 08 00 ................=20
0280: 00 12 20 06 0C BC 02 00 00 0C 86 0E 00 00 0C 0A .. .............=20
0290: 00 00 00 0C 0A 00 00 00 0C 00 07 00 00 0C 00 07 ................=20
02A0: 00 00 12 20 06 0C F4 01 00 00 0C EA 09 00 00 0C ... ............=20
02B0: 0A 00 00 00 0C 0A 00 00 00 0C 00 05 00 00 0C 00 ................=20
02C0: 05 00 00 12 20 06 0C 90 01 00 00 0C EC 07 00 00 .... ...........=20
02D0: 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 04 00 00 0C ................=20
02E0: 00 04 00 00 08 54 50 53 53 12 48 2B 15 12 20 06 .....TPSS.H+.. .=20
02F0: 0C FD 08 00 00 0C 98 3A 00 00 0C 0A 00 00 00 0C ......:........=20
0300: 0A 00 00 00 0C 00 31 00 00 0C 00 31 00 00 12 20 ......1....1...=20
0310: 06 0C FC 08 00 00 0C 98 3A 00 00 0C 0A 00 00 00 ........:.......=20
0320: 0C 0A 00 00 00 0C 00 17 00 00 0C 00 17 00 00 12 ................=20
0330: 20 06 0C 98 08 00 00 0C 08 37 00 00 0C 0A 00 00 ........7......=20
0340: 00 0C 0A 00 00 00 0C 00 16 00 00 0C 00 16 00 00 ................=20
0350: 12 20 06 0C 34 08 00 00 0C 1C 34 00 00 0C 0A 00 . ..4.....4.....=20
0360: 00 00 0C 0A 00 00 00 0C 00 15 00 00 0C 00 15 00 ................=20
0370: 00 12 20 06 0C D0 07 00 00 0C AE 30 00 00 0C 0A .. ........0....=20
0380: 00 00 00 0C 0A 00 00 00 0C 00 14 00 00 0C 00 14 ................=20
0390: 00 00 12 20 06 0C 6C 07 00 00 0C E1 2D 00 00 0C ... ..l.....-...=20
03A0: 0A 00 00 00 0C 0A 00 00 00 0C 00 13 00 00 0C 00 ................=20
03B0: 13 00 00 12 20 06 0C 08 07 00 00 0C 22 2B 00 00 .... ......."+..=20
03C0: 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 12 00 00 0C ................=20
03D0: 00 12 00 00 12 20 06 0C A4 06 00 00 0C E7 27 00 ..... .......'.=20
03E0: 00 0C 0A 00 00 00 0C 0A 00 00 00 0C 00 11 00 00 ................=20
03F0: 0C 00 11 00 00 12 20 06 0C 40 06 00 00 0C 46 25 ...... ..@....F%=20
0400:0

Thanks,
Tobias Feldmeth-Walter

Am Donnerstag, dem 12.11.2026 um 23:13 +0100 schrieb Armin Wolf:
> Am 12.11.26 um 23:08 schrieb Tobias:
>=20
> > tobias@tobias-XPS:~$ acpidump
> > Could not open table file: /sys/firmware/acpi/tables/SSDT4
> > Could not get ACPI tables, AE_ACCESS
> >=20
> > Thanks
> > Tobias Feldmeth-Walter
>=20
> You need root privileges.
>=20
> Thanks,
> Armin Wolf
>=20
> > Am Donnerstag, dem 12.11.2026 um 23:06 +0100 schrieb Armin Wolf:
> > > Am 12.11.26 um 23:03 schrieb Tobias:
> > >=20
> > > > Hello,
> > > >=20
> > > > thanks for the quick response.
> > > > thermald is already set up.
> > > >=20
> > > > tobias@tobias-XPS:~$ sudo apt install thermald
> > > > thermald is already the newest version (2.5.11-0ubuntu1.1).
> > > > thermald set to manually installed.
> > > > Summary:
> > > > Upgrade: 0, Install: 0, Remove: 0, Not upgraded: 44
> > > > tobias@tobias-XPS:~$ sudo systemctl enable --now thermald
> > > > tobias@tobias-XPS:~$ sudo systemctl status thermald
> > > > =E2=97=8F thermald.service - Thermal Daemon Service
> > > > Loaded: loaded (/usr/lib/systemd/system/thermald.service;
> > > > enabled;
> > > > preset: enabled)
> > > > Active: active (running) since Thu 2026-11-12 21:46:07 CET; 1h
> > > > 10min
> > > > ago
> > > > Invocation: ab085f7c1cae4d9aa4ae51d6ebe8ea5d
> > > > Main PID: 1274 (thermald)
> > > > Tasks: 5 (limit: 16591)
> > > > Memory: 3M (peak: 3.7M)
> > > > CPU: 17.761s
> > > > CGroup: /system.slice/thermald.service
> > > > =E2=94=94=E2=94=801274 /usr/sbin/thermald --systemd --dbus-enable -=
-adaptive
> > > >=20
> > > > Nov 12 21:46:06 tobias-XPS systemd[1]: Starting
> > > > thermald.service -
> > > > Thermal Daemon Service...
> > > > Nov 12 21:46:06 tobias-XPS thermald[1274]: 22 CPUID levels;
> > > > family:model:stepping 0x6:8e:c (6:142:12)
> > > > Nov 12 21:46:07 tobias-XPS thermald[1274]: 22 CPUID levels;
> > > > family:model:stepping 0x6:8e:c (6:142:12)
> > > > Nov 12 21:46:07 tobias-XPS thermald[1274]: Polling mode is
> > > > enabled:
> > > > 4
> > > > Nov 12 21:46:07 tobias-XPS systemd[1]: Started thermald.service
> > > > -
> > > > Thermal Daemon Service.
> > > > Nov 12 22:56:29 tobias-XPS systemd[1]: Started thermald.service
> > > > -
> > > > Thermal Daemon Service.
> > > >=20
> > > > Thanks for the feedback.
> > > > Regards,
> > > > Tobias Feldmeth-Walter
> > > Strange, can you please share the output of acpidump?
> > >=20
> > > Thanks,
> > > Armin Wolf
> > >=20
> > > > Am Donnerstag, dem 12.11.2026 um 22:52 +0100 schrieb Armin
> > > > Wolf:
> > > > > Am 12.11.26 um 22:01 schrieb Tobias:
> > > > >=20
> > > > > > Hello,
> > > > > >=20
> > > > > > on my Dell XPS 13 7390 (BIOS 1.29.0, 12/17/2024, Ubuntu,
> > > > > > kernel
> > > > > > 7.0.0-
> > > > > > 43-generic) the embedded controller does not engage
> > > > > > automatic
> > > > > > fan
> > > > > > control. In EC auto mode the fans stay at 0 RPM even under
> > > > > > full
> > > > > > CPU
> > > > > > load.
> > > > > >=20
> > > > > > Observations:
> > > > > >=20
> > > > > > The dell_smm hwmon device is present, with fan1/fan2
> > > > > > (fan*_min=3D0,
> > > > > > fan*_max=3D7300), pwm1, pwm1_enable, pwm2 and temp1..temp7.
> > > > > > At idle (28=E2=80=9335 =C2=B0C) both fans report 0 RPM. This is
> > > > > > expected.
> > > > > > Test: I stopped my userspace fan controller, wrote
> > > > > > pwm1_enable=3D2
> > > > > > (accepted without error) and loaded all cores with yes >
> > > > > > /dev/null.
> > > > > > CPU
> > > > > > package temperature rose from 34 =C2=B0C to 63 =C2=B0C after 5 =
s, 73
> > > > > > =C2=B0C
> > > > > > after
> > > > > > 30
> > > > > > s and 82 =C2=B0C after 65 s, at which point I aborted the test.
> > > > > > Both
> > > > > > fans
> > > > > > stayed at 0 RPM the whole time.
> > > > > > pwm1_enable cannot be read back (Permission denied, even as
> > > > > > root),
> > > > > > only
> > > > > > written.
> > > > > > Platform profile is balanced (choices: cool quiet balanced
> > > > > > performance). I did not test whether other profiles change
> > > > > > the
> > > > > > fan
> > > > > > behaviour.
> > > > > > thermald is running and has no effect on this.
> > > > > >=20
> > > > > > Workaround: a small userspace daemon polls the CPU package
> > > > > > temperature
> > > > > > every 2 s and writes pwm1_enable=3D1 plus a PWM value to
> > > > > > pwm1/pwm2
> > > > > > (off
> > > > > > below 45 =C2=B0C, 128 from 50 =C2=B0C, 255 from 65 =C2=B0C, wit=
h
> > > > > > hysteresis).
> > > > > > On
> > > > > > exit
> > > > > > it leaves the fans at full speed. With it, the system cools
> > > > > > normally.
> > > > > >=20
> > > > > > Questions:
> > > > > >=20
> > > > > > Is this a known firmware issue on the XPS 13 7390, and is
> > > > > > there
> > > > > > a
> > > > > > BIOS
> > > > > > version that fixes it?
> > > > > > Is a different SMM call needed on this model to re-enable
> > > > > > EC
> > > > > > auto
> > > > > > control, or should the driver do something on probe/resume?
> > > > > > Which additional data would help? I can provide dmidecode
> > > > > > and
> > > > > > sensors
> > > > > > output and test with dell_smm_hwmon module options (debug,
> > > > > > force,
> > > > > > restricted) if needed.
> > > > > >=20
> > > > > > Thanks and best regards,
> > > > > > Tobias Feldmeth-Walter
> > > > > Hi,
> > > > >=20
> > > > > i think we had a similar case not too long ago, and the
> > > > > solution
> > > > > was
> > > > > to setup
> > > > > thermald.
> > > > >=20
> > > > > Thanks,
> > > > > Armin Wolf
