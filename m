Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287093542F6
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322988; cv=none; b=bQqwYtL3YEmhY3fLzz9Kllw9pqTVa2A/IAko0K4nBPLD8C6A9BmcQQJOwLfYc78RPN72O1Fj25DKEkAY+0MVlvSleiuO85B9H3o9V26H3nNKulWHY2wCgdSII5iWayPiYFPf8CrOY8XFYZcV7rR17Wl60R1Q8991Lo67qc9IRw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322988; c=relaxed/simple;
	bh=PxOtOLx01FWwtuTSeEKZdDI2cMEM41pZ6VTI5diTbmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AsTlsV6d2kqixl3AlMdZQ1WVWsFLv83cNwHD7cGskTamsPPOJOpi6GSrySIScZ34WBhFkwZnKrPYnE79n7swFw437NhBcAFgIZXdL2kURkPOZoIU9aQ0NXi/MBbJZH63TTUjCV/s4PKAWQZVl0FexAoQPRyrliwN+yRww27uDME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idfMF46d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ft6RS99g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idfMF46d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ft6RS99g"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7ewpa2326542
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	za0FHuojM5j39EDfBnNki699HVub6S3hVXHlAo6pnRc=; b=idfMF46dQbv0R6vl
	2j12h7nz7rJUyx0Y8qkretvbs5ejVQsu9922KI9Wgxj8kFB+zTz+BwwBV20a4S1y
	YGrN3k4DhUqSKljMNJeH53VrBn6UOKdFLvqwfuN4COKLShTrhe6NI6S7W7gBnVaA
	nV6SSZOIjY9ZXxjSQ0wytBqVipFP6ok+sT6+8XUvydo0dq4WikxoD7H+5dSu1cZ+
	xuH5uGOcppZ4uqGPvIsSO6lq/ik+K/IIwdX88LUa88PoJEh9SWftRIKl5G24c533
	OH8COo5cY7R6zXo+cPObVYxy/qyFVZC6Z6H/H+ue0olvjVzs3ptafg4rUD15kI/w
	Cn4xZA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbm1hbkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:03:06 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-977c5e92ec6so34241.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 04:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785322985; x=1785927785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=za0FHuojM5j39EDfBnNki699HVub6S3hVXHlAo6pnRc=;
        b=ft6RS99gV0YCQrN0QM4BdKOowgyezcdv6C1ubAEZCUmvbGxmtUYtVb+oBLXD3Y4CF9
         4DAY8lxiaPAGvbITGvX7L3JFo0H26ty/SKLwjfru8CsFGmY62YnwuCOWmHLEDpML+Otw
         FByCtG5Wm6vnPZDHAJR15LqUfNBhI02WpIosX6GBSluzXj1h37kV915kWhwTGtkk8eYJ
         rLZQIke4d58b8B/T2p8i11kElHw5pw9WhCqFnveuRBL6k3NrONNqO4dWjHkZPbW8WH4Q
         SBM5lcb++tLE6EaI8oJeVnymr33BgE4bKurbryQR7xrzYhdw4mb7mZ7sGTOVzeoJEFPm
         LcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322985; x=1785927785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=za0FHuojM5j39EDfBnNki699HVub6S3hVXHlAo6pnRc=;
        b=aauReE/nA9QWmpHE/gB/HdE6s6QHnUj44+M4rUp0MpeSXwIkS3oQPxONw5hpKRg/Cp
         wykWeyR3txzCqgKARlyETNIPnfJ9gMbp5WVPrRGvnLlOey5MyX9pMxOS+Pzi6oEtSkSQ
         ULTxyFB1bncWFOdsasYFZjec3qxiLdil/1mnQppYKADJKvVaym0fA1fqlS5mPjy9rmjZ
         krRfH7Jie1x884UgL5qeHWDY/jlNTmMbBltAPkp84Qr0M3FU5Zgl5xiO9rVlwxJef+/J
         xEEfbzt+4GuKXiEL9u01G4OM1smJbx+Uk36c5JuqrvCD0gtbUQ8WpKJwUOBEdvA+mVzq
         ViFg==
X-Forwarded-Encrypted: i=1; AHgh+Rq934Wr7CvUzlKL4TqCv/uKGACRhdYhS3aJG8fjNkTwgy3Q0vvUuaCLxAmKfMKGR5iB4iX6nds/ECzH3Vbjq8HtA2WU@vger.kernel.org
X-Gm-Message-State: AOJu0YwvQZ0NjG01AW3Rj4iiPCPwOrvbmMNxbv8UpEPnqsw7crOHOxHa
	Q1jWpCHPknZang31DNo9HzBSNH5opGF3pMzx2MjecCDCHboxDDXCSU0kSs98u9nDLR7xNTJeXI5
	DCP2mNgxPoPyVWiv7Jc29kbWsShUU94uHqlMiKaH0iehz9Bg9/4d1Zg7l0SgsMZMwEgXr/t1kl7
	DH
X-Gm-Gg: AR+sD10JXYT/3TVS9ZGJgvL78z1lax86+vQmCusOkAc1hUa8uNGrqLrivHOxXBwLmqr
	ghVwNzczk4Nc0M73dQmq6YXg30rtfEb4myjpRXJCfYh2HYCOTDuBSyRVzmrawiFsE+atpQbJmMK
	2K+FfkbpzWf2NAJ1A2CmDOBUkvFHP5sFSfOjjbnV7HXR9CyBVUpjuV3j15vuLHInyWIp5oZ/t56
	/9ehelIKZEZbOSndYVXlKfIAY78Mv2SNQvx2/Zd9MZ4Cjbt1yijapHVD37u5mu9/EMYPsUvPNqh
	fnkuq1HEdWW9OT9b3If4aitZVVJKSuW/yKKnodNqu7u5lSfMVzd2k1jcWQV+Rh4LcXOzS1Fqohv
	E6iqEuFRinpku1T134HN33ysl
X-Received: by 2002:a05:6102:1485:b0:74d:ce65:3e8b with SMTP id ada2fe7eead31-7549f558f50mr1348629137.2.1785322985157;
        Wed, 29 Jul 2026 04:03:05 -0700 (PDT)
X-Received: by 2002:a05:6102:1485:b0:74d:ce65:3e8b with SMTP id ada2fe7eead31-7549f558f50mr1347388137.2.1785322969721;
        Wed, 29 Jul 2026 04:02:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050be9607sm743481a12.12.2026.07.29.04.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:02:49 -0700 (PDT)
Message-ID: <cf04c613-ed91-4929-aaf6-421fe9bb7ab4@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:02:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile
 based on power supply state
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
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5MSBTYWx0ZWRfX86vtZ6tUAMGv
 Voeq0kGUZ7cnBgLm0anWh/2pnS9eoFhPXz+eweSo1xs4QXLBusrUZ7XWGSTQqye/sgWMWhQ1UHY
 L8A1twlUGE9+I1EWjmtkbWw2dRx/WyljzoDBQJQ66/ZxV/7IpyQQGFMp4oYGiBE/yteAiqOsRaD
 2gqcjoms19F1cAsMnMKEzTYXXtmJjVir+SWr8V4iVRiwEhRJYuCEBAHo9xqPZ2dtaKrsr9JWlsL
 kQrvQ4GJ1mArkIxOwmQyuM9UHfwJlm+R5UJ1HB135AUCPIEzKPneJlR722OWJA1BhIGOVsBNMBl
 n+sMp/daipxQouiZ19SBH/34cqbLF1wC7o4G2nO97ettNL+4qZ87zNT9az/Azv5C+x/HagT8dZf
 vsnvTLFjLH+3dFXMSv+5cllEgPudasPF6FPQ0nIi4ekPjrjgRWo03jVfFiZislVKimJGHh8syzv
 i4uzUYUd4rkb1c7SwFQ==
X-Proofpoint-GUID: x7i-0Am36lAWNUxsPj3svg2Aq1QCOkaZ
X-Authority-Analysis: v=2.4 cv=R7Az39RX c=1 sm=1 tr=0 ts=6a69ddea cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Cp8rfTUuKJJUPH2W_1oA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: x7i-0Am36lAWNUxsPj3svg2Aq1QCOkaZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5MSBTYWx0ZWRfX3klwAEpgOpm0
 qt6CvFUU0plm5aWtse7Dwk+PTrMAbWBqnmfXwX+WLh2DNDx68RYuBFnwd6Nwns6d2UO8oGGTYgh
 vt5bm+rbAJ6hR4bKWiQoORU/97CKhgg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290091

On 7/28/26 7:44 PM, Anvesh Jain P wrote:
> Add the EC command definitions and handler functions for switching and
> reading the EC fan profile.
> 
> Register a power supply notifier so the driver can react to AC/battery
> transitions: on each PSY_EVENT_PROP_CHANGED notification, queue work
> that checks power_supply_is_system_supplied() and, if the AC/battery
> state has actually changed, switches the fan profile to the
> performance profile on AC or the battery-saver profile on battery.
> Track the last-applied state in on_ac_power to avoid redundant EC
> writes. Run the initial sync once at probe time, and defer the actual
> switch to a work item since the notifier callback runs in atomic
> context.
> 
> Serialize the fan profile write under the existing io_lock mutex,
> alongside the other EC command sequences.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

[...]

> +static int qcom_ec_set_fan_profile(struct qcom_ec *ec, u8 profile_id)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(ec->client, EC_FAN_PROFILE_CMD, profile_id);

Shouldn't all the accesses be serialized after patch 2?

[...]

> +static int qcom_ec_update_profile_from_power_supply(struct qcom_ec *ec)
> +{
> +	int on_ac_power;
> +	u8 profile;
> +	int ret = 0;
> +
> +	on_ac_power = power_supply_is_system_supplied() > 0 ? 1 : 0;

Comparisons already return a boolean value (i.e. the ternary operator is
not necessary here)

> +
> +	profile = on_ac_power ? EC_FAN_PROFILE_BEST_PERF_PLUGGED_IN :
> +				EC_FAN_PROFILE_BETTER_BATT_ON_BATT;

Is being on a (powerful) charger a prerequisite for entering this profile?
Currently plugging in a 5W charger would trigger the switch as well.

Should this instead be exposed as a fan profile for userspace?

Konrad
