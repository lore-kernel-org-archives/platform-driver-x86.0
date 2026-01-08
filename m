Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435942E3360
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 15:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887117; cv=none; b=Wj5szTD0eVrFd8N0z7HTKXnTudnG+YIFRxeFOIg9ONOt/w2L/v/x9fM1H38Z4V7G45SYByBzIerydkCSsd9Z4TZ/cw4XIrCcX3N6+JS8vKRmWHNR+XArh/+ibVcYVaQa1erxFxWQK0a9a9fLBZaJ3qryd+RPz+zPR7be5ZeJVeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887117; c=relaxed/simple;
	bh=k6TKR3oasMHSVqqjNPsY4TWycFch1n5uuTX00KbXR40=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FILkSTqejjx10h0wzlflvHGc81xovifIIdHl6ngqVPH7x5UfgFPT5pqMZ5eXAD6riLx9nR7rxq0gsHOWCZqRbopynRu3PCCpR9eGINwQBEzyf9njD2fYxufWMD74CTJT+CuQKcdsAfeocqyFX1QBKy33/BFyDJdBeu0YhJUWrAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lYQ1W0RI; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lYQ1W0RI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767887112; x=1768491912; i=w_armin@gmx.de;
	bh=k6TKR3oasMHSVqqjNPsY4TWycFch1n5uuTX00KbXR40=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lYQ1W0RIz5cpvBGPWcpSm0NbMvn468crJArCLpnf97R9S5pKYL6xLMhgCB49vUex
	 u1mIEdbti6N0LiSGodr12JnsEKFUEU5OQ++tDmGGFvy0o9hBXoCUM0++BUdMTF8ti
	 LbgQIY8N9U2QzD/iBvmz0UrjixBdLmdB92+/7NZuLeuZA1fEGhS29jnCa89dI3QqC
	 vYwfq91ykrFrKtS/Ez1C2KwTg2oTEDlH0Wkxii/HONmU2N2SyrlU/8ThXmQFMjGjc
	 PWTYAvyu2nqpYdT5a3n8qUxMg9bmBu/aa5K8e1zMnb6rScF8X0gBB+/J6x6yzNu2w
	 x4Mn+EMsDKEBt5VaMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.90.225] ([141.76.8.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9kC-1vf0Gi2KjM-00BuVX; Thu, 08
 Jan 2026 16:45:12 +0100
Message-ID: <4d1406ba-818e-4d3c-8e57-759e405e6576@gmx.de>
Date: Thu, 8 Jan 2026 16:45:11 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: platform/x86: acer-wmi: Missing max fan speed (7000+ RPM) on Acer
 Nitro AN515-58
From: Armin Wolf <W_Armin@gmx.de>
To: Pranay Pawar <pranaypawarofficial@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CACy5qBaFv_L5y_nGJU_3pd3CXbFZrUAE18y5Fc-hnAmrd8bSLA@mail.gmail.com>
 <1e4fe52c-d044-4869-a583-fa14f9740de0@gmx.de>
 <CACy5qBZW1pbYrrTc-1tcNwzGTuty=aovnrK17==CaSppXuBurg@mail.gmail.com>
 <abeb08c2-5aa5-4919-8016-d714c04c508b@gmx.de>
 <CACy5qBY-6v7_jRizJ=dJkeKGF+4fVUwmX9oaP=8XHGROEYOgCA@mail.gmail.com>
 <CACy5qBbgvgLa-y-TXz9ChaC1pvCAgKjQbU+=0Zd3gm-qyHHW_Q@mail.gmail.com>
 <655738e4-6128-4b43-aabe-b0eb0da0a0c7@gmx.de>
 <CACy5qBZmA47D1G9Ma5V+yn4bcZZYg98JCGtXeKX212FFUoo13Q@mail.gmail.com>
 <CACy5qBaPBFwZ6d735fNbtC6_U4r9imzgeLuYpBuj0ckBXVDhPg@mail.gmail.com>
 <fec3a103-1205-4584-8975-c8765f8a2efa@gmx.de>
Content-Language: en-US
In-Reply-To: <fec3a103-1205-4584-8975-c8765f8a2efa@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wFzDXo1tt1WircOYAfo7bHyUx7MwDgUFUEGgaQKoQMjWl1mE9ER
 IWCf6PiL8Lu+6hBtf4pUTSbGHhfjkAihKmf3TyHJExG1CoR9Jj9CexRHscMyapnPiFs5fj/
 aSxvNjILUZTMuH0eU1TwbEZ23TZ+qBNB2vbCdlZPnqVa87MgewKIF/hi06Gb4qXTRYyabdU
 t0fWXRhgiN0gE38BfSOSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tC0w9I9nIE0=;7V+dOvOxtENA/cOAJBRAD68wK5O
 RAif9YMoqIvI/1dbhxcGI0hhweYgbxixE5wmGrMHYRxv0yB9VkoLOunVgERKhgQ4xeKr69bbs
 5ZaLqpD2q+JpbqmuddElu/rY0zZDxdC65Se/BtzwjT349+NnjII8VQYbBla/lUab0lNRmbbR2
 lqfiRwUyieMCqCVCTF7qo7/FUMN9C7CjUGKp4RNHNGuAfM3oDNmbSJhroATVaQRFS6CyuCU6H
 r6CaPK67gHk4VKSUKFzZKZguFBu4dreB6miDWKHqD6ufRTfKNwzVx6loIwNX2m5f81XVyJCi/
 GyvFWZq943Uq3m6zzNc/ZMMtPAish+ejloM8d3Z4OHfjGuO6LOfM+Ub7wOSiWtEnHkT4ScsSR
 psmf2SBjvyVUORw0062wzZb67FkgCApjIHhF5g6ZjuMB9D+x2V3s025YBYXAQ2vCxQpH7vlvS
 nM4GXsEq0yxOTMasB/sEYG4ulGBsVcQ/nV9ifGG6Sj81om16nCDQE8d5gI8PiUl2NUqFcaAGk
 O42J6HTqEYcBa4z8feCCYMrlAQxoMNJBb5c9aCxMZPGEh0Dh93tfKiLqDkwhiQCqeFpulmPPU
 LliSv0G8MO+0tEl/UbVEas6TVBpN4Hg47dTuJflKe7qOemWInk1zDvZrAr3V/QT8DleEnUF4I
 bFRG2bES/SulIfQpTIvhWHU2y8qWh2x/ELVp+6jvgV0q/qWQHhzhZQbf0ldp9rvY5HJ6u8pqA
 VqSaQVOPKVOseiHeTlTDQorolxAXmkP90CkPI9zoS+gvPd9smy6zxTPno+x+Dy9JrpzUgDl7B
 H83qSPDTMrzXjTZ3LhOKoblkb118q1KboOSCNZ8tPShiFdRf68IAuA3y2Kzj7hsGRUZjW9+qh
 EmkjTgG/pA7Iz9FnxXpV0sGdesSEdnfHM9tzzQ27l/tdSCTKJO4tJwU2cduES5FlqwbFH65qj
 0xUrxjIPjU/aq88EhW9Jkte18DtsgcxPCpIBACGhdm1umqlLjsGPIx3nLTHQWo9fZpvsBiI5z
 zh4HIjU3BZUrzdkKhY9Mhad9z2hIlE42OLrstY4UoQrlTjW6zmW+aL326nfOBF48I+tPcKweG
 4JC5Q0XuFL3libjsJozeBSjcOXGq/JQ8feFLpNCM1/e52wMLAZdY/3OmuYajgpeP32XvZbXsI
 yrrpD7qFm7UQbC/FSLo4rLqE7cWAOnLgEvR9uTcUewmnRocY5gsT6osiv1M9HXWWhP8ajR0yd
 gYvB1VhXzLBwPMJCGeUiy4KLctvvTDj+oovW/QLAjFAzcrUKFY+3RJA4RXTemUNmuFkkJHM2M
 NVfC96rCX+urMryqh1KW2fSFLCSyMDjioPySvYqYwEyOeNN8x1bZvptDJnC9fdnyajLUFaUbe
 /BsPJtOPl/f8ASvUcSqMzqEknOzXGiQlXo7w/PZIGSEeCq6FRHfgV8YiXzgnNidLptENXA1Dy
 RVrbfXpAFoylJkC/ZiOHqYwT9v3P+wrbJBxVaMNFy4ZbAA+CJWyrMvzbeBUJoet+Z5Rop3bho
 XfgBdx2JZqX6qjv3Iz73yobqqAueg/DKbx8gtulvhqC01kMm+1xa9uh4cXCXyVs1QNi9Ue6gu
 m2uXD2zC4nKrvzbqIyKCHrbYraQe6TeGKyzmdlmOxPjWoP3bu+xLqAXDfVLo48CAZdlxuaO01
 1nopcZArOX9D3XtAZtEiNZlg/pqvVfJpT3+llbuKhNnOOF6Uhse0V0yQBGXsRWHLSvF7azzOU
 Bk2ryMCKf31vcKRdikqsHTdAe+MzT+QhineCiL+rzDPMfHvJzCohZy0WWvt+Xr4i6Ta6uIm8l
 RNRbGJZDfxfZ2T4/32S/uF+k6yZ8AHxGt19IqGyBXG4+VzYz4i8+74ogohFWEm3L1C9e4wDkm
 EgdBATLyHGe1EctjzUX9f2oaSlglDH6VPWj9EuB5DkSL1Xlah3g+YqMc9k25XrQhns1XLYCK7
 pYmSZUb77TPT0breorUtJBsewYDdKTDGwgR5scAhDIA9RBVqnhIG0LVTgqu0eBPTs3xpZe6UY
 LzE1khNm+IEcw7o9vdU8XoZ2XgFSI88Jpj6sEuQocuexdc9z2fRDiVWnil6f1U8O3tokchx7a
 erbxJfpP+5aPNkVa/gmxdQhNYtJLMEZTEBZGcAHB5qqfeTSkizZmjdWkxv4xzNkcm900/LlJX
 vmzdVkUUPwzv6ihrU5QCw7oZytA69bYLY8L/RGVlI01QQIp9VQ23GNvmzJ2rQDFmn7bXiPeHd
 UFdm3Faz9OFqIZXHZ/wPjChHavqxNDrA/P4CGlenlGKjHKlfXODSBVcbtNPwDwXyt6CipJdr8
 34AsF7ewMLYlGftiapt/loi8wc9X0UTvPHwuYj7Gu8F8DApQonBifV83JDFgkU+VlhOcEOdnw
 jnFgHphm+mSr9ObWXAJ9GcOnuG8ub/hK0J5x+W6uBOhuyarazEPHyqfyak2WJuEp7JSyjNAPh
 aqjTzeP07DSq9t0aU6gRhibWmCOzn2VzGoOcnBjNi1nkP9FV4j30gi3lebnihhR/HZC5sl5Vh
 eAY2pOq61cU7tO0aC7vy1w4C1LDOzpiDTLFH0O1ZgG+6KWgENGEV6jlh9iLK9e7lu/oo57fqH
 qcW/m/WRDnMCdQAVAQo7NhTVm2bOialOlzfrDqFhRuWAxdNMOs7XGQo7Eqo8kMhIgiHd/c9qW
 28NLfxaykBxsPjHz7y6U6dAeifC8RIw8J5PX+0iLKxRf7iNy6FDokOmg9zy8bTUfwbdKoKoAN
 Q7/6+i11cInHT0KzL48vwT0nJ2AZHUJBmCYzr6BfwB6CX+bGLeFFkEqfV1pRaR1KsW+bjC9IP
 uno9lacr+i1ackCPah1TFfRKfyEpyz+C5QMBL77Vcd0i+f35FR9DJ77C9TWBjeXJqhAZfNt7z
 FP1nlX6lQ3dAsqePw8NaKXVJZh9ctl8v63mDQ7OZYF86rfwoEBaSSAuseLSlmTu3rPBqmBEmz
 IJzrWY3q1025QD6nH+WvY9EVg5ifAkHyWeJzvnV2Ybvvz71i/A9ShaTKT5bCj97XbsJWZlwF5
 lcMRfcAf6JqzJDqDFZT6bMEkwyYzZ4jOtb/lI3E+pfukZqXOzFnUzx7a63kIopudn7EagaUGD
 Cjm/dovpxL63wT65iPVpo4OWVu28Wc54TMYyVlipEpFkoXePMhq/G1M1nnIa+74c3yhNyL8a0
 pY6wRlkSdALlHG/Qd8b9DiI4d+dOFz7Mi4evzVWR9xOiesvS4Cfy2WiUZjfIF9z+f1dJ7MYVd
 gFGuUpiHwEMXF4UrqVT5qotQrqNofT7nWwQecYeDaL10n8+d7VgBXmvUESHJmzIc4UAfWvWkZ
 SzRzE4fcUKGvLbNigztfLObRf2nAy9W/caa/o/uZbBku7SnpVpzJUEGXF7DDuUJjjtM5MoDqv
 eT88wjK683L74lvQGYeRJlAFrk6Wvfn2MsI+fnJpyb7uYn8I2Q8E3PO4U4oSiJUc/YrtODTJh
 E7T1M/E3eUB3RdxfwDkBqDLr3cGLXbY+FOK/XDvz5BRh6aVwlMysHWa1RWaQbxJQuD0DvgveA
 +DHLvJer66yupxXaqJXG7l4vtocILR0rqvdGw0U+9U7IFzz0NcWjgJHbI44bWXtUfAOO9PAf+
 IVyEMNOpzi3GmQBYnjxpUDKUbPEpPuqSOMerbtVIEhjoS5vkpYCb0jY45Ghvias9ipjgCuTct
 yiu4kikfr+G5S1xPXhxCUubtG4WB6EyTA36d4Izol8HhQh0LsoYbHajP/oF3KjV5uueGyd7vs
 XgToT/IZJyINhhxbLvh6+rh+zE1zyNSdRDgys3v1FQhXs2Xtg2cNB+YvJkor/rkoJU5e2+iBN
 1dv/OHSuvEVg+k+QtXi3PfBjP2M6U9I1l1ikj6HYybWJhBBfDMmyk2byyXXZ8E4QYHEIVpC3U
 ugx9F6StaHX+Pj2vppVzPcrm97MFSWVATMOsehW5ILy8Ny/9g42GuXmKTd8hzrNF/O+AKmRI+
 lP1HH69KIS/2gkhOBJQC9F5VR6q7Oxwaw/ZaBmbF6iaxGoCgG3ilr6bb/a4931xy10iDOdgOk
 Sgfk1+4+y/Dbl6yt0VxZ8s91l3XcBJZMdE5XF5Ev5Po8L7VkE2aN7WSYxTVrgQCJbtwMTgLwS
 Nf8o6gwlbAvYOyQCT/CHK5U+L9nYvWpvuQpnK64wsss601oNH2JrmJCVJDZE05fEbSn1ijJRv
 gDHBYePfxiiMefD47fwe9rUg889ogWUZHo+TL7JcevFv6lT7KFYlELXjO5pi4gXc2yqPSWjuk
 PwwqYlA8klTefNGAvn/1HXUnkoCYWzyUvm5+glPtpm2XLvgkXIRhibDBl/YNYiRvIE9WkOQg9
 CjV1IDMN0mIQEN6ttIlKJ1jz//TzizWVl/8leQyWjFY7AeRc7sGr0Ssgyp56/Qo7mLkIiPPAG
 Or1g1vGwkrNcT8GJwT0VK4Z42HYciP+bpvHQaHOlzRrQmc/DAOH8kS2Jhae5CFXQxvnrIXflt
 FbP6dCFOrlr5lDC8mDYWNmnGP3/TIRjpUBfZwXpCq1CRvQ0sjQuIUm9vTYNN6CqJaD7lxHymH
 lPDdxVSYK74//xqFfj/7UL1NKWanR8f3+qVlixdEaN6GjbXM0NWfZaJFsda76upnUAkDwl5Vo
 qOrboUb6rXDinouUK24+BB+vNCQbbtARQ3Huy43swLg/l7k96i9LpUXdCyqPlUOLRB9SJpDjn
 R8FVbH4uIXDkmfEhmqjwiahk/J/oy+D+hswWW5n3YR4dbgMhTIyWdECg612qQscWUfe8FtzTF
 OjEM9/q6RJmPzjfoJBe2zcEJSDapU+isuENyRM4Jh8fwpakSs6PEq3WXVyzN2L4Qzvcm+tVGh
 CU1oGuxf56o70CM5xdFO/jVWq8TiJR29jDp8TMWffcJrEwRD1woeYJrP9+7Rp58gJUzC1ncsy
 Til9JN92ilQdmfjRcqoariVuBcDLrPW/4Sim1AviCd1HuVOx5lga9GzH5NHeR+gnbtUB9KOhv
 It1Wp5HRSt1LeMyOgP9Z6iSeXc2sQsflVoO5RM/u6IvGIOWfjLt4Himz/SFRjdUFOOuXgj6qd
 SQZjTASxD+ouQ25yzA6T5YhsBnLlSFXeaYYwu2u7erownBw+NnpsJie8HBR1feBzYQjk4L57+
 Eoz1KaAQceilGNve4kjJIl5PM21N8GugrTmNSHp94of22FmELmKtgZwoTjPg69MKYjBwYRwgX
 kR296JZvNI21f0/wm8hNsHS1ddwacwXNvWwdLS6uqWxgK9zdjYQ==

Am 08.01.26 um 16:35 schrieb Armin Wolf:

> Am 08.01.26 um 15:38 schrieb Pranay Pawar:
>
>> Hi Armin,
>>
>> I have tested the suggested sysfs attributes with the patched driver,
>> and here are the results:
>>
>> Mode: balanced, pwmX_enable=3D0
>> Setting this to "0" successfully puts both fans at maximum speed.
>>
>> Mode: balanced-performance, pwmX_enable=3D0
>> Setting this to "0" also puts both fans at maximum speed.
>>
>> Mode: performance, pwmX_enable=3D0
>> Setting this to "0" also puts both fans at maximum speed.
>>
>> It appears that switching the attributes to "0" does correctly trigger
>> the turbo mode for the fans.
>>
>> Thanks,
>> Pranay Pawar (Bugaddr)
>
> Perfect, i will send the associated patch upstream then.
>
> Thanks,
> Armin Wolf
>
I forgot to ask: do you see messages similar to "unknown function number -=
 X - X" inside the output
of dmesg after pressing the Nitro button?

Thanks,
Armin Wolf

>>
>>> On Mon, Jan 5, 2026 at 10:31=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wr=
ote:
>>>> Am 30.12.25 um 06:54 schrieb Pranay Pawar:
>>>>
>>>>> Sorry for the confusion earlier =E2=80=94 after rechecking the behav=
ior
>>>>> without the new patch, I=E2=80=99d like to clarify the results.
>>>>>
>>>>> ** Without the patch:
>>>>> 1. The fans are able to reach maximum RPM only when using the
>>>>> balanced-performance profile.
>>>>> 2. When selecting the performance profile, the fan speed remains
>>>>> capped at ~4500 RPM.
>>>>>
>>>>> ** With the patch applied:
>>>>> 1. Manual fan control is unlocked, which makes this patch important
>>>>> and effective.
>>>>> 2. The fans are able to reach maximum RPM only when using the
>>>>> balanced-performance profile.
>>>>>
>>>>> So the issue is specifically that the performance profile still keep=
s
>>>>> the fans capped, even though it is expected to be more aggressive=20
>>>>> than
>>>>> balanced-performance.
>>>> I see. Can you check if the fans reach their max. speed if you set=20
>>>> the pwmX_enable
>>>> sysfs attributes below the associated hwmon device to "0"? This=20
>>>> should switch them
>>>> into turbo mode.
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>>> Apologies for the misunderstanding.
>>>>>
>>>>> Best regards,
>>>>> Pranay Pawar (Bugaddr)
>>>>>
>>>>> On Mon, Dec 29, 2025 at 1:47=E2=80=AFPM Pranay=20
>>>>> <pranaypawarofficial@gmail.com> wrote:
>>>>>> Yes this patch is making the driver work as expected. I had modifie=
d
>>>>>> the acer-wmi driver and loaded it, then changed platform profile to
>>>>>> balanced-performance & now fans are able to reach max RPM's. But in
>>>>>> performance mode (Which is supposed to be powerful than
>>>>>> balanced-performance) the fans are still max locked at 4500 rpm=20
>>>>>> only.
>>>>>>
>>>>>> Thanks & Regards,
>>>>>> Bugaddr (Pranay Pawar)
>>>>>>
>>>>>> On Mon, Dec 29, 2025 at 2:10=E2=80=AFAM Armin Wolf <W_Armin@gmx.de>=
 wrote:
>>>>>>> Am 25.12.25 um 22:51 schrieb Pranay:
>>>>>>>
>>>>>>>> Sure here you go, in attachments
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Bugaddr
>>>>>>> I attached an experimental patch that should whitelist fan=20
>>>>>>> control for your model. Can you
>>>>>>> test that fan control and the nitro button works?
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Armin Wolf
>>>>>>>
>>>>>>>> On Thu, Dec 25, 2025 at 11:14=E2=80=AFPM Armin Wolf <W_Armin@gmx.=
de>=20
>>>>>>>> wrote:
>>>>>>>>> Am 24.12.25 um 20:40 schrieb Pranay:
>>>>>>>>>
>>>>>>>>>> Dear Maintainers,
>>>>>>>>>>
>>>>>>>>>> I am reporting a limitation in the acer-wmi driver regarding=20
>>>>>>>>>> fan speed
>>>>>>>>>> control on the Acer Nitro AN515-58.
>>>>>>>>>>
>>>>>>>>>> The Issue: On Windows, enabling "Performance" mode via=20
>>>>>>>>>> NitroSense
>>>>>>>>>> ramps the fans up to 7000+ RPM. On Linux, selecting the=20
>>>>>>>>>> "Performance"
>>>>>>>>>> platform profile boosts the CPU power correctly, but the fans=
=20
>>>>>>>>>> remain
>>>>>>>>>> capped at maximum 3500-4000 RPM.
>>>>>>>>>>
>>>>>>>>>> Observation: This laptop model lacks a physical "Turbo"=20
>>>>>>>>>> button. though
>>>>>>>>>> there is a nitrosense button which is useless in linux.
>>>>>>>>>>
>>>>>>>>>> I am requesting that support be added to fix the maximum fan=20
>>>>>>>>>> speed state issue.
>>>>>>>>> Sure thing, can you share the output of "acpidump" to i can=20
>>>>>>>>> whitelist your model
>>>>>>>>> for fan control?
>>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Armin Wolf
>>>>>>>>>
>>>>>>>>>> Best regards,
>>>>>>>>>>
>>>>>>>>>> bugaddr
>>>>>>>>>>
