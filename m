Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C2C3CFF62
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 17:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773680842; cv=none; b=SWXXKL7zaHUFwkTWdZEGyjn3IW6Jgc3PR+7wHvQocLcXunr/eKcV1fWcmvoVXxjfb+utJtHSRjUp42qTgxD3oB0s9/J4wXIu/YHJ7itVTozK3wywnwe3zDnUgwd097UuF6NFdhAS4eRF8g39IKudvsEgNiTY+cm6PFz/3RKwA7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773680842; c=relaxed/simple;
	bh=3Mogh2U0/iA6Ose2HBYTR0xZeYXsqplF/lZI95BMgXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cKXUVehIqS2y0LHjRGm1DjUODZ6/1/65wRN5EHDQdWZh0zWOo3HpxGD9z521QRPPizlDTfuNU4GjYqJfdLZrD/bdNOWmF4i7EgRipyeupzX+LMagtCtBuOlNlFmR9vmWiLhu8Bu53vfxi90QidLWlfkRWSzqLKAtCLcIOJ3NQMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PpJVhDc0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NlAsuBo0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PpJVhDc0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NlAsuBo0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GF4g1A796131
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 17:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDEvxOZLlq6f31hKlp51kGtXwhLqo+UTN8SDiRaUXi0=; b=PpJVhDc0gQs3b6i6
	ZR1lE0tgnjfugzPTJ+feZb5ty2PZloJrIoHci6DLhH9O1ytzb3XF5J/9mB2AhDpg
	Hcpbt2b6FnnhrtelKCrOP2zmch2iiPGJtVLZf2mAi2sEFEB8S/rGeKkrbiVwhWPx
	ZSLSbFb4LQ37Dk72Ij2ny7lAObCL9ZyvZILGFUOFXQl8NXNqAmFXRVex2z14FaPs
	t8oGnLaBTZV3QqqtyH65kHD7gy8biGDVgkxXSYCaRpeenYUT+CvHipd2cesplN26
	wbHYmhb+Zs/GzGaRpLSd4R6aCD3dKlvg+XsG7BOO1z7erDx9HAQoPr/1/OlOeZVE
	e/63FQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm6d0fg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 17:07:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0554888cfso22277105ad.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773680840; x=1774285640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDEvxOZLlq6f31hKlp51kGtXwhLqo+UTN8SDiRaUXi0=;
        b=NlAsuBo0Uy5e7y3tipr0G7Jb5e68MsHomkfShkEnNvn/Qnq1nBw5QihgB0vnJDaqdZ
         +LcseYi10F9tn7pDM531swj5oJWFTtM/E0L9gXp2HWc6UToUu7RjikqjtpulsL+xS+oD
         2ivg+ymWsqmPW1xRpN9zIjJkFmRzww7Cw0f2yqZq8z+GHwx/m8LdSO0kkd0KECjYmDSP
         2hNDcDmTLqQinTBwL6DVxiCMZ6ZQhNuhsd2Uy7dkGGqUWE2HQf3E2vW1oO3QLgI+tiiL
         U+h2VOboQS/tz+kOmPm4YSEOVrUAuxj7NI0lZmxZzT0NI+S1msH/f8qV5T43YOVPWb7W
         HmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773680840; x=1774285640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDEvxOZLlq6f31hKlp51kGtXwhLqo+UTN8SDiRaUXi0=;
        b=GAnv6jGKUxuixZD+iBj60ePIt/mthLemFsJ8xVyLsfI/nLsSD2mUg2if6FAfWx5hk8
         NFtNliBAXTQjSxK5+R7Np0EiNP/GmMNdX7mjLR6nYKUTx4WfZWY3qTcrJ5UlW8Atni7A
         N+ciPi91yRfbEXmYq7PQtfVNEoipi8oq1DEBE161CtWXd2/NzStkSoPR3zopLZRsZuM7
         /Zd+WWDaMqEl46xOiBzU8G+WzL6dRr6lcAXk2rced3x6h9T7xLzuf8EyPaAafJqx/8SB
         Bv2XuxVu/oL4OP2duZuQW4mCzAidNPArBsA0dyy/50soRf3aAlks2HtkfGkNMIrF9U8y
         k8dg==
X-Forwarded-Encrypted: i=1; AJvYcCXrF2O8E9Om1jOavjFfpitnvLnsTpJ+KZMRhZLpTgyvKc0IJ/95fTNRPZxyjabc5+gCLW3ERpgT3UsMDWqo0anWfoZD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Qt0wX61SqkBSeT8kRlHRkvtwl1XAszujft13AVk6fUP8png3
	MlU54pqZSKEoX8LJXIX8si8xXBYJni5RHtPGeJ0hEhHonx0/O4YFl1dVuKGkPp6daduMP15WyCP
	VIR1PhG81HWeWZRudM/dD2KmLAXdafIq9/aZDWoRV8xZEZ+0HsEa/PaZDyKYekgQD31uVeFZsN2
	R3
X-Gm-Gg: ATEYQzzSzpPu2DPj2w1GxRGJ+D/Ybr4hqQPT4L0N8XV1C3EFyrb9JdTluUTOw9NhklD
	nfxmZ1NqXxGGGou2VRPKU8FTAVK8b/oiMxKev3jqqnnGXYlf2Nqal5vzPa/zUM9YSEDtXpBmTVK
	0gA+SwL+ef1EO5re0hl8s6vDL3h00NoX7XRWcOz1YFOlHBt/IWUx2WhBDOHTioivvnWg0zaWy+s
	ny8wzLVOblw2g0ak6wWbUTe2QqXqw6Bi9MZ06QQHmkiHX1to5CF+n5vCb4hsQteg90cqaoK4X27
	txO0e0HOGGJjKXDhFM0aywwyhf6OBD81/2WaoARgeSKXTiDlgzmULvCA8wY1fohaka0pf7+jaQo
	rRmVdo+f/sRyBTPrh7MubfeIkS9D/CTqwFVi4eCeZwg==
X-Received: by 2002:a17:902:d54b:b0:2ae:8288:9122 with SMTP id d9443c01a7336-2aeca94050dmr155868465ad.5.1773680839813;
        Mon, 16 Mar 2026 10:07:19 -0700 (PDT)
X-Received: by 2002:a17:902:d54b:b0:2ae:8288:9122 with SMTP id d9443c01a7336-2aeca94050dmr155867825ad.5.1773680839040;
        Mon, 16 Mar 2026 10:07:19 -0700 (PDT)
Received: from [192.168.1.8] ([101.0.62.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8233e1sm112823905ad.71.2026.03.16.10.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 10:07:18 -0700 (PDT)
Message-ID: <417e71b5-1956-4841-bfb7-4116d20f3dc5@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 22:37:12 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
 <6eb3a173-c364-431f-93e4-7bbb7a32431e@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <6eb3a173-c364-431f-93e4-7bbb7a32431e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c7+mgB9l c=1 sm=1 tr=0 ts=69b838c8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=+2ldRcY3HLWus9HqRSG52w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=tYnmyoo4TD5ZbBYe2wsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: jfhcIj3ed8ioea4AbVh5gEK_QaZTPha5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfXy2G3tBWhsE+d
 r9eoDLE9Ih/sgTwMM+0P6Qyej+MUShk3UUoC/yEDa4lzurueHdlhniWXvRivoswSb4TLPBa5mLL
 lBJXRJeZ+YVfbQd5LeWCplKhXATH7p1oliw1RaFFUil+/+kEOKhM605p1RI9VXJ1FzWPuog/JsB
 ig5JW0qV5Sp7gW2gTgOJmi9lO++kWPt4fMw+RPX5NqmYZg8zmktbrE2HpiI/pQjDxFogTJr+iNn
 By2n+gxaD1FA7aRY0hMGZ3c8X60y5xw91ebcLmboP1+aSKCoxoXbu0vBDpsqI27ZdxdDSkdTp/2
 6Dhm32hv0PRwPAclY1VxrgBegB5SczHgoYrEyOadgUVF62tzGLB/eG53X2+SPzbGnUrqRc/C9LP
 oohjZEBybRzDW8BApfgXrTRtqg4aM0LCF2V5u4/ZolLUU7lCeH8N8X9CmbqNsnvnOKKrwiP9Bpg
 Rlnm3cKFyFKLrc8QfzQ==
X-Proofpoint-GUID: jfhcIj3ed8ioea4AbVh5gEK_QaZTPha5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160133



On 3/16/2026 3:57 PM, Konrad Dybcio wrote:
> On 3/13/26 11:29 AM, Anvesh Jain P wrote:
>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>> reference boards. It handles fan control, temperature sensors, access
>> to EC state changes and supports reporting suspend entry/exit to the
>> EC.
>>
>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> + * ------------------------------------------------------------------------------
>> + * | Offset		| Name		| Description				|
>> + * ------------------------------------------------------------------------------
>> + * | 0x00		| Byte count	| Number of bytes in response		|
>> + * |			|		| (exluding byte count)			|
>> + * ------------------------------------------------------------------------------
>> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
>> + * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
>> + * |			|		| Bit 5-6: Reserved			|
>> + * |			|		| Bit 7: Data Valid/Invalid		|
>> + * |			|		|	 (Valid - 1, Invalid - 0)	|
>> + * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
>> + * |			|		|	    (0 present, 1 absent)	|
> 						     ^ huh??
> 
> I see that it's not currently used, but I think flipping these
> bits would make it easier to comprehend down the line
> 
> [...]
> 

Thanks for taking time to review the series

The 0=present encoding was taken directly from the EC firmware spec, but
on closer inspection this appears to be a typo in the spec — the correct
behavior is 1=present, 0=absent. Will update the comment in v5.

>> +	default:
>> +		dev_dbg(dev, "Unknown EC event: %d\n", val);
> 
> Maybe dev_notice(), this would be good to log
>

Agreed, will switch to dev_notice for unknown EC events in v5.

>> +		break;
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	u8 control = enable ? 1 : 0;
>> +	int ret;
>> +
>> +	ret = i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, control);
>> +
>> +	return ret;
> 
> return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !!enable);
> 
> [...]
> 

Agreed, will simplify in v5

>> +static int qcom_ec_resume(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	int ret;
>> +
>> +	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD, EC_MODERN_STANDBY_ENTER);
>> +
>> +	return ret;
> 
> In a pattern like this, unless you have some error checking/logging to
> do, you can just return directly
> 
> [...]
> 

Agreed, will simplify in v5.

>> +	ret = qcom_ec_read_fw_version(dev);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to read ec firmware version\n");
> 
> "EC"
> 
> [...]
> 

Agreed, will fix in v5

>> +	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
>> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
>> +		char name[EC_FAN_NAME_SIZE];
>> +
>> +		snprintf(name, EC_FAN_NAME_SIZE, "qcom_ec_fan_%d", i);
>> +		ec_cdev->fan_id = i + 1;
>> +		ec_cdev->parent_dev = dev;
>> +
>> +		ec_cdev->cdev = thermal_cooling_device_register(name, ec_cdev,
>> +								&qcom_ec_thermal_ops);
>> +		if (IS_ERR(ec_cdev->cdev)) {
>> +			dev_err_probe(dev, PTR_ERR(cdev),
>> +				      "Thermal cooling device registration failed\n");
>> +			ret = -EINVAL;
>> +			goto unroll_cooling_dev;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +unroll_cooling_dev:
> 
> For those cases, one would usually add add a devres-managed version of
> the helper (devm_foo_bar()), removing the need to repeat this in the 
> driver remove callback as well
> 
> Konrad
Agreed, will switch to devm_thermal_of_cooling_device_register in v5

-- 
Best Regards,
Anvesh

