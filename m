Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE74211A28
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 18:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775069254; cv=none; b=GdN+jRn7vh1VJCYcrgsxqWiR0iGJeEuVccmYrywkGtSA/ndLf7d+fxDpff35RjQZtq5ou8yhmSIRXPCO1UutdzPB6F21tStGRdBN3ydOALE8lrX5xN97yzKjT2d/6xZfZzTVSqWdZb/EykIUsTnMRq3jXx9NQaQLZW9VquPoVLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775069254; c=relaxed/simple;
	bh=gS4Ibfh5IJpdKEth4ktrvf0S0llBqiTPM5efYyqen/0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=X6TbWcAV2nYO68XslLmiM1PFqjhqLy/tebwIoklNqE9UBozdNzI6XUi2jvIf0I8/y0fss/PpzsQWzx6ML3rAskbKb6p4jjmjEEd73pDZLKYGFaaOaIOBKmchqN+VpiDYpd4KQmpZTzi9sX7oYoQTHy78Etq1Aa7/cmj9rfH9Dew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIW7B0RF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RENmrzWp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIW7B0RF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RENmrzWp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631G6LOH361872
	for <platform-driver-x86@vger.kernel.org>; Wed, 1 Apr 2026 18:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	07bb0ELt+Dd0bv11fWezHEt7Xo1l1ORJ2ooxTs7cpp8=; b=pIW7B0RFrBpksz5A
	6HCXytsEoGce7IBWrkVhtD2cPqGD+q074/j527Q4yRneTqwVs8DfrvsWVn6bOkKv
	LwnPM1hR+0NBDLoDypDHik6Nu2pduCq3f6OTi9VFcZKlGLPNXXsvQ/Ashy4ay9H4
	xiFAZVkMM4u0+x4nuGVahVJDOiZQIRlTQBLQn0acbgf2tV9gYp3iAK1fI1e6K3Oj
	DxIVJ8yZuEIoMId7SUhtl1R8UT7hvRIhZ/mgViKEf26UVmXPm2Dd7wtdmfCCYv5b
	tvcc2odgQ5DM0YjEplkYWNfzcALu82hB/7a8I6WLimi5H4bDXdGbptykkWNUNt1x
	q59wCw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k98h38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 18:47:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50911c94db1so1109261cf.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 11:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775069252; x=1775674052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=07bb0ELt+Dd0bv11fWezHEt7Xo1l1ORJ2ooxTs7cpp8=;
        b=RENmrzWpQujYVgz8kDkiCkKZM7yeOU/uNc/TkOln9ZMYShir9Bc7nChOEsQ8N1uflS
         HnxUcKJjdbGY/KVzUhP8qFEtQvZbt/jkIs1HVpt/ZmZZkq2M6ecJum96bMhcM88YhjAZ
         r69bJZDLtz7Y15VItQgZGDgLJLZzKIFj1RpJOEk7jQk1GoyhGAs8w+UvHuPzKD+ymd+U
         UN9ZSQlXZAwpraQS/uRtlczlV7UAhwZ8uUBXLXa2FLUSvP/0QrkU2CWtfAA9k/MxGAeh
         j1h8Y21CH0oYc6FwhgL9MuMeaB/DVKO23OP5rT4eTCC/7x+DowO2Ng9+D7wXcEWbA4r7
         e6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775069252; x=1775674052;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=07bb0ELt+Dd0bv11fWezHEt7Xo1l1ORJ2ooxTs7cpp8=;
        b=EKGR3q//KZcfb1nOtqRxDAhZUeh6p6q3KBQNI9oOLH3diIgF7sWVIJ7LypvjWuLREg
         7Hnqxz+GaZtjwiM97Ndy3jhBXD8GxeGfdtqgAe1Bijw5jf+FZjuwUefm5po0HHK6Pl0E
         TKtuv5sEFeBbJM3tuxPzs0Ns+6gIWBwkZasF8YiyXNl6fvsq2VFElBYeSj9D0bNPC07I
         yArG3QgWdmJMvgETsW9FKR712+R/gl0LV48nUEbrlgnKn7QgIMWRN5OdWGDZmDGdtKgU
         EO4eOl8KgB0ioQvOv5J7bDbs8Uc9o9AYhZOrrNr12W2Wlza/Od1ux32SCgs/O1an8tUL
         2xHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC07TsapA6HlyOqa50Ccr0PJrUCKiHSr7C1fvjcNmcvyxbUpq5GtE9rqWmCa6ykctdKIFnDbXFc+459gCBqpTgn+45@vger.kernel.org
X-Gm-Message-State: AOJu0YygmMgBDYu77Upf5OAxQ9jEx++hW2I5a8DYONjbpj53Jr5F+jWo
	cViOsoT93iWyRp4NewSLYGNgNYJlVP4Ndwk1GrqzRtl2VvJhRSCw1k6cNhZefLYdiSesYeteuVM
	G3sQm4pfp1S+ezhYXw6k543Wb/gEmn3b8kMDN+Fn3KoF51bUr50257OqZ+m/pO+jzjPwkbQnenH
	cB
X-Gm-Gg: ATEYQzzwBxcj89iuqSjeurmp0eTI1gMqejOl6q83tdDJtrWQU2gLFPLjWStElASQg2j
	iBw5qF701eTCZ5P7ke0HlUFyslSlpSvZLxtWqkAD2xXmYTSOCHHOROhiJoNIEGoisnTqyZWfTh1
	Be0BhhLVMaOEaCgqxXWFk3t+ekWqZx7RLI71Zg6jbD4dSkBNFY8vOkF3ZtP3MeCvtWaES7B9rKX
	AJYD8NJRvStQ69ncoS3hqS9bmHdhnm2hfdpMnXX4zmJTfvTPGS+zgxepeXwRVcZWVmf943HXa36
	REVkWh63TTrNVHDW/LDj5fHoSfVh6cuf7ViVSv/VWyKukUD9ElShN3EOYSobFHOdC4lKN0DLTq1
	zc9wkTRbAiyaRdRMKUTCufzUwOgbTO29OwhmN8yjLi7yJng39C6mr/JoPZceh4yXNUmovwRa/OF
	8U+xVvG07Bmupf8dq5h3tKhhFvOHhjfKBnM/JE52zlqVIrSnYttxs5Ldjug3xmOv3cnjpr4v8xw
	aQMfJWBrJJbtCVc
X-Received: by 2002:a05:622a:19a0:b0:509:11c6:d689 with SMTP id d75a77b69052e-50d3bc21ef9mr66832841cf.25.1775069251669;
        Wed, 01 Apr 2026 11:47:31 -0700 (PDT)
X-Received: by 2002:a05:622a:19a0:b0:509:11c6:d689 with SMTP id d75a77b69052e-50d3bc21ef9mr66832381cf.25.1775069251226;
        Wed, 01 Apr 2026 11:47:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cad1350sm15268966b.28.2026.04.01.11.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 11:47:30 -0700 (PDT)
Message-ID: <d792efaf-590a-430c-8fba-2998360e54da@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 20:47:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v5 0/4] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe)
To: Marco Nenciarini <mnencia@kcore.it>, sakari.ailus@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com, djrscally@gmail.com,
        ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <b9b66e79-751b-476e-90e9-670ef44f131e@oss.qualcomm.com>
 <ac1SRO2nEt99IgBk@spark.kcore.it>
Content-Language: en-US, nl
In-Reply-To: <ac1SRO2nEt99IgBk@spark.kcore.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69cd6844 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=uiP3ok2nFBVsqEKrwggA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: vWuieNgz5Et09QS0jWrIp8sU8K10KAkT
X-Proofpoint-GUID: vWuieNgz5Et09QS0jWrIp8sU8K10KAkT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE3NiBTYWx0ZWRfXyAFxmT2xTGbx
 3Y2Lsv0ZIkPnF+DYQbs7Pio8xHozC+MoK9sQgG5MPhohw+0Ne8PN5Z6Ch78kFpc0Tyw1+CT8u5v
 bWvYMLiJ7MJJ2766BHqmoHagQgRV15/hAA5Ut4NpznVZ1Y/1rOUFGPVmM4CYINOgvk7QolXEf69
 zCRcAxACin7Wdq5KHnN+ySsHdJHIZ1kVR6LwT4iWUJFISgkKOExiMcVzGHMhY6OHPoN9bQpyO3y
 9JvuL8bUTQHQSWu6UDSPg582QxXlYV5zAt2+U2FBu56TTvGmFQhaq4vdfAySCh4Vw/eL1XvNWje
 RfXqA56f+QNxAUutDettV85vQ4Pti4d9ezQIMwNtSMwfhOSZB+jkkAGBNYsYVA1V46hpAA4YhMX
 60OaZaXvJWgrHlpcZG3y9G7lonRCEUc72VfFOkeSrrrkT5JbFBXqp/5yWbtHfSp0SRMYxyBZsWv
 UMiRwwzKpzo5onj+bVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010176

Hi,

On 1-Apr-26 19:13, Marco Nenciarini wrote:
> On 01-Apr-26 15:38, johannes.goede@oss.qualcomm.com wrote:
>> TL;DR: my proposal is:
>>
>> 1. Name the new LED classdev ir_flood[_led] including
>>    adding an "ir_flood" LED lookup with the sensor as
>>    consuming device of the LED.
>>
>> 2. Make v4l2-core turn the ir_flood on automatically while
>>    streaming, just like it does for a "privacy" LED currently
>>    (mostly re-using the existing privacy LED code).
>>
>> 3. If in the future userspace needs more fine-grained control
>>    at a ir_flood V4L2 menu control on the sensor with
>>    auto/on/off values, defaulting to auto which preserves
>>    the behavior from 2.
> 
> This plan sounds good to me.
> 
> I have a v8 ready that addresses your feedback on patch 4/4: the LED
> lookup is now always registered (for ir_flood too), removing the type
> parameter and the conditional switch-case. Shall I go ahead and send it?

Since Andy indicated he is ok with that approach, yes please
submit v8 and then this should be ready for merging.

Regards,

Hans


