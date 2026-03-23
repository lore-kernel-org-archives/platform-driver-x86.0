Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E723890F0
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Mar 2026 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260387; cv=none; b=kwg/aXNF90rtsnP7SRljKD2ewzgFtoCPxQKAmrqySy1sZhSh7OJTf1DzvCvYfOy8dHsJqqUA1qcKVBJc+TQuCy6Ua/ojHag75KO0OqSjDId0vXx0oUH8aE7Kd45qlbBYjER5MvGUpRRmgavXCgbYkwhgcRbp1nbELmuvhjDgMoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260387; c=relaxed/simple;
	bh=D7uNzZwuRI/Naa00qtBEM/2GbCAII4LHke1I9waZY68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QMona16x9YTTgEAp6oowiOTJ2GN8nvlomy9i0d+SRdq0Oq/yrL7WZZVaDxCxsyITDOyAGxLkhPmVYWt7FqlpPWAc201bQ3W7NshF+CJss+Lrc7waoVHEv43JAASOHDXChHCA4Mu3nKFuhZ87iAHJlMhv33iQC5ETIM5X71n9Z2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQWrlwYP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnGhM41s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQWrlwYP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnGhM41s"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NA2BFk1584129
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Mar 2026 10:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5yQKiNZSsYbyYyS1YJfVWczDFd4x1Y2DGvRv4gTD1g=; b=hQWrlwYPVoRbFM+p
	LCxNxKKJxrR4mfK4Q2REdZfr/kEWXqyLZDVCjb+NWEjoylslCVtOLfbjOzAw7C4t
	9gIs14C3rMpx4e/VtFHKHKSr9AtPfi9IkoOgxjvMjJjaQvsmpVqvHe7HJF6Uif91
	/4soIxrETpmLrSbh8CMciDKOpqV/a9Ptowtyy/hhJCFrmKeHybwX2byPBZ5CwE4n
	+TzFc/5NoeR01Xzo52EUfPJ8dzjuZQHo7CvgWI5LeTTtabdY2Koa5O+DVRFafqRP
	LpTBG+sRHBWvI8m1sJF3cwJNxADRk40v01MKbzcyXZY5Av7g+XvKRmIvhgw0gmt9
	FdKIsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng4vk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Mar 2026 10:06:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b2d15c360so31801521cf.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Mar 2026 03:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774260385; x=1774865185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5yQKiNZSsYbyYyS1YJfVWczDFd4x1Y2DGvRv4gTD1g=;
        b=bnGhM41sP/gWTp/AUUR6y/CnBd4sGWGt+6uNWKeKUtgrcyZgRBhuOkYpZQBScp4PDz
         nwaD57SMqogcR+O44QQAnM3mcccn4AYZFuSq/Yqmh5ypnHofDtDP2frQz3xfkTJYO+V1
         DOVhAgpm0Eh2trIvf9Hy474vgV1pOrb/otC5Y4Awg4BRE9B0yI6cJu2zVK6USrJ2qnN+
         VFC7HBjPFxWCdHG2rGWqltmdKGrCJJQdnHOXQNH1r9X73NfqRtnaZJn0PhH87ZMb64Kv
         OT6z9h8jyBhtCjtzFJkjKYnmnBEP1XJqZd1tKuT+fOG1/Q/VcKoL+kQkljSNf9+GvTJ6
         Th+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260385; x=1774865185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5yQKiNZSsYbyYyS1YJfVWczDFd4x1Y2DGvRv4gTD1g=;
        b=EBDqTuipTIM/4J3jf6IRDHokwP/N9nBII37eu0GMLRX2/0hf8R6me7eSKM4Qvm8SyX
         ahziaLWF6E4L4VSOx93iwWfVeIZryFbo9+LiZhV3M6UeyYQN0qVv4C44xPvvd7TBN8j0
         BP6IVqaUzGVdbB7bZ5HPBsQkSYBKAb0H8tjafBPMdHb/t25kgkzqznWQeOFk67wQoQ0A
         47zkseD8KUQyc51avfguB7DUqU5lLDrGdZhZjyKYfsitfmt2GliRP/f9nbjoF4GCznyn
         Dn+//vPy9qa/AMUBvYPe2uTqEDPaBZ+4qn+F4SsXhCPj/mr3o1SMf/lHcRmdr+4jzxjQ
         t6pA==
X-Forwarded-Encrypted: i=1; AJvYcCVJhIIBQpxQo7+Elnrh0YtbYW5msDbrTN7Xqlsxy3qhEFhm4a0VauhsfS1/JO2S8LOOmiNmRyPvrowuDd4DVRmLHK2r@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ8W3AIugdtmy3z2CTwFzlemG+2kqfywFUtXLGoBGqyW9AK1cL
	Lq2KMmLq0RmLKoKc2mxFtYh0q80VzmaMyo7VUgQjUHfb/vh0+FZkZefLr+1A3whFH4fh0GUEh7v
	r21XwV6mPkoXpPMglROJz17zIZFuV0Y7+HZqoxqsc3Hu8IfoKgIO5SrAbtPwmCkAAJtIF5JUr6b
	OXkWQjxX07
X-Gm-Gg: ATEYQzzjBrNyvi8K9M4VNN36gEUq4BbK1uefCHzh5qkW+e6iiPcxG3f9Y+LgUr0pDFL
	kD3+twzW7TBQtLd7GMBaaZkkivKnzEywwnzoNpomYlY5bGGTPfw/8PfJGPKzNZ8Cj+t2SXhDsRA
	vk+qrlPhivK9jCFE2Cf7IycoWlYwbUgxaORLnelHc/TyoKWvuuIuMu9LufNPlN9JkkWi1OxF7eV
	FgP4XLMVxBUY3oGRBoSVVI3MsA50S2UK8HG0yON3Z2tH3Ymlt6a/OSo1Sf3K7UXpfJxKTWY6XNJ
	yqAMB+zePEI5J29/LREUs8Xp1+JfUsLo/POaH3wn52F+s1wVvSJmJvdlgV9bzk5YSp+VU+Hbtbz
	yBaWOnid71HuuzUr2vIs4LRBfgmLOUpYmK3x1WBDlQpUSch8ByhSQRUCEzxgz9OQgVUreCr+kt7
	acnfE=
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50b6b213568mr1668561cf.2.1774260385030;
        Mon, 23 Mar 2026 03:06:25 -0700 (PDT)
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50b6b213568mr1668351cf.2.1774260384633;
        Mon, 23 Mar 2026 03:06:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d2677970sm3533532a12.27.2026.03.23.03.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:06:23 -0700 (PDT)
Message-ID: <74679a77-55b1-41a4-8e7b-297472b6db8e@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:06:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
 <20260317-add-driver-for-ec-v5-2-38d11f524856@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-add-driver-for-ec-v5-2-38d11f524856@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9LyTBjCm5Ch1Zy_90MQ87i1Nb_oTrVLY
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c110a1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lVCZqg8DjZk64FRXgSgA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 9LyTBjCm5Ch1Zy_90MQ87i1Nb_oTrVLY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3OCBTYWx0ZWRfXxTRKPmfuF7op
 ZpFTYuhQUhHu3hO5TmCE23ftLVHikmiPiR02AnbuEzqdGWuZNcEfsn8WnaV5WRGG6lJXnzR6xtE
 1jYO8h1ydjCXza390omiecUSm5owwo4+rckTa8sFAu2XCKiP+7y84+gOecwSt+fs+y5b31uwnDP
 BaeREVs59Ya4vpJ2ie/1MmzunHeNicYiw2Uer0L/TR3xBCEoYId+l4hGue+dxtt7boQrg0+TuC6
 QQd/BAVXEBV5n9UdDmncEM05QuTi6BeWlf+TrixppLBkV0pxaPyyxUGBq6dd4aUupNkQEWoxbhF
 9lTHPB/aHNG3VExJ2dY8NU7eUl1RTWQoDDUhImS+4ZN1FKZG8e53mS5iSi8UNDUST+duwqSZ3GB
 W3IvK6uIJA+Z56MrnjZUfiIEAdLEgzw/owbSJYh4DwjYA1f+Z/mUsF/LfdOUWrUJXRMBU5x09Q4
 QHvWAbiJ7yen0ac1+bQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230078

On 3/17/26 1:27 PM, Anvesh Jain P wrote:
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
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
