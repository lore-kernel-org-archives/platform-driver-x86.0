Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E706C2C21E8
	for <platform-driver-x86@vger.kernel.org>; Sat,  4 Apr 2026 19:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331185; cv=none; b=nuU+ZlJW3+jbxjRgYLC7eL60/3OjEyFdHlKxJBgmeTS3ofytOpglPxCya2u5C2kykBCFWG1/D702u+yXE8PCk++oAYFKyhB1TbkyPjvNXmqfcC47FkCZY+84cWxCPm3dhd3DqBckc/Q8NY7ghOYQ04nz1jCHCWYHElRdPJsmq3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331185; c=relaxed/simple;
	bh=DeRN+dhSPVtH237e2I5oUwOFlcxcTUfyd71zgDaZA50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlrswJR4iL1YKfoIgXLNgVWgjVPLl5Apk4Z/K1+C+pS9JB7HiXhNL/DsfEhXiO3HWTIr08BFirtgVXb2X4e9bgqafIlAPXp3U3H4HU9hwQmUUOrgXWIq77MC2XqcgaiNvfeo5j5q19lIRr2SghmJCEODp8kO+upBJlxCTbJfrjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k48eJ9qV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnlKiwVd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k48eJ9qV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnlKiwVd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6340Jtdo1309685
	for <platform-driver-x86@vger.kernel.org>; Sat, 4 Apr 2026 19:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3At1cOoI+/INm38cpRwWB0kP
	WiIwZdHs8XrXBBAl3/4=; b=k48eJ9qVqDmrRHMcPSbiolkDFoagMRqys3cDzr0G
	89qYVJ2cXmysnbOupxxBpppks8HIKZzNkswFYQwuyI2XtJwgHGtmn5qp8XtxJQMT
	+okKBHVySiLTr1g+z8nfl4cpKOsuwaOowvhpxPJiUJVpAGQHkrCb70OGe874fsLV
	G4rGLEOo5qYGV9VrMCSV8VylYI0yZhAJlwwPm9GhXqg7zSRFLrUSQcwOmtCnVsF1
	7uwyHfETK+z/dVBzetwBuefSKZ8+J5ERy6oeuc5GzFq12aRg1m1U2Crja0aX5CGC
	SfY5XrF1i2qNXh11/whjQIdca0d7ufw5gIc6R5NogGrj2w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mhk4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sat, 04 Apr 2026 19:33:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509219f94b0so88928901cf.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Apr 2026 12:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331182; x=1775935982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3At1cOoI+/INm38cpRwWB0kPWiIwZdHs8XrXBBAl3/4=;
        b=gnlKiwVduy9Jl5+7NATNxcEMzcebTXGoNyWVzcy9GTW7tw/vl+Zw0jacvrRuLr42Vq
         PZGpPiKRgUugOlYYo9i3qMIx/stweT4r/QvrWxRXOvfdXoLUzdzO4iQBVefua49A0GVU
         OYk3TLXdKoqoZRvwtVWT4oNPncEi8eDeT/9CVKvBKaKcAVGPS2aH7PqbZ8WxesOdEgNB
         EaM3SbZSvV6NEBFrXvXzFVJ7v9tw9We+20/ePHrbuSRVceiT3cstC9QKAD65ZQxrX25F
         bEXuuXhowo0BIgUE2FJflczOyq0m2Ci4ZgHCjuHoVbFozj1YANFt8WmlO3eunxY6d8Dz
         JmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331182; x=1775935982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3At1cOoI+/INm38cpRwWB0kPWiIwZdHs8XrXBBAl3/4=;
        b=W8LCuG53DxvelH1K2JBjbbbXpeKaqorH3DwOhlzac2LnogJCbbv4AOrFNhlqDY7aps
         09hYX90uCGhn+IOJ3oYyu1SssSmOM9LyKYcZI2h6//aX+Or7b58zX6rfIVTMr/o/stVF
         gj468HnE8uLcTKA79CRtgox4JManivfz3ENR2HnISI6smtDBCstYLVFSGb/07Cks5qhu
         qiWlszr8rMDgaW+RT1ym/1MhSIK0J7+jYBb3Bf5C6sFCFd8amEdmVsKuHh5cD4pFXq+E
         etsSN8ENOqd8ZGPTytehekkslwAvizVV+1ZB6P+aL8GHhkcgDM9QJ9FrCrIn3vQALrYL
         yTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU61D1NUWEleJ2pGhuyT0vBQ5QiQtvRPqcUUMgTgM7dfV6cbYMLb6RYxdyUx7Ct1TEFRv5YYxE5vRv6G72IoHBhiVBf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2/v3Jst1wM4WILmEsOb0wSkVvqJ0Qwc6hioJB0LpaYntpBssP
	2jHGHNhMi+EuONh0T7u+x5D3j+EFykoFz9ICwMFkpLK9WgnQ0bKBq/3cPSPhbB+XiXphVziEW7K
	ftjZaJH95CFOtxPQnmb+Vn1H6KgxBdUZxB47Z1Gf8OERXj5z4yOJo0iEOeQS+oPTCTTScsAEWOC
	qi
X-Gm-Gg: AeBDievuinEhc0muq6sQvoFqdM8lEBaq16UeWmwuwZVkEB5w8pzBoHtt6yoP/Y7v3mQ
	A1td10meN3FvuIcb7L6csSp0p9RJKxjDEIjy0M6MGLvNIHw93zwUwl2/X26DZOjG9sDealle51d
	XdEtE3mzAXlqjvCahnY5zvpI712Voe+W1BBQ7Om+druxs626o9rntNE8x+byX2gYYzqMJUUdXG1
	Y3jPhxy3PUX195EUvnZi8LPZR9io0HalgUG9Q3V1c09iyO5UzFa5xmuviVFZS0K9cgdKg2JHllT
	muSsem07ph+z6qvY0NnaNQ0Nl8hsYuVSSaXn6gwzQSSlGhrgYP5wD3focv+vcrUQtye1kldDe/a
	HuUtXmBIENLFzfRTSO6erHJpg031k70KXxwIAr11Y29YhPCW5a7AGsHkFWL792hyciAKS+Y+vbW
	eQVdprAGtYwiRmCEpLhqUF3tgOqdv07jn7ywI=
X-Received: by 2002:ac8:7d50:0:b0:50b:4ff5:9658 with SMTP id d75a77b69052e-50d62b13664mr110539061cf.55.1775331182392;
        Sat, 04 Apr 2026 12:33:02 -0700 (PDT)
X-Received: by 2002:ac8:7d50:0:b0:50b:4ff5:9658 with SMTP id d75a77b69052e-50d62b13664mr110538641cf.55.1775331181844;
        Sat, 04 Apr 2026 12:33:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd34f0sm2299930e87.76.2026.04.04.12.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:32:59 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:32:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
Message-ID: <suabmy7pom5qc7vv2rrvy64pujnziubghgp55gjvatdmlo4xo6@gial6xwm64dz>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
X-Proofpoint-ORIG-GUID: nZIN32bp2XOQui8gph0ipHqECPt0gugE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NiBTYWx0ZWRfX4y9xEcFIp29R
 EArvt6gcwxjpNWbq6NIwU8T+YX8LkpniSbI4TBCZAebYJFSmppoDy/nGsKkcUcjkMxES5Nqt9hH
 k6WtphQAsdsEN9w3zh43PsgAkUSm9uLsr2ld1fKtLOdI3UXO7gYcicVFVtrMXqSPqQ27/496C6W
 yx/XVM11cA+GqDbxY9qJI0UMpWhWO9npThQzUZU5UPiOHWuNYMdc9qochsSDNnG4fhUMFmeRVp4
 H8NgvLC0ezdgHo7rzqtUVH9PYeQaBy/pZ5As13upAl17xjhIjLIlbGi5Nx7nMEbKl+r9xyXk4OR
 GmEFd5wEzX4r/XTDJSeyNvCTUUz/Aw18iDfG7fHg62AG1n9uCaPMC+mRVtMUAK7nMoHCcYDIg5X
 oc44raijXVLzpnkspVOg0ZXf19yzPugAF9DEBcripbXlYCxeiPuwvzUNdznNk+VfSd71N9sDPFR
 FowEg3zHXPUatahK3LQ==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d1676e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=I76Qk8w-AAAA:8
 a=EUspDBNiAAAA:8 a=BDX-M9UYCxStvK4FQfUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: nZIN32bp2XOQui8gph0ipHqECPt0gugE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040186

On Sat, Apr 04, 2026 at 02:55:17PM +0200, Aleksandrs Vinarskis wrote:
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 94 +++++++++++++++++++++-
>  1 file changed, 92 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
