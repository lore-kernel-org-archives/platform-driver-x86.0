Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315CB36E47F
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 08:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374787; cv=none; b=E0kKCy/L7KnR6/kd2cLAkza/kmhlcpVxOeZd6cswmxGWfB1cjXXOv2TSxZHmbWRA7mNYrDChEvh3Rnv4fwglSeJ4Kem1CuYRsVOMMr7fwy6+wzG9qT7vu4LjvPLzvCsg7LGuO3FdIENTRXOoXHdWbUNol89Vfm0W9IGEdszpdSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374787; c=relaxed/simple;
	bh=y7Givp6X+aHHBI7D4NAQtzaleqZk4shz9K/FoR0Z23w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GcDeIGHk/93CKLO2pbww5aPTHH+urZPB0flKKEtUNSGw7Nfr3toFcNoPe35lG7WLVkp3QRBwwtASWuKxs1QcbZsJslOhWfOVMvLgIhy8e5M8ixFsOkneHOS4jqGnNN6an4vIPqxnLgCR3llZdSImxWj00D67O84vqc4Yuzn2hAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T75yXsmX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlcxS5Iw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T75yXsmX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlcxS5Iw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eAFI904445
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 08:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OiTYF92nSDl/4Cdblj7cmFe0JGBHT9SI/7orZEEf9e4=; b=T75yXsmXJv7isYBE
	40LBndD3Rh7AouPB6NXSwYow0LsxdNRwgLS43cQwn77xb7xDUENGdDeFOk06M8jJ
	AR2psNsWMMMBnkMns95ocdURl2EIEtU1vexgrO5fIGneLLLV7835+btG5rcMzLRJ
	xHML7Wwtt2KpiU8L1sYdFwa3nMD2qqqYWT/qyXXQyao1xkXL1Ec6u2bV6SPwetQs
	hIsc1oayauRr+0rVNWDbHxRTNPeiNzdUZ+/pCu1z0VnAnNonN43i8YhnJBC9B05U
	OnAh4cXWXyItrAUkSC6RH7Q586RuMMPHHDEt/rlE6m96B4tG6QsUuLD1kewFctpc
	9L3pmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7dua0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 08:06:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9159bc52211so243215585a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782374784; x=1782979584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OiTYF92nSDl/4Cdblj7cmFe0JGBHT9SI/7orZEEf9e4=;
        b=AlcxS5IwSHcRN1HdsWMHiUv5mlaiwOEyIhdgQeEVrsHg37YSAsMIHvlAyxd86inTFb
         brlgMd89i121CmYpl2S5oatF3eANfD7utWmMTx1KRynpHUkXxARSmSL1lvyS96vbQ+gI
         lql2FjWmTIR1MvWvw1a1lqoS1+6ijKBAJHPse+kv/Nqkp9ccNiaqXCbhkIeJJMiivUke
         65YrdWlDTNw8/E4PcuCAQzYMj0Zhb55uGMg5tqYI8CLMdyGqzEepg/kinS6ZRfnpCj8G
         +1Rhm5vR+wjwFXuLgQYoBcbHUcfWPdECjKfzUR+GGKOpHRoNAwocy839fpJ4D/8CAzCQ
         Gy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782374784; x=1782979584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiTYF92nSDl/4Cdblj7cmFe0JGBHT9SI/7orZEEf9e4=;
        b=bph4qnKmRAOrw+9pNx9KrqOuuIs9fQUNOPRkYIp6Q/X8DBkpeUDEBHUTRUlvas3EVN
         +FqFtqzvA91A3BlsunbGW1h+Xo2jtzBr8+QpUPpr6uo4v+3dN41aDKWC9GK3gukJoQGi
         4CgBaJgqT2ui4zcIjMQeA2lHWrY0rN+7TZ6eKh1i+saP62bb1L+Ec1Fm84ryJdsAMZ6U
         +455582kjAzh+c5H8gdIPxDsfaZ6/joj23vL8tuOWHcGJXM+Ux85aEH3GlFooyXkMTQI
         YhxwQoQsjC0I8ksVCJGg1XRPFKXkO3OwUlLsFuPxrO6IZ6KQ81KbMceH0MCh09U8ax3B
         CgKg==
X-Forwarded-Encrypted: i=1; AFNElJ9Xqx4KZDC00v9NM1X2XB3oGtKquIa+fNzh1HLxPrVH8N1QJlkZx2uq5zg00RwhQr63nZOsR4LJ7mxMppqMwOp7hbjn@vger.kernel.org
X-Gm-Message-State: AOJu0YyvQH9A9kHRP3Zc+NP+FOBGF//or33spVwaZC9D193jNniNjTik
	0U7ChZy5ccHwdq5Ex/dKh9lVntQ/L4vODOIF/Pk8NdPP1/nAW1HtjQh21eYiG1iagP7ArD9Ynvw
	Y0zUwZDXEphGXToweu9SnkxU6dwCMMyT00RYr9oE+NOd267/IJZ60WcnsaMcCHROmqMvdLI7GNQ
	T0b6unVDkY
X-Gm-Gg: AfdE7cktUM7XNFlx4X7B+Ptrr2TkxxaF38i8+8sDaBApNgumoxNTthAb4OQBeIgLwf5
	OR2li601qhl8ZDim/EtH4VZcY8XL233ePzM7b3gBP7bfhvpMaYAfvW876xq6F6EvLVg+CmXfxSA
	29C7nmIIDd4FwSzRoy/5ownH/wivx0XgLQuT+KfHIuiCSiqj9eTrG/1rNcLRYct3unDLNnqbTBf
	ihxgFO0/rrn8wnDsursvSUI3CeUnTu6QZ5/Grl7lHPJ5f9WmXywJ6PObeqyGeXs4jIk9mx+AUR+
	6VnaIAxBKSGJgihYdM8/QK7QugRf/aJdoPeA+jf5bz7dJDJDJjiv7V5hBxBHKXxtJUX5s6V0D5s
	3XVbwze0XeED/pljzfOUgVW0R9Mhm3+kzatSf4E1TRnW1m4d/csHd2fhS2aZfKbxnG6Nx6dopog
	==
X-Received: by 2002:a05:620a:270a:b0:915:8502:f7fe with SMTP id af79cd13be357-9293a8ac13dmr199637585a.15.1782374784330;
        Thu, 25 Jun 2026 01:06:24 -0700 (PDT)
X-Received: by 2002:a05:620a:270a:b0:915:8502:f7fe with SMTP id af79cd13be357-9293a8ac13dmr199632685a.15.1782374783889;
        Thu, 25 Jun 2026 01:06:23 -0700 (PDT)
Received: from [192.168.10.101] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492640260a6sm55742065e9.6.2026.06.25.01.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:06:23 -0700 (PDT)
Message-ID: <1758c25f-869e-4500-9fa9-899f6fd121db@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:06:22 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
 <1d26c917-917e-41b8-ad52-8c1f3e306ce6@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <1d26c917-917e-41b8-ad52-8c1f3e306ce6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aqbj2FyVP5UfA_yIgh-VAoQU3jHWyLWQ
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3ce181 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=N9XqOlSSuhmkvUBdvI0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2OSBTYWx0ZWRfX00py/vEyDl3i
 7xSQ8JbQVR3f2IT6doWyThIxn+2exHC26SM1NSti7nS4NRgRrkaljfhN4bdkmcemxOHuyn7Fywj
 FM5Z9AAMyQl4UTq6sMCV0MWxqCApTkM=
X-Proofpoint-ORIG-GUID: aqbj2FyVP5UfA_yIgh-VAoQU3jHWyLWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2OSBTYWx0ZWRfX0kaoQXNnsoAN
 c/k5AJUlOiLEjmSMDqRvhcbu2tNACix1I/f9pHTJI2PKMoeqPg6FWdatuCRiYYP87TA2Bp0yaei
 /m7SbFbPAzp+hjcvknmWWBNKEHWUXerbRA7wsU5NlYyRdS2PlRphAvftLW3uJ3DNx1W5jjo5ns/
 VlzmT0vWnZspm+lFYusr1GiyAEXPpP/sHahVqWJn15SveyxkJd76xs7uFB7TgMat0Mr0diWK+65
 rtmVGNfUZ4k1kN0hGONxP6vGjYCQdi7gW7kRqiicQYQ5nHwnHp/OVUvsa+lrM13Kj3BT+bWgjjV
 4KZit2teIsPoQ0KojtKPC5omCzQUbIevLXpPiPcWGkmvULYkBC3rPSIYa+iygCRJ85bj1Rfv5m+
 5Qec7Ms6milMZedaA+cZW0/SriJkJIk3abaXTZsgs0dwUt8F5jFW0hLGMnA3k3Cby72hArWgCOY
 oXYN1fb+iH1UC9mY6FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250069



Le 25/06/2026 à 10:03, Konrad Dybcio a écrit :
> On 6/24/26 11:08 PM, Daniel Lezcano wrote:
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
> [...]
> 
>> +	case hwmon_fan:
>> +		if (attr == hwmon_fan_input) {
>> +			int lsb, msb;
>> +			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_LSB, &lsb);
>> +			if (ret)
>> +				return ret;
>> +
>> +			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_MSB, &msb);
>> +			if (ret)
>> +				return ret;
>> +
>> +			*val = 0;
>> +			*val = lsb + (msb << 8);
> 
> '+' looks funny here.. although t14s_ec_read() only reads a
> single byte and assigns a u8 value to the u32 that's being passed
> to it, so it never *actually* breaks..
>   
> [...]
> 
>> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
>> +	HWMON_CHANNEL_INFO(temp,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
>> +	NULL
>> +};
>> +
>> +static const struct hwmon_chip_info t14s_ec_chip_info = {
>> +	.ops = &t14s_ec_hwmon_ops,
>> +	.info = t14s_ec_hwmon_info,
>> +};
>> +
>> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
>> +{
>> +	struct device *dev;
>> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
>> +		{ T14S_EC_SYS_THERM0, "soc" },
>> +		{ T14S_EC_SYS_THERM1, "keyboard" },
>> +		{ T14S_EC_SYS_THERM2, "base" },
>> +		{ T14S_EC_SYS_THERM3, "pmbm" },
>> +		{ T14S_EC_SYS_THERM6, "qtm" },
>> +		{ T14S_EC_SYS_THERM7, "ssd" },
> 
> Makes one wonder what happened to THERM4/5 - may they be dedicated to
> the 5G modem, perhaps?

May be, I sticked to the documentation description which is not 
describing THERM4/5


