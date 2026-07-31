Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A8235C6B6
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 06:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479129; cv=none; b=G6NS0KRvUCxJ2TeS85eVa+qevngUuuAuN8PN1Ukxmgqylu1exx+JTdCz8T1pV9DiCDepTpge+NPHmPyYnZLb0xZchybQ/ldpoTEfuadcanKmKKOAh85DctAvwVz03fEfR/MLTakywwHJiHUPZG20q8kPkkcDZ4VJ0GGMa1L3Bbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479129; c=relaxed/simple;
	bh=G40H8QQHfAHAJaisLzUUvo4a5Zx0ASqBCxVychTBOqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAsxlQQYa8g2qL4W6Vsy/gEz+Z4LJQijHfwR3qXREC4Uv4WmbUuX0IArjEpEJLvSHJA0WZysQEfvy9Buq49TQHWnF5Yn6zzKt4w5fprPvACCILPUlJ+/ZUTyDko2XK0PdL5tdy1RasfNY5nhn0G5ZSj2R1TvZwx2DZq7A4LNnmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/68/Lq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iuUmx9eK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/68/Lq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iuUmx9eK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V6BrOY3311548
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 06:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POuVEWnyuiz3uY4rm2V7x5tcHzK6GruQsBn9X4SISsQ=; b=N/68/Lq+OXLYX+t9
	girjcHCqRc0iq5Tr/m5VddMQ9//Q+KJaemJfSLV7CkP8JO7otIq1vyrRFc0Zj5GV
	0IxFlWn7MBkTjQ19legTPKtyxeM/rLCVez9CehYXiHb3tiB/iAeScDQUFmKxUZVf
	LkeKO3N7Zer4kdQNHgDsYUywnPe8GrUqybB1LWMAatGJ6ljVEwLi2NDlGsQowNH+
	NzSToYkD3L/wxyab+NZxMr+fW44ISIBqS3JetNBz7p5j3gPk+lFHPISbPNUFstpi
	FDCQcTzWK6DCHhb+bBkoCx1a50HiUSdXTup4+alAkGk4g+5TvdQDGWaVyZl8vGu/
	KuJ7Gw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp7g81xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 06:25:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso784790a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 23:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785479126; x=1786083926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POuVEWnyuiz3uY4rm2V7x5tcHzK6GruQsBn9X4SISsQ=;
        b=iuUmx9eKYMLHV6XzpchiKwTP/KX72XB91z68BfvHBTYmBguNsI3mrQp8BtW60DQ9uk
         t1S9OEkqUpVPEWBLvP01WbhXG/AGkvAOPnY6iE1FfvxJ86y3w3hYYQi+fTGTZyKca/Ru
         WOAyhkD14Er60Vy6w3MA2j9vT5NAB0ljLGhBRBdGPO1rhfXua75b5IQ6b65Jql4BHuFQ
         llAZM1e2aTfdadd6hT02rsULCCUFoAbP8N072nq7dWfVmW91mxONccSG3eZXFSesV/N6
         4g6SpXmT6g5atbWeXobLrRFHEjGKNkrArIzGcjwJvthFBvSOv/UGKXP/w4CWUA5PebDu
         2kbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785479126; x=1786083926;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POuVEWnyuiz3uY4rm2V7x5tcHzK6GruQsBn9X4SISsQ=;
        b=nY+kYRIW8F1layAcJsRmCXSt73Gcv3yxbQ1FqaDOLkLi8q5ShaH+gqivYUadDfbwuA
         9hFNiZ33oYYYZa/8gC3Fhb3EJFNblZiFXlScqm0wJ9TaK3AY9uPOfA7TQX6AiozbOyyB
         1hSYK0SuaPXGXb4OKR+01/0pLm9qBOcpJS7mZejVLijArr+0MXGgzLVma9sBII69XeaE
         QuvkF3rDt0YZWhc0akIkqH5a6xazIVAG0jIExo+R4ohDEnhZqWFDcTPJkeZ5/Vz/KqEr
         PFAfkyLMc8ptfK/qlZ/rrjWQprFHiS+1qkht8OPWTawqa0rsaqC99Yf5MS44V0LSxRTI
         R+MQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7dGtJh682mK5QyYlKZkQcyrLirJhpr1ZHbopb8wm18rztqKhZJQ73UttWUQKv0yqLpRySHKx2hBESbnTdnUJfsOFK@vger.kernel.org
X-Gm-Message-State: AOJu0YzxyWOFxf/4iJh6XmNygzVbfBJM2SgjdyhhkLDTc7gRM8WqvhFO
	2ChfdpHUhva5hZ8ncitjpdwuBDB1Kpmip8U+w6CY1SHlEDTUeifGD5/oLdRvy3GwBR6YF0bp2Eo
	arznoFRac9WsqnqKGcsjsdZ0CByuD+WoctxMUDQ9nbo+U5ky18dfmfkc+i96WbGkSALmX7ngmi3
	4Y
X-Gm-Gg: AR+sD11rzr3BmnGn29vVrimb2mZXQ9pdWVdOOKs/eejX7XC3NgKCWqlOZrWwwS0yBej
	+M9V/iEpprdwibXk7fea6e7vdJK6csaOVpal1rlRBDiVnjylTaZjulSmNLWv8jhgphluTCVt3gc
	rHI2Pp29SvCbdXjIGA3nZXMHi3iVbCHaiB0FBye/tcf2QEOdU+2WSzfSmlnjDGRcC2Z1Jx+o4M8
	gPlG1f2gmdEIn4yXlZbC2GE9tR5QySRNzc+t30lQDcl0QXs3dxsGqnuj4CRkSJHbPT37fuxpbZQ
	0EDdW+SW5c5O5RfjUGgHQ34dB4uke97c0WK+t3ngqzEW2DUo2NObg4vGnkMeeLloGEF+s2+kt6V
	UOc4sWMbKMdqHQkkxyuS9K++JAXtBfWFVecgDEQYd1iNIMW6lU7kC3JAwmuFBK4LpsGmQwPs1qe
	PbUbyl38xXYCzW
X-Received: by 2002:a05:6a00:1256:b0:848:3fe2:c88b with SMTP id d2e1a72fcca58-84ed6bfcff5mr639586b3a.6.1785479125560;
        Thu, 30 Jul 2026 23:25:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1256:b0:848:3fe2:c88b with SMTP id d2e1a72fcca58-84ed6bfcff5mr639566b3a.6.1785479125070;
        Thu, 30 Jul 2026 23:25:25 -0700 (PDT)
Received: from [10.149.71.180] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed5e30981sm338042b3a.57.2026.07.30.23.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:25:24 -0700 (PDT)
Message-ID: <46f53628-ea22-42e5-8de5-a2a76b6360a8@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:55:18 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and
 LUT calibration
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
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
 <eb8731e2-6cc5-49d1-a746-3c81563094f0@oss.qualcomm.com>
 <96411e0c-f357-40d5-81f8-14523836280e@oss.qualcomm.com>
 <3fa15948-eb8b-4f3e-af90-5b88fcc44d75@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <3fa15948-eb8b-4f3e-af90-5b88fcc44d75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BcLoFLt2 c=1 sm=1 tr=0 ts=6a6c3fd6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=kfAM7XMfZeusFuJwEhoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: pJp_1_78Dk7W7soU_8IHNPY74Nufw4NO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MiBTYWx0ZWRfXze/mNTZR4MnX
 0+3mhdNy9/+Slz1WHN4w9WXDWSSeCuSGl9JxSKGKvgUDQNCfhqiZ4QnLxCwWoqFxe7fCPB7B3LQ
 UDwuxUjYofExYdLSIiVaVLijNy+cNis=
X-Proofpoint-GUID: pJp_1_78Dk7W7soU_8IHNPY74Nufw4NO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MiBTYWx0ZWRfXwM9THma0uBTa
 yX1lp3mzUk8kkpz+PpRtgpvBdqjrKxzkA/7d+q6cNbk98qx1+5kQKX6kbdCSbtRsQA3KT4ctRPe
 uMHVxm4mliaAZRUlQeKxmgoRRCr1WOgT4sbn1PHIUzYRM76MFdAjhdOLrDox9NFK2JiK8V5F/Ur
 4021Rbps+9EOvrzYjs9hGRzYG9yLYtptSvXjY4o1u+yueFQbSiGmDMQwPD9D1RPH+i+99zN0DM3
 F4Au5lE+lMxjFyGIXp21VuloZMKdxKOMORI54FvyRtQHUL+cO/zDaY5sy39jm/2ukDYdg+cuTsw
 9BFDppbsiYibk19Sb+/SFZbldO8mmcrdKD2gihUbMdjTmYUtg+ZljwViLSnnO+lXxpF6I0OHW0g
 6e5Sf58J2C3APJvAxX1pUKSGjBSZ3acfHFmm5l9B3snmcpZI1uFi84FCYtmE9GSCB0a+VfEEvIE
 oOHhaPia26bIUBeQsQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310042



On 7/30/2026 10:38 PM, Konrad Dybcio wrote:
> On 7/30/26 8:35 AM, Anvesh Jain P wrote:
>>
>>
>> On 7/29/2026 4:37 PM, Konrad Dybcio wrote:
>>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>>> Add the EC command definitions and handler functions for querying fan
>>>> RPM and programming per-fan LUTs (lookup tables mapping SoC
>>>> temperature to target RPM), and introduce a raw i2c_transfer()-based
>>>> transport for the two commands, since their variable-length,
>>>> sub-command-addressed payloads don't fit the smbus block-data model
>>>> used by the existing commands.
>>>>
>>>> Fan LUT geometry and temperature breakpoints vary by board, so encode
>>>> them in per-compatible qcom_ec_lut_config data selected via
>>>> device_get_match_data(). Add configs for the Hamoa CRD, Hamoa/Purwa
>>>> IOT EVK, and Glymur CRD ECs; IOT EVK boards share the Hamoa LUT
>>>> geometry but are bring-up platforms without a calibrated fan curve,
>>>> so skip_lut_set suppresses the LUT-set command on those boards.
> 
> [...]
> 
>>>> Since the LUT values depend on each fan's maximum RPM, which varies
>>>> per board assembly, calibrate it at runtime: drive the fan to full
>>>> PWM, wait for it to spin up, and read back the achieved RPM via the
>>>> new query command. Run calibration in a work item at probe time and
>>>> after EC reset recovery, and make it abortable via a completion so
>>>> suspend can cut it short. Track calibration completion state so the
>>>> LUT is programmed once calibration finishes and again on every
>>>> subsequent power-supply-driven profile switch.
>>>
>>> I don't want my laptop to become a jetplane on every bootup. I
>>> doubt anyone does.
>>>
>>> Konrad
>>
>> There's no EC command that reports a fan's max/rated RPM directly — the
>> only way to learn it is to drive the fan to full PWM and read back what
>> it actually spins up to, which is what calibration does. It's bounded to
>> a 10s timeout per fan and only runs once at probe (and again after EC
>> reset recovery).
> 
> 1. please fix the firmware so new designs will have that
> 2a. if we're storing a LUT already, can't we store the max RPM too?
> 2b. if we don't know fan RPM, we can still expose a PWM hwmon
> 
> Konrad


1. Agreed, will raise this with the EC firmware team for new designs.

2a. The EC's LUT storage isn't persistent across reboots, so we'd need
to cache max_rpm on the driver side instead to skip recalibration.
Initial probe after a fresh boot would still need one calibration pass
either way.

2b. cur_state already reports RPM-derived state via the cooling-device
ABI. Is it worth also adding PWM hwmon on top of that?

-- 
Best Regards,
Anvesh

