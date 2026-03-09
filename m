Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDC339B4BA
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 11:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056860; cv=none; b=V3Kd/SboaPkIHeBl1H4MkKDt2ZcAk2UOMcxPAD3+HaDWtlJLUDfNZz5of+GDLS5g4NZ7u/5/n/s8SeLBZWNT13EIkQxGZWmKocCg3zj7bS2MUMlswLw1QnmftRfbWIbEaKsU5YB4Y+2GFSNKQtmGrtoYYQ/uSi+aAcq6gRCygTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056860; c=relaxed/simple;
	bh=DoPEjWwBLqtm/JvLlriuTdp8La2V/cu6HD0tfJ/3KN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODPUe388eY+vJH9t3XdSfu42VQtLxotQcoMZSUeD+Z1nrgqUlUYzA1eh8mxgKba/R/Zkav6gMwZZrkodO7rv+/vm1+yrpmSbYMz2+A2OLjhOtMkPg2wNqiy3sj1Iol2YJwjfGecA8Gbh/LWDWGUvuWZHYMExkMhNZDOS892gkLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R24xypqw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K7Hf/4db; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R24xypqw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7Hf/4db"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297Rkt42850915
	for <platform-driver-x86@vger.kernel.org>; Mon, 9 Mar 2026 11:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmnxHX2UxVycu4QZL6Ds7pUS/n7cTEB4IxSrk7IZsB4=; b=R24xypqwO/7XKgkG
	PhWHf5THjkrKedfP0WorwxvB2EjS0FsibcJJyla0gxIQwaDAoKiHrolcBc4Mkqsg
	uI4xiZYqghEepgf6lj8c1nZQIboPcGRNlVsItyT4s7easUrRVbeuhlRg00ogJU6i
	61wy96FKWMJ+EiM4w9J8a2VhN/RAcQ2kUGH2Yp/QEYJWfgqbLzoigSRHSM1ZGiQG
	g7Ixt2NgYDHZyG3qxtdz1t5K3J0qYZi5SsVuwkR+/omsuMfm73qC8x3OPan44HUF
	wTjV9vfxncxuZ/Ub662XG3+I/3jkPRRloocbENSvc9sNPyUjbMxkEKDxrghNaECz
	APMrNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qewjfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 11:47:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb456d53a5so832696185a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 04:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773056858; x=1773661658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YmnxHX2UxVycu4QZL6Ds7pUS/n7cTEB4IxSrk7IZsB4=;
        b=K7Hf/4dbAqZSlUaKkMAN8kxzrpKIGyo8nk/wj4W7C7VPBM7xKHtKBrXT5ZfP0MOFHt
         ETazJ9USj0eXCRPjF4Z0jlx+XWKChvDc5lm6kH2qYWZQBXSvHomdl0t+/32dVHcbjEn8
         TcGeAL6ict07cU9qETcxz560p+k6D838ljIRPF0Q6UZu8v3ziDlaxUUb7vm9NMzQttof
         cf83lXwWhDD2ihv4fHD5sxvOcGy2CEFjy/bxHy3hCnJquzILtzaji7YOhdssyztpAZgm
         gHg9qj/CGp7ODR1rU+dLVOFcya9EeD8Ev6kfRAyuhfkvPJvnYKR7q438WcAjOv+JZL4+
         vr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056858; x=1773661658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmnxHX2UxVycu4QZL6Ds7pUS/n7cTEB4IxSrk7IZsB4=;
        b=Ueu+hWzQFz+4u35xPbMr7MtxTj2KV6s6GDHckFRDRyaFIy1YLgqYIzJp0+9B88ztrN
         MVCCP3mYGZOU10dqSiQX851twI3duN4Y0Cc4vJ6NifTe6We/ThDB91Fvg5BZcm7wbeXA
         SBIWJnbzMROU7PsctKTx7tcUFiYBtAusTb39egDA6QliL9QMrBXY0S4QvcCB9jq43/fy
         zEYD3MOgZbieg4zFRW8Oaecicb3mMYs8RaQZAX8UvYiAgz2MN6Ye5H74OHigOm5/c98W
         +HlEMWaiuVEtoLOg8M5ErhEp8qukOsYJw2p0u036PSrSA0jJWYTR+7UB2tvGsP+OiZzE
         4t1w==
X-Forwarded-Encrypted: i=1; AJvYcCUFm3FEilr7BfQ9ctYXqIkjAKVmVBmLIqI7zFADwjAqWi0rturhN/AOOUphNdcxhnk6Jn5I9ln+Xbbo50MLFwuIJJFH@vger.kernel.org
X-Gm-Message-State: AOJu0YzG1H3W02Vr0cLhYwGKLh0Fm58dnpA0al9Q7pxVhXd5EHDi9sCz
	W5SE2wHCVG8ANl002UFwcGPbimz0JLJtN7wkKbmXDuQ53YpYolgvexYkMqaTuPmgIlTZmZuWTzt
	pBeIYjR6CCRqAV7WeviQ5+RwitFbPTDR2oRel2RXSgXctNozB9lKmubmG9J5opz1RBRlDQbTGHZ
	Ot
X-Gm-Gg: ATEYQzxcS11LN17R0J8fbXgm9JNCRYPHtacmWeo67fNief273aFSqfjV7wh0R17IRDV
	7TFBekcamV1NyCp+0dNE1eDjshw+zAcuZ4lyknI4lh9+seXxR6a7JWleAEGT7Lr7VuHPP8PSoPq
	Jc3Qcynbtf4EbZ02KeawfbdsQ7DxjhA2Hd3qmH8NhAvZql7TPz1CUWy7phz31Tl7OXBCsN4Q5ja
	TQ4RWrGZdgAuuwqYMYK+EKgxdcwW49fjGEM+O4B2J6FNItOdIuv2fzzNoSYvNwOqOJ7FqmeLn6N
	vZ8W1Rvbya6EAAMJZY0VMnmRGog1tbH8tTyt07hJMhVbnL63YysyuAxdv/QcVt+MMm+zyPPKyeT
	4UBTDkxdLIL9+yve8B/hHbVgoURaFFdErqmbYeuTRE0ss6Dt7CbGxbSBn/hZf0zX1warYP5LTLK
	ORK7M=
X-Received: by 2002:a05:620a:4087:b0:8cd:7fc0:ee15 with SMTP id af79cd13be357-8cd7fc0f6dbmr641726285a.5.1773056857748;
        Mon, 09 Mar 2026 04:47:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4087:b0:8cd:7fc0:ee15 with SMTP id af79cd13be357-8cd7fc0f6dbmr641723185a.5.1773056857247;
        Mon, 09 Mar 2026 04:47:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66e0dsm3162371a12.7.2026.03.09.04.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:47:36 -0700 (PDT)
Message-ID: <805525cb-ef53-4bdd-a73b-6fe7513228ce@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:47:33 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <96f8738f-9baa-4528-8bc6-6ce20030e391@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QZMqhz0IBtq3ic_9QkW9gdm5QfssJraE
X-Proofpoint-GUID: QZMqhz0IBtq3ic_9QkW9gdm5QfssJraE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwOCBTYWx0ZWRfX3hCxe4aJ/yTM
 SCGkmMXkTmbwgKYCnTdIdBNt5pA27B3wNyRS1JxZ1zx+LL7geE8uFQEIF5mxZNFEcNhNcUSrKIf
 x9+Jf3+NFXFwYwdXBMuC1QfJX189tsuIhKuW9rufmGmfVgjDt8HAOyHvxvmddKcjXF3P1ibm58u
 DYusK1zcvjMZ/Htc1PblaUIN/enD7RSLw1p4EZR+m0Wf4TjBPXKvawdnG4Y0BpVVBUsjoK0D0vk
 Imw41NGN6oyWhWYxT5aaGUkY5pdV6UXwxBccjqvmXN0wlKRODFyV3QepJBe0OhIzEEgj8uQOhs3
 7AlUwU/hvbOkvGLKG7iCgqZHmLIZHh7OdcRBeILNhJpLfQhd+dsTyoXcl3eIODwah0A/Jhnk9ia
 xOe0NnyUkxcH7B5Er/EEU9I5z1ps3jTM8ifKRJ6bfLxGiIMUtq2BFI7zar42HL2IxQYao6RQ8mI
 MYtHSuettkQtioDtrDA==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69aeb35a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=uGzmvu1gi_0XBBI2Y4EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090108

On 3/9/26 11:04 AM, Sibi Sankar wrote:
> 
> On 3/9/2026 2:33 PM, Stephan Gerhold wrote:
>> On Mon, Mar 09, 2026 at 05:06:43AM +0530, Sibi Sankar wrote:
>>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>>> reference boards. It handles fan control, temperature sensors, access
>>> to EC state changes and supports reporting suspend entry/exit to the
>>> EC.
>>>
>>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> ---
>>>   MAINTAINERS                            |   7 +
>>>   drivers/platform/arm64/Kconfig         |  12 +
>>>   drivers/platform/arm64/Makefile        |   1 +
>>>   drivers/platform/arm64/qcom-hamoa-ec.c | 462 +++++++++++++++++++++++++
>>>   4 files changed, 482 insertions(+)
>>>   create mode 100644 drivers/platform/arm64/qcom-hamoa-ec.c
>>>
>>> [...]
>>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>>> new file mode 100644
>>> index 000000000000..83aa869fad8f
>>> --- /dev/null
>>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>>> @@ -0,0 +1,462 @@
>>> [...]
>>> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>>> +{
>>> +    int ret;
>>> +
>>> +    mutex_lock(&ec->lock);
>>> +    ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
>>> +    mutex_unlock(&ec->lock);
>> This mutex looks redundant to me for the current implementation. You
>> don't have any read-modify-write sequences and I think the I2C core
>> already has internal locking for the bus itself.
> 
> Hey Stephan,
> Thanks for taking time to review the series :)
> 
> Will remove this in the next re-spin.
> 
>>
>>> [...]
>>> +/*
>>> + * Fan Debug control command:
>>> + *
>>> + * Command Payload:
>>> + * ------------------------------------------------------------------------------
>>> + * | Offset    | Name        | Description                    |
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x00    | Command    | Fan control command                |
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x01    | Fan ID    | 0x1 : Fan 1                    |
>>> + * |        |        | 0x2 : Fan 2                    |
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x02    | Byte count = 4| Size of data to set fan speed            |
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x03    | Mode        | Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )    |
>>> + * |        |        | Bit 1: Fan On/Off (0 - Off, 1 - ON)        |
>>> + * |        |        | Bit 2: Debug Type (0 - RPM, 1 - PWM)        |
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x04 (LSB)    | Speed in RPM    | RPM value, if mode selected is RPM        |
>>> + * | 0x05    |        |                        |
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x06    | Speed in PWM    | PWM value, if mode selected is PWM (0 - 255)    |
>>> + * ______________________________________________________________________________
>>> + *
>>> + */
>>> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
>>> +{
>>> +    struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
>>> +    struct device *dev = ec_cdev->parent_dev;
>>> +    struct i2c_client *client = to_i2c_client(dev);
>>> +
>>> +    u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
>>> +              EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
>>> +              0, 0, state };
>>> +    int ret;
>>> +
>>> +    ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
>>> +                         sizeof(request), request);
>> I think it's nice to provide users a way to override the fan speed, but
>> is this really the main interface of the EC that we want to use for
>> influencing the fan speed?
>>
>> As the name of the command suggests, this is a debug command that
>> essentially overrides the internal fan control algorithm of the EC. If
>> you use this to turn the fan off and then Linux hangs, I would expect
>> that the fan stays off until the device will eventually overheat.
>>
>> I think it would be more reliable if:
>>
>>   (1) The default mode of operation does not make use of the "debug mode"
>>       command and instead sends the internal SoC temperatures to the EC
>>       to help optimize the fan control. (This is what Windows does on
>>       Hamoa, not sure if this is still needed on Glymur?)
> 
> That's true, Glymur already has a way to access average SoC
> temperature and even on Hamoa it can still be functional without
> SoC temperature i.e. with thermistors it has access to.
> 
> The aim of the series is to expose fans as a cooling device so
> that linux has a way of fan control independent to the algorithm
> running on the EC.

I suppose the main question here is "what happens if i set the fan to zero
and put the laptop in my backpack"

The driver for M-series Macs for example, 785205fd8139 ("hwmon: Add Apple
Silicon SMC hwmon driver") hides that behind a cmdline param, since they
have no certainty. I would *assume* that if the CPU hits thermal junction
temperatures, our boards will reset, but we should be able to get a definitive
answer here.

Konrad
