Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E80A14A62B
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Jun 2025 18:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750617727; cv=none; b=KnliRN5eZFLEic75wZtyve0aqYnYcQ3f6lVcB7tjsgL+QMyuzYSe1IHdmM5IXqBDMWYAhEFukfcLeCaxdknF1/TUV2yr6ZFG7q7KuTltER0P1uArp53mYboQYvzXK+dLHxxre5RY5jnW+1eXqnNZy/t4oa5AlQaviuGjFsDsrY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750617727; c=relaxed/simple;
	bh=+nT0tRUZ10344pMr3MgsoWUUezLDpjYtgT7fxxUgYag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rs68gODfT+DntQUZxPC3NQyT4zqp7eAGUiv+24xHCbgcpeIuY+9JVJtD2gWXqVbwCV7tlRWZmz46fnWQtQUI9vKae3FcNUCmEpqZCF1kPyvVuphVNz2ZEgxba9IczzqufUamuRFi3uavqj1twlkbL1iuqTZlo/SylIsdjFB/Y0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=nEH2c2yf; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="nEH2c2yf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750617714; x=1751222514; i=w_armin@gmx.de;
	bh=cVamjRUFhh8vCtzSooqYx3W/LOXF5dcYUy5jomwb3+A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nEH2c2yfzB8MrCYWhJNz2ypJw5QRxzbvK8xE//HBqrd5tSXX2b5da9asHEV4CcvP
	 dytPMpL2VIIGnx2zHdJodhtOXoOHNnuPtk07hXARtpT2TRk18IpCdMo846J4eF4Jb
	 hJSRPkvdD6Jd+gE/0QWEagxwOkR0AhHJ/TPu17IXe4vw5sS4mmJUX6UVNZQIOB+Rm
	 2bWRrNMHdlRA7lhHeM9Nh94fjcC27bjbmyt608/JZEHDzZQpLhdSinICd3EFUJ1un
	 vJTEKIksXN83W0UealPyS8qboMhyAX04z1aGrEvRUP3FfGTL/iP8NPY/rgZBzsQ5s
	 Gfnzj5wYRWJ8WDymkg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8XTv-1upo832BBh-016tIS; Sun, 22
 Jun 2025 20:41:54 +0200
Message-ID: <3bfea893-fd3e-48b6-8a34-9ab36108efe2@gmx.de>
Date: Sun, 22 Jun 2025 20:41:52 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: dell-ddv: Fix taking the
 psy->extensions_sem lock twice
To: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20250620175807.418300-1-hansg@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250620175807.418300-1-hansg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kWTAVzie3LQWzRnRJM0uB/4mWIXLHhKsDSd8C3+uY2NBzbgaIr/
 gem2qpqWNdk2d+zTaXD3qSM86zc50l3/dOgkFT62L3Fmq3Osq45h7tiq5aIo3K3LxsoNo3g
 tgVsyt0ZKOwjhhyF0TrcKOqyepv3vsN3UNLlgI4ZGXWZ1Z5aI1ADkKC6TfNRV0mfC7H1wCt
 oz/y8oc9ZiPEUTj5NPX7w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CKSC1W2Cy+Y=;F1hP8PGtFM3cZ8r/UAJwqI1m6db
 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

Am 20.06.25 um 19:58 schrieb Hans de Goede:

> dell_wmi_ddv_get_property() gets called with psy->extensions_sem
> read-locked, it calls dell_wmi_ddv_battery_translate() which calls
> power_supply_get_property() on the same psy which again read-locks
> psy->extensions_sem.
>
> Lockdep rightfully complains about this:
>
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   WARNING: possible recursive locking detected
> ...
>   kworker/16:3/1230 is trying to acquire lock:
>   ffff8c3143417658 (&psy->extensions_sem){++++}-{4:4},
>    at: power_supply_get_property.part.0+0x23/0x160
>   but task is already holding lock:
>   ffff8c3143417658 (&psy->extensions_sem){++++}-{4:4},
>    at: power_supply_get_property.part.0+0x23/0x160
> ...
>    Possible unsafe locking scenario:
>
>          CPU0
>          ----
>     lock(&psy->extensions_sem);
>     lock(&psy->extensions_sem);
>
>    *** DEADLOCK ***
> ...
>   Call Trace:
>    <TASK>
>    ...
>    down_read+0x3e/0x180
>    ? power_supply_get_property.part.0+0x23/0x160
>    power_supply_get_property.part.0+0x23/0x160
>  =C2=A0 dell_wmi_ddv_battery_translate+0x68/0x1d0 [dell_wmi_ddv]
>    ? lock_acquire+0xd9/0x2c0
>    dell_wmi_ddv_get_property+0x25/0x240 [dell_wmi_ddv]
>    power_supply_get_property.part.0+0x87/0x160
>    power_supply_format_property+0xc4/0x3d0
>    add_prop_uevent+0x26/0x90
>    power_supply_uevent+0xb9/0xf0
>
> This usually works fine, because read-locking can be done multiple times
> but if someone tries to write-lock between the 2 read-lock calls then
> the second read-lock will block on the write-lock and the write-lock wil=
l
> be blocked on the first read-lock leading to a deadlock.
>
> The serial is part of the main psy device, not of an extension. Directly
> call psy->desc->get_property() in dell_wmi_ddv_battery_translate() to fi=
x
> the double-lock issue.
>
> Note this also influences eppid_show() which is called directly rather
> then through power_supply_get_property(). This is ok since the ACPI
> battery is fully ready to be used when the battery hook's add_battery
> callback is called.

Thank you very much for finding this issue, but i think that simply callin=
g battery->desc->get_property()
is not the right solution for this:

1. We should still call psy_desc_has_property() to determine if the power =
supply actually support
    POWER_SUPPLY_PROP_SERIAL_NUMBER.

2. At least another power supply extension user (the uniwill-laptop driver=
 currently being under review)
    suffers from a similar problem, so a more generic solution is needed.

Maybe we could introduce a new function for reading power supply propertie=
s that ignores any
power supply extensions? This way future extension could use this function=
 too.

I envision something like this:
=09
int power_supply_get_property_direct(struct power_supply *psy,
			    enum power_supply_property psp,
			    union power_supply_propval *val)
{
	if (atomic_read(&psy->use_cnt) <=3D 0) {
		if (!psy->initialized)
			return -EAGAIN;
		return -ENODEV;
	}

	if (psy_desc_has_property(psy->desc, psp))
		return psy->desc->get_property(psy, psp, val);
	else if (power_supply_battery_info_has_prop(psy->battery_info, psp))
		return power_supply_battery_info_get_prop(psy->battery_info, psp, val);
	else
		return -EINVAL;
}
EXPORT_SYMBOL_GPL(power_supply_get_property_direct);

It basically is power_supply_get_property() without the extension logic. I=
 can also write some
documentation on how to implement power supply extensions in general.

What do you thing?

Thanks,
Armin Wolf

> Fixes: 058de163a376 ("platform/x86: dell-ddv: Implement the battery matc=
hing algorithm")
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
>   drivers/platform/x86/dell/dell-wmi-ddv.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform=
/x86/dell/dell-wmi-ddv.c
> index 67f3d7158403..95cc3139f271 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
> @@ -689,9 +689,11 @@ static int dell_wmi_ddv_battery_translate(struct de=
ll_wmi_ddv_data *data,
>  =20
>   	dev_dbg(&data->wdev->dev, "Translation cache miss\n");
>  =20
> -	/* Perform a translation between a ACPI battery and a battery index */
> -
> -	ret =3D power_supply_get_property(battery, POWER_SUPPLY_PROP_SERIAL_NU=
MBER, &val);
> +	/*
> +	 * Perform a translation between a ACPI battery and a battery index. D=
irectly call
> +	 * desc->get_property() to avoid locking battery->extensions_sem a sec=
ond time.
> +	 */
> +	ret =3D battery->desc->get_property(battery, POWER_SUPPLY_PROP_SERIAL_=
NUMBER, &val);
>   	if (ret < 0)
>   		return ret;
>  =20
