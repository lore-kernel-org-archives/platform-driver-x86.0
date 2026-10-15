Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41383384CD4
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075750; cv=none; b=ihnAbKXH+0l8P1pPBirMSqcSf/XJLeXMwxDAp+rOPwRU6+mnEUH/E4Kv8z5ytwujwSeVddoPui/lkOs8ji8GiGWoMAlnQVTvgV0lcybNK1z0saZyaj0Ssu6UPouAlYH7yA7eB7XmjpflBepkuf7On8BwCHmdraMlVa0EcrWQgnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075750; c=relaxed/simple;
	bh=jHY2q4KRw1a+3cM8OlSYrnjimO30abUuFA2g+e/yfvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilpG2BlM76b6Ru3/vte+GhteJ3DjrWINtJnEUf6rFZHAm82TxR2ttiu47gA3vBCUuS+yRZl2S2XHbrP+RWv33W50UCSpgnpY15d8VGSGfE/w83J0y/ywkmoqRCKTPLmE475hLptASHSukElpXtcFI47yRmeUET3zijYwOR6DriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oMRaOIGh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvMxDlBE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oMRaOIGh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvMxDlBE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPfws4100228
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 14:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ieEJs/BWB4adN/CPzHmGs4+przVlyrjuLYc8uLfGhQ=; b=oMRaOIGh/vAinRbc
	IIWDc0kEgaACGgan4xoD6xDYDPm+RzNyOkkz7TM51hbBKbOjQb1ILunCf5VbMU27
	sN3FAVVmoaU2fOFriiMN9P8xIiwH1+4Y9aS5wKiivJnqDP4DCqna4Y5DFSeFwBrE
	DDap1AqxDjV7beRhj3x3TKUxJ69iCO5SlSeOdmwmwMuVvw0cv3bQpv8TsFzegaob
	0EeooP4PM2j4QnWeyPeHEgONSvsfeoTRusutVcLXzc+1W/e92f2IXJOdiPMA4RfB
	ieflyfGRnweFPpXbDoSXHKTShXQqHER1p6oR3LMDFxUOKwLoS5VGPpNLM0ld1lx/
	U2iKzw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r9126-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 14:49:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc19d8e59so65859885a.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 07:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075747; x=1792680547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ieEJs/BWB4adN/CPzHmGs4+przVlyrjuLYc8uLfGhQ=;
        b=KvMxDlBEGmP1aSNDlEzKZRI5ryvnlwJVwCNSHFWcuaC7ibn3t0l3a281057+KsfV/j
         OjDlH0q5DRmsNci+r7tWEL4mJLMrUi0a+KQUCUDLJwSAXhB7d6NR7CKKaIlQoqiLGjvq
         yS2bzpD2QqFs6oa1R0sZbp/IA9kGLq4ux4YEStJ7xVGhlEvyaP0+Knw/BrgJltoqM6Ws
         xQnrn4Y11qO6UWqK/O3lLIs0EBrltdjifM2fEc14g7pc+TYSqBaynL7jtIkuyRPYsPx7
         ktvGlrg0h04knHT3g16Ea8cT3FqvU2FZjqevvCabQ27Wa3b7vm0ljkB6XCr7CkSZbo1H
         1ZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075747; x=1792680547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ieEJs/BWB4adN/CPzHmGs4+przVlyrjuLYc8uLfGhQ=;
        b=j4JuwBcblcZSqZXDstu/KLma5nE32mhteKfVKRK8S6vrMy7lVFFyI98iE0ck2ob76E
         FeRjUKopDnFI6EdXJvnDBZ6j7VXM93lw8falEZY9m96edeqqgfNuNHaoVO3XU09SlwRU
         iYeZuYQ/cILBupo5+q+ErrGeeMRQ3R2nhrXucxDiR4pDJNDgz/O/BQWrpWqM459E8ZRX
         8OCoQJQKh56Xo7C4xz11KqRROh/izIvZOWz00On4NNR0ulaKchEMXzXv1LZdNru5JMpB
         oJ8EmRbBpQLZzI3phvUF7MZhxT2S9O1zBZ8YbgVSwOFtG3mXI9YjwZ3t86nOXLJAMDLP
         KCrA==
X-Forwarded-Encrypted: i=1; AKwUvBzA31yzmFBCca4+whsos+WNr6TromeW6+uX4ehAjSrOnhCrFCCTsJtbDCet8fRha80cZo2oUJoo21SPMpXCjeLVHUXF@vger.kernel.org
X-Gm-Message-State: AFq9FYJHEqN8MWTPiVOYACww8PdEuo9pvNz/42C+npvFzskst2rW7aKv
	oaM3KOo3wy7MInseGkmeSMwL/V25WG9TY4+GA5pkauiDk+XCmN/STgcDD+XTsjwN0FLgmFS4QpX
	jIt1e9YRIdnf67A63U1H9B5BQfIZ0NJDYAosBGA0zFjnebN49bA3HApFFcc/U2JBAmVoCCXXgxo
	RI
X-Gm-Gg: AYBFou3pD99o4xgF9JCNCUN3mnsnky9opDjP69CvxLXBdNkleqLnOuEYdEUuysfptUL
	tyf21WNSbkMjpVZhskXUS1beNx/gF5hVzPXrGBSOYwuBjgGkczbcLhkavyItX1MFwARs1NaDp5n
	z4w1KsmN5bDaAgURMvPTcZBE6wJcPS8xtOYXHho5a/csqdUBfoJ07gbvV2bXNV7JM/EVRF749HH
	FDlmnqumsLEDDc1xFd5H+qTzr/QUjnrXnkDCje07GW6RKKUXF6Jp92UFAXndxVeTnZirYPdRG5a
	gwaIO8lhIunbcVB0FlTg1q+Q8CYFMk2xGaYfCTl+muGYZwgOsICOqTBllxEgAp5w2jjiTuNtAwE
	LFSyBXwopjrZPys/ClTDJ2w==
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr842944085a.1.1792075747454;
        Thu, 15 Oct 2026 07:49:07 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr842938185a.1.1792075746898;
        Thu, 15 Oct 2026 07:49:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafdefdc4asm7442501fa.30.2026.10.15.07.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:49:04 -0700 (PDT)
Message-ID: <300889d8-cb0f-4939-9b67-c60d0b1499d3@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:49:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <179207449898.13793.6897763208667873901.b4-ty@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179207449898.13793.6897763208667873901.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX43Pu/bTJz/Et
 55lf0nTt8r0Hk60eKuUAUmudxvxB+LXN/BW0D6ALiLN/QWLWB0ITajrNpEYjM8iLGlzA7+tNjtr
 +gy+gYKcr1F2OiSPOlthlHXbrKgZmE4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX9tYOr5pAwAOH
 77+Gi4hDATpdJCYXUWhHfgwSFB1ZhbiaoWtu2HMfBu6iYdQgccjd5jYa1V2ejAnGDjFerMEZ7Bk
 9bbgQbkjpOiL90NDnDIiruX22a5+e6MwjFaLPPn2t4wCK/AArz8mPhA4YFbUTvtZycfxdHgeSMe
 w+qcqA0DyVfHkYYD2BpSnhklvJMVGz9rNGJY6wWoIck181sLcUyAAAMjIoxxM5f6/eVp8jDxc4X
 az5VO57GofZDVrT5BtRoA4V/oMbaplsq2YUBap8MvXisLZfo/VoFJthWI2zaeYvxBX+NSvRdKd0
 bvUVjgewku1jT8J09nVxdeL3f2eiImP/UKvxpk7zHY1LyJJfY2/fauFgtvxuDYmJb/+J3N3vBmm
 yXZM0Cr3cyTJJOMZmyKh6lTQDMWvkhPbFqbpayxWVl3KpoJ4BALXPpg5rmoO9clLeVO6V/cNlPB
 nls5Z/RRl47BNMovnjA==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0e7e4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=-rt_0zctJVaUuj_7EdMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: u6q88yrSDJxQSEm_iEBO0UhNKwXUahqN
X-Proofpoint-ORIG-GUID: u6q88yrSDJxQSEm_iEBO0UhNKwXUahqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

On 10/15/26 4:28 PM, Ilpo Järvinen wrote:
> On Tue, 06 Oct 2026 02:50:26 -0700, Gopikrishna Garmidi wrote:
> 
>> This series adds initial support for the Microsoft Surface Laptop 13.8"
>> 8th Edition. It's built on Mahua, the 12-core variant of Glymur with
>> cluster2 fused off.
>>
>> As on the Surface Laptop 7, the keyboard, fan and platform profile are
>> handled by the Surface Aggregator Module over UART. The rest of the
>> board is close to the Qualcomm reference design.
>>
>> [...]
> 
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
> 
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
> 
> The list of commits applied:
> [1/5] dt-bindings: arm: qcom: Document Microsoft Surface Laptop 8th Edition
>       (no commit info)
> [2/5] firmware: qcom: scm: Allow QSEECOM on Surface Laptop 8th Edition
>       (no commit info)
> [3/5] platform/surface: aggregator_registry: Add Surface Laptop 8th Edition
>       commit: e93536b1fcf775356b06ddc845461e64d4c87313
> [4/5] drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop 8th Ed.)
>       (no commit info)
> [5/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th Edition
>       (no commit info)

I'm hoping that's the tool acting up?

Konrad
