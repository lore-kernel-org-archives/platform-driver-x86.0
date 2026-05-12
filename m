Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15EF33EF;
	Tue, 12 May 2026 23:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628169; cv=none; b=tjS8GyUiEh+gNkYwtz9FLCRWU6nDI/8PQm6gm9E5+HHmcDtljEYA+ceTDli0SpyRfqA0Ha8Pk8+wBB63htPBN9SHh/JXWohWuuAsvESpOoNYrEQf6eR+GNyG4RvANnyiDQduH+zJ8nig7Znt9f3EHn30+LtyLLwzbKwYoz/D+dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628169; c=relaxed/simple;
	bh=A8d6/jK4qrEA6+A/yjR9v0k3bGfE6hoenH9je5p/11w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgN8pEGQOqf81pHk1L+3z4yDhjJHFu0m4PUR7+gtjDGCwxHqG+Rqc2koKoCyr+oLNwg1nfEpuTjADQQ8CaxLJuZ8idrsKUdbr2AACsaK4GpzY8nA1UxmDasPIgGk40094q+c+sbV0JqCzA2eb1btEByJQJsGEoY6TEc7Qo9toh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Dk2PlYOv; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Dk2PlYOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778628159; x=1779232959; i=w_armin@gmx.de;
	bh=Edvx6EvjCFF+Lk5tWi4yxGxDYJ6J5ryVG5TxVDgLw/k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Dk2PlYOvUBSiwJuDmqizgGhqnq9RlhR0nSjdpoGhjPoJZ7jrx+pidto0AobU8AuX
	 CnyN1iCUxDFwqYSnAiKyXiXcx1pMowFyg1Y1gxkwJGaCnKPVYxJ7Oa1e6/+wN6V3u
	 ZJvlhNF+RzLB+0j/106Igqe5VmcM+TU1ZD1cCKDJPEtSuhoBRJT+i+NAKLvCPOAUw
	 zLxJ6BKsQ0AHet/MUXT5LVSrub1BhROt1Bc9QZZBLGvJaL20Rg+a2jHEHLz7rSwgz
	 hDBEv8jJTetRJaNHaKjezfP7rHVHY/qiA6U1S6ueSkaoIziwATbYhlotAIOuRT9ee
	 XWkmXBwZpn79D6j3HQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSKu0-1wpaBr1Q8O-00Ljnc; Wed, 13
 May 2026 01:22:39 +0200
Message-ID: <4e2c6b79-9616-4537-8b1a-0ceff5e4a5ae@gmx.de>
Date: Wed, 13 May 2026 01:22:38 +0200
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
 <903a013e-a3fb-49ea-a6f9-ad6577d57a44@gmx.de>
 <4766afa5-4128-a9fc-0792-b83e2fb48e6e@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <4766afa5-4128-a9fc-0792-b83e2fb48e6e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WeQDw8KkBtjVT+YeBqIk5+ULxIPAgbkvsfKPA+/dAKvveTVbhvb
 lYC5Q5idqhyOJWD90ZY/FjLj97dcBav7Pk2afVNs/De+ZrD9ToRMu2736cx8cQt2vUBs45t
 ULhQ4Bm1KUkploFl0MzyWbKwtI3xIXzo/vXfnPWjp8YsdSFZfbEA6d6OOYagRZAfqZVYxTh
 br9UnIm6c1WWJavuzrHAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JUz2KfAZ+b8=;rzr4hGki4cIt2glI46YTp6OHp6E
 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
 p4Bm4Q==

Am 06.05.26 um 15:42 schrieb Ilpo J=C3=A4rvinen:

> On Sun, 3 May 2026, Armin Wolf wrote:
>
>> Am 30.04.26 um 14:53 schrieb Ilpo J=C3=A4rvinen:
>>> On Fri, 17 Apr 2026, Armin Wolf wrote:
>>>
>>>> The EC might initialize the charge threshold with 0 to signal that
>>>> said threshold is uninitialized. Detect this and replace said value
>>>> with 100 to signal the EC that we want to take control of battery
>>>> charging. Also set the threshold to 100 if the EC-provided value
>>>> is invalid.
>>>>
>>>> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
>>>> Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> ---
>>>>    drivers/platform/x86/uniwill/uniwill-acpi.c | 28 +++++++++++++++++=
+++-
>>>>    1 file changed, 27 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> index faade4cf08be..8f16c94221aa 100644
>>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> @@ -1404,7 +1404,12 @@ static int uniwill_get_property(struct power_s=
upply
>>>> *psy, const struct power_sup
>>>>    		if (ret < 0)
>>>>    			return ret;
>>>>    -		val->intval =3D clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval),
>>>> 0, 100);
>>>> +		regval =3D FIELD_GET(CHARGE_CTRL_MASK, regval);
>>>> +		if (!regval)
>>>> +			val->intval =3D 100;
>>>> +		else
>>>> +			val->intval =3D min(regval, 100);
>>> ...
>>>
>>>> +	/*
>>>> +	 * The charge control threshold might be initialized with 0 by
>>>> +	 * the EC to signal that said threshold is uninitialized. We thus
>>>> +	 * need to replace this value with 100 to signal that we want to
>>>> +	 * take control of battery charging. For the sake of completeness
>>>> +	 * we also set the charging threshold to 100 if the EC-provided
>>>> +	 * value is invalid.
>>>> +	 */
>>>> +	threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
>>>> +	if (threshold =3D=3D 0 || threshold > 100) {
>>>> +		FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
>>> AFAICT, this does exactly the same thing as the other code above (but
>>> looks very different on surface). Wouldn't it make sense to have them
>>> share code?
>> I do not think that this would be a good idea. The two call sides are t=
wo
>> different, creating a helper function for both would likely be very
>> difficult.
> Both seem to be sanitizing the charge control threshold (AFAICT, both ma=
p
> 0 and out-of-range values to 100) isn't that the case? Why cannot we hav=
e
> uniwill_charge_ctrl_thres_sanitize() or something along those lines?

Alright, i will implement this.

Thanks,
Armin Wolf

