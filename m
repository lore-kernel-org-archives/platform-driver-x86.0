Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019876;
	b=k6WuRWIQy1IZo+WGILn19622XeJAJEOCzfnJsFIxVh54BML78ORQg/QevRENPsSuV6Bj
	 6axtyf8fYZOOUs0erA/llU7BOua+xJESTuwaDB7mWAGktXIBwSKcLlpWQjGOABfHgJY0l
	 5VkcEa4IIr8g5jnxk3OIv6GoUEX+ESJArnCuCBZKbNhi1yjt/n0EPz1V534K6Uchev5P1
	 QJ3mWfQiPTlkCDnC548QMIVrdUnPNOb9D7ohlbFgu7OK9W0o7mCOzPKLeckKrq4IEtyU5
	 Ajnug84ik5IXMGevQPCBdtglDTgl6FkZFmS8qmNlOM0lFXaTcU2m4HD1TQMICJv2ciQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TLD/r6Gz4+An61s5hBdFiidrjOGPaqrooCSaDwERtz4=;
	b=Wv4687KE8rNJ2ePfoVGxFrgpJfyB3FdO37LkSF2jzoUMiC7W8hZHYjwFx+QAViN+1A9L
	 6fjs3baiv5NPsPemw6MVXtt+EqMifIfQnPHpDNRivxOzAKrINjEYbOtgbeWNM8Y9o1a6m
	 2s1gYwxM0xlwbogK425GeCnjaifVAkTAute6/tTB6TrpQl6ScRm/LpddKig8meIl+VZbv
	 1NmKtZPeDMB8BBJKTk+OHSSp0XssdKCbUNlMDWHMAIzMNipCeg+SwQiJ/Sv4f9BJFUjjL
	 Q2v+hHYnytuvJSWG/eQKCMQeKzAzLODLXn+/l4Sj0V6E5EqJs8Q2IlHKDk3zdULcJdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j31RrgOU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GuuhXFc3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80100606A325
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 13:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80100606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j31RrgOU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GuuhXFc3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtJB72541787
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 13:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TLD/r6Gz4+An61s5hBdFiidrjOGPaqrooCSaDwERtz4=; b=j31RrgOUjSSFrksc
	5i8WpzadNLO8nMuKnl2WgsWEDTUo3UiQOkBhCzdti/BOGnv+BqueC/PgNzwwUTkJ
	tzO45m3+VwpacDfcZF7NXR+u9CHPWrs7HBuJ6Hgl+gnMuUzGAWXk4EaGc5nUc1Wx
	gEwJcs6OsLiJoxf/ed7qt9SU7biesZzKZwUKC9FBL3Lolw9NnGvCYo+kkc/B78S2
	jX3p95HuOAg6/mj10NEszE/mpxSYLogzROT8/H/XA7WenyTX8GFkmPLe42ywhltT
	o07vrcOFpd7R3shXTd3FLQ6wKSKCrV9nIaSbvrchAy6ZaLorLYmrxw82Z6WmqcQp
	ulSR3w==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdahrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 13:04:35 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-49e5451d6a5so3636609fac.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 06:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793019875; x=1793624675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLD/r6Gz4+An61s5hBdFiidrjOGPaqrooCSaDwERtz4=;
        b=GuuhXFc3uLvTohNHTjuZAVHj7qyi0jJ6E3pe2dH7RICT5Ie6d6rvNeRQWzS7yEwk89
         W/s32kctPsVoGBuDd68ZP+aE6YQqM0Dy87e4JOradgKYLsbfPCahJ1KbHPFZO+pA7Glh
         2Q4XbA+TW1W6AKpVDGbIQpLSkV4+AiEysDvqkEXtoU5WoYHIpPWm4nVvvdEhO+9+Ps7O
         VIDDPNXusfwLJ/7LJtAv7gn/8GLvIxuznPoWPE9v8uUUhbNF1brAwnlQ/FGNdiUQj3Ca
         9R7m/VrZUFqm5v/OmsFta2CI4AqihWaOlVBrAwv1mJwyyhIUELxAiSgXKoiCYmX3gezs
         uZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019875; x=1793624675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLD/r6Gz4+An61s5hBdFiidrjOGPaqrooCSaDwERtz4=;
        b=KvIOdfmn8Ge8bw0kvCliX+B/44FES7fWH6lO0hxmJEjLV8bwLYoj1uFSY+VwrFE5x/
         4/whPvW5ycdfMIP2fxinYPSHVvVW3pDazKK1tCdCIp3HkGXR14GMmLJJpt5lXxaPpjMs
         yfRLbEpbFfltgtEO5W8lTkgtXEu1qoB2R3ft/v2U/lKmg/KAiRowRG1HaDu5jqde5f72
         MXJGxNiwYXbbJPe4fH4a+KipBH3MpGDw3zkJSvTC0OUuALnDTayo/bXYKPY791WeyzYa
         bPlpGO1XbVfBciVPK1uF+g1LB92xxUrZCHumXEgRuLg0N4/U4R5HmeIS9wDKEpYSkmDq
         uCpw==
X-Forwarded-Encrypted: i=1; AKwUvByQAxSrbpkIHr3xsw8WMr1onXz/lQw3df2QQECnN4oQ93V8ZBC+R3ncb94MIcfanXfd7St/uaNrN8oDF4RBWZz9Ndfo@vger.kernel.org
X-Gm-Message-State: AFq9FYKk9AhrPDvE7mfkQJDLw8mUSFzt72eQEWX0mUGJH8+ziEDxvvtQ
	MXulwGQT21aUwhBvUXmocUpGUeWRllFj2aYyiCnHoVDN1WJG297f+Qs1qOc8ceTwSrFfM6qOTXb
	FaZlAuiBxKDGFA8Fml99/PdULY4rU02NiovOp9YssUKzDHIY81yh7kuZ1z5LaNZtliCWR6wxKdF
	Wt
X-Gm-Gg: AYBFou18MQMkCmvMMQhG04CWMTWbwQRQZCg+bkcauXwsl+SOOu4F+/YPFfc0oEYn6Rk
	WvcUE0JjmGd1dkmKlOORmhi0CPN/M3d2uiru7m0PZve+cyVuCIMuu8w+M/SQ6bzcnxWNZn5xRp8
	85I8e4ETivVA1wauOrIdAq21jWe7EfiAMeO9oO4r4hOIpGgpbBipyWB3YjQ3DIk0VRoKYQVf9Sl
	dKT+kVLUJp1iukUUCzJbxyjetMoEjdMJu2gsmb4U3eXM6R5nbbVzSuBsPizgdlrvhwX47V5ILxY
	fedcFMGMKFlitdk9PAkTME0Vh6yssB1E+ZkcE9Yny0Vs5a9mkZAsPdGuMDhzYQNc8ZjI38sVlmh
	R4b6KuVLUN/LqwFsQk8malij9y9UuMsqP2iRtfGDf4a59V7C0PrEQjKfuAcsR6F386Rr8qMcP9A
	1kVCGTUCRL3VxfnJxkRsoY74sM2/4=
X-Received: by 2002:a05:6871:2b16:b0:485:d31b:7767 with SMTP id 586e51a60fabf-4a83f5c5dc3mr3995565fac.37.1793019874824;
        Mon, 26 Oct 2026 06:04:34 -0700 (PDT)
X-Received: by 2002:a05:6871:2b16:b0:485:d31b:7767 with SMTP id 586e51a60fabf-4a83f5c5dc3mr3995525fac.37.1793019874362;
        Mon, 26 Oct 2026 06:04:34 -0700 (PDT)
Received: from [10.190.200.105] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8431bf31esm4742983fac.12.2026.10.26.06.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:04:33 -0700 (PDT)
Message-ID: <23c34b9b-2692-4fb6-9a8e-6c11e4787f76@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:34:23 +0530
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
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <65f6883d-8ead-4c6e-80f5-81f6857df0b8@oss.qualcomm.com>
 <f624b075-df3b-4862-8231-8fcae7f18d50@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <f624b075-df3b-4862-8231-8fcae7f18d50@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8QW-yCrzw1d3wB6vSK_p6TfIudpt4Cyr
X-Proofpoint-GUID: 8QW-yCrzw1d3wB6vSK_p6TfIudpt4Cyr
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf4fe3 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=Sv1olGuBKYLPw-ZkEP4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfX4e7aSfe1MY++
 VqfGPz17Mhllzp+yAxv0dg1jd6BDhxufj3tEpvrCWP/bBevZgMrTAp4vyz+aLUdwnQYiCSZOLMq
 jRlNyjHRjQ2a0sQN92br+YEtBBDkB2M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfX+0AMiOMO8mn1
 VzdVPTkclnRO2T7yFmSuEIcE/bTjrnCtfE7x6FuEPsdIv0veuAtf2zUwQsG/wlKmCveiwGiVfS8
 SAdn81LobbdLaJexPVl1xoP4Gp0X9S4gi2dCqRobGu+zkx6v2n5xDzUtcLFLz8wZgCWGRQpktFb
 NaUkz/hI4O9glVpE1dno7Iam+gMa0A5ARtDuOGynd+P9qb/tQgSvKhY54GCpQb0iQxKe+ir0Mvv
 KARCGklEjWtBtNKh4xE/BAQpc9kJudWgRK7wRUzxgkqgaKRksvCE8e4jffuxdVg3yUPWmr1gCMX
 lGWaRKfZLsDV4UvYyF4n8RWC0Gu26ZahltbuKKTIsF727N2L9kIPlNo+nDSxvYCszN8yRqMo6R5
 JkmqVd/kWcoa0us1Kq2PkzIwzEnI5evpLSdOo22v6gMiyKJ3lwGkNdhD6ftKPPuK0X/AOH0dvjm
 QP7MwQdJXxi5vx+ZsyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260051



On 10/16/2026 2:56 PM, Sibi Sankar wrote:
> 
> 
> On 15/10/2026 19:02, Konrad Dybcio wrote:
>> On 10/15/26 2:47 PM, Gopikrishna Garmidi wrote:
>>> Hi Konrad,
>>>
>>> On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
>>>> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>>>>
>>>>>
>>>>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>>>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>>>>
>>>>>> Signed-off-by: Gopikrishna Garmidi 
>>>>>> <gopikrishna.garmidi@oss.qualcomm.com>
>>>>>> ---
>>
>> [...]
>>
>>
>>> Thanks for checking. The only matches I see are in the MPTF thermal
>>> package, which ships"883ROT13Inch.bin" and "883ROT15Inch.bin". Nothing
>>> else mentions ROT.
>>>
>>> I also checked all the ACPI tables but didn't find a codename there.
>>> The tables are here:
>>>
>>>    https://github.com/aarch64-laptops/build/pull/176
>>>
>>> Following the Lenovo gen8 naming, would something like
>>> "microsoft,surface-laptop-gen8-13p8in"
>>> (mahua-microsoft-surface-laptop-gen8-13p8in.dts) work? I'm open to
>>> whatever you and Krzysztof prefer.
>> [...]
> 
> With this is mind it might make sense to create a common
> file mahua-microsoft-surface-laptop-8.dtsi that all these
> boards can import from as well.
> 

Agreed, but I’d rather not do it yet. I only have the 13.8-inch unit 
right now, so I can’t determine which nodes are truly shared. Once I get 
access to the other variant, I’ll verify the hardware and move the 
common nodes into mahua-microsoft-surface-laptop-8.dtsi.

Thanks,
Gopikrishna
