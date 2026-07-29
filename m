Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8288B3B38B1
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323247; cv=none; b=UyjhJf63JRHpPm5jcy0w+LCxUV8OiVvNlZWRz500RoUQGe1emNBraSZe+nmnTx2qOP+kl9zUrkS5VqA1vivhtFepBl0m6K5AbblR6Aca9EBlKerXLwPCsmRC1ZUiK/sGUx2Js4zhvwR6CCvXz5GndPU1VEVxbjbAdREn0ctsh1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323247; c=relaxed/simple;
	bh=d3y7bvLW+9u7dcFhzMEPcUOpEjchimLMTHUk3emE8FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOWuqlXBWKXes3uq1kubo0r3879OqPqfjpIJht1fiLMDjgQkGmvP3+Cy2tIlXZkAqDd61b5iOrN4exdANf5q5SZZti51uu+EyhkVdcZDb9crNnihknRYVjkfB4kVdwDMrlnsvoVgpcfC6C2nPc8iOxgN5aYIbWBZ9iWhi+leHIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cpTp/awj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UnigvOPi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cpTp/awj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UnigvOPi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TB6pS81421102
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jb6QOfLmqATVdsCHpt9kJ443d7h4Y5J6phU4BXwhkVE=; b=cpTp/awjkvX6Sety
	QSIEZMSfVSq/7ylmL6PnI9O0hejiP1x1/YyebnU21eMdCtWc7vcbw+vy942lZtfx
	PSVW6xx82InJ4e9kUE4fDVW0fi3KE5E8SjgQ5or9ethjAYOuAE1+i3X98KIy2iq9
	HNmeXJ80oFCXm8BI1O8Mv99q36vKKWFAZ5+zyZ5i+FqbLpUalHd7n3+D+1QxTdbA
	sD1PzO+14S9eOSif+i8it/vFgV0Dp8cUHAa5k5u5AAeq15uyu6kHSgrwlSjTcUzp
	MElbi52WWMvtvwJLuj42UTtFLq11/ZrlKcEubmcTK27ss7a0xV/PjlxqIktAVadw
	VNOM1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmm1bg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:07:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52b1c695f02so481651cf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 04:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785323245; x=1785928045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jb6QOfLmqATVdsCHpt9kJ443d7h4Y5J6phU4BXwhkVE=;
        b=UnigvOPiON/dHoEMFPZoHppbfTfmWIN2khdPjcfQElxIEAMje/5LwgMMDgOMO33WhD
         KGiQnSdCEN3Fohr8BC69UeS7MDKcyD0xaeaIJ3Lv3MlvgrxP5LhF+mEF/Vp4/FPZWUSo
         aFxr9ldk1SIcSrJlTraB1BdmNjj4cw8jCsebJIto3HwT6kN99ED2QbOL60UAO2Fw55Le
         XYlUMdI6yvmhqs55ZWWxydfq0Uv/vFTh+GcrSP4qq+Foge8vVnqVgnvkUH/55fE0ICXq
         T5bhr0VF9pesCYIHYyc4WZh7ihy++G0c4N2adYushhkLu/kXxtcSPkSbfL+EIdz0h2eM
         HJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785323245; x=1785928045;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jb6QOfLmqATVdsCHpt9kJ443d7h4Y5J6phU4BXwhkVE=;
        b=CMk46YTAy4EaB3guJJtbTWgl4luwNFVTjclbJyGMG5cd1BaT7YqFmYALQ7aI58CXhZ
         rmMVH3SY/K7ONH4BRpdestbPdUVg6j2WWaI0yEvKbFvxnyqjnxrVFjFUkezpYj4qbYFe
         LMCR04AZ/rJMdBAoYyL1uxVAoLFnVoJiGcloht1l4LcxzQem1DY9Q/ISDaLqUI/MBvLg
         25ZYRyyYBc3iCgWgSOdFzN/ixCWArq2Pv46x4Px4joozl0HhTOVNrP2RosGclrVipnxL
         fXsHrdmHSJRv0/Zveg4bqaXTmZWXoDVFPhpUQWuBvauAnAF5ByJJrc120q07Hc6ZraKR
         L29Q==
X-Forwarded-Encrypted: i=1; AHgh+RqOc7HGAeAGwS4cW1OJdNc2PU3LXN43f5lCb93Bjq49PwBJoN72lNBzaCbrIGNN+bjWp9Sj9WXjnKvvS+KJj7IHoGYh@vger.kernel.org
X-Gm-Message-State: AOJu0YyPMp2Z223pTxm+m44KvYQE2+p51t1fNeqVrwZ9i6wGvDZXnkXI
	tsKmB59e8lDXbw7oJ2lP3CgfnERzFgx34ZnS8qVfkUTbZBLVMBc5zSys9D9LmriRrVKZ0QtloM6
	ALHDkYkB/xNntHM2jWsoRbFOf95PtUPFe0slmrl3PuHBt79gJDNjoQNRHXzOy8TO1G2AJ2uwZsu
	zG
X-Gm-Gg: AR+sD10lv9m4lSpeXWYTkKG0sSqygFHU9crYTStsIWvsQ7O1vTdeU8IkS90P2Hlqyfj
	dk3bb4qMt+VYYMSZiHhHHIvF0/Esxvp1Eu/6Lu3GNRNY6rgST75/rYn3MCgyIzynpVm0OIBn59C
	BjBhVQHH/UMSF+ea68HJawSBC9B9i1IQQ7/mBV9eKa1b749Ju5dHHmLZa3+kxKRU02PdHi/q4uU
	trE34b91zvAgYIlYboBl55dqoDgcTCNMYVtXVBeoh1Mr3JpuljXwlwf8BYPH8UU+AgY3CSFG+k9
	6PJ8y+paQyeyLlhT9hwDG6VyDYwJRyleJ8ifl/FTQTCp3xaREB1rjKSIZIxsbo1E+LQIgdFHgJ5
	2I0Rg/O6FP9zT8hkwd73lKxy5
X-Received: by 2002:a05:622a:144b:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-529df3170c7mr57667661cf.0.1785323244611;
        Wed, 29 Jul 2026 04:07:24 -0700 (PDT)
X-Received: by 2002:a05:622a:144b:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-529df3170c7mr57667271cf.0.1785323244206;
        Wed, 29 Jul 2026 04:07:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83c6858asm99687666b.10.2026.07.29.04.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:07:23 -0700 (PDT)
Message-ID: <eb8731e2-6cc5-49d1-a746-3c81563094f0@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:07:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and
 LUT calibration
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
 <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _K0ey2EoRSdd8PVrnf51rM7usZQrawf8
X-Proofpoint-ORIG-GUID: _K0ey2EoRSdd8PVrnf51rM7usZQrawf8
X-Authority-Analysis: v=2.4 cv=R/Uz39RX c=1 sm=1 tr=0 ts=6a69deed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8DESU-PLTaP04mM2rpwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfX7AC5dgzD0Q9O
 EmPrZhAzsoV4bxh0h6Hpzih56AcAxPbZxQ2LGmwkQL1K5YPi/JzyW5F2YElmN+bK3YOoe9wlqY2
 bU/vVpjaHKpQBPDtdbwScjNuL7JQ2faxMiM96JdNjMUdnv7tKUQHBpyMGdKub4plwRKRln1KZuL
 Bs6LedMhbM1gHRSx1h8fHnm0Q5ZYzl7zZI+199++iiLxL48oQJb+2SO6yN1UgtezXMI07h5D4PN
 jUf12M9Wjt41lpZLorSOTU0dNOy6mFC8LBdFZhv/bYwZa7oSqyT2ewEBJD8/6UtJw+VM+TNNQex
 v6O+QO68gw7ZuBjh4EQs3w1UAv1vVDjjt1J9/4OzxlG1agmno0X2GgrzPEF7hd5NFcpCJ6yOuOX
 U0VSlDSt5ttLRUMS48z6m4uIz86EpkSIV+7DQzXNM8foWJp1keoAkvL0F+ZkIR7i/UZqDBGit/E
 dnpx1vKfCAZ2VUR0Ctw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfX2TNyUnUAy4Ez
 c6sHMWsLApT7yShPoYJ1BSbY+y3FDF9TDcc+ETiftqtnB+/2PpNRMetk9GHRmir8wneqTxR04Z+
 l8VHupLgklbpNuJeoE8pjPVD5qUgzwU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290092

On 7/28/26 7:44 PM, Anvesh Jain P wrote:
> Add the EC command definitions and handler functions for querying fan
> RPM and programming per-fan LUTs (lookup tables mapping SoC
> temperature to target RPM), and introduce a raw i2c_transfer()-based
> transport for the two commands, since their variable-length,
> sub-command-addressed payloads don't fit the smbus block-data model
> used by the existing commands.
> 
> Fan LUT geometry and temperature breakpoints vary by board, so encode
> them in per-compatible qcom_ec_lut_config data selected via
> device_get_match_data(). Add configs for the Hamoa CRD, Hamoa/Purwa
> IOT EVK, and Glymur CRD ECs; IOT EVK boards share the Hamoa LUT
> geometry but are bring-up platforms without a calibrated fan curve,
> so skip_lut_set suppresses the LUT-set command on those boards.

So are we expecting every single laptop/device that utilizes a
compatible EC to require modifications to the driver here?

> Since the LUT values depend on each fan's maximum RPM, which varies
> per board assembly, calibrate it at runtime: drive the fan to full
> PWM, wait for it to spin up, and read back the achieved RPM via the
> new query command. Run calibration in a work item at probe time and
> after EC reset recovery, and make it abortable via a completion so
> suspend can cut it short. Track calibration completion state so the
> LUT is programmed once calibration finishes and again on every
> subsequent power-supply-driven profile switch.

I don't want my laptop to become a jetplane on every bootup. I
doubt anyone does.

Konrad
