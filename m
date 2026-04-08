Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905AA396B8B
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Apr 2026 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640462; cv=none; b=GAk/uxHIy1gSxaatw5IL/ZIv2TYVzbGLYQfbqI2zMiZBsK+blxcjyon9TC4LgTQufrhH9jEvXZhG5V+8DhYzrC67+y1lhduTeFH5jT1SfXvWJ9vuNagPAe8pwXeEsE7Dwqm0N4rk6errlN7FlHwZVKLSLpJpi7+FXDwROI+9wBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640462; c=relaxed/simple;
	bh=CX5oI2pqEyh9d3ryopeYurnSMROrTwXOKqM3hBZlf5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0kWQj96YQnJ8DPtL7xPeaN2QbqCKiiMxlOp8dh7YlP9xGkEJn14dm+zJoTefyngaTEjl3qKwWqFWczotwE5jh3u3RdYPWa9YrfE+++gTjx3xZ3zxkcrjowt/z9fzXoLJQc1k4e32KJC77Aj1tmSzk7FpgzjMcjL4OUn3BNbEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkZ0ZVON; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQG2dEJj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkZ0ZVON";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQG2dEJj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385ekX81005869
	for <platform-driver-x86@vger.kernel.org>; Wed, 8 Apr 2026 09:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DE4TNUFeuSxLnD3IWqfbxFv3UkmD/RAoJtWjT7snpcs=; b=fkZ0ZVONVJpl8dZL
	Uc6bqguJWU12pzJ80JI++gkVZq0I5OrHsXzZalT0faDWok4Lx8y1YXK1OLb6bZ47
	SXmPJBZlnJEydP5Oe3c6l549cFPGOuOymc/Xu5z+nS+nIDW5t0tnONWmyt9FKTBn
	61ZQRf+xOvkyF8ZdWLsXVnzU/5YUfs7u5VZgHwgxUB4l+yi+aq7A64RWybjcilFS
	29M6cpScnczJL0L+67d11fRh3siVO/7s68gzw+Trpnv89WyiQ1PQ72yKWz3HjgL0
	MzzmDlLJF/4bTO45j/PLv5ug3Ltp37Ijh7+FDNMjJglGLj5y++5aKPg3L1HV7WCI
	uz7uMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tpajqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 08 Apr 2026 09:27:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfd003bfe2so153746985a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Apr 2026 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640460; x=1776245260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DE4TNUFeuSxLnD3IWqfbxFv3UkmD/RAoJtWjT7snpcs=;
        b=HQG2dEJjN5p/LPNNOXj3rhnlorWH++QkmzeKUz3tzh9oz3wlxfwoF18g3Lszil3x0m
         WhDnvlMJDIKny+gqltsbR2k7dRB0bkRFQgHclIBiXZKg+E2P7uc7JVMv2pleqlBIorhd
         SESyo+QGYDHME2rwYeTXMqUtySgU4kWl0TIw+b8Ws0y883l4KQ+p/znUMI+AX0T84oqb
         rlNV/FP7nb/NJsg1rItC/Jwm679dpsx7bJKmeD+Tg2Tb07bNNHbHkTf/dr89YuDdg+yq
         pDIQsaaHFdYO9X/tQoW5ZFV3bpBdYTkjlND+HxIR9o63T4nv3s6XoxGCv9WM00Zk2EtE
         dGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640460; x=1776245260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DE4TNUFeuSxLnD3IWqfbxFv3UkmD/RAoJtWjT7snpcs=;
        b=VoLj941rxn4Tx0b2czCBhazAsalBpfhRc4nOyf36Zv5101zG3x4yiQUU7PbFLWUMlz
         /GT7cEb/O1Sl+8g0zckk0NlOexzQI0eH7iKWFJvp76Ta9BJuuScprZruF5VXEM0iVoYR
         8RIPXtf92Yxe40cpOdGBCUuvNGXwP60lVsYalztwNtEDlVnGB2JGRpM7tKlR5vtRNhq8
         RAPy77yluK4LvsjYVx3XwbTqWfvIJCQw3F9n5chRuWBvEY9HqDypJDM4egMQp2vClZqu
         IYXGKSWSgwjZFhJp3zSzcdwxQSkzow0frh6p4z1urvqeilVwzNLGlLAxEyK51KZgJh+a
         80Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWbnyYtDwORpY/uHXESS/5ScIRfMZ4OGDKHry74Pbx7uwsIoKLYLL/qQMLwP6Q1OtneUNOUNCwWJK9Bmh8SsICahymv@vger.kernel.org
X-Gm-Message-State: AOJu0YwSf4mtU/83h34uEYZxGBhoxOXF5KE0/trFJkyrelxCJKlQ/t+G
	yOU4iGGpRL46TRrIsipEtN4VrjU1mLIN5LA880mFKZT+yHhi+XYPVbSRsSXMdr/pSmLK2XxCOd4
	n7VQ87TneSnIUOy5LpdDzQ2zSTPR4N4OKkhUGTNbWAUcXy5utrO9Y1KIJDGsZ3Gh2PdBlGg9qd1
	7/
X-Gm-Gg: AeBDieuCwKjk6R2PVgf6GkC2qjbbTk0+q2FonnZnD++REkgS31+LC1t4ckCEOrfov+M
	7712Fowasc2oVMLzI/5CV6Fg08FOZEbcXKLZa7ECyAInFQ/zPPSDxK0+WXDKeYv6rtwwsydkoFk
	bcQL/jwgj2A6vQ28QvuBGNSwLaQwd3NsntkrJ1Qk7u2E80RRp0hCJxRLCfZA9G6Y7okzDigjbml
	j0gbC7QRfZgyG3LADreY72kMFmlf4Q8B0x3cNhjOaaJ1Atq9uHGo6k5RRMTVuAdmoaJ8myrXW7H
	CDiwvBsv0hgkvQJFISq252H6q8xSjvNv559xKC9XbisC3PI00G3TwmCY4epfnBsPipSi9e4jCSc
	JXfN9RBtnYa61CZgnCmBpgGzYTMRwYXxa1QRdT0A9kVtOP9t+u5DXgNSOuw2HBgtv3qU5uexB4f
	+hTac=
X-Received: by 2002:a05:622a:1814:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50db003635emr32335661cf.1.1775640459870;
        Wed, 08 Apr 2026 02:27:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1814:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50db003635emr32335441cf.1.1775640459351;
        Wed, 08 Apr 2026 02:27:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034b9284sm5202505a12.22.2026.04.08.02.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:27:37 -0700 (PDT)
Message-ID: <f07c3b39-da9a-46b6-827c-c8287916ea61@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:27:34 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: hamoa-pmics: define VADC for
 pmk8550
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6asorVr_uWE7BPNMJnmXtCNUCG8Jrn-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NiBTYWx0ZWRfX64/KJjFY3V7l
 Elh9TOYlo6u96FMoaB0Wp+D8mC25ajdqKJxXLUHEJD6jIhmB9dvkWEzdE7bLQ+CrdSUrcPLGGZp
 g+LKCCyzuyXxR7JIuMDTE3UFQdGlLX4CSh7xXo0NxY1LrCEkd9rbmM6gzNiSp1dU+AlzD8wf686
 3dtw0IEGO50GT95bUPVuQgT1xAPCnjLRLzrsmuuW8flrly8pE9Ni/2BfS5jtloGKz5wjBoeRtKL
 Anv3sb2RU9GnCFZTj8E/AKTo1IcgKlvOJrJujlF5/+VuyO4DGxoolqk6Dxj9B9KduvkhCySnYTU
 R98pN4iJB4W4DfwXtrXepFQUUNqek0+ZEBqrkMLn93zyN8B65oJQHc7hH4R+FkYsO2PFtlYKrf5
 YffBQ+LTRhWmrB2UjPIb67RnXhyKjWlW/fEgjwFspbZsvo5nlD29uy9QTB1HQndw+CoxjaovUzJ
 RhuGEKnbLrtNlDBJUDA==
X-Proofpoint-ORIG-GUID: 6asorVr_uWE7BPNMJnmXtCNUCG8Jrn-2
X-Authority-Analysis: v=2.4 cv=DNS/JSNb c=1 sm=1 tr=0 ts=69d61f8c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8 a=cmy2-XsDip5EG_5K_9YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080086

On 4/4/26 2:55 PM, Aleksandrs Vinarskis wrote:
> Follow pattern of pmk8350 to add missing pmk8550 VADC to hamoa.
> Register address of 0x9000 matches example schema for spmi-adc5-gen3.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
