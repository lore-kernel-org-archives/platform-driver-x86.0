Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C0E330D2F
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625066; cv=none; b=hOi2WUN8gGn5eJB2TW4adcAktf815rkLluXQoWRLwF+7ZFvVTO2uWrVcVNLU5Ag/DCi3rgWEk1kcKQOIEGjbKMNtH2f2JvkER+bbnl7NZyebB4c1EvNJ64wPLRn+RteP3j3HS5quD4oiB0av8qim9yThPBtCgoaGYnxjy0kkgXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625066; c=relaxed/simple;
	bh=/7s67FtLVQ7osFtoNaW8ycH8+kFQQs5/C4IOWP8ZXZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcFiJOJSUGK0vZF23cy8BoAvHsD6Yz1IWdFt562RfEyTvCCb9f/SDKz81249yzhWqYgFBktQUj57rzv3jkMAVgI2/YziKAeQrl7iuqVEQAdTuMCY7gxE77eNowa40AsIzB4rs3M5a+pJOniYk59MxpXczxsFQprBMlM2wdCEvrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ie5es2Db; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvWNyuZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ie5es2Db";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvWNyuZC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDi17L1204297
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 15:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c7CY9526LGiuXbFCoaaH0xLf
	puUVm/HTTCcdhq9z/cI=; b=ie5es2DbqHil6kY7e1DqazN+qBWcEzsbfzELW9vk
	DreUr8ECyP8Y8n6DnPKv/bfZlBVQ6YA1LoHlddXrzKQWBvFjCT8DyYFEwYiImMnS
	NyJygDXG2gVXLp4jh8rsu8DHYusLyNAKUPC0OMg1sUoEnnzVYyFpteO4KRynw4aI
	w36i5GhtH+1hpB8/q9f1ukTnFBUW5BX0rb3HtckXMs2qn8k6aKaAG2y41248mmnZ
	zVUHovDFDxTgaMovgVAL1W6xhj8mZ1mhudtk9kN+rbwbkr87R3Y0bNspQHUUW+yC
	mIHx26jRDeR8YOQxbZkPmwsqwEo2S+guaE1qNZZaRLGuSA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8un44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 15:24:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090cc6a7d2so67779041cf.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 08:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774625063; x=1775229863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7CY9526LGiuXbFCoaaH0xLfpuUVm/HTTCcdhq9z/cI=;
        b=WvWNyuZCuvfdR2HMP+ClWGj3Oopp4rWWNn26kVb7FBLXX+MtY6Xs33mCLorMxS9F41
         OVzTNfyqFr8I+Ejh99oINp942oJTVJX5Bu2ZIb473bBA6Jgdl8xcoNxnydZJ86x+TP7C
         8cfsZrjxaxpZe1fJu+D3eCsy2xR5XrvZJ91dC/iu3Ks/1HJYpvCgslt3CBSxmWnyX8qG
         mEYTyPQ/3X2psjm7i2pQ3rEkjsq/7Wzxuv380MS4M8iPUDUgibc8Jhc8uAiT0PoeD4bc
         P16fUd/igT/paLbmQI/BJMgSAei64uc11+gNKLkDDRP58jvz7zbynT5Zh9eJbBPFuDp3
         CPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625063; x=1775229863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7CY9526LGiuXbFCoaaH0xLfpuUVm/HTTCcdhq9z/cI=;
        b=tGmfnASBcDy/a4kCfbJPGd6AI7WEZa3r0NqYtDSb+Ivvg+LrHc5z4V4+AGUF/Fjr8H
         gKu7GhdXFUGaqXMFN2lXrAQpM5GUR7PZOSKrMbEDellUGoEj/1S77UEb+lh+ETrm/1bi
         SxevSsshgv+tPuq99cNtV/o3sQpIE0DYzFARGkLEB2rW8bmjeUX6w7g7osAKr9sM9fjN
         O0MRNtkxZe0/YA/povHHX8YHOwi6hPwwV7FHh0ESKAzwn/GRnpQoZi5lg3VGd3D94b6e
         gUbtnf6X6Go1q9lbszD3HCyzKISIVeZvxj2BO7+1Pk9hVyI7sosBv6A8AGH+ABm35P/A
         bWDw==
X-Forwarded-Encrypted: i=1; AJvYcCWHxwhtsYCfuAefGxOQ8Nj0E2XAL1sja5Bo84yotRyJkQzpfB5U/Z7ZxXvFD35Sa7+IxcZqv3oBg6EqmWqtp9U+ohBI@vger.kernel.org
X-Gm-Message-State: AOJu0YyBtTfZAeEjVaC5XHKKctss9NIIdEQ6lMUxqRdoqgDpXDhAeyT0
	LTPpSsZvM/jFPFk8iANiGKZn/Fibv7HDgZH6gRlwZXAadBCYbZeyoi8mgZjv6IkOBDZNENS2IZ3
	olfxxUEaI1GaXKPjOCpPLaTG023NFRpl0qpkS2OXq00/Wx+v/L0g+kmC0hN02aECs5Nktm3vbH4
	Ds
X-Gm-Gg: ATEYQzwu2Wqcf7T/mZY5NWWdn2qXbPhkznJesIY+n2awD1pSAvz9FoYNi9YGuTObrHw
	+Ruwu8ZhYo4c3ajtTc9BNhnek9yT4tYz0oeReC7bUpKTAeGVVejqXZc7hg4dbN0jX3Ng3l/DVLR
	NTyY/fFWmFtiNJFEH/M+rd71KohzpjMHsUJDGsXhQBuoR/GDljhUQHj7+c0ySvs7PUZ7nnyukH/
	qnBJ77jS+FVvHDPpltoXv+RNRW6l4zH+rIcZrH6Cbbrl/jgnq4BM0whq1GnGIkDdhbJ8Z9dAGSH
	h5ev4Eu9xBZ6iIUje4x4wUYvorrU3piy39mvf1iQbP6lmdiqPvjx2MZMxPORuLbkOj5hLNAnrPo
	8mLTP0Pw2q8vDBoTc/ku1JR6T+YDd9hcJAg==
X-Received: by 2002:ac8:5c84:0:b0:50b:4e20:83dd with SMTP id d75a77b69052e-50ba37d2562mr41025301cf.1.1774625063173;
        Fri, 27 Mar 2026 08:24:23 -0700 (PDT)
X-Received: by 2002:ac8:5c84:0:b0:50b:4e20:83dd with SMTP id d75a77b69052e-50ba37d2562mr41024541cf.1.1774625062470;
        Fri, 27 Mar 2026 08:24:22 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d9acb9sm19639105e9.1.2026.03.27.08.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:24:21 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:24:18 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Message-ID: <gxmvsabqwn3xmqwhefsbcornrdlxfczprrpdq7gvygx2hlcpjb@5stbl74f6ng2>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
 <20260317-add-driver-for-ec-v5-4-38d11f524856@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-add-driver-for-ec-v5-4-38d11f524856@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX77YFAFEP9SlP
 6UEfb0Vafk+Jk31rcNfXEeDAGdLlmPLAgHxq+85cPLkm0nHJFV4UXtFfyf26VX5sTnXmaj4l5oW
 E+/6zJUX/uxmli4qOFZp+bi68DTVFW69Mp8fgNWP8KbH8RYwdHJAU/x9OTGs1vBgpwEw6Mz5DG6
 p+W+Vn9OCUnNH/Sanm8++V98pqjoez5pT0bGaGNOQleZcdqFbNyhY0aPXkNDfSPWMbWjPhxlK3y
 7BPITKX9jObJ9g4rVXW2JVkk/l7HI8Js5QVj3Fcyr4RP92iOnD48uszjKAyEDAmkPzfzUep0bJe
 8ifLlF4P7lt0mFozXDXGG4Vwf9f1d2wijhoGn3WUFm3g9dCYp3D59d7MHPR1f9zaT7JThrVYj0k
 dqV5J3rvMjAHkNmOE85OIHQbxiSYFTQRWbzK+USdeFBgvYuosOiKfVcCG6UEc/nFlb+t0GHrQ+Q
 TdZizsORESLVkr7Fecw==
X-Proofpoint-ORIG-GUID: g_0akCLgqdL12opCRh0nQCdrkelIxq0A
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c6a128 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6SiODLxq02sLjzxsB7oA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: g_0akCLgqdL12opCRh0nQCdrkelIxq0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106

On 26-03-17 17:57:58, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
> temperature sensors, access to EC internal state changes and suspend
> entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
