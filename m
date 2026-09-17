Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7AE3A5E71
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2026 15:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658481; cv=none; b=X5byQrpiWjFNWq7cPtjZ5ZL/Abfb0Yb5URudXWdMWtS9PJdwd3H3xaEsBC37cntsy4RcMeWI8ibukWWUCt0yGY1bGmaKgmDQKsfKQsdYV5mSzXxH8Qr2ow5gxKokxuvlJpmVyotfxAuns0p4YBgIihh1LK25eu0tVDDznbXKh1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658481; c=relaxed/simple;
	bh=twrgboY+FGQmnsHlBPho3Q6UZGpTdmrg5WyreHCXpw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2Q74OEJbeSd/lCZ0paauPSsWzQMTqy8/s+xkCPKuFAyIQKbGgPuUWn2Njvzz3iRe0JIaeIryU19t5EpL3wlk6lFfW6ft6kxAl+dmcFV7OQYgaCsDaKhlF0K5EnO9sv0TYpBG7HICLOVfnV4a6ZTCuVJng+0rJFcwTJ18tafhVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VELQo9br; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdFg+0tr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VELQo9br";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdFg+0tr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HF9jYB2023958
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2026 15:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/tTW+lLwHomb6oSOol9clHo+
	Od6D7SaNe+Gbi8U5oxI=; b=VELQo9brRFGtw8IueZoNq4B0AdZhmVoNKND+Cnsq
	cb8hPrgnbgtKLsYNu3YcasMGXlubsgn68qzsfrAwcayO5YwThR8QdFJCm58jw9xi
	nuXyQNzYzFeZ4w7jL4RPkfXy9cHpNMhwx4IhHE8eLmyRzzUQhnMioDnxAbbKfSFQ
	Gv6ScnRKWAvL4KkcwalF/MhCy6OF0cPSFIyfWn/qwoJWncigxda/DUm0CVz8O7VO
	qneFxFL/RZn9tNSU3hiLNoWGp9krqVm2xRb1tWczizdAaDl7IffprzwHTG4MXdrH
	uSwmtGLGNQrGcnDnAgRK3IJZZslgeoES7tLYcJwKm1JvWA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjkt01y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2026 15:21:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ffe24490bso25770781cf.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2026 08:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658462; x=1790263262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/tTW+lLwHomb6oSOol9clHo+Od6D7SaNe+Gbi8U5oxI=;
        b=KdFg+0trDI4uLB5aowE04ffrNwG41pTZFVBc7IRm7laiiFdPfptnjTaMwQFDiu0jXo
         Arz74dUF/n32Oh7sjvu0Omja0FAY1xB3V3i1ixUEHqrhIlkCvxLh6jJbQH5SqTmrQWoa
         9O4LfpdLpdcHlel/MiP3E9HLJdf6WE7Anr3cdRsTKh3OLPtfbmS80PGWkJQRe/RGu8pZ
         5CeFgwb6S5OkZO/LwVeRC2axXm8OXIum9C4WP7M+IlvrzY5WezsUOOe6Txj280PwEMdl
         PH6jUKC6j9ID7cZT2ywcBjLhlhbYBcOktedi2cGHCqXGzxJRA6n927t++UJ1wkPPdAau
         JQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658462; x=1790263262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tTW+lLwHomb6oSOol9clHo+Od6D7SaNe+Gbi8U5oxI=;
        b=jnil72wkJjPew5IuF23DkxBNX7OSrzmeAIU8/stg0o0Gl1zVwogU0oK+8B4UbIXlrS
         9kZFzCMhy1xVCQXNqQfRdE+kbvU6NQ27w1lmmm3aQ7XW/9OCXUVv/mnL8UeA3uKttU69
         ThHWxUSd0jmoMEMwb9HwUU55XrHavWnGYAiUSXbOfttjxids9yJrOUz7MX94dDm0/91Q
         nKOVW/DmDfnJaZkioy3G/CDQz3GiB0+gqn+5chzUzUbDiEJxbX1DVyDOgfv1mYkmCZPy
         Qk3CNpMkD65+s974ZCIzS0Dtw/Tx2OOFG44OaR/kPz2AGdhLk2lUIfcru9c4kRu3JsOY
         dxSg==
X-Forwarded-Encrypted: i=1; AKwUvBxrPd6gtpkK2ANiGngXSCRpTpxiMPS06veIpVGrc9CBE0t4XWeEKHn2nb1TdOO6iGpShOzySroB+r/1S3DSTOE0jvJy@vger.kernel.org
X-Gm-Message-State: AFuF++nQkt4MAnplSKKQimWImvobSudHoUixzpgUQHdxwDH8N1sELrCJ
	frFKQzisaL1W3TzxlO6jZx+Cp1CcYQ+4vRuWjEl5jEERsB5HwnBrbkr1LJyyY+qONPf/ZgA87cL
	mGfr1gM4wvjhty/XXdConF3gA8FrLJ1dZgbac23j3J+aZZyY25W+JJP/dE1lHZiPRGZuSpi8MRu
	zQ
X-Gm-Gg: AYBFou3f92M+C8MWdew0DDqLPIjnYUVCz00cc8h6jUL8yHoFP6br5BwI1pFgwfhv+I0
	uWLN87gKYjrcf6qNKzyjFN47PN24qvmK0t76sDEZTglj9W90gZ58xd1BliTHR/9JN7J+st4gKN7
	fJVcQWihpJi1CJZiO2c89WBIEK5LyX12wUICc3l6fjZ1ZDwQ+Z3MavkQS3mxTn9vgCR8+iU04rX
	xeFlpYkyvNEONaBBjlpMTbfNeO8j+X9U1MYz6CSaw6TehgrAfcrx5PJjKJVid7WpQG5RdJbvtpX
	cHHjNPQKqWoZJ6DgF9JxgQQXfY9uJXlQFwyX0SIQlYkPBYggzgkRIrv6zov95bwL/V44Ws5NJN4
	NuiN6Qp1zimgGFEg=
X-Received: by 2002:a05:6214:5017:b0:912:517c:119 with SMTP id 6a1803df08f44-912517c08e4mr12931126d6.57.1789658461463;
        Thu, 17 Sep 2026 08:21:01 -0700 (PDT)
X-Received: by 2002:a05:6214:5017:b0:912:517c:119 with SMTP id 6a1803df08f44-912517c08e4mr12929806d6.57.1789658460638;
        Thu, 17 Sep 2026 08:21:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27198sm16392480f8f.15.2026.09.17.08.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:20:59 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:20:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded
 Controller
Message-ID: <j74fubwlkynw22nwsof3wylypf77ptrwbg64q6tmldvh7ckq7r@6nsl5fgiut3r>
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-3-373516d347ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-topic-asus_ec-v1-3-373516d347ae@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfXz8ogeLypGxRB
 BGJm5DR93cmV6DQR4Gbh9KH1uxbnH0UGqtmYKZTPMX+wpNltp8XQ3oR5PXrY+nyQzp9fk+b7XnB
 uxbp7voH6dnoNFMsXMxzzoPQ6I0GyZy4Vk+RpjfQYCNEjR+zTCOxzQ/HU0mOuiAgG2laUsiXIsQ
 rMGGHy38BfERHUxkhwCYtaPdjvJU3UK1ZW99OTzyEQlAKwIjVGc8nKe0YK44d1QRhauRNvluE8y
 0BfCH/M+UilR6yXJumc62eL0QHyIjL21pz8H3EKgkWEOXgb6kMV82i3OWOeMKZ6Tur60GDKgSfM
 ckwYuPWhXi4uoSqAtTJWUw5/Owzk0XD34jOFDt5uxfXgWuoEwbchHzIvlbe0K9cNszlimUeQw8K
 W0HupxtcMcOHBMNMJ1uWYUNQ4y4eKLJa6lwukPfvuzVLtHcUD7kEEcgIkx+pxauFvbkAS6alocl
 d0jDldDp7NUpkZmPAmw==
X-Proofpoint-GUID: zLZ6znkAolgoQh0hNtzFHN_KCR7b_J1m
X-Proofpoint-ORIG-GUID: zLZ6znkAolgoQh0hNtzFHN_KCR7b_J1m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX6yydsGDoR6kD
 lFvMDSmmOZ/BVtxiK20ZVybb+ceroGul/w1gP84lUzlE8SltoRvBjJ6PXUFpYXF/GCxuxsn0erh
 8T27ypp58ltny3kDwd4f0kRs5lty+nE=
X-Authority-Analysis: v=2.4 cv=Y/VtIReN c=1 sm=1 tr=0 ts=6aac0563 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-FifcBtKAQNI-ioUATQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170217

On 26-09-17 12:54:58, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
> 
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
