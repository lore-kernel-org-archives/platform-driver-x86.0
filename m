Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD4B38839C;
	Sun,  3 May 2026 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777844054; cv=none; b=U9+E3B6XjaR3aiJ6Ke8p9lVpK5g+dYoFAT7t69NxhdCZ5zO1RIEaS/ktDT4uz6JSwcpwn8qkDrkqvKzH6uFsjAtmSWBySpwH3Fd3UwE6DZwp8bBDIMFSplaJ4Wt0G6Z4FI26lM1mGrLtQQO6kEFfoFMOZs8/WRef8oEuv/zpZB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777844054; c=relaxed/simple;
	bh=oRgY3NSak6f/SWN5FwNKMFZ5UmJpqqsF0FAKVvQQvwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=caQ1Y9ppXB/P48IQervO8rUZz4Wrghawi4jR3XMTL/m8OZJ1nuTBuVb48GypQbgWa7qe5D/gZKxbaMch6n/JAGCcSN6AL/ik9HhyERZSXn5zFqes6oK1o91p8iknsn52acjDFfxD1cnHEbOBpCNJ/HVFB/VzTnsDEEEA0EKq2zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=NtC1lT/+; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="NtC1lT/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777844042; x=1778448842; i=w_armin@gmx.de;
	bh=XLEypSkjgKYuOnHL7aYQZXgLNfc1rZc1wiKbKXLEEY4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NtC1lT/+V3Eitpj1Mcvni6zQ/PJF18TyFKIVfMzhzvnDCytiPhqzcebsIbg+AReb
	 gv49AdgPozLESGf6y9AS0WSVyPuIEYBFGA7CIDEYDbJxQ1uOAUii4cH6UuTVs3WG3
	 d5bl/+hvrQtydZQutdfJKj6XZVID8L6eRY9xat44zruVJqBX9Am/lVlfYa2mfZhbq
	 4W4dolkMRt8HQd71kI31Am5qGrPwhsd52ACYDw8tDVJGiRfP6EHY8FlvZ1KzXo3r1
	 4vNDa1Xgzz8EAR3L3Qoz6TslBLcpIUd73HH8fLPndX267d4+S1JYHS3QCWBlgC/Oo
	 AaUidLTd6mFDZSyBTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mwfac-1vQ0au0qvy-00zsaE; Sun, 03
 May 2026 23:34:02 +0200
Message-ID: <903a013e-a3fb-49ea-a6f9-ad6577d57a44@gmx.de>
Date: Sun, 3 May 2026 23:34:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] platform/x86: uniwill-laptop: Properly initialize
 charging threshold
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260417050912.5582-1-W_Armin@gmx.de>
 <20260417050912.5582-2-W_Armin@gmx.de>
 <9cc1d286-f41a-c920-aaad-1c24c4e6f2f7@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <9cc1d286-f41a-c920-aaad-1c24c4e6f2f7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jqXMUeFACopvsZqHM6aNc51tsPoufmpIpA6CGYbiMbq7kB9Lb2G
 CR1ftAMxYxWhK/8pC/29UDrs6FD6JP/iH1xMSyVlZQzAOeTzruZB3yE0iTKJ8dKC/xJmCK2
 TcsH0J/zhP4AckiWGLu84H1gPd/Cfwhn8YQNgBuNLzhUBvpJrrGD5gCBx1iynIKYxmhvw5O
 vj3xR6lWD3KUgvAsIcWnA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZpbFr2Wgti8=;mctJ9qxAyM/iim/fUobFaNhe9PL
 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
 oWiGW926055CFItky3e9IfqcicM=

Am 30.04.26 um 14:53 schrieb Ilpo J=C3=A4rvinen:
> On Fri, 17 Apr 2026, Armin Wolf wrote:
>=20
>> The EC might initialize the charge threshold with 0 to signal that
>> said threshold is uninitialized. Detect this and replace said value
>> with 100 to signal the EC that we want to take control of battery
>> charging. Also set the threshold to 100 if the EC-provided value
>> is invalid.
>>
>> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
>> Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 28 ++++++++++++++++++++=
-
>>   1 file changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/plat=
form/x86/uniwill/uniwill-acpi.c
>> index faade4cf08be..8f16c94221aa 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -1404,7 +1404,12 @@ static int uniwill_get_property(struct power_sup=
ply *psy, const struct power_sup
>>   		if (ret < 0)
>>   			return ret;
>>  =20
>> -		val->intval =3D clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval), 0, 10=
0);
>> +		regval =3D FIELD_GET(CHARGE_CTRL_MASK, regval);
>> +		if (!regval)
>> +			val->intval =3D 100;
>> +		else
>> +			val->intval =3D min(regval, 100);
>=20
> ...
>=20
>> +	/*
>> +	 * The charge control threshold might be initialized with 0 by
>> +	 * the EC to signal that said threshold is uninitialized. We thus
>> +	 * need to replace this value with 100 to signal that we want to
>> +	 * take control of battery charging. For the sake of completeness
>> +	 * we also set the charging threshold to 100 if the EC-provided
>> +	 * value is invalid.
>> +	 */
>> +	threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
>> +	if (threshold =3D=3D 0 || threshold > 100) {
>> +		FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
>=20
> AFAICT, this does exactly the same thing as the other code above (but
> looks very different on surface). Wouldn't it make sense to have them
> share code?

I do not think that this would be a good idea. The two call sides are=20
two different, creating a helper function for both would likely be very
difficult.

Thanks,
Armin Wolf
