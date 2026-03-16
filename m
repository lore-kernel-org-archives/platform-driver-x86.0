Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0417D2
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657243; cv=none; b=MszCa8qt/4p+wkuR6SwzH/Umk592LkWSx0AcvFoW1b0643fAGe/5V+NNacLX5nGp0fQtpAxESnanir8mCoJxmzMmsFTuFu/dKjqNODtuoD9dmHDLl6gCgAF+ElZEH66JEOeiNfuLOffWq7hgTr5fkL0nUUvV0B5XT3Cjqqvoh4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657243; c=relaxed/simple;
	bh=2XtkVsl6vm14tOIQH1Xo9pQK48VvGzKucVB4sOsWe/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bcecokklLpidWrxTHffttiQ8NsMNQsc9zq8jMyYmImorrqRTBPYT/FAox4urC88voGZ+kCRg/r+5XviemypSIE7SP1rnHu7Z1Yd9EeSMtQ5ejBMyq5hhLSvedyuv1yyTS4yKHbvCn0f+0LkbTH8Hurfxg9VWgZFiji4hbheeShs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fHYj7dZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZheN/J1E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fHYj7dZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZheN/J1E"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64krr1724749
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a8GUJhInowxvWnFS7m9mSt6uu4UvWw5Y85gwmNnzBEk=; b=fHYj7dZGK7Kdhgw4
	fg5Bz7yebO6chjPjEBxLJabLk6NvAhvMfWL3vVMJGIHVl/Iq7J5fEUKGj7vb0QC/
	H7YrlPhLYfze0pYOOgPGDakkJX81dCmohtoUuVwOG4MPPX1XUnDpS3EiRboRrJ+U
	vXkp1pJmaKL7IvRAz3GXqMXiYeo9vp8rcJjFZmAaAd2vpZRPGjlVnHQS0gVdEEqh
	wp3lb++KWyoe0sB1hCrC+VaMIuhonV1uhZVTiesbgB0o0IOx9ZBzNFNFACleo9T5
	MetbRFCNfa8KnzGERcEWG0xwylWdrNnG8KFmzHd60d9nZL2bGK0hEAiseyXisZw6
	V+hJlQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udn58h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:34:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954b9b5da7so31743686d6.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 03:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773657240; x=1774262040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a8GUJhInowxvWnFS7m9mSt6uu4UvWw5Y85gwmNnzBEk=;
        b=ZheN/J1EgDjq/6c2qDAzuU+ZPjX89zWwoQIPxrehaVj2leWh6QdD72+P7mcnslBvlA
         H8NBkll0Y5xZSindir/WMnrtGnF1PElTFQkTsJBK/T1Z4Ffqq/Q4EEcIHQwfAySxVMR5
         GTeigAgnZryb1uS5ERNwXhI5X1D8nBbR8GzGnfG8Neky4jo4KAZ75bl/8sW6+kBnSlx5
         J8lW1rlfUdBxg3SLhAS7eoQR/2xtvnUeNVrUfAModD8w61oGpFdwf3YL9Fv17UwknQRM
         Bbm8Z8ws1UP/9aROavZ0sflFRyN15pc78hOqiih7M5XetOPjfk84L2La302rKPCyhsRd
         yxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773657240; x=1774262040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8GUJhInowxvWnFS7m9mSt6uu4UvWw5Y85gwmNnzBEk=;
        b=lArU5Yz5sO2jGUXJQXUEmaOn9GE6WhWScLpX0SO5f8821eJCMUIdgvl1Yycik/FQwa
         ty2V9E1uQ3MIuh/DTfUOC0klc0P5nx9w5pec7vIM+COod7QzL+nH7l9jEkf1Ox8P6VFH
         3rbyuHKnSb+sYRacfZv/+jv2HLPz15jmy88NNZvSBRTjOqxVmrQdFAlccifCu0Ur76kN
         taDqiZrbiCmSU2O7gtmCwhB3nLoGFP9l62FSrdGrV6LlIhAF8tCfyehqjPaSdVM2QFH8
         GDH1qRym2HiqT8qvsJlP7r+/2wphxKwdNQIuMDMbRCuxlhxNWStSZ8jN14A6H8TlAr1k
         as2g==
X-Forwarded-Encrypted: i=1; AJvYcCX1+zzwn13W/jFMzSCdBq0poU887GlRVsLHiU1HWwYiDyQfo2v1JWW7EE7YiCRMYRB9GwLEcxTbMH71ZL+sPkAhneI5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxg8AI5tjItMZ20kvoNISPwdJtLXRSD1bDGIYF6L7T0OURKzpT
	/YtQqOEzWme+7aeAUsBbUxH1vZikRDcSIIz98MkX0H/bavF+OhotHrc6s5Wh0tlqfSv4TzQjpaI
	xvEJNaRN85hOQ0WUtS2D+m+XaRHSA+w2sVFjCgOtv/asK80xAiMU+4IFYuWmDIrAEu6F4hJRMqG
	L2
X-Gm-Gg: ATEYQzxcQYkqIDSrJHFU+V3Un+H7AvkDe39HXSJBwMsBEbfwMz7Q+Dp//9zZmh0i2fq
	bADwTBEo4qlcrgEMAba2nTnMYbBfPxqJps1pQmWvlUPfo4dAbc/38dc3LjSOklRrZHtuiaC276h
	poXxQGZ9xCDqfkDqkH2kdOA47BwToH75x2PlnS8b8N520xq/ECrHRTd2ruIFnM/cBiPcmy7AZqA
	BGPtHOZYhkfo7SXLcSD0g8AUIJ1XEm+lG5912QewDvJfxxLEdCXFgtdXWH/dyPSNuz3cqqXqK7i
	fbqJploFF3TcJunMO3+a3Wc0zdy89zraIGphVKSY7VKy+4uiCT7F+TIv3TfjJ8saXKfh5D9Bh3X
	eEMMNWbLVWF8DSXSb3lL9FVqGXDJ9uO5zcks4eVNV1EcEBvfJfkfKYHaZLBVZh+0vmOzOKVvG5R
	fzzSg=
X-Received: by 2002:a0c:f11c:0:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-89a819a32bbmr109265586d6.0.1773657240465;
        Mon, 16 Mar 2026 03:34:00 -0700 (PDT)
X-Received: by 2002:a0c:f11c:0:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-89a819a32bbmr109265326d6.0.1773657239982;
        Mon, 16 Mar 2026 03:33:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm536788966b.58.2026.03.16.03.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:33:59 -0700 (PDT)
Message-ID: <760b9028-ef60-4f37-b3a8-d0045adff861@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:33:56 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-3-sibi.sankar@oss.qualcomm.com>
 <aa6M2QSXW72xqYiB@linaro.org>
 <96f8738f-9baa-4528-8bc6-6ce20030e391@oss.qualcomm.com>
 <805525cb-ef53-4bdd-a73b-6fe7513228ce@oss.qualcomm.com>
 <aa61HZOuz42C_R7X@linaro.org>
 <395f0607-7d6e-40fe-90b3-a7b49a6b7eea@oss.qualcomm.com>
 <5a60f6fd-8cd6-4936-beaf-492dfbfa5b26@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5a60f6fd-8cd6-4936-beaf-492dfbfa5b26@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7dc99 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=odgoo8EOQweKgDa1cmAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: oOyK_DtmRDXPMXL56CdZR1rMvIedk92O
X-Proofpoint-ORIG-GUID: oOyK_DtmRDXPMXL56CdZR1rMvIedk92O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MCBTYWx0ZWRfXzsJK74jtp3jo
 GAOYb55IwLa9Xhk67PSRMh9MzbM/oxNJbgeUAcwNRw/7PfmW2rZzju6wFlGV+ndnireWXCv+HgJ
 V1rEiX9lP9/EVaLD6U9kKw+5cxFTX9laV5SUDxRNp0djiMziHbZk9Z94tqL/9HKXdGWJegNjNQ7
 wl0E67GBZ2nZIAUvjfTsEHADmB0LiweY0oHXpbs+ED54ry5Q0EUsoSQBaTfgq4gFHrVhItI59UN
 LS5RpMTY6NqMmLYixRp0h4zlD4v9A6u6vVCt7V57cBHNqp1IKJWQ8OVk1Qu6V7Un1VXWbJybnqb
 3iyH9ZlwYcoFzGzKKv7eStAQKeMZJL/a+ZgzAAwzNc1hnrQQnQcz3Hg27slAumrkg+1fCjbOxbl
 aIdgM0FeYlxVofROOBNxFicTj4p5P3m8o/2p4aMERrlLVhANKVVHKDUCh+LI4UM+uqvOpxpMEcl
 BU6dGC3e2jAHj35Z+0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160080

On 3/10/26 5:58 AM, Sibi Sankar wrote:
> 
> On 3/9/2026 5:40 PM, Konrad Dybcio wrote:
>> On 3/9/26 12:55 PM, Stephan Gerhold wrote:
>>> On Mon, Mar 09, 2026 at 12:47:33PM +0100, Konrad Dybcio wrote:
>>>> On 3/9/26 11:04 AM, Sibi Sankar wrote:
>>>>> On 3/9/2026 2:33 PM, Stephan Gerhold wrote:
>>>>>> On Mon, Mar 09, 2026 at 05:06:43AM +0530, Sibi Sankar wrote:
>>>>>>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>>>>>>> reference boards. It handles fan control, temperature sensors, access
>>>>>>> to EC state changes and supports reporting suspend entry/exit to the
>>>>>>> EC.

[...]

>>> The question is if you really want your device to hit 120°C. :-)
>> And whether the firmware running on *your* laptop actually configures
>> these limits.. I would imagine that to be the case for Windows products
>> where the TZ comes straight from qcom, but I think someone in some thread
>> mentioned LMH is not properly configured on Chrome/TFA.
>>
>> In any case, let's see if we can establish what/whether the EC does in
>> that case
> 
> 
> The "debug mode" which is used to control fan is paused during the
> following conditions:
> 
> 1) When the EC receives EC_MODERN_STANDY_CMD enter cmd
> 2) When SoC enters deep sleep fan pwm is turned off
> 3) When external processors like soccp put fan constraints on the EC
> 
> So when you do set the fan to 0 and put it in your backpack :P
> It would enter suspend, the EC would take back fan control.
> i.e. the LUT based flow that it follows by default. That would
> imply it would be the same behavior as seen on Windows?
> 
> Either way I still think we all are in agreement here. This series just
> exposes fan control knobs to the kernel and doesn't set any fan
> speed by default. The LUT based EC fan control would still be the
> default, the patches to improve this are in-flight i.e. ways to send
> avg SoC temp, update LUT and select available profiles. With all
> of these in place EC would be in good shape in the Qualcomm
> reference devices.

Right, and I suppose we're in agreement that treating the

* user sets fan to 0
* failed to suspend
* 1) didn't happen
* fan still off

chain as an oddball case is OK

Konrad
