Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEF83A1A2D
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 05:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773119438; cv=none; b=YYjXjec3xxFNEiKtLnWtyNDc4y00p9gcuDw67rzox6F6SFndOLxYUqqcqrvm6JD8NnhxeEwmOU+vQIIm7uHW7M0r3dbCZrbuq3YvNIv0AMAG5+R47iokrhYVdMVrHPyEJfyjAwYZc72bhbR55FO0GE+qA41qkX5mNj68Aj4Ajrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773119438; c=relaxed/simple;
	bh=3yH4LiQCAVgPW+AtuR7/UJlQyLoqTEiDqSsitVTY540=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5N4fHs9M/6XBhrIvsyGd0bh448NQgYrMyYhoIKvkTb/dp3A2+kvipd+MAmYSRFg4qp8JdELj9Djp2H6f+IJPSZayY001HcAmL1ZpuAoBf+TQLmWu7d+FErcDXbbOh+uHA9xIKBhjtPdEI3JzL/pamGs2DH/QhUL2gwhjdvxPOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEeXQcxK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9ZZtiUG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEeXQcxK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9ZZtiUG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EhSV2817805
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 05:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4xACyr/eCMEz/lpRutUuKELpFSbY3SllWjRNOxMF0vo=; b=gEeXQcxKZGjBJr41
	E4yyLFXHfIWuPChq44qLd5pDW0tQMGatkXLsqzpoZHdcsxFDG2Lbc4mOw5dSK6tK
	hIbWjF53Mvm16+g1cKvXWYTfok12KobDZgoFyqYFq/QMhL+Sm9cU3WkH5wpwlyC3
	mY6uvCIFIhEnvvAGHk1tHOvv44QNqMcGF5htCQAmg6PL8vunWaG+LDXlUEKNLZs5
	nUUq4/BopZzmP7zpQC5OKmOPVR6QS2xk2TlqQKgPbJk2qHPuDTMxs/lE/HilocSc
	tVEsjvJH/FJC8U2D2e3lYbcfLSpSiQ1RZ1FLlT1ZEVyVtt+qR5Px2VkERXVwrnbH
	lG8Xdg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr42jwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 05:10:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aea7747aeeso708005ad.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 22:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773119434; x=1773724234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xACyr/eCMEz/lpRutUuKELpFSbY3SllWjRNOxMF0vo=;
        b=P9ZZtiUG3bPTPMWJA+/ENzzkHhu7tvj/SINTiiynNRyjodbEfG1GhUmUbfiof/GTV6
         GhwEaNkioZBNUkVSXB9MZoq3cG3Bswwd8eNV9UR/+MYoQyXR6wu3qPjAxPApimG/PWk2
         4BoEr28s8frf+LC1uwULtEWy8vmIjorZcJ+1AWRdmSprB4wPyPPv3ihYMsP/yL0ooz91
         Ur96GhqsIngrZxkCqydkvMWWccQfo19yFbWxOwTbB+65VvtLKfGpFLNGh71noeYh2klg
         EBuu5ZCX+g6vXu7mltPVrxtLoBdbvF6iJkxpQrVfxB8qwEjFa2GveSytb5hbr/sZMmBr
         Rn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773119434; x=1773724234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xACyr/eCMEz/lpRutUuKELpFSbY3SllWjRNOxMF0vo=;
        b=UsWKg5p1q78KhzS7LF/YMePVuYAjeg1TTjQsvCG0wjK9XKgEA9SdE6yNnBBIc+4s7T
         Ja4nvc66coKO90SKaGz/8qCCgeT3JOSYIX8ThplA17GuoYs8pk0j/d3KJNcxjJufKI2b
         1mqlR52MIMB5zUIC6zgBD8M/lWgv5pkL7BbNOHUGzW3pqN3pXhzOr/UkW4gXE9jcfWQ/
         MxcV/1oTQGoyiK91Vj30jzuCoXcufi60lebBdWWhEsIIoybleiGis4vt7MbjDTNFOPaD
         XnZDvtcSRk0rVzklZihXfBafYqjs9WFhkrR4JPO0Zgw501R1HldgfikBRrUHxb7/WbC/
         bBtA==
X-Forwarded-Encrypted: i=1; AJvYcCUeCUA9O3qZh925L/6Ywl7BFBPhY2ie8pMjibA+uf5oFyVH6z3qf6qCHDPgOzvX9cdNcXWNTEtMIyL7cwf9CBSBPWMN@vger.kernel.org
X-Gm-Message-State: AOJu0YyJo2bk8FRkol2kANHxYLjTk+Y+Nj5+qZsooVqP7yvf4UJuOa6+
	3gMIwN6OkXUYBoX0eEamtX6++9KQlukIXY7sZ2kwzQVAygFnObFAbEaAsEvcmpACLI/vMp7E52K
	zOKvcVaOywyTdpUseF2awGkVHE4DWYBQjnoSOnvLe94l1e2P32hW2laWOR8TGn5m73Z66ZyDJlD
	Aj
X-Gm-Gg: ATEYQzxWs+XzXcsMBS1OjEdc1dsiuq1p1VsWgFQqqU3ckvSIbslwSrHhRz60onbz7bv
	yP8AurwSH16ZWlyxR73bfHw6HmhalT13rsWDMXcZnI9vv6NwGUC37jpcAwmC1hr6uvWubsaDI6b
	S07vjeHpV+dAvIKg/GAR5MZz4uEa0dZNhbPlsz/MmZTJSFU1gzwVA8zscOP91+MSwamg9MSaXWr
	fs1HZwPXomsJkxbKJPF4phEg28pVEZaOfBYxcdkcXajT6akfln81x2Mkz5tGVeWmi9fhwA76fzt
	Ylr1m5gFifFBfrkov41sSFRy7TtKJ+s37e+JJBTJ+49YsikJIo3W//0GoZjhRbktnfovdK1L6Gt
	bQG7k4AMQ3zwfQjSvytYKhgqVWimd5QpOvX5XcuXRTK57wfxjbNQ=
X-Received: by 2002:a17:902:e790:b0:2ae:3afc:eb38 with SMTP id d9443c01a7336-2ae8246be8cmr135644495ad.41.1773119434252;
        Mon, 09 Mar 2026 22:10:34 -0700 (PDT)
X-Received: by 2002:a17:902:e790:b0:2ae:3afc:eb38 with SMTP id d9443c01a7336-2ae8246be8cmr135644135ad.41.1773119433756;
        Mon, 09 Mar 2026 22:10:33 -0700 (PDT)
Received: from [172.20.10.3] ([106.216.228.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e78f6csm178723905ad.23.2026.03.09.22.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 22:10:33 -0700 (PDT)
Message-ID: <65d45dc6-a3f7-4e5f-af53-8f54f1f5502f@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:40:26 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/5] dt-bindings: embedded-controller: Add EC bindings
 for Qualcomm reference devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-2-sibi.sankar@oss.qualcomm.com>
 <6wim6vo626jy627k32nlhxjd5dh7cvvwxraqyv7uujfgbo5p4m@cesxgplycnpm>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <6wim6vo626jy627k32nlhxjd5dh7cvvwxraqyv7uujfgbo5p4m@cesxgplycnpm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA0MCBTYWx0ZWRfX18IgB520AihX
 llcrDEl5k6wWpo6SFXRB+e9Bg91E9yGaS3VjkCjA1UhIvay61pRlc3ppab0R2kWKZzFekfGL5Wj
 4r385+Djah3oHQBpvzLl/JpMB9BLtfohXg1WUPgeENz2vrLzQ7QoafIAjHqGMppttLJiu/UXDjg
 gQ3dBwjxf7wrRB+iVzweORrAfqeIR0KIIu9gB97c1Yv3zKs6MQgS93ikHW6iLsObQjcIMjoVm1Q
 mnK2Aqx4LDvM8lhWjqBSo1zEDwfBpy0+zXzXDVp7+Ojdx2AlXOCnVPQacmkRUfpZePmqNR8giEA
 a6AbCm00nGMWx9Eg4uAF+FEu9HQEwyC7HcSwH8A1ADHmg2Fs51Jnf/eWs1m3hQ8i2kDuz4RAKuo
 SKKFt9Ukce2qgZjmhMmj3HsIt4PbesemctkNEnx0oLKu0H7CuzpWoiV7qdX/2I0YfYAqjVw6rFp
 a4r53hZGinJlNYMM4cw==
X-Proofpoint-GUID: GxO9wUB2fXMtf6ON7h5a1oTQ7vQkp1_E
X-Proofpoint-ORIG-GUID: GxO9wUB2fXMtf6ON7h5a1oTQ7vQkp1_E
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69afa7cb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=8nKWbjjLc7jCNgWBIcU1Yw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JntA-IUrK3sPUjGN3KYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100040


On 3/10/2026 2:36 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 05:06:42AM +0530, Sibi Sankar wrote:
>> From: Maya Matuszczyk <maccraft123mc@gmail.com>
>>
>> Add bindings for the EC firmware running on Hamoa/Purwa and Glymur
>> reference devices, which run on IT8987 and Nuvoton MCUs respectively.
>>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   .../embedded-controller/qcom,hamoa-ec.yaml    | 52 +++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
> Looking at the DSDT database at [1], several laptops are using the same
> protocol for the EC. Do we plan to use this driver for other
> Linux-supported laptops too?


It's very likely that the fan control/thermal bits are identical so
re-using this driver would make sense. That said we have no insight
into how the EC firmware is extended on the other laptops, so
adding support to them would still involve a bit of experimentation
and access to those devices.

