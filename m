Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264934;
	b=CFY1LbvQTnh434JzCaEAP30W+Q+VVxAFAi2LLAk5Og/e+2RGaBL7gu5ooDslqyuOO8tR
	 PLO0HJCzkAORmL3W3yio1aNzwY63scQv9YKzhgFjja1yHhU+ZO+g2U/8Vk0s4W0Qx/Vnq
	 pc3ksxYFntYoARbXINb2GX6YeeGQeZ3RBrze4k0FEfljjX/LP9ZAKjV2/dtYDbOrPa8Tz
	 lxz3OB1IYZwsO2MNovuUU8/noH0nfAtKIEd45IaQWYj4EEBTIJu5Lzcqlxp67+IcHjk1U
	 ic2E5FOEnaPugvscpdQmdvBRmqChHehnaKGr3kBte79GlEEVUVJjSpCqwvmay5IaNrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264934;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=;
	b=2ZI11ieJps7o1ncNrJWnl+HfIcBbVhADy7IDJZ6q+QYVctH/bVt7hxWcTZlWEZgbDANL
	 ZKyC/i2DtGEs0nW7I0/Ogg0APELAyQZv23hY6t4h5rTP19m4iAfFV3IfA0IEwJiGRc4Aw
	 VkEkpVPRY+6FnkNaVluICMOjdSpwRJKK99MU7q5qW0sJot4NOUDdPQXcF6yYq8rNjs+pF
	 5ht7uzWCC5Fz82Uv7Ne8s32Vn6ni9urltb/iTwhADz3akK13APgF86bdUyKLPdHA0+Dh5
	 FhIZtUHhs354mcFbeB02nYGkh6ZsynIPCUUJgBtiwdeSuNROZCVO/3x3jxHUZzZnyjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfLpqT4E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJcgHsMf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DB7606A31C
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 09:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3DB7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfLpqT4E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJcgHsMf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vtJ13279765
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 09:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=; b=JfLpqT4E2z86BnrD
	rpjh/O+SJAZqd2RuxnUSnwHWbjQpSzdsEuO4rPVslqU81GRZPwV9M67X2uP39che
	+8IUmRGwImPFC8500NMG4G+ETcSn8jeyvI+ik1W3QQF/4114r5wdglAahfyz8C0M
	6T4KMrfAjpvdgfT3FqGQA8hIvfW3SepexSfKwevJLbI/hZffAEq0fhmIjQgm/pte
	Y3Vg5idvHPghSVexB5SJsUkfvxUCeY2o1+sBe6sU/FzCo0ZFxazdzCWkG/gLGTNh
	HWbKyMuTkhJ3DUZl9RU71C5MLG7qa+5ndmdGBhCQ1SUVFg2TuKKl7yhJHeZ5Q5Y/
	HMPe1Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3na81n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 09:08:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so1459355a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 02:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264932; x=1793869732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=;
        b=CJcgHsMf5EX6+gI2yDqQ861uOiP6ReCSiXGlMgLjNq+thhc9dM9PdWlwPvLWTh5SRN
         HJPE7pUOibNEYXiybfcauozltWvvZqdhWnJLzMGKRltCSU6o0fpBVcFa+bCybTjePyvR
         CNc1GQCw3gzMGaau/w7yBv398MuDrgrzgbW51bWm5UR5SbBk6sAoPlEtAZtkIRNEf9cn
         vOozfeGJKTrMRKKMp5gTUlfuZrbBujdAZ1dj02GJOzlRaHnJWT/1mnhjBQg46abLrA/Y
         aBKhKGaEI681+3hSWQuIKvifKMws0+flrcp8VBNgW8GN2c/mWQiOlm5Zog8XhhqrTnDZ
         lWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264932; x=1793869732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=;
        b=LUh27ra29lxJziaKtTy1octbeujzGF2zAflmIrg0YVMzxK19aIylqiAbVTubb1nEFQ
         zCyHyjZ6lEIgfqmfRXlZiVhJnPSz1LDqGjflDyqxTpPayA7gvJlCJbeZdKGvf7PNJ9GN
         bc1nkrwjm7PFxZEMNnCKA+qJ0vAMR/EM4pBGMP+PVKK9Jud4g+y1UCi6xjVcM9eg+Q5B
         7A4STNQMdJWJJsNiJ1RppJ9T2pfvE2AWJWXlJ8hshYWB0q7yWb1gwI9RHuU0MlDoZNsU
         7qVojXs18kX+BqdA0HhxHn3RE70xtjh4uw1F1tTkBP31YB0AMfj4HlOos0QKKsJuk0Xc
         eDew==
X-Forwarded-Encrypted: i=1; AKwUvByKDaIoWuCTenEcxAlblXHZuOT8FSl3mCR2PVYZZEvrxlsHyo9lGbY1MiWNvbe0O7xjf9wi/pRlvWvDS1erBkq3cRVO@vger.kernel.org
X-Gm-Message-State: AFq9FYKgZskrTWRL9BPo/TjEmkeU4EAfhuokVIriemNaCvZA04QU1Fh0
	8bcAa/TBMWkYB5Sp2tZVMtgijr6NAMJ9d9uhmHmuq9yeR1uz0BJdm+F4dHOb0fteV0glSFZtsat
	Mc7xAwAeAh0G1/+hBJOc/dMtcd0xHl+btetc9whq6B1xreGJyzASsVaTvZPV/7LUR0CpzyzUuuy
	5R
X-Gm-Gg: AYBFou031Zlh1W/5AMI9VDHpYkiv81kf8ziE/qg4vtVJvCfikk1tIr38xqvtVPNmzsQ
	ZhG/Uyp0YSFdpfg6VdQu90sLO+XVXW5lmhDVBXJa3qSePOOLI2DldhB8ZDP16cGBFvBgIm+zppG
	UM7Ugs9afT5cPb3MjjFg+dY52NPXJ99wTVQ/e1fN7or70Be7Ct7VF3z8Gje5HTPbNQv+J9Pvung
	8ePFLI3XemVVJG2tnVzbL2F/Tq25j2lo1pgYJIKyLiCGZ5yuPnXiXQojRpyOg8yj/y7gocv8gFF
	m7HfdUwKx2cZp5uKobVGlicvSprXXkFCdmHiQL6SALuE0Zn+MOgSCGrJM+Q1bNz/XXO/cADJ32M
	ACvwO+eunaDRNprrjGKu0dvh4+G+fODJ/MFo3eiaNiTRq8OJZHlQKClO/c2s+rKptITjFQRXlfg
	GwODrQZXoGPwBJVUznv9g4G+gEyiqFbwMxlz7Wy369Vco4Pv00/iGgcZaisNUS
X-Received: by 2002:a05:6a21:3405:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3e90235b9b0mr4036786637.38.1793264932310;
        Thu, 29 Oct 2026 02:08:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:3405:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3e90235b9b0mr4036765637.38.1793264931832;
        Thu, 29 Oct 2026 02:08:51 -0700 (PDT)
Received: from [10.79.116.57] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662e3a4sm2039697b3a.28.2026.10.29.02.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 02:08:50 -0700 (PDT)
Message-ID: <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:38:44 +0530
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nDgwCZ174T6ojmeeCJPodUgrIMh9YBDW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfX/DEjBVsp9dZb
 h4KXDT+EHb7EbxCIgfgyQxr6XGNWqNs8TRFWJF+wfwlo0qrSrnXVxVWlcmDycK8xoF4Ep5tdaBz
 zeeUclXXftqeVsw50Ob1ILVw5s6LT8N/hImM4IaZMhq2OCQxPmTmjN4iY4JzJZsybZLTatp5gQ7
 bLUAO9Dpmp8r/5i5yaEwK8RSQScp49z8tG3XId6esNs9Cx6x2VvJphh1CpyRPrc42BzvjZe/MTz
 ou9SpoquxQPTEUS1zAHMQwpri5M2br0662PrU/W+7ryZJeLjp3badXia2z/t48RywSdtDiHGLXD
 6VEeIyD3eDrLd9Xki0riJdGy70txZxNF4IH5i/KDQ1QVnVaI6KjERW+WdEwsP/H+oBNNrgtHEdS
 0Y9PIo+Lon99o32ICTr6FvQ8VZA4HHfSf0HwY0ti8zGdjxeTIziNmEn1/ebv6RgvODNRfePJ7KX
 QNkn7DnNQQd/CNu5Deg==
X-Proofpoint-GUID: nDgwCZ174T6ojmeeCJPodUgrIMh9YBDW
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae30d25 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HxamSshyuiQp_YgWtbEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfX3ILeB5uHuTwo
 x1CbV8kf5wkLUEvOJBvSvYtDL3ZwipD0pYpycYd+hMLB8EtJ4wvlN6IOSDNUsVz1ReKoWOBglJg
 dD6Z6US8PMSChFPwRvy5VJtfsEZiWF8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290035



On 10/20/2026 1:33 PM, Konrad Dybcio wrote:
>> Add support for back cover, keyboard, and SoC thermal zones through
>> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>>  1 file changed, 44 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> index e27c697e3170..571c98124a40 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> @@ -594,10 +594,12 @@ &i2c9 {
>>  
>>  	status = "okay";
>>  
>> -	embedded-controller@76 {
>> +	ec: embedded-controller@76 {
> "ec" is a super short label, perhaps let's spell out
> embedded_controller
>

Thanks for you review, I will rename the label to embedded_controller.
> [...]
> 
>> +&thermal_zones {
>> +	ec-back-cover {
>> +		polling-delay = <10000>;
>> +		thermal-sensors = <&ec 2>;
>> +
>> +		trips {
>> +			trip-point0 {
>> +				temperature = <90000>;
> This is *really* hot!
>

The 90°C trip value was suggested by thermal team(Manaf Meethalavalappu
Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>). We are open to using a
lower value if this is too high for the keyboard and back-cover sensors.
>> +				hysteresis = <5000>;
>> +				type = "hot";
>> +			};
>> +		};
>> +	};
>> +
>> +	ec-keyboard {
>> +		polling-delay = <10000>;
>> +		thermal-sensors = <&ec 1>;
>> +
>> +		trips {
>> +			trip-point0 {
>> +				temperature = <90000>;
> Likewise
> 
> Konrad

-- 
Best Regards,
Anvesh

