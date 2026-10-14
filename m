Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491544A4F00
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 08:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967116; cv=none; b=kG4EqLQavmhF/Cs3ItCYpt7r0JzGSESmn7kLUNP1WIcgMRgBbtewy0Oy0LOlCarZJDy1rzagXFNlu4P8nxvIFtGXRORh1Bd+KOzOmUAZtBR1GPtgwKOIGCB72PZQLsQxu8TYWbV8ebJzyMspotpeCIzsDWhPBhEUg2bWSKdd3F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967116; c=relaxed/simple;
	bh=vFkUvNtpdQcabmgAkroImBy/gEE75d6PH35V9Ktd4aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/wUR7i22H/XuMi5vHX/yRkQc4YfvkK2ni8Mf5AR32btRDFScInOYuGUVAZBaayifaHMmYIx2gY1C/SZJL2wfyUyOAW4rdRhoBc6FjwYEFRNT/Lp8y5qCpd+gBQWgJIPW2hTFCA3UeuA6I/aUjQn3SDpysGRkU0Tb2FwBAGhr20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouDeDj3B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xo3nJ7z9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouDeDj3B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xo3nJ7z9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67hfW2685286
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 08:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qd7vTo+EqGkYJvBcWwrHERRc
	H3xIdn95LuV1P6oCFuY=; b=ouDeDj3BW84QlyjGtamLIrXioL4/bWrdkzLfeWgc
	rHXtLz83CvQwVcoSe7CcGcCLoeIrAUpHyiL+Js8RRmGVpZWgGzymRUHkhZQNrfyA
	cYdlRf+NZGqnQLwI8Lw7St4/Lx9R89TkO47RMLnlWcRxuNwwD2nkUtChE+juRuNs
	B19LnKLGJnu2fWQYMRxPYfgvMGI1FQvGEJa2zT9fh2LW36fhSyO65AXAAKP12axJ
	DytlBUx4SBeGN042W9HxvrqPlrtkqd5A5mjWGoqvBfQxl5YvQJ/piRpBFteM8JF5
	FDfk+ZkjKKkCYhdjDRO6CYWG4T6WpJBbuI87wHYodBcNWg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u0kep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 08:38:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so775999085a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 01:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967114; x=1792571914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qd7vTo+EqGkYJvBcWwrHERRcH3xIdn95LuV1P6oCFuY=;
        b=Xo3nJ7z9mtp/EsmLlI8vryb7+dP9+bhw/RMUrSr6hOvwSc/A2zJbZqvuQluqAjOpw3
         9qUN0p+Py87Oh/SzmWhnLuZwFwrqRaRV3nGyZqv+V48Vxf4xno6NpssN5n34FMufzShJ
         qubblMqc/PDnu+IK0LWb2ff8g63dZBeXL8S8mYERSCs7h0kxSADBknfBwKMh4QMK4wp5
         XvcYs97h1UKqIUaXHXb38Bv2iWY5WJV8vr9F5ByKws6lLr2OmFkmoHxHkEru+61Ol8O0
         zZHGQKGJZZnfyanTd4QzCBujDcncl2HiCuf1XNUJ7icqj0w0FsVZPMnRkpixLJ84C6nh
         LC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967114; x=1792571914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qd7vTo+EqGkYJvBcWwrHERRcH3xIdn95LuV1P6oCFuY=;
        b=IpkafPYS3Hh68hCgs5jHyt9vMKsxJOaVtV/zcaJIAdNMTXcdlYeTzcLxllUXpedUQJ
         VkdsWifiz8mgdXwonILSxDAnRotQ/cfUh10FW43oTxLx5Rqa6m8Y9YBB+BPniNAbG8II
         9Z0mfRkF5ZSBuzvJ9iAMYxEAfmzhKE8hgPJ73CbwjZyLcQNBKhg3R3a4PqduhLdvww7E
         KGXIu+ObfoyQ061SjR5VwGHNlTPLczrY0ar1bQO2v7P+rk64lgwvorhWO+2k/78b8CE4
         PwF0xe0zqhsODZoq7OkNJlTOwwuHkU0pdiFJY+YgQ+H7/Xj9Yv7ThLxnrAvCXS/4D5lr
         P6HA==
X-Forwarded-Encrypted: i=1; AKwUvBzweTcAbno3yrwxjs4iIxwLXZ8cuRCrCSn+tWFTvtEw53fQJXhZntE6c8gQkLBKYLrzxl2BHQVfhbqtv6XYFKYk3/mn@vger.kernel.org
X-Gm-Message-State: AFq9FYKtCVuI9EeUB0iKZqEmp+IXm35q3eDtRhMKplPo1S+ddGh+RuWV
	0b0jsN6hgRDlhCXc7Sxx96KWM36/XVjGx6ZjNIhyDMXN4d+IvGvvgXqgETK3Fj+H7cITDj937L+
	dczOnfKWjno9y53wqFofn+L/aOBLuoPlyXDa7r0jQj6BJO52ndEL/vxZNOQj3jzSUgd3n4Xlw8/
	dJ
X-Gm-Gg: AYBFou2dT1pTtOvilcqVk5Jd+P7IwQ0piBa6vRG4axnYuT7R1vwBp8k4m4ZSYUso3ne
	Fb1kvPZsk1jF4kZ0yAMZ8+GTBJfq9ujWfmegVHvsjlIUGJuI32LAV6FcOs9ZeJ9oU/OBAPj593T
	ZAFwIKj7nYsgwNyMqWP16wa1KXDnqu/ztuyqRCHVbAMDm59TapaGkm3+2WI8zOvUXdtSE2goLiP
	wVpqxSALM2uR4+2gSaWYhjI/k7LWX3yNAfmLNrYtfBZ/t8HAX/FazwZ5ATsMFXm0Oh3uhoxvAaL
	Jd9axSt3WBUOUSK3pD/nJsJhK3VUyR59RfihMa/g8R2All5diHn4QmWvxmySonze274ekubOPLc
	wPMD7tgkDjiiI0WW4
X-Received: by 2002:a05:620a:31a5:b0:93e:920c:bfcd with SMTP id af79cd13be357-93ebd23d1a8mr2495230185a.57.1791967113343;
        Wed, 14 Oct 2026 01:38:33 -0700 (PDT)
X-Received: by 2002:a05:620a:31a5:b0:93e:920c:bfcd with SMTP id af79cd13be357-93ebd23d1a8mr2495227085a.57.1791967112714;
        Wed, 14 Oct 2026 01:38:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de77606fbsm4193764f8f.53.2026.10.14.01.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:38:31 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:38:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liviu Nicoara <lnicoara@thinkoid.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-hardening@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
Message-ID: <po34sdy26aqq5ze2bmbufqcbwwcmzdyhmpyyude2e6thtn6evv@rwulmq43yljd>
References: <20261011-dell-xps-9345-ec-v6-0-2a66a364fe70@vinarskis.com>
 <20261011-dell-xps-9345-ec-v6-3-2a66a364fe70@vinarskis.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011-dell-xps-9345-ec-v6-3-2a66a364fe70@vinarskis.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfXz5EsMWqjbxqS
 9WxbxiP40Z78IQLX9lt4IxCIbSiiASpGA8keOsRVt/0ax5FdaEYhBQvOAN+gNgbsZOO927Kj5AN
 kdDseCa5gypCtL91M1GbJZBinSm1bOo=
X-Proofpoint-GUID: mHE0jJgcyGaNRjSl_PV4jK0Pc-71lEhk
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf3f8a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=I76Qk8w-AAAA:8 a=BDX-M9UYCxStvK4FQfUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX8sFhogKG1BT7
 MYZmd1kyGacJNmI3pwS8NA50h+0w455vHibha4Zo/1FZqWLsg/XGzaXKgFAQNcb64rE5G8pjMD8
 rF6+2ELOOjd9mcxgrPQg+wrAmI/EXGyJUegZf+ilbkLE8JMCDIJN2u98F3vALzaKeK8Bw4VvwhB
 i4J59UNs4MCK7DtGDqvlDQBYMsrhOyy388aujChklbQvMotnIJVx6477S05c20I9v9hIn53AJ9O
 JfWKNm5BKTuDTdQLUFCQbGPsrPTpK0icOSd9xD/He7827kirsRBVIjlVS2WoqsijjWZkvUp3VHP
 INK77968GCGCYiGNKeUYybX+bcA8wpSsyTgWZHwIQYGufj7UwybhhA4gUhXrxunFpA9M/rrGKn7
 6SN9G2RL03XWKhvUWLZjPlLf8A38hgElR+fF4t5RFjCc74kiUpCZB3WvFA2jAG0GSV5xhvzqCNd
 SEi4+TiBulzHSGrDFkQ==
X-Proofpoint-ORIG-GUID: mHE0jJgcyGaNRjSl_PV4jK0Pc-71lEhk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140034

On 26-10-11 19:50:10, Aleksandrs Vinarskis wrote:
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
