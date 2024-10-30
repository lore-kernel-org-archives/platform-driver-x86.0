Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DD81E411C
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 23:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730330917; cv=none; b=E1JKH3C0TkisP9zkAvMACizmHHvmZL43ZMoObgH7Y95vOVWa/SiEJpRr0E8uwWGjejNXbgegUet8MOYCEG36Ga3Q42mKqbjdocA9z46zehNs+X+0KK4ZW6eKbQ6CiIHl1KiuxU74B7hmXxvZaZLUNe7qC0GMtkHoukF+Hi7Xvgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730330917; c=relaxed/simple;
	bh=cab8yDQkci0g8z0iX0HWPhSM4Iik+RsXMtc9Dh9y73s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QR2eeK3Ba1IrxGOkqa0PBKIwcA/aSrb2WCmC8PZCkA7Z3wKz0INO2dMT7ZpxM1hSrxN9Sb6fM5bfgXT4ECVk/wXEq2KKYLku/XBky3C9m73FNuHS7vWe5JXFMlEdN4fPrIXytQKF3xex+C8om4GYl1tDAf9WAau+LmDTVtoEk5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ZbFLizX0; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ZbFLizX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1730330908; x=1730935708; i=w_armin@gmx.de;
	bh=J1QWJPsLD4Ar76AcHKA8rpn6OgJi4LkX1lhASrosGhU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZbFLizX03zxxbgJHLyz/6C8+W9Fo82CSGf9mpmioNFrBIVQhy/5YP/4b9IKLmAZo
	 UhYrVAbUUggn5xmAlMkNLloEKJt2nMOkNwruUj4EhGWbNVZyMnL+WgEfSt8LUmsqU
	 x/s/U4TyQ/xWsR1H3PM6Zd/CwfDn3FsN5BV4AB5VhSRR/OUXF+OpQgQ6vDw0xsk2q
	 KpHohvX0Ymzw/MqbJUTlhcCeNrrKiWA3JgK/D7qC6MEjqGGnAsATqK1TlxGxM3O27
	 f9D57UYNJYkSAqUhuJ2lD1ui0GxIBDShKttzB0KS4c/9HNoSh+naOHBdfw3TcSkhD
	 cB02liuPEdYuqiK4Gw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwfai-1u2xZB3joY-00sV5b; Thu, 31
 Oct 2024 00:28:27 +0100
Message-ID: <8cbc8310-7533-40e4-ab2b-b8c3c9e1911e@gmx.de>
Date: Thu, 31 Oct 2024 00:28:27 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: "asus_wmi: Unknown key code 0xcf" when plugging in charger to
 laptop
To: Pau Espin Pedrol <pespin@espeweb.net>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org
References: <54d4860b-ec9c-4992-acf6-db3f90388293@espeweb.net>
 <6131c8e6-5a25-492f-a296-2ed56a9db360@gmx.de>
 <7557c282-2521-40d5-a499-48b260c7db4c@espeweb.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <7557c282-2521-40d5-a499-48b260c7db4c@espeweb.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lMD46vrVocCzCiMr7BRJlxXdJahHrIt85NNkRP+GhueHA9E2Xnn
 uqW8Z0qjJjRqFULenZSkr/gDyaKzbmWqKH7FTr0xnxprqU+wyCBZ+jTR8LfHbmYQcnVzlNO
 M986jMxNFnCpjmQz1CjASQ24ChtTi9JefPMQ5d2p26HqU8uZzakNMoXmzy07KPbUn8zbh6U
 H6Ye8M8L0wUvKXdbQSN2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZvCB6LjGXb0=;2Xplh6jIJx4V63+RxcEpangXeI+
 4oVt4/DK/PN5c7+oD4z2WQusrOZ8DatwNfJsRB1ECLCx24EGERNHru8bdJ/yLwWbPk7ktvQ4a
 iisjJRvj8++n+IJ+DB2npNwEUJW0Qd8T3jL6d7MHhD2r/oEBZK7t4riVLMbpCMOqIvV3Yxi5A
 c5VoDNBzbQ7NjyxTyRfYrsw6RUXElSEC65SYsNFOqmjajY/YLH+jd2ReP99+dRjWCiJIk2flq
 BYd3Tbo+G+OzPcDWRn1Y6QEdf6TPbt2qLr2ePj/I8PHNFSHbsQKDXc2AcvY6+AP/SDZqzXE34
 7YiXXvHJ5sffmu4Cm/YdoS/Oy/hpyCZGLo/LXh2Kx7v+VmtRZxVekCAs/bsvB5c8eKBSl6keq
 GogrQSAvH2qVFxGmAuhpqSeAegbeznsqyU/8mxjNCXQs50WNyLbFxtkMXv7AdH9tYyHEDb6bD
 CWS8qWMrZ9Wi7GXqhfgF74063jiINTcFFttFkYURDUtbiKM6mD3CAa0lQkXwAzJeDMkrHN5HX
 QHPzY4xQhUNoIRZb5zAkdivq+0PboLLsmxg1BC0Ax+3y/AZu7I6m9m7WJwhxG/0teIntB+kBP
 V42kzRqTopO/17XlQodfJzbrMaTQ8ZsaKcgYGaXtuv1pGWCJTP+OhyLF+b7SyenihRgACm425
 vczAPDcKaJcGc4wQfwf/A5LvAJ6OHTTHhPKp/HK1KMHqpw7GquYp2CcADodep3n52wdfkLPNM
 rzjvHXC6m9q0Ob15ArmThgsSGXQ/kz3WqYoq3jvQVPBeDNo4U79UFbN2XIyn1crLB61Lp5RZA
 L2MH5F+hMvEqissnPZmyaFrbMThv1H1ewfJD87jMjmZW4=

Am 30.10.24 um 22:44 schrieb Pau Espin Pedrol:

> Hi,
>
> On 10/30/24 1:06 AM, Armin Wolf wrote:
>>
>> can you share the output of "acpidump"?
>
>
> Find it here:
> https://pespin.espeweb.net/~pespin/tmp/asus_wmi/acpidump.txt.bz2
>
>
> regards,
>
> Pau
>
>
Thank you. The event seems to be causes by this piece of AML code:

	If (ACPS ())
	{
		ACPF =3D One
		Local0 =3D 0x58
		If (ATKP)
		{
			^^^^ATKD.IANE (0xCF)
		}
	}
	Else
	{
		ACPF =3D Zero
		Local0 =3D 0x57
	}

	Notify (AC0, 0x80) // Status Change
	If (ATKP)
	{
		^^^^ATKD.IANE (Local0)
	}

	Sleep (0x64)
	PNOT ()
	Sleep (0x0A)
	NBAT (0x80)

Since the event codes 0x67/0x58 are used to signal battery/ac mode, i thin=
k that the 0xCF event
might be an alias for event 0x58. Maybe we can just map it as KEY_IGNORE t=
o silence the warning?

Thanks,
Armin Wolf

