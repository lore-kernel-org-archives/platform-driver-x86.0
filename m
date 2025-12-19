Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888B32BEC30
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Dec 2025 07:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130598; cv=none; b=Q4oDrYVS/+XGLX1uUxNdek6qQlZRytHSt4XtnvnDQbhyraVo7Mim0MR5/auQXCJln1EcC4Zn1u72xiK1fIC/y0c02Ut4kmn7eR6GYsshpeV912d9/mfPP9TG/qykn0on+uHVIz6AtcBvQbmj9roZAVPv9FlRdmzxicrfegqZNHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130598; c=relaxed/simple;
	bh=u1nqXpoKUqnz91oo4RRHaJ6BqI0Bn3Yn9+6jh/B4hfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGALel9ksMdTHW6zeI6cZ8zu4Elzg5h9CX7sDQahnnEoIr2Q164KPUtrv0TyTDwQDaf9O/Q+23ny2xd3tOrBRdr7dijR/rsuQiCdZkJH4TdBn1KoBwnB5I6YGNUCjGx3FiSa6hJRZqDfrn/mKT1NvX2up+PF+OMchBQ0tg3jlQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZxJbtS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAfFlGiL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZxJbtS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAfFlGiL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c8EJ3559084
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Dec 2025 07:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZlzaaEJ6wxrrcHssXM1jJEht5vIfXbpqNRS80n6cZ8=; b=jZxJbtS1W6GgHqih
	mSQIj+D1ySnkzbLM9dida1U9KcUTKSx7SCo3yNCosar9C5FdSiSlcGLC001spZHQ
	rZK+aFA9mgjPeGU4XSe+caMW4MGosjZjDHKNnpM/1L/mDnc45vwlQ31iO1P/VN8x
	0qN1eUDM5kCCxh76fBV1/pigynGoeSm0KOcdknRO/5lCE3LTWSfEOU9nNOMgNDjL
	sQOlG3eG9lOyT01j2BVLjSDJkEFaxEtLieb1Bh0NNM20yFsAdVNnO2v2YtecgMzU
	6lYXXzw8LFLtjWFGZuPO83cJwyrcAPwevp/vTFg/7YgzBmU1953+rg7CFiWnWk3x
	kz2cZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c9rwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Dec 2025 07:49:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a2f8e7d8dso35094506d6.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 23:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766130595; x=1766735395; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HZlzaaEJ6wxrrcHssXM1jJEht5vIfXbpqNRS80n6cZ8=;
        b=FAfFlGiLlVx0VqJSeC3/ur9Wc3iLHkmBZgl/4XJ3m/QTEXCCoj2zp7rkpEXmnWwE7k
         lKa4I9hFdKkOl3Md+Zer2OsjhsKdv5ekB18vcp94g0ztU9rUsH06q6v1YSIqnFv9y05x
         k2hkOfTEMC3zl1VQMRuNNVzyWmuHNiviJ2n2alVrb8bTAEQzsFLldSdRYpy0Tfv1zJ1D
         YjSGQpCupEf+adhSd1MToqjOI0auIUHcAu4GZT6wGb7Ak4erEkL+YtF4TM3oSc6J/4Jh
         9yzWfA0zDeFWY0xbAH47oPmrpp0k+z6UtIcOeCJCux/y3b82sxNg34Cjfu8b5elMifot
         YWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130595; x=1766735395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZlzaaEJ6wxrrcHssXM1jJEht5vIfXbpqNRS80n6cZ8=;
        b=lrDDLVsk3Xmvflhxwo0bziZ/7QnK9N4XJcFCNUTi1OJAtgu6/dsgCpXQy22LfDlJRj
         ooBqAq85fXyiyoHJacUexNRJEU+wRZq2givAvPn80HQz/klV4iUC7b069bqS27ve8EWn
         sNw0CcNAPUeAgYVM5tUcerr79UAk7TSYUfFuHaz4l3IDqhnEfnZ7SkPPYk/2SzAdUTw/
         G8L6dKxBED+r/ivHGyko6o1+5Qq5HRgxhnLCMwrd5JGjUzhB52js85U6+spCtIOtF1BE
         gxcFSIIp5F/8M/qoMIJjXkHx3HbDhTKps45aH4jFC8nYcPBbQi32LMgZTUGpyhk+hQsk
         KVTA==
X-Forwarded-Encrypted: i=1; AJvYcCVy5hCc/VeoaZA2FqH+AZlJTo8jEV+4Wh96F5W5IUMdZmurn3lSMJJJqELjltM+w1zehcewaMdbzSaJN3MBs2yNvj60@vger.kernel.org
X-Gm-Message-State: AOJu0YyvcvUBux0yZ9y/wCMgKMdkHw/LyWiqU8GkrKCJ0u4tXmSTi5xp
	qUmbHxKJCn6a8cApHtQeoYhaedkhRf71WKBSni7I9YfYHLRxS+IXjcC4vXe0FF/IP5maCecwFL+
	RqbggczP0oomBlbdaD1TqQliHlL5utspL9bqGapScufB/jXS4uDQBiSnVxfYv22O6H1jUjbbR1L
	ko
X-Gm-Gg: AY/fxX4g2jLhNxe+abyiO79i1MUqrwKYmTrwlCX5I/W3ryX/WCabprC/YvQVKHWbZJI
	6JdfFVhfOb4OTsLkTene9nM0FsGDUJklAYNUhm/L/UlHGnlAaUdoPWGKc4G/7E6b+1sQewzLX52
	4SCYC6lkAqUGZOZe4GwdN1CBfPm+X4ucr73BgmzY9yzi35OOkfh9Gldt1KzumdnXMpGjVMujEtU
	EHvYFnS2205s4bYGT7MkwwQ1ak8Ux0jPCXdkWtUj8F0hmqqDdL/WJ7lgAyZilivLvEujH8XHpcX
	cCoKy7ANzZWc7PNIP72Uus1bBSxNRuE+uueZs5PAUP1WTExlhaarJetGCB4czEti8P4lY9XTauv
	w+LLOkNUnxWWMYUtDs5hcywccI1oT34EYBr1CQIJchCpENvhsypTdIL0nH5/YHZvaV52xu6Ah/z
	+Ep0EpUNsHRZQ4fLBUCb2NifU=
X-Received: by 2002:a05:622a:1f15:b0:4ee:87a:4d10 with SMTP id d75a77b69052e-4f4abdb63a4mr23026471cf.78.1766130594720;
        Thu, 18 Dec 2025 23:49:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0rwAFeOYFYWNd8aqh9qwfojG37bl+Qt7bAMn6Hl/AMKiwrZmA4fsYM77wdMC6YdUhqmP2Xg==
X-Received: by 2002:a05:622a:1f15:b0:4ee:87a:4d10 with SMTP id d75a77b69052e-4f4abdb63a4mr23026211cf.78.1766130594219;
        Thu, 18 Dec 2025 23:49:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5ea6sm487096e87.5.2025.12.18.23.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:49:53 -0800 (PST)
Date: Fri, 19 Dec 2025 09:49:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jerome.debretagne@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org, Dale Whinham <daleyo@gmail.com>
Subject: Re: [PATCH v4 4/6] platform/surface: aggregator_registry: Add
 Surface Pro 11 (QCOM)
Message-ID: <njdekii3plrcrbno743lpspc7vxozbfkf2s4vdft5huoo6iyan@usu5pn4527kx>
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
 <20251218-surface-sp11-for-next-v4-4-7bcf83c1504a@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218-surface-sp11-for-next-v4-4-7bcf83c1504a@gmail.com>
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=694503a3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3uxqv5YaM5NtnTnEUcoA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA2MyBTYWx0ZWRfXwYGpjs2pl7d5
 F7H0Q3VfVMHztEYZOz4sfvLBJZWi9O+Ait0PY7+hfrWmKymW9D52ARM6rm6rFmZwEPHLg5Q6i9T
 qtYsw5G5LdP+YV9ucQKvZK+gAKBFekz3wR+Feq/YPcK1y2mzD5lOAbgvZ6JtwJeCTr1+4sPK8mf
 Gvm1RqSt0ykBwTp+xITmR7IbGns/YVaGVgyYuO/UQ0i+E+Ag6PddqiKPaiZ76/8/fQ3qXWAgYBA
 cUJaXEoI1ikZXwr8BAQOgqhm0K7Vymvo2/WdfKmH4T0PlPpYha2PBAus2zDsKkqnNhQOwcYEFrf
 8I7l6agypPUMSTWQPhj0GMwFXjB8r2imz7sTPHVajDtXk20KCW2i2AaaJhVh8n7+4QGDLsHQBD6
 2g1QkXqS92ELiqj3yamQdJ09C1TFH6KR/QZq75oZ6+oCLdHJdFoSvcAXazxUTSVMfLOoZU9aSO8
 ofsb286z5F/q2m0rg+g==
X-Proofpoint-GUID: OKZbcY7W5JEYadXKOjJI01mr8Dq5PbCN
X-Proofpoint-ORIG-GUID: OKZbcY7W5JEYadXKOjJI01mr8Dq5PbCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190063

On Thu, Dec 18, 2025 at 11:22:10PM +0100, Jérôme de Bretagne via B4 Relay wrote:
> From: Dale Whinham <daleyo@gmail.com>
> 
> This enables support for the Qualcomm-based Surface Pro 11.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
> ---
>  drivers/platform/surface/surface_aggregator_registry.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
