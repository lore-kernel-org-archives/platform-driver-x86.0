Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039C63EC82B
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 20:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109003; cv=none; b=LaiizLkGXadb1E5mO52iH7qU+EqYtkuPML9UIzukuYAWHQ24kXm8sYrwxY0iaS8wOBFmfGKBhjLZDUFA7rjGtyUbKHFnnmX98xNsqrSY8wQhmR6r+LTGfFJ6I++Ubmzvru17YqVYSkpVPPszNkCQL2lLjd2Mow7q3bBZyFYgkd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109003; c=relaxed/simple;
	bh=KGvbFC1xv3w/KWSmZCD1JwFEOhpO+TBAfm/srEiklcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+Ft5PEzC1qsCaKl8E18dl1q4M2tJtuVsVluZ6zrNu/DFB6XQyeHI9NMuDljn79qBowt/t+2vA1wXwWBWzFVclCn63xUsPZarlAsK0ezxmLhMQRZ3iGuu5Ij6/aWZWnFSYgA8LgjAqY9PJVS4DY/8lldVq+k1H3l7ApB2Z/glV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZ/MkQkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eD1eLA3h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZ/MkQkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eD1eLA3h"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6q9U178636
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 20:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aqW2GbHYraxyCydIIqan53+h
	l0kg0DAN9SKEJbCAd7w=; b=CZ/MkQkTQfdZ5U6/JpuGXfceYOre03ov/Srq9mu9
	iuJgNuC11vM4WHmNebyR+AsMhxc91nRvc6USQoi8pdOWwsYv5LKHA4oGMdsVrljJ
	1ZKky67J8CTKssjhdHpSvaTkWEPWvu+axOrlC8xmEyMbw76HS3cjovrriTkLrvs0
	FgUZL9BVqget0TfgKIiaCFb0VrbX4zNaBe2SHsKdYH4Ga3aWxnUrPJlqbf4BCwNq
	tDKyeBaSebx19PXQTh5lBTlTn+rXpX+i9ccC9hKxKMK1KIuxCcwqT9xVOyNqu3mm
	bWEsou/70a1HBLSggvxx965DN+mKZjIwHrKdl5KSIgn8Yg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec1xd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 20:29:41 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806535f8ffso1355636241.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 13:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108980; x=1790713780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aqW2GbHYraxyCydIIqan53+hl0kg0DAN9SKEJbCAd7w=;
        b=eD1eLA3hbrspA9Dc2eCGQPXGCwHm9drgV6t9e4PxS/0ff/oWQ86BJpnxfGxR0G8LMJ
         E6izVXrBX9ZFhsmplbAeVUakTSmUH50eb7Gi4CQ8dJCG0w+U4V5TlfOxJVjfjBbnmKyB
         xi+eciKl4C5tS2tQaN2wyahgsZZ3qsfPJTqBQm5TjbpuIAkrK56iQwPXcaTPOWVa3A6l
         o+k0pSsWw0MRu5FEUhqECAvTz2YFQlXJAIlw9QtT/ZbueeON4FEMmzmYgRb8nfL62/h8
         NdmGQnv3w7XRW9j9NeJMgSOCdiPXdtvQj+9ehodRcL+fiPzGo5Tw1iZk/3mSJGdGV6vm
         TfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108980; x=1790713780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqW2GbHYraxyCydIIqan53+hl0kg0DAN9SKEJbCAd7w=;
        b=kb7KgBl/tCDDHR6QEg9IEqWzOLU2ZwQVVt7P/AJCYJsaFwOMdCWzyGiv97hrSb37Bv
         NniEkd79bZe0Fl/c8FY+h2a7/g5xZ88G3T8ycB2VJiLNXCay3ELoRuP4cuo3KEk4Cdnv
         lYKtMdYPu/qldj87xpX2BesEJWF6ifFTpDb9tZ1tpy8HBcKulomon1NhpTofMwCEfACa
         idrtoKx9An0Dc+5meD4V0J7Yqcl9ddGKAG0WjUxnwtUqJrQW42VcFmD1X6Q4lQntf5St
         /vVnjyPn3Ot5xj2VuuF24PkaHx/Kabpkcur0zHkNfRR+sPJjb6YgroNmuSfW92Yn5qoT
         cbnA==
X-Forwarded-Encrypted: i=1; AKwUvBz5Pds1POiNOb6VA3CmMA8pOQxDzasP4g77SfxpigSDH8V0riDpgf3iQ+m6L8641nNAX/Vq3OFSo1009JQV1IagpdtU@vger.kernel.org
X-Gm-Message-State: AFuF++l4VquhHyCt9tDiGhN/8cbV+LdtQA0wZXjfNg3FxE3IXxjV1Fhn
	jXnDYfKdoCDgxC9L4H2dTyi7onR9Q9kQSb4hXXmjijGI7hVsNsKHT4muEevFMmlzm/Bel9eUCH5
	qRUncxxtciclKRY8kdz19GubH/jsT609lBFea46Smm4JTOh4zfo6IteEqdCK2PAljtFxlYgQxzw
	hO
X-Gm-Gg: AYBFou3Gb5lJtU/tiCFX4Q4UmMv1KpL6Gj4IryVdYmOPHGTHwPqwGO8eXZl5NYVHNQ3
	UTYuZNP6PRt4d5a7BSsmhhkctFS4m3aBZ9Ibh3tVjtMIVZSg+HeU5r3RPeTiKbPZSiCnGeiEChU
	DsyyuyHnnLJCkZc9bLcOOAHTRfkZyekcXR2RtbIfSkcL8M4EumU379DwOvmxSf/BnURXpv7N8F1
	+nBFLOEKxq7yB0Xt7jydvuaiYAO8RTfR3fChl5NgLfzvJTkDTydhqVc7drI5hmF7nU8n1Jm3yQj
	V60zowqzEkV8EtEedLVTf3QAJXK5FBi42kngQo2raxRO+Y2QPSPUhnEC37byMbE3M8Vrx6bHLLh
	dNKbroCICaa1RuA==
X-Received: by 2002:a67:e001:0:20b0:736:f95c:4bd4 with SMTP id ada2fe7eead31-7aa9df8eee6mr3852494137.6.1790108979927;
        Tue, 22 Sep 2026 13:29:39 -0700 (PDT)
X-Received: by 2002:a67:e001:0:20b0:736:f95c:4bd4 with SMTP id ada2fe7eead31-7aa9df8eee6mr3852482137.6.1790108979423;
        Tue, 22 Sep 2026 13:29:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm1029351f8f.0.2026.09.22.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:29:38 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:29:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add
 the embedded controller
Message-ID: <2bk74z5ukyuzddmxhacm5lvdpxtlmd2jz44tz7dyjlu2zuyzqa@vw5k7lmxh7dq>
References: <20260922165737.260443-1-okerixx@gmail.com>
 <20260922165737.260443-4-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922165737.260443-4-okerixx@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX+EJNpAcJFvNr
 ELpKYW51IhWGGolBxLF8r4Ug42EEsyzyjNwksiXFicivQIrdcWJ/8cGa1x9fZBj43wPXQzzUkFD
 1cBpBYkzP/vt6ysc97ArDGbPfOkaPm9DklQwKuCOIqaH9PJYX2o2AvWO1UeOmo0l/edHT3N1BUR
 iFm/KBH6OKo+zom9bsZXRugvz/hAu6x/h1z/sim3o8yOXfWrXJGqDZ311UA4JYdxPbwDCe+KkYi
 /YsOzd9ehCbiCCATFfu8Ii9vftbLklW9CGVWygS9dk7CdZ4rIgaht15beKvqePOtvWUs2JfIXWg
 G/Mmtl8wTvTC3s1+PKZh39vlE860KnENWCVHumSbugOgmoWjpJ7MALg6+xyuVLs4Rs4nufQDs+w
 3GyCTBksy3Plttx6DE9ne5vVvevp847YtZu+ZP0XQ4498LoIEvHBOGzOd/YMV6teJUiehLyrmV9
 A1OSOg4opvive+F+DPg==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2e535 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cXQzEVsWzZF_LJZYrIMA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: iJoTTAW6F2w9wBxeG8UZHLcac3ervGc_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX9qrAvdi8kKog
 QZluoAsjFGrm1wymEIXVfN5I5KO4+GncCPuVORPohTwHDY+RaFHU9ys352NzabYqqUkgTuBfkny
 nJ63s+6BzZZ0OmxJrTe7VNFop2oRUUk=
X-Proofpoint-ORIG-GUID: iJoTTAW6F2w9wBxeG8UZHLcac3ervGc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

On 26-09-22 18:57:37, Oleg Keri wrote:
> Describe the Compal embedded controller on I2C at address 0x70. It
> provides the board thermistors, the battery cell voltages and the CPU fan
> speed, and drives the keyboard backlight. Its interrupt line is TLMM
> gpio66, falling edge, for which the file already carries a pin state.
> 
> That state leaves the pin without a bias. gpio66 has no external pull
> and floats when the EC is not driving it, which shows up as a steady
> stream of spurious edges; the vendor ACPI tables describe the same pin
> as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
