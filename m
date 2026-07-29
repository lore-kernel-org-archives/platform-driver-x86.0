Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCADF449B04
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 10:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322184; cv=none; b=FgcDKNeWES7i4Ew2pSE92AP5pPohPDzErYydeIRJSkbSdOQHDFVUUG8Wjykm4PPC6dDSkqM4YgoY6jyt/gncavOrY+mfqA81noRa7HBU+ru7diODzGv+lzYs7NtSdwtOc7hUHhLAYgZMEnaVqQZQqZ+DmU1nu2nAwJ1G8b6TVzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322184; c=relaxed/simple;
	bh=2usr0i2dFD5LSEt/TM85K2oR2cSK9laanCcXUmD0pdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L61BJi3A9Vn7bJbke9mzjIvHtiscVR9SwgCiAVkCfLS7CL6LzX+sGtHJctmD//kBOJXvoEfBcg+qj/ZyZg/4L5T+NJLH9n7mIJCznMcesqm9JuXuoL3doEYzJT+AIOwmSAUCJKjAe537wuZENxkmwLWBkvnc4jPd0BAJGGX6UvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OG27n2YI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnTr0gcQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OG27n2YI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnTr0gcQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T9o7pZ1870487
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 10:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWAY9zP8dExKQDKxyzQktKQkEBLqrC9Cfvw5ivxGBXU=; b=OG27n2YIQFTTwow2
	AOSmAJUO9yWICPiPADS6UdPHTrUdRUsH83V9pQdpfI/B1P+tGFG9v+aBQqdAD/pP
	CpyD08WCjCqSXPksrLqKBeUzi32JVxB3IwitourBH4w+2cK3cVScqG5E6u+Tnbh0
	vWlCbwk/xGrFRToFek1nBKo69m7o53Qa85+Alc11dfb/haMXpAx5usbXyzCAiuEi
	pqKpk7WOKIwjcOgR7/MDFbD9apjytt/4zRtZa1jKHUDDlHqJTCnr7hZpONn85Ai/
	9YVZ+mD+Dy8uOZvTq6/QiZ+i9OZH5OXB8P4DBZihFgetBbQXlXBEnMoHbyfv6PkH
	BIQTEQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqf8388vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 10:49:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso1014838a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 03:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785322180; x=1785926980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWAY9zP8dExKQDKxyzQktKQkEBLqrC9Cfvw5ivxGBXU=;
        b=DnTr0gcQCsApnK83J7LjD/ouYsgiAKq3MCAsWsmOTq+S0Wqj7ROkX4Xwfb26ovZuU2
         DaJ2ZWMa0t3JyDgxTBBQoJHDCO/WZF3t3HvmdPS0rn7DjI4Tz7cKF+ziJtBZubYzex9T
         93IO2N464ee4L6OH7qse6+R6vF0hMv6amzL38n6paw/dvSjr4gDCToy5MK8dSqAoMJuP
         1eSFbUq6NeX5nIwHNd5XcKjhq86VXf91SG9SQqn8hJ6pQEhoB7RGuqTRTWmB/Q8+P6Cv
         xZG3AGYh5ABXzDPRr1LrQkaxY/j9sb6VFL/axYGE7qxiX5bxK290S6YhrH5zK3dGxe87
         Z8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322180; x=1785926980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWAY9zP8dExKQDKxyzQktKQkEBLqrC9Cfvw5ivxGBXU=;
        b=VqQV+yBxsMsvtRaiflrWwULYWurIFANTWP6q1TBS1GzaAT9i3uj6ToRb6ieUOsB85L
         Z+b8D6h3MqzaFpm1OqDaoRKjAiEteutZl3lemkFRQOQZQiMnrJtEpNj2Br5YOju5RRL/
         OIBH26wBKlKxscAjWcR9PRGKr/+itvQmCfy8yiH6f1lNkA1RzVU1JYLiEng9urL6vHtN
         7wj6IdXHe37FYcX3FtF6c94fExHIdR0bFXc4R7t2cKnU6f1gZRuvv/5ODA/Wonzwdi0B
         XPABga1DvwhPqyUeHnatTVT7Gj4mEhpCZ2Pt6VZ9WGhItY1rX4Yr60n9GjlpNFzUUpIC
         MQ8w==
X-Forwarded-Encrypted: i=1; AHgh+RozizG772X1+j2P/G2TIXTnz/GqODMGYZKkVP3CDrPVZe9H26AXkcFxXDgjFEq6KE1leOFn0Q9/ENxa0E9LhLPidjTa@vger.kernel.org
X-Gm-Message-State: AOJu0YyNUXXM3xtFHrgsO6bOXigweo2gnRB3g4QKPXK+Mxn8OS0fUSrY
	Rle6L5sffFm12C/dC+saA/JRIOSYjskoUlnW4Jq40U7OQq3CJAcPrhH0gwwoGhjHMDcVSbFeeC7
	0E72ByS7NdyImOkx8RDy3lPa4WVxVuxwMy+UosUj8ua6DH4qbVBTzwZeSnhNsfcqLNuGkoYPAM2
	Er
X-Gm-Gg: AR+sD13NGI79/5hMTt6zR3/ncT1MDywaPfJxIHQoAtiu6UT8L/FHFGeFElJ8GWjjV8a
	qYM5fxHIsIjI3fjuKWDhYQyMRV1uhGDk4uHrPPPDJ3Fcr/iPrI3qBBKYPkc65jUTy2NriS3q/Vz
	HKjSehLX+2vDzfo8SPOqFj0otDPn0EQovFjIomBRjr7rB28MeWtmZXc3i3TRJSahAqSRb45uKUy
	8w+sNhra4ynVw4PfLrTH4GMxDhNFiiRlJN44xO9tBcHWex1MebmyzeFzHQIeqBDLXrt8zqHVZ2F
	7OHy02NETyhrvptn02/WpMZSzwE3XcXtnoqjNR6eJ68Skh2/ahDnjBGoth9LjFC4avvtbi1Q9AK
	fy1JNUGEMnUlAtHp9CDcTuyL0NaVBv2a41bG1YeP2oxt2JFz465oH3y+jzpfyWdDFEmh7qyvzwb
	8mCYhei194Bsph
X-Received: by 2002:a05:6a20:7fa7:b0:3c3:f431:25 with SMTP id adf61e73a8af0-3c8ba5b7785mr7131224637.39.1785322180300;
        Wed, 29 Jul 2026 03:49:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa7:b0:3c3:f431:25 with SMTP id adf61e73a8af0-3c8ba5b7785mr7131197637.39.1785322179891;
        Wed, 29 Jul 2026 03:49:39 -0700 (PDT)
Received: from [10.149.71.180] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba3519a5sm724263a12.18.2026.07.29.03.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:49:39 -0700 (PDT)
Message-ID: <052e32ab-c7a6-40be-a11b-3d11f599cfc6@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:19:34 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: reject incomplete
 responses
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Linmao Li <lilinmao@kylinos.cn>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260728111924.4106898-1-lilinmao@kylinos.cn>
 <d1a6474c-68c1-42f1-8d2d-ad5acdd25fd6@oss.qualcomm.com>
 <b98b48d4-6e9a-4fca-aec6-60cb618a9056@linaro.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <b98b48d4-6e9a-4fca-aec6-60cb618a9056@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4OSBTYWx0ZWRfX8eUwJoO4pMBb
 5Wvm1MeGO2ED8689FrXEPhDKh2eZYlHpfYASSqIPVEYxMkqqKnufHG4K3NiWhf+zGT4VQxm38DA
 zjsU6Swzhg4eggougSKUMjrHnoR85Qs=
X-Proofpoint-ORIG-GUID: FZiDtR9AONZ2kGNPX6P4E0GdbPq_xsCj
X-Proofpoint-GUID: FZiDtR9AONZ2kGNPX6P4E0GdbPq_xsCj
X-Authority-Analysis: v=2.4 cv=AaaB2XXG c=1 sm=1 tr=0 ts=6a69dac5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=c4HiQqaVnwyIzI225tcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4OSBTYWx0ZWRfX/xoU5wClavx+
 TJw+82e+xjoQ/6qY72KnDXe/WU4yazvtRyrNxExxcMn0HqSRCedWXdSvqOX1Bsmdt6qJWUGSjHU
 1D23iTZlTyDfWFJTNGidEtQ6XVWnvQCh61QNzzvmIKX/kmP5wwuxtDktzId5WwuWKObgyL8Qbd7
 VAtkmsRvYFHtcTL6xX/cKcPMut8ZCzsmuAVQizf5zumg7ANAVJQdYKKgsGXUEmjmSqz/7JnvTxe
 eh7dZB3tcjXK56Q2yGMsmvpGXCKgtxLU2VcNWyfaNk08QsR1E5kU2Pzpr1fO37JqR/6KN1vgjOy
 wkbG3coeASUQkv47op1O+ca1gdPg6ECppbmVfBQuow6d9RehlEwlfBmpHl0RJttHU9eH8IzC9Dn
 iG2XJvQnIv+9kb/xzlSUelSKsA9Q3+ABlJFw+05O/8S0nAAvx+Iz/1kB9flI8hwvczs4y5S10go
 JXWaXesrOnUPadQCvSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290089



On 7/29/2026 3:53 PM, Bryan O'Donoghue wrote:
> On 29/07/2026 11:08, Anvesh Jain P wrote:
>>> -    if (resp[0] >= resp_len)
>>> +    if (resp[0] != resp_len - 1)
>>>           return -EINVAL;
>>>         return 0;
>> Thanks for catching this — nice find.
>>
>> This is independently fixed in an in-flight series that reworks
>> qcom_ec_read() to use raw i2c_transfer() instead of
>> i2c_smbus_read_i2c_block_data(), removing the partial-read case
>> entirely, and it already has the same resp[0] != resp_len - 1 check.
>> That series just hasn't landed yet, so your report stands on its own —
>> happy to add a Reported-by: Linmao Li<lilinmao@kylinos.cn> tag on that
>> commit when it's re-posted, if that works for you.
> 
> What about -stable ?
> 
> Seems like we should take this fix and your series should rebase on top
> of the fix instead of the corollary.
> 
> That's the way this should work Fixes > New stuff.
> 
> Can you add your Review-by/Tested-by and then rebase yourself ?
> 
> ---
> bod

Agreed.

I'll rebase my series on top once this is applied.

Reviewed-by: Anvesh Jain P anvesh.p@oss.qualcomm.com

-- 
Best Regards,
Anvesh

