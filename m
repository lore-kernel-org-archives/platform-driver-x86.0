Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.201.19.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794521334;
	b=S+LF3WXMJo7enMNURXEhVfSRAupX71yaKC6kjjehQ4VJRmTsUdt5OL/iV23bIT+3UVfp
	 l4BuXutCknQsK47a6g5GskXcvfEPeqA8PO7bcW1v7Ry8G8DRVHS0ZB+DW+dEDQcHXVEbY
	 XtIMzq4GT7pHHGyaoEBde/xSw9slaF2NjUUdDRjCJwN8L9kptK3OvnIdSUbI8oCYDZGnD
	 H7Rb/aLgfu+I81TUlseWpG5zciYuF+rUtXVxqLBRQwJXTGfsZnfpNZCkgS6wHjAxdKN8k
	 gUlmyScMTtrEqLhaxh4ixEMqFwAc7K/xC/I79nqe7z6eD1RqqGs4oflhnLBpz82I+sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521334;
	h=DMARC-Filter:Received:Received:Received-SPF:Message-ID:Subject:From:
	 To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-PPP-Message-ID:
	 X-PPP-Vhost:X-Originating-IP:X-N-ableSpamExperts-Domain:
	 X-N-ableSpamExperts-Username:X-N-ableSpamExperts-Outgoing-Class:
	 X-N-ableSpamExperts-Outgoing-Evidence:X-Recommended-Action:
	 X-Filter-ID:X-Report-Abuse-To:X-Complaints-To;
	bh=fM7FL1P3lvGYV1dAhsCl9pCKblnLUJX/crAx2djgpkc=;
	b=Kd0bb4/9shmJLRBPibCNQt9NMGNrRFvhG1rfufDs3sIxeObzuhcrru+tEKZw/vVY5Mjw
	 e2cRaIk1gLJEod9Q4LhBShsUupy/F9pSmlf+xa3FiXQwJPsPQhKe1m9GNng8cGpsHFzKE
	 zMk15x+RyhqszkMLPDHLoO7ByJTVYHLTvU5/ZwFTZ2VtdDSNyyM83NwPAPWGXvkQuqB7d
	 JOC9uJ9yRmIQ/X9GzAy+HH/FHSJikKuUuS+OGd6adUPhp6PMkf3V8I3Rp9RaCor2vxRAA
	 IA0b/j5Ipg/GCmaS35s2IBQzCzNQWXD52unSqsNqzI63A/mWGiWvf0g6nq+1m4s6Hnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=feldmeth.de;
	spf=pass smtp.mailfrom=feldmeth.de;
	arc=none smtp.remote-ip=185.201.19.185
Received: from out15-185.antispamcloud.com (out15-185.antispamcloud.com [185.201.19.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C766D606A321
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 22:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C766D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=feldmeth.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=feldmeth.de
Received: from www131.webspace.hosting ([195.242.102.131])
	by mx298.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <tobias@feldmeth.de>)
	id 1xRd0t-000QDb-FV; Thu, 12 Nov 2026 23:08:46 +0100
Received: from tobias-XPS.fritz.box (p5dd137f6.dip0.t-ipconnect.de [93.209.55.246])
	by www131.webspace.hosting (Postfix) with ESMTPSA id 3349A8668F;
	Thu, 12 Nov 2026 23:08:42 +0100 (CET)
Authentication-Results: www131.webspace.hosting;
        spf=pass (sender IP is 93.209.55.246) smtp.mailfrom=tobias@feldmeth.de smtp.helo=tobias-XPS.fritz.box
Received-SPF: pass (www131.webspace.hosting: connection is authenticated)
Message-ID: <d3d1bd34785a5cbe81f55d8a1bfd58b9806da5f6.camel@feldmeth.de>
Subject: Re: dell-smm-hwmon: Dell XPS 13 7390 =?UTF-8?Q?=E2=80=93?= fans
 never spin up in EC auto mode (CPU reaches 82 =?UTF-8?Q?=C2=B0C?= at 0 RPM)
From: Tobias <tobias@feldmeth.de>
To: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
Cc: pali@kernel.org
Date: Thu, 12 Nov 2026 23:08:41 +0100
In-Reply-To: <0303be37-e67e-46d2-973d-0111a0bf828e@gmx.de>
References: <412372e989bcb3d2376bc4437a9257bfe94ec850.camel@feldmeth.de>
	 <4c98aa15-c9a5-4e48-a9f4-66abba17744b@gmx.de>
	 <1ae16be741d52ae3cb79fdb014b88a5d778bbaea.camel@feldmeth.de>
	 <0303be37-e67e-46d2-973d-0111a0bf828e@gmx.de>
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
 <179452132248.1985567.9826686649657233575@www131.webspace.hosting>
X-PPP-Vhost: feldmeth.de
X-N-ableSpamExperts-Domain: www131.webspace.hosting
X-N-ableSpamExperts-Username: 195.242.102.131
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=195.242.102.131@www131.webspace.hosting
X-N-ableSpamExperts-Outgoing-Class: ham
X-N-ableSpamExperts-Outgoing-Evidence: Combined (0.04)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuUZfUar3NplIuStDZSVCWcjagfiwTn1H1Pa
 H8j6aZXvfyu2SmbhJN1U9FKs8X3+Nt2pRmlebSALpIQ19PKbPIpilZbyMm38AjouuRSQIqjxL9cV
 PSoHm0W/3adFfiYl2nt1NN/h/48E0SsmrJbgFIqj0xFuTxT4zj7FZjRutUGTvzFyLdg06ZXED6UM
 nC21PwfXqeq4d9UOAhmwl3wi5kP0SWDshiesHrcEYBdmJouoxXXDj97PShRdxMQPCMeZ4aiRVYKU
 9W9tbmVXJBqdHHDmFMezBtsH+Fr5latICLxKTLVn5uVOziAob7UesvhGecnH3nfv/utnYfV8/jAb
 G6uKQ7uD0x/9Y/MF6exFt7k4K/hhiKkY5DM9o76pUDkoCG1MgBJQ06ZysZrotEbTlMSOLyi+iP6q
 F/sZfiHdy2sjhcLLzYa/aWu2M+Frs39a2pecgdLW1FiHdhy+9H6d8wNbt8C9mOBdONdnsxgsk1D2
 p3PDeigk86fj3jQywcHPhURFfRcBF4mo1QiiDttRPor8+VAiE6sDDd3gcu2iId2CZ43hxnsWt7dS
 hgOsXo3GkC53IT05PNbdeIwvWH1XotnfCAV4AnLnR+CLS7X5DFvk8Ea8fDgSYs8UeSpbn8mj1swg
 JoEZMUcYxZFeBZEze/nH++DuIQUs/5JJj4C/n4CILollNXE64uK2XGYetVICK7E7OPp+fmTU7CnU
 54DcPpTl7+d2emIoqTodwQRlJd9w58tNxTwvt017lI023cYDLFwZsWd+KIcHhjWZ8sIUKX4X3uR7
 f9nIOaYL2j9xfQd174sEMysPur9wmiDBurOy6iS7stTs+Nx4X0bya+ndKS2/o91Ip8QP34qHrHbz
 0CzkmJolEPtSvEb1PHet/ZVei6HDJZFZk7D+hjVDZ1gxZXKfIbtf63VNbf0lrvssY+k7AGWacor6
 hhipqzHUk46cBlSlyrS8lIlr3lB6va1r7f+29xEdIpc278bfjfGIPbnWt0KY+dKofFlyjX3/aDPB
 t+4Aqz4wRXbtpHLY3hLOKyM5cIvI/yiT5V5CRfRrHuSPppFVgpT1b21uZVckGp0ccOaQApPlf1et
 B+iXyZ7IO9sBY6RUnnc0zIYuhG/qTtiktYYMSfoTNKcPWld2iTglr0A=
X-Report-Abuse-To: spam@quarantine14.antispamcloud.com
X-Complaints-To: abuse@antispamcloud.com

tobias@tobias-XPS:~$ acpidump
Could not open table file: /sys/firmware/acpi/tables/SSDT4
Could not get ACPI tables, AE_ACCESS

Thanks
Tobias Feldmeth-Walter

Am Donnerstag, dem 12.11.2026 um 23:06 +0100 schrieb Armin Wolf:
> Am 12.11.26 um 23:03 schrieb Tobias:
>=20
> > Hello,
> >=20
> > thanks for the quick response.
> > thermald is already set up.
> >=20
> > tobias@tobias-XPS:~$ sudo apt install thermald
> > thermald is already the newest version (2.5.11-0ubuntu1.1).
> > thermald set to manually installed.
> > Summary:
> > Upgrade: 0, Install: 0, Remove: 0, Not upgraded: 44
> > tobias@tobias-XPS:~$ sudo systemctl enable --now thermald
> > tobias@tobias-XPS:~$ sudo systemctl status thermald
> > =E2=97=8F thermald.service - Thermal Daemon Service
> > Loaded: loaded (/usr/lib/systemd/system/thermald.service; enabled;
> > preset: enabled)
> > Active: active (running) since Thu 2026-11-12 21:46:07 CET; 1h
> > 10min
> > ago
> > Invocation: ab085f7c1cae4d9aa4ae51d6ebe8ea5d
> > Main PID: 1274 (thermald)
> > Tasks: 5 (limit: 16591)
> > Memory: 3M (peak: 3.7M)
> > CPU: 17.761s
> > CGroup: /system.slice/thermald.service
> > =E2=94=94=E2=94=801274 /usr/sbin/thermald --systemd --dbus-enable --ada=
ptive
> >=20
> > Nov 12 21:46:06 tobias-XPS systemd[1]: Starting thermald.service -
> > Thermal Daemon Service...
> > Nov 12 21:46:06 tobias-XPS thermald[1274]: 22 CPUID levels;
> > family:model:stepping 0x6:8e:c (6:142:12)
> > Nov 12 21:46:07 tobias-XPS thermald[1274]: 22 CPUID levels;
> > family:model:stepping 0x6:8e:c (6:142:12)
> > Nov 12 21:46:07 tobias-XPS thermald[1274]: Polling mode is enabled:
> > 4
> > Nov 12 21:46:07 tobias-XPS systemd[1]: Started thermald.service -
> > Thermal Daemon Service.
> > Nov 12 22:56:29 tobias-XPS systemd[1]: Started thermald.service -
> > Thermal Daemon Service.
> >=20
> > Thanks for the feedback.
> > Regards,
> > Tobias Feldmeth-Walter
>=20
> Strange, can you please share the output of acpidump?
>=20
> Thanks,
> Armin Wolf
>=20
> > Am Donnerstag, dem 12.11.2026 um 22:52 +0100 schrieb Armin Wolf:
> > > Am 12.11.26 um 22:01 schrieb Tobias:
> > >=20
> > > > Hello,
> > > >=20
> > > > on my Dell XPS 13 7390 (BIOS 1.29.0, 12/17/2024, Ubuntu, kernel
> > > > 7.0.0-
> > > > 43-generic) the embedded controller does not engage automatic
> > > > fan
> > > > control. In EC auto mode the fans stay at 0 RPM even under full
> > > > CPU
> > > > load.
> > > >=20
> > > > Observations:
> > > >=20
> > > > The dell_smm hwmon device is present, with fan1/fan2
> > > > (fan*_min=3D0,
> > > > fan*_max=3D7300), pwm1, pwm1_enable, pwm2 and temp1..temp7.
> > > > At idle (28=E2=80=9335 =C2=B0C) both fans report 0 RPM. This is exp=
ected.
> > > > Test: I stopped my userspace fan controller, wrote
> > > > pwm1_enable=3D2
> > > > (accepted without error) and loaded all cores with yes >
> > > > /dev/null.
> > > > CPU
> > > > package temperature rose from 34 =C2=B0C to 63 =C2=B0C after 5 s, 7=
3 =C2=B0C
> > > > after
> > > > 30
> > > > s and 82 =C2=B0C after 65 s, at which point I aborted the test. Bot=
h
> > > > fans
> > > > stayed at 0 RPM the whole time.
> > > > pwm1_enable cannot be read back (Permission denied, even as
> > > > root),
> > > > only
> > > > written.
> > > > Platform profile is balanced (choices: cool quiet balanced
> > > > performance). I did not test whether other profiles change the
> > > > fan
> > > > behaviour.
> > > > thermald is running and has no effect on this.
> > > >=20
> > > > Workaround: a small userspace daemon polls the CPU package
> > > > temperature
> > > > every 2 s and writes pwm1_enable=3D1 plus a PWM value to
> > > > pwm1/pwm2
> > > > (off
> > > > below 45 =C2=B0C, 128 from 50 =C2=B0C, 255 from 65 =C2=B0C, with hy=
steresis).
> > > > On
> > > > exit
> > > > it leaves the fans at full speed. With it, the system cools
> > > > normally.
> > > >=20
> > > > Questions:
> > > >=20
> > > > Is this a known firmware issue on the XPS 13 7390, and is there
> > > > a
> > > > BIOS
> > > > version that fixes it?
> > > > Is a different SMM call needed on this model to re-enable EC
> > > > auto
> > > > control, or should the driver do something on probe/resume?
> > > > Which additional data would help? I can provide dmidecode and
> > > > sensors
> > > > output and test with dell_smm_hwmon module options (debug,
> > > > force,
> > > > restricted) if needed.
> > > >=20
> > > > Thanks and best regards,
> > > > Tobias Feldmeth-Walter
> > > Hi,
> > >=20
> > > i think we had a similar case not too long ago, and the solution
> > > was
> > > to setup
> > > thermald.
> > >=20
> > > Thanks,
> > > Armin Wolf
