Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5A8B644
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Aug 2024 00:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723681896; cv=none; b=UVIcJ12NLj/jESjkuIE5arsC9sUsYrkJZ6yqIHTv7kvIZjlyIvtxWgpS5LUyOa5rxPFRDAZ1ZdVBeS7oA1a954AT5tj72FpKWJNb3lTQtvTMmvZO40JHOmPB8giGFGcP+0GC5WJ8boPuTmwdw+eKZwPSWmH6Wbcr9RARdxnlSyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723681896; c=relaxed/simple;
	bh=nALmvkrZ5ymnsznPoAZSFy0YAnxS0DtW0ZT2k+0advI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ia9w9mKMrWJ1bZvF8hbCF/wlj03ctg4AUPFynJbrOE409pqp0BRx8/Nb748PtoReI1DjSTsIpmOrsgJVaiFtW++vb4zhpxtFs3arnwtHCr9lCdFitzVrtNgW0oKbFcGGxy4l7yI3QKlIxUhYs/hIN+Vl7h0eGGNqdLK6tEJrW0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bR21dDjz; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bR21dDjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1723681890; x=1724286690; i=w_armin@gmx.de;
	bh=8IF0VE+Uv6HrUPmOLF6anm97Wc7TTw26PHHb2CaFsoI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bR21dDjzP1cEZuo7xHrhHZrMbIv98M3lzGK0XVdT65L9cWwgIu6ZSo/rbcHynMkH
	 Nv9fE6u7A1TXMK1PpLNbppc3pU9WzS9y56OGFY3hNVJ6J9pBQOUeh7/2Pi6HP07NE
	 lLHFARUrNeYEBBSK4cPh99R92vkelGSYqFhJ5Hm9/JskUadk429kkhIZfK2LXaFsZ
	 giQILXPJ69hVEopHZSgDWRTrn+d4j9HqEnu6xugyqa/uF2yeTN41+kKazVk6CMNPq
	 FZkA5jbUIAHXrAhZgHHOzI9ayhR893Pz6Vu3FrcHrwFTG//c+3HToAF6XBnYz8VY6
	 TjehlrwFXrMIJNRo4w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuUnA-1sNPmK2oKo-00rQhq; Thu, 15
 Aug 2024 02:31:30 +0200
Message-ID: <1867c880-41b4-49e3-a02a-b61438908e98@gmx.de>
Date: Thu, 15 Aug 2024 02:31:30 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Add Support for the Acer Predator Triton PT14-51
To: Rayan Margham <rayanmargham4@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CACzB==6tUsCnr5musVMz-EymjTUCJfNtKzhMFYqMRU_h=kydXA@mail.gmail.com>
 <749421fc-73d9-4657-86f4-40cc048265f4@gmx.de>
 <CACzB==427GUH4b571KuVDzh6EsG7kB4bb00hmLu=7OzEt4QrCw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CACzB==427GUH4b571KuVDzh6EsG7kB4bb00hmLu=7OzEt4QrCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VAwNbe3ggGMefvhQXwU+OVTfOl5WxPBUbWD1QC63yl8yj/coJTn
 a1a/lcrob9AiEibyzA9UU4W8IVrX5ci9nE8+mZqZOxyEPkWQcxIqL9IZnOzHA/AezoKq86+
 NVQt2vdWJCMwWmhAJNkY6OdoMEfPLXITAHihfSmx3WTHEYcBzHHreC6qP8LyyqlMTHKB8SD
 43M+QmJv8bd5Qs4KaTBnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MsBvc9YnQGA=;5fu7ynJh6IMDdJzZt/vHnKl+/o4
 aNVzLkigIl7GWTbN1NJsK14aWs2YIVUc7umuEb2Ns7w1ft1tvRqClz8lJw2+m3SrTxWdrc6zG
 rnzneuvna3JMpLV9kDuKA0m7HWRGwu7B0ObAX6KHEEJE5DFc9xvsCa8BYM5f/f0j3S/aRu83G
 Dlu6V03JsMkgQ6cBVGOcGzkRVC15B7oG/FV4366BilgTGMsxCuaaSLPB5klP75PU0TZm1XzNo
 4yWaSIq9dOI6JI0lFPuHViKgBq4OQl2ND47euWptMvFwzblI2zN2RTLfDEvZz196d7Hez4/0i
 SpKlrtMS36i7bVKvrkg0SLp7oE8Q1yrt/Tfy8TAmBF14VbZ6YHghbScTrna8lO3H6GkN03dWo
 pPpl47padesAbK90KDobo/LG21TrvfjJU/hlNCzMPqpRTatsyt7cbAZR0Uqrx6bS7x078C5fI
 ScTH47mAbwzwe8TFH6nO4jBk6afFI2JtA7tx5gukjpo26VT1sRQjmCBpsZUFf0A0k1GOr+tDB
 8ce9m1Xx1aUvPlAEJWV12fF/rlVxjoosQQ2blDEAfLgtQ1PazeSnkrDaFM9teDUALiaGjzUcw
 cxdzRvNwv+uM0ltR7xgDNnFBk3JELEmEhcCgSsTFPdzG80sKrLNBv2u1kCL5mwtKRfsj0WIEN
 sDWinWf+wxKlfPrBS5p6d7INNVVh4sHr9SRdh9uFzVrIuABmmscZeXhsMtKt0UazA6BfPWiXh
 K05Hz+LsJHg0Am/EN1MSRzxz9PCcko7FkhMRLreQzeFMFG1okORrCkWKFxfLQaemwVf1VXaJU
 JacETar/mGDWbD7sHD85OHRw==

Am 13.08.24 um 13:33 schrieb Rayan Margham:

>> can you share the output of "acpidump"?
> Hey,
>
> Attached to to this email is the complete output of "acpidump"
>
> Hope to hear back,
> Rayan Margham

I found something promising:

[WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Clas=
s used to Gaming Function, Version 2.88"), guid("{7A4DDFE7-5B5D-40B4-8595-=
4408E0CC7F56}")]
class AcerGamingFunction {
   [key, read] string InstanceName;
   [read] boolean Active;

   [WmiMethodId(1), Implemented, read, write, Description("Set Acer Gaming=
 Profile Configuration.")] void SetGamingProfile([in] uint64 gmInput, [out=
] uint32 gmOutput);
   [WmiMethodId(2), Implemented, read, write, Description("Set Acer Gaming=
 LED Behavior.")] void SetGamingLED([in] uint8 gmInput[12], [out] uint32 g=
mOutput);
   [WmiMethodId(3), Implemented, read, write, Description("Get Acer Gaming=
 Profile Configuration.")] void GetGamingProfile([in] uint32 gmInput, [out=
] uint64 gmOutput);
   [WmiMethodId(4), Implemented, read, write, Description("Get Acer Gaming=
 LED Behavior.")] void GetGamingLED([in] uint32 gmInput, [out] uint8 gmRet=
urn, [out] uint8 gmOutput[11]);
   [WmiMethodId(5), Implemented, read, write, Description("Get Acer Gaming=
 System Information.")] void GetGamingSysInfo([in] uint32 gmInput, [out] u=
int64 gmOutput);
   [WmiMethodId(6), Implemented, read, write, Description("Set Acer Gaming=
 RGB Keyboard Setting.")] void SetGamingRgbKb([in] uint64 gmInput, [out] u=
int32 gmOutput);
   [WmiMethodId(7), Implemented, read, write, Description("Get Acer Gaming=
 RGB Keyboard Setting.")] void GetGamingRgbKb([in] uint32 gmInput, [out] u=
int64 gmOutput);
   [WmiMethodId(8), Implemented, read, write, Description("Set Acer Gaming=
 Profile Setting.")] void SetGamingProfileSetting([in] uint64 gmInput, [ou=
t] uint32 gmOutput);
   [WmiMethodId(9), Implemented, read, write, Description("Get Acer Gaming=
 Profile Setting.")] void GetGamingProfileSetting([in] uint32 gmInput, [ou=
t] uint64 gmOutput);
   [WmiMethodId(10), Implemented, read, write, Description("Set Acer Gamin=
g LED Group Behavior.")] void SetGamingLEDBehavior([in] uint64 gmInput, [o=
ut] uint32 gmOutput);
   [WmiMethodId(11), Implemented, read, write, Description("Get Acer Gamin=
g LED Group Behavior.")] void GetGamingLEDBehavior([in] uint32 gmInput, [o=
ut] uint64 gmOutput);
   [WmiMethodId(12), Implemented, read, write, Description("Set Acer Gamin=
g LED Group Color.")] void SetGamingLEDColor([in] uint64 gmInput, [out] ui=
nt32 gmOutput);
   [WmiMethodId(13), Implemented, read, write, Description("Get Acer Gamin=
g LED Group Color.")] void GetGamingLEDColor([in] uint32 gmInput, [out] ui=
nt64 gmOutput);
   [WmiMethodId(14), Implemented, read, write, Description("Set Acer Gamin=
g Fan Group Behavior.")] void SetGamingFanBehavior([in] uint64 gmInput, [o=
ut] uint32 gmOutput);
   [WmiMethodId(15), Implemented, read, write, Description("Get Acer Gamin=
g Fan Group Behavior.")] void GetGamingFanBehavior([in] uint32 gmInput, [o=
ut] uint64 gmOutput);
   [WmiMethodId(16), Implemented, read, write, Description("Set Acer Gamin=
g Fan Group Speed.")] void SetGamingFanSpeed([in] uint64 gmInput, [out] ui=
nt32 gmOutput);
   [WmiMethodId(17), Implemented, read, write, Description("Get Acer Gamin=
g Fan Group Speed.")] void GetGamingFanSpeed([in] uint32 gmInput, [out] ui=
nt64 gmOutput);
   [WmiMethodId(18), Implemented, read, write, Description("Set Acer Gamin=
g Fan Table.")] void SetGamingFanTable([in] uint64 gmInput, [out] uint32 g=
mOutput);
   [WmiMethodId(19), Implemented, read, write, Description("Get Acer Gamin=
g Fan Table.")] void GetGamingFanTable([out] uint64 gmOutput);
   [WmiMethodId(20), Implemented, read, write, Description("Set Acer Gamin=
g Keyboard Backlight Behavior.")] void SetGamingKBBacklight([in] uint8 gmI=
nput[16], [out] uint32 gmOutput);
   [WmiMethodId(21), Implemented, read, write, Description("Get Acer Gamin=
g Keyboard Backlight Behavior.")] void GetGamingKBBacklight([in] uint32 gm=
Input, [out] uint8 gmReturn, [out] uint8 gmOutput[15]);
   [WmiMethodId(22), Implemented, read, write, Description("Set Acer Gamin=
g Miscellaneous Setting.")] void SetGamingMiscSetting([in] uint64 gmInput,=
 [out] uint32 gmOutput);
   [WmiMethodId(23), Implemented, read, write, Description("Get Acer Gamin=
g Miscellaneous Setting.")] void GetGamingMiscSetting([in] uint32 gmInput,=
 [out] uint64 gmOutput);
   [WmiMethodId(24), Implemented, read, write, Description("Set CPU Overcl=
ocking Profile.")] void SetCPUOverclockingProfile([in] uint8 OCProfile, [i=
n] uint8 OCStructure[512], [out] uint8 ReturnCode, [out] uint8 Reserved[3]=
);
   [WmiMethodId(25), Implemented, read, write, Description("Get CPU Overcl=
ocking Profile.")] void GetCPUOverclockingProfile([in] uint8 Reserved[4], =
[out] uint8 ReturnCode, [out] uint8 ReturnOCProfile, [out] uint8 OCStructu=
re[512]);
};

I will try to create a prototype driver so we can take a better look at th=
e fan-related WMI methods.

Thanks,
Armin Wolf

>
> On Tue, Aug 13, 2024 at 3:08=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 13.08.24 um 02:29 schrieb Rayan Margham:
>>
>>> Hi,
>>>
>>> Currently the PT14-51 does not have support in the latest linux
>>> kernel, therefore its fan control behavior cannot be controlled.
>>> Causing stuttering when gaming and such.
>>>
>>> I am happy to help with finding the WMI GUIDs if required and testing
>>> code on the PT14-51 as it is my main daily driver.
>>>
>>> Thank you
>>> Rayan Margham
>>>
>> Hi,
>>
>> can you share the output of "acpidump"?
>>
>> Thanks,
>> Armin Wolf
>>
