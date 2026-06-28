Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543F92DCC1F
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782667868; cv=none; b=g51e7/UlgSm6SeZNGN0Ev9MLYmY5HARyVMepdPnUTvoSRm05sxxnrgtZQRj9DpeA62fF2xvCg6pKorKa9foUlmyuUfZLZH9q9N7+/AQsMp7BH1mglG4I0w/oQEOomQWbRDZ2ZwY0CpRz340aRuSXN6BTTKMuBa4QKZkUQeE0SVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782667868; c=relaxed/simple;
	bh=ZT4Oi48MQ2edPaWjW8khM1ET81+4j1v2TQ4M0MI6hX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nytEzB/PwV8KMeWnGFWgaAyDw0Ye9aR/vfHltnocmOwUXNNgPBOSW/uKDw2coS4vHHJSgOZ26oCCLMkd+QBnBC2QlIpu9rNn7dZZIBqlyi3eFX0i9IazXJuoXMLyMdjdDhBHhRc6hqV1NcULjgyzyOzVQK+nMsQ4xJzqBzgjVmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzVjkylx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ha8k3us2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzVjkylx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ha8k3us2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SERtNS039474
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 17:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LYGGwI5goWOdRY7GIiaFjBfkoZM/HlIDwQhWdcH2Ro=; b=NzVjkylxUjSWlaA4
	g03Tq7LAV2Yhm3AjQYZWm/oEjfM1/OvIFu7/0RbkV+K5MY8GVoELRGPrnkxclIFV
	cTuuQVXx1t2jrD+DSSPff1jpUChZyG+DsaZ5+XgeYObuDVxXLJyGa4ou7oUNM09X
	3N9r/nuPYEw/Piu7NUaakINNB0pvBtBdIir9P7MebKCZhIeF1oedKH5ljMsH8L9X
	YqozeKwYCVBe6J/4YeWiyVkFPms85ZVLFikjExrXM0Edsg1RLGiWOKRAXbs3GMcD
	WZ8/IZe7BlVyKBLaCSkiRc/w4zwqs2QJPCXsAYeNDdBJZ/rIBJx3kDxpEGfRoYU2
	5RAvvg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27083a30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 17:31:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91931144870so566639285a.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 10:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782667864; x=1783272664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LYGGwI5goWOdRY7GIiaFjBfkoZM/HlIDwQhWdcH2Ro=;
        b=ha8k3us2yjr7ofmbSD9rt3FfuEqUoVZURiuUlj6HDSX/WxNlTQyrget+R6/oDMGpbD
         yk7ujqPBBd5sRGpCleSMFrBvNVVHW4hLUlH4GD3UKTEGnrdOA9OmQOzVHCCT8m58xG2r
         XtL4Bbj9YDy2la+dpXzG4zjzwwXgWmuPJHvfjY8N7BlFDrHa8qOVi1WzZ6lCFfiJ6yA1
         8rC8J//QOK9MgKi9ZP1S2c6jMck9ukOEshtvCutw0/dbwo2h18r83y3r8xbN6C6Xw59t
         DdFeYprrVB+JR7OxZ8X3H+U7IWYE4bReGFRn4xLnPv0+EW7WMb6wt1BK86IimGnVQd62
         UgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782667864; x=1783272664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LYGGwI5goWOdRY7GIiaFjBfkoZM/HlIDwQhWdcH2Ro=;
        b=KcimYQVecN9KdMUH73w4Xx9Lr66HCKi6/CqqezBA7MB7iDdrHJT1D8E8NCyzdA0nCI
         XOlgwDdonJcMFlnMl3qi75nDnSr1pTjuYoiYDORz7deeqcXf5D6KteZwxzkRD2dOGtiI
         4KjzI1I/TsdiTPfVGbsHs64Qe1XXdUZBeMpIeLamIv4Awt2s3RKhNrb/hQeyD/4tVYoT
         kMW4NzBqlnykfkTTRkaTFzVE+aFsb7AeDlVPOQXvMC6bka0XQ/17x7qhV5N1HkTb4zm4
         khXrdLcDwmW+EZsKsi5+td4K/hdz/4awVHfSFq9EyajtOIIxxw9HigqBOPrETTZhlUG3
         X/lw==
X-Forwarded-Encrypted: i=1; AFNElJ/uVQnzp7x1cyLt8VONU3r8tp0K+Lv8lYIZ64VgjmCxohv4AIiy8NP7XT8mU4c8tNzdB4Bi4LGkFRm/pjl/Xw+oE+lr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1I/QX+YYXvUfXvbS/5Eizla+IebEDD3iGHmmC//GwmwqGWDhW
	Idndc9T19ovzk+AHq36we/A0H0ORwajHMRYleeyZohJBkkKBh5Uvcrt41fuX6UIyBrLc96XAkZu
	wPCgEy7rDLkt+z8nz6uOXxzypYS2lfRbkxMejKVLflOe2NfOA180e7apsk0th8+K1vZhKnGjIsS
	5e
X-Gm-Gg: AfdE7cm+h/myuroHJfb+tt2ugHLd19iGMROQasos/HKriqTsy23tIXjnXCHFHwoTMJx
	JJGAOB9Uu9u/uYIwtOo8Qa7PEZIosZGRnd1FAb1rGy027pB6pUVoevJIgD/JKreJ4HKmcxfQubs
	OaCUeOOvHacufUe/qDiYkaX+A1G8xWW7o16c9HdJwNKX3iwlS9lX8KQ1kF6AsNk7gEoZ3xtUvJq
	RqzNxYKEAFbjKAOoSz5m6VVvJKTzfVwxd5RWAoTbAy0I6Hwz5rVGKQ1q8RkCcyP14htGPsSod6c
	NXrsiKpUPt/zaSlobEoaj2ubIYiMaHUAR0sfx14H+gSCbiv7iaKmF8l4RuIgUVLhYEviSISRwZ+
	ommb1rKdcwz3PjjzG6ncmejvSOyvCMsAyqw+EEkJ3D/ihZ41b29DPeJl0WjZG2gpY2KIS28k=
X-Received: by 2002:a05:620a:4808:b0:915:7e22:6f1f with SMTP id af79cd13be357-9293a8a8bd6mr2058532285a.22.1782667864511;
        Sun, 28 Jun 2026 10:31:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4808:b0:915:7e22:6f1f with SMTP id af79cd13be357-9293a8a8bd6mr2058528285a.22.1782667863990;
        Sun, 28 Jun 2026 10:31:03 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:670:107a:d931:c86f? ([2a05:6e02:1041:c10:670:107a:d931:c86f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4932f100e4asm144355955e9.1.2026.06.28.10.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 10:31:03 -0700 (PDT)
Message-ID: <8e7a604a-4cd2-40ec-b1a1-ae5ac68c4189@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 19:31:02 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Sebastian Reichel <sre@kernel.org>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
 <akEj6XEByCOkuJaY@venus>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <akEj6XEByCOkuJaY@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a415a59 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=bjHr9k4kyxrlvEBRdikA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE1NiBTYWx0ZWRfX7nSJThUBIroC
 i0khw1ENQTLm5rzDsyse9poR8vZp6CJVu5ozJlKpvsA6njPPapqyivEoRLsjVjiyU/TjY6QinG9
 gm1ftdGEdk8++ucVa8kI0bkdfBo2K9KMLQT+l0+pq0WP6J39KSatDaD7fp3xGH++V/2CW0n2wRU
 4mzs7IBvCUWIUwb14EC49XTiqaVPbnMZyx2l20RHo3BUw++R2PiXrWMqkUixxXHaGNeAtGQvcon
 WXuVahk4AJHFsxnpSLl/8wu94KgR3aSA5FsnJJ0/ZUiLE/FulvTxLrz+xTqkd3Dn6kqVRzetAeZ
 MxsU0fxE5ry3TMgTeqTvRI9Cxw38YjM7gZXUDLhPoUvV9wTUW+7QUgP5auqGeltwDfGWvyrvN3r
 KpSk3+F08XYNWNCYXuh+A+ATzhlMp4suO8E0ZODM1TYKyz1Qga08/Aa1IhULaCzAN/9RzrXF9WI
 /uMNOMbjASEv1KacJZg==
X-Proofpoint-ORIG-GUID: WPOpOpFtjT-wgijpnoFjhriyY-SEunYZ
X-Proofpoint-GUID: WPOpOpFtjT-wgijpnoFjhriyY-SEunYZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE1NiBTYWx0ZWRfX2OgMFSgk6WpR
 xa2x6bedKMMgUAupdinPt2ix64e3aoeV49r+HJs5iAC0Wbe975lgXie1gl/8F4tkOdhk9dEB0np
 hqGiN/mRFymCCHCq77S56SwB7tInKOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280156

On 6/28/26 15:50, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Jun 24, 2026 at 11:08:23PM +0200, Daniel Lezcano wrote:
>> Expose the Lenovo ThinkPad T14s EC environmental sensors through
>> the hwmon subsystem.
>>
>> The driver now registers a hwmon device providing access to six EC
>> temperature sensors corresponding to the SoC, keyboard area, base
>> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
>> are exported to allow user space to identify each measurement.
>>
>> Additionally, expose the system fan speed by reading the fan RPM
>> registers from the embedded controller.
>>
>> This allows standard monitoring tools such as lm-sensors to report
>> platform temperatures and fan speed.
>>
>> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
>> ---
> 
> I gave this a try and for me the fan data is always 65535 (i.e. -1):
> 
> $ cat /sys/class/hwmon/hwmon66/{name,fan1_input}
> t14s_ec
> 65535

Strange, I have:

fan speed=0, temp=40000
fan speed=0, temp=41000
fan speed=0, temp=41000
fan speed=0, temp=43000
fan speed=0, temp=43000
fan speed=0, temp=44000
fan speed=0, temp=44000
fan speed=0, temp=45000
fan speed=0, temp=46000
fan speed=0, temp=46000
fan speed=65535, temp=48000
           ^^^
fan speed=1903, temp=48000
fan speed=2345, temp=49000
fan speed=2367, temp=49000
fan speed=2417, temp=50000
fan speed=2431, temp=50000
fan speed=2430, temp=51000
fan speed=2441, temp=51000
fan speed=2450, temp=52000
fan speed=2457, temp=52000
fan speed=2458, temp=53000
fan speed=2458, temp=53000
fan speed=2458, temp=54000
fan speed=2460, temp=54000
fan speed=2572, temp=55000
fan speed=2788, temp=55000
fan speed=3009, temp=55000
fan speed=3229, temp=56000
fan speed=3424, temp=56000
fan speed=3610, temp=56000
fan speed=3631, temp=56000
fan speed=3597, temp=56000
fan speed=3594, temp=56000
fan speed=3592, temp=56000
fan speed=3592, temp=56000
fan speed=3588, temp=56000
fan speed=3588, temp=56000
fan speed=3594, temp=56000
fan speed=3594, temp=56000
fan speed=3597, temp=56000
fan speed=3597, temp=56000
fan speed=3594, temp=56000
fan speed=3597, temp=55000
fan speed=3594, temp=55000
fan speed=3594, temp=55000
fan speed=3592, temp=55000
fan speed=3592, temp=54000
fan speed=3588, temp=54000
fan speed=3592, temp=53000
fan speed=3590, temp=53000
fan speed=3592, temp=52000
fan speed=3590, temp=52000
fan speed=3588, temp=52000
fan speed=3588, temp=52000


> This is with the fan running:
> 
> $ cat /sys/class/hwmon/hwmon57/{name,fan1_input}
> fan-controller
> 2564

