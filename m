Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B672C21E8
	for <platform-driver-x86@vger.kernel.org>; Sat,  4 Apr 2026 19:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331141; cv=none; b=GnV9FMCwHNPZmodj+ggESa5fhyFHU8Hfzlb+gAb4xTwQ8eSZwscxM54DgV6QclA0Hnfm0D4VPZS8UY6FnLTuJw5S08CVUi3ey4Hi3I4/gCLIRX9UkW7DIx8eCqwql9DLaVQFWC0lGIshuYJle7BuoQU5GV6hMhAC5DXSrLlrsNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331141; c=relaxed/simple;
	bh=P59wxhS/eZf+tih9Ucd1Y2vlFDKd91+TPwFioemXu74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T75w4keFvsTzvdojpEixhPgDEyaoiITTnF+IEGLmNs5yS6H1NpcQBGEA+T3iHvJHxfUEQiArEobdUOedBhSXL8yBEjb/Z/J8pEP9oYydxB8Ojybqg1Hiq7pAnx+wVoeXVDlc9HoghG2fIaPmwJXgFn9o9vT137Nq/g1QNDJAUkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VsvnX7mt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O20rIRc8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VsvnX7mt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O20rIRc8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634GMOwh1643843
	for <platform-driver-x86@vger.kernel.org>; Sat, 4 Apr 2026 19:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tad8kd4RNcjtZnH9hTa4D7BY
	grzuPRE6PH6K1deeQOk=; b=VsvnX7mt2eiGoHRkJLU6IWKwU3rO0IBuAZY5cGoU
	nmzDpvbpZjoyO8pv7UG6jTEXXmnn3CPtw+OS8igFnQtRCcyE3DTn3MEoO2KHdRsB
	FdqjCneOWNS+UwvTu47wNPELwm3FG8IzlX/VdoexZ1+GYc8Bn9VI2yoawZPs99Xi
	o6hK6Rk3gJ57BRDWmmitf8zx9vpX34WrKwwGgBtguqkQWVp+qrpwM98dJ/W19m2S
	ZUmdtGlBoGL7zc8ObTKqgxZnB5Q6WqEbQuA57j2iQpEabqKFJ3KLJdWk6+Z5Nln8
	jNGhiwmY7hKBPvmT2GcIy008gpV1/FnRKG6xUqEkOcyaCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasn5sfx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sat, 04 Apr 2026 19:32:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d826ed6f9so8187611cf.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Apr 2026 12:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331138; x=1775935938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tad8kd4RNcjtZnH9hTa4D7BYgrzuPRE6PH6K1deeQOk=;
        b=O20rIRc8PhCklOSn1EuY6zn8e2cp/KsqGJJmuPOgt6rq6FSFGSMkN4rpM8z8gZtnsQ
         tUzHZFB2otQ3Ra+kd9A+ZqdFLFqm+NSj1YfzcJSTZZ64SgpwbdU4rRIv4hxEKy9CTHI2
         IPR8GUCBO/P8JUAS0562OtMFbq4twnZRMjMdvPfbDpEfo49kF9+O/r/qKOdFvUZnO34+
         hJAAZuxhKk5lAZVO07cAwU/gGjPzXI2ocbJ1HqnAcyf3mAFMzQA4ipmukG6kZuNzXnXl
         creI14kqn6z1nC9BxO4Q3r+b9pA5gpDNOBCNhuFgdKBppTBbquiGL+Q8GXn8xa8aLGeF
         EhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331138; x=1775935938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tad8kd4RNcjtZnH9hTa4D7BYgrzuPRE6PH6K1deeQOk=;
        b=ZrrbU69u0naWTY9k07/q4JJQXOKmD8BtyULqAHMj2a2QARpUwpsPd4Hig7FNvgeD7R
         TA4GBztYr8dHVlagBgLgjTRVeFhVLYFVQvTIBTEa4+bGGEspF0WhrqdJT8htMbEk3/vQ
         7VcMPY1iqnrCrbgn84pC/9ZATS1tj1Skppx6FbhvlLbzJjUIIkKZjnQFhZcKTrEqIfHG
         xumD7PsLB8W2MzB+ND4eTcm4s0yClVMPKCL/jfBbPavBlJXP07XfpMJ0QpEOvE7YTQ3D
         teexG2npG0U03Ax5gFXjSnpuTQBaUkg/fPjIEBe2XdXzrKZqT4roTOOQRHfFqWK2tjQm
         TwzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1TD+21kNka24S2CecVp+NJDKnrzV0AdzbXgZChQbLzuKwUHdBqcAbaNzx0XfijgqK8BsAEaSGFBtNhlgU3SxwQjfk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg/XVlxUyH7A/QqYsnNV0lb/YzPpxHbXlnAD4bnqhnF/MmjR0d
	rDXQmS6cyQbgsWhRUDbeBAVmtXWh9wl/dU1grskNl/gnS5Phha2WQ5XHJ7EKx6DGAP3Q+eGcHAS
	qG4aXqJt4eN0tN1HfsqFV8SL0vKL51/ziNlTDT55U0LHEjJGxpKKIaB9o9H56ZEuj5xEumnfag/
	FC
X-Gm-Gg: AeBDieu/Ln9WbYVozvETMlYqhs1m7LCOIE7QFqguEtyuVs7gp7eVU1OlZokMXUUUvay
	gCz+eL85f7omCdlhFe2WiVxvRwVa40+PN5jfefHiv9kMNVcqLKpAcsgE34GDmaymXGFz36WY9lp
	gFSFAK6tOMXEEYiEWtxImbh5HUnmdhuKvgYDxt/zkJO/z6SEovntj8AEdi3SD2ZDymZf4ss90fP
	HwNjwzukzdpRXrb6YAogm6BQTGPj/bL/PzKVNX6dY4S2/x5Re9hWQq0mLivO/uWHG8ikFJRLnJi
	/x1dtkk9CwIytbp3+excGKZiI/gMJaO4E1hDBlFhaH23/cNOsJZZ7yfl6mLj9XFaK/6oZ9KJPm8
	1yyc4noSkTLwUUpf6m5alHSZPQ74gfUW7kll7AffR/mdb+Tks1qEL2QkzH3GkTT+tCiRVMmiNyf
	uvhXk/t8yT+l4k8yj9Elp3TYnTz2AhQopKqyE=
X-Received: by 2002:a05:622a:1191:b0:50b:8c01:210b with SMTP id d75a77b69052e-50d4fcdc4b2mr140141011cf.31.1775331137800;
        Sat, 04 Apr 2026 12:32:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1191:b0:50b:8c01:210b with SMTP id d75a77b69052e-50d4fcdc4b2mr140140641cf.31.1775331137373;
        Sat, 04 Apr 2026 12:32:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdfe5csm19878701fa.15.2026.04.04.12.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:32:16 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:32:13 +0300
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
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: hamoa-pmics: define VADC for
 pmk8550
Message-ID: <vfstzhr3ak7ykt54piolx3puuagqepfs5b5x4o3jnalzxylxfv@vy5mrcdm2ilv>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NiBTYWx0ZWRfX3bWJEwJpM74w
 dKc3xpXG8hlvhBjrfEgiincwxf8rd4Z9jvceDFekqMicPEb7SPAKmQVs5Y/hECfqBPlFOGrIuAz
 Ask1Hjmw23tz1Dr8OJAmH+5E8r5R+7RgmMjTFFzgbkmrqcjhFS7Cc0GtMNCXRJXExMY24Zmcfrz
 eDMYS8lklGraxYac2mNbYIIZH44fBz6V2TZuQEtQdDPswJgK3s77+oTiNRzUWGYJHu3g/FUAXQM
 4oFOK5w1HmUJksEnAmL0WJ/7Mzye0+te8eu7OIl5soxTuAyg+a+oEiQ+MNUNWVHuAw20P8Hbkis
 c+RMmmkFRfrgStdTApU4+XinGnGaK//yA5IdYmwec9jASj1mnrbEB0f4qWQEGt/ir4V5SXpINqY
 Rnz8zbMq58LvUsxakDgifdXDdYdZclqW0cjmmZdT80JHAeHc82yk3ismaQQOqONloy2bkUWv9nu
 zWM6dPIW2XwIzh3GLmQ==
X-Proofpoint-ORIG-GUID: 5H2vP7Glywk3O3C5tfQ5LwXqOCS4cbHL
X-Authority-Analysis: v=2.4 cv=K9wv3iWI c=1 sm=1 tr=0 ts=69d16742 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=I76Qk8w-AAAA:8
 a=EUspDBNiAAAA:8 a=V3ZGfVdA7sYjwwZOGqgA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: 5H2vP7Glywk3O3C5tfQ5LwXqOCS4cbHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040186

On Sat, Apr 04, 2026 at 02:55:16PM +0200, Aleksandrs Vinarskis wrote:
> Follow pattern of pmk8350 to add missing pmk8550 VADC to hamoa.
> Register address of 0x9000 matches example schema for spmi-adc5-gen3.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
