Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A06037C0F5
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Mar 2026 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792889; cv=pass; b=YgLzcVlpOVj4zSV9uxEHAXc/BcsuFtIx4PhcTrVt135HpY6pV5bKYv8xyUSDxNjI8+bzB/zAJsAIL8BhVw0Xl6rQsYi6kd9Eh8FWb7rF/upsTnHmrWMi9d8oA5GjMtfZfafJpEmwYSZ4gIghPTFYFs0sMAxpKC0TOjj3SfPIeIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792889; c=relaxed/simple;
	bh=tdvWNHoSdu2Iafp7/mrEBG/G+46fyd5oPjPg3sfvUEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCtd5ujnQ41Ow8Sel+UpOzxnIIKs7tFKAdtrURdRt2GyFUu6JSKh78WL7kjTPIPaOECMtk/D9Hk84brfKtF+xUiwzOcYZqUcCaPgeE73q07uTT5DxO/sXJwMx3UqDyfc6fVBU9Mdv/w7cJtYG7KkHSON0fn4n2zcuqyt43ftHe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZNrFYMs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqQCY3kp; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZNrFYMs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqQCY3kp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6269P0h13429901
	for <platform-driver-x86@vger.kernel.org>; Fri, 6 Mar 2026 10:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y9h7Pr+7iqUr+8V1CASot1k/T1Bc+EXpK2ZcBTLqhM0=; b=YZNrFYMsk/Fkkusp
	mx2tkNw7vXOuadXBQCGBDBUTlnpr4NZWNentC4QFbcG5JFgpAt1ePFONSVn3deL1
	du6XPuHnmNjRjKozn+7yp1KVO4GZaLcJhVStbKqzhRv6jX3CKxlmllys+4Hzatey
	JliSi8fTmWxnYIg9oOT7O3uCq0cv5Jri9G5kxjq3+xcNYylT8JoAnL+RjcsKgw16
	/Run8SLGv4x8IrgXOw/d+NvubpqD7qO6zmjgcukTczcfqrv9Zw8Q9k2STjZkcRnt
	HWfPzwo+IOH3e4ul5BaL3HOs5xN+3QhnD3tMo+cIdjqsEqso8ZuPjOWrhJrKndmA
	3Yz0vw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98g6qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 06 Mar 2026 10:28:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4a241582so4629963085a.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Mar 2026 02:28:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772792886; cv=none;
        d=google.com; s=arc-20240605;
        b=Vcbv5TvWTKMpPzh2BOEQJXLb2sfeYmEke0kRtTX6SEU383V/gRcls2wFF9g1cAxR5O
         I4r0F5jLNkdQoA1LlFd593ZpnQwR3Ac2a90LVcxXGKMM9laqZ5njJ7uWvQvq29Q3M1Hi
         hWWYfhVv/HAdzKVwlK8Y4AlOW8zTOwNzYyKYWVdjmBgVBkUaM7VYSfmfrsn4PPRpqdxC
         vjopFMV+Y+I+6jVwVlITKAZ7GywUX7bf1S0Vf+MMR+RK19q4c0R5wg4Yzf6gr3n7+rKD
         pqu6N2UBPSNcFsUMrqV3QQKFduxNttQJBAjJTvUTAG6gS6Cp2n2rSlYGkS1byALswj4x
         nENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y9h7Pr+7iqUr+8V1CASot1k/T1Bc+EXpK2ZcBTLqhM0=;
        fh=rdVehYCj6HW/301OV010WNLzyKLNreTV6ZbMGS17QPw=;
        b=IkIu/L9hnk4mA7YDINGgQfEwfDL33FDrNadgE4yuO6QMdBL2/bSG16fCbYqVMuJMzc
         2NqcqMW4bV4MFBNnBgbJhYoAE4gx8HDNWBxlKbZ5Bd3SkFlmXHVweTxIMoX3yjbnrvky
         dNcEPYLPotxQyiEIgtCTfc11OyevCSmZdjjSlmLMPjR570awJ1i8tgeMGCf1TdP8Iy+B
         M7/Xy0X6Yr693ccwEviqhO/E0xy1e6DTSBmZOO8JMhD01eMGSAQM9erZwCBOHH06n2Ou
         cbl3JrSHWOyv7NwgVaf/AoZ1LtsE1gPDcP950yqk8ioiWRVQCjR1sz+1iszKUBY4gdo8
         NMyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772792886; x=1773397686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9h7Pr+7iqUr+8V1CASot1k/T1Bc+EXpK2ZcBTLqhM0=;
        b=hqQCY3kpeVfrhRqcdnBdQtoIt0bdj7JPMGsmT4ROUjwNslACtgOzPUwP3T6y+jOGIF
         3LC1cMCswfoQcmfIeqihF9Ky9rHF2L38LUxV/d6YM64jYQB9JPvqT3EigQUOtdOW6JdN
         Z8YsY/9tMQc6QkkhmeRlpiI7iZxyHdwujwFU+QgFpScXnAFYtTnxcE8lNkbwfLyoXAvX
         J8Nci+W7Tx8yyldJVmf1ePcxtADHC1+0w5uOTSHP1tDh5ZRhQXhYRdeu9jcj6AC2PPNb
         6/9DFbfJ7mV+XMBYnpk57sCu8+LgJbMcYKtDXeS2OG4VIyUZLLRTUNcdCGyabBNLVflA
         mNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792886; x=1773397686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y9h7Pr+7iqUr+8V1CASot1k/T1Bc+EXpK2ZcBTLqhM0=;
        b=fBSpY9N6VXtlgcb4PICNam/IIFlC5nVmD9cvJa50CqN9cYUpDtaI12lY99U8F4SaUT
         gZBQL40pTudnBrP37C4TjahfYRPtTLjPvNjqz68ibtEcAn6Jn++/6hS7T+DQXG7YonLe
         8loiyCpoJaI6lOm8WcsRvDurUN8SEzTiaxwY13PeQYMPU7PAlya7SoBq6MlOqHMiZpZg
         JKE7F4nQo9wYB0jpgq5wW8MIslEEDmxbE/XO+uc2Sg3lRiItrFlWIMrRv4UWzagzmdFo
         skKhc6GOOHcPY96ZjrLuT9Q2FEXR1pbjMcrALeeT9aHI49Lqdy76H4Ir/MrwWwlwqQ5G
         CMdw==
X-Forwarded-Encrypted: i=1; AJvYcCWENDmM+H4Tmsm+nuEZOju+TGi13sxzEO7/qKN1rMwVPXndwGtHtM9OsGZ8EDMzzWd4AheYfMmNATS9DWVGmGm/ioGv@vger.kernel.org
X-Gm-Message-State: AOJu0YwDogfqjzFN19F6rC70wpY+lnTfoTJtpA5OMR9Kd0iFSNOpMYoX
	DShJBeawtEQ4p1E7AR03+l97H0CT7JunSDayr9SFcBeOzW+/UCsL5+VmpWmAo5EW8yU3aJFfF5N
	U7UhZqrOcFW4MfD2HRpjfpaoEotFF6i5zj3MNiEcLk1ESJ79glMypEQOrAbZIGRA8c7KwXlzQ/l
	aQMrAy+bSxkOEZTF9zpb4a5ohn0ih7kyBWlw6Vqry0DproxgQSoGM=
X-Gm-Gg: ATEYQzwf2xJKs/A8to2gGywGpK4z4vBctzQejHy8rSVOJJHk2jc/VcwdTrxV/WuI4Dm
	OZhF3fjU1Zw9yDylUuaaOynLR3Ic6zoROopYIVsXbtNVMxqxsIPv8WsHqKrG4s4MY9kf8ml7gNc
	kjpGA6aJq9KNX0KUT0WXhiVcYne/pWUFi2Z6jDQ1dBKHSyZBA/3MgRM/fVIHsCtMgsgI8K9NpID
	iUG8ksKfqCxcBV6P62b1tAkx2GC410w9BcwN2o=
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr161743885a.78.1772792885472;
        Fri, 06 Mar 2026 02:28:05 -0800 (PST)
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id
 af79cd13be357-8cd6d4afe58mr161739885a.78.1772792884906; Fri, 06 Mar 2026
 02:28:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-pci-m2-e-v5-0-dd9b9501d33c@oss.qualcomm.com> <20260224-pci-m2-e-v5-5-dd9b9501d33c@oss.qualcomm.com>
In-Reply-To: <20260224-pci-m2-e-v5-5-dd9b9501d33c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 11:27:53 +0100
X-Gm-Features: AaiRm53iYOytG8xnHxV8VVUSUeAKgAc5EavTdm2RyqP-mIqV3qUo5jYkbTQaMc4
Message-ID: <CAFEp6-02wcaEYr5BJvqMgtMD6vArLghvw+Lh-YE+OLXyZa-i6Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] dt-bindings: connector: Add PCIe M.2 Mechanical
 Key E connector
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-acpi@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: aWgtzXcgyx27RC9wixjwtNM2wwxvBKsA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA5OSBTYWx0ZWRfXwmLDLjS5qgy6
 7vCQopEZPlo9peB4HFuwhFAOVXQmjcMRh4AmEj/h+Dmp/q5q6gqPmFrNyq/dY49KzQSdJyXE6wr
 Isbyt5BN8ggf8lJ9UZUXrVOoQAgxWvVw+ycqrsZvFwsuEb/QVgBeKxwvWYLOjsplQBOkjKJKIox
 RbcWpYx9BBuki32KgNAEMgHFOwKkUh3TNKJM4QmdqvQ1pvb15RbVWAyd0q3qp+I/MwJl0n0B8dp
 SWcq0aPq0+TniCGzNkJDzKBNJE//LbZ/iqhgVzcUesJvrk+PYpLTj9vOpHRSVQ8vfPHe+2szohj
 mmQ7M63fPzAv4Q7ZnAI64tWH4/V3dZmeobedL3YEpnw3OGBtc0ikQ2zxIwkyBNdjEpAuXDFxT3Q
 dAT7W+lLUcfCPk4jLd9u1V5KO5oi0S/P7NueFVB+H+ZG3QAXK3j9L9m6ZSAabcOoq/TA1dhAOHJ
 6ripLPbYcwVR3SDpW/w==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69aaac36 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Aq5ih5MREXdaAn1MBKMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: aWgtzXcgyx27RC9wixjwtNM2wwxvBKsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060099

On Tue, Feb 24, 2026 at 6:32=E2=80=AFAM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Add the devicetree binding for PCIe M.2 Mechanical Key E connector define=
d
> in the PCI Express M.2 Specification, r4.0, sec 5.1.2. This connector
> provides interfaces like PCIe or SDIO to attach the WiFi devices to the
> host machine, USB or UART+PCM interfaces to attach the Bluetooth (BT)
> devices. Spec also provides an optional interface to connect the UIM card=
,
> but that is not covered in this binding.
>
> The connector provides a primary power supply of 3.3v, along with an
> optional 1.8v VIO supply for the Adapter I/O buffer circuitry operating a=
t
> 1.8v sideband signaling.
>
> The connector also supplies optional signals in the form of GPIOs for fin=
e
> grained power management.
>
> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com> # ThinkPad T14=
s gen6 (arm64)
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  .../bindings/connector/pcie-m2-e-connector.yaml    | 184 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 185 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connec=
tor.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.=
yaml
> new file mode 100644
> index 000000000000..82dfd776d480
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yam=
l
> @@ -0,0 +1,184 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/pcie-m2-e-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PCIe M.2 Mechanical Key E Connector
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> +
> +description:
> +  A PCIe M.2 E connector node represents a physical PCIe M.2 Mechanical =
Key E
> +  connector. Mechanical Key E connectors are used to connect Wireless
> +  Connectivity devices including combinations of Wi-Fi, BT, NFC to the h=
ost
> +  machine over interfaces like PCIe/SDIO, USB/UART+PCM, and I2C.
> +
> +properties:
> +  compatible:
> +    const: pcie-m2-e-connector
> +
> +  vpcie3v3-supply:
> +    description: A phandle to the regulator for 3.3v supply.
> +
> +  vpcie1v8-supply:
> +    description: A phandle to the regulator for VIO 1.8v supply.
> +
> +  i2c-parent:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: I2C interface
> +
> +  clocks:
> +    description: 32.768 KHz Suspend Clock (SUSCLK) input from the host s=
ystem to
> +      the M.2 card. Refer, PCI Express M.2 Specification r4.0, sec 3.1.1=
2.1 for
> +      more details.
> +    maxItems: 1
> +
> +  w-disable1-gpios:
> +    description: GPIO output to W_DISABLE1# signal. This signal is used =
by the
> +      host system to disable WiFi radio in the M.2 card. Refer, PCI Expr=
ess M.2
> +      Specification r4.0, sec 3.1.12.3 for more details.
> +    maxItems: 1
> +
> +  w-disable2-gpios:
> +    description: GPIO output to W_DISABLE2# signal. This signal is used =
by the
> +      host system to disable WiFi radio in the M.2 card. Refer, PCI Expr=
ess M.2
> +      Specification r4.0, sec 3.1.12.3 for more details.

Just a small nit: according to the spec, W_DISABLE1# is intended for Wi=E2=
=80=91Fi,
while W_DISABLE2# is designated for Bluetooth (Key E).

Regards,
Loic
