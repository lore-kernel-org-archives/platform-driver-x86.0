Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9473F0AAC
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721622; cv=none; b=IJN8JnN7obQR4lXee9/0OUkI+/9frqcPCH41r+cFpwqrSpKPpnFRCxZNV6AcxOA2JWiPwKEk2na4XwxMRfO+P7E7QOAYlTUrjbbAQhpuiftuSmP51q1CRFCk9ooJHzKPxPOJaLGW3xOF0+oZ10SvjukzsVSIIJyB4qQPEhshFLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721622; c=relaxed/simple;
	bh=/FQMZ8PTl30qhjjreoBbFa/jRq7gSWz9M4S5QD2OzHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/LDS3doRwy49tHgcP92DV2Ngjd4tmuDYP8d1ESwG8dNzD+P1Aii9sGsOZw7TOuwoZOskto8LV8H75sRJgP0VAOwl/2JHJJmTv86l115wPRHD//jFd0g+dntGI4ppTtD2brb1hB5oDcGLwzP3dosj30w2cbVQR/etll3NEWkqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hoUzKdaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNkvPAeR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hoUzKdaR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNkvPAeR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8O77Q2348325
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 08:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8ug/TssIPJ7efv2D8UanZxQcJDn+5rN972tF6NNCZs=; b=hoUzKdaRD6FMyLd3
	M5ZZ7fE2hT71BQnuEBDeEaG0wry1c4ziwOnRI03A1/0HaRBbae4JBdkruniNK4eM
	YLWBgWuu9FGXsY19/IHzIF2R9gL55gtYRpookPDcGH7wv7c8DW+L2TZzSPiF7qiX
	NdY7GjyrMqAKPeDk9t/aT5fqvvs9yJ4s3mySlviZSDES7fD/xwNdGxJjCisYQEqD
	bn1drDvr+fUVtdncoR748FGxgqx+wJJ+HBVCfrzFJUCdCxPz4KX954BLwIomO13U
	Jmh+MWCKIptoD8hg0G0NujT87IEYDxsZ2swI2jUGBzJM84LpqJGlb036j7JljI0K
	kYrPaA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s00fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 08:26:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ebb599e528so3980676d6.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 01:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782721617; x=1783326417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8ug/TssIPJ7efv2D8UanZxQcJDn+5rN972tF6NNCZs=;
        b=kNkvPAeRV+7HKdbXvRHMIvdr5vkkExwPnkDLkeZyzvOsPrcFc4NxUGPqUWAPvlITqq
         FBWn9Fp4nBjEfjyArdAHufnYhHfiNyHVC8Wva6kj6tgJuhbgW7do0/bvMIul22XgdprQ
         vqPNyDBRfrbWfBY1dyTcdYgNZH9hBSxkNY0dJmnOX+PZnI2uGAzbI1pvMsHL1NQQhT+0
         CjNqU03soUClUxgiSmduK9eTpQ1RbIYz3zDydXJDZMzEpnjNia2N2yVTYqTrsGTiQpsN
         JkgD5QTUOmSgKyslJXCvwVNEKP+vThuFOt6Upiv9DFKPXRllT88ojoEpQHGQiBUr+oHm
         TmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721617; x=1783326417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8ug/TssIPJ7efv2D8UanZxQcJDn+5rN972tF6NNCZs=;
        b=IHPlLKgr3/38Qzu2tBo9M4AbrkmEzU+jWQl8WyO7CibWz4oVp1v3ohJVdpr3olEohG
         ghXA3OKCErcV6V2x251tIqumYDx4JxlaQtTKQm61sUUx+/cVCTGt0eeX22XFP2t+Z2Ax
         fbq/HE5klv/x8kc2Qhif79zFB3LMBm8uMP52DE18UxCTpXVxQpfmBJA2u17j2GKT2/jf
         /RQ9xLddLeeIf3H30e7zdDwN87pqK62bWhX3wRBxKfZQFY8mDUaLaMXKY5hLdHy5lRB6
         mis102sWvF2p9v8hzbN480v1iippnP8kX2ExEe9pawmnJpxHrHjzmjT028gqEiKJeKsC
         ENYg==
X-Forwarded-Encrypted: i=1; AFNElJ9x1WFzOxTvTvkbbgEKX/fxT7lYF0nuVl1r/b8vswBQgCUp+T6K4ezpU9/txdy76+bTHjg4Euq/pMqNiTKjxear3+Bn@vger.kernel.org
X-Gm-Message-State: AOJu0YyBb1IBcbNcUXm6A6sM0ia7Z7/PbF9ZCu9ZhrVZhSH5ocEjGYLE
	GYnAQ0Wkee5CXDTDdisCAnG9tFYNnIJAFDNZOZPJugo1m7G0eo3gkvi+FZ/LbKVtadxDc6OI21p
	9hNkJeAdPdkolfcgfefU2nHku9LU8kHdlbKddP3KYps6i5f+9YBv0IEQBIQFxTb2njt4GaoR4iw
	9u
X-Gm-Gg: AfdE7cne8oiFPjdKqVtwpMtKAZuXiWIk2hSdcKqzuypRS5H54lvQHiIudoIWlumbQaZ
	ZDw9ytZCesbwzMO1gX8wveZDR2GjeHErMElOpSVMU+q/YqDD8xVgSs6BJKjm9jthuKf8GDqeHLX
	6V7P1KXBVmAJ+DXKiB+PFpP0Vk+ic/h6aHHp3GKt+5vEfYbBZ5oXBNGVatFQDjWKJr1kvYgw13r
	TMNWR59zaIhiCgl50LMqmrhXS6ebmoT14oeq3sJDUnx/VSzPXvI4gCSU92HLdQsWOl1/NC892H3
	ihjVy29npy6decz1myKyvDbYUce2MiqrKuGbiVfavPcEQ9AdMK3v0qO36EOX7BhiNdtSPHW84CU
	lWK3MvHCSnvivJZXvHSS1iuNfBJjuEOkCwP0=
X-Received: by 2002:a05:622a:50d:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51a8c9c830fmr85186911cf.11.1782721616929;
        Mon, 29 Jun 2026 01:26:56 -0700 (PDT)
X-Received: by 2002:a05:622a:50d:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51a8c9c830fmr85186741cf.11.1782721616546;
        Mon, 29 Jun 2026 01:26:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c124e79af45sm234316866b.25.2026.06.29.01.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:26:55 -0700 (PDT)
Message-ID: <2efc0f6b-3dd6-4267-b587-88c638f02be6@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:26:52 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
 <akEj6XEByCOkuJaY@venus> <faebd355-a9f4-4360-b123-87103ac512e8@roeck-us.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <faebd355-a9f4-4360-b123-87103ac512e8@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2NiBTYWx0ZWRfX+4wYKSp8DPXe
 txflaHQaAS/9PzBTn8YXnMipj5/Oa2/7YQKgthyXYXlA81Seffnwun4h6N4lCKxeX8y6cvQtpEc
 grwTLvYvSK8HLs7Sj2iKmU1dl3bgLjk=
X-Proofpoint-ORIG-GUID: 9PKoE50i4URufvP0rOTtQdq83U0ZigRb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2NiBTYWx0ZWRfX73sT/u0YFbLy
 DC574vtf4cpR6axtLXD7QMvLVDJ/lajIZc4wrnPLLlV62pMKAObnfp+ugCG/dd5qxVuZwW1aoOd
 SE0rfP4cO+OtIakdsWpeAqsb0qxzMfuGpc7pDyS86rLs1rbhLwyLqG4v6Sz/e1q9uW91QlLwXnx
 CbjjueHyrweRg+Apve0NXpXTW0qdb06CGlQCOPAxRgmg+S4edR/sINK3Q8fitRTyBbQ6SCqTKBI
 Mu1/leWwLs1QgTVBTviZc6o7GLeXKdc+uwZOtKbFIkOOzS6fKfzux0JWoJmxsv3QCzJC/8mh4g7
 SoAzy7sy3ejVm9No27piaWvG76bEHjzacrzYXh477NiNFNp0CVvCh/+0cr5SmMwE8K3+OlaaWy9
 77bX61+q6FiPfD4MtaDRWXOz+JyWuFafAhzr86oLKrMFW4Nk/d7+Y8meSg9ANT+HhDe7HuBHBPN
 95HNKBqLp3PxK0ZLnjw==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a422c52 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zEmzfJwlJ8pfclmQ7WMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 9PKoE50i4URufvP0rOTtQdq83U0ZigRb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290066

On 6/28/26 4:02 PM, Guenter Roeck wrote:
> On 6/28/26 06:50, Sebastian Reichel wrote:
>> Hi,
>>
>> On Wed, Jun 24, 2026 at 11:08:23PM +0200, Daniel Lezcano wrote:
>>> Expose the Lenovo ThinkPad T14s EC environmental sensors through
>>> the hwmon subsystem.
>>>
>>> The driver now registers a hwmon device providing access to six EC
>>> temperature sensors corresponding to the SoC, keyboard area, base
>>> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
>>> are exported to allow user space to identify each measurement.
>>>
>>> Additionally, expose the system fan speed by reading the fan RPM
>>> registers from the embedded controller.
>>>
>>> This allows standard monitoring tools such as lm-sensors to report
>>> platform temperatures and fan speed.
>>>
>>> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
>>> ---
>>
>> I gave this a try and for me the fan data is always 65535 (i.e. -1):
>>
>> $ cat /sys/class/hwmon/hwmon66/{name,fan1_input}
>> t14s_ec
>> 65535
>>
>> This is with the fan running:
>>
>> $ cat /sys/class/hwmon/hwmon57/{name,fan1_input}
>> fan-controller
>> 2564
>>
> 
> Not really my concern, but those names really add zero value,
> and I would argue that they do not "allow user space to identify
> each measurement".
> 
> Also, do you really have 66 hwmon devices on those systems ?
> Seems unusual.

There's a couple dozen thermal sensors on the SoC and each one is
registered with a thermal zone, plus a couple here and there for
other onboard peripherals (PMICs and whatnot)

Konrad
