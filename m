Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617897;
	b=RfuEws/dQ5e2M/KX8gPg5Wv/zg9cwhLCYHFx0zhULgS2jBqKYuC+YZHTUrJgCzzCHOKL
	 4m6JE+MYq3Ik2GV8vXVhZuIltcC2ldebOqSJMEQTKml8krL5Jyarm1WrSiyuE9PKfo6e6
	 OOspluc5BmNXBEQhb2l2BoFbV/VhUeykzvRY6Cvt1Lb1QXsCscg6IOW5KM0aFAsNmcZSz
	 /2+qOUZnzha4s1O1djp54LmrHhWAEFelX6u1VHaKSWHlUpGbjLwEjGV9WBh5xOgpoX4VH
	 ybQGOZJcN6d6wRaoK8sTS937EncBfTpuTo64T34oYfQFiYlhKPYqAdiQpASM5sUiDIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XLIl6X1z8YQm2K5vGZ/P+IEtPgFQw1b2JuxAYXpLPHo=;
	b=p/9FBnq8k0ZYjtyxdo3q89o3avvKQ6u1Vhgb/EtE5gzFFHGVPsPKtAhY7IBh6fMsLJoY
	 sRcKmT8Wb7yNdjeK/KXbVcyIJT8on7EBUUES2AIaMe/tglTn7YY5kk798Ky+fIDnbdhkF
	 NWZesp5H0Mf3FIcpfLpzjCTnkMBJvMWeq6NBK0+7lxcU8xCCHzmIQMwXibtOu4zwSpZ4X
	 4AGArZbbQbUnehvvB3qi1dw3zczSqpIG6Eht2gd/itEuXoZnK6cJLbOPk8I36R3DW9QIk
	 bPm5MIfsa+xoS88MLBBCpSO9l3gIJ8ONn3BYR+0mTbgI1A3pIW22jCBeMiCW+2PtUgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lW4mUyFm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MaMNKK/K";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94B6606A327
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 11:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A94B6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lW4mUyFm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MaMNKK/K
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AIv12880814
	for <platform-driver-x86@vger.kernel.org>; Mon, 2 Nov 2026 11:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XLIl6X1z8YQm2K5vGZ/P+IEtPgFQw1b2JuxAYXpLPHo=; b=lW4mUyFmDfpDprXL
	1+yZwBOBnNiGFaDsQksfEh/D2SeBY6pv0/9J+i73ZRF8rm3tDDWxxE0irRtbn7Cx
	E2asNEbg5amG184AArFfyzZLsozgi5khO8fM1W51uXSn4HV2NbyOvLgCXX2fm5p3
	FYXrhWHvX0OoZQTfqNhBnkgs13GEdDeaX+/5mAqAaPgGmYpwrRqPBQRWnUvkqEdG
	7fjqKboqI4KKIlquJtOJFaW7cB48rEkyP8p7HvipPm2K5ilavU7HACcd0rPbsu0b
	ECEyGMt4xOqWRISjTAOROzgnh0QtwJzWf1RB8PqFB//q5kknqF1+wjtCRoObn3BS
	uaILDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrghf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 11:11:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb1091fffso30850385a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 03:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617895; x=1794222695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLIl6X1z8YQm2K5vGZ/P+IEtPgFQw1b2JuxAYXpLPHo=;
        b=MaMNKK/KEfcAlYrf8JJs0ePuf6ZvlU9FS+gWy3hUmPVXahHZz42S1HXipqbMQxong/
         g4lTCnBWZVxAaYsC+qhmBP1Dv8whZpJ1K7eRJDuu+U2ctk7UIZZDvp5odWhyFZYQZraT
         qvzu7Uygk04V2nlAF8vGjBT06JsA0Wtu4KBowCB6e1sgGvNBflh3uxYL3PEcp8KBcBlz
         dU4P4A+z4ub2vUGmb+YssgmrHDhMNikwAoUaV4EKohZRk5fvhbDgX4A2fSac0OJfRshZ
         1cD5fJzDNQ2MS/4dB42F+4EplWd0dQn9F4Mi3sDQyFWsz0Vicxh0rtSV93979/oSc3W8
         XklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617895; x=1794222695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLIl6X1z8YQm2K5vGZ/P+IEtPgFQw1b2JuxAYXpLPHo=;
        b=rOwmL1KTsixIxvDTXxHN1T1MvR41cBncynyfGNjr3DAzMETvCZrXdvygLTfiKIZw2J
         HsLr4EyzI9KwALlB6ArSWh3rAq7IwIuhqCV5h21geLwcfIHUu0UGCdZsaYM3a5e4u2Vj
         bL6GHGsr21HMiNVGmzAUGBp0R77Tio2tmbhID1Nub4y+8haxTav7A4p2qDF0yN1CFXom
         CIYgfJh6Dc4rdqEjkwSmAacYOC1BZ4dD0dpz6v4P1HuNlp7ahB+UHAxaRFoAX6dBItRt
         bPHgd8AKHGR3vUnxf1of7hPPNCiulBJXVPPuwQ6T4fE3Oqgx3/pztu8F9FzuZxAvaS4L
         NDOQ==
X-Forwarded-Encrypted: i=1; AKwUvByaLVLlUppU+8NKBqnoFCwhui+4kMQoEeykfU4ILvpz7gJClAZpLJf0Z0D812yVrGyyA9DbCiZanZU5tHFxgY2qq2pj@vger.kernel.org
X-Gm-Message-State: AFq9FYLGZrqZMh+xi6/jczKMFvNefZwi/IxZjwGlXPG/gKdE8Vd9TKyL
	hTGDgmf4alg3l7ovOhB44bvtAqRb5rRmhZ6jmz6mQdwq2XxOWcWiL3DzmrTtd3SCVub68//qDJz
	DWJRWYXphJhnw0Km7ZzMJZRluHt/CBXbWKeLmtZjaXlJffpzWA2CNYzReBihS2wqJuQ10mKu+GY
	WY
X-Gm-Gg: AYBFou2ajnf7tuU8cbmb+X1S9oCouBqHTLorQDJCklRGxgsP87Lf5S9L9WhthgAHvC+
	c1/pcLgWcLFCUXRia2ng8jiixlQjfBt/dTUKDHeKAA9977Wd1XAaYno5LBrpAUdGIH8lzku3U6S
	ql7r859yESCJxiOjmr6T67ngoUzllUjenXe8QnezzRXt3SFQjIcCYEFABB05eeRJboluZYphl5z
	W6kFJbsO/gWylbr7lXUZJICVjbBbOBJeO/7Zzm4a/NzG4/jp1Kmh4Z+KeEqmhqHaV3u1otgLRvf
	w2IgBQd2Zl+IIqEEPRC0GZ+AF4UvpvAes0irv/PyaGR/8Ekw18OepeKVo0OWFhEEtpIe3yDfckv
	gBmdyVThDZHwN7NSyWdXIHb/PqsO9fJu/UYD/wQWoVwXY9EG+yAhRoed5f/dsmHNoqmut6jA=
X-Received: by 2002:a05:620a:8795:b0:93c:61e0:81ff with SMTP id af79cd13be357-9442155a11fmr1437722985a.1.1793617894685;
        Mon, 02 Nov 2026 03:11:34 -0800 (PST)
X-Received: by 2002:a05:620a:8795:b0:93c:61e0:81ff with SMTP id af79cd13be357-9442155a11fmr1437719885a.1.1793617894020;
        Mon, 02 Nov 2026 03:11:34 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cd291a96csm140778066b.13.2026.11.02.03.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:11:33 -0800 (PST)
Message-ID: <a9670d6d-28d1-4fa1-8562-0a23dba74336@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:11:30 +0100
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
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
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
 <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
 <c3de7659-726c-4fbe-989e-148bcd13bc49@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c3de7659-726c-4fbe-989e-148bcd13bc49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae86fe7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=58eKMYwWEGuKRL77_XsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: QNVn9mlIxmnuzyBWEFNdWbtFKwxiAzcY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXwcCVFObrsqyJ
 4oBYSQetU40Vt8a84291pOY/vzDQ05hdDrVdYmGBhC/GR93f2OCllm/Pg5/BNbHCdtayaldm3rs
 TCnv/Eo08c48pngH9mizujvddc5ePME=
X-Proofpoint-ORIG-GUID: QNVn9mlIxmnuzyBWEFNdWbtFKwxiAzcY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX7dHZMPDJl5dh
 Lcpd6/VMKSTBibIZ/Uc5xqoTlBVvSP/Ox1R9ASoC0D5WvQVvxLcz6Ts6icjJYC8c/FyPSAP43Lj
 if21kCbK9YR+jCtnzwradHXGO2arS6aphUNWfw2hq8bHM4KvPwd4V2mXhcGONoh7V5u+qFMJFcQ
 agqd95XO1z9TcH4hJNERNiafHpEaPHq9SF/n58NO7rZ/WvQUkRUq92vX00Rdo+j0WXKOlfs6ghK
 GEFbcx5eASzBPwYhgQ7t7FxApAPbaY/fvnEkpGsYEvAdtAyTr8y4239LhnB/e2ka7BznBLlGc5i
 NcPGoqaIW/xdFlpqHrIikhpCbGQHfVaNWDKbcmsz7NNj4kQoktTbPvTD1qA05+TN1/f20OdWCxx
 BAlJCTzsup1+1hRQRNwcGxaMaDowivMFjde7fC/lixazO19CdRpeUlwSmwCrS4UatRaa3nu+Vga
 oJRYzThGOgDGZg7VhGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1011
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020044

On 11/2/26 12:06 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> On 10/29/2026 2:38 PM, Anvesh Jain P wrote:

[...]

>>>> +&thermal_zones {
>>>> +    ec-back-cover {
>>>> +        polling-delay = <10000>;
>>>> +        thermal-sensors = <&ec 2>;
>>>> +
>>>> +        trips {
>>>> +            trip-point0 {
>>>> +                temperature = <90000>;
>>> This is *really* hot!
>>>
>>
>> The 90°C trip value was suggested by thermal team(Manaf Meethalavalappu
>> Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>). We are open to using a
>> lower value if this is too high for the keyboard and back-cover sensors.
> 
> These sensors are intended to be controlled primarily from userspace by the thermal governor in thermald, through the powercap sysfs interface [1]. We do not plan to add cooling bindings for these thermal zones.
> 
> Based on discussions with the tuning team, we agreed on a hot-trip threshold of 90°C for these sensors.
> 
> [1] https://github.com/intel/thermal_daemon/pull/614/commits/7f3dd62353e039957e52eeb40c67ec388d543ebe

If you never reach the userspace (e.g. because you're stuck in
initfs) or if the distro doesn't ship thermald, you risk physically
harming the user by explicitly allowing the (metal) back cover to
go to 90C.

Konrad
