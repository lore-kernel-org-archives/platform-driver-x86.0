Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FCC46D2CF
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464216; cv=none; b=ZVw1IxSQ4KnxobFuBajU4GIhYV5/GIlC7LK5CCh/Vo6VP2RwySEygKYfwXpmNDyvikK+JOFGAedT+oZGQvVbSEeqHtEIkfRx3WNjKClQxTzU0TW6AXgWwtfWRmPV/SNvZlr6uhbVFrT2tgSklgFW2a+DAwd5o1Ad0xY1ToIuD/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464216; c=relaxed/simple;
	bh=k+B6OmVSZRHF/7PniO6p8HutiPOy9at7ASl9vPW22Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1NFM4E6yid9fYzoEtrdLbWtVb8OeWAAY3+ryeUNMevA/Q23cJQbwd+oPZV5R/4IiTU4NUY6FW6lc7Zp0dHbqiH7Pi5OIIKdh2JcL/MaCln8mX6ivSjNdrUnGHpdZRLXm0mtnZDjvaAYtEqt7f5iBeyehWP3JHn13ZzJBvjQnaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvBAdIxh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XyB40/RQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvBAdIxh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XyB40/RQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZdTL3824091
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 09:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5n50YcPWOwyVacMh95fTxMW4+kIe+YWNsQL2QT+trI=; b=HvBAdIxh2Kp/+5m6
	LNzP9NgnaHxpNQK/P7OrE/guR2KqcL3Had2yRgXxmgE4MuAKkdKNYaad1YV1Akkk
	N3dWH9oxOKTbdDQl+eEatyxEeTkq1PMMhipEnMEwzHBlCcQ8c7a+rAjoyhzMvbI/
	7c/BeI4koMNzcrsquPrDw3++2cCrKfUVaiyQbir6et1hqB5CBifqe5sLalSuYz8b
	l5tEaTj8L4tC98HiwFvq3SvmKYkIU5agRE2zae7URkaQaLi4VUk2U+M9/738444f
	FP9vRKTJ4HRFv3ygyb3t/bPXYhb5Opf7U5lztpxbzE4Duxus0lpb3oIgDc4PUK2G
	F97uFA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41un04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 09:23:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so5310335a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 02:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464212; x=1790069012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5n50YcPWOwyVacMh95fTxMW4+kIe+YWNsQL2QT+trI=;
        b=XyB40/RQwfLUnhMMPFiQNq6xnneFQ3zBXJ58qtkJgyfIAQPWsNQjqFDb2C4nTHIN++
         TrQ0bSWUxAM/OJODFXLNDdVfylg5uLcaRuJ32u68bPkC/h7A9rG0/7EPgWSmatOfKnmK
         6aFd8eT/NAez+K3DQCZYs4DJMG2wDPkVKgXKyX7vNIjLJUIJBi+tTQShraRx+0rgv/aQ
         yz6it1bAQhXkXw9QhZGb8HXpCAMmx8TpKbvBpu1+BKPImryYYj6zMUUmYp7wC5ZXFv8L
         7pbS9S1u2PTPPZtkL8M35XI9Dwu+vubSSQxM/tE7IFtsjxjEDnuBcwow3QnMGCeomcV+
         vLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464212; x=1790069012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5n50YcPWOwyVacMh95fTxMW4+kIe+YWNsQL2QT+trI=;
        b=esh3XtqJCvaHP7GTK4JAXUAPHtjfTkDgjZEAasIojAFs+deIzCsl5Pchvzlu3XsL9C
         uMAqg0eMKimwUJwy/k0e57w62p1M99SzOTgxcd8kFB9Ip/jEnrNdVqkHA97vviUTegBv
         QrkiKnG78yvVEi7awgSG5zIKrH6DPHbKAR8fFUmfJDtqSG68yITcKrK2tndroTD1QRJc
         EDs6mN7khwSBTOlgyO768rOYsncn4tby7Inwkwmm5tiggXpOSBWR33lherTR1mUT+Wmg
         v/cNIJdwiqCSK4th2W+HXgecVDXeft+UAhdsD8DxoNGVMtaccr4MrUD2xhM1kxe2fNYD
         ZWhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNDQHsggZUeeteZrmQLRKFXMU9TcyuktVEkj1dqE3aS57ZKf13kha/PVr2/tqCAZqphFOIonpVqXELzTBQBa8s5XWj@vger.kernel.org
X-Gm-Message-State: AFuF++nunP/FY9Bo9/QXlS6Dr3DUm60jKc3kL4M38vZlncUrMpWoLDE7
	FsURTXW10jv5cJoeg4N2wvD/gu2x79Lkum7NKSwp1Omy0aJgLsrjtYOqe50Y0bIODjWV5yA+0M6
	3AnPxJQmG485j1I40/vNqiCjYDptaQw4lf1Q718UlDLQ/VlESPEGEZJXH8RZ2iH3ZSYy+51xhjw
	vh
X-Gm-Gg: AYBFou3T8gb+RdoG1zl1MIkkost7PNm5o5GVTC5OTNgm7RUaQjSLyphXsWSETRakmAf
	VwVz4vcnBXkldOuVScnpGFw9SFEaANbC2MFFXcPm1Y5NVWPkfcGtpTZILgcxRjKM1NVksmKA7aQ
	WFtklEqqoY7K3u4rncli16B7msvK1pJ81IS0/vDN+cGfDkAgJn8nKkoTFADZ3eVPQuTWFEsSzea
	Yj4oPSyirW/CtiLjiczoFfY2HSkQGSboEt/D/VbmAP/50mTMNGzEXpymE/UXAAW+gm8oLOA33Np
	WHluUcEmV9Mw3Gw0MYeqy3e56p8pe9h+JNest5UMsQWGXvMsqnG4hxMQnrTjZdXmAL0f6iFErfi
	O3P11zPZ3P85g2xw4uSoXHOw=
X-Received: by 2002:a05:6a20:2d0e:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3db4039fa7fmr15609058637.6.1789464211816;
        Tue, 15 Sep 2026 02:23:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d0e:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3db4039fa7fmr15609012637.6.1789464211403;
        Tue, 15 Sep 2026 02:23:31 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.86.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ee07f2sm29591306eec.18.2026.09.15.02.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:23:30 -0700 (PDT)
Message-ID: <73db10fb-7778-44be-aced-562aa1039404@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:53:24 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/2] Monitor Yoga Slim 7x EC sensors without taking
 over cooling
To: Birk Skyum <birk.skyum@pm.me>, Sibi Sankar
 <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Daniel J Blueman <daniel@quora.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908135801.81436-1-birk.skyum@pm.me>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260908135801.81436-1-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNCBTYWx0ZWRfX9aBxT3GkLj1w
 iS8XzvZ7sav5nEAD+hw4qrVrRIs5kreilEfSLhNDeVeq9mGscZFbREfwbo81ud3Grz96C+UFs/6
 xSq2ER6cflPuPm2+XxIYWpNmNrN+EJjvZz93cZIhKQKoBZYi9umgj2N/K9m3O/XovfeNE+130Ez
 usXjKY1xDEDU/nMiAgJ7WQ4pOLVbAwQ+UzbkxERWmQOIsFh/Rk9x1NfE17hbn8ZwkEvJPYqgFaO
 B6d/BmTTas0OGFHvNUso+n5bchwL1LyZofEla6Kn90l9voyaQ2dgfZcQEvB+d6enx565f/857ik
 921KYJ7rFU8Ck5d3UkeDOZNtnzg5cxgD4MHjlsfsRRQpdC4UzOyIlyZ0LdPVmLDs2h1zLebX+ay
 94Wl93MCseDJ5/Zyxvnef4NuhyODfG4eBQvD6nkx9IyzVtfYHaQkxf+zkId/nQvcxajKvc4/RBj
 KpmqrRmGkJsq7TKJJRQ==
X-Proofpoint-GUID: DAMJCnqhHqDw0Gqgur-s55jeIdAPj0dy
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa90e94 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=YsbRjcmUuq6dkflYeO58cw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Aa1CV5B8TMOsY60AgGoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: DAMJCnqhHqDw0Gqgur-s55jeIdAPj0dy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNCBTYWx0ZWRfX4OwE9PYjaFIX
 5KUpjpJcsgC+LRr2TRq2Xa+DIwtA57jd9Gc+xDVbrVt6DRIbbhmVUOfOOBcxBQPhPt9YA0mmtxV
 MyXYNqXpHAscmm5DgyR61FMP44+8T4k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150134



On 9/8/2026 7:28 PM, Birk Skyum wrote:
> Two design questions for this RFC:
> - Is this read-only match-data path the preferred way to accommodate
>   the Lenovo firmware alongside the reference-board work?

The read-only match-data path looks fine, but it should be integrated
with the existing LUT match data. We should not replace the current
match-data usage.

> - Should the pending Lenovo binding omit the qcom,hamoa-crd-ec fallback,
>   given that this firmware cannot satisfy the reference driver's probe?

If this firmware cannot pass the reference-board thermal-capability
probe, I think the Lenovo binding should not use qcom,hamoa-crd-ec as a
fallback. The fallback should be used only if the device is functionally
compatible with the reference-board driver, not only because it uses the
same EC chip.

In that case, the binding changes in Daniel’s patch also need to be updated.

-- 
Best Regards,
Anvesh

