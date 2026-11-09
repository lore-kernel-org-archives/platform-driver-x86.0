Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222473;
	b=1l/tJZirOFgqqNsca1qc1vQxS9iy/uYf9SgEFrc/oKbgRVAS5Jkw9CAgR/2J9+TKbC9C
	 kIQWM5uyIeh1ziQDotx4lzBPSvCh4t/BC56+13D+JRnN0dmSVCCsHG50E5qJhbIFQ94fE
	 wqQBRUdt6l+CNpj5XQyFTgHwzJD+0xzu/mqdhiUDpKYzoOBsUKC0ayNx4JB7hsol6pazY
	 gilFKXXMFFm0At4a0FPwtL9nJ4t3Fbr4VsmYlC17hxY1gjueQJDgOEgnDaR+CDEkeORNV
	 h9C8VPdw1J3JLnEW7RGK6H/ivXDQyz8yN9oLDiCxqVbQwgzM/9yO492oBW8QGALFazg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w1TZas2nUn4Iyhi9A5CEWWZlSF+cg7JudGhxYTHfccQ=;
	b=SOB4Pj/ORLrx16Phg4ty2uopD58nOhwjauISTYgvGZM23nuSzt+BWOgDE4j+SvQEC0ed
	 z6JlFx69LPQbdtprKWEnLzWYlAu8VMIXCV5KNASRy/svdTG/HFHztAr8nW0W6KOtKfrne
	 4AOu1Rwpr8Y5QKLSf9UQ9aIVQQRAexFcHqv3HhFprZfP/+NekTnbpFqn2fAvvmPU/feoH
	 mOxGJ59yToCR8GwafZxCzsWCQPXChgZuWdacjvKKKjuLOW3X+XUbb7/5Tqb7BUZBlufVB
	 LlHCI3PDzfByAS+94UyRIWRj1yM9/axe9qvHXdnKFPje+fldnTEjs7xWwUUNTny1SnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imtvoHwe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDBoLGJb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD84606A323
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 11:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD84606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imtvoHwe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDBoLGJb
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9AJDro4127223
	for <platform-driver-x86@vger.kernel.org>; Mon, 9 Nov 2026 11:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w1TZas2nUn4Iyhi9A5CEWWZl
	SF+cg7JudGhxYTHfccQ=; b=imtvoHwe1TePJNqu7ofU5s7Z+PeuiQMjH7T+T6Eg
	7KuU4BNkH+mMEByIzdcoBf+b07G7+oodUIg8HscksUnb88yKzQ5KSvd5UPp0PEhI
	X5+Z2DrTnF+gy6xx/STu/TTTiUYbNNtV2pcxfuxObjRqpdbVZXgkHZgMTRbYk1PE
	JD337eqeHe5vl2u5ULAo5bpP0zGtvDZanQf5BFrRRypA/k3xaU/vBwqXLzV1je4w
	cpGfF2ujU2opvksfN8+bP+6RAsTHO5HdDQ7ri8XQXCrekzGWRyN3WHkFWBrlx7z8
	ZayvXzg89jFRfBrzafleEQcpSnq3MZ2Ohvm/0sf7BlnfDQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucap858e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 11:07:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2d8e6fe02so616818137.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 03:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794222471; x=1794827271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1TZas2nUn4Iyhi9A5CEWWZlSF+cg7JudGhxYTHfccQ=;
        b=EDBoLGJbXKlwqaS8YkqHtf8UCv0iuglQip6x3YrR7AvwU8STF+IaysKCH1ULJGvA/O
         0/pTPE4VQ0hx4xl57SawpeeurSttsw3Eao72r5quJnVLAFc8l2Zap8VYY8LQl/F9FEM1
         u86D8qPJcWb1S2XY09r+NquH65wAaF9Z/psJ2MMs9qZadm6BatGkKKhc+pYBb9EWdyF3
         Rhk3r5MrH8NQzhhIGVA2vbnWvsLI/SNySc1JzFEjFFragvtWrvr5Nk/SW0IOO/8RGPJm
         WPfw8OwD2S0FX71FphluFcK6eObm0iOLjmxfShu6DZc+6qVQsyDA3rTIy/oTv+7UzATW
         IAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222471; x=1794827271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1TZas2nUn4Iyhi9A5CEWWZlSF+cg7JudGhxYTHfccQ=;
        b=rLzhxWEmWmz/wOc1jjiIJsKxxtcCwannI6roHMD6+DJMSGPe/oLbHKd26lS1Ltr3pQ
         1lu3cdkVOBiL9lmcxPcPI35fwk87+Jtj5aKkUEp/aj0TuuyHVGa9Xjm9+aSZEVnTjgIA
         WwPcPu/Ho3iJr5oGmPsY2KIqlalU9A0qioXGynQbVMmBcoXuWOT18Yn6BDapEGiaMXBv
         Ly/w3R4FXkheZQaJGRCuk8w5JoRDNgyoqEEfeKP7r8ny9n3W/hRi1rv/yS3cO2kDsSws
         eEYzlIA5e8ui7JjjVbbYr6WYof0Blh2cnNprea9/J+YYyNeVmGJKrv6w6ddJgoF/sVgF
         t7vw==
X-Forwarded-Encrypted: i=1; AL+hErHkmcB320kRJRny+B21TZUVC+UCOnsFE6XtcZRCDFSX2I3to4yEbs7sEhSZ1dlpo4ymnOkS5zw9uCGjiRWHvaTXNXx9@vger.kernel.org
X-Gm-Message-State: APuU4Z9riaMzSacJ4+nRZDcai3CEGnaWd7i9hECRyozgJEDQXL9fFuz1
	lgcydwHCFe47Sdp2Vawz7zobRljK4nGJEfiY++nG/RLr5sDrV9BhXlRtu8iPZdMwpRnql9fKCTs
	h+xEvxKxpDhMwsC979zFOfDEnKyucWWpYQwtYJSY/gmphzZQIz3zJULncP6ctAdNV2HP49QneRf
	0V
X-Gm-Gg: AYBFou2VBBx08xrMPW/nVLelv8CU4S9xEsxYq4VMnCPF1lczRrVOfOPI/oDR6ruHsv8
	kXz4OwiXvG+CTP+0LWkF0zTmoUluisw0sJy2nbq3atibG0k+AForS0A3peYJmaORf+dr7lkZAvN
	YzIPryJusYc+xi+9kce/JNN0XdftpyoN0tYUQktrS/wBagNAn7em8jn5DSCaDKRBUN74JU/pC4H
	u+cDqHUSRE0tO4EdzWDEUEv65w5shlzaNE2OWcS/us3/vyBNU3L9qrcGhCHX9Vly6mn5EhtvJ1D
	LsA+uU0MkgnPV6PM7z6kBGFybBfHS0Jf4ZarXB7qfk2wq74BWayUHWOAQE24lUr0x+hn/7/lAhr
	0pGQl9sCK0ngEodja/WObKSFSykbhBfaOJklOWLVvhKNo7q1dxBRtakF9sSgzJA0=
X-Received: by 2002:a05:6102:6044:b0:7c1:9f20:36ad with SMTP id ada2fe7eead31-7d2dabedb56mr1076603137.2.1794222471001;
        Mon, 09 Nov 2026 03:07:51 -0800 (PST)
X-Received: by 2002:a05:6102:6044:b0:7c1:9f20:36ad with SMTP id ada2fe7eead31-7d2dabedb56mr1076584137.2.1794222470405;
        Mon, 09 Nov 2026 03:07:50 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-496150c6e90sm7740628f8f.2.2026.11.09.03.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:07:48 -0800 (PST)
Date: Mon, 9 Nov 2026 13:07:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the Embedded Controller
Message-ID: <adkqpnhp3gcxjdot4yratxmnvi3mmkyovbusff5ypl46cqlw42@cd6on7mzjmwk>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
 <7dae5091-6d51-4bf9-9a94-bb2d98e2ad28@oss.qualcomm.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dae5091-6d51-4bf9-9a94-bb2d98e2ad28@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfXzr6gW2obMu8g
 e9vAF3z7ZSMBdQNfItCkniScaPiEsp6IwxFYpV/8ztoLMFXRBfeQ7E+ROuLnPlZBnOS/KLfZJyT
 LaJOaKTpomJGaH5fS8CACwMk0GzKL1vBwCVaT/cne2nEgvkvp0oWeTVP8vUcGzK66iTw8bTmN3d
 t8XC+I/GOFw8l64iyd6pUoBF46nng4boEqNdEjz1Cp9FQnJR96HPzjknKeY3VkqoBfBaGfPKuP/
 QnmgudzLimSjWuwpmaFW5rmUQlqIc/YNunzxj5W1tRUeI2yk9Iop5d1I6n6Cpl1V2dTEt3v8G4I
 e13IJLvkBUCVrzplDCMJMQDZD4Sl4bQW0nWHUWR9dMyQORQ4tuwxTFg8Ve782qHa3uLGYrieIf5
 upjJKEzXxkzmqDsKuGnLTp9hz60n/afKEAB2RlkGD9WT2T/2Tvo/4V4HdCwOdK+J4PdSubpU1uR
 f5rTMWJPnUwJ6yY8lTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX2x+gzvKaxIF7
 1YxpPO8gljzATufogNb9/TLE7hiraJUi0opk8KBW9GDTVcaWyNpuCC8OO+b8Lw4VA+/qALH6K+Z
 JNrmKgl1zxOMQZvevdZcona6ZL4nDbg=
X-Proofpoint-ORIG-GUID: -c8TcGEF6sCa4z9siHkDa4FbUZ_vSF4R
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af1a988 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FPO0yo-LnFrNtlzATzEA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: -c8TcGEF6sCa4z9siHkDa4FbUZ_vSF4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090044

On 26-11-09 11:19:46, Konrad Dybcio wrote:
> On 11/6/26 11:01 PM, Abel Vesa wrote:
> > The ThinkPad T14s Gen 7 has its embedded controller at 0x28 on QUP
> > i2c9 (ACPI \_SB.IC10). It uses a different command protocol than the
> > Gen 6 one, so describe it with the Gen 7 compatible. Its interrupt is
> > GPIO 66, as on the Gen 6, but the firmware describes it as edge
> > triggered, active low. Using a level trigger makes the handler fire
> > continuously while the EC holds the line low, with no event pending.
> > 
> > This provides the EC hotkeys, LEDs and keyboard backlight.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  &lpass_vamacro {
> >  	pinctrl-0 = <&dmic01_default>;
> >  	pinctrl-names = "default";
> > @@ -987,6 +1005,12 @@ &tlmm {
> >  			       <44 4>,  /* TPM */
> >  			       <139 1>; /* TZ trigger */
> >  
> > +	ec_int_n_default: ec-int-n-state {
> > +		pins = "gpio66";
> > +		function = "gpio";
> > +		bias-disable;
> > +	};
> 
> nit: please keep these sorted by pin #

Yep, will fix in v2.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks,
Abel
