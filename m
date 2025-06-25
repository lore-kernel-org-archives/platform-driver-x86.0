Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCA6C8EB
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jun 2025 21:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750887821; cv=none; b=tKNA944Q17zK6xlsVX1nUtEbFTOhCztlBDX5FWbYSdNXsUO1eEqda4QXEir6ClDHVZBzyzADSz4ooOKL613wXgyMIRheEQAb/DLokbPe+5p4mCseic2iVPvmKBnhaBYOXr2HmNZJJHbVqUnTJhyWCrFbZM4siQpTgogmUUiuuKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750887821; c=relaxed/simple;
	bh=eVmy/cR/N8d6RuQLJFRtUojmR1nzx+7KALt1lDBzPdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMY4k8wYPVuaprrjHNK+++cc+mlA3nx82XT2ikSN/9ca926EYzxKfnnQ4v0fuRUy8zI0mjs49L50sd16GBQHeDp33vUgMyHFNv4CWujyCqEPa9D2oJjPuw2JIDEako50Iyimey3ScpKb6KaHcMOXz9qMRnI1AUVRzpszOUyFudM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aiF9DYI2; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aiF9DYI2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750887816; x=1751492616; i=w_armin@gmx.de;
	bh=eVmy/cR/N8d6RuQLJFRtUojmR1nzx+7KALt1lDBzPdE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aiF9DYI2AvBD3QJSl6258eIQ0/ZstDA7HvPJkYmaXNvbNEGI00+d/JNzI1GETUIT
	 N/U+oXC3K2aPxSPNYUu1fa3QVtmAPxUutXq1c0ZEXd77v8bjogyL6vo0rsQWctbR4
	 F8GbGT1m7Jm6AFqSImzXD9nHH1zHG7+LxABbpTVcnJaQUIf4oD8EuQydaaFMd+613
	 ob/cqQ/TdyLDcswGaSXnpg/vo3Mt8hbQ3QRSHBhAQ2GcFEZia5DYyfcG/1tAwxB50
	 vhZM+PlhPXRsbXxYZ0LEgJYZbM5vTj9gRd2x3wVTPIh2Nx5uL2unGm2kfYtmeqRQ8
	 wnPKgwiP4RwJ4Fu0+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgeoI-1uwBYS0Rg4-00fm0M; Wed, 25
 Jun 2025 23:43:36 +0200
Message-ID: <de8321ce-e595-460a-81d7-f7dae8a7b790@gmx.de>
Date: Wed, 25 Jun 2025 23:43:35 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: HP Omnibook Ultra Flip 14 - power profiles
To: =?UTF-8?Q?Benjamin_Hasselgren-Hall=C3=A9n?= <benjamin@benis.se>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <GXa7F-PA_8BE7nlK9r8dkdSv7c-DW52GvOUiyYHQ6RyoZDxIpNAocWDPYQDeS7WEZeUisqQH_bqmgSV-eaRmuw5r68MGKxyU9X_4Erd0RYQ=@benis.se>
 <1037e223-a6ad-4d12-9619-f69a29cecba1@gmx.de>
 <5I8UDmgF_DcJBmBE0zgCXjuvmmhLamDCHkpnkAwRjSAkCa5xcFUvU-SmAeymxTajjDPR8avuW55RxOjhd8idK6jLy-hz8i-Ma3RHSaFy2Gs=@benis.se>
 <9642ad7e-3e57-45f9-bfd9-beac3e55418e@gmx.de>
 <GXC8NQl6AY_N7nQAOCRLt7SDGjFNll_TnqQyzYnP_b1weGkRqITOR-kHKcM66lPonOCo9xO2nSWXr7yycwfFuKmjRMtXVlJKya8-qvvkGik=@benis.se>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <GXC8NQl6AY_N7nQAOCRLt7SDGjFNll_TnqQyzYnP_b1weGkRqITOR-kHKcM66lPonOCo9xO2nSWXr7yycwfFuKmjRMtXVlJKya8-qvvkGik=@benis.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lHxs4JYvp8MNmC9t+cezbyR7qPV9KSdpSwaO0gmLBjGiONUxOh5
 65oNoL68wcI+lke9IDeCHi7l2+ZToenjQsZQmQ9kQXYo01HiigfIuPA04wDOKmM/iZxzYb+
 rjFWoUPGwbJsegfxEKNNz+xhc3K6Yf6k6ZRBp9lS0gISnsbiG53QFxoNXQGtBz9eFG49tN4
 UWPLdSOK1Bjkuq0r3nUUA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j8RZ+bY5i50=;WLijtnR3M+A3BxhtifhZFP21kBs
 kcN1wNpVqARwZbLka20Rsnzg95/k6D08qJDSVhNHa9R2F9+80EYnMtWqux7a+sBs1LqO5A4WB
 ih4z61iWQ1ntUcIWWn+upbubuVfDspFRMdShDQcUvtQ29nXwoo48eNTI9OtOipKTEcQ5bURwQ
 KZ0bBmU2gNglRHA3FzykTPSZsjI6sZGtGWG1EzEECfkgEpmzKIqecUUiP7nK4eD0XvIRq48we
 faQO1MRovAolAnfp3yF9r1svhS6Dt4ZaLtpYgSN1A8D3x+3i9K28/VaYN1BLBzHLW1yYzklBS
 cnU6npSjTYRISi7CIGK03+cP+nDMBYPknldM4t7SE8ZPXdhdDSK++I2ipqEP8VYmljGc52OHp
 1151mOb1VbUd+49n16fjuUSJTaZe+3AWr67Nn+ZaCOX9uIi/d+Lj3183Vos/Ki8UnTrZwuqrf
 HJnbOS1rbtp58u1tU/CZJZBcF3kJpGCKiV50eJakHwstjq58HE6Me1US6pFWNSe4ktOfzzYsV
 wBBTwerXbRhqU7BX5pEKFQ2RClp18ssjoN0oCJ746LDTF95O7T7TZdJoS9gOSPc62u90dBMaf
 3Vr21uwk068stSBtA1UpmD/eyK6t7s3RBLtCZlXMM7A0M7KJQE5B2vHmQUXZFo+Xb9qnxmVro
 zfMEOUPCpSpYrCOB4bZGgZHAd0zLejPEcMAhd135/TlPBvBIE+TVXLwPYUrMGXdiI+M6f3TwW
 f1ufwnMVuq9qeepldq6jVU9tYMXlKnv5zzdzCPQmCBN63ngrSn7DAeGwBpSXtjs+bOXcIX68o
 /lVgYBGsYLxNMDjYRVYrrMZEqYUUe+aM+8nkWTVD0g3c8KucZ/jkzNZZH2sEIdsbW5tNDuV8C
 6EhSWxZi0oTuekXREi6GD3CN7N3hRiXepzhLaN6PKYsKaegkBEzhStv++GGYCAGwvZ7m656Ka
 fnPIc9sBsU76Npk5Da7uT4RgIftrtjuyCrJ+YdZmbPDdQwDETqFHhncynAUSA/jDR8F934D+G
 GWUkLri4P8uWY+dU2HftIHSA5WMlv45dBcL25hWxOglzoKnvq/U6M4M3a3I6SvaBXqv551tKW
 NvMKDyIlV13/LJesRykYBsemcdv6JOYm3r3zk1tIcwAh1J1m/kvab9osmNAFzgGA2u6ESmEtQ
 uRRss9Ybeo8YtMXRjObm+e6InqezhUxJGuD1hwJIR4VrrmPM/hO3O6YkM5PJVIFrKm8qXHIO1
 ASRxBVl2YCcUfqNUyztkhD4b5A+jhkpwkcYWRJuN5C3ZVgAy4TEFXPZS0b20xEeCxW45iLX6U
 2VmELMRS2zl/u+qY2i0CTrfwBcbFOgBRRRkvANr3rgnzTleaPuc0c/ObeJvkgNp6Si8md33RL
 v8S0agisAlvYPi+0lIEP6iygRFskPlxQtlnwiI6UlMApXMdjaR6952FDoaxOoW+R0KJknsH5y
 mKYwWu6o00BaAnWbdnuqFpHW1u4wOUJi/OdZZ42xb8Durt3TIrH0W+wzcptjAV+yFjFXndHwu
 5uJ8y91JCMkdc1607VFOMgmsPpfU433PzXteGH8LWiCSO8It52O0bUotXNtpiSej/+1lRY/X7
 fYB9XvvJSw440pq53iQgNBOzJKKFfLBYprbHetcTSgtHglrhfu6EmfYy1vhRT4KX5kTyX0Vyi
 j89atSaDAqVgBXREmJhMgJvdOYLaiis9M4HDR1fviz1LqsBojurRE0OelKJz8SadU9fGohdDa
 LBrVMmQ01pHcs1ChwOZDnV/hwhn+r76KcKuOd55HJhHCSCI+J11iMEUn8Qkqw+fD73LvnOjPO
 K3nAZNv1cR8niT7UZ1qsJGYqaLD/ezNFDe6vB1i2eVCmr0V6qK9aanLosMFuZegh2qtw8V8i7
 p9tcg6vY6xRxoqhizFH0VJYvCwwVtEuoGvax8kW6FK8YWSh8LS6mM/5NwYz4TT2rG4Q5VH3C1
 d5jp/6K4jxIYy+8tS9sQG7y9IB0Qyl8XkypFH+RfDWkHDBnZ5QTNyb6N54jZQK3rZMQfPQ/L/
 OV1PmFN7RMurUZcd6laUNhY1OfEfZBgY7lEO1RP5Udto6Qw9PZ+5ZKnqQ4pu/gW4kWbmUaRW8
 mSG6SYYlBx4hUpED3kBGw6EdfSqB7wG7nmU5QyiS4TQaPUacTDf17odgGGCHx3te1f8LXSrab
 bW7liDNkBe2XPzFhmd7XipFr01pCZMK7JiZv0xVWI0rICTk1kNx45QBZCOyL/89dnWIDH3Bxn
 9eNOpTP7ILkE+5zzDD+vtqnGH2e8xKkcSauuCL4N1RL4AxcbIRwhG1Tkav0h2arAzuuPtSYdr
 60wZTh7/l7sNYnBbig5pAaYQY+xBcphtAGB1P8umJ4Ya/YTYjWHrUslnGR3swAfBHuSE/imFJ
 kve3H6EqCUeSjWrWRLuQBJauYrCV0AZ2AvOVEZ3Phz7COrP2+xoLL5uWiImJJl/LuPq+6T3Hj
 3HGXR/ktD7sjjomlZiKBMIkFfwVl/JCfy6Muddqrm4Mrq4DHfFF2MEUtjb6ykgP5HuO9ePuDt
 Qti0QlzNSIlT6FcaWVdV9BZ4mwopjNd8V2WImQw5NtgHzvjAmLwhWGSstF2Lzzhif7ebJCQIP
 Wx+jd/1ZLoXJ9mXNgOuz2k0mpuk7E0JpViLzpXwu9KgtTzpi1IGiMW4mQdclK+tNX40u1pwdy
 wncudWfMaREF+R2bmgbon7LtdY1VstGRS6eeaGRnYCNQoCj65WGnHeaTEpCWmuCHWO7GQqpQm
 9TqBOTIre/SJJ9aqLYQdpVDSJ1LVLPCHcgpGNV+Csnnmt1UQkgC7iPHJHxWy8k/wnqCRpS+pg
 yESsmG2mcCSg7UjFNJbl8eAnbVVsRWvbw+Zh1GUSCSnMVzlH4QsS9ENIPE+LFpqvGLC6RzCmi
 cmnUW4wX/vrPKrzVjPNm2UytawwxNtEnYu4ySuqUrH2drvFiduczz5rwfsJ8kBjVhQu1Ay3S6
 1aqb963W1ZOT9ZbMhzdm57/mCN9FJ0nFaTnITkiB/rYcJ3qYC09qzG8yrhfTZM1vD8XyUY9yN
 PlYl8e14J/FhSbvZKel1jvrRY0ZmE5fD/u46t5gApVE+VbhI57KPr5Iyn2izk2Gi6+TDsg5pp
 estz5lt9VCVPpjNSVcKG2pKHX8iSleYPrN3DC8KPxLMP+PEdljsQeoy4i66QckURYAdaXRECt
 X6wO2fRiL+HmulGK4FRtrzM19w/PEdtqFCLMYvQc1tjws7PIcHtxd37RMa+Ll9C+oO0MCfM2W
 YnWkL81Zdc3rMD9NnB2m6lMW1ZOxd/qSIZxNTh2SuP7I1IOkmIwiPdFo1C6bLsoGQ5gY1VQ2Q
 yhs1iKYsnoSFYd5SK94VAenPbzvYOwcSBKZNIorVfQbw+o+lTnVaaPhohhWTDZXKmD8Hoyf0U
 Ox14bihLBtIDP3FJN7UPDrNVgMRLTUzHqPkSQBSdAPzAE49WDQ+gz9Dxarae3p

Am 25.06.25 um 23:22 schrieb Benjamin Hasselgren-Hall=C3=A9n:

> The laptop do complain about not being able to load hp-wmi during boot. =
Same on Fedora 42 as on Debian 13 (with kernel 6.15).

Can you share the output of dmesg?

>
> I did install thermald and that might have increased the power budget (w=
hich is good) - but introduced some bug that keeps the fans on even while =
suspended.

Please elaborate.

Thanks,
Armin Wolf

> Best regards,
> Benjamin Hasselgren-Hall=C3=A9n
>
>
> On Wednesday, 25 June 2025 at 15:44, Armin Wolf <W_Armin@gmx.de> wrote:
>
>> Am 25.06.25 um 10:06 schrieb Benjamin Hasselgren-Hall=C3=A9n:
>>
>>> Hi,
>>>
>>> The acpidump is here: https://drive.benis.se/s/pcKLAL7i8zncX8q
>>>
>>> Best regards,
>>> Benjamin Hasselgren-Hall=C3=A9n
>>
>> The hp-wmi driver should be able to control the platform profile on you=
r device. Does this
>> driver load and register a platform profile handler?
>>
>> Additionally you might need to install and setup the intel thermal daem=
on for the platform
>> profile settings to work.
>>
>> Thanks,
>> Armin Wolf
>>
>>> On Monday, 23 June 2025 at 20:52, Armin Wolf W_Armin@gmx.de wrote:
>>>
>>>> Am 23.06.25 um 15:52 schrieb Benjamin Hasselgren-Hall=C3=A9n:
>>>>
>>>>> Hi dear Linux friends,
>>>>>
>>>>> This is very much a long shot and I understand if no one got any tim=
e or motivation for this.However, I am trying to understand how HP Omniboo=
k Ultra Flip (a laptop with Lunar Lake platform) working with power profil=
es. The reason is that it seems to be very limited while running Linux (to=
 30 watts to be exact, no matter the power profile, this is for the whole =
laptop, to compare with something the Omnibook Ultra 14 with AMD Strix dra=
ws up to over 70 watts, sure more power hungry platform but still). Also t=
he gpu performance is not as it should be.
>>>>> So if anyone got the time or so - let me know where to start digging=
!
>>>>>
>>>>> Best regards,
>>>>> Benjamin Hasselgren-Hall=C3=A9n
>>>>> Can you share the output of "acpidump"?
>>>> Thanks,
>>>> Armin Wolf
