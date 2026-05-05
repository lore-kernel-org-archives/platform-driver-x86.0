Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A02030C632
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2026 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971045; cv=none; b=qVl0Vv+OtFg+KAM5ZMCb7tXgagzsFcuMeXzgUHRwTsDlTQSt9p8KBrQ8bsnhpwNvFnBEE+RILjmq6NV6FF3py+2/LIycsCh/3QJ2GuLYt2MpnPRxYOB7eXzmbxMMJeBf9mb5oqq6+E8XWgO4+RNrwFFXO4AQ/qM8DRE2wjIYupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971045; c=relaxed/simple;
	bh=i37QpySTXDN+f+oGxfnXL9fZwnp8eDtIrlsvwm3o154=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAEPWJktMIiJBwMnmUYSn2ZiXeWeOwFr9OuKHQDHA6VQvE+052tjmbfY1I/MdTe1jPgXAf8fD2+EhwPrgraPpm+NYZFjklQqc/W55rnDYl5foZJBrPY9yCYSTlB+R0Q0YZC4r2DJDsiwd919GR3vC1nO2U+fFmAZs8/6WKXPAL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NThL7KMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7gevnKo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NThL7KMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7gevnKo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64501p3E1346212
	for <platform-driver-x86@vger.kernel.org>; Tue, 5 May 2026 08:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GP7hjgNeht0PXb3HALEPuiDTwHioIWVs+PL2ysCZ8y0=; b=NThL7KMREA7KiB7A
	ZVCMwy+PH/dgestyF7whZBs7H2AvChlLme3odZT1Nk2Ccy7zW1gXj0mOY4m2KNog
	yG3bhf87R/xnm1bJ9+GqC5SN9lDFSPO3hOSMUNMCuroMQPb4Xvb9cW2qNUQmTX5s
	QejqOeVYDRzC0DejR8wz57Lq/D6H55/VUjrwzBkg9+J6vedo+B0/tPsz9FAQmoYA
	dXHg1GShDUNUvWxbpA8cIC2+NW3RCNr4URZ7tEmfkZxN6++kOjnntaUMu6n6MWkC
	CBHSNNDqLIClwONHy2jeBz+77Xcf/NW8pSuwrd1IVObLUbjP6Wx/aVgkV/m7Ywax
	Vc6Izw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xb6xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2026 08:50:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad5fec175so68414185ad.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2026 01:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777971043; x=1778575843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GP7hjgNeht0PXb3HALEPuiDTwHioIWVs+PL2ysCZ8y0=;
        b=a7gevnKoS2xGMElroUVwMebNFszhppbvHWpc4c+MQ68r1Fv2kZ11cFM/IkdXwQnkkF
         bUtj+WS9krLqxgSbPj7sSFWDpmKornpe4B5JZaLDYUDViG2o1rDYWWVStHTkLAzX6Uik
         vsPN1HWTJkhXdwAhgfdd5HIRI/PEWYSYQVcvuyPQhbTjaAb5Xu4ddjAlm8Qg/6h3JLq8
         amN4z1SJRPlbm8u0Ts1saYiwBKhu8s6msT0ZprI4JEZv/HaDxtz0fIN5YLrUkumr8Q1l
         nmo9fiBz8lnjGp+cdfovv5jd2qzEqim0HFFpcyCvRvTBdeCf8EDyC9c/ReFuiJtQ0HOx
         Y/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971043; x=1778575843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GP7hjgNeht0PXb3HALEPuiDTwHioIWVs+PL2ysCZ8y0=;
        b=CNcNGMU/nxwQspAspvqZqbtY/3ZOOY0YJOvYs3GuhXsZRpyJetUGT2e/mmvRG9vRNW
         bVYFMKNYTDtZEjqkBh8FqYiSi7rhbJBxjy3bhTaBjZFnroZucosSyjaN9DaaZ/Vhc6s/
         u4ee+gGDEYbPFnSTFT7PwzkQe9A7DF7jqNOrUDJsCcrYcFUR9GxQqGp56lGjRlDsPJk1
         Gg+LcvnjxiJje8k9xaTlSVtZfQYSDzICpMGwueiR026nNllrrsNWf0sBoWy4aPl768CH
         NiNHeIEc6tnWrCQw+jeD5JeXpNv5wGauHcijGclxWzoVCQPBWjNsf+lyY/e+VjnHAREP
         al2g==
X-Forwarded-Encrypted: i=1; AFNElJ/CHkVX7lBScw1p1xSOXtewfRFps7AXGUmXS07YP+1/1swKrUZHjqXlXCuclOn62VbKa6u7ZzVwxsTcfVSNdzbTyoka@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf6dKUIt8H2Tl9QBCPvCVK6tT9mgBiVAx0KKFNw/FWv7LMz6GE
	mC9V40fnQ4cfJEq69glFT27vJsqeNSlIsTNeitigvMpntC2Fkpn+MnU6f4rp4JHGZ0bIlnV7s39
	u25luGz5uOAngssY/2hHd39GrQfzEh7AUlJdtD78vHZDMhQm4ceuWdnOInykW2DXbty7ino7aYK
	ig
X-Gm-Gg: AeBDietZHVLZBhm+CqlZ2mF8Dl9Xx4ChGxWiDT0LutoH61bO0INXFK5aTGu1QyGtWLX
	NGij2bgK9C+buHQKFybwPQmqCOIgU8ohpTDo8fkJdNgAhSG2SRXIbakyVXbig49+mMS6UV0W5WS
	3I9tYFZieCPFcszBoIJlPAPySTHGSr352FgPfU5Y+RSDyJLeD01ZM9nhimvpI+slzAByko3tmJO
	+vS5ifF2YMJbcBbPsWx8z4HAhsCm5eldhty6XQwkbdyi346TqhoMMkNmL/wJPfUyfyFTKxvcto1
	vpSZwIuMPPTA+CI/XuKcEStB0dEJY4wF6wfyVM81l5S4IRfhbGtrPFHoVOY5L1QBgrF7FsutASa
	wz9WqxscS8+l3DlEPZLJIBjNUZeAbsRh7QQEQwujEToV9IdhkQOlI5TQpNGZYkVlx
X-Received: by 2002:a17:902:da8f:b0:2ba:4e84:966 with SMTP id d9443c01a7336-2ba4e840b0cmr28477905ad.36.1777971042669;
        Tue, 05 May 2026 01:50:42 -0700 (PDT)
X-Received: by 2002:a17:902:da8f:b0:2ba:4e84:966 with SMTP id d9443c01a7336-2ba4e840b0cmr28477665ad.36.1777971042167;
        Tue, 05 May 2026 01:50:42 -0700 (PDT)
Received: from [192.168.31.121] ([152.57.125.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba10340c10sm72627015ad.61.2026.05.05.01.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 01:50:41 -0700 (PDT)
Message-ID: <1f1a248f-e0a6-4ea7-a789-129f49d6a496@oss.qualcomm.com>
Date: Tue, 5 May 2026 14:20:29 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
 <20260427-add-driver-for-ec-v8-2-702f74e495f7@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-2-702f74e495f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f9af63 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=qTiEgzr2dJYvHxgVP9Ob5g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=fNIx6OEFrv6duaKcIe0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-ORIG-GUID: qPf7pSpTNjyt5fiHTFllGusmoKepUwqi
X-Proofpoint-GUID: qPf7pSpTNjyt5fiHTFllGusmoKepUwqi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4MiBTYWx0ZWRfXxk5/PG5Fp0ro
 7X66nBR2fO/ldk5qUg8Lb+30ZksRweVyPVE9AnxNME6uNKV9HfZ9u/YOkxUPDu9Sfj5di6rUhMl
 qYHBemIt0eWS3PYhxhSo/IJ9XRMEIvvZcKYJDwD4GpQhA97BBynfZjxI+KvT6TpSHxVVfZEuY/o
 AEGuwhrXzmUDJ0the598GZbnoVQJ4TAhlV1lnlBaxD6HvROlkxpkywbUubYLmTxv2reDYk0/1AK
 +RItSqrARIUXs57abR9xCzePHFfrDCaBOG5W+wvugydNoNgdVyqYYgr/Re3TmC+aXsUalh3PRqB
 KChCJ2OmcRlN+OaUQa5tddnCyLCWCERoz7TssH4rTXSAgqHapnE0sZ7+6S6sxj6TqsvFuBa/WXl
 lOeeLQfXxCfA5eGeCg+DJN2USKcQ7Zhm38EUtcS/lx511UQowfjsHwHGoyjn4HiH/SHrmENpyX1
 0wavK8M5GgFby3Goc2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050082



On 4/27/2026 3:34 PM, Anvesh Jain P wrote:
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
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---


Hi Hans and Ilpo,

   I wanted to follow up on the latest patch series. Could you please
let me know if there are any outstanding concerns or if anything needs
to be addressed before it can be merged? I am currently working on a
follow-up patch to add support for additional commands and features
built on top of this driver, and I would like to ensure this series is
landed first before sending those patches.

Thank you for your time and consideration.

-- 
Best Regards,
Anvesh
