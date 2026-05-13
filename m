Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7943423A6D
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682465; cv=none; b=XYXJlQ4CUXKc8K2s8K8gjebT44BhLI5ZUSfWMhIaq7HhLd7DNuDYsYWIvCBk5PKQ2nieDD5YwXSIvm+cFWM8fIAFqCk6Xq0A48NZgscfNLDZ5wxWccQeX5ZJVENNPiYdzAeZIbfa+As21CW81iT9tv9rtwlxNO1WzGE7pzu+hl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682465; c=relaxed/simple;
	bh=SxDZpMxhiKrgSusg12vnsvU0n1cgiERm8M4RRozXgYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJlPDFFrwA+gI19HG9RpAn2QknUELhNskh/Bon+/LjV2f8GGucYA6OpR/yodhlT0rB7DI/hwd4Cf9O2lAKJIpuzlq5dP6YsBasjDsdNyXrM65CrLpfltL6r5KwtPpv4nwIyARw93EWZKQcWoBbKVdTFMWFnzfzb4kKvAS5Netis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARVeGKW8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QU+mntWl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARVeGKW8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QU+mntWl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rIAr4082600
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 14:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2x9/ObHkNHrSVs9ZLhkJp/z2KvggBQnqlMrwElvtFI=; b=ARVeGKW8PX1r3rvD
	KQdKkQyliQXBLS9zH0X5xDJ6vPWk6GP8eNa0TM/0DfB7W79XW3u+Y+KxOKzJHAQe
	GAV6YMnQDn3QEZ9EjMYJgGd2KJEs64dXitRXlT5XwRL3fioYGDGDlVd/IT3vrLA+
	1Kz3lW25e9Q47GsJC9+jN6pzC7zsAgqrf+QaYtQYstBegKUrZnsk5IDshPvAXcxM
	hLi5VqmwEiJqCpDR9LgU1Jkx29nhzmIOir6EclgUgdY99/ub+GMF+AH+sUuMYCW/
	7UYvBF6SzgDGoEBOaen87brv2CFATa1TFeBod+f1AErvdE9ketadkFtd4oXZ8Dok
	Pqhfxg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e182x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 14:27:42 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6313385ca1bso3173279137.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 07:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682462; x=1779287262; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E2x9/ObHkNHrSVs9ZLhkJp/z2KvggBQnqlMrwElvtFI=;
        b=QU+mntWlOp6PMKvwr4x+DjPzQ5tmJrk0HlwE559G9in0eUKJoVeg3jJIR/+dcfeVMZ
         1yE6Kp1Mhk8KTsJORooeflF97lhgYGk+KPxhjjehGethISh3TPu4u31X+TAw4mnCQ+h6
         B9w8x9Ynr4PbE+xUDGzq3q3e2Pk8SyVHMRAckR0U8TeyvoARwptxZdMeRTnN4HXUYF9C
         CwCYpVvQFz9im6sn1oT4aGsofRHkKhFiGzRtZEPy+O5SNF59aXotu4JhMJ6OJtSjasGU
         P03tqgzsbX3HBUzDmvQjdmKH3i+CucYAyvkK2yQ+eriOTkFWcoGJLjCroNQ7JlRClK8U
         5gRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682462; x=1779287262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2x9/ObHkNHrSVs9ZLhkJp/z2KvggBQnqlMrwElvtFI=;
        b=UG5vKrI4azxvZfG6Z83HThTCkQyNyKIWZ3ooEtkl9pob+hf/Nsi6zzDWsIKACsypdP
         bvbf3cB0L2ss12ogs3sgpNu5mUzFNstOBzLdaTod4CItcx5QIeRFrhC0ditszDjXGEiY
         vRi53VFUwYp6BQP2VyH0SFIZq+h5Yof+WoxBDzKHLu4VUAeYXncaGd88H2gxeGK6r1dA
         8tWwOF+6/hKJf8BGcT/W3T4HwRVFv4PymacfK8aKPM2RpKSOVbZbs8m5H4o5OkZLvZsF
         Jkc16w/Q/t8JoqV+yZqmuHLHBJeAByditf3MP3/2yXyo5JCLTbz9oFMI9RbgxvpKDnOX
         nfRA==
X-Forwarded-Encrypted: i=1; AFNElJ/oyr/RID7wnIYiPpXFB+h4X5NDPloEdPkWKgQlvKagvZNSWUPZwKDmT7kBcilthiOQA+4T0GB3QGiro0voXgZ9/rK4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdu8sppj8ziNJ3i7p2zAHucSBT24OCL7BMYxRjfoDQ7MxPznjh
	4TawihCzOh7QpL9TIV0rGctkt/HRwyBjc2iZN0WOYXk5EKQQ0BxTy+NX5ekiH4KYVpRSqCZBp8A
	kuCE00VEUWxeuANo/Lami2bvEam57sLDKtnN9hGq0lt4c27iUr2+ZzwMGpihQyGNh4Dq6NOrG27
	wT
X-Gm-Gg: Acq92OGARBINf2sZrjNoha1LGPelbTKHqqa4kJlqTGAGIHjfZMwq7C8w+Xd11lCceDo
	g6MKFeDNIyYFdqyMryIxzZXMUjyeKMAtf1A6idmO9fr7S7lAtBiUfl5Sq1EK/cMCwTp4YHHLBmi
	haZEMEoYPGPtDOgJsfRVKhRV5AjAobg8xb+NEzGH5klu5ovP12NXwIGcX+aaCKbh3P9CPVHRKhk
	P6lqB1SaPCzaeL3b5i8Ivrk18zFYF02Nvnk50PXiM3RN6sh74KQTiQOQG9QQ0ZAEfE7EAHk2HP1
	V8y2BgcsIq/Pw8tO5x42nmUoZR1IqFG4MFXfg6jkAPcjx9Sy1b2nqQ326cxYb9iBhKeD3tJebAF
	FyQDsxyzpDHZZEKOGsgk0n7MCWrkKbgXENGjtsEPq5FJMBOzi7uRTKJ37OXfklbXbn70J6uMCN9
	26bIWHPOOqCEZ2yc7wY5/tyM0qrb+3Ne/GNi0=
X-Received: by 2002:a05:6102:6041:b0:633:c6c4:b328 with SMTP id ada2fe7eead31-637a6f3ba12mr1163662137.5.1778682461828;
        Wed, 13 May 2026 07:27:41 -0700 (PDT)
X-Received: by 2002:a05:6102:6041:b0:633:c6c4:b328 with SMTP id ada2fe7eead31-637a6f3ba12mr1163636137.5.1778682461219;
        Wed, 13 May 2026 07:27:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d2cfsm4203946e87.25.2026.05.13.07.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:27:38 -0700 (PDT)
Date: Wed, 13 May 2026 17:27:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/6] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
Message-ID: <e6ufvm45w4v4nzdxcnzby4wbqof7eyvy6asffqpamb3twhwde2@jhl4yin72lyp>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
 <20260511-add-driver-for-ec-v9-2-e5437c39b7f8@oss.qualcomm.com>
 <84949728-7d0a-4ce9-f37c-8200ef792baf@linux.intel.com>
 <58b7b983-b717-49c7-9019-8862fd47695a@oss.qualcomm.com>
 <a29448e5-2998-6555-4ae4-a10f69c4e2b1@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a29448e5-2998-6555-4ae4-a10f69c4e2b1@linux.intel.com>
X-Proofpoint-ORIG-GUID: 6INPi_kSdWXQpj_UGsskXQJj-ODwNA3L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX46cbUB+PaXU2
 WZCnBULxNbBeMtLzx5hTFbKcdl7E1efKcDLVWw7IlIWi7KlLlfo3ZNUNnRm5RUAdkFQxy6364TU
 Wujk3U2rPBbrRXLpSNafU5a+lmjkYluHtno1hbHCNImdXsHvBXBcmN4Q3h06WgCqWJBUflW/yv7
 GUoQLTicHSckHD+zGSfr5tag++dDNxax1/oj2lX/4jW4Gu3VdEUm5Wat5ilnMM7U6+7y9w0ae9E
 EWj8BgJagsT3z6+SQJ6Ty+/gjiNB+KPqK9DwKNC1aPPx/cEcgqWGRbPtKpl2bmYyFuimt3vPI1f
 aYGUS7gKR9jfAnH0sMsbOrhZVOcV1ZnNuKSNW9N5bJ6EcC37ZgyOgSojAKxHZZKlzgY/oeewrrZ
 qKnnOJa8mp3NKQ8uY+MLzz/DO2iAL9oHqXh6mZnL2VSxDrqsIsJXQeS4V/I1t6G8sNDtyESm97j
 MQVdBrI2TXH9p8DSPCw==
X-Proofpoint-GUID: 6INPi_kSdWXQpj_UGsskXQJj-ODwNA3L
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a048a5e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=LygiS4vl0DVuJfOiXdsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147

On Tue, May 12, 2026 at 03:07:42PM +0300, Ilpo Järvinen wrote:
> On Tue, 12 May 2026, Anvesh Jain P wrote:
> 
> > 
> > 
> > On 5/11/2026 7:40 PM, Ilpo Järvinen wrote:
> > > On Mon, 11 May 2026, Anvesh Jain P wrote:
> > > 
> > >> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > >>
> > >> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> > >> reference boards. It handles fan control, temperature sensors, access
> > >> to EC state changes and supports reporting suspend entry/exit to the
> > >> EC.
> > >>
> > >> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > >> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > >> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >> Tested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > >> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> > >> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> > > 
> > > Thanks for the update.
> > > 
> > > Patch 2 applied to the review-ilpo-next branch.
> > >
> > 
> > Thank you!
> > 
> > Will you be taking care of merging the bindings changes (patch 1/6) as well?
> 
> If the bindings and dts changes go separate ways, DT linters won't be 
> happy so the bindings and dts changes should go in through the same tree.
> 
> As such, I only too the platform drivers patch. All this should come 
> together in linux-next once all patches are in some tree (and obviously 
> eventually in Linus' tree as well).

I think it's more typical to take bindings together with the driver.
Consider a more generic case of the bindings describing a PMIC or some
other common device which gets used by two different kinds of platforms.
Which of the DT users will pick the bindings?

-- 
With best wishes
Dmitry
