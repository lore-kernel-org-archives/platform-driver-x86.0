Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B160E283129
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Sep 2025 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756808941; cv=none; b=sRsdXBjObC1Ic/aSCpVlvL0I4fQ1yTQd8Uu128ZRt8Bd8biLxIfWIyljcqnwVvKN8bT2QHAEhKszhpsWzqINFxXHNDFH89zUg9WJETenN16CSU+hlKjAXZxq6y2RongOexO+uino/N22sfjhnxyy9x4W84lNkS7nGlTnI5m7BiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756808941; c=relaxed/simple;
	bh=L82M7dFiH3/Cpk0L5yw06355VRt0Tec0z0oLTrV9hyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a76w9S+YS9fzIGkmBKYz+/zeAANPIAJUZ2bejeX0bbgCNIJbP7noPvGCa4y1oaL6QSTY6e+cU5bBYvl9FPI7PAczZB/tEx0Nd/muWlBOspXVnL/uqd043zcb0y6Tx2dUkDu0sF30h4bYAB/pRayMsu7A5SJBZjUX3ynqhe5kTVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLwH6srf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLwH6srf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582ASNOf024996
	for <platform-driver-x86@vger.kernel.org>; Tue, 2 Sep 2025 10:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XLwV4MTrk2CPBgYEOsRH/mqT9xEEUCBdYMAW2O+ZTN4=; b=TLwH6srfdadgZ2V4
	argbbAp+p1vQ0nAqyQRJdbIhIdZJPDaJO+VFZ5MHkH7Xj5hEloe0Cu1n8ftNsrik
	cWsIwSzZfU6jCIPbR4rMGfRjyqS054I+rMHLPb+eP1CDqHeN47LP81N729CMl0J8
	bfoynS5H4jXVNgI1hh7LWnW+SAklqGNxoOs9tNvsV9gdSZo+lhQ7KIC6WVwjezDa
	x7B5ocKx6ZTSAzWXDZBU1MmjxgpsFIKxJHE8bM+PqFoNFGwCXHG0QnvaQFlhxP2n
	XDSVGQfu0vsq+Vv06zqMjTo4iHXlYvSB5zH+aZQZ6eo0j3W48IoxG7dHZHOd95uF
	CgIVgw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuygck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 02 Sep 2025 10:28:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b3387c826eso6991551cf.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Sep 2025 03:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756808937; x=1757413737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XLwV4MTrk2CPBgYEOsRH/mqT9xEEUCBdYMAW2O+ZTN4=;
        b=iVSYE0fOtHT4byjxcoEaN9E5vMyu0OzpDfxj4h6fceyA4JaWk99j2txreIlg8Y3gi1
         w30uIn9oICkRr8uwrEbLV10041xD2jlveq0p/xuXjvK9togQlm58PQY/NgReaWLxtrEm
         GJfH0ztDDtzRtiJuiR0Eu3kF35TnNWcYKcxfXOOd7KzSQQS8q2LFeYFnfoKBTmYy36yd
         V3XzDG2ENfEsjPJ4/thLvOmVSyXDIWuUIBfXOCZwdLQyDsPbS6ORogRk0MS88bir24Xx
         7dD8JSTbZzTy5Jolbu9bFW58fZGqnHNKJVngd3slQLCAuj5z2LOOS6iz6EzfHm0MRAPm
         gvog==
X-Forwarded-Encrypted: i=1; AJvYcCVAOzlMo69eGJ/ojOG9jwaXuetasRHuEueGMuT0YE5buxnt2uqC2yC46F/ATw0cJEfQOM/7NKj2HMKYOJ4oOvEoF/j6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4cQdmxlrGNknxZb9nS4TIDHQgsbsFSfH37FMLAShWEQKpwL8s
	ZBrLsJTLVbJXE0lD7qndc/WrAxGSmw8dPCJWZUzxxb18BuNL4ENbQIu895Ne5VxW68YsgfSUSZt
	GB7ZUP3rNl9f4OQdN3kanOxHgkLtRhnnFb0aS4nAh/LEvuM+87E86REGkN7N0o5VUByRxlbhPFc
	z8
X-Gm-Gg: ASbGncv01wVgS1GlPQrDtvYx0R/pmaHQBDGrwohWGJUKOHcD5rgtrlPErW21cGJlSah
	hwPAal4a9RWiRJ8IMruQNO67JY7wjMC0+W8LlY88USvp6EZ+bG6RMF743rJP3N3dJXEWYbnqVX8
	eeEaKOS6ND4FMBnQQRjD6G5fr8NmBrjbt9Le3lkFRg+k01U2xu4njhI5JMzFEE2gnpPBsuCf+gX
	xE5sLrxTopS6JhAJQLJI2U6btyq3wvAR6kZZtdbNeWgsVrsoabRta9TAXWVIACC/PruUVRcbiHR
	dOjwnhzYtgHGfPy/Y7tdvnf00on5npJP92a9wZGafZZ16Y3kBt79s+hVqu5v4aXxTNyRXaQrdB8
	uk/rTop8MSgj3Mw8YJNP3iw==
X-Received: by 2002:a05:622a:164d:b0:4b3:d90:7b6f with SMTP id d75a77b69052e-4b313e6f3aamr102448511cf.6.1756808936702;
        Tue, 02 Sep 2025 03:28:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRfEclWp9+H13vGsDsxjPzHN/XU4Rv6g22xQOuu2R9ylSi4hDyLKWJOeJWbCxzsepW4L+3KA==
X-Received: by 2002:a05:622a:164d:b0:4b3:d90:7b6f with SMTP id d75a77b69052e-4b313e6f3aamr102448371cf.6.1756808936191;
        Tue, 02 Sep 2025 03:28:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0428f88a61sm491858966b.70.2025.09.02.03.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 03:28:55 -0700 (PDT)
Message-ID: <c79a4131-bc24-456b-a071-85ca4b17fd28@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 12:28:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-t14s: add EC
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
 <20250831-thinkpad-t14s-ec-v1-3-6e06a07afe0f@collabora.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250831-thinkpad-t14s-ec-v1-3-6e06a07afe0f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX+nY92LbLTDHH
 saaZEMlwMJGRcHcRMwgO2IVkPL+ta1vvdV9A8f+NhoRufNiFYgmt371dnZNzQZx719bbr4kbd/u
 0wboJvF+FnaxTujBkR+ZK6dHgsTTwg4qnGHSsfMpKx37wyh6UYpmi3W4d6bAvcbbH7PzVOlyhhT
 O99JS8I+C1gyyPs3FgV2sjLI+V526UFWfPdlZDXp+pivkrxlC247a9EaG6tWPSxivKPS3NOZ1pX
 hZRCe221o5RHAZQ9VTj4UXyRAcUluxo4FDb4x0MzJkDS7MUjvzXzT/jGl9y2+tN/+uxLH3ZYoCH
 PXO/Vjfnik+DSlVjq3m5OLNkO/D/e1Nvg1iiBbNECslYLQKLV7g2773QJnbppT9AksuBSwFOsQZ
 eoG7hVFH
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6c6e9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=BYuMXoiSC8B881HoM0MA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Zorli1K6ADJ12cKuSZ3ImLf6as4mK6nX
X-Proofpoint-GUID: Zorli1K6ADJ12cKuSZ3ImLf6as4mK6nX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On 8/31/25 11:28 PM, Sebastian Reichel wrote:
> Describe ThinkPad Embedded Controller in the T14s device tree,
> which adds LED and special key support.
> 
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index ac1dddf27da30e6a9f7e1d1ecbd5192bf2d0671e..7a9ec0c33b3ca847c5496e3ec145c70ccb7a3fe3 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -887,6 +887,23 @@ eusb6_repeater: redriver@4f {
>  	};
>  };
>  
> +&i2c6 {
> +	clock-frequency = <400000>;
> +	status = "okay";

a newline before 'status' is common practice> +
> +	ec@28 {

embedded-controller@

> +		compatible = "lenovo,thinkpad-t14s-ec";
> +		reg = <0x28>;
> +
> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ec_int_n_default>;

property-n
property-names

in this order, please

Konrad

