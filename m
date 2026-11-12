Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520363;
	b=USN2JNVSexUZf7KjWZ0idvA4IaCgw8+xfkOkp9NH5ioziU3h9oC9FZNrIaVfC/Tsc49t
	 8v9xIVYUocfXYCdPY6GrFVPRhmBcpF41vM5XudNgDHG3smf2etIcRyOy9TrBhZs/To2Ot
	 3BgK/EwBTp9be7bg5usB8jcmxNkZ9h1PeICgxOxJJfwQuloovoh1SUw2VGqnemPxY7keK
	 p1g2VpgLaa6OKGKipDnLA+XJVY1YNmej3L/T3rdkTGjbG7pJMxTgsniwd78iQdnENSV1e
	 AisGlQUa9iZ2WirYFKd+Q2w2qiPv7zAQDjojuT4eqk4ZRvEAl0PiwlnJ2xZcBo9H2Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520363;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=4vvoGZLnoqIORl+4qvO3Owlh3k5Oc55CaII8ii80AlE=;
	b=P2PSvWnKeqQX2okwxpEsRJ1gCyLq9mgSmKDgbqnPobSsr+BLZLwxm+SLca1D/7HZCqiU
	 J0IaCEHgwYSpxftFtf7f2uVTyWSGJyDyyf3FjCTcoK1CglccFfml3W62sx2lmiy1k7Zjy
	 s2WWGKrWGJmjMuTffO9624ftjhwwTTL4nRNiXBNpf2BoatAoqyfNiFjbgJjG2ZkYiRqAC
	 TTi9YhxboWPY+SrEpelAqpCzTziwxRPWA40XzBUzYH9Cvk0sSoIFJh9JIF/umTJOvaoo0
	 mZm5G2r75rGcPwr0+YP2sttT/ag0t/2M0DOHMto9RwjUAiBAEd0wq4aSnLKqn23EUpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=edVYjgsi;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB0B606A32A
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 21:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB0B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=edVYjgsi
DKIM2-Signature:  i=1; m=1; t=1794520360;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:dJWlX4ldlan3AgD5SzCzUYK4BhyW
   IIbQ+Yl40E0P1cUL8kzGrwAr96APnyfXkCrwpjvMWmYuXNNCNSwVFZWDZZvPtRSs51teJbYmWjV
   eqz3upHvQadwYWB8o0vkd70eNJyAJdHu26h9q6bpmcIDHb+8AAkjjIWF7ukN1wYFEqwwsWZfXCj
   q7AMFUrRhNg7w3IfK0JFU+BYWmdPPaZyQABt7P8wrofaawJb7UUDHPDeRchGk+jxlo4tAG2NXrI
   aUkGJ6nNhoOTMyG+37UnesKZGC6I8hGd1m4DpaYU7v8iOCzE4GIvjy02LVwjkEuhfwItYe+C6ht
   GkBXtqG7Ye54zw==;
Message-Instance:  m=1;
 h=sha256:
   OklXrQpW6XhrWehGJb+Nd+3X2DBLkgzZlzBInOHsWso=:
   4vvoGZLnoqIORl+4qvO3Owlh3k5Oc55CaII8ii80AlE=,
  sha512:
   B1faVJV7h/+pBV7hDy/SYesK5Oty9ubtY9b2LdDNw/1K6kdgKmUqDUNZi74Zw/qJ4u6erYsrUCN+iBbkBMdAGA==:
   UqI1IXJ0yf3FJGW4b0FTF2g8OmRzYY5Vs46PQEBV/c+r+sdOOVHAXFgVlqOeMMLU3/fSqdtNLAS6urpx6KOIrw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794520360; x=1795125160; i=w_armin@gmx.de;
	bh=4vvoGZLnoqIORl+4qvO3Owlh3k5Oc55CaII8ii80AlE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=edVYjgsiNEQZt+V/4ADAlpZ7zhKYtySBrOBCJzBj4hERrWaOPgHpXQN8cYfBQJQM
	 UQETA7xmqkfsYmPfKBGkSiYo8gZgujN55JhYLuV64z7gMa+W4nbTa2//ISGmLDzv0
	 8XYbcbtxHBRyvM//wawYhQh7q9z9Fx7dtB5P3BNF00vJV4CDXSjUv6bos5UrimFvr
	 PpVS6HDzTvRPzFS2pVsxwR4bkZPffQ4pliQarqgUX6RQgBxvFPvJ+PEsXea0XORW4
	 I0y2waVbxPGdtldB8wayZCQG3DVFJ8Dpq9ZyWFa4s/g+V2D3EUpQ4PemW7ok12OIg
	 XSeMYe2YwRJnTUEUIA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDbx-1wcPbx1kGz-0148j0; Thu, 12
 Nov 2026 22:52:40 +0100
Message-ID: <4c98aa15-c9a5-4e48-a9f4-66abba17744b@gmx.de>
Date: Thu, 12 Nov 2026 22:52:39 +0100
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <412372e989bcb3d2376bc4437a9257bfe94ec850.camel@feldmeth.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+LdLw+lWaNpN2YcBa2nrtxDg4AiuM1QjpYEFBySx7nTV3fOSxcp
 6YM6np/Fprf4j34mnACqWh8g1SjsTDxjzDhlmD/9dk/pzbcKUU0490pmIut3eR1fMwXMnUQ
 ECfHDNxuk4AuGspBeEuCNKUPegN9Hljvu0H/o34DT4QtzO5jKj68LQ8BDSnPTFkBa35LQzD
 +u6C7uQ5kkHXToP68AnCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cJHOoZYQ6Bo=;w1X/4dtam/bdpsvrLJhM60N0zqO
 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
 nOuDXGA2gevIonzG9g==

Am 12.11.26 um 22:01 schrieb Tobias:

> Hello,
>
> on my Dell XPS 13 7390 (BIOS 1.29.0, 12/17/2024, Ubuntu, kernel 7.0.0-
> 43-generic) the embedded controller does not engage automatic fan
> control. In EC auto mode the fans stay at 0 RPM even under full CPU
> load.
>
> Observations:
>
> The dell_smm hwmon device is present, with fan1/fan2 (fan*_min=3D0,
> fan*_max=3D7300), pwm1, pwm1_enable, pwm2 and temp1..temp7.
> At idle (28=E2=80=9335 =C2=B0C) both fans report 0 RPM. This is expected=
.
> Test: I stopped my userspace fan controller, wrote pwm1_enable=3D2
> (accepted without error) and loaded all cores with yes > /dev/null. CPU
> package temperature rose from 34 =C2=B0C to 63 =C2=B0C after 5 s, 73 =C2=
=B0C after 30
> s and 82 =C2=B0C after 65 s, at which point I aborted the test. Both fan=
s
> stayed at 0 RPM the whole time.
> pwm1_enable cannot be read back (Permission denied, even as root), only
> written.
> Platform profile is balanced (choices: cool quiet balanced
> performance). I did not test whether other profiles change the fan
> behaviour.
> thermald is running and has no effect on this.
>
> Workaround: a small userspace daemon polls the CPU package temperature
> every 2 s and writes pwm1_enable=3D1 plus a PWM value to pwm1/pwm2 (off
> below 45 =C2=B0C, 128 from 50 =C2=B0C, 255 from 65 =C2=B0C, with hystere=
sis). On exit
> it leaves the fans at full speed. With it, the system cools normally.
>
> Questions:
>
> Is this a known firmware issue on the XPS 13 7390, and is there a BIOS
> version that fixes it?
> Is a different SMM call needed on this model to re-enable EC auto
> control, or should the driver do something on probe/resume?
> Which additional data would help? I can provide dmidecode and sensors
> output and test with dell_smm_hwmon module options (debug, force,
> restricted) if needed.
>
> Thanks and best regards,
> Tobias Feldmeth-Walter

Hi,

i think we had a similar case not too long ago, and the solution was to se=
tup
thermald.

Thanks,
Armin Wolf

