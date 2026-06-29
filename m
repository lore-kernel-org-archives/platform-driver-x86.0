Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1873D3F0A9C
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723030; cv=none; b=kexcwicsh33IJAqFQLry4Ms8x4H+PpkNU9v4eBPlQ/Gco4vSQ4icsZJXJ0oeFEbmpuu7Adrkhuq8vJ+iZktyt4UZS1W1PiFIPCyE4NUVBUWHdAbWSatyfHj5+wQm2zSRDCcJlOvof/STpXCS+78FLrMbukS0s/JnQfiRoMqLuoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723030; c=relaxed/simple;
	bh=0OYSF/WbAtQT1B+XtvWfZQrqX3y8eIw0JK7SqfNhNOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ngRGlDKMVjqHfxDKEkrp9PGLYVMC0ypVrFdQpkpUaXrl3Svu44bpTIO2yFPQOQ1wIaYiav1dQC8PCkRZ4JE/9Qt0pz0Jn9bzyc4Nziv1NTuCyfbmYebaezo9UVVzMIb90Y1FCZTqxTU5vo7IRk0svRbjQbfVsIoSafvtJwFb/9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrXfmgK5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NldsEXyJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrXfmgK5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NldsEXyJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rBCV2134485
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 08:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apEPJZgEeYzgAqQcyDRhVflzg8tLIcKoNRN+VQHe4AM=; b=XrXfmgK5olvTM+Hn
	UhfkBUXmsBpNJKDleDtco3igakuFyVPZ6kmyhCUNLOg2xC9ldOIpNEHqohvWNjOo
	J1vtMIydZZF5PRE0MGLIEtJpaB7fTJ0DbtjVdnfsh8Oty8nixh1K3RJIbvrNgehq
	IyXab9J+d58QhkbYmnjLtiZVM0eIJdsrKIGWiEHSUENVRAyED+8P+d/3DHDvBhrx
	+Ex1cA5LR0Pg0AijNrdPWSMs7LXn/CUbU4gOH6JsqUq6x+G/E+XwVOk8Wndgt5en
	34205GUOASRBHVJlCG/c5FbLBhM2aBhtQ2Y1hiGU1tkjCU4QTlvnSsMfRICW+LK6
	IDrRWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a5m1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 08:50:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5939so295495285a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 01:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723026; x=1783327826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=apEPJZgEeYzgAqQcyDRhVflzg8tLIcKoNRN+VQHe4AM=;
        b=NldsEXyJcgBPb+dC+GZa3fBl0QSmXpX7MZLyh2yD4Nq8tvw/lR/f9ybtYY4upmMtVD
         4AmmEqxeXvSDjtgTr0HPpeoLwdGdQun7a/K6h+GTfhr7fhqnyzsKLPHr14YfrpGeg3eE
         Z3LMv72o/5lJTA93Pa1WECIbiotqeDkthdnJfT08HBrXDtaa9j0rGCrcEJZWphjGfX2w
         orazOX7NQ8HrWs8qAhU4B9s5o8E7vTOJ1awcCH9GewTQa8hnnnpM6xAd/pKhfq3YXZ4D
         N0TBfMEry1jqy1DMzkooOJE5PRL7UNVXmy8BfzvO82wuUEpwB0+qf7qnO9GW+cnhABpi
         lAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723026; x=1783327826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apEPJZgEeYzgAqQcyDRhVflzg8tLIcKoNRN+VQHe4AM=;
        b=kikQTYf/FODCfZnvBqXZr6Sqq4RYUFoFZ/ITvyFz3dT3nVmHlEJTOqKgdXmYoHb+ct
         LgWiz1R7MIYdiviwgKBIsry0msN9g5rtOcBAEYprMKqYUV/O0a5KqA1KbK8duNUy+kIV
         /I7ZpO2SvUNEnSZkWnZoUjGN+bV6Dm92HAtKZnuZf8nNKhku89ExRG7UpqqIDanIFgWu
         /BfjvWbOnH+WLEUCuVMeYk3CfLK5BGTAcuIUtWEpBixw42VwPzK8H1DjyXmmxkcAe5Va
         r/SUBJ+LaWyLzdXdRt1sh3nBAJXQCWW8x7CVv6Z4QKQOJybcPc6lAApLZcjWV31ksOrE
         plPA==
X-Forwarded-Encrypted: i=1; AFNElJ9chA2MX+RPPVoBBV7wPiNOUHTkkSb+gzER45VSesJGDjJ5AAVFSp2n+yBaaQkmgJShdL1uUIidF6SK6GZX43w3WL3G@vger.kernel.org
X-Gm-Message-State: AOJu0YxHgtRqZrE9cj6XVRlLTBlBijrTSKXjybv09KlPCG3Qi4GZRQWE
	bd4ypwhNLpOmnAA4xwo5wheiSY4fFhI8YeAQCOq+Ls0LIsW+jklGWZz/ZzsyOf+RBO1yCnvqdCk
	XoURlQKlJyR/SGri1YqzdwdH+JD3stDzrLGmFS/IYN9/LeSjQ8H3ApznOPuU472dyoeU6aVeokh
	Hf
X-Gm-Gg: AfdE7cknMjSetvu6yLMBj5oitl8xdbD0+v9CKoMg13jiY9oysfBqeWEe1sSoPce2QLR
	TMVUGe30FcCjR+PuwPbA1tyH0vQ6EvJ5ZVu9AoP/QyeR+IgxhXwZ+3arZnoVSSzJ2Qr4DCBK5Aj
	CKH/xc+DiBJ04wp5d8ba8VcQRy85Bspza14e9/DAc+JNM03LXvrVcLs4/AY3rCmqrEdA9LNhWUX
	qov5S52IBHOKnnQhikAJHqll8TmwXWoowzeY06FEkuUOFLrFXCVcwirE7DPi55198joTIARiPPl
	NunkTL3jqrG8ck4HxTwqsd7LzoEPX7wYJw+XAyjolx4B+VwjpV4yjN4I1zY9aqiCEqatGNknL/W
	sf0GO1+5vSnp8LRHMSUQcN+J8RzJKXgf5wYlEamd0edfsVTfD+DuccVnR7PaZLDagpCiLkPE=
X-Received: by 2002:a05:620a:404c:b0:92b:67e6:8aba with SMTP id af79cd13be357-92b67e68c9dmr1282506185a.68.1782723026309;
        Mon, 29 Jun 2026 01:50:26 -0700 (PDT)
X-Received: by 2002:a05:620a:404c:b0:92b:67e6:8aba with SMTP id af79cd13be357-92b67e68c9dmr1282502685a.68.1782723025812;
        Mon, 29 Jun 2026 01:50:25 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:670:107a:d931:c86f? ([2a05:6e02:1041:c10:670:107a:d931:c86f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a7fd1b0fsm100251435e9.1.2026.06.29.01.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:50:25 -0700 (PDT)
Message-ID: <650a532a-3950-4a89-976b-76866e5d3aa3@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:50:24 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
 <akEj6XEByCOkuJaY@venus> <faebd355-a9f4-4360-b123-87103ac512e8@roeck-us.net>
 <2efc0f6b-3dd6-4267-b587-88c638f02be6@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <2efc0f6b-3dd6-4267-b587-88c638f02be6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MCBTYWx0ZWRfXw4Bab1/e1Pc7
 77d+s8hjnLgoQgrgj8uP2yVZOAEcH7uFxpQNE3T7L7NbAEM61w8y8ozqJfMNa+pdTfUCLRhJtiM
 sHS63i+cejQAfwh8FBwT6B0XAr6N7koVcVp/CgcxTdHEojuK2y9vpnEjYQipUs1fE3HtDXw4DwN
 3VGc07WoKf91E6EHKpmrEntU5uToGCPVDOEFYArf12LOeZ6TYbNrQq+GmVX2lUe1C0XajO4Fa/v
 cacRVZPlj6ltTEwKUJAaS4V6pbhSrC3cn5evmhQT2MB8kx0UqL0TGL3P1NaEacwUgao3PxwdwIK
 kuidbkMYe4/bPnZgB+86uRgoYbzGr0DDTcKcd3Te+iIoO+9s2qk+N3lJwt9BckdCWpBiN51Qg6I
 trwhiqCP0F8nvFgB1EHd1XL6mVKzEfSeGh0x2dqLcRvsbJFmrAPP37+1hZpAAgGQwp+ZCKGDeUD
 iKDyX7ot8eFw2B/9Xiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MCBTYWx0ZWRfX+IuBx8UqhSaj
 QYbGuhAjYmE2xJKqOK5MomRPnTCxVhyzBOiiWcjsT5PeUETqhZm6wir0oZ0DjKzho9D+rHxzUP8
 D16NRlfhwWKup0OjSJkRQNH4KuMhwVo=
X-Proofpoint-GUID: j4fWagfuxrSoHP5lss73YCeOVPuVDTjy
X-Proofpoint-ORIG-GUID: j4fWagfuxrSoHP5lss73YCeOVPuVDTjy
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a4231d3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=CtSfB17q0sxskFCUDoEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290070

On 6/29/26 10:26, Konrad Dybcio wrote:
> On 6/28/26 4:02 PM, Guenter Roeck wrote:
>> On 6/28/26 06:50, Sebastian Reichel wrote:
>>> Hi,
>>>
>>> On Wed, Jun 24, 2026 at 11:08:23PM +0200, Daniel Lezcano wrote:
>>>> Expose the Lenovo ThinkPad T14s EC environmental sensors through
>>>> the hwmon subsystem.
>>>>
>>>> The driver now registers a hwmon device providing access to six EC
>>>> temperature sensors corresponding to the SoC, keyboard area, base
>>>> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
>>>> are exported to allow user space to identify each measurement.
>>>>
>>>> Additionally, expose the system fan speed by reading the fan RPM
>>>> registers from the embedded controller.
>>>>
>>>> This allows standard monitoring tools such as lm-sensors to report
>>>> platform temperatures and fan speed.
>>>>
>>>> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
>>>> ---
>>>
>>> I gave this a try and for me the fan data is always 65535 (i.e. -1):
>>>
>>> $ cat /sys/class/hwmon/hwmon66/{name,fan1_input}
>>> t14s_ec
>>> 65535
>>>
>>> This is with the fan running:
>>>
>>> $ cat /sys/class/hwmon/hwmon57/{name,fan1_input}
>>> fan-controller
>>> 2564
>>>
>>
>> Not really my concern, but those names really add zero value,
>> and I would argue that they do not "allow user space to identify
>> each measurement".
>>
>> Also, do you really have 66 hwmon devices on those systems ?
>> Seems unusual.
> 
> There's a couple dozen thermal sensors on the SoC and each one is
> registered with a thermal zone, plus a couple here and there for
> other onboard peripherals (PMICs and whatnot)

Yes, the amount of sensors on the SoC is incredibility high and when 
adding the platform sensors it is even more. Here on my laptop there are 
59 thermal zones and 68 hwmon sensors.

I agree with Guenter comment. With all these sensors, from userspace it 
is painful to find out a specific sensor without going through all 
sensors name.

While testing the changes at every reboot, the sensor number changed and 
I have to find out which one it is. It is annoying.

Would it make sense to have a per-name link pointing to the 
corresponding hwmon / thermal zone directory ?
