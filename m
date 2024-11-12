Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7702309B9
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731412870; cv=none; b=HVY2YNqo/f0aAMIzWeCjsPxi2JycI2arUMAvBhPoE9Dt+WlCuyUNot9uyuHQhMKRz7Ci4prv/At3Mg/0pTtI8vEtvL0BdjhNJgWM3iP1q2ZpWqlRcPZH11DRoYeZYYiswsFFC2j9J4kNmuhTrNUdGfiKipajlQBPeLfkoCLxNfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731412870; c=relaxed/simple;
	bh=xHpM9nbQ8sPqLzoISPQdqKo60Xha/3TJpxj5UcRQjNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iVQAA13abKPF4Nq1WnYGa8HCkTg9ueAKjdBX0UwW3zv0WKaFTmRsU/AhawQ11QCz+GmYfId7M9vN5Lc+1E8/huNPlJlhJHPvXZZZKynaKuf4s6v7DNJ0v96hDd1v2/8tFOdoK/wQWxRBRfuOmHCxjnVxZG+UbCHJqH5G23E6NiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LVo4xaI3; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LVo4xaI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1731412862; x=1732017662; i=w_armin@gmx.de;
	bh=xHpM9nbQ8sPqLzoISPQdqKo60Xha/3TJpxj5UcRQjNA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LVo4xaI3eVCo5rAADi/eaQ+SoH3uIprnJXGA6q77b4erz1Pd3ngnjjamXFyLHkjR
	 O7Hqx0tVdhqfAq/OsdmfcCW9ZWmutPS4mHtK27rCTpTns7HR5jJPbImR5IODKJKv1
	 Pxcbjt0l6CAr1OHHDFJjl82yLbXc8JdYd2NmGxe/VHJ3zSE8xkdjOufS0KDvZ2Vyj
	 aa5V3tSOfSkRmw6xRWsNBvByxzfwoF4u3QzpqxpGyDI7MrvwjB3TA4ssb2CSjpmxJ
	 6tss5K9mzaFT4pr8Rk0W7RQvUeXzPxHdbYxgKEXKoNrEE0JUONl+BgNmEutKjE7ZM
	 Y4pLPiL/hY/20zMn6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.87.225] ([141.76.181.126]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCKBm-1t1Vu81P7K-00BrSv; Tue, 12
 Nov 2024 13:01:02 +0100
Message-ID: <c4315d31-7bc6-4bd9-a7eb-3e53356d55e9@gmx.de>
Date: Tue, 12 Nov 2024 13:01:00 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Why is wmi_bus_type not exported?
To: Werner Sembach <wse@tuxedocomputers.com>,
 platform-driver-x86@vger.kernel.org
References: <8847423c-22ec-4775-9119-de3e0ddb5204@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <8847423c-22ec-4775-9119-de3e0ddb5204@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zX63cg6joRwwzD1KM1NqJXuBVahPjE5vIV5qlsAN4t9DkTto3QV
 fkV2x0SY8IW4q2ZQzErAGShiLxheRrU9TMJE5hmTQvGKRc3WPqXD58m4xKTxLcDEMPloAko
 PDEPDwWfLiEdejbLrkoC4JgbgAag6TKc4rdv4fPrCx/hJur5ymnCYKuZze1/mGML+LM5nG3
 FqzhJEsasGCDXa7/sH8Mg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XDAfU/KuZRU=;ksFiKf9Im3KO0rWEvVCnVCcc3sM
 itYf+zhHWRT4plaZN4KNy0dVv/El6w0hPX04wQ1g+Q/3SbjZuPotX+c+yn4+OSE9Vi+MFionE
 JNuMQ0F+y033uOdG3CClQw7XoNeUmYQ2yK4OHz5n2v7ET8v5XQNyuvRvqV34ietb5sJe339LQ
 6tUNG8urkv/Jb1hyCxcy+AS/UVmj2E2LEuQ+um1AvzM+UYEfbdfXU2GpNtb82uMgS8NAb+ZU/
 OdHx8z7Y16U1U4mLcI05cBT+C3aSHodqckePl1BLNDv1UU6t/6Hsno9+MidGhUUAatJjFIX8P
 XrRhAOetYgoLYCjSPaEld81vjvzzEh3aEnBwy3Z0tClT5FwKKAxnx2hhxC73cCigmRsMHuDjk
 wQoS9DAxKKV7rJpFgxHhwnoWqpJnDfoZCMh2n2x+pR7F3/KUWcBc7Tk+dUxe+3dUEgLVs212I
 59xafjSC9VwojJTyL0MX1dLKjpGpa7Tt/FvZpjkB0Brv5mzWJ4uhJJErOKLNPOKcI22CuW1ki
 1PkjbyLO3VgTV8VI53oay+ee95Remt1uyqR8k5RUl0JOQux9ubRU6cX9roCOgUoNNmCAh7z7W
 L/DAhlMug47AhSDgUIArH86BrG9vO0pyvC3kxbBe6yLnU/OVqNKqrHbBmvnunpDseQmyg2aZn
 0yjCZUHrpFfhWHLC9+kAm9RuTcxeml0SDRwaSZap84qUhFDeE82b2RcV+91LK+QQMyoKYx5YZ
 cgwBLwPRtHnUWsGIsjYPzbbGrr9Osxtqrhn4E0+ouOEKyqIxRxWV8ixcUWRIMjYf/pG1X6Y6+
 lmLo4iond0eAEm39GCWBRAKYdgOtz2Ql05qL0XnmTsXCkUiVuh+EM82JDDu3bt5M11JcuW3F9
 HqGavWuuKEtIBbHuzcquxKA9oXnmPHNnM1yIPL778zqmbhmxVymVLu7/j

Am 12.11.24 um 12:52 schrieb Werner Sembach:

> Hi,
>
> quick learning question: Why is wmi_bus_type not exported unlike, for
> example, acpi_bus_type, and platform_bus_type?
>
> Wanted to use bus_find_device_by_name in an acpi driver that might
> need additional infos from a wmi interface that might or might not be
> present.
>
> Kind regards,
>
> Werner Sembach
>
>
What kind of information do you have in mind? wmi_bus_type is not being ex=
ported for historic reasons, i can change that if necessary.

Thanks,
Armin Wolf

