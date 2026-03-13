Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765BC33A702
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773411243; cv=none; b=gqlQ060XkYDGcwN33p1ZJycyKwQ98HfNj3QZE3HPqvBKFCF3hvQp7S9nDt0tu71HdZ2A/gtKBzp06X0WZxvoaJsCYuHA9aOpQ3ZcX/x4On9X5lim1ij6SH4ynLpMTx2hhqG9eS+uofUfhrR+wwuFGptCP1SuIyLWiaeCa61tXz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773411243; c=relaxed/simple;
	bh=2Ax6mEoBmIIINq7jKCbWHwBPcWYjG4Z6TEjYdt9ZADA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmT4ap3M49rT1/K3/wwZbs4UTUNAYfEN7r7mPKnaHlJBxILjrWvjB0K2I5qMq5hWGli5GXV+rlZFbhDmM0XcmPYJDxI+W1NYyHCTjoR0zYZhou4QYaallRmkhrLR0yNEoe+iGPjxRmhpyCiyIjvRZk/4TWx0CM4jc4RURPcHcOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmOXagPF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frwlslwm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmOXagPF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frwlslwm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAsXdS529146
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 14:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6MkXKrmgHZEgqEUoaPglu+nEPsg2SnNw3eYI/5+7A20=; b=dmOXagPFgDc19zEQ
	I1ngbGcpsA/rJ3dxQEUqfQBGXf6KBmN8+/BQpNkn1RMkkguWcDF2UIUITYySjm4R
	TgJcDKkqBT7KbJz02P+SYgE119LxFikSH9C3z8FDpGGuZjs9lqN2Stg3OrpH2XxE
	UVklkl1aE1HQmd7Jc6XIw++fFs+uzwDfGPhrI8SLF3G7cpFoZ2wk5EF+0BhJhbk8
	6ar9FEVOw27OVbhPMd2Chwk8rmQr0ZwjNR9fQlHNOzgFgEwlHHoMSCtrdTStVk1D
	6uCsiSil4CaJGGpQMcwZ1Nk2mUR0PIGxH5xCsBLOBiuInsG8gAyDSjbMB1d4I28+
	sYmonA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh84rmcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 14:14:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aec784479cso84938055ad.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773411240; x=1774016040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6MkXKrmgHZEgqEUoaPglu+nEPsg2SnNw3eYI/5+7A20=;
        b=frwlslwm3ZlR0nJ/INtWnYB8PLFnX8NUWMoK7/4vjDmZTbgC7HYzY6O0onR7UwTk3b
         VOYLE4uAfLmsoTfBv0m08QahdE4BAFM8KblysNaIchc4i0IyUXUwf3lZfE9juOMo4iR1
         CwO21XZ3QGIOaJiCOMzqZEfwQxCtE5UMIewq6YBcuc1isJ59PsYtMkUr6YonAC30e2Cu
         qgA8WQAbjhIYydQ7cpAcEbjS/RSRTAwod8vPSo4s2EWx8DmTaSVqkmI2kVP5SfhugvFE
         +Oy5Cu537kdIvKc/KGIzBMa7nUzknjEmIhibDq5A9bVCAL7tNiAhbk1lmGe4p5RcCpkc
         sCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411240; x=1774016040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MkXKrmgHZEgqEUoaPglu+nEPsg2SnNw3eYI/5+7A20=;
        b=E/p6+WpCfq2czP9/omzKhRnvaKg9TS707sgqvhocHc8iF2ckjwhlIeQtrTOZ7FTvYC
         917Jd0fEAHOR+KUU2vlt235l/1VmjkQ4weX6dUuRCQe/UJGXEgx7kfA4JX019zJ9P16C
         kns6RUwRpo2cnVRHBYFRTQZ9+jYAQqJgLIgZIFCQ8J6n2lKoZAmqT4/QNfkD79w5luiD
         YlDfKLxCVyW9u75XUNjp6qJ88ltM+hajU1IGe0rk3V1TWIp5cXRnqudvpM59QiYX5tZZ
         QGV8fSE7j8MlWkVa8ZPbihMAculrQYKaYZsdF1IgmUsHbPLE+Ibwc+lDGJwojusOOx+4
         mTpw==
X-Forwarded-Encrypted: i=1; AJvYcCXnyhjNajHZGR7x6l6gdZPQnV55kGl/T7N2h77WUgV8BveYNbxUb0FT5lrFuFIiOaPNARr6ZV6+U+4+eAf/J/VD9Jxc@vger.kernel.org
X-Gm-Message-State: AOJu0YypTttufoYe9GmPgO0xidwVaHLpS+X08m1SXZqr0MKbf3OCUtyE
	j2QFGQJFhjGkHiBO6NumxzzZAcKgY/M1xqdHKZwj8Y5PL9Z7+Fp3TUKWd8M+f7YXlTXOTQalXiw
	6olWt9nYEc/APwOgfcRAHMS4NM3ACYVgthQ6BsD9OXnmQLOubOGW0C2sW0uZeNQb9krU3fNgQHY
	na
X-Gm-Gg: ATEYQzxG8O/gtUFFDp1ISL7BlZX+UgeSFyDNeIUGTBKzEiLmAsJgDf6kbvgagAK3wa+
	aZy4X80voEnKTP1qIQg1LB2YjPhoFG4lG7fSWgWva0w030GZZXFP/q35TDPgfAL81UyoUB1Oln3
	iWX+c5f0wAgR7i+Z3AJpsEvJoEB5FueB5x/hgCVY7FNQQBLelFmk2W50Cdb04rNa0Bo0Xn7f0Rf
	MWZ7JJBx4qBnxdHvxnDLP0FkoDAhF0Tiiy3BqAQ19hMC8GWfwm8OTiKafrqfDQy14fkJJXKtBJA
	1Lzc06L1/Q4ZzqB0PALPgYeJj6r1V4aq58QdGfhDk08Q7TEjFdsPfKRwHkUxR5UG5nZnlMxmNnO
	VF2XeH/grvKA8c/Df6V4LWJHp4gMb8aJIYnd3jKLgLw8=
X-Received: by 2002:a17:902:ffce:b0:2ae:d3fb:bc08 with SMTP id d9443c01a7336-2aed3fbbe29mr12260835ad.26.1773411240334;
        Fri, 13 Mar 2026 07:14:00 -0700 (PDT)
X-Received: by 2002:a17:902:ffce:b0:2ae:d3fb:bc08 with SMTP id d9443c01a7336-2aed3fbbe29mr12260555ad.26.1773411239885;
        Fri, 13 Mar 2026 07:13:59 -0700 (PDT)
Received: from [192.168.1.8] ([101.0.62.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56c2b9sm30155405ad.18.2026.03.13.07.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 07:13:59 -0700 (PDT)
Message-ID: <b734c3bd-c54e-4463-a93f-0a9b89f2d7d6@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 19:43:54 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
 <9241da21-6b02-434d-a746-6bccc25a335d@linaro.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <9241da21-6b02-434d-a746-6bccc25a335d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OMoqHCaB c=1 sm=1 tr=0 ts=69b41ba9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=EhmMhbG5NVnfTD3xWHIiWQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=kLZw7Tj2Bp1Qn3bclxgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExMyBTYWx0ZWRfX10sOuxZwlwn/
 eYsoCh4fUjieRfLA5i+cvO62hiY6SD8MDW7sukPS4MAIVE2P/XhKA/vKS0nTqmrQTrRmtNOsksD
 awVuulix+W//3xtG3tgk7qPPdLdqfnLadxxowUtcxdpJjNFUJF8OI23AG4+skpyIZBOj5xbczf8
 w9TPzm70h1Gp0EHm3yXcoP5w8loEe40a8jVjtPhF8TimdAH6/sH/93AvBz7oWtM2Ab0ZvHmdFzP
 nzyhqie1jyYuizXSdEG9XCYK0MLUi6X2iurGYh66i0nlGUBGDurSsVWufjf4sdybJzeVW8Ofheq
 34p12eEhnwU3jG/yG6H9lALbs0q63E5/ZAbsuG/8OS5sZiJ3EZFCYz6PJWwS58SowI/nzOjOJVB
 uStqAkHfrs/wUKvAvB3nZDrkmpD56jx69zVgz5zPyS1CBoTbXGJJY1+4jKKwZgFyc8hJC4rtAoh
 jewY7NO8aKTQn3X0DOA==
X-Proofpoint-ORIG-GUID: pZu3vnOusCMnuI88_-xG3qe4GUDrSXro
X-Proofpoint-GUID: pZu3vnOusCMnuI88_-xG3qe4GUDrSXro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130113



On 3/13/2026 5:47 PM, Bryan O'Donoghue wrote:
> On 13/03/2026 10:29, Anvesh Jain P wrote:
>> + * Read Response:
>> + *
>> ----------------------------------------------------------------------
>> + * | Offset    | Name        | Description                |
>> + *
>> ----------------------------------------------------------------------
>> + * | 0x00    | Byte count    | Number of bytes in response        |
>> + * |        |        | (exluding byte count)            |
> 
> Great to see this documented in the code.
> 
> Please run checkpatch and take heed of what it says.
> 
> 0002-platform-arm64-Add-driver-for-EC-found-on-Qualcomm-r.patch has no
> obvious style problems and is ready for submission.
> 0002-platform-arm64-Add-driver-for-EC-found-on-Qualcomm-r.patch:184:
> exluding ==> excluding, exuding
> 0002-platform-arm64-Add-driver-for-EC-found-on-Qualcomm-r.patch:224:
> exluding ==> excluding, exuding
> total: 0 errors, 0 warnings, 0 checks, 28 lines checked

Thanks for the review! Confirmed the typo — will fix both occurrences in
the next revision of the patch series.

> 
> ---
> bod

Best regards,
Anvesh
