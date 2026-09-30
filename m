Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD69750C287
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 14:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778238; cv=none; b=Fq48AzoFdHD3h4jYeNtPJHkazFtla/YEzHBW/4A07KMrSxbkcZYTFBkmLGhkGT54H7r60sFk40NDcDTmmB+/RrW5wM9UataOOU7FLbUUxCTQLF1+/J3ZL50l60lU42G1W3N8sA8USfryCxCpCJThnDsRKoxEHSOVH/oi9kfcbss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778238; c=relaxed/simple;
	bh=ljNGBp4IFC5/vH2B1soisqS2RsIGB88Aj7oUyA6gHH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rH5vpuMbtRu4DhCwCxBPlE6Mr5MLM9uO5H8a/y80GfDREXnU+50wwM7Rtnl0EuIR7VwMhJnR2d9inuxWbKu4ILBiWb+zMJLtcDrRVIJFBO36N5IxQGZ7DbXiD9NctaAIZej590hipZlm34Qnf8ZTUPzrKB5YpRXgAmsquLvD5NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7tTdA3m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ksQhpyC1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7tTdA3m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ksQhpyC1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE04cN2970762
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 14:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=It/I7bqJvS/GZFBfLizAbt75
	7ur5ymNP07ts+oGXT5M=; b=c7tTdA3mD/CnWZ9IGSeWLodmuO3veRo1jHRv4RSk
	sOllNiw3AkPJMayA+GVn6H2QbYnv4wxklLiu3HSxFe/EK4KbsmEh0ODO+w43h7Hy
	kj8jRXgu4of2rqHzs8gy7d/JT61Oj0vkwO/9G2PDdY5vrIbSzZqpYqYatX27r7LS
	qy7tlrOhYfnosxRtqK37axr21WoK0O/+y6rK8ykIvS5i4A6FSU3V90EausW9R96N
	wB+XPmYcGHahP7ss1E7z9z4OB0Nx2S129ttNQ43j67atedhWVShVQBG9hZmpwHLW
	WX8h/TkSk6DTF8wwLTirNgK+tSJug6JRmg2ce6r4p54dSw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhek8ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 14:23:33 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-986ea272f77so417317241.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 07:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790778212; x=1791383012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=It/I7bqJvS/GZFBfLizAbt757ur5ymNP07ts+oGXT5M=;
        b=ksQhpyC1ZD2uW6u4FL8ws/28WG1n0DGOqrlrlD7yfI0XCQbwPI3FC17ybH1mgaOwXT
         /EKjQbh5nbFuUEQ9FZR2RG9aHoHmAUSQomf7zdlaIUR5AsqzkafOpkHLehww1PHK5bEB
         0eSW3MGzN/6gnBGrh1v8SIkETR0yQ/TyJ3kYQOkj5eNZkAVnwydZg5KDCQVl7VRGCx+O
         1upRlpWvcr3l81hRJQK/uF0lOISWB2fdeueihahD8ZhTmIIMwrp+9zn+sErLR//p6TO8
         itPKYqsKOVMP2Ar20BYpehwxNwy8fHwcfFUxMKSDltoytGQsK4URWCqIR9cXkkER0gWt
         bSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778212; x=1791383012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=It/I7bqJvS/GZFBfLizAbt757ur5ymNP07ts+oGXT5M=;
        b=smk+vO1VY7IMXfkGYcMaVzcjVv8IgzLZrihTVEB/uNf3k2SXbQ/UWJY9BDQgMsgGi/
         1E0p8cgAA+34TGHVw6MPCZyTJui8GJtqysJWTB0IUliuW7ENhXdABjPqRtPzBM8Z4US/
         eSOYohl9TMNJb0PChXaXF7lxfsD78dlVkzwZ9q7rEh2Zs80yg68P5cqwbGgUB8Nm91fT
         0Lu5dgtqX9ftWztP+t9hQmWTYuRYvaIHQEtrLWu3V4kcoTGilJwLPz250H3PyOjmg37w
         lU326BVn436MfrV0OAd84TaSG9q5WcWhPjqgO693c13yFpAgGIDHOlR7/lz0v2L7nT4l
         +lVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfz5i3dsgvbr40UfyFRHuTDZ8zh9VQhwmsyrZi8t0lw9BpQs+e2PcItg31CAj4HUodGxJxXILcpqG/oJmSw5F9lYar@vger.kernel.org
X-Gm-Message-State: AFq9FYLAPgyqPRgC0z/0v6UT5L3eVQE0eys8NSxeb8+BN63slBc0birh
	F88AGmEm3cE/sTASQZ3GJdmohqrId71w6bu82UL1oPAT1m7Rt/Oe05K1wAXWBwkVzLnslrflyXM
	eCupKb6+7TCSXBH7a6fWkRwfWg3ySTWNe9V8DqRHQF2TPuDqMToHFFqUnPd5LBwgnTltbUxrWsx
	pU
X-Gm-Gg: AYBFou0jSMxkE+054Gg5GzGArldRlXxnevHaSKrqjDuhOKOPdNW0x7yUief4qjN5HDV
	JgdquxnKv2VuzC9izEilBusXWjx93EQ0+MO83v/rMKs03mSojgUWxYehs+PwRuSSm3miaVQwYo0
	wFIn4brzZfvD6QNcYYKedCT1ycF+qfLheDIrIsgEwxfmbnA02VRS5gUQp2BRavYPDW9r859fj1e
	KBol5xD3FWjMqfwg2RFGaRZPq+WOj3iDWu6snBbcpZ+PIZkwFKYti2cHqeWuLEs4MIMU/ZSIOwC
	7di5w379hyqj8L1FghhYKLL0QButpPlEMTfKRoNEgVg5guVd8uwCfAJkYO6WzHs2v3AYTf4zKR0
	9398sIAjNrgzI+Zo=
X-Received: by 2002:a05:6102:942:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7be72cb250cmr274241137.20.1790778212343;
        Wed, 30 Sep 2026 07:23:32 -0700 (PDT)
X-Received: by 2002:a05:6102:942:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7be72cb250cmr274233137.20.1790778211869;
        Wed, 30 Sep 2026 07:23:31 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e657287sm3171965e9.7.2026.09.30.07.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:23:31 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:23:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/arm64: qcom-hamoa-ec: Disable the SCI IRQ
 during suspend
Message-ID: <p4dagzkkmltv2e3uckgndnxmbp6tq4twt6vb6akd4dumyuhusp@kukxl673zmjp>
References: <20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com>
X-Proofpoint-GUID: DQH_nCmyhIwTgLwkFqbA_MsVCk6nK7YE
X-Proofpoint-ORIG-GUID: DQH_nCmyhIwTgLwkFqbA_MsVCk6nK7YE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfXzwysz7fm71Oz
 cfuEaW+245AuenkhKaBEJDCz6SPbv2DEge1aOdpY67kXhObUI3v58q2OGpb1e1Rv0b2pRlAs4nL
 VUqbP+LlnvVJmQLmC3bbYsSCEZxycHlDMaXbYNIh8RkF3F1JGXnSCNyp/RbsgZaoKfLHUJbZQhX
 jL1gaEvoA9WQm9hYAt+TBUr/YzEI4kIZ0aBXueqR2UPq5GwNyPJKx1qoCX7CSEOjNrvzZNiLE3c
 cP/HRnw9/PTIibHOcda0kk0YrCJ8ImEFGuMeqlBEQrzrbDwdXXVuIGt3Q/df78L/EoTkQ2a3NfM
 y056A0aXqWccLuLWOwSBYFxkmPOn3sQqbv8SFNH5tioYruutcmWG/zMKIyQ36BAlVf9as1qmDbw
 Wjb2kdEQbt6zNh8Y1Q/9NMs7dqWvR3s824jalbqRTbWLjfdKvQWkrmP7r8mgR/RHYREmWVYa7uB
 aHEKHVMVw9aWHmVEpiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfX4P7GvJgOrIvt
 mNV2F2i6qzNAiUTIfCpYWXEOHCCO58E8t9w3JElEzld6v4EX4k6r8W2J+yV5idXZOcmi5reyP4W
 oFNAqcNtE3HndE8CoEpu+s0I8cxhS6E=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abd1b65 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ga34Rj3xoGKA-2XpnBgA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300057

On 26-09-30 17:18:36, Abel Vesa wrote:
> EC SCI events require I2C transfers to retrieve the event information.
> During system resume, an SCI interrupt can be delivered before the I2C
> controller is ready to handle transfers, resulting in failed event reads:
> 
>   geni_i2c a84000.i2c: error turning SE resources:-13
>   qcom-hamoa-ec 3-0076: Failed to read EC SCI Event: -13
> 
> Keep SCI interrupt handling disabled across system sleep so that EC
> events are processed only while the I2C controller is available. This
> prevents event reads from racing with the controller's suspend and
> resume transitions.
> 
> Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Urgh, messed up the Subject line.

Will fix it in v2.
