Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BE43750CB
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742092; cv=none; b=H2cyI/nlSDuIjFto52PVrOLBl7pa75D+ebn0zmaYje+YYEt+lLY5Rxnu3Fw27w6LldZP6LG/dRMgSipZ8arH6Lr2ai7haxhxL8WJg1IYt1Aqw8zIHwI9aMK6DXjx38v/HjV5ScPXusdDhUVxZdpsJHd7TEix1m2sjZmBdmfuVJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742092; c=relaxed/simple;
	bh=dURMrnEE+8FNs3YuqCUX3g5zorhiCWR/1suAQkUacBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/7aRNmuzWe69dZGJh/8YhQ7jnnJdhL50BUYSeclu2mytyPyO6n+6ShLtnMcyOBVV4HRBwuZ5p8bgUeJS7G/jmVlNyqPf5Xq4TzC6toR6xiUdqbq5bZOtCAR3lZ713MDeoLu0pW+avWsWQBVfPYDBpsFFWvgIn5WEBP4chuCItA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGAf+QEB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8ZqI4hL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGAf+QEB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8ZqI4hL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATS8a2592837
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 14:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29BbeCyRbqbccdqjchaSDPUWm7nWe/b0cApw/MAp8LI=; b=mGAf+QEB/iir+kCh
	P3E5qXLKQFPxq+r4EGx8J9emeMdynqNE2UsDG6rqIYtivg7o4773EPFkD0gxpU7G
	6sTK+8uUUaV3Ygy6qCZtPz4rBnMTRJnoD0evLk5zGY20YA3xy66z0+dz57N/OPka
	Zkbsr74mf5JSjjo3+k/YSoQt2YHdQBuLXN+xnydoU9wfe4cnXd6r07SK5Lu1da7p
	DvdQxODAGB40uSIltSiCRgRD0+mza3ua+62dbeCzZJXP/vQO221WBBWCZxnhOZEx
	SLuEXEP575Q7Ud9SnWpDjPtSGuYkgMmFOwnPWhQ2ZTaL8aDnxHJBwicEzP95/vGs
	n08y2Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vj0pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 14:08:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88fc985a65so1631401a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 07:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742087; x=1783346887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=29BbeCyRbqbccdqjchaSDPUWm7nWe/b0cApw/MAp8LI=;
        b=L8ZqI4hLvIcV7bdg22E7D/94d2ar2yap+6ueBJcn4S7xtS8Bf2w72sdLsXLkR94yJ5
         HUm02J8/ed6YmZs9Ac9ME8H9MMg9/nsDUfEhIWx7PUA/rcq0e0d8lI4r9AFKN0uXBjyK
         D7dQRKfdR5KArqa5hnooAp4O7v0LyUQHboUh7pbmSJExuByf6tUsgnrVCjcbcoBM0EdM
         X8mNTIWjMG5++RKVWoyXmWcYiLCVFfGn8qln4FegsSme1jy70I0q0dRe3RtPpxIOq6Jp
         ab8+15DTtv9m3QD1KkVmA6aOc0HC3yNyYK1J8Miv9xw6T3VwvRrF53R0UyATMLEBTNDg
         jMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742087; x=1783346887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29BbeCyRbqbccdqjchaSDPUWm7nWe/b0cApw/MAp8LI=;
        b=kRuSI/PPwcQGykPkLllKMiVKUieRLML+Sdc5qr1mTdBoxtfvKg+20DFt28t8sA9izH
         3AN94uYvjEQC1c8n686L7zZtngP4W2Jyq3dsQCKhSUuKiPj45Hkw/01/X+SmMYXW/dWM
         U4COsDd9UIF2CrdMOhkWBXI7zjX0hsKWgAHsgH4Ka/AAGxhFqpZxlELlxsogHMznI1Ip
         MtMmr8tPT3RfRMsG+njxpM/jDtWebUc19kL8TJY5y22sVE3eu2Q4b2mJwHP208z9jJ+/
         aNjXXC36kuhfOIwET3qzIGVExM+ccMJBXremMZmtpRLOYfqUumljoCZT7mWCbzPrDHF+
         P9kQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjPU7GtnB1rer7prpp//8o6wuRgi16rPH4GGj9cuOTi9XV8HiRKJxxCvEtMQRzlmpoSiXPPHuwzCB2Eg3pFh1TiUCa@vger.kernel.org
X-Gm-Message-State: AOJu0YyD477Zjd8Iy8v0XWVuN3WNMjIny9GUw0HjxjVC2jLUQvZ6VQxl
	2AIlAGaqUw8qRJ+ElJJG/YVQmTzabS8Gqwng7NqTskIC3dpeeOGMpfJ8VSOLK7n1irchQGra1Je
	nNJkKQXYoCjNIBXYmhf3gWUDlu8cvl5Ma/NYZy1NoSB3qIRQrolQuXBOuUpJvTUaV7x+ct3S48d
	Pl
X-Gm-Gg: AfdE7cmdow1XjH20FSZ5X2wJ0ic+ZPqMg+mHxj8IZ7mqE7J3Rjh50xcaOea9eIMEWr7
	5HRYwIzZDuz2JmFG6RJWJHJzKy5tnhY7RswTih+MoxmtYpdiJPB5DSEdIpRPK/A/PA95PgItu37
	0Pmp+IkrZc8MCN9IsKjvbJK1VlM66dK7aBS8Po8EU5CKO3ug5tRuID3CCj1owgbwX/7z00yNaVa
	w7bZduVC+dWiGn2/iJxjcL+XIcPcrIMHaaSAYppn7SEWSav+e8wuxlNLU/gXNeV2bftpuROZlm6
	egdq++KH7sc3uIV2jFiJe4V+bSIsIeV6yOZq44eiq4GkaSjR3ZY4Ksi2sZaN20HDuf0xvBkD9JG
	JSLy2kqvxCiyisRLrroURotnKKQwfVGBbHp5xKOrKbprFC6EdPcZNEAHnloT3Dnq0WGFDqRFlIw
	==
X-Received: by 2002:a17:90a:d007:b0:36d:8e49:d8 with SMTP id 98e67ed59e1d1-37dfa1cf815mr13778698a91.15.1782742087295;
        Mon, 29 Jun 2026 07:08:07 -0700 (PDT)
X-Received: by 2002:a17:90a:d007:b0:36d:8e49:d8 with SMTP id 98e67ed59e1d1-37dfa1cf815mr13778685a91.15.1782742086832;
        Mon, 29 Jun 2026 07:08:06 -0700 (PDT)
Received: from ?IPV6:2401:4900:1f29:f628:449f:9d99:35eb:4741? ([2401:4900:1f29:f628:449f:9d99:35eb:4741])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3b657b3sm9224552a91.15.2026.06.29.07.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:08:06 -0700 (PDT)
Message-ID: <767b5d6a-ed4c-4cd3-bcbf-44c4f24325af@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 19:38:00 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: Register cooling devices
 with their name
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede
 <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629-fix_cooling_device_register-v1-1-c6e518b0bbd4@oss.qualcomm.com>
 <b0d0c7ff-fe41-47d9-bd53-89b111823c2c@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <b0d0c7ff-fe41-47d9-bd53-89b111823c2c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _Zf0hNCp22ndUwzjIQUyTnk88meVASIo
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a427c48 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=sTVR4Ors8kAh6zT4N6oA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExNyBTYWx0ZWRfX4CDfJ7Pp0W9j
 9y2aSXxGq1kStsehOu8aSHN/xEIbL047HVSnLLIsT2UQL4G1pINYqBXhOUa1d0sAvpWnk2qKlU/
 hWlsU3vgHupOVFigUhdIwgesdMXovLc=
X-Proofpoint-ORIG-GUID: _Zf0hNCp22ndUwzjIQUyTnk88meVASIo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExNyBTYWx0ZWRfX4Lo0R/rsAhgf
 k5vpxlPADBQU3UZCNQwYOLUgkW8/7grcqfsoLX0VX+r+lHktQmRC27lbw8pYV157vv5slOhdU3b
 ypUqYg3003MSa8tnjdbfqplZJRE9XarbNGXaebmeXJkaMEsxun4hChXfvyQi+MTk/AuT8I2f+kj
 6D+cRCD1LaT9FzldzRHjGSrzsqnon//6ymOhS5CNgxGiaepEDINDyC2INEoM+thmTrzrgDOg8pO
 9XYp7KUTTPCcFLsvaCQ3ucF2mjd9UVn7xlrqH+htis2uU1KD7YKbbrH5EUtN1y6wFKMt5n118x7
 0iybksh1yHhMHPQ630TEOu8Ku0eTxcuzh0d7U4rFORHlBBFhs+ITXvioI0MEuPaLjiTNa2rRnct
 mAL+xP4KsLyRUGa1Z6qrFMZF3k+FuLF+pnNs1DuNl+oHp8vMpJM4aLD0bfQ6eFcYmJ6Tyk/BzNT
 sN0+Lf6uuJJ6Szz53/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290117



On 6/29/2026 4:51 PM, Konrad Dybcio wrote:
> On 6/29/26 11:16 AM, Anvesh Jain P wrote:
>> Each fan is registered as a thermal cooling device using
>> devm_thermal_of_cooling_device_register(). When the thermal core gained
>> cooling device ID support, the helper's prototype changed: its second
>> argument became a 'u32 cdev_id' and its third a 'const char *type',
>> replacing the previous 'struct device_node *np'.
>>
>> The resulting semantic conflict between the EC driver and the reworked
>> thermal helper was resolved while merging the drivers-x86 tree into
>> linux-next by passing NULL as the 'type' argument, dropping the per-fan
>> 'name' string. As a result every fan is registered as a cooling device
>> with an empty name.
>>
>> Pass 'name' as the 'type' argument so the cooling devices are registered
>> with their intended "qcom_ec_fan_<n>" names.
>>
>> Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/platform/arm64/qcom-hamoa-ec.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index 45829f2786b7..12196d56b60e 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -391,7 +391,7 @@ static int qcom_ec_probe(struct i2c_client *client)
>>  		ec_cdev->fan_id = i + 1;
>>  		ec_cdev->parent_dev = dev;
>>  
>> -		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, NULL, ec_cdev,
> 
> This seems to have been altered to use:
> 
> devm_thermal_of_child_cooling_device_register()
> 
> apparently as part of:
> 
> f31c00c377cc ("Merge tag 'platform-drivers-x86-v7.2-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86")
> 
> Konrad

You're right, thanks. That merge switched to
devm_thermal_of_child_cooling_device_register(dev, NULL, name, ...),
which already passes 'name'. The issue no longer exists in current
linux-next, so I'll drop this patch.

-- 
Best Regards,
Anvesh

