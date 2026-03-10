Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DDA3CE49D
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 04:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773118733; cv=none; b=Krn3q0bgn0P2HEKkeJEvbWTvyRWnI80MFo0w5kIQKVe5Z3Zdd5B/ozvByz+/2NlsHiEgc2NNx9I1GAfO0o9Hl2NmvOb326DtGQbLu0dZO5oKDGu0evEVggYjU8sixVilu874WLmLagYKHlAYd6k8l7nYwvAjqrF/FbRHDBTb5rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773118733; c=relaxed/simple;
	bh=g0VZcYkbEAoWjtbUfvundH5SdWzH2JHEQ59U8vBvDZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LIAikOg6aGYYYT+sD4svIJ5anx9g1HAms9c4JXBeE0wHYdK380xmXtCwESqrfk8+1z8GkLdYzkaf3hjXgyZhPqOsC7YsoMA/1kz8y1HiV7ouO7ulQh3gPzaiPMIJANTMEeDoKeT2PtSMJFhyki60WLC8bctkY42O+S9v5b1D3yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=au0E1wlE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIUHeBjG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="au0E1wlE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIUHeBjG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2Egfk3087346
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 04:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H7KaqtWnt34N8j8zZfzYvdmLElwwnGFgxLWqzJwr4k4=; b=au0E1wlEt6JubJ/l
	gRCo4Xd0JlFd2dcDfmkv+hOan6KiiiyryTPY0HFPETTnNDb2hKVlTJBhTYC46hyr
	2OJ88vlqhobLIX+t+ZwG7DMorzkUeOVD9F+VFdw0wfHurtpLMSGDpqqXTtEfw3LQ
	JsKa3bRQc+tX99etqm5dwUhQTRC+Sfv4gT1M+WPdQKeMIB4FgZ+YuW4zZBM1+Zgl
	n4Un6iRz0NduSktxqRT/OxDGwwK07dVWT/tVmUhODCj9o4ar/mVfVr3r9Ja0fOxW
	XBJd1oIiIEascQS3udyjPCnoGEFXi5xI1p2g3PKPHs0zc2R0JNPWHOjJhpQaD36D
	YQH33w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy82tf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 04:58:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7387c70046so2608844a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 21:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773118730; x=1773723530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7KaqtWnt34N8j8zZfzYvdmLElwwnGFgxLWqzJwr4k4=;
        b=DIUHeBjGq+Nm0MaQFZEiSyPujQM+UjnArh8B58Mrtqc3zpniqaIIINPzAUNDTeT/9y
         RVOIOeDn5ytnhzzrhFnjtLuKZGl48SljDpAAgODbaVurWu3x2hCbLEaxayybq4sgRPoX
         eExwA11QmU4JdJpJBR7kTrmYjCAveHwp6LhdpIytqHWitRBiOSfWYxNCQUsUk9vmP2So
         QVoKQWPfAkVqO3K5e2UJXNvniW2hH1yilAsAm6KWbQW/XJ/wVxJyudgV5KndfUEvq/7E
         tlkZUx+b6HqWRSLnJ7DKtZV1gHEOS+WO5CmqrdtDtYL21J/1lY7YRpmj83Vs+J6atk4J
         cIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773118730; x=1773723530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7KaqtWnt34N8j8zZfzYvdmLElwwnGFgxLWqzJwr4k4=;
        b=icHRlXOsXy0cUo5e2xBqAejSLV1tSTnHTzA/uonCiBqPXQtSIIWKGhhp75WgpfLAGh
         aZiLb3ofPSu1Aeoj8JKa0TVKFjomV1sqMkx0XWtpC7H1qy0/TU8dNczoFGvNG+RKns7W
         fM36kp/ZF/z103Z9Wb5rM426JkJGtm7aq8aiShvXEKyUFOVbqG/ePbHPfQZBwF7bodJT
         DSR2CRx4Msv9aK9Ek2PfRPaIItPDT+A3U6dU0N0sUOyc8C4UHyXZzcNoZa8TVcoZs00v
         b3S7z/KKuxc/iHBeJsl7y4J2CJZvxawBhG3hkvjlKsrp7uHJqtlrld0BSUZsxShVL0rI
         bfeA==
X-Forwarded-Encrypted: i=1; AJvYcCURI9qhvZXUaXFsrPU7LVtk64mq3xpnr7ssWdi8mj69vdvMS6r8YizxxGF8ZfEuEwwwgqKjGDK7nuDewDt358zjS8/I@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXNQ5WGfH0HU91GsqPA3qUlRWjfH4JSTtecQMhEj6uMZuqm1C
	Bw7Dcm6ALto6div4ZlCEHmxEfl0Y4HoU6aPfDgWlzS8QWsOyOAnlKEG4WbowGIzkVpQsmgNIxeW
	0HoEnSe1Jww3YWJUmTO7t31bN/lFHnEcRxqWdhYB9PXEB3PcrKLWJq5jj/QhbN20bhO+Zix6vSV
	C0
X-Gm-Gg: ATEYQzzLvOZnN+0Lk/+Xo8YhF0R3O2Xf62vV2a//eHS/buw34RB+BudEFSZT37hOHgR
	OTdxriKHgUvA9hyThKAEGBGya1FSLNC+ezM007WnHpyukds1430LE8LgpKF85AOQydvqEZTN7LC
	PCS/4DGuP9bYGK34ISohCQmaOL4FOMhoXWV2ivisx/6enCFM01SvWbVDBKuAshlcHV5XWb/pzX1
	Z6sz6aiwQlOZ+KmhhWzAqron/d7Td4KAGYSPxtkf50abGHGLrt05yZp7NJOdMLpXAi7dZt8emL6
	/jcw4gx30Odo31lnXR66zrpva9AUFC2ik/oHZkO1PnaTYe0Tl/XqGJUV1+YGr6hv0Mix3JsOCGN
	a1031CtbB1E3Eg9RBVbd4A1RLnfA0zCWkwNvP/P2ahId+CeERkXY=
X-Received: by 2002:a05:6a21:6da7:b0:398:7853:70ea with SMTP id adf61e73a8af0-39878537178mr8865392637.15.1773118729775;
        Mon, 09 Mar 2026 21:58:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da7:b0:398:7853:70ea with SMTP id adf61e73a8af0-39878537178mr8865359637.15.1773118729137;
        Mon, 09 Mar 2026 21:58:49 -0700 (PDT)
Received: from [172.20.10.3] ([106.216.228.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739dfbf4fesm10791464a12.0.2026.03.09.21.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 21:58:48 -0700 (PDT)
Message-ID: <5a60f6fd-8cd6-4936-beaf-492dfbfa5b26@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:28:41 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-3-sibi.sankar@oss.qualcomm.com>
 <aa6M2QSXW72xqYiB@linaro.org>
 <96f8738f-9baa-4528-8bc6-6ce20030e391@oss.qualcomm.com>
 <805525cb-ef53-4bdd-a73b-6fe7513228ce@oss.qualcomm.com>
 <aa61HZOuz42C_R7X@linaro.org>
 <395f0607-7d6e-40fe-90b3-a7b49a6b7eea@oss.qualcomm.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <395f0607-7d6e-40fe-90b3-a7b49a6b7eea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69afa50a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=8nKWbjjLc7jCNgWBIcU1Yw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Xd731h-ufghucUnmbRMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 07P-nx9UvOcZMRC8QCLnCsCgUYZe2uDT
X-Proofpoint-ORIG-GUID: 07P-nx9UvOcZMRC8QCLnCsCgUYZe2uDT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzOSBTYWx0ZWRfX94SLO/X2B2uv
 ETo1JASgZASGXvNr0qpMF3xmha4C47wD5iVFDP1uXoFex+yA8yQoRmrwVvLLilnlJj1BLEHjdV4
 cqUOdcH2oefAMcVpP50S7xSbIRpThEF1eOro3cyF9XEFSH5rp2jBujNVdXt/CoCoyWkm/vbrrMw
 oEsQk4mwT7d+/2U3ROMWDwNWDk5XF2PuR1E/9nmb4k/MRuw/3bjaDk0W2E7UUIQO9f4jNn/b0Mb
 Bt6j9I+NhvkHYmDMicKYJdyUqCJGwnLpe1Jn1v3DVuZrUjzoJTYQMSSEEa9ujc1SbxhYRaP+VT7
 AGltsTPk/e7hXHEd8/4DUUSgKHrJ4gBvT1Cbg3Z+FYilc4b3YtoUaRnc0eP1XYRTbIy5Iy6ZvHh
 X4hsivsKDuvp+oMeYwTzFw0/T6nEkMLP5dkyHC9K+RIQp3PFXUdfS7OVLkoNWDTbnJPppBPkv8P
 e4nYBNlSWxNGOdBz5MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100039


On 3/9/2026 5:40 PM, Konrad Dybcio wrote:
> On 3/9/26 12:55 PM, Stephan Gerhold wrote:
>> On Mon, Mar 09, 2026 at 12:47:33PM +0100, Konrad Dybcio wrote:
>>> On 3/9/26 11:04 AM, Sibi Sankar wrote:
>>>> On 3/9/2026 2:33 PM, Stephan Gerhold wrote:
>>>>> On Mon, Mar 09, 2026 at 05:06:43AM +0530, Sibi Sankar wrote:
>>>>>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>>>>>> reference boards. It handles fan control, temperature sensors, access
>>>>>> to EC state changes and supports reporting suspend entry/exit to the
>>>>>> EC.
>>>>>>
>>>>>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>>>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>>> ---
>>>>>>    MAINTAINERS                            |   7 +
>>>>>>    drivers/platform/arm64/Kconfig         |  12 +
>>>>>>    drivers/platform/arm64/Makefile        |   1 +
>>>>>>    drivers/platform/arm64/qcom-hamoa-ec.c | 462 +++++++++++++++++++++++++
>>>>>>    4 files changed, 482 insertions(+)
>>>>>>    create mode 100644 drivers/platform/arm64/qcom-hamoa-ec.c
>>>>>>
>>>>>> [...]
>>>>>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..83aa869fad8f
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>>>>>> @@ -0,0 +1,462 @@
>>>>>> [...]
>>>>>> +/*
>>>>>> + * Fan Debug control command:
>>>>>> + *
>>>>>> + * Command Payload:
>>>>>> + * ------------------------------------------------------------------------------
>>>>>> + * | Offset    | Name        | Description                    |
>>>>>> + * ------------------------------------------------------------------------------
>>>>>> + * | 0x00    | Command    | Fan control command                |
>>>>>> + * ------------------------------------------------------------------------------
>>>>>> + * | 0x01    | Fan ID    | 0x1 : Fan 1                    |
>>>>>> + * |        |        | 0x2 : Fan 2                    |
>>>>>> + * ------------------------------------------------------------------------------
>>>>>> + * | 0x02    | Byte count = 4| Size of data to set fan speed            |
>>>>>> + * ------------------------------------------------------------------------------
>>>>>> + * | 0x03    | Mode        | Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )    |
>>>>>> + * |        |        | Bit 1: Fan On/Off (0 - Off, 1 - ON)        |
>>>>>> + * |        |        | Bit 2: Debug Type (0 - RPM, 1 - PWM)        |
>>>>>> + * ------------------------------------------------------------------------------
>>>>>> + * | 0x04 (LSB)    | Speed in RPM    | RPM value, if mode selected is RPM        |
>>>>>> + * | 0x05    |        |                        |
>>>>>> + * ------------------------------------------------------------------------------
>>>>>> + * | 0x06    | Speed in PWM    | PWM value, if mode selected is PWM (0 - 255)    |
>>>>>> + * ______________________________________________________________________________
>>>>>> + *
>>>>>> + */
>>>>>> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
>>>>>> +{
>>>>>> +    struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
>>>>>> +    struct device *dev = ec_cdev->parent_dev;
>>>>>> +    struct i2c_client *client = to_i2c_client(dev);
>>>>>> +
>>>>>> +    u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
>>>>>> +              EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
>>>>>> +              0, 0, state };
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
>>>>>> +                         sizeof(request), request);
>>>>> I think it's nice to provide users a way to override the fan speed, but
>>>>> is this really the main interface of the EC that we want to use for
>>>>> influencing the fan speed?
>>>>>
>>>>> As the name of the command suggests, this is a debug command that
>>>>> essentially overrides the internal fan control algorithm of the EC. If
>>>>> you use this to turn the fan off and then Linux hangs, I would expect
>>>>> that the fan stays off until the device will eventually overheat.
>>>>>
>>>>> I think it would be more reliable if:
>>>>>
>>>>>    (1) The default mode of operation does not make use of the "debug mode"
>>>>>        command and instead sends the internal SoC temperatures to the EC
>>>>>        to help optimize the fan control. (This is what Windows does on
>>>>>        Hamoa, not sure if this is still needed on Glymur?)
>>>> That's true, Glymur already has a way to access average SoC
>>>> temperature and even on Hamoa it can still be functional without
>>>> SoC temperature i.e. with thermistors it has access to.
>>>>
>>>> The aim of the series is to expose fans as a cooling device so
>>>> that linux has a way of fan control independent to the algorithm
>>>> running on the EC.
>>> I suppose the main question here is "what happens if i set the fan to zero
>>> and put the laptop in my backpack"
>>>
>>> The driver for M-series Macs for example, 785205fd8139 ("hwmon: Add Apple
>>> Silicon SMC hwmon driver") hides that behind a cmdline param, since they
>>> have no certainty. I would *assume* that if the CPU hits thermal junction
>>> temperatures, our boards will reset, but we should be able to get a definitive
>>> answer here.
>>>
>> The CPUs should automatically throttle when reaching high temperatures
>> and Linux should also do this for the GPU. So the chance of reaching a
>> overtemperature state should be low as long as Linux correctly
>> functions. The biggest risk would be probably if Linux hangs, the
>> watchdog doesn't trigger and the machine is stuck in some state.
>>
>> As for the hardware shutdown temperature, see commit 03f2b8eed73
>> ("arm64: dts: qcom: x1e80100: Apply consistent critical thermal
>> shutdown"):
>>
>>   "The firmware configures the TSENS controller with a maximum
>>    temperature of 120°C. When reaching that temperature, the hardware
>>    automatically triggers a reset of the entire platform."
>>
>> The question is if you really want your device to hit 120°C. :-)
> And whether the firmware running on *your* laptop actually configures
> these limits.. I would imagine that to be the case for Windows products
> where the TZ comes straight from qcom, but I think someone in some thread
> mentioned LMH is not properly configured on Chrome/TFA.
>
> In any case, let's see if we can establish what/whether the EC does in
> that case


The "debug mode" which is used to control fan is paused during the
following conditions:

1) When the EC receives EC_MODERN_STANDY_CMD enter cmd
2) When SoC enters deep sleep fan pwm is turned off
3) When external processors like soccp put fan constraints on the EC

So when you do set the fan to 0 and put it in your backpack :P
It would enter suspend, the EC would take back fan control.
i.e. the LUT based flow that it follows by default. That would
imply it would be the same behavior as seen on Windows?

Either way I still think we all are in agreement here. This series just
exposes fan control knobs to the kernel and doesn't set any fan
speed by default. The LUT based EC fan control would still be the
default, the patches to improve this are in-flight i.e. ways to send
avg SoC temp, update LUT and select available profiles. With all
of these in place EC would be in good shape in the Qualcomm
reference devices.

>
> Konrad
