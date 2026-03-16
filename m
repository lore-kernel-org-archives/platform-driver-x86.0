Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7310538F647
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657967; cv=none; b=RJdBQL6itSV5N7bV3mqHRzBfQBaUdsylxM42Tge4PyLis78eXqZB8HiTdJrUi23iQGncTz96DQDxGeZS2KrVMsmMtAcNi9/7wTyyXpLGuKx8ZMEa01LwxBkMAWC04xEnXSHWUYD7ZtwevC1Jcf0tPphYGcJUSiHI3CGlUDhsbSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657967; c=relaxed/simple;
	bh=zfkAtaks8TnTGZoseOdB4Sa47JX+p1bUlJg+ldlxrkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMqD+4KoL2Dm1GMsXXXfy1G25rzVw8OvglN3hLeVlBfSPbKPbk07upZbeM+7F45Ns9Maqsh1Mamv0q4iETttr8/k75fZCQOsjyI4ZSOOi7Bo/ic7e9dsmIwbaEVa1lRf9+uzDz5ap2DwFmmxpb3zu0bDwgNoH2H1gGyfUX9UjoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SitWOfax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgAeAYj4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SitWOfax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgAeAYj4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64hcu744136
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E5HsmY6Th9CL3tlgqtolCjbK00YEQZ72hvEx8QM+PtU=; b=SitWOfaxiWQj5ITT
	4Pg40LQQqS1JmtiO/O6evt1vjZ7pox9pQz1VIPsMqdSRzujGWRzQKmNqqse/d7aI
	DNR5Vi4VJVCYGUZcqjtkk4XTIubCAgttzCh5axFn+F/lGvU6EsYslFo4nrNaLsDQ
	QsXd06KuSoL/dPF8xsS7RoVi4Q/4BDzNrOtQDPGh3L9xTW0mFfRXO8B3teCekWgd
	wQ2EFqkjSHPDKNtLc+Nl71mKO8VUWGzjXgaEEeTgBbCEC6spXZ2FJHN97HDF/jOn
	x9mqQhCYWsYZ7kqJtOxFtpbsSYv7gyCtQ8eWViTlZeo8bPS/BiWzVy/n+a2+sxfJ
	TuoU/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bdcgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:46:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb456d53a5so303107785a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773657965; x=1774262765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E5HsmY6Th9CL3tlgqtolCjbK00YEQZ72hvEx8QM+PtU=;
        b=MgAeAYj4PEhD4UTdx6xR0JoATtXscQrCWFZstNECdBTs3X41TWbv0ZX2vv1b+nXQi6
         jg+oi4zDrcdXZUcWJC/7YSImQWoUFYWbMgdwMaL5hnSAuz+p4Iv7vP/E8iWJr2xV9Hp6
         j8bzLA/E6ZAn60T845NkyjZGTYW9mHZA1kgov+KhZmh8V0fzbl9te7MKmlsqMEhJGnfq
         AazkW/AEUJlQ69SpRYOgNBFQTScRNKZnoQwDB6vOgfr6mPiZ8smB1lxm8Ny71c+ZhDei
         hFolzoXhB/Fqho2jFzMzvh18ffMh+OC20QmqiDw9mvtR0zAoncKBfkpVpnLTS2vS4MyT
         FeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773657965; x=1774262765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5HsmY6Th9CL3tlgqtolCjbK00YEQZ72hvEx8QM+PtU=;
        b=iC4wBYWELgc6v1DM2gclKbp+9FLLQSryaikmDgbkjmagBdNnZEOI/w/PeHlYTvd5Nd
         ZWLzl7fKkQ2hcHwt4lPiyslPze2rIWNuBFthXRVo3Lcx0eUNymU3jeY05mMxcvJ6h+z6
         fscbNdxzJ83HL0TvaA2zOAO6OFWFnta994l6Uw3iPJpt3mwTmjFc5i8gOO+/7DTuUFdJ
         8s3vAfZr3Ph8gDcDFNujeImLgRUh8+VT4LKdW5TFx1cHfdGz0kHS+Fmnhm8+2vGWeyPD
         jgi+Vz8Rrfm8TIxDAMPrlmQ6s+2tIUfYZcz/Bkm5stC1vt9K86lWDj1kQrFcrWLZ3y/j
         6Dvg==
X-Forwarded-Encrypted: i=1; AJvYcCUJdu9jJBIfVdqyKyTntRV3HqDhw8GBjFPW5C2yXtdUiSPIcrQK5IZRjA6Frh8+ZMr2hHRqxa0qWzHhm7UQMz34SoGa@vger.kernel.org
X-Gm-Message-State: AOJu0YybhSyHdaL2CEMOrsxa+V0CbsvtP7bFDSOiXgGHEm43SVk+Iq2y
	6OCSZILW6ZX+YgP6c/O3f4UFv1BuFCC1YosLeBIwJRhCosxll0pdC2N+cXujOnueifgGo9Bw1kZ
	0jkabo8Jo1RNM0vaSp5Bzzrgo1wfAlxLvn3oa42D8UYDlIvFAux2zwterbMvNQ+TIUYsVojQCNo
	19
X-Gm-Gg: ATEYQzwU+fEq95EWM9yDHd8AXlKXQm27/ouv+napq/4CohVbvXvcw1gQ3rmr31nEyn9
	qV8Kflbip82Y5a/TF+oG+fOGmchXndNKxpSXz6B4Hs8niyT3yeh1KJIHQpksWTWmna2gdG3Nd2Q
	dDvDdyq6aHNNhXMwiZ4MdrACsfCMdoORpmiWSEc7MxPLUC07COaMntUp2p+5g/81jEB3NIhlb45
	7oQZMSXO5soTrticXyKguAuKC4xRhMH17fqLo7j0FEQC9DhY8MZTZgMlgaHStX+OmIW6nZEiUvQ
	CChHWrgubA02YKaGSf6cKZ9ZpNqJ9NvLwtRe0vzSbJAgQqO4LfVuTk0Fy1vgciI/jquKeENrHNf
	RN9Vva5kZWckbodp7k1Q8Vt4erdN5Kq25NxGghJjPzi5/bgWooor0IaQNIogtzkgKw6AISqK1rM
	3beYY=
X-Received: by 2002:a05:620a:40d0:b0:8cd:7fc0:ee15 with SMTP id af79cd13be357-8cdb5b60335mr1300129485a.5.1773657963301;
        Mon, 16 Mar 2026 03:46:03 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:8cd:7fc0:ee15 with SMTP id af79cd13be357-8cdb5b60335mr1300127185a.5.1773657962827;
        Mon, 16 Mar 2026 03:46:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350992e88sm4976671a12.24.2026.03.16.03.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:46:01 -0700 (PDT)
Message-ID: <3493e323-c666-4a34-85d5-fe5abb5fdc6e@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:45:59 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
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
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-5-ca9d0efd62aa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-5-ca9d0efd62aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7df6d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7wtgjnKuI7ixzQLi8VAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX9tDszcn0NkqH
 IVZLEzgZM+6dWHObtYXbsjpNooruuUPEJVwUiH+VKw1ST+P5cTTJCjqLlg5+QBHGnaf2LXdk4zf
 6QlNxpAYjBAdHyKxHoiy/Sb+PcTl49R6y7VkkZW9bkOF/zdTJNdwzGNOhdtFeuIkbjUSLdDw5Vf
 DkGWZgdEczyXx8xTSNW3hK2Ek1IXEThMfE78CIBuP+TgDz4JnAgpMoRq7e/WS3PP6PHfv+fr+WP
 ihKKN2c9wXAXRdVsPamSbrFiP7YsxGJpxPOgKrWwflBkjy6P+3goYkkEdeDOJhU0LXHQBks7iXn
 nhmUeCozLMJbvV83b1A097WWiUZgujKtqgnbhesdoCqXhoLnajOomNSpDBRt3SgmiTakXS80lrl
 DUrPaxK053ejmR02uEVqh3ku+ojGLLR4KJq39DPehdHlfd+uhpGeFq6pUEijearGrwDDgQof6ol
 tI6h1VbD1xTh2SLSpCQ==
X-Proofpoint-GUID: 9Vmf-ZGLWveE-2TiltvtWbIKGQx0_G5M
X-Proofpoint-ORIG-GUID: 9Vmf-ZGLWveE-2TiltvtWbIKGQx0_G5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082

On 3/13/26 11:29 AM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa IOT EVK boards which adds fan
> control, temperature sensors, access to EC internal state changes and
> suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
