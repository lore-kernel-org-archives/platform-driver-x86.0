Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A9D38E124
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656883; cv=none; b=RtX4PI7EHmBHAXSBadqRCLURVAIFCjVLkefY/PgRjthQQHU9HfZWQE0gFXEJVq9GSQcgQyaWu0oXobd3xTLzQWmp0bKPqgCDYWNmfQ6EO0vm514VtXTL0FVNomNgFMLGwPXkCy9QajEk0mnjjSRXc+UY0BBw4jjpDd8poQna0sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656883; c=relaxed/simple;
	bh=Z6sgzCyD/+mTUE+CNMr+vHs1IyCsx2ukxqg8nEJr9/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ei1ymtUaObrBjRJtTe6hX3H7iFDjEDRH0WlWANvbWD6Jx6c7mxntMfXZoScs9SRZdOowak4VaJ3d5yJc2uBTXXXtMxJfUHGh3CTloJqztWH4BRvk18N7ZwQREGFC3pMfiAVubFA9TLZe0gKUwV3K+WpqzdqTTn/fNJMsjACcaaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZLRcYlB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4Xr6ah0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZLRcYlB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4Xr6ah0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64hXN1724716
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xHYSC2Zh2sIK8c1O1PlQgO469KM9EpxGZDFIyRJHXSM=; b=OZLRcYlBurNoiEbw
	0RTpnAqcjdFE2PupVCzw3RdsIsaIy2Or6AeOVmoZ21blvnoJYjuNijvlbWDdljDU
	OnYeKmLcmFl8qpgvU5IQ2fY0jIlC77N0E4/nfBpRfZ1LyrkFN8Tbn0MudeOc5qbh
	NG2yDY6qK8Vsw8YBB4AjApf4h8k066x1wxZvNMF4TvQkmERsbpmzsSJCqsan7n+A
	/aQ+PG+AXHBgo9X1DQBL++/phkxtESaH6FpTCMv+Gs4/rl86vtfBcaFSUOaOyaC5
	iJeDrrQGbkTXuKKbs3TeYMfrb6z2bdIacnQBdAm/JLSfEl1UQZasxAi7rRqNczLv
	htBkyg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udn4nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:28:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c4cde1f02so9589706d6.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773656880; x=1774261680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHYSC2Zh2sIK8c1O1PlQgO469KM9EpxGZDFIyRJHXSM=;
        b=F4Xr6ah0y7TJtlH+1Eci9VSNLuvfv/F3FciMDkyXUwcOM+1Q20mmw7DSAl4p+USN5g
         NwyMPHl73nV/ptZbuK63nPPD0zw/ZQuRAkt689WrxIg9NcjTyZ3/zjWPyRHEXbngkRnU
         RwKMfcpqE2KWwXUpoccMzt5gRrLeb6KK6+16J/SjVOb1t12qW/dZ3adRlqGNV5ICRFha
         gpuuikgYT+vfhofscqdRaZi5OdNop77Ht1ITSYaLVGd9Mg+5l/u1DBeempVSFQa3ZSjZ
         mB4LdZe5wm+QoADFerJkhRX4wTDv7I01PIDfJsZZb/9tjiRtuMeLfJ6eWGVNDA3W/D4v
         h3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773656880; x=1774261680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHYSC2Zh2sIK8c1O1PlQgO469KM9EpxGZDFIyRJHXSM=;
        b=rtFhdE/fHs9+v1Flbn+GKX2rCDq280IZ5z8rrluIBlieyKjuVcfHqPsd7zfftIi8rm
         FisdNMxdhoGl2TpcPTqyvCcIQEbSRerQzUf+8IrLt6MpUu/+CgM2awcNnl5DYA4yzFYM
         abK7KVtO+gPP1BIGE71+VQQ4V5vjt4l5tXytzEF2LqP+n5Qdr+hpIVwFw1T4VCIiol5C
         v0K8I/bMuYrI9v4zgiIoBYNL+lR5O6/6UmirheUDrAgSqAicOJXJfjZxXZMYMskm6CLq
         DRjoLIahA6A4RikU/IdIsioKfZjCD9/QSWNDx1RURHQDn4AxuXTCIL72f5eKmdkX+4q/
         HRUg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ43auZeFlspqokopnswWEoc2BVBy3mpL0BKekOiPI/M2xe5Qg54RIsA6GTBV+o+S5YAJ6CoPMlPRzvanX7+gAda5C@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiz6odUAf7hbTVOSygtDpIKCgh9RPtH64UjF6+Zf79khfj3H71
	+Lk9dNMT/9MsITwPx3TIzK8Xy8atAwuC1wEidoWbeekFzyU9MGE+diEmlchcvUvMFqxVIaTPuSA
	Bs3qE6NGAl27hDAfF9LCszxgCCDUOcG7AzkaG2VBdXC5nj7NukoriWl9l/WWW+/EUzlQ6HT1qu5
	8j
X-Gm-Gg: ATEYQzxfltVl3b6qQVoSQJoF5zwDmVO8TkYCGy8fYpqDl+1d6USIC7SL4G2WXw4D8/e
	3G55+S7vofnu8cI//icBQ93nbYiMy8RJqN9qw6QEitYJT0DHE1lVFwYeItfPAgLbb20Dwf0fmJm
	Q8tJF9J6Xs8/4IzCd2sUxdtNSMr8LyyONPF/98Grdmm1LfYoN1/qjjSCLJ63R16Kk2MNFAzkfeI
	r5YRyxCA1PpmrfaE9BvHHI2iE8sSVbHrt7ShbCTaluUXd4NzkZ6AyvbBDcc/sl6ct2qS0U2sQeg
	aES9hzUpmm3BprujBZbnIl+cdGyN0xrRrVSRumxvuHkkpmF/YLEsPUPUuUjLz4fpXJvlW1Qdovv
	5Q9TdsOnPpa5pBh8SWgi2nnH18U8Mvz4Nt2JvLX0n1UBGXtrgZz566hEq0NVCeWUdA5//DDuJ72
	KRqZs=
X-Received: by 2002:a05:622a:46:b0:509:2822:66ff with SMTP id d75a77b69052e-50957cdee07mr139541261cf.3.1773656879553;
        Mon, 16 Mar 2026 03:27:59 -0700 (PDT)
X-Received: by 2002:a05:622a:46:b0:509:2822:66ff with SMTP id d75a77b69052e-50957cdee07mr139541001cf.3.1773656879130;
        Mon, 16 Mar 2026 03:27:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6639fe6dc9csm4302297a12.17.2026.03.16.03.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:27:58 -0700 (PDT)
Message-ID: <6eb3a173-c364-431f-93e4-7bbb7a32431e@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:27:54 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7db30 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Hm7G6JvClKosMBX75qIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: AwCFRMnT8A8ZfvvedEZKl-DD4oy70asS
X-Proofpoint-ORIG-GUID: AwCFRMnT8A8ZfvvedEZKl-DD4oy70asS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MCBTYWx0ZWRfX235mLj7dbP+a
 O6unEKbmmjiOQKsbdiSK+cfK8BY3rQq425L9IhYV6yLZmKMfaiU0345JL4/HOaPsW9cBovYsHZr
 SH9vevjTsGX8XTGCsbmKBSGmzF1qzgsjwvSWoARAR4F0ia6e0Cv9DlrBFhJPSJLqT9pcUTx55Cj
 nWjR0rAnKBavZqcDbbzK8meX7kd6VAYGk83PT11Y63rtJPJihTq7NQiCC74TEwxsh9TkUOrU0tc
 x4AAIqOhwaVTrItNHKNfxDHcFjwb017jd773D/Ehi3uvQKGrCHycwVCLj/sKRHZGIeGVGWRg1rI
 iDdC6u/Pyei+GlvtwNiZ2RdrcsSVyaywhY8xQX30R42O94YgHfxQU9iUDr/dFjpQKK0eJa6kfX5
 6qfrOfgKH04vi9lAuXoOC+gzAvr+Z6cxOjQ9pwMKFi5ttRxhsF8xfh7o6IviuglfDyvGfzbyDSW
 zkoJRH+UegbWJdh4skQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160080

On 3/13/26 11:29 AM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the
> EC.
> 
> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

[...]

> + * ------------------------------------------------------------------------------
> + * | Offset		| Name		| Description				|
> + * ------------------------------------------------------------------------------
> + * | 0x00		| Byte count	| Number of bytes in response		|
> + * |			|		| (exluding byte count)			|
> + * ------------------------------------------------------------------------------
> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
> + * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
> + * |			|		| Bit 5-6: Reserved			|
> + * |			|		| Bit 7: Data Valid/Invalid		|
> + * |			|		|	 (Valid - 1, Invalid - 0)	|
> + * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
> + * |			|		|	    (0 present, 1 absent)	|
						     ^ huh??

I see that it's not currently used, but I think flipping these
bits would make it easier to comprehend down the line

[...]

> +	default:
> +		dev_dbg(dev, "Unknown EC event: %d\n", val);

Maybe dev_notice(), this would be good to log

> +		break;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	u8 control = enable ? 1 : 0;
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, control);
> +
> +	return ret;

return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !!enable);

[...]

> +static int qcom_ec_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD, EC_MODERN_STANDBY_ENTER);
> +
> +	return ret;

In a pattern like this, unless you have some error checking/logging to
do, you can just return directly

[...]

> +	ret = qcom_ec_read_fw_version(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read ec firmware version\n");

"EC"

[...]

> +	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
> +		char name[EC_FAN_NAME_SIZE];
> +
> +		snprintf(name, EC_FAN_NAME_SIZE, "qcom_ec_fan_%d", i);
> +		ec_cdev->fan_id = i + 1;
> +		ec_cdev->parent_dev = dev;
> +
> +		ec_cdev->cdev = thermal_cooling_device_register(name, ec_cdev,
> +								&qcom_ec_thermal_ops);
> +		if (IS_ERR(ec_cdev->cdev)) {
> +			dev_err_probe(dev, PTR_ERR(cdev),
> +				      "Thermal cooling device registration failed\n");
> +			ret = -EINVAL;
> +			goto unroll_cooling_dev;
> +		}
> +	}
> +
> +	return 0;
> +
> +unroll_cooling_dev:

For those cases, one would usually add add a devres-managed version of
the helper (devm_foo_bar()), removing the need to repeat this in the 
driver remove callback as well

Konrad
