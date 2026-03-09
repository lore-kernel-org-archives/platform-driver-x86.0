Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EA337C113
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050665; cv=none; b=Pf9VujncMuBUqHS7WlgTrbODq3YHuzP3pSiuywYsmSok3AE1G4uR6bqebkGrlNTV/p5gqDeX+ALhbdbDelfTXqMcb1FRIPRRTZ84fnkkEGFqUR6RyiYzsVnhWXRGSkY363DZTroJ4wLIAQXZBHv7cw3vmJ3OP/TtOr5W2oLAZmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050665; c=relaxed/simple;
	bh=S0oS8VlX0RfKXJ3mTjvN8XZGL0VduCi8cULevqBqy6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kgd3ugqf+vEJLqXX35vqEL5vKREJaXNCd7pEq8yFFlOElyFQ7fjPD6iU9ZdjSo3m0AKadOcHviXKbHOGz5sif/i9+1+toFqRSvhLIgn8CEK9vwazeATePfryjk/edhUDTH03ftGVkie9teSbQRjhpiuN5ncOVPezEP5CTesmEgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgQttZpp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5thoob3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgQttZpp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5thoob3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62982RRP755868
	for <platform-driver-x86@vger.kernel.org>; Mon, 9 Mar 2026 10:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qYAprgzT/EJPoiKM2WorXhnF7pm7bRD5qCZTGMuvt4=; b=DgQttZppbczhYgqN
	C0v4PYBXcMTAvc9m5EI0TAIKgmfjJ+ZFBuC2Dbx+WEbhRemjZSbDMhklt/ZfgEte
	gU7fIQ7GvaSKOK7MTG/8j+fKENJRRiTEqnTxW8n3t4OZI/FSV4oYyvDn6MVvDRKj
	MpsvuKU0sdqDcu76Bpc19m9TeLSXcArjrldgRYJAxg0/iV7ZIsGVwjOZrGbYRcpL
	wyaHtW+L9mO+XeMYvSFDiEb4ETaweWykavj9X0mf1iF2Yr1ej/Fq21x0jsrbOtHg
	ZF5gmFno6oWVdTRu09USi+zRtKoLz+1+VmDGkfSojuaWLYdi+o5uTy8vCrhlA8oV
	oHrKCg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crb14w1qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 10:04:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae49120e74so75551205ad.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 03:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773050662; x=1773655462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3qYAprgzT/EJPoiKM2WorXhnF7pm7bRD5qCZTGMuvt4=;
        b=F5thoob3zeM6oVzYggc4mFesDHWzslXpdi6uq7V3Qrr6Bf6tchE+sIpCnRvWJfXSfw
         5vvSKGV1YOkOnHyEe435h2uG8FfDMzur6fj/rT+JQjae/oCak1R52okYY2QtCkKQ1ZYL
         0j+M9hVajGZZ33vMB6u17jKZZAeQEf0aqePvcX83gnpUj0qLy/+wB0X40+d6yfJ/L54s
         Y0MD7Sv9yNt8N88W0sjz/ydZcm36n48QmbvR4oAHRInZ+4o2SZtCIYxv55VpnNy3/oD+
         6XXuwboQz2qQN/qIBPZtrlCxrMTJb1tzZrlr+7lVEseyP8/CUfKtMi2TykI5BHoA+M7m
         HEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050662; x=1773655462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qYAprgzT/EJPoiKM2WorXhnF7pm7bRD5qCZTGMuvt4=;
        b=Qg8p13sV+TRUVEtCMAMITSUe/PFL1xTOT/kSuouwnbEGoo9YaAS4S6W1Thz3XKWrVa
         une+tmvA+RxbgGXOrLICU/6uKEPTv70dnvlftgKeC51lGkr1d5vHXHIV/70mU0Z8/pr5
         EIa4tdknnG7FQf5mjEdf0mY87SWSz5Up9FploAgQvD++HbbT1NO8PbtLJ1bM6qPQVAJt
         JAqkqaXPCj7fdoaHeDLRBaP3UQDsx+xjyRXpHk0HnuPRry7iuS4EVFqa3FryuBcOF8VD
         qxrUifxq09s9vlWtNQlzs84L3POZnGxxzkGOVGIz5HezAbScNs5YQcpzo4ZRhMSwvm/I
         ABAw==
X-Forwarded-Encrypted: i=1; AJvYcCXukWOf1t+TKfxp7A3CbO6eY1TeyLjGk7m+9L/wLlwCbhqwLioDMt1RQEk+kG0CL5np4XWW8SoPhVjtSg1rCQQFY8Fz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi1op27wZdUQMdLUSoMX5fWeNOD+hC+5KnMCUul0gTfLIwBx3W
	9WbcDP6+Wdcot1FTQnywPCIkNH652QRpZjd7GseW4y7uV76TfHWoHwEm/fDiSmEb/UAuuXDtvli
	kdQfS4FHVJ7l7nJonj0m6/6Aa0b9Cw3+Taxpty7zYBKSCT1tp5fNtpWEu+tnCNRwB+KE7JMaqnv
	a9
X-Gm-Gg: ATEYQzybSf6WT8p58jSDiMXsnjYy3FG3D5mFySQxTSfKs4+iCziSbeaqLvvYmW8VL5g
	zoTK3Er3yuMM3kqbGj/1uY1vowIDzfHDSdchbww6lRzDCgAvQ5GkOXU1e/OnxPGYBmY8fBtbgm5
	FNYSTlnD6g28GmMVSHg49yZ1mEs5EEMo08rin1yjH8Hu9UTLSeYoL7oqm0ZsBThNTwGZtORWTIi
	CgzEPNpDK7Pn1DMVNjDVbG34fETcKcFmovECP0iNsIJrr/HrzUVd5Td3veFImGZeortnxq6zfaA
	SrOMdEDMRhfpAc4il7C0IrGvstXcImvO9SoIbqp4BClcNbPKuf7yuPYXcS5CI1XVmKNSgpLjCmO
	0PIqF1Y88dFDfMDWo+MiLMqMgq+Wb81Evd8mkyxbJ14B6pme8m3PVIWRxoeuNLgbHu6sJJYpqAC
	MAT6DjFVX4u+flKjX6MmEEBE81/UH0C2d8P8ZnlrE=
X-Received: by 2002:a17:902:eb83:b0:2ae:7efa:d804 with SMTP id d9443c01a7336-2ae824e9c40mr98463855ad.36.1773050661663;
        Mon, 09 Mar 2026 03:04:21 -0700 (PDT)
X-Received: by 2002:a17:902:eb83:b0:2ae:7efa:d804 with SMTP id d9443c01a7336-2ae824e9c40mr98463515ad.36.1773050661035;
        Mon, 09 Mar 2026 03:04:21 -0700 (PDT)
Received: from [10.190.200.237] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f74272sm111632265ad.47.2026.03.09.03.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 03:04:20 -0700 (PDT)
Message-ID: <96f8738f-9baa-4528-8bc6-6ce20030e391@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 15:34:15 +0530
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
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-3-sibi.sankar@oss.qualcomm.com>
 <aa6M2QSXW72xqYiB@linaro.org>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <aa6M2QSXW72xqYiB@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IYSKmGqa c=1 sm=1 tr=0 ts=69ae9b26 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=TpPQHASBu_zXfcA0E6wA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 4eisvTgVnb5OfdoIK3lL8J4sU6904PNz
X-Proofpoint-ORIG-GUID: 4eisvTgVnb5OfdoIK3lL8J4sU6904PNz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MyBTYWx0ZWRfX9t4OU7WzNAnl
 J/7YIbmZdqsC0WsCBNfvUbhU9hNrpmmAJIUzywfpUaEJjXL4RgXxZjCT1nFVEBopUjZeadF9mk5
 P53RH/38NNVrKqJRmZCEwEmsFHRNeXb3V8cbXROoU3G4s/0ad5kels4GIMB90wjJCdU18WyH/X/
 rZhiRsv5yF67N+b5pTDYEvuKPT9aPd8asn+jDRT0Xmlmx9+Yp0lOxPlWfS956g1Gr0AziJmZQ6Y
 WgbVWnJ6nNscuivqlsYxxlDHKDznK+hs79WiOm7ayo7c4860nu10pFv2+usUfZs0KMoP/vagFlL
 c6EqtUpTy1x2S/mdZWUfwX30zPVMUYa9cPCZky86FdhZbNicK3u/ilZJXgjwr2bVaMa2Bv7Gryy
 EemMxdb8eEzQviw71jv4spkK6B3q6VlhbkunhyPsT0ixewGkhNqHCzrjg15X4u36y1t6CN69EXq
 JgWRke5/W9RL5wCClTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090093


On 3/9/2026 2:33 PM, Stephan Gerhold wrote:
> On Mon, Mar 09, 2026 at 05:06:43AM +0530, Sibi Sankar wrote:
>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>> reference boards. It handles fan control, temperature sensors, access
>> to EC state changes and supports reporting suspend entry/exit to the
>> EC.
>>
>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                            |   7 +
>>   drivers/platform/arm64/Kconfig         |  12 +
>>   drivers/platform/arm64/Makefile        |   1 +
>>   drivers/platform/arm64/qcom-hamoa-ec.c | 462 +++++++++++++++++++++++++
>>   4 files changed, 482 insertions(+)
>>   create mode 100644 drivers/platform/arm64/qcom-hamoa-ec.c
>>
>> [...]
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> new file mode 100644
>> index 000000000000..83aa869fad8f
>> --- /dev/null
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -0,0 +1,462 @@
>> [...]
>> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>> +{
>> +	int ret;
>> +
>> +	mutex_lock(&ec->lock);
>> +	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
>> +	mutex_unlock(&ec->lock);
> This mutex looks redundant to me for the current implementation. You
> don't have any read-modify-write sequences and I think the I2C core
> already has internal locking for the bus itself.

Hey Stephan,
Thanks for taking time to review the series :)

Will remove this in the next re-spin.

>
>> [...]
>> +/*
>> + * Fan Debug control command:
>> + *
>> + * Command Payload:
>> + * ------------------------------------------------------------------------------
>> + * | Offset	| Name		| Description					|
>> + * ------------------------------------------------------------------------------
>> + * | 0x00	| Command	| Fan control command				|
>> + * ------------------------------------------------------------------------------
>> + * | 0x01	| Fan ID	| 0x1 : Fan 1					|
>> + * |		|		| 0x2 : Fan 2					|
>> + * ------------------------------------------------------------------------------
>> + * | 0x02	| Byte count = 4| Size of data to set fan speed			|
>> + * ------------------------------------------------------------------------------
>> + * | 0x03	| Mode		| Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )	|
>> + * |		|		| Bit 1: Fan On/Off (0 - Off, 1 - ON)		|
>> + * |		|		| Bit 2: Debug Type (0 - RPM, 1 - PWM)		|
>> + * ------------------------------------------------------------------------------
>> + * | 0x04 (LSB)	| Speed in RPM	| RPM value, if mode selected is RPM		|
>> + * | 0x05	|		|						|
>> + * ------------------------------------------------------------------------------
>> + * | 0x06	| Speed in PWM	| PWM value, if mode selected is PWM (0 - 255)	|
>> + * ______________________________________________________________________________
>> + *
>> + */
>> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
>> +{
>> +	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
>> +	struct device *dev = ec_cdev->parent_dev;
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
>> +			  EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
>> +			  0, 0, state };
>> +	int ret;
>> +
>> +	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
>> +					     sizeof(request), request);
> I think it's nice to provide users a way to override the fan speed, but
> is this really the main interface of the EC that we want to use for
> influencing the fan speed?
>
> As the name of the command suggests, this is a debug command that
> essentially overrides the internal fan control algorithm of the EC. If
> you use this to turn the fan off and then Linux hangs, I would expect
> that the fan stays off until the device will eventually overheat.
>
> I think it would be more reliable if:
>
>   (1) The default mode of operation does not make use of the "debug mode"
>       command and instead sends the internal SoC temperatures to the EC
>       to help optimize the fan control. (This is what Windows does on
>       Hamoa, not sure if this is still needed on Glymur?)

That's true, Glymur already has a way to access average SoC
temperature and even on Hamoa it can still be functional without
SoC temperature i.e. with thermistors it has access to.

The aim of the series is to expose fans as a cooling device so
that linux has a way of fan control independent to the algorithm
running on the EC.

The EC look table based fan control is still the default mode of
operation (until userspace tries to set the state of the exposed
cooling device). We have a bunch of in-flight patches which will
provide a way to tweak the pre-programmed look up tables for
the ec and send avg SoC temperature. This way we get the best
of both worlds eventually.


>
>   (2) If we provide a way to enable the fan control debug mode, there
>       should be also a way to disable it again at runtime (with
>       EC_FAN_DEBUG_MODE_OFF).

As described in the payload, having bit 3 set to 0 at offset 0x3
should turn off debug mode and EC would be back to operating
with the pre-programmed LUTs. Like you said it makes a lot of
sense to disable debug mode on ec module removal.

>
> Thanks,
> Stephan
