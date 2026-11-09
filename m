Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219592;
	b=Az3CdTASYkeqME/LDOMopFGbLtDaxIpT2Je2FtGwHhboG1f3DaKpD+EVuzo0gNtEI6MO
	 yboSUrLbrLr3XAeLJMfojSB+eAJEdDrvRbhI8KWECOlJjGfURBZDOKO5jch/iCUix3fZi
	 VsyeSh85NAVYHJfoHbmo3bhpPFaYbW8yokINfUtHr4gz+GC3w4a+Xpew7DuTAFpENsebY
	 87BrRcPG5eIbo5WNQk8kKcbkPik9xwvTQIgvdvLRk6EyU0tm023ZksZZESpBweunhc3tU
	 kTRNyF0o8V5G3a4QEsVKtdPnpClinCltUiCm13eL/pnjX0K4lJuA/Fve/AgoZkO1Phg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=;
	b=aU1jL0oo6mwK5oo13v+JI9EkVHOLQII4+7qnyPM0xq7bPMqa6JFEpnRrp4M5ot/gyV3p
	 +3ILGGsdWlZUhJRHpZcvRO/cm4x8edh2O3ybX/8iG2tWzZBcsP8/nkdwz06ZmcY5I0zqj
	 Wk/6CUo5h/syODKRG7JT04AWQAXmYVP2+fYa1IFUOdDqEv5pl/UC3i8WUOx/ugdSxvbka
	 Z9o+oo6jfWnTGEyVDRKwntc3E6Jf5RUs4j5bQVxBJsHU5puDqWpCk4b9qJ9MmQ2/n4Zs3
	 cnoR9mRrP8mOV+nsOPNiUgpeiih4UwLkvH4YoPBgk7SVcnIw1FXq8CXUxbYGQ+sjw8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lb8IhuSf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W40OHsO1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65850606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 10:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65850606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lb8IhuSf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W40OHsO1
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99uldm3600451
	for <platform-driver-x86@vger.kernel.org>; Mon, 9 Nov 2026 10:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=; b=Lb8IhuSf2GJlUU39
	6/SxUsyX1AB986J1wjCqXviD6ihPbVZBOgiWdgTU5gEC4GpIdt/n0tbDKmadVgyC
	qLFjUGVRlcEEgawNthi3DI0lNwZzCa85V6TMRCn/kOrijcB06Iu0cDdVazgnAIBo
	4yxjCqyhYtgcIwHJZxARKc4lTojNE+PhqbGG6IIn/VXLzIc5vbVTlJCMVprgeOqM
	KSAWOGgLvFAfG3N1pMu4Dbv0kxydAp/iV+ZEmqHVa1K1nFvoJOnLOETK2bMV34YU
	Nf+0TRyl4XbJa32N2hjLr+HIoiy99C8q0R2kMnkHXrC+99S+FrPvZub2UzHPxmRR
	Ci40bQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua588hbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 10:19:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9460411fce4so11775685a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 02:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794219590; x=1794824390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=;
        b=W40OHsO16Xr24Nja67bwvYPmWNpPdDk4nxeqo7GERIRZBZSInquSkhj9HyFNhfFlmq
         8TcmsqUN8Gz/1NRFlN+mjTVmYW8CiWmbEekqeprQfkpJN3vxFrsl1tPYxtOSn7PmX+cR
         pvmU+rYD2FgDGbhJ77om3Tsu+2os6g75aTomyoMWvJjMOFXSDFMktEHNhMmx7hKC8m8M
         JNzOirk9iSffXOirvU0ztCExImOpXW6MtzVp3GHUH1ictAfI8VBahp6dG1QrMWMzpAbN
         b6McIQlq1u9zIbV8F8mFXfA5KZLB1a0dsgRPVJKuLyuJO1kT6X5DV8mToG4uEB/wnP2D
         tYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219590; x=1794824390;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=;
        b=wP17cq+rNeH8Xjg9RrUbWeQ25Qs9P6uPNjvaVsWM48i2d9nnBX81ubz8rq6Gok4osV
         SikmbzLLnvouGoDvYb+HXCP1zWBBb2hhBkWM4GT4UIejTSYGqao9AI9+mI5vheMUbY/n
         xK74c/dh9BAnWM7MXZmfAQAZoN6tNSkfFHd/FAal9r4/TuCxdmrlWK/dIPMuz8yXdCnk
         nDtPlwdhVscPXKLQXD9lGSHq0+cH1ucjHHdkZatTYZ+2lRiIIR81xdT/MMM0MXF3V7HY
         dKBKyD1Km+LzENTlbAau6DQYhupPpkhpvTiWnx+sTbPFi+xKhAaf2+vORo8IrEM4FcDg
         Hveg==
X-Forwarded-Encrypted: i=1; AL+hErHNc2e35enm9INIFaarA20tB6EnD64CgKZ1jtp80Ja2dv5U+ydKiSV3EwkWYXtYC7ziKNfG4g0pJyMDM5CsdLW9yuef@vger.kernel.org
X-Gm-Message-State: APuU4Z8yAhT8THvnj+aN/4zuMNF+7IhrKNrA+l5n4jgCYQ028qJhAS87
	8ccAEmd4ruYmmLymFHK2MUlYMa5eAPX8WclSxOVE0amRoz1PQ1S/H9C0F5YAGhM5BEtxB88aigr
	WMxbhwcTi6lwtjWGe4Zd3VuD5njbnt/eDJQk3MvoUaDxZKCwBQ3TCYZU6ZeCoBmU0JJX8PlDBMF
	jB
X-Gm-Gg: AYBFou0Yn4mOqCZ3LYpUuDQ6dkbPnW238bI1YBLVMart4LCKoeb5cqjEm0D/xMYYC+c
	yW86M22/q9HKcOy5OHNr4ZNwhYtrOjyBm3ExLBBwV1TT5MQA7/dhmzvq1WZTvn26GMSQAWaavlv
	A4gMvvarXXixrqtcRKWO3C8Bv3ubcnEBeeQueUQGWfSG8raZbNqBp4epJaSpgAjz4KzSZyRG86b
	L+RTEliA8AROd5IHpVkHdKnD2TKIeahqze2T8w6Qmuw+UaLuqVPkJcaYOiUpi1jKHhlBXgrqHwF
	RT/84j8tC+1rrzEpigysjOQzOEakAxM/Q/tppPcnNe+Hc3zoWrGpFX+BWuSyPyi1oi1/tfpeEn5
	PY4qq+3qpX8XXlt5ySqsdNJO9P0jetMJs/7hUpgG9YwLtz0DtRNIZS/4GyNq/k4qwWqSlGA==
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr510547585a.6.1794219590603;
        Mon, 09 Nov 2026 02:19:50 -0800 (PST)
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr510545085a.6.1794219590095;
        Mon, 09 Nov 2026 02:19:50 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4af502sm146889866b.55.2026.11.09.02.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:19:49 -0800 (PST)
Message-ID: <7dae5091-6d51-4bf9-9a94-bb2d98e2ad28@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:19:46 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the Embedded Controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX9+m2up7ENVZa
 aO3U6vY+UcxNNDPVl4KM6wQdVbzSpVwjhMxcCa62TiTk8hMxcOe33G8YDtMmVVzRmfgiGMOEUHp
 3j6wPGRL1KTkLJqN1fgzuihtz+o5OsWaRnn/HGRbWXzg9LmOTQryUzhwoFxpUJB5wYeGja7NADy
 LjZBsu3ep4EnUwiG1A4X1OfUU1eqwiCXvNXmpWr3LyFEjHAVVT8FSd4oNcMN8c8eMujaYlg/exV
 ls1fWxcSOoSzAqvy6/8Eh8Fnu/XLD07XodAkgedM0gwj602wLEaunlWYhXSf+E8Ih8Wb1aL09RL
 hSgQCjTac8SaxeacVt63RtsZ1E42erQcLoIUwgIpuvANmhoIvrFxmm+EfdUB8MZAt5Hv1B9hQi2
 UQZ4KFIojt4szdwoudbvmWIc/u4oGddYIfPMaPB+BjDOyGX96JoRBeiXDcsBhRzHZH6MOgicCRa
 Fa3EA3y1yTBambM/T0w==
X-Proofpoint-ORIG-GUID: NTAp7fT9b85iR5ksEXqAhFXaquJ4QokQ
X-Proofpoint-GUID: NTAp7fT9b85iR5ksEXqAhFXaquJ4QokQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX8za1VR2WEcRH
 jYVfRDqZbqhc05yNovQjb/CW/QBFUywKh3G7i+sjAKpwjHXO+9v+L9Xx0S0F1UPbK/abPNsDSuX
 OqoEOwpZ7LiKPmqxpzWb/dTpTM+/nEY=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af19e47 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=J3gOo0Kj3gncQIyMurkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090041

On 11/6/26 11:01 PM, Abel Vesa wrote:
> The ThinkPad T14s Gen 7 has its embedded controller at 0x28 on QUP
> i2c9 (ACPI \_SB.IC10). It uses a different command protocol than the
> Gen 6 one, so describe it with the Gen 7 compatible. Its interrupt is
> GPIO 66, as on the Gen 6, but the firmware describes it as edge
> triggered, active low. Using a level trigger makes the handler fire
> continuously while the EC holds the line low, with no event pending.
> 
> This provides the EC hotkeys, LEDs and keyboard backlight.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

>  &lpass_vamacro {
>  	pinctrl-0 = <&dmic01_default>;
>  	pinctrl-names = "default";
> @@ -987,6 +1005,12 @@ &tlmm {
>  			       <44 4>,  /* TPM */
>  			       <139 1>; /* TZ trigger */
>  
> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;
> +	};

nit: please keep these sorted by pin #

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
