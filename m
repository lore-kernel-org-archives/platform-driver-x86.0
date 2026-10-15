Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DCD53E0B
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 13:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071136; cv=none; b=P9SZRgux+rP6lhFzyuQFROiensRq68X/qaqotVe0u8GnUI83Xon3XO/DKKqSvSIs+lbk0y21FfmnRR2hjIL8/oFf+uP8q/BB79GzcBduVfB0Dv7j6zPMdkrzUZXl4ldOCr27IUjrFOXR5IvdnDL+5TK5Vj+vNvbxNKUnY6GesKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071136; c=relaxed/simple;
	bh=aOh2KbDTODle4grtPE1FVRv20AnwMa9h8HJPe3KDcw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KEcDDFxvQC9Cgeew3S3qo6wR8vC35XGEmUAIwFZUXfHw9Ib3BC8etCJkHe6vOIOHKtmlKoyiTcq0fI/3/vEAno51VO+DSSMMR0I6SuSFEXXswKTCdFdlA3DFdCf4559WZd9lD00iS+JEBPE3uyugLxmggYgcTh3hv7wqtZNj00s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3EH3fVr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NaX/U1U9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3EH3fVr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NaX/U1U9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jj581956177
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 13:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rdX3QCLTENQF6a7iOoH7LlhHEJoWPHuhiEjvLDq2Jqc=; b=K3EH3fVrt6zpt/ia
	QI5oUNZmUKUO+aT6h5z4UgtvU3WpGypovVVxPUzvwY5IXB3hMZS/vr1WmQ/81456
	3oD0AgqVqRx3P+OeKrNVcnjzWXE4fusAuaFgpTMQTQa+rkIV+hc41y/v2axMua0g
	6vF0+4lCQjo88A3Pqjq6EITsRr6yN/Tx6/v7TnXBPK0/3R9ZFI/8FFrBs5scWShI
	hc9+7Nd/olymOyKpWisS+hRqbThjdIZYEx2uWX3IJzG0Qy36++TdYXWBh5lxsx76
	9o3IQqxAuCFCJ8rd8bOqS/vj07tZQujr/mATkQ7xHIbQ6+v0e5l7xveezN3Ntt/B
	vmTyDA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdeu4c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 13:32:12 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e915fd8a61so128034e0c.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071132; x=1792675932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdX3QCLTENQF6a7iOoH7LlhHEJoWPHuhiEjvLDq2Jqc=;
        b=NaX/U1U99vT8SIJGSUy2JAxXlaCKd36wPRz4i1Cs32/vuS2vE7JNZgUntROc3IERv7
         Gd/vDiRidX1wUcfgCG9s8KY12Dd1mh7FuisJoWwE8i3GW7aEs19lDDltrZUIkkBhfv7r
         Rh2YTdrTMP3vdGlIWMYR2INE/7klV5035tmO/LQyf9DArB4IJMPRhJfp5r/qWUA7fouh
         tStdpPFAGU2vchAUP+bhkD0ZA36Jnvac0zoL9sRhIsPe+N66tleVXaEaV0QhGwJcRI7b
         1o7ecmEPPGK56LYBf3hk2FHe4Kxn/7+OUO7qo3iZuxzgjH+lRGMj021c10frUxxEUbcT
         RP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071132; x=1792675932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdX3QCLTENQF6a7iOoH7LlhHEJoWPHuhiEjvLDq2Jqc=;
        b=WvRgcdb/njWs4NY005IEiZUD3unC0QbodDq0BXtMGOZkR1VMJx/yC6SUU1SKHgw87l
         kpz6f8W8/i18fcSQOCUV/TrDlBw8x4EWqWwR5ZxTJ70pDX/5yhBvRjtkvCAFj3xNl7AG
         MYeG6qEiHkJ4Kc0xWbOgd8dZXgc9bRccokYVE491R7MZAMyRrhXKeTJRVv41QLebJlWc
         JRyHdjIA7OkioIB9tnZAL+2T/7+fnRYh79ThIQ/T/uehuFy8Z4UOiUyhGfaqZ+oeTVZs
         WXEqHuezD6W+NALfes6tkf9Y5R7MmhvgF8tVkmcK0q+5EGPcuVnxeEkobr+enpF0kJ+o
         gUDw==
X-Forwarded-Encrypted: i=1; AKwUvBw2mSXuCNexDqSP3AZHt2tNa2S57k8o00xDCG3bn4XYPtdw9RDj2CHNqt7872DZFRCg+bY5zXE8qf9Y4wyxcTJezhM7@vger.kernel.org
X-Gm-Message-State: AFq9FYIcYn9zUqt7q10hPkNWEwPOSRB3GHA+LeIY/hWTsBzAJEEyOcji
	uyCcxNxQnoSrId+pnw0/uk/j/uAQoKmaTuiN+lC/OkMoSa3vnRjdsQHUjMxUkXE2LefuVjUqS9b
	OnRqJQaT1rPrfH0wwkyT9jsPjs+1uHRI5/6FOxY95M2CqS4YESH3zBJ8phLcLgXSX0B4aqW7WTq
	oe
X-Gm-Gg: AYBFou3S+zonZkurdIIgQGXlQWFO+U+ujF9gvPKn7bjpkD7gUIG8J20rpQpZwAXqbul
	5YLxZO4qHw+xSXRI6BREneLWw71SfcZVqp5ldHYLOdWfpf+O7bKEnyhpP5PGbXfKcZNSYF8BI+i
	xzoY7kG3h4x0i3jtLcV4kJ2jM1gwwAnKUXRaoei5NTcqRUHKIchn6hnHNG60H9rUOG1kpZ5CfuF
	xqoNqqPqDNNIO2tbB8PMDahbP2hXDPLQuRqQ2snKZwhj79KEie+jYtWpp3hjJP03SZPqybcqBN3
	f1flCX0OPc20YpTpOkRGT8jod1uIwWHaG57K/wLE/MBDc8Vm9MZ+d7KGHilYZXlhEYFe7N3w9d4
	Hnujqo30RquYEyN/gaVAZkA==
X-Received: by 2002:a05:6122:6990:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5e92e3c09b0mr5140641e0c.2.1792071131521;
        Thu, 15 Oct 2026 06:32:11 -0700 (PDT)
X-Received: by 2002:a05:6122:6990:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5e92e3c09b0mr5140566e0c.2.1792071130738;
        Thu, 15 Oct 2026 06:32:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6be6ddasm129094766b.7.2026.10.15.06.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:32:07 -0700 (PDT)
Message-ID: <65f6883d-8ead-4c6e-80f5-81f6857df0b8@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:32:04 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
 <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
 <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0d5dc cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=8k6WQxmsAAAA:8 a=4wGxsJ_OTqgDEiZx6fMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: hgXr5QK3DNXgn4p8FoeUp2o3mfPT_NYG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX7c0qtGsxNPwK
 8a91JKjw30YrkhTbgKZ0NLy726l33mFI7qHNya+CKCNrM64OozpkH0s+PFjEynLFyYJibq3FMFk
 g6cUTxtfb4fLHjem1AoW5UaCXHxq4S7RordP3KARfNmvLW3xE6LHGdtcfHZQIOwDe/M1As0Dza3
 c9vg7eyQ2EFx/+aVLEXuaze6l6OBg4XsP9uiRDmGCsjBNE0nPCxYADVV0Bj2S5V12XmNSUPEgeO
 QZ3jjpsXn3SEwedmoP+UE7L9cnO/tTLdOPVEVZdWgJc70e63F5XhpisNTK3EW0pYZDbrcq0fDIk
 tINFLO2NDpHqd+i3Qh4M1jzo5L6YRVChK0uGUiVqjU57660WutAfhePh4E60mqtNIYIqZS3pHqa
 bILmq9OgcOc8Km+mpC73O7tkIJi9WO9EkmC35f6OxPkpVuTVtnuL3A8wC/RRydq+6hz7BWoWs0D
 BWfs96Q59n60dGkklxA==
X-Proofpoint-GUID: hgXr5QK3DNXgn4p8FoeUp2o3mfPT_NYG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX4eGAS2ZbqkmD
 XdH6P3EZ7u1+L+dKtSwGX+9d/bjT7shKynJB4Gc/MwLg4VJr5dD3p7olvdI9os0cJZymWYS2HAj
 Bm9VydXK58QjAI/VnVt/++JcmlGTtSE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150053

On 10/15/26 2:47 PM, Gopikrishna Garmidi wrote:
> Hi Konrad,
> 
> On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
>> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>>
>>>
>>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>>
>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>> ---

[...]


> Thanks for checking. The only matches I see are in the MPTF thermal
> package, which ships"883ROT13Inch.bin" and "883ROT15Inch.bin". Nothing
> else mentions ROT.
> 
> I also checked all the ACPI tables but didn't find a codename there.
> The tables are here:
> 
>   https://github.com/aarch64-laptops/build/pull/176
> 
> Following the Lenovo gen8 naming, would something like
> "microsoft,surface-laptop-gen8-13p8in"
> (mahua-microsoft-surface-laptop-gen8-13p8in.dts) work? I'm open to
> whatever you and Krzysztof prefer.

FWIW the "gen" naming comes directly from Lenovo's product name,
i.e. if you go on lenovo.com it says "ThinkPad T14s Gen 7".

Konrad
