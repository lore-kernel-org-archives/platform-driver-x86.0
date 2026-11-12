Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.201.19.191
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794517282;
	b=DWRAMgftQrSDkTCysFU/IP55YdJdAeOeQwaf9wFqZxr0rvMBpwtN8YYU9pLW6Qzuz6wF
	 GXLvOOUG8ghPJ63+C2EPDrJi0UfGiS/BlI+MHNmKYAWSIXiqEBisqNqCBKASH67mwviXt
	 HvThaYoyTuacDmOAuuugN/Eij2UsGk+ouuosCb9E7bUNOMRFvuWAXGDqqaly6/8x9/nD9
	 ZZxAfHqoLmtbMk1PKtw+NEqR7eaLme+NARvYyffFeEOfsRMrQSqse3hwOJHDG84WUsKoY
	 vYGurzLiyCrUwmmTIV+PJ+y5ise9qD1KrFykYpM5dV0ywqHltP06uVNbJoFdkHoNL9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517282;
	h=DMARC-Filter:Received:Received:Received-SPF:Message-ID:Subject:From:
	 To:Cc:Date:Disposition-Notification-To:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-PPP-Message-ID:
	 X-PPP-Vhost:X-Originating-IP:X-N-ableSpamExperts-Domain:
	 X-N-ableSpamExperts-Username:X-N-ableSpamExperts-Outgoing-Class:
	 X-N-ableSpamExperts-Outgoing-Evidence:X-Recommended-Action:
	 X-Filter-ID:X-Report-Abuse-To:X-Complaints-To;
	bh=9immSZOD87dCypLWchrdrPTqBUoshVr20N6AqKGy0t0=;
	b=DVv6VD3cQbRCLueuMXFoA3nEwN3fISd36f/mDk4vjA9ET0uu+BxFIvJHvOZRnxrYF3fP
	 EdTgba0eyFXTJ8kilYjsEwPWRL48yn1zo7SxO1fUppbUvyzAJs/N2zY/OPJWrfSUY0ieg
	 hLzaocc1dAGMeMQ80paf7KgiGvRLyIZUfxS9D4aimeD+tOhUT9Uf2w8/J2Y6MCHKhfNWN
	 KAx+9IJbwXR1MM3ErsjbO/s9USleJBXFiHoXCC3ju8LIa+pc8ZVyNEWmOCC57S4dARfUj
	 MhZYlXRNO8jA1s/26m5nvZ2K1rbljR2Fr56L3RSUYiSbRstTd6eDbQbdejM50/LSEvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=feldmeth.de;
	spf=pass smtp.mailfrom=feldmeth.de;
	arc=none smtp.remote-ip=185.201.19.191
Received: from out15-191.antispamcloud.com (out15-191.antispamcloud.com [185.201.19.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1105606A321
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 21:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1105606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=feldmeth.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=feldmeth.de
Received: from www131.webspace.hosting ([195.242.102.131])
	by mx294.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <tobias@feldmeth.de>)
	id 1xRbuq-00Dscu-0e; Thu, 12 Nov 2026 22:01:06 +0100
Received: from tobias-XPS.fritz.box (p5dd137f6.dip0.t-ipconnect.de [93.209.55.246])
	by www131.webspace.hosting (Postfix) with ESMTPSA id B46E7866B6;
	Thu, 12 Nov 2026 22:01:02 +0100 (CET)
Authentication-Results: www131.webspace.hosting;
        spf=pass (sender IP is 93.209.55.246) smtp.mailfrom=tobias@feldmeth.de smtp.helo=tobias-XPS.fritz.box
Received-SPF: pass (www131.webspace.hosting: connection is authenticated)
Message-ID: <412372e989bcb3d2376bc4437a9257bfe94ec850.camel@feldmeth.de>
Subject: dell-smm-hwmon: Dell XPS 13 7390 =?UTF-8?Q?=E2=80=93?= fans never
 spin up in EC auto mode (CPU reaches 82 =?UTF-8?Q?=C2=B0C?= at 0 RPM)
From: Tobias <tobias@feldmeth.de>
To: platform-driver-x86@vger.kernel.org
Cc: W_Armin@gmx.de, pali@kernel.org
Date: Thu, 12 Nov 2026 22:01:02 +0100
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
 <179451726300.1918265.2976691183246060007@www131.webspace.hosting>
X-PPP-Vhost: feldmeth.de
X-N-ableSpamExperts-Domain: www131.webspace.hosting
X-N-ableSpamExperts-Username: 195.242.102.131
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=195.242.102.131@www131.webspace.hosting
X-N-ableSpamExperts-Outgoing-Class: ham
X-N-ableSpamExperts-Outgoing-Evidence: Combined (0.07)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuXGhrAjtRMA38q4afffC8LhZtdY4an1cgMF
 sMZL03Hctyu2SmbhJN1U9FKs8X3+Nt2pRmlebSALpIQ19PKbPIpilZbyMm38AjouuRSQIqjxL9cV
 PSoHm0W/3adFfiYl2numgqmqhGsbtbKyB9oCx22u0xFuTxT4zj7FZjRutUGTvzFyLdg06ZXED6UM
 nC21PwfXqeq4d9UOAhmwl3wi5kP0SWDshiesHrcEYBdmJouoxVhCb5pPGZiFDLd++yjSyMCRVYKU
 9W9tbmVXJBqdHHDmFMezBtsH+Fr5latICLxKTLVn5uVOziAob7UesvhGecnH3nfv/utnYfV8/jAb
 G6uKQ7uD0x/9Y/MF6exFt7k4K/hhiKkY5DM9o76pUDkoCG1MgBJQ06ZysZrotEbTlMSOLyi+iP6q
 F/sZfiHdy2sjhcLLzYa/aWu2M+Frs39a2pecgdLW1FiHdhy+9H6d8wNbt8C9mOBdONdnsxgsk1D2
 p3PDeigk86fj3jQywcHPhURFfRcBF4mo1QiiDttRPor8+VAiE6sDDd3gcu2iId2CZ43hxnsWt7dS
 hgOsXo3GkC53IT05PNbdeIwvWH1XotnfCAV4AnLnR+CLS7X5DFvk8Ea8fDgSYs8UeSpbn8mj1swg
 JoEZMUcYxZFeBZEze/nH++DuIQUs/5JJj4C/n4CILjxuIh8qTfO6qZt5CzBwP4tSO6midWr+Zq99
 81Psv2yTFn3cSKxlzZLFVMK9GpkuRp/ZEFdgfl/gg4TaPUbxShTMcBD+xgRcQ+e8uudAGzOaK45l
 +jUTbuIYv2jJlQ/BvPdjzQ6YC7Heg3Xf7O1TOd4CH5ECrSLFh2HCgica+BGSvkainE8H6zlmDx3V
 YDvijm74zir6iGPriIuaZMcqU+GzJI08tx0Crd0/OBtNxm3KctgzcDoFd+96Xw4QUNtTnVVZLFVw
 6Dmnj3QCRGIK6hdCRj4ywSA0O+Ogz6LfGp3ThR9AdpeKaPilpr2EXra32z7oTjUHHkoBY97heHiF
 slup2WfZg2TjRY4KmuGwUkkLyL5t17QvLNvMpzWnzJcUvCERbInMiTBIUBbQ/Dy6Ip5M3CX+EMng
 eOWzKGDI8fgeEhyHH+vrgzY0G4w7kRbdyi1XjqQpAPwxr6GC+a8l8Lg=
X-Report-Abuse-To: spam@quarantine14.antispamcloud.com
X-Complaints-To: abuse@antispamcloud.com

Hello,

on my Dell XPS 13 7390 (BIOS 1.29.0, 12/17/2024, Ubuntu, kernel 7.0.0-
43-generic) the embedded controller does not engage automatic fan
control. In EC auto mode the fans stay at 0 RPM even under full CPU
load.

Observations:

The dell_smm hwmon device is present, with fan1/fan2 (fan*_min=3D0,
fan*_max=3D7300), pwm1, pwm1_enable, pwm2 and temp1..temp7.
At idle (28=E2=80=9335 =C2=B0C) both fans report 0 RPM. This is expected.
Test: I stopped my userspace fan controller, wrote pwm1_enable=3D2
(accepted without error) and loaded all cores with yes > /dev/null. CPU
package temperature rose from 34 =C2=B0C to 63 =C2=B0C after 5 s, 73 =C2=B0=
C after 30
s and 82 =C2=B0C after 65 s, at which point I aborted the test. Both fans
stayed at 0 RPM the whole time.
pwm1_enable cannot be read back (Permission denied, even as root), only
written.
Platform profile is balanced (choices: cool quiet balanced
performance). I did not test whether other profiles change the fan
behaviour.
thermald is running and has no effect on this.

Workaround: a small userspace daemon polls the CPU package temperature
every 2 s and writes pwm1_enable=3D1 plus a PWM value to pwm1/pwm2 (off
below 45 =C2=B0C, 128 from 50 =C2=B0C, 255 from 65 =C2=B0C, with hysteresis=
). On exit
it leaves the fans at full speed. With it, the system cools normally.

Questions:

Is this a known firmware issue on the XPS 13 7390, and is there a BIOS
version that fixes it?
Is a different SMM call needed on this model to re-enable EC auto
control, or should the driver do something on probe/resume?
Which additional data would help? I can provide dmidecode and sensors
output and test with dell_smm_hwmon module options (debug, force,
restricted) if needed.

Thanks and best regards,
Tobias Feldmeth-Walter
