Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66863A256C
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773412532; cv=none; b=CrdlaShkdl+WZdfwO7A6nvIeGPzMCVadeCVbUCdwAM2YCPfldp97jwd1cj25hkSBjWUjrXMU0cE7w/7QxPkjfiy0bLLq6SZzdvPb4Jv7dHbvFH+1g6Qvm9btZv6MxO2wwbIyR8YdnptsrBYm0PQ2CxKre0Pd39ZMgJUDvbp5BtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773412532; c=relaxed/simple;
	bh=ysdB1CrzT2L5xMyiu9xHBH8g1kis2t9xIpCDO0C9w9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnlcF30EU9uayR3IyN0u0oH+qgprobVU9fByLCgljH27f2ssXhHp4thuRDhfxuE25GJWgSJ4jMNiOvGvVM4zQTyUKXeXocYPruwUUqJwx263/oterEx8z7OgQHnVc43K7iigyNc+RrrvPB3BEhKBvNyowSVc9F0l329spb3lcKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dh2vqyvi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTnzhPmQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dh2vqyvi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTnzhPmQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DEZ0SK2262748
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 14:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lrkL30+tuhMiMEBI79DY7n07
	W+VCjm+o3Ml69LY7BKo=; b=Dh2vqyvi91uLQ//+xXFiwNVjhFR7uv8+L+pEHGdi
	ID+B04T0kDCdqTqlp6UQcChYD8Idfbmu77QNa7x3bz8G5CcoVCOYtuQv87iKgSLJ
	/5mOwli4+DKEy5NdjSXVl17SNSq7svH2ey8MkIEeMaw/i9BRgc/0Ub87NFjHzxOO
	dODa+No6IunZWtKKfw5wT4CtIm7Tk0X8/O6MGkD9xBrfbDpo5BGmTPIwSbZ9MWuZ
	Q7NeQx/yhXj2rdbJSwnaLgBLwJbOYcVcd0mvh0mAciczn0HtsK20kpKA1JQG3TJo
	JV8UI6psivo+kGAV7W6VkbWPPBd4005j8a4PO6OaXbe3yw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4sdy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 14:35:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb52a9c0eeso2133683485a.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 07:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773412529; x=1774017329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lrkL30+tuhMiMEBI79DY7n07W+VCjm+o3Ml69LY7BKo=;
        b=cTnzhPmQwPf3bwoBlXXK1lujgxpy0M61xSzYAshoHFGe61idENJW6zQSHy9e+EUIpL
         Te+i22mkTM9o/zXFXUq/of+H3FSvUet6wca9/Wwv9Ez1guY7xZT/F3oEQx2EWc90ZYqx
         0m9uktMfMqTXCUXKSPLP2E3NRPWLNrE1VQOhiF6cL/K+QOWfjpDg9DKkAjU1YhY9lqUX
         sRPkcl6YVpEFDN8MWjwwsSOcdVQMpvBNh4tit71DlDmNO6ps7rStk4eOFYiDeuVd1122
         ZsnvTfg+joWA7Aosmhnxmzx3MFcg1fFw2eisKzJqFTGTo5cNGU/pzK8P86VJzw1xoVxe
         aZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773412529; x=1774017329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrkL30+tuhMiMEBI79DY7n07W+VCjm+o3Ml69LY7BKo=;
        b=A5N89m4o3GoAhOGRyFLO1eKMs2jKaA+j9AfzrrsAluLFW1BiyCwquJUZC6HkMorwjm
         0v+enuChec1+z5AXM3KKDGRr5VctB6TlgnY4Ld+bLpoCoIiSc1o4CzAzSdWUJc+YYgwJ
         X6EaouBsK9pKpSIXFBFW6FDObFL9jZ8oLEZKtDAOk2Wj/CkjZye4uC9xvDNZ//FAwzBU
         P75pWS+7eASzZz5N8Q2H1ZOG8jW06igVLc9IqaLtxf5rR8MBDm0q4dePLRoKkkw6Sw/B
         wyvu8ksTcIydJMNGZlxXa95DurATVQ/PEyF9q0SvQzVYN3EBiWPlJbN8uH8Z2kQrM6e9
         JbKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMXRON6nBjn8tT4Z/WXkABy06x0mlaFPJJznF4nAiWaou0jJaOXvMM7HE4QXCvx981jgzGgznCQiOGPr3aovuiK2At@vger.kernel.org
X-Gm-Message-State: AOJu0YznezCsMtxT+NHF/8gAr3TvrAGL4iHKYgYGeu0KawTCoF89oNQB
	ReXIwd6/X70+Pgi4pRuxvH/v/bkI3KxjM4gfV1DYtFVrRDYF6hDEVmaNkmdhLTOkfBu7HO10Naq
	RAtqk8NDT/mZx6oi/7vcwkj/FgNrURgUpwjDfC2ytf2E1ut4pPauia9sSkDf3k0TrTShacIKaih
	Po
X-Gm-Gg: ATEYQzwtdeQlknugbYjmPqwHK0Zltn1Fn1tabedWscTHvqgGAuqFzN4U+IVVUVDKHzQ
	CEc4QwxGNpd4I0QyYAiILYbm2QHm16Ax4gdo/pdOStmbR4JZMzOoBHFDCCNxmUfHsZ2eL4pgfDx
	pZi5Iwi1dxc9l+mXUZOfVpYCKXxQEkGerNH0GOFt+OcvgjhBqmqpuR4j8001veScd1f9gR/AKtx
	SSBgGqCKHsZzDUFuLBmIkktQVRichqGDukvBb4Hfjb2iTmUxftsBIOrVKrupTLXEPOm+F7k4DDs
	hSFY4gz+1FD2HW/63EDd/WI/WgIqgssz5KLcAv4aK9H9+lSrs/6fY4l4MLd2lDuDtLdcEtugRYW
	JlQDnIRKA6XvQ8kbViGWWjsluoixa6l7EyktlB09r+tLOX7nOxN5BRYD74ohfyh9nY07h+DhLU8
	7UgsznEFl1cJ3j6CiNTZn8uph/rqUef2kUhG4=
X-Received: by 2002:a05:620a:2a09:b0:8ca:3c67:8925 with SMTP id af79cd13be357-8cdb5bae992mr467195285a.64.1773412526710;
        Fri, 13 Mar 2026 07:35:26 -0700 (PDT)
X-Received: by 2002:a05:620a:2a09:b0:8ca:3c67:8925 with SMTP id af79cd13be357-8cdb5bae992mr467177085a.64.1773412524205;
        Fri, 13 Mar 2026 07:35:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm1522091e87.61.2026.03.13.07.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:35:22 -0700 (PDT)
Date: Fri, 13 Mar 2026 16:35:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
Message-ID: <44xgivai4jqlc7f5xxe6yohzrqicb2sgso465xuip66n5tatqt@6cu2u4erpe5j>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: VpkJgaAxne2EaFdKKpZSLaOAR3CviZHI
X-Proofpoint-GUID: VpkJgaAxne2EaFdKKpZSLaOAR3CviZHI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExNiBTYWx0ZWRfX4d9XPR2qL4+g
 +2pLsU/8lpzcnSDhPCNB5beM74IrB9W+ASu25Xiqg5MrL7ivC0e4Tp6jkyPRK/cbEOHsijIOsZp
 PqyVLBnw/kV0bDRtvqCXwfh19Cc5zEIlQhm4g2gN+JBY3l4+KnGrR0GoaeFFVbyCsj0TOSM7+Wp
 V9LYBDkXZFfgiKphUWmUEyVlPZdOY9AZj1L4oUg7Z1QfmqPT631D/vsBUvL2chANBxHB8KcMMW6
 w0N4JCApqzK29BZkVZ6e2JE4RJliGcs+k+5Pk3pR8CrKRKZZdAT+asAPTsUb5ZbRIs3Fr1nkVr3
 jdtUJmutVi//bdcSA/XZLxGl8H6+w/5NwOD7pHHoP9XyJRUxutCzxpXL/6PvqaOmuL9wdiA8AQp
 9UNSkPSTZqm1vkaEMqxeKf7LRMoZNGP6L6IZev8WQz0to603193KSAsqRfRIcoxSfWLgY5qQUPs
 K9Nhgf5cgLW+4hPs3pw==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b420b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=ELDJdLTGsJI5jD7mVtcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130116

On Fri, Mar 13, 2026 at 03:59:52PM +0530, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the
> EC.
> 
> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  MAINTAINERS                            |   8 +
>  drivers/platform/arm64/Kconfig         |  12 +
>  drivers/platform/arm64/Makefile        |   1 +
>  drivers/platform/arm64/qcom-hamoa-ec.c | 468 +++++++++++++++++++++++++++++++++
>  4 files changed, 489 insertions(+)
> 
> --- /dev/null
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -0,0 +1,468 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
> + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.

Drop the year from Qualcomm copyright, please.

> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/thermal.h>

Please add <linux/slab.h> and <linux/interrupt.h>

With that and with the typo fixed,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
