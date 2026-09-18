Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C8D33D509
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737841; cv=none; b=eRMJofmvhPclHw3zsGEcLHybJ1VdAkx8hzVcSSws5FfUyyjzUdUC6884Dg7qRyJ5VrKyLiZlmeKvZyKT2hsos2ucfP1ZVX631z/8kMF4nFApPDUI2fB+3tCymaKBrP0mwlONG9sxvonXDmvivfMqK2DP2ZLnlQ7p0cwe0VGMquo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737841; c=relaxed/simple;
	bh=Yc7wqbvlmYIYSmY8DLM/Fc/IZHx3O+w9ugmnjA+pCAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJdYotCQp/0VpUDQMgohldv5JJmOZ3nxi8IbOQjC2gcGHhAnsu0z/TjDDqr2CLolnGuJ4opKPX4pS4QiBTh++0NyYGaUuthuyqlZ9NAFIxTSG+Qrc3b4imlT14o6XtqudJ4VsSb5rPyCoNrFKZYxtgQmJP7K8pe5/XkVaMDW5P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hf/BNKxC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaZEHcS1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hf/BNKxC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaZEHcS1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICtvcp1291671
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 13:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=; b=hf/BNKxCTppZPbn6
	Xo+8ydQNhF/FEBjcg4U4vNdLZTC4jDnxv2z8zvF02U485r9hNPPBijP75Wx/2JgK
	64X1sLLRRsNoSux8BdzkrCATqOUPhpTGVLYgpZw7k1qMt6dY/mfqknYpIkdBIRIF
	8r4wTWA2zwj30NWuuQd/8kFmv9wVs56Ro3Ysp0mLZWYx2cjYehPvDdbeHl7by9GV
	T/voniU4jYQrIeOW2LySKAEyxqJP0OreTpGgN8XM8hfsdztDPiJg1oSR2BFKO7jy
	0b30NJsbh3g/4M6slkJ8SVD8+T7H4TSbXtgIH6Fkt7P8Cy3uMMHGyi4Ic04AaSMW
	dtPCBw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv8w73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 13:23:59 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9806a17a7baso8607241.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737838; x=1790342638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=;
        b=XaZEHcS1eq/uMU+9u6pFuC2rW5E+h1JFbVavFRUllcoIFPB4YDqr7xXn7X0lNm6qan
         voglqI16ZRX+O+SBATNB4jPlY82GhrkBHHV8Hh14rIbVU63eQufDCREYG8CQJG1KQvSc
         yynKOhuuGv/6Ce6yr1sTVaDIQEk4wjTScTRVYEmzLGwO9CD7MFn3DrVaLfPStSmmM8Ud
         tLXxZ/ax/MYjRybj3PKrhAKMXhL3kOogNUCHXObwCs/0UWJV9NnJ3RpqNh+qzjiXE0wo
         jdv1/LAXl9AG2SSYXOG2rRwcmOwZiot3wZEZyV8PAGNBweUrmAWAo69poMI8XMpQPw14
         BRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737838; x=1790342638;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=;
        b=u5746PETPXkPhQU2Eq4X7xDYCFt4RmauRpy9z58ZkIh+hngnVXFCKatNowtd724G37
         yiykZZs2XW6BypUFLMMN9bd+gd1gqRMSKLNbbWNrUs8J+WukJXOEtCMWLz7Sihx+U8Im
         y5axiWx3G2RGlHV8avzLMOVJiK+cU28Jy2ztEh/36pxiNDP8ov0C4DCI1VWs4E0D83ip
         0KuAhXqgGbaL8LqYImIoAroXM3JEtgtHzQG6K2TGmqxvAGD6FYvQX7NPFQL8luyykg/x
         kK57PRS0TdRC118fcoGEYg8XebKupVKUe6X7mmkhZxFpO7nPzxGHq3EXvKdHf1rPwtX+
         gMug==
X-Forwarded-Encrypted: i=1; AKwUvBxHk/r3ZgwzENc5NcWZOGblAq2KKbsdPmJ4fZ9jUxXpMW1O7mMJlKTmYJlApuG5jmemFOfjuCfIQxzsoMHp9kQp+NZb@vger.kernel.org
X-Gm-Message-State: AFuF++nhHqP5kxKs+9sOSUGK0m4WuT5QbdzCKt7NlvwjL4xMiFN/ALk+
	mjStdYofzA4EECE8PWaY2554jjH2vIPH40i+TH2MbZT19Vn+uzI+hhVwbWu1iZx8upCm9AxY0CE
	bkACrju5kQYM4EDWte6SCoGA2R1wuHAjr3qkIgkN6WeTzhO2Y109soUXHRSMj2vCAD0HkNJV0Es
	dd
X-Gm-Gg: AYBFou2ntlxDcbA49VJU3Km/DoHo6mw6rILke47cbaHLmK2n7iW/qUYZDgN9SocoCb6
	7eqNrxOOa6yxy0a8nDm/Ifo4c3cgKwn6FRsFthCcOmjzriCI1VJDde+Ujl9+uH0U1l3bjQgqXJo
	OY0jaEi3x4PbeUSkH9QmoantyVxh2RY3ZqY5f9FLbb2+rpiVa2gTe6W2UJ2L+NDioLnvDvMQW2g
	0PC/9fuXlTJjwnZ0eKsZ2+sH9wyLHHx+rBjO4OpyLfMYiy23sdPD2aNi1GBz3hLK3aBY0tHK8b8
	CZHwLdl85gJSzRj53LWQNFtcsNaJpCzta+3x62ySTshi7o1LFJvWiV94auCE2PJ6PxILkGvisSY
	ilqgqtVu0BMD3wIyOmtKVjg==
X-Received: by 2002:a05:6122:1b8e:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c9b588e086mr929295e0c.1.1789737838648;
        Fri, 18 Sep 2026 06:23:58 -0700 (PDT)
X-Received: by 2002:a05:6122:1b8e:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c9b588e086mr929254e0c.1.1789737838198;
        Fri, 18 Sep 2026 06:23:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58f3237bsm856663a12.8.2026.09.18.06.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:23:57 -0700 (PDT)
Message-ID: <9709e146-0f9a-42a5-bfcf-2e5f8b49df2e@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 15:23:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: embedded-controller: Add ASUS Zenbook
 A16 EC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-1-373516d347ae@oss.qualcomm.com>
 <20260918-objective-okapi-from-neptune-cbcabd@quoll>
 <92b7a87a-c086-48d1-8487-883dda7c4d70@oss.qualcomm.com>
 <372e9dc8-ec28-4d8e-a349-15145b82385d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <372e9dc8-ec28-4d8e-a349-15145b82385d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX6fHMQ7YgvyMG
 51SB8golINEk5ekgpYmGRj5ji/PGo4nCZnpTeNB7cqZA0FeCNjfXg5zO0m02oV0QqRCFgK2yCKq
 V3PY7NUegkCrBJSui3eLKV2Ts54lGbw=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad3b6f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=PwanzjBgMYuxxlb2B-IA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX2pHI4UTl0/Ox
 saThSC4Aq3hNO55dz0AJQLhcognMXABMHS141n+2A5HK1dj3nrluaQXDliCUk1q53LTgxfFrplM
 PoKmhPMhqD8s5B2JHZ+AUYgFfIt27npgdw1kKGXaPwpEFerKrAIeo0k6+XZiyXjXXJIjB4ykiVB
 OJ0xJMRxOPNGDgf7yEHQ0y+7QhB3nTWhqUzvgKSvkZltXimwjItejrFvGzmI3bcpQ6rcff2cFbT
 rls6BrfwshXfmWPU82CVLURJe62SlwrLnFAtAl+fQn3Bnslym37gFEKc3WUXI4KD2I90armOeyf
 FI2DococVHBoGDBuJFxlWeUINJVpwfmB7hqh9K1O+nUTjYykvymOElUcHQZ0KrtOHp189YkAr4e
 UacGgsfYUerplOVHZmB3yzqKz/Qcr03/+kznOfRUriNnVo/sqdh0Pg+E7dwkRe/r1lVg4vSMwlp
 +mdkPSgOb++oo6PNikg==
X-Proofpoint-ORIG-GUID: AHi09vKQENSTUe9g-gYj1RCIKq1plWPu
X-Proofpoint-GUID: AHi09vKQENSTUe9g-gYj1RCIKq1plWPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180189

On 9/18/26 3:21 PM, Krzysztof Kozlowski wrote:
> On 18/09/2026 14:29, Konrad Dybcio wrote:
>> On 9/18/26 1:34 PM, Krzysztof Kozlowski wrote:
>>> On Thu, Sep 17, 2026 at 12:54:56PM +0200, Konrad Dybcio wrote:
>>>> +description:
>>>> +  The Qualcomm Snapdragon X2 series-based ASUS Zenbook A16 (and similar
>>>> +  machines) come with a custom EC firmware, loosely based on the
>>>> +  Qualcomm reference ("Hamoa CRD EC") implementation, with a lot of
>>>> +  customization.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - asus,zenbook-a14-ux3407na-ec
>>>> +      - asus,zenbook-a16-ux3607oa-ec
>>>> +
>>>> +  reg:
>>>> +    const: 0x76
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#thermal-sensor-cells":
>>>> +    const: 1
>>>> +
>>>> +  wakeup-source: true
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +  - '#thermal-sensor-cells'
>>>> +  - wakeup-source
>>>
>>> Wakeup source should not be required. If it is, then it is completely
>>> implied by compatible and there is no need for DT property, right?
>>
>> I suppose it's not *required* but it's highly desirable.. should I
>> just drop it from the required list?
> 
> Then why isn't the device driver setting wakeup unconditionally?

The i2c core checks for wakeup-source - I can remove the property
and call the equivalent functions from the driver if you prefer,
but that feels a little "rough"

Konrad
