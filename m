Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020199;
	b=0FjZaNX2br+GJkVvXyrRyChYA7e5dlcM4TOYl3pHpDiz8L7dT+Uqm9IE33O5M4Qpug/F
	 3CUSKVdgIyB5s1JLyau8BpdITqLy5cJoXrfD9ZStxRl9dtRzUz0o+pR8ndN2bMZ307U8C
	 bCjmRuis8JV5a7F+V2jctwtCgtby+CxiRV2mFm+ztOiPYxFaspNv3eMfa0mUwlNpVsLU6
	 4fqBvsHQ+vws8q20VWyNShfuHHAUutMup3zmbZR4sY1s2LTyg1J8LKI9TepFRDWNu+EsC
	 Z7Qpp3MKiUKcjIHZTd9PkDJkAw8yN9Rr8hKZ+c5kqCU/n0cyVJwRlupsz2jpzXY6Rsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=;
	b=FDvSTZqoCrf/hTxq17JD5RhT1e/VxlA1ZSa+KgTSWNFGUy+YBDTE8L48hulGMpjRi+aR
	 /IsqNdO2jJ0RPybeV8CTLQjXaMcNpGQxxORiRfzcG3DeK4Zj4JfnzRh3BPHHnthUA8EiS
	 h3T9pgdcA1wVZibezBRyNY/M9p0gdEWkbh0jbyAmEx9VXBIUHsSqL1HAQqOLACyfyDxsf
	 j99w3j+wGlq0CV5ijIKQDqc+NxoxPS5ysIJkYatM1hayioTLh0dSugSvpQAhD8YFUvcFW
	 wfm2NsqU5X2fpwZ96PpKQGQ/TZeGF1Iow55ZR5LU+r4DJ0dbdRWb/W8RIqsRGKmIhdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=murfKBxV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqwvHt3j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A05606A321
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 13:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93A05606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=murfKBxV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqwvHt3j
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt4jk4132054
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 13:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=; b=murfKBxV5uzBPNCR
	T54ppeH1fTQLM3q/mBgRjDF8P1SH6AV3rdnDYWH0i3t5OJ4iY28DaWIC0mFxcNi8
	vIUm3Xi8GEy6U1GLXNSYwCfDdsmcWOf6r1tGAwS23/MyH3LgIKQu5bGDcqsukvzm
	O7zJfhIsDdGbP4w/2nm8TOW7PClBA2eXKAlD0ygEM72cSir51B2owyLYK/gLmcKi
	u6IH4uc9plP5f6e8X9gbHpgVL1tsneix2Ae5+YHmzmJ+mX7+S3bAiTlHjc9FXxkM
	AWf6368sFLrAjH9BrUG3rB16k7h5ia7hPV9HOkOGcv0zD3ajUxcGqMBsHOfQHH9U
	uRiOhQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q0jjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 13:09:57 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8452af97d8aso4734088a34.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020197; x=1793624997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=;
        b=eqwvHt3j0UtIVaY/HHDorO/6I4+QBu5n0DLjHVO7ly+Ki2zHoCCNGLxvgZdziQ09z6
         vm2z9CDrXtEulbdwtEJixHAwJC7oXwvL55xrim1jTGPdIHFSPulbpn+K5iAoufCVOlCK
         jSRqgaln7PJeXMH49QmsKAl3BdyhnlOd8F/IaF2ZBmvf8/TJUkxDOVaQ5nAQ1ILNzY5D
         mjsmVyrW9QUUH3IKRqSfAgKmorRDDtpegXIROO7zfUIeuF93MxcfmswtiLSl69dOT2XL
         jTtWPi46/Xf/nXCQverR9jhV5z495EpnbJK3DctrERI0uJ2kvgRk5oBmbUvPIiuEed0f
         8kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020197; x=1793624997;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=;
        b=pi1K732t4mKvvQAetudXCbDq7PnAY+yKQNZOqitdrixE1Vfo5gwe0eMlyvdGgtV9Wr
         Zb09IvemeFjOkRr1IFl76f9OX5k3Bq6r8QeH7WvZpOyBgj3fNLR4/V+oPu73AFoIKBGs
         QKZwRhpsbrYyzef5KcHXjy5E5Hz8/HpgTfp8onACLhE9YIU34MZV8q7edEkzSTTTNTZ7
         0pzwL7ZlCF4m5JJV9b9ZiQ3bZmAZviBo1XP4hx+EkNyrEhAN8MMhghDnnNDHo3XVrklm
         SyG2xBHTDnzWDf36p+9izbrjypADqIEO4t4E6+5Z3obaKEbI2VE1PHSMJtfiyKr9Nf7K
         xGuA==
X-Forwarded-Encrypted: i=1; AKwUvBzDxveD9NEL0aOW5qf7O1hJLje2GCYmi+NCf3wQ5q5J4yVtEpBgdrtrlrq0O22kyKMfPEwztKBU9CCvGtGKjAIZhm3X@vger.kernel.org
X-Gm-Message-State: AFq9FYI/NgHgO9GP3/KKirfyaunDF8uRDxaYzTdFDwErnp0+OLeRDYRj
	/ZQxYlcJOXBm8Smn0F4sTsQdC1If5EJc4JJgZXL4sQ+ooE1Bg8m4Esv5FmqkmFNY/Eh/EoE1ARQ
	gTTauicdVSm9828VRovFEX5daPn0M8/tZuVkQmHP0ksCGMm7i6MEpziTqDLwk+OWLCZ7s7zcvmG
	+q
X-Gm-Gg: AYBFou2gYvldhi6YWQrEBrD+78iFIZ42mt5RL6noU9istUOhm/IVb+KoL7UTkEGyI/w
	cz3M4sB3PLagzCQwElnjvgeI6sn54CaJXCEmRsT2KSixkeqJwlc229gEdpjSkX5LxtA7Za9u/SU
	CD4Uem+eGrLnve+dyvQnCrF8m9DIiubhDehu/g82DwtfTCUnKpQt4MKMkySzVjYtGGcuX1+eqv2
	2svDyUQ2XUHVUsS5FCmVT+scdlpKBklZnSiIiQSbLH+xRCEXMx3RtPVxvmOStcl6DpUNoQdTNOP
	hFG8+beaXmsi++nyCddmi9Tows7ZfuHAzStMic6Mi0PtYON5DnDM7Cfo4W46Ecbw+5R2HIPkZVi
	MOM/+fXPvVfgGloxv1cgL+CAtwgbKgy5Dw5B6AEjSeszsARIRa/u9rigl/f3lcENb3CC3gCxrxl
	czXTZPZSw2Lfw632khwDzl/4eamHQ=
X-Received: by 2002:a05:6820:61d:b0:70c:f411:409a with SMTP id 006d021491bc7-70cf411484bmr1858256eaf.60.1793020196902;
        Mon, 26 Oct 2026 06:09:56 -0700 (PDT)
X-Received: by 2002:a05:6820:61d:b0:70c:f411:409a with SMTP id 006d021491bc7-70cf411484bmr1858226eaf.60.1793020196412;
        Mon, 26 Oct 2026 06:09:56 -0700 (PDT)
Received: from [10.190.200.105] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e163a5dsm6838618eaf.8.2026.10.26.06.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:09:55 -0700 (PDT)
Message-ID: <0cace778-b68f-49a9-b52d-dc632bf3a0ea@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:39:45 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
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
 <5cfc6414-735d-4df3-868d-c8c3c4a98e30@oss.qualcomm.com>
 <5478c0da-e28b-4ea5-9b7a-f7aef2c7f437@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <5478c0da-e28b-4ea5-9b7a-f7aef2c7f437@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX3I83qsks8DBy
 TqRyBWEydEm4ya03hb22+JP83QoWTDimUHlRmTLsSobjHec9Wm8EAm4WvhjDICDws5016PagU7s
 tHWxagWxq1xRRI9b/RAAzz/Cr1eCIQY=
X-Proofpoint-ORIG-GUID: RsInn7x_WZDPD4hYJJzMlX1VK4Z8YHYp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX+WN24a/wneZ+
 T9hhEAEyv9oXOUVWbG/FkpJWZ7KjZlSTzjZGGAgmkjX4nEfqEcx7Oc6AEcz+olb63yfA1ZbqADP
 IEnD+aJ/J4jgV+oA0Tzp7EzKFfv5Qx55ujgR42gAm5g2rPGhkOP38+vhMRhe/FhDMbXLSXPKSzj
 XF62TgQPP84jGcRkqlRbxpd+fsmMrf8qqCqwrTVe3A9kqPgH+o2zp8QPh4Ng8oMc6ShZnUYOb6e
 ICPjg8FuJQq+WXRyC0aSNRtgZQkmoGcSAV6weVI/kfRGdIP72MRpcIdNswxy1JYUaGN2p7kce/f
 cm4QON7MmJwNeSRACD8cNcDaAtzskUBD4uq2ue4t++c4mDm259IBqOMjVvS7X/D1jX4ex+V1JWt
 Q8Md5hBkkutFaApO1pp2X3hzxJH2Yg48x5gORxMvGQnfPLovY2FKCfcJyWNeYke07MMXYkjKirt
 oPVyGbWIlqO4DOElF4w==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf5125 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=orzTaoVzejLQ65uNlDkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: RsInn7x_WZDPD4hYJJzMlX1VK4Z8YHYp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052



On 10/19/2026 4:02 PM, Konrad Dybcio wrote:
> On 10/19/26 12:31 PM, Konrad Dybcio wrote:
>> On 10/16/26 11:26 AM, Sibi Sankar wrote:
>>>
>>>
>>> On 15/10/2026 19:02, Konrad Dybcio wrote:
>>>> On 10/15/26 2:47 PM, Gopikrishna Garmidi wrote:
>>>>> Hi Konrad,
>>>>>
>>>>> On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
>>>>>> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>>>>>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>>>>>>
>>>>>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>>>>>> ---
> 
> [...]
> 
>>> microsoft,surface-laptop-8-lcd13
>>> microsoft,surface-laptop-8-lcd13p8
>>> microsoft,surface-laptop-8-lcd15
> 
> (FWIW I don't think there's a non-LCD option)
> 

ACK, I’ll drop the lcd suffix and use microsoft,surface-laptop-8-13p8
instead.

Thanks,
Gopikrishna
