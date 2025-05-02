Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46881547EE
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 May 2025 02:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746154701; cv=none; b=nsjcb/BjNp4p2qBrVBUi6GqGOal7gI3996Y4/A8IQiny6Plrk0R+MbiCzA4QMQi6MxG0Gn0n9zgxP+vs5dhdaiCOC41olUMjVYEeXlg0lhb3QPS2wvw5vKuCuXuG6utETRsu0KbJuvYdiZA1h8n/uvjm+2QhV9QhggTyRXa94ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746154701; c=relaxed/simple;
	bh=K8MNT7VtNM1iHuFhRbQWu9Buz99hBbMq5liMjA0w/J0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZ8kRtb2Nf+8AB5dkI6XUlKaJl38LS6n3SeulqbXEHOoOLd8on0wmCyLQZ5Azt7h/bNQBhzBYi9b4BUmJ83ZmuDE59iM8Q/ZKR+T4VVtgPlDAA0L/4CrbEVqyU8NDQCidFzgrnH9yBgLnE9jvYlX3sRhWu+HOTLrY5YI87NLzwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=YZVDK30J; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="YZVDK30J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746154656; x=1746759456; i=w_armin@gmx.de;
	bh=54etc0UiOwtGFHk8tE4GAP8unGG54zyS5v3jiNfOTiA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YZVDK30JnUxLrqTFOXRFH7OiEzvO72V+PQNIECHRIr1dLh275TSz6ji0bNSknMoh
	 uF2KHG4c9r7QYKsqUKx8v6j3dQVRNjMRNVV0M66OGSzYGzTAEAms8Dlq6t3ZnW9jb
	 P1l4wuj0ySjWQWIbhhxQh1W4FLLMyGNCeWoI2I+YVTFb+0ef62QAuzTs7h2mjQ2nc
	 sOj7q/NzcCmnAbq1u46QCPlMvYbEn9aRh3tJY4vFrziuepwkADqR+9oqHb8vMKz9t
	 N87frseQkVh3Fqu/ATDL5i5bwj5VXFkoiRDE/RdNmOgAaP6ouw11qOWoLTfopiC7M
	 JhdHOW7a3K8HVqxo/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDywu-1uILZT398e-003Wvn; Fri, 02
 May 2025 04:57:36 +0200
Message-ID: <fe72cd95-3f53-40fc-b1ea-c5b4b7bc766f@gmx.de>
Date: Fri, 2 May 2025 04:57:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86: asus-wmi: Fix wlan_ctrl_by_user
 detection
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Corentin Chary
 <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>,
 AceLan Kao <acelan.kao@canonical.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <20250501131702.103360-1-hdegoede@redhat.com>
 <20250501131702.103360-2-hdegoede@redhat.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250501131702.103360-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0g4Jce8CQCUyKfXLV73kmoK8bzKCY4HrAYDyUB0c8Dfy8xo7/8J
 dWRmFcp0Ojh8K9k9B8+e+bwDwNzUTW6h7+qxX46Gr/BF9gnaKVjYs64esV3lczRiRGyOKg+
 0Uodb5KDm3HF7e80iBktaMaVSoKT2j9eCJOyoNaNrqUpcWGJEB1YRnVKBI/PYe0DL7EYnLP
 QKS1Wq5WblmUC7K3/yibg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TZu8bOWlEJw=;HlICD+9UpvtRpAUYVca9fKMnhOH
 zeNaKt+WrV1EcllrcpNf14nJGQqtUWIUdBc+SLT2I1r3iUbH3xjAiUSc1nIW12NSNaM9fPsh6
 c1/FnTX4VP8oNw35ff+QG1IbdcAogomUaV1L9adIDwVBdw4k/e+s2x62VCgsr1wC54XnRqrui
 gIAbMGq07SQqP05IZH74jRUTGL21ZfMDybqHpjRCkuH4XSnLBLw9q1oXT1laTlomKzIlEM5w6
 b7VxKmejTV3CkTIM8QCTw6NR2Co7dyPJ4hSCorvDh3HhVsxPzC901EHesXlSLE9IhT6GEIs7u
 GvyBmcaXXQOQLSeETBbkUDmw+7bVJEwVg8YlVVdN1n5llTNpLcdzitqV5Dh3wPvc1jVsSIX1V
 tpou0N0pdXlBLO9upeo6XE2MgnmQYZ61Qtjp2v8UMW/YlJyoiDunp3AOZeQ6AaGai9ObVwmDZ
 s6CqMmxK9QHQUzPWnYs8khDodiXm866fbDkPh7zO1832zPYeH4BJmO6etEsN9Ta4wBOoJdAjw
 YglQRPLlpW/VHmVPDWl5qOKH6Smwpu23l23dTIliFytNkoWk2uA8nLiP4dw+Hg9ECpL30t58E
 jHwnhtW321acW0G/TCIMQFpycqVVWL7qS96x0TUzOJhWcx/VS/XPA9ibn4x9ZnK3AeOAAWEWk
 +b5avCiNKKyayyUDX3dtDWjORWcORz2uGLe9tx6Y4RSyqWwRE33Z8HriVthuvIp5XdJtfSLhj
 aUttH+Vu9VQzz5ae7XF5uDt3PgGUfJtezoCOlA4w+U9hh/U/JhdR8mpGCLsaK76GFMfiOopb4
 w/mwm5V8HQhS9iv5wi7s9ZGQKxRa4tOhVWYzNaCg+T8EV57iKthzLnWBuwXlowLyHtUZTf5rl
 WDaOlP66b4EfWhU0L1EFPsLflBiIwEwT3S5D1yFSFU55wj8dwEd5UeWp4pAdGexpQJmFx2CI1
 SfVNvWfuk+/39f3mL2pzVSypEY0IJHvlvKmFZRlB51z2V2qYH49UqRvqVG7krAsuRLr5gI1AP
 1RW6O+iauJS18g6WYuwl6p6g0OE5HFWVMZsw/3cVInTMtBnpGdmnHbW52sKJe2DGgqa3F1HZl
 FlQbtOeMz1NTBexWe8JxDRgwMSreE71fhzhAtJZxUmgmq6XiGh2mYVpA+i/52w7hiz0nvFD16
 1z/waUkkfS7wOJgNvxllFSqRg0ZmFrrxUikt3p/I0zlamBVWXHsh4RsN5bA9wA0KqKiw+EKbA
 QeAVmoCePR2O45RF/2LDWnDs3Ie1IKPt3qi/Bn2URJMBbLYvDNgBHNdsEf/KUQEBQP+hlGbGD
 o0DwUTToOk/EE0tPa8zShRq/w6HhL691xV0njhBL5BAToBLG8dxw5FxF1w1+LVspgjUmoK097
 tDcM7Bq+KlxIu7pwKsuKPZKk7fOSX/iRiD/uL96u7M1IIPKfE1dm4bw4OvsssPJAXUzen8hbG
 1B0I6P5EEUMmw0JrdODKUAIAS3qkOP6BWxlSkCrrSlCh52lSsYpHU52BJpGj2SWlLpd5YJFp4
 7qroDOrmi2bLGblKAhZu+EPw6GsPW7Xv2bpcZf3UOs/S5qg/2qGNmxGk0Oo6/RYQA+Ew5UASG
 fQm3s02kEBbqXZpHun+nKI0tHnEVmnIUgZxcYg9pDzLb2hVuq9XhkoyWdslqQJF38xp/M1JPm
 qbgoOjseJDtz07cg4NPqxhnbWCaoEXUmlce2VfKxduQuYkDdA91s3LvNa/f0msPtZB+OF9ftK
 rZI6RzX4caOe3uyliUmeTngYwsE2xNQvvLaRiUZFUbP0bbKvLycOxJXU4f+p+2Yf47Z0gxafp
 dDOVF7M0OLHEkGjLbj+54ZRCx2hwa3KLPyNweNicQ8ENxfiY7/2/9V3efzeI4dujLFfkEEKIC
 AtFQG7sLnE3NKuHNSeGnMXwEkGp3nSoeMy7F3YvounzHqfPXgqgmYE9LpmJpwBkTf6cC/VE9e
 THcjDWX6ItfJye2Vs26/XWvs4qeyoPUbC+4w2lMujyM5tA2JNTx1F8wdWe9jsLCWLIUY3qbGA
 wq45iKRD+Hq8gvd0W86ziuMh1bAvCWMSkcP+0yg0BqKP87P1hUZSUYLLD5ZQgsieWT2HzSU6q
 rCLDyEtex4Hgv82+UhSsmGZHohY61ckYPMlpocqFKm3hRUo2V4bTJfm1GRHXWA/B/1lPRrUM2
 pkThgYQP31E+m73+oBKob2VwUxki2O6fCFzBNC9JwhAQjBXLDUcxZvALunC24ZQmnKs4r9eYv
 aofYgOUmCeEFDDCJ61f77++yI04vIpkR3qaawiUkwjutJIB+xZxecdvZmzUubNgwf/9C+vDBv
 0+R3aLIik6YHESX0+rRu6vgtdWZTpu0Uw1sX9M0fYZaueFw9M7mTthEwZW7R0G6Y2kCpQ1Gq6
 +kIwvcEk92N0hKTyiTpd0nOSgyHk+QLgrdbRCPec79lkJcR7kd/e+YBv166VuhvH8jKemvb0r
 hwq0YippyhcNVJZ0shgf2lRPkxqwGqQuLx0DFjctDYpNYP1TtPxI7I1L0sDylSjg0io9MaRVX
 TDW5ZDvODEOA1SSb6DKIPjeh3HAHYdd5pZ6iXQERAd6n43BI24plU0e1IxRcac3rK70cB6YtT
 mnklGkPDy/Vk+v99eYy/qtom6g3UskCWj14rV2BBhvhM1xKtwQx9LRH/AzeV54OM+BOT2ZrA3
 hT0uLUeKHR6g67im0i7fD2RXt5pH12coRBJIjLKn2J3CaQxpvURNF4JRv2BrjlCOYxCBw/2ac
 Gtnd1PhClOthPqIHKzqPgLnyuXwV1DFogsoWD84pXjzWxwQH4OGjoo38Ej1ZklFHlGaxAymsp
 K/bo39npH2hkYzn0wIdX+hqsi5ymXTmCUzO9BGYnVrxXUe2fzDFDIQYh+oS26McOS81fp8riP
 4N4y/DJdGgEQpnGoJY+v3CE2MfmgwpohOXqVyHiDUj9O0UBX+tMSf6/fdQQF16TbVnCDWPO01
 rGbMVYAJCR1aHRYDA8fA2qvsVUX/9CPn4hz5/JPj1rfN1OzBygmoOh2gVP/tu9TtrrLNwS+Jg
 IYlM0Q65Zj56a6e1HJyiArd+CAmeJGGouITKwi33Si+za4r6BhQ9h51jv7w3T6ivRKvm3hk0/
 QMGhakq+1zArhcNTs/QvNv5Cayg8Ca1pdq

Am 01.05.25 um 15:17 schrieb Hans de Goede:

> The wlan_ctrl_by_user detection was introduced by commit a50bd128f28c
> ("asus-wmi: record wlan status while controlled by userapp").
>
> Quoting from that commit's commit message:
>
> """
> When you call WMIMethod(DSTS, 0x00010011) to get WLAN status, it may ret=
urn
>
> (1) 0x00050001 (On)
> (2) 0x00050000 (Off)
> (3) 0x00030001 (On)
> (4) 0x00030000 (Off)
> (5) 0x00000002 (Unknown)
>
> (1), (2) means that the model has hardware GPIO for WLAN, you can call
> WMIMethod(DEVS, 0x00010011, 1 or 0) to turn WLAN on/off.
> (3), (4) means that the model doesn=E2=80=99t have hardware GPIO, you ne=
ed to use
> API or driver library to turn WLAN on/off, and call
> WMIMethod(DEVS, 0x00010012, 1 or 0) to set WLAN LED status.
> After you set WLAN LED status, you can see the WLAN status is changed wi=
th
> WMIMethod(DSTS, 0x00010011). Because the status is recorded lastly
> (ex: Windows), you can use it for synchronization.
> (5) means that the model doesn=E2=80=99t have WLAN device.
>
> WLAN is the ONLY special case with upper rule.
> """
>
> The wlan_ctrl_by_user flag should be set on 0x0003000? ((3), (4) above)
> return values, but the flag mistakenly also gets set on laptops with
> 0x0005000? ((1), (2)) return values. This is causing rfkill problems on
> laptops where 0x0005000? is returned.
>
> Fix the check to only set the wlan_ctrl_by_user flag for 0x0003000?
> return values.
>
> Fixes: a50bd128f28c ("asus-wmi: record wlan status while controlled by u=
serapp")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D219786
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/platform/x86/asus-wmi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus=
-wmi.c
> index 38ef778e8c19..f66d152e265d 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -4777,7 +4777,8 @@ static int asus_wmi_add(struct platform_device *pd=
ev)
>   		goto fail_leds;
>  =20
>   	asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_WLAN, &result);
> -	if (result & (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER_BIT))
> +	if ((result & (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER_BIT)) =
=3D=3D
> +	    (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER_BIT))

Good catch, seems that the original commit forgot about the presence bit.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>   		asus->driver->wlan_ctrl_by_user =3D 1;
>  =20
>   	if (!(asus->driver->wlan_ctrl_by_user && ashs_present())) {
