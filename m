Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF87A48033D
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031880; cv=none; b=kvWb35LjDpOcHTPxr4DfQAwypBNZSNel/5ecZAGoxgAH7VM7ut73Hk1sk8lBbl7frO0xhLUd8dKiLYVILjRMwc+NNYIUgBavfaBiFmSk6Mt3hwkMoRuitn5FX5Min7cvZZQj+Y9O5XHy9wKcng/A+HBh0v9PyIabiu3O/nx1xWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031880; c=relaxed/simple;
	bh=9hwgIY5vkxrHAsfsKeY3AVSk7FGttq0S9/NS5jAbauk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ic57xfOmeyNr2+oFWfj7xSb3ApZf+AlK1e41IJNpgefQvDxGR/2G1wPC8tQKNDMVCevsv3AlDoVGgKDV157Rukp1rB8npo1WiZrFWX6oDWvdjKGk646Pt6POpkYM83Qy2GTczMoqezndcOpSNO9liG8dLLdczlsvT4/FpVto94U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QaEd2Ly3; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QaEd2Ly3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1786031873; x=1786636673; i=w_armin@gmx.de;
	bh=9hwgIY5vkxrHAsfsKeY3AVSk7FGttq0S9/NS5jAbauk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QaEd2Ly34SepWBmbv94NtAeZIPM5fLYRVctDiFAQffT5xWIqxlE03dN88yHmVBrn
	 i0TcE6PpjpIzD7Wp7Anmo9Rbj9wADubonTpsFD+YxrPvFPmCgmS9jrqkrPF7suRpd
	 EbUl7HMhDl2t5qPpGK+sgqvfnRSCUSBgUR+ZYxmlDRyKj2Yr56RAZPPDZ7dGXKchb
	 FUo9dygs7pl7FnOEwtRzKT2aV7figvdQaKFd09+Xs6HLBkQtdJtAlhZQNtjy4ws1M
	 XwEqvT3tRASxF1aWvSNra3hidM2qhZbATEes9z2ly4SOpyXVUP1yiGNGkUDAiUHKL
	 EGCKbTf9hdLCoqhacg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8ob6-1wvlV111GQ-012Fjf; Thu, 06
 Aug 2026 17:57:53 +0200
Message-ID: <6dec7775-c527-4bc5-bb60-88c0d6186181@gmx.de>
Date: Thu, 6 Aug 2026 17:57:52 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] platform/x86: add Acer battery control driver
To: Jelle van der Waa <jelle@vdwaa.nl>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Frederik Harwath <frederik@harwath.name>
References: <20260531090505.156394-1-jelle@vdwaa.nl>
 <20260531090505.156394-2-jelle@vdwaa.nl>
 <97d09dc5-1434-4d64-abd7-8ba465c3891b@gmx.de>
 <d72a7db6-4ec1-460d-8d40-c63301c11123@vdwaa.nl>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <d72a7db6-4ec1-460d-8d40-c63301c11123@vdwaa.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E/y6rK5XWrwlMrRroEH7/12rkfpZm08CCAOgXA/zB/43a5DiIih
 HqMKhRBMlDeScSOmBpVSy2gwpewqvmjm0cLjFA51T/0U14el9fUSZ9pRgBMylLuH6LTvpPa
 qLT5RdzveWQXDvja7Vqaz2VgyRRsa+LECOEryAyj1qngdb3GpNwIs13nGNy0RsQ4aVfeM7d
 s7kinrPAWcJdsbGadMV6g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:d+mWWEvhS5c=;87U/6Pen0DKS47t4m9JyYSNxg5V
 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

Am 06.08.26 um 17:18 schrieb Jelle van der Waa:

> Hi,
>
> On 07/06/2026 22:46, Armin Wolf wrote:
>> Am 31.05.26 um 11:05 schrieb Jelle van der Waa:
>>
>>> Some Acer laptops can configure battery related features through Acer
>>> Care Center on Windows. This driver uses the power supply extension to
>>> set a battery charge limit and exposes the battery
>>> temperature.
>>>
>>> This driver is based on the existing acer-wmi-battery project on GitHu=
b
>>> and was tested on an Acer Aspire A315-510P.
>>
>> Good work, i tested it on my old Aspire notebook (v1 interface) and i=
=20
>> can confirm
>> that the temperature reading and DMI whitelist works as intended.
>>
>> I found a couple of minor issues, once those are addressed:
>>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>
> Sorry for the long hiatus, I send a v5 yesterday and forgot to include=
=20
> this. If it is needed to send a v6 I will include it and send that as=20
> soon as possible.

No problem, just include this tag with the v6.

Thanks,
Armin Wolf

>> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> Description("Class used to control smart battery, Version 2.88"),=20
>> guid("{79772EC5-04B1-4bfd-843C-61E7F77B6CC9}")]
>> class BatteryControl {
>> =C2=A0=C2=A0 [key, read] string InstanceName;
>> =C2=A0=C2=A0 [read] boolean Active;
>>
>> =C2=A0=C2=A0 [WmiMethodId(19), Implemented, read, write, Description("G=
et=20
>> battery Information Interface.")] void GetBattInfoInterface([in]=20
>> uint32 uBatteryInfoIndex, [in] uint32 uBatteryNo, [out] uint32 uReturn)=
;
>> =C2=A0=C2=A0 [WmiMethodId(20), Implemented, read, write, Description("G=
et=20
>> Battery Health Control Status.")] void=20
>> GetBatteryHealthControlStatus([in] uint8 uBatteryNo, [in] uint8=20
>> uFunctionQuery, [in] uint8 uReserved[2], [out] uint8 uFunctionList,=20
>> [out] uint8 uReturn[2], [out] uint8 uFunctionStatus[5]);
>> =C2=A0=C2=A0 [WmiMethodId(21), Implemented, read, write, Description("S=
et=20
>> Battery Health Control.")] void SetBatteryHealthControl([in] uint8=20
>> uBatteryNo, [in] uint8 uFunctionMask, [in] uint8 uFunctionStatus,=20
>> [in] uint8 uReservedIn[5], [out] uint16 uReturn, [out] uint16=20
>> uReservedOut);
>> =C2=A0=C2=A0 [WmiMethodId(22), Implemented, read, write, Description("G=
et=20
>> Battery Function Data.")] void GetBatteryFunctionData([in] uint8=20
>> uFunctionMask, [in] uint8 uReservedIn[3], [out] uint8 uReturnCode[2],=
=20
>> [out] uint8 uBACStartTime[2], [out] uint8 uBACStopTime[2], [out]=20
>> uint8 uBACStatus, [out] uint8 uReservedOut[9]);
>> =C2=A0=C2=A0 [WmiMethodId(23), Implemented, read, write, Description("S=
et=20
>> Battery Function Data.")] void SetBatteryFunctionData([in] uint8=20
>> uFunctionMask, [in] uint8 uBACSwitch, [in] uint8 uReservedIn[6],=20
>> [out] uint16 uReturnCode, [out] uint8 uReservedOut[2]);
>> };
>>
>> I suggest you write a tiny bit of documentation under=20
>> Documentation/wmi/ devices/ using this MOF description.
>> This way future developers can better understand the WMI interface=20
>> used by this driver.
>
> Thanks for poking me to write this, this was the first time writing a=20
> WMI driver and writing a bit of documentation definitively made=20
> everything click in my head.
>
> It also sparked my curiosity. I know you added the temperature reading=
=20
> and referenced "Smart Battery Data Specification", did you try any of=20
> the other fields (such as manufacturer?)=C2=A0 [1]
>
> [1] https://sbs-forum.org/specs/sbdat110.pdf
>
> Thanks for the review,
>
> Jelle van der Waa
>
