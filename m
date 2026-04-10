Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F71E3E274A;
	Fri, 10 Apr 2026 17:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775842070; cv=none; b=FSmmbQ0L4/LW6IUKRiMd4bfH51CYLpguy5V/V54kiv22CC9rhQ0qTIFI6lZxttCxXR4J2VANsL+EewT6/PNwBMUkZGm1It59krMbT/dFUQwpV2HSBj8A5KPXrW7Zrj6Z7Q0BsZLnEdLEClhFMTuJFwYb8Lnh5e/W5j0/o2MItgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775842070; c=relaxed/simple;
	bh=goJ2W/7mMQ5svnRkjmUcwRTFHiUFagOWwrz0lTOMV2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/CmQibX/nZtqgzOmFblWH2hN+KJufxKkVFMwxdKM1R9dPvQZHd3nzMWnItS1nyS71m3EmAIsCaZ8gauSKU8m631bKesVJHrmp/tfRWcrzmp779lxcpePOaXrub+KgyMQiqQ5v8ygPCRh3Ph+4G/+8VQhP2A4vI0vcZs0z1a0yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MdRpafqq; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MdRpafqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775842055; x=1776446855; i=w_armin@gmx.de;
	bh=goJ2W/7mMQ5svnRkjmUcwRTFHiUFagOWwrz0lTOMV2A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MdRpafqqkKif9neShZdfJ+yvKbMerTDpMpuzumgWC9+SDTxLwiV7Uqgp7iCnOj1d
	 sw98zLMx1kiZS881VBVhnltOiobiL1cmSut5/Wb4kEfUIDXQyute0S5Pg774JmuES
	 JYVA+3UKxtviW24gHiR6hLVs5C+D+wF2jLOUWoNKaQ4FjEu44R5JQdTPcle/5R009
	 MojC2g5WgrUW5C8a3qpEtcsqT/B+e4V9Zn7rExVtmsWQ+G8aMeusn+ymOpN9gbB9a
	 n+Lque16N2sv74xo4lX3sf6HB+aJFSP+EhbCImNhQvTIA7XOM05bYWOK9O47EXaAH
	 vysxIR3iJT5BfakBHw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1HZo-1w9bkT2eEM-000Q13; Fri, 10
 Apr 2026 19:27:35 +0200
Message-ID: <f8dc0729-5fec-4c28-8233-1a80ce1fe2f9@gmx.de>
Date: Fri, 10 Apr 2026 19:27:34 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] platform/x86: uniwill-laptop: Properly initialize
 charging threshold
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260406193653.7799-1-W_Armin@gmx.de>
 <20260406193653.7799-2-W_Armin@gmx.de>
 <d99162c3-a940-46a0-a0e8-3a777cabfcc8@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <d99162c3-a940-46a0-a0e8-3a777cabfcc8@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N0kkhvNwTk9omEpKgCi7+3mxP3wdxIlAyoRjUO04+5hJKUrT4S0
 8B7swFGEimlFZS1xwpngPL/TITstzk/4/HytSJKo+rOfTal40RHm6a92er0RjqOgmzreyba
 lAgWaBuPxqfiM7cS5YxVWzeFxl4T8HTgVZKzVlzLijWa4lZe6JirUm2pG70F6D348MVJJJu
 zO6Y155rAUb1AlFnvTtYQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:90GopIpkRLM=;JW8suEzFcQRvt566tp4OLFgehbs
 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

Am 09.04.26 um 00:59 schrieb Werner Sembach:

>
> Am 06.04.26 um 21:36 schrieb Armin Wolf:
>> The EC might initialize the charge threshold with 0 to signal that
>> said threshold is uninitialized. Detect this and replace said value
>> with 100 to signal the EC that we want to take control of battery
>> charging. Also set the threshold to 100 if the EC-provided value
>> is invalid.
>>
>> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 28 +++++++++++++++=
+++++-
>> =C2=A0 1 file changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index faade4cf08be..8f16c94221aa 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -1404,7 +1404,12 @@ static int uniwill_get_property(struct=20
>> power_supply *psy, const struct power_sup
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->intval =3D clam=
p_val(FIELD_GET(CHARGE_CTRL_MASK,=20
>> regval), 0, 100);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regval =3D FIELD_GET(CHARGE=
_CTRL_MASK, regval);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!regval)
> personal preference: explicitly compair to the uninitialized-value "0"=
=20
> with =3D=3D for better readability, but don't know if that is the normal=
=20
> coding style for the kernel

Hi,

AFAIK the default kernel coding style encourages people to write NULL/0 ch=
ecks as !value. However i am not sure
if this only applies to NULL checks. Ilpo, what is your preference in this=
 case?

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val=
->intval =3D 100;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val=
->intval =3D min(regval, 100);
>> +
> We silently correct invalid values here. Wouldn't it be better to=20
> detect that something is off?

The ACPI code on my device suggests that values equal to or larger than 10=
0 will be interpreted as
"charging limit is disabled", so i think we should replicate this assumpti=
on inside the driver.

Thanks,
Armin Wolf

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> @@ -1499,11 +1504,32 @@ static int uniwill_remove_battery(struct=20
>> power_supply *battery, struct acpi_batt
>> =C2=A0 =C2=A0 static int uniwill_battery_init(struct uniwill_data *data=
)
>> =C2=A0 {
>> +=C2=A0=C2=A0=C2=A0 unsigned int value, threshold;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data=
, UNIWILL_FEATURE_BATTERY))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_CH=
ARGE_CTRL, &value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * The charge control threshold might be initi=
alized with 0 by
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * the EC to signal that said threshold is uni=
nitialized. We thus
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * need to replace this value with 100 to sign=
al that we want to
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * take control of battery charging. For the s=
ake of completeness
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * we also set the charging threshold to 100 i=
f the EC-provided
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * value is invalid.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
>> +=C2=A0=C2=A0=C2=A0 if (threshold =3D=3D 0 || threshold > 100) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FIELD_MODIFY(CHARGE_CTRL_MA=
SK, &value, 100);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->=
regmap, EC_ADDR_CHARGE_CTRL, value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D devm_mutex_init(data->dev, &data=
->battery_lock);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
