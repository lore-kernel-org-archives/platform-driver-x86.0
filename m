Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E026ED45
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 17:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422258; cv=none; b=P55m+IdrVieHd/nYnTby7h4NCIggnbZQnGO7HNJ1QKdo1nXmVmxVhCWjgIY1HcQIFN0J6SR5RpIZoLNqeD+qbq5AHLPf/be5/FbaqVXfAJRLvREdhkUyMoE0l6N9yhdyHdliihUfgNlYNsJlPaghLrHNofvAJjxjEtYQSjvPbZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422258; c=relaxed/simple;
	bh=4kK19L+oEXhz99tTC22LyoVqDULChFng/uYuJ48vnUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5XXgayQ2R62dxDW0mtdAAYCwHuqyDxDhw4FXlZoI/68ZI+BJ/GIK9zU/ln3X5+9wLmTxHAALUvuH+xhd+GR9Xo+esy3U3jrxEQpbQtOK72bct4f+voJxkpSPc/gZPg74NiD72zh3/0v/uhsnboLJw5O/bUgbHm5aHEJVX9Isj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lb9lVsQq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FV2pLzHi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lb9lVsQq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FV2pLzHi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DDo7Sd237704
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 17:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/vh3LYtVXjYBd57znGWiCW9ksY5SPB92ANnoZ24/pfw=; b=lb9lVsQq3tFEMg8l
	gbivZ4+l+do9gs6hvwgNA/JWaZRW4uBr/fW6TUS1tP2+7FeMWBIad3cRIBsFgve/
	LzdJEHJzxhZ64odidmJA04jYXHTO/hNjW+cYNCdWglFiKsx+k3ZoHUZU4tdJsKBT
	vOmQdYNfiln2ps1cP7i80p9LDcZm97a11vqXKwb0exmN4trBADE43COdNmqdnGjB
	nH8YQpDqSiNQySWd1QY1AkJFTXHoYxQqmdWQJi5ouXxzKYRzFMLUwPcLYTco6oOD
	//B/jqxB/yEZ+TbTidf6dw6f9c9fetSn53ndY9cup+tt7fDPD6pP6zLwuxcSfK/v
	bbdilQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3da28r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 17:17:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd77bc8186so2204616785a.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 10:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773422256; x=1774027056; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/vh3LYtVXjYBd57znGWiCW9ksY5SPB92ANnoZ24/pfw=;
        b=FV2pLzHizsVGTPFGQxDn7kC+N7IelIpB/nd57cl1xWOdR9tNz1rfjQCiTAkXAY9zsS
         lcKQB8GmLpp4AQzaGuItVO6bd4ItE1stVfbSeIN8TdoNOIgEq6O6OwRwfPncsI+swUSJ
         HNuOTzjNpB0po9ZZYt9K+T21MqtejVStNoEyKcbUFcA1QNSYWgZqk6hpRg7N8rjp+Idf
         T9U9Lfk9okfYlFSBIsdKm0vJ6XmDEpuCWvIz+PhxuXjO94z6m3IwDuWYciNxc/b17H9M
         d9L7DlLqEzIqULlUMeyB8WAPmxcZ4cY043DItkK4iAfveE4wNZuC3I00GIEjBryDG7Ef
         3etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773422256; x=1774027056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vh3LYtVXjYBd57znGWiCW9ksY5SPB92ANnoZ24/pfw=;
        b=Hj+IbrxL7V1zQICj92WXolPxbrJgtZHVI0mt0WUmKyaEvrFIxTXlAkLRsiQqk+eoLI
         o1fnmXjFCx75CV4D7IY6oYtS8bHLi4FLFwFjBxEEq1hjD+fP00DG7nzRUT4/rn1DBfDS
         R7nmTWXpsxRhVInCElbJBOYzUNEZA39nYkrbCHFTf0anCeOjU6t/agyOs64tGoAKUgUT
         LDnewCp+NKMYF185ZSVKjSHPAgV0g2sNdMZhnl/wZY6rR0K5fe+g5fYlr4So/7XVapNY
         dcU/1hF0MuIC5Wk7+0TVg3lWYuI4/WGzr/ZyxHAWYMYpfWBQv6/Fd9gtBoWmFs0/zn0f
         hzUA==
X-Forwarded-Encrypted: i=1; AJvYcCWq/z9TU5dUHZGkYAoDc6l3oZgJ4XBeMvdOaXy49LsINyHyRnZuL3i7P5aKXfCfQWQbPSOnGMCyVp1h0UgKXqKobLth@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3iL7KATt3R4yorBGnjkNY6bAIwGLgSzrtXxaQhXB4fzGmk/St
	cu67o1ZtVDfLdxuUKMc3sGnsfY1palmntGMRMll5bcQokbf1/18Vm0z295eT+zYvQRVpuM9ivC6
	3kFiiDRtP6qwWUkaHxQmA/C7FfItaJTKTiSzpMjKTLMSr/WvW6RHe6IzPwwBg7vGN0Zv0eld40b
	bq
X-Gm-Gg: ATEYQzy6EZLe97iH+2qaVNkfcXqgA3/ZCOCwlTMpDecJU2QdGixOa0gAAoBl1xagOMn
	4mjIltF4zjd2cLv6GHAEA7VgkPUN63UOXKCFgXN0P5lNQ62yAqTf482St+nts0z5AagFZqBQ1er
	ZYT++X6+hX4N2ATjb4J8t4l/Tl5U4t52DXqYC7sO5jebvLRuk1bp7motg6qFofEAEPf3R/NwMVo
	pdH9xscPuYiTQ6Ju6OlM3D53k12K/cqWzSjwpAtDzAqZRhqb+w/MW388L4bP18f9Lg9B3zAQphb
	TMrhLhtPm9HYE2kVHXhP8S/JtppkVoSyXj4qmdQYdW+AqAp0877m1/28IvKOHmqfsl5nawwuStS
	ddhXhLsJ5aHHvGsy0WTlFiryNsosi0ADjuJRHkw5q1CeyPFxRmFWZYqw3dK5OxIAmQopaRG7byX
	sp6eMItS9SW1N3Y3oU/QKWbLsqKX46WW51bSQ=
X-Received: by 2002:a05:620a:4892:b0:8c9:f996:81f5 with SMTP id af79cd13be357-8cdb5a003fcmr602539885a.3.1773422255973;
        Fri, 13 Mar 2026 10:17:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4892:b0:8c9:f996:81f5 with SMTP id af79cd13be357-8cdb5a003fcmr602534685a.3.1773422255437;
        Fri, 13 Mar 2026 10:17:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e5ffsm1682714e87.29.2026.03.13.10.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:17:34 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:17:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH v4 0/5] Add driver for EC found on Qualcomm reference
 devices
Message-ID: <azoaku7s3lxgcccc2rrp2bljbvqeitax2bl47k7eemy6uhcr2g@kveqod2tstgk>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <132116be-2964-4b98-be2b-1baae5bfb58e@linaro.org>
 <19e8837b-d711-4d0e-ba9c-e9b2c8330969@oss.qualcomm.com>
 <aabf9bfa-aa90-411c-b9f6-706f963a5ab0@linaro.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aabf9bfa-aa90-411c-b9f6-706f963a5ab0@linaro.org>
X-Proofpoint-ORIG-GUID: WM9ghK1mBKkMQQ-9wCfOx0AS1tLorkKH
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b446b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=D2q40PupL0JkXlA-VGEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzOCBTYWx0ZWRfXxWMVb0CNb9Q/
 qfseHCk0J3yP8wt/fx5TZGuH+Nq4n0ByUFEbSHApRGSHT6Unz7Iz+9Lb7ICcq6pcYLiEm1RWCIG
 olYtn56K0SnpF0SyIIrOwPqOHAPvdB2DhX4O92Az+3OzGKr03Q4tzgcggrF8u4aVIxQxf/s5RQO
 32l5Fm74v42mxPMUSNc/Hfo4YypWzqxqlwgxivxHhlMSCa4E2sicoMuHcHkQdjywIWMmCcOdNK4
 KoSfoH3uDYe9n/M+4M7BHfjqyIm8RzsfVcR9PM6HQSAazYvdGbPKYbFw4iPowb2faAQTOOO26rG
 pXJEwOYqTSXXZftKR/ar3dyTW40AmXgGcINe2hSF8UTQlFMhms7c2ZPH+lYydYlQjj5TP3Z25ne
 Y4RtpIFDWxmwJkG+rjsts16l/1QNnrY+TpnjGPzkvnuBd6VFyj2XxzKwTAWhBkZq2iIhbxZzNIH
 nVvQx7F6Oer/98CrLAw==
X-Proofpoint-GUID: WM9ghK1mBKkMQQ-9wCfOx0AS1tLorkKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130138

On Fri, Mar 13, 2026 at 04:26:16PM +0000, Bryan O'Donoghue wrote:
> On 13/03/2026 13:15, Anvesh Jain P wrote:
> > > [   27.311768] qcom-hamoa-ec 6-0076: Fan count: 0 Fan Type: 0 Thermistor
> > > Mask: 0
> > > 
> > > ?
> > Hey Bryan,
> > Thanks for trying out the patches. CRDs typically ship with
> > very old firmware, and updating them to the latest version
> > should allow the thermal information to be populated correctly.
> 
> Sure but looking at this we still load happily even with all of these values
> set @ zero.
> 
> Fan Count == 0 || Thermistor == 0 => error and probe() fail.

WHy? EC is still there. QUite useless though.

> 
> ---
> bod

-- 
With best wishes
Dmitry
