Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6868A2367CF
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 15:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887992; cv=none; b=E3OYeUxvjeM5oUKLxcQmcZ04w+0+siqUIFVYupls2ZUNNQ1voUEOb9yEMldQPjoRxqC+1AxKFTZpWfgu+JefVUAPpoNt5esWUFIbEo98sJABhdeApc/QnrnYSKPZtHr/Yol0Fp10tmvS5SIan0ikde64tVtDg+5QFRc14H3wYlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887992; c=relaxed/simple;
	bh=08brUUPA6wwh1hmloTOURDmy3NMIYMfxb/Ts+5i+cA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhqpMiCMLV0Heb90bUoMBD5L0gHISDY2BXk2lEIuIQAgif/cjMXWmbnKUzcIpAU+4LpE3YgBovp1oGC6PqCPbtH3Iym5iK9qnTAp/Qs+6biK+75tOthGzXZQVHuZZhKyNzTymAylRN2fQoQf/BS5m8v5Mj8wgQNEdadq3k8fx+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DR7HN6dy; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DR7HN6dy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767887988; x=1768492788; i=w_armin@gmx.de;
	bh=08brUUPA6wwh1hmloTOURDmy3NMIYMfxb/Ts+5i+cA0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DR7HN6dy7lknE3pl4ILdfAEZfjmN6A3vcE9NekaBREMGpaot23O98ueqTLBdKRcR
	 gKsCSVhnaL2uMnlW1dN/X3UqGYiOMO9Glu3sfhtDjxt8jELgSIOz5K+q4jQhXRC2N
	 iGmfHHCiSAbhkG4gXETxUkBllATC4WL4GJz0ioQPrFl4TbFfvhM4OT1ALlwR6spLr
	 GUjyNpz6dD6LMa07rcTg0AhSkdp9PMx7bsP7SsxEX49ClwUL/o2l1QFh5Hmd6TNoX
	 qrhR+2pz6/TkCORKdOzGWpVoaKxNtCDN81QQNuIBuFi/6sXxrqDhAyZI3qU8ALJtH
	 6SOp2tkWneZgAQKtAQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.90.225] ([141.76.8.161]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAOJV-1vjhJH0yoV-00Dxxu; Thu, 08
 Jan 2026 16:59:48 +0100
Message-ID: <dc8c4eaa-0364-4617-b823-7f1319ae17e4@gmx.de>
Date: Thu, 8 Jan 2026 16:59:47 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: platform/x86: acer-wmi: Missing max fan speed (7000+ RPM) on Acer
 Nitro AN515-58
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
 <4d1406ba-818e-4d3c-8e57-759e405e6576@gmx.de>
 <CACy5qBbWn0xcPKXCWRv+t8_nHea7=iwW0Jyo5dbHqfwPg-JO2A@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CACy5qBbWn0xcPKXCWRv+t8_nHea7=iwW0Jyo5dbHqfwPg-JO2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:J1G8KQgBidkd1O3hqynfCyjfUe81d9YRAYpCzEhy+mKnAZlaflZ
 CSJe8fn23DIiFeebkiSt34kwx6X91P+rOH65TcM06BAaVKME8CkjQ+XSHv0n1kL4GkiZyIL
 wH4o29H8toDZJ2M0Gn4Uhou/vGXTA6uodCJzfvzVcHmB+VQ/PfEyftawQxhC6X2293lb7MX
 VLlMYEGSVv8UQqKTSCCIA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yP0KQCDHA70=;5/R5BXYVllvBH37SeBhWy689SLG
 aeBIeViVYhnQIlJ9U9mQdwc6amDPcqsz96FTBkd24u8INIt/fQ7Fc/xvkoUHk0P6kvrgjGFby
 jwssSXh16mzLlmfuJfMkxKxhJNY8q/4a+Ye8Hp5367j6mMhSj7K/Qf68ZjI/EPvC3PQWto0mH
 U2iHQklGGr9uxPrSDpVdndse563tNYG/BvONHYBSkDOYxFLcJsldggNKPiQqqpwwmjNuTyfVU
 Q3QnZon5s4WKCnFzp9Eh+GBmKLdxcqp4/QGjQlIdPjv5tKCVMkzkJ20LgXrPj5wUVDNJ2lsvx
 Z1sOs6qL+qoh2uar8PdZPCHz454vvlAwNQ+TxH2zycushDhdaQCEZ/bIj5jIzJEKSTMwnN4xZ
 w/LhGpk9Ydu4AKYYgTqdgFQczqpskt7r6EVMRr+5jGCb84sl/gn0OI82/WX/A1W6WVnnXV6rq
 RmtBu3AaIBM04B0DJQb7FxvFPQBfg3btO0CqjDdx3tWQ4gqJk65Jc1M5BwnVg4jRSqMhBZ0nq
 SOZlxFN90uzb3yr6AyU3LJqzsLbyn5jwENjYwh98aSl8gqT1r5frbP8ii6hfToU45bC6dFDJi
 e9Ja94XYLYc7XO8G0DmY26zNrvFEWCEhEeZO4uLgQGDiO/xJfglgqcXyzvlDsd28kt5/b7ryS
 lsnPTDMN+45NrMZt7d3kgWa9s7SSL2ZTKzi+kp5guhRd9c+pJ7petTQ8chvFh7jI2HdN+RP+O
 dWmngz7rKs0+X0t4uQr9ECCLzBhbxSr/YXqHwkHL9yn0u+4TFB+ERc/xGPUELDQ30OAiOjJY1
 to6F651LueQ27ux1oEmsjNOW81AjLjNLWiQQVxQrUdQW4pJfYqr/N121psAJrMvGBQFEk/qvM
 henQzcViDc6uB68UaSuTflmRLPulZjPB39Hh8iNyBA9JdOPaeOsREk7TTFxWK6JUzaGOfPPWX
 5wH5l1/uX3XlZAkP3iQHorGOoBsgS39cH/WMbkBUZYzWx0H4APPfcjQeZ2xD/s5z37Li4ENxE
 X4vFX4cFgs5A/DMVB0QrK2ZJmiWXAkZXmwBPS24W3jBwI7r6lSwFDQcduRIfNmwjDlD2/9Len
 das3PofWwe3NebTdBvHjSlVBxBc+hVCuMqHNHRgGNSA7dkxBR74a0r8W/i6mU0nP7faAaNKkV
 Yg0JB7MAekOOfu3UtjEjLPYkEoELRorRTnd8y9iKgRGoHMGThw1cPGk8QBm5GOk+h+bOXVWB1
 QMekjGkKPoAsG0n/5dHrCwmtuFIxsFwnXExqBo5PnsG3QMyaiwwHvgylyL6D/RxqgaFsmgydl
 F5tnT2j8EMhU4QyraMfCOsmS8If9NbZGmKYyGCQ9CA65VrXDf+eyjybhKGR427W4LTrjglU1e
 sdY00Bv4ZTZnJmiQ5b7yydxdjXlcWoHfMhfA8YDVv6jA3uFIV5yH6gvSrPmdBrVi9O2mBdum5
 fWRe/wPGK2DTAH+QO+VhChfg6BUfnirUjfp+LJtV9fASZpfrjoBD1amgm/I6bvYSJa9Jtm9zy
 QN/K+RPHwBFv71pNR89zM286kSQWBT7yYEFPLuk2u84Jowbs0nTMjVHx+wCYbYHNn8ZH0G8dQ
 HtZyUbyYNkdTmIMNSBRtVi3n1618ho2fsb+fgOdrRPMdBPMvgNu2JGK5QL9r+csgv9aMAvckM
 PNA3uPMdih1SCxPRTJEHpa37t/1CcaWCPDkKQvhq/SNnHWVlPRa4PMTdX2oP/W7gZtJ+ifj6N
 NJgAtogfxzdxGFgJJH/8MdPe6MKS3GPOkRNtGbWpZhwj5u/1DolnQZadmjoIsH8+tHA/EHqFB
 DoAwVNUOUNwN61ZSSk85Gx3ZK8KY5othwBCmoDWK4RMj/ZkXzSjrUnADPDnpapdmpzbI5e8BK
 ELjybAdOxONeGueooyhHENHT5cchx2RaZm0Sq1gj02haXxK+XU3Th+B730Dsp7p2gM/zKIHvW
 ERFCN7Mnq+NiVeUW7+jToU9zIstIWZ99KwfLpOE7npCz4cGxeTWc3hQQrCszJYThmk54VArBe
 n6e7PA84VGS18FLebAAjJeRgk3pExC/DmRGS3xdTIPk0k3FErUU76H+3ugv5//CJ/utZWUHyJ
 znxcM0wWO7p0MRCUTcVabd5CMCDtRqhX8yJhUHzJUDCigjnWvVPjWhCJ/CtdMZTBr3V+Vbr4u
 Y9shb1nrI0Fa1S3VgWTN2oTQ6MzkTORi/2HU4imolupPw+BAeIBFq8b4x5llKhoLQ4B7PfTlb
 fsxKdpLFOBWCKbyPtp9nCWtDtUP5FH3Mk+b5rxNRb5gggTnPxe84Q714ZLGVVzPh51ZLNliSn
 y38NHNY3xBRTiudoFcF6h6gz0IxHwwtun3exTGpUF+7YDdyMSwkjTDkcUYS+TqsoXQKjPGUVS
 fFEQ3TKn0jqOju2SJklAyhVZxdVnUg8+FPokzI4/qImcQTx6lSp3MqB5Vguv3DLblM9a9+7QJ
 +1tlbJDlEm3/rVd/iEPJxqms6/HYDFQH1e5t90vMhkc0/th0G102SjrU7p6+c63CKzsNChtJf
 gxLHYvhGVFiSsmN3vJix6X1lJNJcYk5Ekx8kXd9aRUGBXU7DDbRFdkjFXHmIYlO90HkyElwhg
 vq8k24X5H6V/aKK1GpXln1vhCYK+VYT4F0LBmL25bOeJsVeVkKuTAbOu4Rlwd+7mQai9+pwCy
 Q7NQbqu5Bu2AHtMY/yQ3VPrDEY1kdHqDYyqH0GFrbPXhv7C69lweR4OcEp9y/7LYl/LHqKEjY
 /WAfIIF6IgOuNn2EJVNEKyZEq/S1x2O9J6gNtiFhUpNtbCHVppaPyW6876UB7XJX71/uicYdn
 2DcEzwvTgb7BJODd0p/wrxJzm5MIk80VfJ3DMblM3OfSOqIb+Ii8XcAYvZMUWvHzB7eOXZFrv
 93EYcPId8995/DLdoGmFA4XgAY5OVhPPKO2Sv6qsoAoa2opcJQAbi3NoWNim273OobVfGakOu
 1POI4OuP+vTvnaFLzfHqe+tSFRJCbvoAmS0QPd3MmGh+cVd2cheNQxGJcQ02DPmY8tAzQTBiS
 IdDLPVISbZSGXYiASkvte2hRXftx6ISBa/1ogLG9nBjDuZwWv/1ZharYFFXMyQMfLvTfl6kL9
 GnYAHQ5efTDHxgi5bzdu6kucYHjUFLz1peqNNGNo87nAGka48Iud9txnQ3soxjnefQ1ldIFuq
 8+8M5mz3NkczRoqFJmwqNt7I1e4+L93Mef1wx6zXZXSMcq0R7c3EKs1o8tX9fjB8pCCnN9z2P
 z8P3Wud8AlO5oHErHRBXtYddLRemzzs9JZ5HVzpn+5VmermQPbkpGhUNAlJm85u3+D3moCSip
 DRy2zvdULnVNcptNFfTLOiFnnHOWKaPdOp+QBbxM8KtMbPdULPUJPgxNljI+3FjQgFT5ATht6
 mDgWHrHwHxs4e6FYdMBqAJJ7UkP36tjGbXGtjPQIAb89jTDsw6zNA0XlezlibPuojHxv3Zhxx
 DMnlLBgx5y41xGnDIQfw+V9c2y/xwNHwjVIKxVoI6uT5tPHLTFpeyzTsbXlPm3ee5dnTn5sDc
 9+DHLswumJ52aePZ0v7IYEDcGJ9qEZ9gPpjaiUFNbtrWWk6h1gejqGrXv9gXACy+FzKMU70Uu
 hYuK2q2z9TYaQFN9BSMCMn+n5BauwjxeG/qJRw7DxnssOs/CvvZhftQsJDtfzLBYQPbOtrDal
 Z2fGhKcAsScy7ZdcA6gan3pF2kJCdssY03kEliJ6rvpTAnoknZ/IUsvHHo48KRmPbFAiZMA/d
 hrwC+lshM44Eby5r2J7bBibZjM8WoUDSRvR3xcoyGw4WRB6ubSDWJ3BxEnpPMYDEHpwXVCUdk
 N4Tlt4FVs5B1KwuDO7X/XTEpTQAJwX6DK3zojbL065k7cqBDK8NXL7srFTcQ0LhB6upTUBUOv
 MgiBkIOnfm/4igbvAsmwyHyKgKTflWKu+DtMQeemTkKDF6ghmn3wS3YT0/V2F0TZZC4aXsF2l
 NzvBNNGtNM95iA24MoDn6Uk5NJpBfYJVG5fePdeCN+YpX6XPbK76ZOzB8CshIt3PB4PuaVkeX
 r6rQSefC6eZbEZ249arkxCcy78snlGGNH/wRKVNIeXsNpPwCnC+5v435tZ0tevdJcLi6qG4Fv
 lB+6AimpOiMHE4YVM5lTg/OyAWeK+QmDTNoHb8j01tdrJ2p/3xb+H3ukWm55TjyVjodFRKtMq
 t0JfbzbL+BL+sRMVpkTpqD3cRvD8zhS8aPSMG8iBHhl5Q4oEFv6z8S0FEJB8Fz5zF/RQXSEk0
 7sZ2vOCiM1Qpn69SNLuy51YjT8is5dV9tFzjqQ0sP6G5GrGALr75cMX87pPHmsJhdXpWz5bYG
 RzutCUHDtgtI4aQkSZXIensQVPXEuji/vbeZqYN6Ysl8GB2uQOxk4fcH+H3se1NbQgo8ohpBU
 L3V2w312bzEz1cDHbZAm/4eBBdiDFr/0DUGS2gFiI5TgOwitZ/BYcmRVWjLd8jZuh1LW2uWJ8
 xhiHEmOJqQAvgFGFzzD2t3pnK7GoLdipn2WmSGVXMq5fmRu8LtTdQtP5vBgs26nXVcKmwi9R7
 M25TSfQszahPxmjZ+CF7WMji9GYvdXHaCBbSX5UkAaxtFyQKKJ4yFc5QOnoO4bomIXKS0reDZ
 +yQ8Mx5lgkby4UEoeqhEVI9lk5PpoW2C+3hdIoQngoqTtIIlRl7pvyuMpIweW6RK1kedOT7c/
 zRQmbQ8WCnYvl+0Roqihu7UTl3OWA6DnZM/X7WhGhr6aIyYjUuaHliMIuPKCOJDdDXFohE3Ku
 KULpNcKvi8IezRyRWqML39NU55SZulCLmabSof6SEpvheNpJqX7ZwfZbBeQDg3SBa6pC5yUN8
 sQqLlLJlW6WAj7WiBAzMzLVRZYt1pouClrY//FTcjnQyWN74QlynKYWd2TfUNbntAT/sh+ntC
 8YpUIovnI/fwRl8HuI2/y8ggZKN/wdPY0U7mAxBx6/7M7QVL+kf2sNZTfWvgLmeTCeeiIblyH
 XXVTZuU2GjAMeDcGVu+wWjCUC3xN7THdfR2hSTRwToMbwVUy5KLjj2mp4yK07pyARRIRq93eS
 2KMJSIBlH1/f3zrskPIF0yGa/GIZhiy0Ur5PWqnF6M9dBC4QdBCVRwj0W1xS4/5fattsRN5Pz
 TEY6K1HKB0I5IPeq7Vn2MnpyGoEvi9OSxACmhkxw4KZQ7fnYDpoCuz3R14BnEXscsN4Rqpe1n
 6ZFbLXU2u1zW12X/Q3FMQXGZLsZnq

Am 08.01.26 um 16:56 schrieb Pranay Pawar:

> No There is no such logs in dmesg.
>
> Regards,
> Pranay Pawar (bugaddr)

Strange. Can you check if "acpi_listen" does report any events?

Thanks,
Armin Wolf

> On Thu, Jan 8, 2026 at 9:15=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote=
:
>> Am 08.01.26 um 16:35 schrieb Armin Wolf:
>>
>>> Am 08.01.26 um 15:38 schrieb Pranay Pawar:
>>>
>>>> Hi Armin,
>>>>
>>>> I have tested the suggested sysfs attributes with the patched driver,
>>>> and here are the results:
>>>>
>>>> Mode: balanced, pwmX_enable=3D0
>>>> Setting this to "0" successfully puts both fans at maximum speed.
>>>>
>>>> Mode: balanced-performance, pwmX_enable=3D0
>>>> Setting this to "0" also puts both fans at maximum speed.
>>>>
>>>> Mode: performance, pwmX_enable=3D0
>>>> Setting this to "0" also puts both fans at maximum speed.
>>>>
>>>> It appears that switching the attributes to "0" does correctly trigge=
r
>>>> the turbo mode for the fans.
>>>>
>>>> Thanks,
>>>> Pranay Pawar (Bugaddr)
>>> Perfect, i will send the associated patch upstream then.
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>> I forgot to ask: do you see messages similar to "unknown function numbe=
r - X - X" inside the output
>> of dmesg after pressing the Nitro button?
>>
>> Thanks,
>> Armin Wolf
>>
>>>>> On Mon, Jan 5, 2026 at 10:31=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> =
wrote:
>>>>>> Am 30.12.25 um 06:54 schrieb Pranay Pawar:
>>>>>>
>>>>>>> Sorry for the confusion earlier =E2=80=94 after rechecking the beh=
avior
>>>>>>> without the new patch, I=E2=80=99d like to clarify the results.
>>>>>>>
>>>>>>> ** Without the patch:
>>>>>>> 1. The fans are able to reach maximum RPM only when using the
>>>>>>> balanced-performance profile.
>>>>>>> 2. When selecting the performance profile, the fan speed remains
>>>>>>> capped at ~4500 RPM.
>>>>>>>
>>>>>>> ** With the patch applied:
>>>>>>> 1. Manual fan control is unlocked, which makes this patch importan=
t
>>>>>>> and effective.
>>>>>>> 2. The fans are able to reach maximum RPM only when using the
>>>>>>> balanced-performance profile.
>>>>>>>
>>>>>>> So the issue is specifically that the performance profile still ke=
eps
>>>>>>> the fans capped, even though it is expected to be more aggressive
>>>>>>> than
>>>>>>> balanced-performance.
>>>>>> I see. Can you check if the fans reach their max. speed if you set
>>>>>> the pwmX_enable
>>>>>> sysfs attributes below the associated hwmon device to "0"? This
>>>>>> should switch them
>>>>>> into turbo mode.
>>>>>>
>>>>>> Thanks,
>>>>>> Armin Wolf
>>>>>>
>>>>>>> Apologies for the misunderstanding.
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Pranay Pawar (Bugaddr)
>>>>>>>
>>>>>>> On Mon, Dec 29, 2025 at 1:47=E2=80=AFPM Pranay
>>>>>>> <pranaypawarofficial@gmail.com> wrote:
>>>>>>>> Yes this patch is making the driver work as expected. I had modif=
ied
>>>>>>>> the acer-wmi driver and loaded it, then changed platform profile =
to
>>>>>>>> balanced-performance & now fans are able to reach max RPM's. But =
in
>>>>>>>> performance mode (Which is supposed to be powerful than
>>>>>>>> balanced-performance) the fans are still max locked at 4500 rpm
>>>>>>>> only.
>>>>>>>>
>>>>>>>> Thanks & Regards,
>>>>>>>> Bugaddr (Pranay Pawar)
>>>>>>>>
>>>>>>>> On Mon, Dec 29, 2025 at 2:10=E2=80=AFAM Armin Wolf <W_Armin@gmx.d=
e> wrote:
>>>>>>>>> Am 25.12.25 um 22:51 schrieb Pranay:
>>>>>>>>>
>>>>>>>>>> Sure here you go, in attachments
>>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Bugaddr
>>>>>>>>> I attached an experimental patch that should whitelist fan
>>>>>>>>> control for your model. Can you
>>>>>>>>> test that fan control and the nitro button works?
>>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Armin Wolf
>>>>>>>>>
>>>>>>>>>> On Thu, Dec 25, 2025 at 11:14=E2=80=AFPM Armin Wolf <W_Armin@gm=
x.de>
>>>>>>>>>> wrote:
>>>>>>>>>>> Am 24.12.25 um 20:40 schrieb Pranay:
>>>>>>>>>>>
>>>>>>>>>>>> Dear Maintainers,
>>>>>>>>>>>>
>>>>>>>>>>>> I am reporting a limitation in the acer-wmi driver regarding
>>>>>>>>>>>> fan speed
>>>>>>>>>>>> control on the Acer Nitro AN515-58.
>>>>>>>>>>>>
>>>>>>>>>>>> The Issue: On Windows, enabling "Performance" mode via
>>>>>>>>>>>> NitroSense
>>>>>>>>>>>> ramps the fans up to 7000+ RPM. On Linux, selecting the
>>>>>>>>>>>> "Performance"
>>>>>>>>>>>> platform profile boosts the CPU power correctly, but the fans
>>>>>>>>>>>> remain
>>>>>>>>>>>> capped at maximum 3500-4000 RPM.
>>>>>>>>>>>>
>>>>>>>>>>>> Observation: This laptop model lacks a physical "Turbo"
>>>>>>>>>>>> button. though
>>>>>>>>>>>> there is a nitrosense button which is useless in linux.
>>>>>>>>>>>>
>>>>>>>>>>>> I am requesting that support be added to fix the maximum fan
>>>>>>>>>>>> speed state issue.
>>>>>>>>>>> Sure thing, can you share the output of "acpidump" to i can
>>>>>>>>>>> whitelist your model
>>>>>>>>>>> for fan control?
>>>>>>>>>>>
>>>>>>>>>>> Thanks,
>>>>>>>>>>> Armin Wolf
>>>>>>>>>>>
>>>>>>>>>>>> Best regards,
>>>>>>>>>>>>
>>>>>>>>>>>> bugaddr
>>>>>>>>>>>>
