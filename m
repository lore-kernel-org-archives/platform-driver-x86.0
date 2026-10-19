Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9C44D0CF0
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405949; cv=none; b=A7JCxfB2fsuymazBURvr2R73neBZvqXYE/ucuW4ixCxR239Zer/4wg4lI6zCURuThw+IILMBdwNNFvjZowPCqdEBPPbhUFad0CRz7LiuJ8V5f7rMk70SKtTuE2X4lWQfzA/7gy6/LUeXbTVqvIuyjVU+BzNXRxjfkrspA4jzfqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405949; c=relaxed/simple;
	bh=ZpgRYqGBJFaTlw0Nu2YxpUpUPwy5exJAI3Mr3Bp0pFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sND5ndAPJxNhMfIC3N/0xSeWwIOFyfuZeaZvNOMObLbJYz+POnC+XxeLWzl5TBAZL+9P5eQONHm4Sdi2+FitXG/vLQec/RNIKw8sV5axVBVThC5kaM8a/6zL//agI2Gb4r0WrY7+T8IaQdM6hn5sjwTEAJR6Msz1dtoNq4vky18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pUt5B6Ut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MEESPDhI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pUt5B6Ut";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MEESPDhI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OqT91665315
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 10:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZpgRYqGBJFaTlw0Nu2YxpUpUPwy5exJAI3Mr3Bp0pFE=; b=pUt5B6UtyVEue8dK
	i6HVuO/CQ2g4p7EkP330vUXL7uINxzn9e8uVakLcggpSEawoAGVFCZHTcZIoENx0
	P77BdelwTqWSG2/5bekVj4eKniMg5vPc/Leqec2Yuj/rzZWj2raIh74PA8zIy/Be
	gQfI2GFbflsAx8oywQ1Itkkj4pY+p1zA0Z71zGBs0tdZ9aD0VcYBZe/GmeKKGxIt
	/pKjm+c3LPWTpATqECgS2XkenB5ETNtKTm+azWoLmxfK1OqEgtRzIZZYIkt8BJ5v
	U4EMizY/tt9np+mPs1btFLZk0tE/CtJ99FHUCSaTnkGrhOzJHJqW/fz2/Lkdw6gT
	tWYI5A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0md7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 10:32:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so71694385a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 03:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405946; x=1793010746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpgRYqGBJFaTlw0Nu2YxpUpUPwy5exJAI3Mr3Bp0pFE=;
        b=MEESPDhIKw9Zwz2x61dXYEyi+uUO0/R2f/iLYmJ7xvuldq7JRxk1nUotGSpNTqDEdx
         wlgMAyrBdTgEDgFiDBv5nl/b4RTysAsdO2zE0QAsrZWSVWUqAW6ADagxMDVh/4PD7gQW
         AAX3oOFQUyxXTXkcoR6OXgJn1j5F/8dF2bJSS25zmJBp3d+uGchDrEdXs1zpp9WHzLSu
         bS06bXC1xeO6F+gMY34syFTdpUU60jIMf6DJ1voxVPhkbPIjL4hixicUzeALTlCcqoV1
         94mwYTUpQkv2QpUBtfGJijlGpxKLHO7DteHUPOBKAE4cVXy8CtCcT0FJn1yXkjIgyFL0
         vgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405946; x=1793010746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpgRYqGBJFaTlw0Nu2YxpUpUPwy5exJAI3Mr3Bp0pFE=;
        b=Ytxk/vl0FMnfIbu9xOMTK/c4Z3R0OGDdqIHKrEfXX6BaLOgCU46oklwggn/5dr7lLD
         4fpA6F6/xVbi3GdfekArMMHfyW1cX6CDUjp2REyjIFDsPf0IUy1uW6hwXccBeKZaqvcg
         iqp7wXTrqKc7ZYDhZE1BqUOZXeHKc/WUf4epSI8T7w4r/LKLz85i+xq4HSZMXZPHB+4k
         PwdgXx0TgOMIdppzukKqV7oog+r7AnxdkOVS/emIxCfI9CrOVpJKDsZsaJRctZXZQTZc
         KFb4PnyuGWEr78XznBtuIq1Qxau7QrAEV1LdqMDzFZ+rHhv0ROSWkMwT4j9ObOu525dx
         s7Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzaAcM/peUG8Z+O4TjvTzqGBq1cyViu46RTGeXz1An0X72++U1fbQ5JtpzHj9FrzGwr47WNn1s7znn2FgxAQSNKVCIY@vger.kernel.org
X-Gm-Message-State: AFq9FYLkUrFhqfhGdTk6Q0YoNGYZgOjbI95LRWIcnB846crh7t28Fclx
	+pYESD97f2gjSBpT3cz+ZEKFGPzVoLDiFsLfgVjLHjfCb87BJZ+tPf3AcH68C1Lt+X/wruwD2oT
	OOTOY5sdugO9Vm9OCiDTiO3O8YfXLhj53SNlevjztq58T5XimvnR/HXkpjY5M+wYvZI0J7JASfk
	Zo
X-Gm-Gg: AYBFou3PCTnTrQXgmwoK8hUjrco9j6DOVR23OJLA2OGZLLZwxYBZSJqWwAGUiAJ1om0
	GiaaDsot+P4lB11VaDHHOnveBX7U36ZwigqP3kPBY1CKvx8jkHyvq2AUxfnuj0KlDQE14Xv1u5f
	31bGgXjPB8jRf1iALSN9cDFFei037R7JPkryhiuSLh9kNgYhYn+aePvV+D8MQVazT8s69xTUj/e
	wdC+HQp2JdJLrQMJ7mYLPNG950NTBSJPs/9QqNx3WUUDQnY9LwsNWPmRUqZUL0e6o8Xe/VQuD/t
	yCPhWkOB2IJqpaoPh2X2TFUrAPzADWJYlBmGJtEZaYEwicnEqfAQ4cMMWmuD+jtlN+UOqh57m/P
	kQn6wg3aguPfk4SnWZWvz+w==
X-Received: by 2002:a05:620a:7086:b0:93e:e111:2771 with SMTP id af79cd13be357-93f29beee37mr1334611885a.2.1792405946505;
        Mon, 19 Oct 2026 03:32:26 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:93e:e111:2771 with SMTP id af79cd13be357-93f29beee37mr1334606385a.2.1792405946016;
        Mon, 19 Oct 2026 03:32:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1eb8dbsm3607079a12.37.2026.10.19.03.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:32:25 -0700 (PDT)
Message-ID: <5478c0da-e28b-4ea5-9b7a-f7aef2c7f437@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:32:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5cfc6414-735d-4df3-868d-c8c3c4a98e30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX6NZ4d4bUzO2P
 TfxCr/eJJ4Hxz7z+L2hTbfe8eWlMr9kyd1je83s85IYmxMkdZXOuOdoArpaQXr2x3PC7EdPkXbX
 +BxcZSzi9NbbODD1RqMIsTTwvYZF/MQ=
X-Proofpoint-ORIG-GUID: ymGsMWeLPTtZe9GEfJ6rMxPg6UwD_mbR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX/ECRbJd6IDRG
 VtCqKf8qyYXmhkNHEBg5Daa9vW1txReZ1We4ASX9FLeADAD9MGjONRx6DkvNcxPeJ81aBZTsO3I
 G74mrdKRw5Vsc2SU+fKiT+4gD8qCgGZSqjaPtU5h/GTlJd7b8pozkV5vZsUdMSrT0ovvJKG3NrL
 V6y9PYuciXAkZzBTT0VbgnCjeWtojW2J3zNPUf0mM2Q+IuysHYmA25epzjrh8DfIO8jHwqSlhsv
 6sZAaPZOcX3f1qEkzcJe4kvElqCFCvMIF2KrsC7UQj9HoiyD5vThxs+IO7uvKbLuKetmt3F6SX8
 CzSN2iCgwd3eDKP117QjmrmMoi80jJ7jKQRn9PSizRPGvGymtNCcX2gX+0O4uRZB8m/PW4xV/oY
 5G3tnoRfa7rswCnhYHbG8ow+8Tqie0GcgjcQYhanmje2A4O7BhmQiUvoGZghQUZ4iv8I9zBVxjj
 A65w68h71g/2dH0Yesw==
X-Proofpoint-GUID: ymGsMWeLPTtZe9GEfJ6rMxPg6UwD_mbR
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad5f1bb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UWTLkw_F3LfYAFS6jcEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 10/19/26 12:31 PM, Konrad Dybcio wrote:
> On 10/16/26 11:26 AM, Sibi Sankar wrote:
>>
>>
>> On 15/10/2026 19:02, Konrad Dybcio wrote:
>>> On 10/15/26 2:47 PM, Gopikrishna Garmidi wrote:
>>>> Hi Konrad,
>>>>
>>>> On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
>>>>> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>>>>>
>>>>>>
>>>>>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>>>>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>>>>>
>>>>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>>>>> ---

[...]

>> microsoft,surface-laptop-8-lcd13
>> microsoft,surface-laptop-8-lcd13p8
>> microsoft,surface-laptop-8-lcd15

(FWIW I don't think there's a non-LCD option)

Konrad
