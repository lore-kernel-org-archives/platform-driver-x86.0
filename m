Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231DE171AF
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Jul 2026 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999327; cv=none; b=bEnw9kbUKKoGxgGQQHoJYHZGu9xU3I0VJhe20hInK5Ah3bAVlrtdnbPdvFhoWGbd3RJEu860H4w+c8HuKlAzAEh3pPSmL7EOy+15fT57oFk892Kwe91cPaAWUhU4zPn3xgYAFoAg0Nu8yOnf9eNHllALjC2Sa2dFW3ZqNhMuzx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999327; c=relaxed/simple;
	bh=E1/9DIDIMVTroh6AZSTdy0KhiA6AI5YzqTm9giWRgZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gOx3YXut4Iu5LlmEtLp6Lp7fje+o26O/lMcjZNaItsNQxk0elHNklvVWKJMZClklE9cktB+80u5ftNTKY+mmy5n4TjqnLImCEuTgU1IzSA80227NR2OC+pMWNyPO8F0QfGHe7doYvu/MIMoNcAPbnWYgr0hh2ZrImtY29Tuu+H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4VR7ffB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMsWFrj3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4VR7ffB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMsWFrj3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662D0Vam416340
	for <platform-driver-x86@vger.kernel.org>; Thu, 2 Jul 2026 13:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iP2L90DYVRpyRK2MWL9L9i4kUeULtc7huFI/8WNOEOU=; b=X4VR7ffBpKxKPjAV
	GAgRko8DSXI4y62ewp/0IhUfj/Yvv6lsC8NLfTDi8rf7PAqyoUnqgtL8IpQpbGF5
	heHLgxa7V37vo+/RfGsoF+choyY4DWvUK3evZ+KSO3pLOvyziTpRiMAuvcLzA7/x
	X02PzURiKbChtswGdXkxMJnmOx0qE0rY5AVxklDJQmVdFGbrEmdPw4U11URLWkB0
	+gk5utfZanMaK9xEcxoyPJYbAF0HbV44bbL6v9ViZrJ9FJTOC+WbR7nQ1o8SVbSl
	tMqreavqMJq55igFmCbwuAvkYfEY6oMo0ifFAyRyXCP1LKtniX7nM/Uc0vOAE63/
	BdY1XQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n940yu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jul 2026 13:35:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91ed0e140c5so383971685a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jul 2026 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782999324; x=1783604124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iP2L90DYVRpyRK2MWL9L9i4kUeULtc7huFI/8WNOEOU=;
        b=EMsWFrj3i0JcZ0hs3z+3/zxo0co42g5COc1dGKSdR7YGuJicZ7iWEb6v1nwJBDAibI
         P+W+HLEEsxoBDUSx6Wmw6zOGJdcLzhYEgH+HFLUJyvH+amR10hF7Y13awXk8a8+y8Y2Q
         venSReUDCG04u5f9q+Cxek+9Uh6ckt13Kt+cjByYjCcO9LEW1xb8g5l3SGHRR07IqgQV
         xHKO/5myr5d3zN6QEb3nBNsbIqIJbGqV7G+CrGlDnyqGJkof2e+x1rLHMy+CdpWZNs0V
         9rrqWRdXBxTthwrKz/D4Bao1z99x4RLZpc+Rib8DuYs0lUaRbCspRKI+39hKgUj9NR5K
         p9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782999324; x=1783604124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iP2L90DYVRpyRK2MWL9L9i4kUeULtc7huFI/8WNOEOU=;
        b=VxOWS4oyh2orwDxxs4i2Zsia7jcEsajgE6Qqc/AAoESsy0W5vpsCVzgVi8liTbH6lE
         RDWbAsuVcS32lDVBCROFt/12kve1cR9KzuMLYAwi0TujDu0EfXeGX/I0P9/5zK6s63G3
         DBG3z1cCgn8MCFUoHNgeWDubMUiMKo9vML0zcP7mKsWIAy5y5ORPwuR2+tMid51ckIYQ
         5r4x7Ina+zygl0ApiYFQ+NxLIiWFzusOYJu3vYietcq3FCtw+44MxFHWVOgM/8x3Mzr/
         /HWqQuA/Sfd9ySkvc39CYivoONIjhBLf5aI07OozAFq/koo+s6dH1YZ+ZlqSKuO+geqo
         qR0A==
X-Forwarded-Encrypted: i=1; AFNElJ88kvPsnraYfOhkyymB9lA1F4l066i+vPuuSNPUztcOPg3ct9KhH0LkG8U+FQxrmpfXwDrMOxXo7DadALCyHxMNfT+K@vger.kernel.org
X-Gm-Message-State: AOJu0YyJs+PYdh2R29jDfER6135y6QklH2wMDdHxp73bJGOsFj1JX+8Z
	6sUHb+IkRluWcuP8qbb5HhumWaJ0cJuEC0bljfQg7Bfb+7N/u5vn0lrKeYM96HVEWkRPqzRR3kO
	k8zGo5MwGLUk6jJ2LyiYDWAFqV7XPinYNj579tcW5YySAGtw9rWR6wcY9U7Tx8De/DD8Vnot0mm
	kD
X-Gm-Gg: AfdE7cnEQAeuyPyuFanxhCKWg1ZclImtlzJGjPA7UVqt7npE+0bcwdbUX4bJFeBtBlv
	MpXn6go4s0bF1ChD1Q7mpoL0iRHuqWsrKvN9weZPL/ehOwEMceL+r1fUyvG94+yGSC/0OuKV3i3
	ND743GRqjHlhZxuVvD1mxbvQh89aBF1QS8KIZSV/yJ5veiNR8iFax22clngXc7TWHqWXTPAdsdv
	TP9bTrTPAwwFqiVPdoACPZu/QoJX29At4R2IA6tE4MgFdyxBOE7H1+/h07OOUS/qGBdj1qPQEbe
	qNexre/QSbEaKxkMQ58h9zSjJJndr7hHvoyQ8AfGUq1MeK8i/24bHF6uA1/g5oOFsfRq7sDHopa
	5cCCscdstJeWZFryZzngtuW+2iQBrY8MFlk8avnIFv48irD97ly+T3G2NtJim5Vp+jMWARpJmjw
	==
X-Received: by 2002:a05:620a:2a12:b0:91c:d0b6:13f5 with SMTP id af79cd13be357-92e782408a0mr785682285a.19.1782999324261;
        Thu, 02 Jul 2026 06:35:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2a12:b0:91c:d0b6:13f5 with SMTP id af79cd13be357-92e782408a0mr785670185a.19.1782999323377;
        Thu, 02 Jul 2026 06:35:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c635c41dsm95373005e9.5.2026.07.02.06.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 06:35:22 -0700 (PDT)
Message-ID: <2b51d68d-9f13-4b21-a0cd-32b78ceb5755@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:35:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
 <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
 <6bcfcd62-d831-4262-9ce9-66e12a72b3f2@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <6bcfcd62-d831-4262-9ce9-66e12a72b3f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0MiBTYWx0ZWRfX8s/xKYfbVeNB
 nPnVeHXdjaudyLYk2wIArEzbxfQmnF0iE7kvupG+mcjf57/g0qbWgI3MNtaqlsARIOUvJ6fjtEZ
 j9WE5bjbEz1CWfsXw5ND6dNGkgG3JD0ak93eONluiZw1I+vpsNOzmiYgZpVS4C+y31SM8zr0k8w
 FOzotYp/9hajOupDQ4ABe7oCG//rqDsO6qap9ZkNcYsPY+mOZvAE23d2g8WrI8qaRoI64AsC7Up
 /40XZ7gydd3K7QLud+2sOjdt1CztVKgIjWkc5TMDf7Chy9ijUNMVQDCYAYaQUS1oUc9dr+8Ueeb
 ytV3XiKZaWXsc8rn7knS+9dPlnPOjXa3FA5fIT1nKPg4NryzVTKIuUI2phLE3mETFqPRd2FNk2M
 aZNPVc1h6xogguHuVvdMbb783G3UXLdrh4Fkd/nlt8y+YlDhIYVMWdWdDPz2ni7lwKeYRgwy6ok
 po5y/37afGptdbv5KEQ==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a46691d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3fF9mxJG-zv1VSP5w2IA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: CAMMoqSgq19APF5BArSUmw00eclFaaI3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0MiBTYWx0ZWRfX6BveW4xwM05Q
 zm+qDcN/Tw/DPoBnj4NT4haMqJPHrUjS99wNDY2aYMIvRa227jhg9zTDZqJyjRlkJTDPmf2plvx
 /W9+L9QzqeoOMCM1/8ZlpZYuhXUSujs=
X-Proofpoint-GUID: CAMMoqSgq19APF5BArSUmw00eclFaaI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020142

On 7/2/26 14:17, Konrad Dybcio wrote:
> On 7/1/26 12:37 PM, Daniel Lezcano wrote:
>> The Lenovo ThinkPad T14s embedded controller exposes several platform
>> temperature sensors that are already used by the firmware for thermal
>> management.
>>
>> Expose the EC as a thermal sensor provider and describe the keyboard
>> skin and charging circuitry sensors as thermal zones in the device
>> tree.
> 
> [...]
> 
>> +&thermal_zones {
>> +	ec-keyboard-thermal {
>> +		polling-delay = <5000>;
>> +		polling-delay-passive = <1000>;
>> +
>> +		thermal-sensors = <&ec 1>;
> 
> Do you think it'd be worth to add dt-bindings defines to avoid raw
> numbers here?

No it is not worth. Usually we put raw numbers and they are untouched.

> [...]
> 
>> +		cooling-maps {
>> +			map0 {
>> +				trip = <&ec_charging_psv0>;
>> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +			};
>> +		};
>> +
>> +	};
> 
> Stray \n above
> 
> Otherwise:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for your review
