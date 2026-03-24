Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DC93947AA
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369914; cv=none; b=RXvzj/ZW8T8cb7KFO6dUdJ+A0rEwjB1vqFxHU94DmS/pNDRH4GuSOdunTFPnn2XBz2DNOJfw1pjRfTAR9y2CVLGiIGF7Qd/M8lDwH/fHNit08O608NJw3l6QbFwDARORouByTnxPwe7baLmoAMQmoSicYpDbVOHLOA7x/z2YrRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369914; c=relaxed/simple;
	bh=/7s67FtLVQ7osFtoNaW8ycH8+kFQQs5/C4IOWP8ZXZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdMtFKT8HCPLWTVfvjCX0wTsld2y5znXEx6aCmvbBkKgC/InvTE7IJwTcWNNmZ5YF9OwnUogBTTac1gpMDb8fqOXiFMVglT4FGPJpHGMYohp+t0tVA8gp6isLIp40PX7Z97QAkrqcC7qLCz5P/GB3iv2GPgwhsGf7qg5UMobu8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjBk/3V+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQLZYVa8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjBk/3V+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQLZYVa8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OEbfbT2488047
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 16:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c7CY9526LGiuXbFCoaaH0xLf
	puUVm/HTTCcdhq9z/cI=; b=hjBk/3V+9Q5LVkSu9Bh2FINyFGF+qzvO0eYqGfXQ
	aSRzDnV8MlIswbwF6yuO3m98OVa6I4vkfUhIBHbxNLSLqaaw/fI/N0zOyXafHSLr
	t9Znat/YV3R5EoGwcUtjaoyx63dTMegBSeWGfOvxoYF5dXatjOSKbnR+3zpOk+qE
	PUIseR4p5TB9RghUkOnOqOCOZKrA2yu8lYXvkXvViRs9NJUlLPc1YGt+Qgk8pYvF
	PYHqIq5sATfkxBTjdtkk3cMct5uTW0GHWWnu6duLpuZFbqhN9mlfi4ais4klcOOq
	d8UnXi66KN+KZN/C28mKi9+IOLCJC7W4dxbT+6UmhYFCwQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvrg55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 16:31:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56cf69b5091so2377860e0c.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774369911; x=1774974711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7CY9526LGiuXbFCoaaH0xLfpuUVm/HTTCcdhq9z/cI=;
        b=BQLZYVa8i5a68DXdoSMqKycZKjEW7QD5GJP2zFUKTvFv+x/Kn6nwIaDypeXDvWckLG
         mR4FYaMLWwT9iEuPUO805Z9NV8fsNPGz7Vuk0iFcb6hp6yrArV9FSCPTKEdhmOgItKah
         cZuNF4ymcU4DqmJPdWG6rS+2c0cSyk0atlMi7tguxRgYGxZFfwpXU2h82wmJxWTY8HV8
         a0j91PUXx/kUzXGhyTwT8FFRZP1kLa+q2cqWnA7rSkYaD3OQmQPyv3TkjcZvy2iGR8Ve
         Q3+OWomxyHdhR1XUa0uCml8vIUr5cotoKnE7Rra+s7bOL0oDOR8/1jzpdBRV4xpBmYZ0
         /xbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369911; x=1774974711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7CY9526LGiuXbFCoaaH0xLfpuUVm/HTTCcdhq9z/cI=;
        b=SW+zRf1qASNtZBBwx8LvLr0ZR+DdxHdIcxvc2VCn1rD2oJz+WLrkNTFrAu2nRe2LPU
         tODqACRhbaFalCj1I2WZigYCM3K2qAEvGm3p8Nm7QTHIWqbrZViyCcICAakU0TnXuqs/
         rA8y3zGgNCJoMQQRY2bPvSzj6aSfmMyesCuHTPsjm0/VtS/15vIea18T/DZClTTJ9vl/
         447TTAhxFqciz7zMMrIyKrf0E+Kvp7BWVRU6Y6iD2LGDATnPLUh/jIG3SJwyE/W4eG5i
         IPRrxTeuozMMToiBfDjTEwlpX5QCPTl8szlS3tB96sMGpcg459PWSF8LvZRhO0zdVrgL
         fqgA==
X-Forwarded-Encrypted: i=1; AJvYcCW+DBiVEwPvz2XKNSMusFb7ogQ/ZakxeDCqg0qjtL6qqXN9cccgSJr9vRREWkA6jc6dFWYjqSkD+pnHcVSiXTKrtTyy@vger.kernel.org
X-Gm-Message-State: AOJu0YyAHnB92Ai4D9vVf5tr0iZdCmBm5XMZNYo0UvYZGmY6KzBBQSyt
	aDAY9epIt2EENKOgJd6TFp9eDo3T4Wv1ynv6Ajt8m4DhIOuhyDpqbeI+0tyhKi+zVCOyDBMjnJl
	sBlEEuLZzKKWFG+B62e6BwFQExKJt/26eKFekzxd+b3VrOuNnJv2IGREt1/L3dolUmsYpUcmZJe
	4e
X-Gm-Gg: ATEYQzzk8erPJUB81Mk+bVpGqFh/iy+UCrRO/Az3aqv4UUl+Srfowrweqk8I0d74Ex+
	LfsOr4ePqIY4yNYwLS1/5iPD6jXgaCQz/qRm4GCfmfEKaamdCZsBN1IPv2QzbUFnMlqzYNUVXaq
	g4kmRGCPD2Uadvz9LcaHuQKn9moRt+IKwcHgIELR8LHPJeMbzBRrEil/Hs4WCrXAmsqjX3LKA/n
	g8/JM2ektW8sy/1WpT+Fs6Phqs4wSaNPUG7wg9HspthTCi2q04X/GY6zDcoGXoqVYJAlvbJPjPp
	j1eb3t9vo5D+9wo8Ft6BA46gaEzF0DtLN6GijOGECKMcMP2pM2VPj6HlkTB9CyoTqYWvR4EwW06
	DDNBVimbog4D8Ds7OmCGwfBtXKBiMxxva5w==
X-Received: by 2002:a05:6122:f8b:b0:55b:16ba:2854 with SMTP id 71dfb90a1353d-56d21f7435cmr297931e0c.5.1774369910567;
        Tue, 24 Mar 2026 09:31:50 -0700 (PDT)
X-Received: by 2002:a05:6122:f8b:b0:55b:16ba:2854 with SMTP id 71dfb90a1353d-56d21f7435cmr297877e0c.5.1774369909995;
        Tue, 24 Mar 2026 09:31:49 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm70578515e9.2.2026.03.24.09.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:31:48 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:31:46 +0200
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
Message-ID: <ec4jkg4aaz2mufzluglx4z5zh3qh7g3oteiho27kux7amn4y2d@qzij5lc4tf7i>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyOCBTYWx0ZWRfX+NTPOH/yjLGF
 mHdOZiTgEqjeddjsOiFqGucrvzjU3N3yasgbGPIS4o3zk0+2GzIo2692lYedbPf/kJAgkqv9EPc
 DIxwXOtDnwsI2B1K0e1fVpIos048EdGqoUr/7hF2xP6Cz18FraNvALmcCsJNJ6avHkRe+ngTFon
 SgUqqzVGAUnyetP/4Kpj41+Rj1rNtlcKnC/il1IHoqsb/kvBjzpezmD58EObuoHywot15b4e3tz
 IWcR1mpyiiwPxnRbY5B9+QFdwC/noLP7vjmPLfYeQgB1wwEeFhVg6/JCyrsS7i51TCHl8dMqBpc
 EOf4yngVpwmm+9yDBd4RvAIr2gBSGSZF9e82kk1991qBGMALdApLpRNitNsp3Ff9uUCD6RMHQSK
 KjP3tgqCEolc8VAWwqVfwv/gb2Wx8swp2PXJ9fozkY0RRBS9IWTGH2c4iRkGdvGDLV4kq3Y5+Xv
 UyDYpCn0Ybt1sIFft1w==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c2bc77 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6SiODLxq02sLjzxsB7oA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: VzCeIIlzAj5uhTQu5IQSW34fqEgh3weP
X-Proofpoint-GUID: VzCeIIlzAj5uhTQu5IQSW34fqEgh3weP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240128

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
