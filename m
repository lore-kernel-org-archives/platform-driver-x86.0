Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C095A3A7837
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 12:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058267; cv=none; b=s0dm+FmLr8/sBRjgglfT9FWwj4mubRYgEGMgBPT3oouVNpP4K3FKnd/1NpBoZx2THCnF8aI+sQQRNhP27ATPQ5kcdJpu0ZwV7UAVjPpGviSgYfOTMzgtysDGPqmxsSL6Qfb4qtj/5bGIHc7MUl3gFmfNBY/5sJGomzpm53XgSyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058267; c=relaxed/simple;
	bh=BTOhTZiR+sU5XnomQReIXYrThw3LP2w3T0/+foMg2UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ee/+J2IJARo9XeWo42CZ4GVrOovSclzh8BG3SiQbb8vpU+fu1fQo6guK+z4eiK3wug7t6R7cYPRsin1657Vy0VbPrvrh8TEQe9XFM4bvHbj+nZO8+SVSHa5UTKeQmhUy6XFse32Ohm0tdSu9a3Iq3GyiEH9D3mvvXa1IipshqiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrwkvq1k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LB/BKJQF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrwkvq1k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LB/BKJQF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629C5eMG526835
	for <platform-driver-x86@vger.kernel.org>; Mon, 9 Mar 2026 12:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N0KUb8AFGBiIYPTEYvJInXNBz0gyDilMXYt3nEtg0rs=; b=nrwkvq1kJ1j8ilGh
	gmlBmvYd0QJAa5CQFYDrxSpml9rKZY/bOJBt/lgx8gaK2NCKn6/LIy+zF/vbbyGl
	3zKMCRnBUpRsdYZphKHlcnFR6opMG31Yan3+NShD3H6vOgJDrrxv0m7qTraa1Brx
	cyD+cdd3hBY7jlimJH807j2brgwXQzz5F3mNtVRlyDljrQx0lNhJFuzYI0M9wIi9
	3ZPnBbFwu76QWX5o9B88ahWUeKF956p0Lyubt59k4fNXPv/V8D43tOBE60oHX56e
	hxNTMKga/fxEzf5agrhxO5wb02Az0e+cZdtkWgpCxv4gFVWZD4Le1LuTzyCZ6d85
	ZkbRYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkg0xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 12:11:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb39de5c54so763281985a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 05:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773058264; x=1773663064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0KUb8AFGBiIYPTEYvJInXNBz0gyDilMXYt3nEtg0rs=;
        b=LB/BKJQFKF7Js/1M97Ullx7Ve4H6rtukGE53zsb76lwblTzqItoDuELdotf2qWQ6Go
         TsHNW7MENvN3KoKpNouXXNMEM2+rHzc7xu0R2t+xwLJomwOAbdLy6V8WV2nCSIAIffuy
         47A3Gx9q0hhHK8otK48cCGbSwF21FgPWWL21FtZ8emh3FC1ub3T4LqIPTKaWVuHgDsdu
         Ps3O213FHKGZzYIb6StbBDtqvc5HVspLiZkS7HNqLyup2b2ezlqmB4XM9uShXvjn2dLI
         SOGgcgeuXZNTEHwqnFXcJ0uk16JrGNz5mT0D0mZoe64NWv7lxKPlUJOZsJ/sVdE0F3KI
         YlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058264; x=1773663064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0KUb8AFGBiIYPTEYvJInXNBz0gyDilMXYt3nEtg0rs=;
        b=jELBUDfSJLyTr3UpIOf9gdR7b15XT0sYAQ0p3tlKyoeaz6bAsB+DSyKsx1iGb1uZJl
         mtt94mMK0EXGietYYjukkVnsv+aCPhhuCL96Astsd/KgXNOH9xMJMn3Lr2ATkvSOrGdE
         dpGBgueeXDV27Yf95DWgkJjukoXV1UMOzJpH5EKBRS26kedtdnYGBCgF8KBNZA74rGnu
         q8e7BJmuL6mC8tqxzzQS35YjDzI1gmInnwWkRWool4udnaczOQqwxWyiYc8OlndjK2i/
         gNlgPwtYWLdF5fKr40c1Q5/nMq3EJVfDlaYtTt0nmQOpylVvmG+iY86wHfgBKPQYIfXg
         cuEg==
X-Forwarded-Encrypted: i=1; AJvYcCXPxwoUXSf9jI1ktv2iwVHSIaKOKVnRmgy8TSoWGGRjNBgzqyl+PxXU8HJhqbyv7/ibIDauiwzrLr0gYIvV5Ieh6YHL@vger.kernel.org
X-Gm-Message-State: AOJu0YzYm2sKPWFLSyQ0CCe1KZKcCLGAwMlL4C5IQ/aPASCuuN/8/Gc5
	UzW9nNi9r/302e7GSqhlPCuPJMGY/nu5RkUKuh5Sp6yeg8vl3VydtYjDpcGDsd58+92WUIfgBn8
	lmGc+905BWawo9Oa/754UgObpmojDuu/HgXpz6vTU1Uv7I3jVXjqL4PfX2gzbLq2sATKkJ9cU/Z
	2Z
X-Gm-Gg: ATEYQzxvyMrQ22bDkb+WhALTXlHvIpCDoks80DqFzanFNrmzCR7f/r/U7sPFUrZoVFp
	DqZYHFJtozzP9UblLr7lw/3x+ewteqRhUxBiWFnv4aUvIifUS1JeqM28A1OzBftKYeBSx8bYH1s
	Udon6rNaZbIONnG1+Kqys8Caacg14L3hlFxvnxGiRAhVmubkd/iLGDRRi/7JerMkRhnMAlLbOE0
	GsMHPoE5aajx99jspJ6CZov84kCJ2ODp7LcocxsPginABkC9o8kFxwFEsUJCQHVGItcug1wj5zO
	mo1vT4fq5m1lRu2PTSvaW+q5pWXMQfjEn9pZMk7DfwSO0sBIMJDIh/6TbZE94dZ7CjvvBVmkNzo
	xgoKfcTE/5Q7cXy/noXdh7aXqSlIAxWnT6300uEsbHvM4fLsPCCuDVtK6/Iv+qkS1w5E5wZiykv
	dpTeg=
X-Received: by 2002:a05:620a:7004:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cd8b9b46a0mr243492385a.0.1773058263881;
        Mon, 09 Mar 2026 05:11:03 -0700 (PDT)
X-Received: by 2002:a05:620a:7004:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cd8b9b46a0mr243488285a.0.1773058263329;
        Mon, 09 Mar 2026 05:11:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8b67dsm352544166b.15.2026.03.09.05.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:11:02 -0700 (PDT)
Message-ID: <395f0607-7d6e-40fe-90b3-a7b49a6b7eea@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:10:59 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        krzk+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bryan.odonoghue@linaro.org, ilpo.jarvinen@linux.intel.com,
        hansg@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-3-sibi.sankar@oss.qualcomm.com>
 <aa6M2QSXW72xqYiB@linaro.org>
 <96f8738f-9baa-4528-8bc6-6ce20030e391@oss.qualcomm.com>
 <805525cb-ef53-4bdd-a73b-6fe7513228ce@oss.qualcomm.com>
 <aa61HZOuz42C_R7X@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aa61HZOuz42C_R7X@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69aeb8d8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=i9FFgL4WzkIojyinDGoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: dI3v-1TzmTMlkBi3AhzV9hmchxHA6F9i
X-Proofpoint-GUID: dI3v-1TzmTMlkBi3AhzV9hmchxHA6F9i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMCBTYWx0ZWRfX3KFieYI/PkWN
 GoOl2z/O4HzWfhm+wkdNAcVYiyw0zau01PNn5nROLZ4jmqtjVFgAJ8u7ikzt3mnHCY1LO/k5WDi
 ObjgmjXM0My352TwAx4buU9iJlMNIfcW+JgGDRcefYGuiElFGMeZGRYZuPr+bjFTIdZcD+jXqcN
 zjESwUTbGTCwwYsTpWmBDaXOgyRJCLh3r0SzNK3M8UMr0ULjyz1LhXV2kwoQIlwnXZSndbOOK4R
 xo2FL1WyNobcxtvp9nz7i/z9AHA1WJBvWdbA02LsKkAgOSch4/WnXvbFyrGUrEhmKQ8bp00FnbD
 55gevV3UflRo9re5bFfCzr7RmOYeAsnxU7XdzasOMJQpa7X8HvhGWbhmh3E26minIUGmagGX+op
 +BVMn0ABhDTEWhlLc3z2vRPbq8+shTiviLsAqwyWciUYD31pbt+LPTUlThephRCl9DL+vTlu8ls
 yhXKnTcb3AdNn6VAdyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090110

On 3/9/26 12:55 PM, Stephan Gerhold wrote:
> On Mon, Mar 09, 2026 at 12:47:33PM +0100, Konrad Dybcio wrote:
>> On 3/9/26 11:04 AM, Sibi Sankar wrote:
>>> On 3/9/2026 2:33 PM, Stephan Gerhold wrote:
>>>> On Mon, Mar 09, 2026 at 05:06:43AM +0530, Sibi Sankar wrote:
>>>>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>>>>> reference boards. It handles fan control, temperature sensors, access
>>>>> to EC state changes and supports reporting suspend entry/exit to the
>>>>> EC.
>>>>>
>>>>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>> ---
>>>>>   MAINTAINERS                            |   7 +
>>>>>   drivers/platform/arm64/Kconfig         |  12 +
>>>>>   drivers/platform/arm64/Makefile        |   1 +
>>>>>   drivers/platform/arm64/qcom-hamoa-ec.c | 462 +++++++++++++++++++++++++
>>>>>   4 files changed, 482 insertions(+)
>>>>>   create mode 100644 drivers/platform/arm64/qcom-hamoa-ec.c
>>>>>
>>>>> [...]
>>>>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>>>>> new file mode 100644
>>>>> index 000000000000..83aa869fad8f
>>>>> --- /dev/null
>>>>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>>>>> @@ -0,0 +1,462 @@
>>>>> [...]
>>>>> +/*
>>>>> + * Fan Debug control command:
>>>>> + *
>>>>> + * Command Payload:
>>>>> + * ------------------------------------------------------------------------------
>>>>> + * | Offset    | Name        | Description                    |
>>>>> + * ------------------------------------------------------------------------------
>>>>> + * | 0x00    | Command    | Fan control command                |
>>>>> + * ------------------------------------------------------------------------------
>>>>> + * | 0x01    | Fan ID    | 0x1 : Fan 1                    |
>>>>> + * |        |        | 0x2 : Fan 2                    |
>>>>> + * ------------------------------------------------------------------------------
>>>>> + * | 0x02    | Byte count = 4| Size of data to set fan speed            |
>>>>> + * ------------------------------------------------------------------------------
>>>>> + * | 0x03    | Mode        | Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )    |
>>>>> + * |        |        | Bit 1: Fan On/Off (0 - Off, 1 - ON)        |
>>>>> + * |        |        | Bit 2: Debug Type (0 - RPM, 1 - PWM)        |
>>>>> + * ------------------------------------------------------------------------------
>>>>> + * | 0x04 (LSB)    | Speed in RPM    | RPM value, if mode selected is RPM        |
>>>>> + * | 0x05    |        |                        |
>>>>> + * ------------------------------------------------------------------------------
>>>>> + * | 0x06    | Speed in PWM    | PWM value, if mode selected is PWM (0 - 255)    |
>>>>> + * ______________________________________________________________________________
>>>>> + *
>>>>> + */
>>>>> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
>>>>> +{
>>>>> +    struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
>>>>> +    struct device *dev = ec_cdev->parent_dev;
>>>>> +    struct i2c_client *client = to_i2c_client(dev);
>>>>> +
>>>>> +    u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
>>>>> +              EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
>>>>> +              0, 0, state };
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
>>>>> +                         sizeof(request), request);
>>>> I think it's nice to provide users a way to override the fan speed, but
>>>> is this really the main interface of the EC that we want to use for
>>>> influencing the fan speed?
>>>>
>>>> As the name of the command suggests, this is a debug command that
>>>> essentially overrides the internal fan control algorithm of the EC. If
>>>> you use this to turn the fan off and then Linux hangs, I would expect
>>>> that the fan stays off until the device will eventually overheat.
>>>>
>>>> I think it would be more reliable if:
>>>>
>>>>   (1) The default mode of operation does not make use of the "debug mode"
>>>>       command and instead sends the internal SoC temperatures to the EC
>>>>       to help optimize the fan control. (This is what Windows does on
>>>>       Hamoa, not sure if this is still needed on Glymur?)
>>>
>>> That's true, Glymur already has a way to access average SoC
>>> temperature and even on Hamoa it can still be functional without
>>> SoC temperature i.e. with thermistors it has access to.
>>>
>>> The aim of the series is to expose fans as a cooling device so
>>> that linux has a way of fan control independent to the algorithm
>>> running on the EC.
>>
>> I suppose the main question here is "what happens if i set the fan to zero
>> and put the laptop in my backpack"
>>
>> The driver for M-series Macs for example, 785205fd8139 ("hwmon: Add Apple
>> Silicon SMC hwmon driver") hides that behind a cmdline param, since they
>> have no certainty. I would *assume* that if the CPU hits thermal junction
>> temperatures, our boards will reset, but we should be able to get a definitive
>> answer here.
>>
> 
> The CPUs should automatically throttle when reaching high temperatures
> and Linux should also do this for the GPU. So the chance of reaching a
> overtemperature state should be low as long as Linux correctly
> functions. The biggest risk would be probably if Linux hangs, the
> watchdog doesn't trigger and the machine is stuck in some state.
> 
> As for the hardware shutdown temperature, see commit 03f2b8eed73
> ("arm64: dts: qcom: x1e80100: Apply consistent critical thermal
> shutdown"):
> 
>  "The firmware configures the TSENS controller with a maximum
>   temperature of 120°C. When reaching that temperature, the hardware
>   automatically triggers a reset of the entire platform."
> 
> The question is if you really want your device to hit 120°C. :-)

And whether the firmware running on *your* laptop actually configures
these limits.. I would imagine that to be the case for Windows products
where the TZ comes straight from qcom, but I think someone in some thread
mentioned LMH is not properly configured on Chrome/TFA.

In any case, let's see if we can establish what/whether the EC does in
that case

Konrad
