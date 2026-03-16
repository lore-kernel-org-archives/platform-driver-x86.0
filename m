Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6193D3D1C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681652; cv=none; b=Yza7swhCwrRFzvFxoetze5viCQU60pXCsx7CLfzGBsqspC/JcZXYKNYV1Wiw0+ZWTEJoXBWpqbdhBD9MVLoHKvA9zfL93VZubKCx/l0x1ImjrYiTIzivgQ2pCukiBb450+qhtMjZNKm3ruxPanEkscUEGY9QSk30ybcl8eplrfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681652; c=relaxed/simple;
	bh=kJRbHz/Kmj9/f+jsu2tmX0LBtNG5gMiZTjc2ERT1T9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtsM90s6+jzy6vcVJ0CyRaPbJ/xE2TmnONnU//CO/ICPAHsetzIw5WDAM6L8QRe2IUfObafrLfxSkcwxD5oRA3SggsbnlKQnikq2mbv1/7A4zEn092S/jydRZwUkAcZCozGxw8YNGWUaV1d5XF7F6N1Wy3zXE9ZR8sjicNU4jPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbePiy9k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHMeWSBd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbePiy9k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHMeWSBd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GDdtpm041587
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 17:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cVkiGJfb/hoYluJEhR6stCXpGS4CRK7PiadcKeGt7G8=; b=FbePiy9kJj9lOHrF
	XcW+/dz07xoPL/25KQtRiv41mhMvFbJ09Re4cNaR3ZlzE9wrpaXlOW+EpKs3Q8Yx
	PnvDp3FYknD0a9yXOrOEDFRyRWWcoTnmq1z10M1bRDmH5XrBoQ/8Ew5K5XYB+U4M
	FHaMBlyJaxB4J0VdqwD+CGY4VlQI1MoWUm6ov6yrOSOa0jJMt1SjzhlRw/hA659g
	FJz+diGbW14C2T00EezGx89qB2zdzeCD/6y7pe1QiGN5vptGWQZIEtm9Adh7sWNR
	i5uvKk3/9zb6t7hzCxHe33sf8QQkcGSaz22G6bpx+dcWmM6Ed1orcJWRQz45igde
	kmPakQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt8274s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 17:20:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b051befbb8so20446675ad.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681649; x=1774286449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cVkiGJfb/hoYluJEhR6stCXpGS4CRK7PiadcKeGt7G8=;
        b=jHMeWSBdTLP31RtozC23s0KyMmQ8EtO5art9qM0SpgBPKhXoZ/sCRHMGtSR6WAPLCr
         fqj8k9Yny/Gs+oHu3p+RI1N1wmk7u6Xb0b7r4ga2KD4KgZKc1jrnNxsrTamu8lNmULxu
         /UYmN3MWnCAgqiHI9DxdkE3DTGHyh5AiugI1kcwf149HXOheO+5JHXX5zwf6BeHzIsod
         qG24mScsn2BnWUtwJzWC/mumpRqw7L3YIEBjnTI/y7hoq/wBKow9zlL2gwvZDXkIoZU2
         A64Oycd1HNgCQ5ox+hvrnmJcQ7/ILEGcipdnnlkMC7QUikrkvOiSmpp/iucXER4ILLHE
         b3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681650; x=1774286450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVkiGJfb/hoYluJEhR6stCXpGS4CRK7PiadcKeGt7G8=;
        b=FdsYpmmhvZhNtr8h83KiPUGE+7i0T6J28Gl8GyVV8axhG1+BCMQk5mOVnYY9L5gnhx
         6ROYNllpUj3YNY4FCMYPGyPjHAsn4b6i3+fWWe4z98nq/Vq02E1W5/StaSswFoegqHoJ
         yy0CoUHqGtfdDteMwWrhLmE1GyiRlikUzc471egCIhl9lsL2kd18V0d8NXFGAZuu1t1A
         Ot7S1Bouft3weuq2QR7wFbk2fSV1zn0BM42xxPwToGLznIy2dRypktUKt0Ct/yWEPHTB
         UDGFxSTGva25sM9dKuqZV1enEGvH5Hm1o0ex5InxrFEaSIwb/WMgKRfPcW5OG3AFSRMA
         hPPg==
X-Forwarded-Encrypted: i=1; AJvYcCVyDagrxBQCjOj75f2iGHcGlXW+JKHRF3MWkZ8F50n6ev8ecIXuVSD9xzppQpEVYM7qsRAJ3g5dLJlUDinKnJOBhL9d@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo08VjFcU8dt9nv1b5SRvyZB2tjHsC8W1QyRPddqpqpa22e/pQ
	J2inioff6EiEspq5M5vfoyjb5i+fja2AT2oM8xxbBXQgtt6/NliWLhD1kRanQP7k+PqHY2T/Vqa
	+3p8cTimBmCGIJSKRwllDIXtSjQ2+X5t3PQK6UFHiqpW8js0/Qqe9FczNpL1tfKIPWxEXdoRqpR
	mE
X-Gm-Gg: ATEYQzxvRg467U9HK5coC4LedsqI8R/f8xGawpqtWbwhHe5vt0UtDkETPNrQYkGVRoV
	IdBlfHiS2KGW/icwqNIvIEeK5atBx3ffCc3Uycy3VN3yaszcBdvFx0RLX/Z7iniT+HDlVFLBw1r
	dPAYhVf5ir6j0BmZXfHmGb+xJ4DtzDFqRa7FDdINj+iOXWR6VdRBotkMEhoHnastSCN1mtABo/U
	KV4Oc2kT7+D8DOXH9rE2KdewS+/tVAzBzz7l43LSQVcm+zgir0JTnEphHZ4elsocxFcMOWCOe9+
	odV6SeOYhlStKzGldATRm3gG0StwmRCApKorZ0VXt9JrLJpm0MgvVXs/9Ytwcnarbky9Plqdi8p
	z7VnzbJLD+0wg7kjTTj2kEDvQnlH/2CY0hpXl6SdEwg==
X-Received: by 2002:a17:902:ea09:b0:2b0:4ec8:fb92 with SMTP id d9443c01a7336-2b04ec9004emr69176295ad.39.1773681649576;
        Mon, 16 Mar 2026 10:20:49 -0700 (PDT)
X-Received: by 2002:a17:902:ea09:b0:2b0:4ec8:fb92 with SMTP id d9443c01a7336-2b04ec9004emr69175985ad.39.1773681649093;
        Mon, 16 Mar 2026 10:20:49 -0700 (PDT)
Received: from [192.168.1.8] ([101.0.62.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee6c6sm116230535ad.48.2026.03.16.10.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 10:20:48 -0700 (PDT)
Message-ID: <5bd9b257-40dc-4ed4-88f7-b15b934fefa0@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 22:50:42 +0530
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
 <aaf2c23c-2c6b-45e1-a2a0-096249ea0d44@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <aaf2c23c-2c6b-45e1-a2a0-096249ea0d44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KGjoaepczoNFkONoNHNtra9RgzfPVMrf
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b83bf2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=+2ldRcY3HLWus9HqRSG52w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8WFAAEkrk-lUUCZj-DcA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: KGjoaepczoNFkONoNHNtra9RgzfPVMrf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzNCBTYWx0ZWRfX41D7hLhS6PxH
 aEugoJtMR2Zn2dmIVdBcPiLQfq3mMyHXM4jZPDr4q7blOckM6wCk4lL9hQM3oDK3srnDqmVLSqi
 esm/dNqOyWVG3Rm9YTH+1cAqY3wOAm6uPYKZ5Q1Gho66S9Az5g5C//JZAvUh1E5BKC9+FGiSvPL
 zJ1pPlbpwJYafFbYdbgovqot4dB5E5+kRsHfIVaTrZGaU1CiCQLTAF8TfyDsnKWC3hXUVK29W9I
 xL5dLLGw4VuppqdtMbg+CSUUp8kgzB//Ndr4pVO2x9FwNyjj6hj/d5K7km1UTyH5nyod4p9uJYv
 26vAhYfH8CyL3lvNo9dsOh9U4ArXygefouUK/IRRtIIx2kEcEgQyS5Uz6qGsT09YMNh0QhfsoaJ
 tsjs05KyZ1A4MoNI0vsExrZNFcOcc5/i3dASSkld4o58yLfq99qtt9BXjrD9KfoYNCUXQnguf0g
 8RO7dRO2rAmNWa1OxBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160134



On 3/16/2026 3:59 PM, Konrad Dybcio wrote:
>> + * | Offset		| Name		| Description				|
>> + * ------------------------------------------------------------------------------
>> + * | 0x00		| Byte count	| Number of bytes in response		|
>> + * |			|		| (exluding byte count)			|
>> + * ------------------------------------------------------------------------------
>> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
> qcom_ec_fan_debug_mode_off() documentation only mentions values 1/2
> to be correct - is that the case?
> 

Yes, qcom_ec_fan_debug_mode_off() will only support values 1/2. The
above documentation mentions about number of fans available, max being 2.

>> + * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
> What types are there? CPU/AUX or similar?
> 

This is fan vendor identification byte. 0 being invalid/not present.

-- 
Best Regards,
Anvesh

