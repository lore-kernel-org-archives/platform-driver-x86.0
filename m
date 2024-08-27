Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EC184D34
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Aug 2024 22:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724797499; cv=none; b=IHloqMPfaokTeFGp4NNnZT4RpMZRx0w4oF81ZAwvcNKhexdeOI/KYJoU7AzrC0nBTG6OVUveQBvvO8qsp7FLxlmRFdfGZpyghMLqHLaK+jbBm8DvUirAnIgXpWhujnucF1hgDhh/xlQ+VS/vnCuPA1IXu8MeCMK1H2q3yeTXoiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724797499; c=relaxed/simple;
	bh=7meR+qQuOptIZPBYhyeGO+ZvUsr8DyIA34CM84X6scA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qflWLV/hIPLmSnGsPK76vvVe+HJUxNJ6WlRD7vRIei5UcfsVBfXW64SF0IP5i3FY8p3fVns+Hy/r8zXS/IgBzUmyvXYI23C6OTw6WQvMtJEJOD1kRkhcvX9ZORvab7unW8Ja3guCq1W4MtwmNH6QqXmz2d6wf3SAZKFD3jSXEhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lL6p6p8Z; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lL6p6p8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1724797494; x=1725402294; i=w_armin@gmx.de;
	bh=7meR+qQuOptIZPBYhyeGO+ZvUsr8DyIA34CM84X6scA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lL6p6p8ZHZHcjGYhmUe8ulYr1Bjgl3VThzu9mTO+uqS6Ake0Vuu5xblS1lEOD86x
	 XsiuFwRTZOTmc0r8VBoLngNYKPS3yqOgOitl8GhN1ZAlW3eOv7fITCb0EThshTHEJ
	 AgPlMSIwluBakuRA2mY5xBKKQ1krcJ3RR1UPI9fbnuyngS54sefleea/4Pk1oHvXW
	 9ygeLkOOmC1fQ2tX6MnXJFay4DKHnjPT6Yk5UmkQEHAikj+278Xmy+Cs8USl/VH9/
	 fuaeujis/oDBezweyWkHs0l/H2pZJzpk51xSX9ultXY3taXlA0pkZJiW5ea0Pr9xf
	 AJ2yYl/VhUwQQsoH/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MI5UD-1suuyP1S3L-00DmFX; Wed, 28
 Aug 2024 00:24:54 +0200
Message-ID: <3c63701c-f9fc-4f98-b991-58135da3fcc3@gmx.de>
Date: Wed, 28 Aug 2024 00:24:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Add Support for the Acer Predator Triton PT14-51
From: Armin Wolf <W_Armin@gmx.de>
To: Rayan Margham <rayanmargham4@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <808c835b-3500-4345-a338-b0f8014d049d@gmx.de>
 <202FA1F1-967D-4D99-94A1-9649C7C9B6F6@gmail.com>
 <CACzB==6Hpp173CzcsOpU+epz13uDU5mpudX1xvZuMkphODTPAw@mail.gmail.com>
 <ecba8732-fbef-4e4c-b518-d5042fd18480@gmx.de>
 <CACzB==7=AUGXuAyDrQBRO35fap=ok7B8tSjaXY0tDPjn2qExyg@mail.gmail.com>
 <4ad19bcd-8030-46d8-81f0-e4ca97fd3ea6@gmx.de>
Content-Language: en-US
In-Reply-To: <4ad19bcd-8030-46d8-81f0-e4ca97fd3ea6@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m75enQD9qQRZ2aeHi6P4pmIhDnE0heRR6Enh64a/XjnlqpgVdvp
 fA/qcb5365bAqlp57ZEJDhBsn45HrkUFeGqvAoKtydO1/6NOqSyD3jl2P50EwQCJQ/Yh6Um
 SQFsoveTl2TcPHHq+IP6v2hrnIixhjMVBdWbITLk7vF902UQpfx8xAipwPsOIf3xBegfzWn
 2guG9z+ladEn/RXXk7Bkg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yg01HiiA5oc=;gxuybqVp29Bnb/5RUmNtNGtU4rm
 DHwc38QBRfJLCOzwODPmz2odnFHLuCsQpAzgHNp/K1PvvLl0gGTqUJ0GmiHDaxHfukBHoF/a2
 fjaV5VyaawHJBfY+2jQccbxOeCRUrhj0DhhYIpoFlG4S9yOLGA6/oLWZmWqeZn49tEhJ6O5CS
 vLCtD/Gp2gtWJOOBPqFpdOZDnGU+YUVPYGSktwzEi2WRpIKUUduSliVm0XBhfidsgeFtk+9gS
 ua3+B82hNFJ0iaxEsElMgDbJ/tnrqUfZ8J6y59g0c2TMAy7XPWkmDhRWuDtPKVcOLsLh4k2NJ
 zujwDNo+qYydGpxYehZnDLFBpmHXPa2s4l0vmQBUZIvYw1ccWAT1GRog4WmOJNn3mu+yCuGf/
 codC+ifhMHH24NI71TmXdRtya4h1EeCG5JODsxup8OELkelJxWLMOeVd6TAXi/cqQl6bmJvqA
 H8CTAAeUbLey8zPxhSTNqOsEwEirgiu/TlQ+MjB3AB20S2DkZGMgUT7mr9R2GQaMom4zMWL3I
 D3KLwhS6lgGu1w+Yi8Kx5Alkn4TnVVZq4BqzaE9qXVIBG9Y4L1DP15NHRJSPsKZ7FE10q6L7y
 pYEZ/Qf4nNduo1R27zPHA0F3HIYImPu0ZCLE8eCT0oM1Fk1xyUJ13GYQoNJ/bLmmLI03LmPSC
 xE+b2S1JcKnpJxAZ/s6tARrc1cBbtFSYi7hHlmmqfg0JROr38WmR54WSwOAK2N+BMdbHSgpja
 T7Wewors01BlfW+Pg24X12SFg1Z8FqPZBaAmHQckMGgoOiUPuE++EdtIlPLFzAyHXV/UtSjzw
 HG66DXGcxdJdiKv8YXHw17x5bCabvS3KYtl3YBz/HIOtA=

Am 28.08.24 um 00:07 schrieb Armin Wolf:

> Am 25.08.24 um 18:37 schrieb Rayan Margham:
>
>> Hi,
>>
>>> Does the fan speed reporting work?
>> No it does not, sadly, only the LED switching functionality works when
>> the turbo button is pressed.
>> Thanks,
>> Rayan Margham
>>
> Strange. I will try to figure out how the OEM software interacts with
> the hardware.
> This however might take a while.
>
> Thanks,
> Armin Wolf
>
>
Also, maybe you can try to improve the performance with thermald in the me=
antime?

Thanks,
Armin Wolf

