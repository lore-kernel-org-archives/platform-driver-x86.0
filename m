Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6854D3998B4
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880802; cv=none; b=DHws0BDVGqztuM3JI4kr5ezlAXcrx0uPciPz0IfYBCvoOC8M27PlTJHOKXR1YlKqbJJoY+A6oBijhaGkET4kmZTdFqsydnSStKERTlVd3oQiUPAhGZO1exF2l/zBvEWmuphG6o+CCZR+E/DMCBIudIVUyMOmRKLpuEF7ws8WFo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880802; c=relaxed/simple;
	bh=1aL7EQLDdLDEJ89Mg5MD5ZUMkF+ph76lnTDMWKkf4aU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3Pjc0iJ0zn5Prd6ypw4ueqbxoCKLcT5iExeFe37vehvMmZmzwB+UryatRhUHC7Z2zW+3GVh4Qei9SwGX3SB+Hzh8mVQT+ErYWJLrddoVaJrsMshvHhlTVe/WJS9RS0MCxQiW0tb5ZwaXd4BlUEnfBBpyMyTrWXqfimNavzLjTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLkc5y0X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GeFI4344; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLkc5y0X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GeFI4344"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8aQQw3054946
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 08:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eNL7vgR4kDGeD5fPFGvpl05GH+Y/43WiLVBF8tPpz6M=; b=nLkc5y0XQPFD1mUJ
	sysjhMEBmQzsIDnt88JYqviIa6WrohOk1363fbZxP/QS/1rxks4/NQfmxFh7cEfy
	OUeaERIGqVFR2kukDs0FbS8IP1of8lbUjfO5jd1cBFdZCNTI/4OAniUq1MRoFmTb
	Dm4yCrW8faLWkO0iNXi7c5t5owEFnW8NA7G8ia3wNGz4JD2oYuN5Wgwgt6IC2kkT
	uy7hexJiVGkzPheO/Q3EngoHVLYwrK+jYLhcNbci6dcK+FyA9yANYYBlp1p5NIVD
	6Hv54PW3CZDkoWyjVKjcJcfUSQIaBZDosq98vnI+6ed/pgWGuPZ93oiesKvT9lgC
	Fc0OhA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeuar5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 08:39:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c4d46037eso7927926d6.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 01:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880798; x=1792485598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNL7vgR4kDGeD5fPFGvpl05GH+Y/43WiLVBF8tPpz6M=;
        b=GeFI4344q6NfFkdR4Bg3dZzZeQ4VAWCqeeIR10/ORzhMsvakOcstxQ7K6Y5l9xiR05
         8GeJfhD0x7z8Ub5pMo+NlKbi4J+KU2MVytMyNOZNc4CSwy2g2sywudINLzUYlGbpAh78
         LJeH8I+Nsy5vrwsaaq7gdujX/jSvRK4gjpiMERg4Vfn2VYwF3H4LU6DVOk+yq9+yfNAs
         5y6m8d5bkWdmdHsqAJiTUwj2gAk7hB8QcA6a5qxF9lQwJ2Dt/YtfaD95QffnKQznbTRg
         ut64t4E488QtNgce0tPP083I4WNHQJF/6JGTtZv9lZ935tJ2+zZ9l5re47dKIYUjJrWm
         KpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880798; x=1792485598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eNL7vgR4kDGeD5fPFGvpl05GH+Y/43WiLVBF8tPpz6M=;
        b=Go7kFjFuiZuwxPY7yT2qXBhbdNLvv3tAOx44oCqRKTKUrBbzoT3bZ0BVtQzkwZeSAE
         yDO4Va8eNLpPXS+5Fr/GsLrCwRt8supj7Mj1J1V4QcfARWWSS5873Hw+MH8UWJP4lIAa
         EGH1RdKBkj0tWi6IIkyQ+Sr4vSbHC/oPrp+obZhUi9SJJNzZlkhfs3FWCD46FqHWc/yv
         R6Zo1v/LtwPz6qwmYL6b65306k1U00i9Cq3ji0VfXyDpxP/tPvJkneihBN5IjJoIIFMb
         55VotPHMTQbODXrv3h9vRc5iwATUd9mwkhAeze57bWn27YJ/Yswh3cZ4k5/zgSjb5rJM
         JvwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwolwiyYanCMfR4Z47N6UR9ocmw/BLAvOjnpYwnPbg7Nl2jZCYUaaTxdvSW1rTHr7EZJIaQwjB7w8YwGPISkfX2ohL0@vger.kernel.org
X-Gm-Message-State: AFq9FYK9bZWbG0BdpijcZWjIuotsLkpt+oLPy8DEYlgLyfcpKQGtnopm
	Febl+L4qjnjm/IePPO4GTiM1qNT1UGvsQSt2D08loQQZSm2qQs65cOGhVZuyBIqz3p4l4NmC2k2
	6/FgkJ6i2rhQbVJ4DHdD4qGFOyVX9eEf34Ab2KffAwOhGOMW1VF445OVUt4Ec4IVs7lhBjz9IJJ
	Kw
X-Gm-Gg: AYBFou1E+YGvPJPO3G1ro8+nwTUD6GlmhlLwziLLbzoa1bldUfB3NKOMktJsDmpioZg
	vFlSKX9mghOj0bUIpp9zvCrXItyWY2Ofa7opAU75isDVh4TGoEWulSNAsBzRa1SZcwGb2evPLpD
	MM1phZvEa7qT8323jqHG2uox2/ML7Jp/4aEBdpjdEAEpp4EVB4IAbA7PBUFElL/joIUHM/cCebl
	Fl3atulxd3B/Z8PUpiUWkM6aVXEpOe/1EEyjt+iTxa6VCk7IivtktwWcTf1b/BimCbsznLmGbg2
	L+rierOqUAeyxaqhh8X/CrPcD0viwF7MCyAWE2OdkvMxX/M4BLXDyCH5DOPpWHTV0qXGcnXtBQp
	uQzQ+WknkS3gb7O2Hus7AXQ==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr2187960185a.3.1791880797485;
        Tue, 13 Oct 2026 01:39:57 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr2187955985a.3.1791880796886;
        Tue, 13 Oct 2026 01:39:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c36fe6dbc61sm51688266b.30.2026.10.13.01.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:39:56 -0700 (PDT)
Message-ID: <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:39:52 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4fq7qqT0gOVjODSZ2_C4tuwDnJTbiojS
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acdee5e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rd0sP4ULdwr9m3flnKMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX7c10EuIuEd7a
 MF5suOh5b5Fzlpg0EC3dMmrnFmuRkRTbm8oI8o8Khs+yLj6Cuh3IPD99vCTBfOVwnt89+9it2O5
 bOsv+QkbqNrgYjc4EUsA1dswmxl797E=
X-Proofpoint-ORIG-GUID: 4fq7qqT0gOVjODSZ2_C4tuwDnJTbiojS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX9bChVNLfuCOC
 XEOawx5ObKilv1tmNHS78Hz/vAi3ucirX6JcnUvW91mLLktEU9I9E5Rc7UTgFlihHlQUCWIGjEO
 nrv8KcdvYYbf4S1h91lU8/JHDpZD4BJ/a1jTUEe5a1iQ/+1JGvpjCFv49AJjrvVA2luN1sgiMN6
 ENL9kVvpfe9KWeuVJhG/+HzaeVVcne8wss0DS1E/5R6XNWp4+fuLB/dMFbtmXkz/S882ZnOyREX
 +h2vlra0g26L1ag7J1GuL6WaUn4wXaWuPdH1VA9OIS+gX/uZIN1AztAk7d6GHWSuZtjRxlvN5oU
 nvdIX7BxG4kGFFPCYZouo8Nn0OSldqNiE/TBdcsS5GgemlqzTYGLHzyKGzV9bD5l3u1PhTFOYTy
 fC01h9OrAlv6xErexlz5NbG7Ig/DHoc8xG3jOV4vGWrM1hHs5sAVaWd0n5xAPY469f/VeG3zenx
 wbpNxu671flYCKokSCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130034

On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
> 
> 
> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>> ---

[...]

> Before review, I'd appreciate your input on the naming.
> 
> Surface Laptop 8th Edition comes in three sizes [1]:
> 
>   - 13 inch:   Snapdragon X2 Plus (6-core), UFS storage
>   - 13.8 inch: Snapdragon X2 Plus / X2 Elite (Mahua), NVMe
>   - 15 inch:   Snapdragon X2 Plus / X2 Elite
> 
> This series adds the 13.8 inch model only. I named it
> "microsoft,surface-laptop-8-13in" (mahua-microsoft-surface
> -laptop-8-13in.dts), but that clashes with the real 13 inch model, which is a different board (UFS instead of NVMe) and will need its own DTS.
> 
> I couldn't find a codename for these, so I can't follow the Laptop 7
> scheme (romulus13/15). Could you please suggest the naming you'd prefer
> for the compatible and DTS file name? I'll update it in v2.

I can't find any. The LLM suggests the 13.8/15 in codename starts
with "ROT" based on the INFs.

Konrad
