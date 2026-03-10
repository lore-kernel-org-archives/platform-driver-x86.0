Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5450432F770
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 09:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135953; cv=none; b=n2SF/OTtP0Gybz15+6gi445rV22BcTL8c/3YHBtgh7eqZQJ22tUqGEli+uhyxQj6RCe0R5nbT9+EXOYQEmVRUivOSEZ/1amGfK5nanFjWXM9jrAtnUoeOPJtuyktbvaDda60fCPcoFKuk8PFZKgU70thJhhDsupAn4Blr7WAS0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135953; c=relaxed/simple;
	bh=CDOso0q5SCjIEv4wQvivb1gotiV0w12En+/3NiA2naM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWd3Kzl5Voq5tvJenr4tqHM4DBO2lKYKc0wUhHtaeSk+j4pzp0owU2xzHSfNu7jVxLFg9rmMtNZMxKmPXiAP930jD9E/Zg3E2doAcrs68yQ5dcCDLIHNo9PVQOMtb314xqFi3MoaLRj2glpoNwku522BSnBwy+M+CL4vnvXn7dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPnrelKD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDurb6ah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPnrelKD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDurb6ah"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8xxtn246880
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 09:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQ8tLu1owIY8abuLsve4+gYZO3I2dEb/qJKESh2CSbk=; b=bPnrelKDJ/0dUPTv
	a120O8114pFXwIz/RTe0wYtI2rOLPVKIvmbh9W0cEDPUUdfHI6zRU16Wc29dpiVZ
	t6HSvRQqw01PgjXVR8iR7MoHGaHVD4oJ1lehbcSng080VkfgEw1Oa3WH6DcJd67f
	uUmsHIKWWPaD6tUbHsztKdJNDLjNblDwK76uqLdOQVp1Mg2OG+8BuJ8hetzZw/55
	R/yIOk4aPq5wbWUoQvu5q7ixaI3JMqJJ3Ov/V6Yh6LprqL9sC2fAxv/6e0BGpk+v
	sTKdk+s/pnmt5m0WidfRNnnPHuLEKI9epyr+0+POz+a6tvucFtNCQTaXxFM7xQTE
	1khO0Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8801uap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 09:45:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd90210336so63005285a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 02:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773135948; x=1773740748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQ8tLu1owIY8abuLsve4+gYZO3I2dEb/qJKESh2CSbk=;
        b=cDurb6ah9v8QL8xU8e2Z8MLEYGbkaKa4qanOZFWGQV27pUnMAaY90Gfyw5kADf8aA+
         ics+1Dfgk0fexfot5gYvn6DKp66ANjAfZRfrovRGPLTgfCbvhyE8M9RHUyNjYW/lRy/4
         8dRy5GGgLvBq+KFLYRcyCT3zlDLijuZV2wbLxZVWR6FXTNgAexjqNGza5kIFy2ZAmGjd
         lWpFVZwrsk4HW9LWTE12Gh6L0N5p7BNIrEtMsw/zdmEve+/jSxiErJPeZmac1dNcM6J+
         /Du2+Kx+tmsaW+6sEZhSO8I8PBQcSKE8zCzojfYmustNrCBQN8oGL4ZA2BkmkcmSIas9
         9iCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773135948; x=1773740748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQ8tLu1owIY8abuLsve4+gYZO3I2dEb/qJKESh2CSbk=;
        b=lwETOnVxwGU3s2Xg2QqCCMJBAQckBAyW4VZ3zKCs6WlK5n6rNK0V0CIVuUyEZmc4c8
         ifQyuUT7kZbaSLkr2l25Z7ipSk7bTOBztUrGjJ/4tKnbxJskGOq3GAL/aHfdYlBjU5E3
         uHqXb641VoCWiai1khm51FEHHL/EmpG6Kx2KGFnWUnvCRqn/UjxZUbAnK9srZT/OAkMA
         Wcc2+/Nn/i/ttix9Ah2zYRg+eYKI9Rn9C/18ckNMzTEr7y50wxq57LXLQ7eTt9pthDzE
         2CeG3OsCZLpNNAund+FI4DBaiWk8owsBaAqAxfQHwnVZHdBOg1Atax4fKa48RdCnZEEc
         FEJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKnOW7l5kK8eKqAkPf7RV89CoGkWnwyymILoMXdqzSHDJG7+e1KxLu+zX7JtZu4NhFGZuR/GXEdEvRD+dLbrGfxlD8@vger.kernel.org
X-Gm-Message-State: AOJu0YwxFZ9QpPD7deJsBv+iAJKL0hHeaJO3I5nFJ/sUhfxj6+dMCs8J
	GRmRw0U2nYEZLNtUhtlVyTMLZP977Ik8rz5RsUVNz0g15fnpPFr9SsAFKsHN6nnULsZll6VK3UC
	wezJXnwt4k1Gd59thiAnd10+AfClzPcIUHKbdTstZJn5gcm2+5JqWqsSpcQ3fvv5RCXgvvDgDVm
	Tq
X-Gm-Gg: ATEYQzyhISSricghlrpfQ+Hdlkh0aiB7W6goatceuE7UHAb2AOhAxHzszhFJw9ZGy9e
	ZoDkAjMj59LF+STfAKT+Jo5Fb+r/SDt2Cd2ZLbqbO0XLqNHHOIGcYo84pGacEcAhaAgSD5+QdXL
	lMzW2uW7sFLfbCX24IBuGyFVI/0ldfTW1jLCVaUInkr91Y+UMD4SCHVXO4/tzNvBApldhWYU9NU
	u8Rgfu/ym0WIrol4H1UwABF2HoJ/5qEb/iv9ibSJRTxqmY7+wd+SAcFdtRfc5YxGn+zw0/Txuyu
	09Cu3aaG9xOnfQRdJvEWDjc8y2stqbsJ0NnljEGfg/PtR3+HY7xEUkKjllV+lBwzR2RL8073WWz
	q2uHS5pyda6062JpWYxbOUp+WRBkniQynaubY2fY6dnGuJpp2oW5IoHygHa20X8kqVcYnn/jOSO
	prHoA=
X-Received: by 2002:a05:620a:1a28:b0:8cd:9446:cec4 with SMTP id af79cd13be357-8cd9446dc04mr216829885a.9.1773135948566;
        Tue, 10 Mar 2026 02:45:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1a28:b0:8cd:9446:cec4 with SMTP id af79cd13be357-8cd9446dc04mr216828485a.9.1773135948150;
        Tue, 10 Mar 2026 02:45:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a2b801a3sm4154561a12.0.2026.03.10.02.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:45:46 -0700 (PDT)
Message-ID: <8c97d121-82cb-4547-b2d0-14c123c50df5@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:45:42 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        bryan.odonoghue@linaro.org, ilpo.jarvinen@linux.intel.com,
        hansg@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-5-sibi.sankar@oss.qualcomm.com>
 <20260309-festive-prudent-ibex-f8b601@quoll>
 <ff241b01-c7f4-433b-a822-c5cd14e3e696@oss.qualcomm.com>
 <3eaceb96-003b-47d2-9ae5-bb676dde0240@kernel.org>
 <ad3485df-5570-4631-9d6e-2f0b90a47235@oss.qualcomm.com>
 <jcjspcef7v75btwnhjzgsqndw23j3k7jyhnacxzwridjdkyize@slpzcxwyntzd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jcjspcef7v75btwnhjzgsqndw23j3k7jyhnacxzwridjdkyize@slpzcxwyntzd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4MyBTYWx0ZWRfX/8YISfGUynZ4
 5UsaN1al2FxcxtQZWMgws4QF7LA4eKmoGWMw+zpFUZCCG+J5vaPV9V0XJmn7TLHBo0XLeuHLkRz
 2gC3yXy4v5HxMfu1vtYNdI/tvp/EnG7Hiuk468S/mVVPyYAorXSJwxVSk316f7nn4q7ICxILHEw
 OO5LwzStsSCDTlTb8EaJQDty11sEH2BiRJM9eLverTUlRTl3slGt6kpXNL+kmVUUuqb8tp51x7v
 nlHvuQuFbupaIgC8KvAXPoh8kCmvKgejDsbaHKKZ3IaPQQpTUng5Ue0GJQHmQLa8FxrM+n/BNcU
 xFvP8ZDOuIgS6kOhTyFCrKLF5v6gdUhNdcIg3NmJ7+k/ANuXIPFVgOS5D5g6S8psoNbZH5VeNtm
 ommxnq1NRkoe8wlm1hWlte4a3Jbt81wMfnPo5/EZN6MWPSFexRJW/yyqfQvUFnQfKNZ+sApRctz
 tqcgcDSibzYeBKFq8bw==
X-Proofpoint-GUID: mRbok86zD1gxdJTcxQzdbUHMpMz3grYH
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afe84d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JKISxpa1xdn5d-WQYaAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: mRbok86zD1gxdJTcxQzdbUHMpMz3grYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100083

On 3/9/26 10:13 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 04:21:50PM +0530, Sibi Sankar wrote:
>>
>> On 3/9/2026 2:39 PM, Krzysztof Kozlowski wrote:
>>> On 09/03/2026 10:03, Sibi Sankar wrote:
>>>> On 3/9/2026 12:55 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Mar 09, 2026 at 05:06:45AM +0530, Sibi Sankar wrote:
>>>>>> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
>>>>>> temperature sensors, access to EC internal state changes and suspend
>>>>>> entry/exit notifications to the EC.
>>>>>>
>>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>>> ---
>>>>>>    arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
>>>>>>    1 file changed, 16 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> index ded96fb43489..29a1aeb98353 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> @@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
>>>>>>    		#phy-cells = <0>;
>>>>>>    	};
>>>>>> +
>>>>>> +	embedded-controller@76 {
>>>>>> +		compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";
>>>>> I don't see updates to other x1e boards, thus my arguments from v2 stay
>>>>> valid. It's wrong to call it "hamoa-ec" since only one Hamoa board has
>>>>> it. All of other Hamoa boards apparently do not have it.
>>>>
>>>> Hey Krzysztof,
>>>> Thanks for taking time to review the series :)
>>>>
>>>> What other Hamoa boards are you referring to? The series
>>>> mentions that the driver and bindings is meant for Qualcomm
>>>> Hamoa/Purwa/Glymur "reference" devices, so it only covers
>>>> CRD and IOT-EVK. It definitely does not cover all Hamoa boards
>>>> boards like you are assuming.
>>> hamoa-ec compatible implies that and that's something I raised in v2
>>> already. You need a specific compatible.
>>
>>
>> Hamoa/Glymur reference devices can have different EC MCUs
>> depending on the SKU. This introduces the need to deal with
>> possibility of quirks and bugs introduced by these differences.
>> Hamoa/Purwa CRDs and IOT EVK runs on IT8987, while Glymur
>> reference devices run on NPCX498/488. This pretty much was
>> the rationale to make the MCU part of the compatible. Anyway
>> I can keep it as qcom,hamoa-ec and qcom,glymur-ec for now
>> and add specific compatibles when we upstream those boards?
> 
> Why do you need a generic compat at all? Glancing at the database, at
> least the following laptops seem to have similar protocol (I might be
> wrong, this is based on a very quick glance):
> 
> acer-sfa14-11
> asus-vivobook-s-15
> asus-vivobook-s15-q5507
> asus-vivobook-s15-s5507
> honor-magicbook-art-14
> honor-mro-521
> hp-elitebook-6-g1q
> hp-omnibook-5-14-he0xxx
> lenovo-ideacentre-01q8x10
> lenovo-ideapad-slim3x-15q8x10-WCN7850
> lenovo-thinkpad-t14s-120hz-64gb
> lenovo-thinkpad-t14s
> lenovo-yoga-slim-7x
> medion-14-s1-elite-sprchrgd
> medion-14-s1-sprchrgd
> qualcomm-snapdragon-dev-kit
> tuxedo-elite-14-gen1
> 
> I assume that some of them might be false positives and others will use
> vendor (or device) extensions to your protocol.
> 
> I'd suggest implicitly using "qcom,hamoa-crd-ec" / "qcom,glymyr-crd-ec",
> because then we can use something like "asus,vivobook-s15-ec" to
> identify the EC on VivoBook S15.

+1

Konrad
