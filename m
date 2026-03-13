Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCA335F5F4
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416987; cv=none; b=DQEF1qoj0T6NqUF3JFHvUlIn32nJTacY1UQrMzLKmBB1qgWbhNUCZgzDNC6DAXReGAkDXsZIXJXK61sCySIu86JVBggp6G+63JGvXBzgVcAsjkn2E0XQLp+w00WZ2/202ojYEKvDDeEiDaQvsklx9tjvwss7jEiDifsbCTZ/tLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416987; c=relaxed/simple;
	bh=LNF/ulUaaW5dO4IEer3wHJzBNsU0mMg2Wob8qkOhPIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3RMo7EeAWWTBHiM5kD+MpxaAkSvmVBsKzkI5w17LpmdTzBpJhVaBslc+meZz2vU9W3QajK8ilVy4GZj71v+2+x89SQK6hyNw0W4wcpz7l4bKcmz9oaSGu14egzMDk1oBaCm8ckBqG2g+Pq4SrOnSJHVbcAEnDzC7Jxl/pghZe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4y4nTn6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxyO68du; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4y4nTn6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxyO68du"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DDNLsN793250
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 15:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ngjNSuCvttZ3xvrVRmeGzmNn
	u0ReudBP3SkdJ0pWCZ4=; b=B4y4nTn619mJ4MN0GVjX8n4jFtocDCfemyoJ7xnU
	4tk6yeltK0PgZYzx2nSEm9uUr+o3oMvk5Zi4hvNrIBjUniACDNBi+sgY4Ejr+SJe
	uvfsh2ihE3aRS0yNMhHrq/OFh7l+fH/0+hEHd+5BkfLC1CyKXMph1/yDImsJDZ6y
	bVyi6kCjlS8P2Ht/whee79nsrZ/+9rvb8VvG+i3GagZ5j5ieS594k83Vvgl4xPFd
	5wKLJgz4B2PI/s2fbxXLAOAiOsrgcydrJgwRWosUgmhxsZR4A83MdeQWdfsyVurP
	PbHYDD8CgVJH1irJKb+wwmtPSXVjZ9XoZPisf85/1MoIKQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt1vnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 15:49:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fc27cf7so1231554785a.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 08:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773416984; x=1774021784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ngjNSuCvttZ3xvrVRmeGzmNnu0ReudBP3SkdJ0pWCZ4=;
        b=NxyO68duXuU/ay89eTVemSZve+ynXislPX26yChfBsDwwncyHfxcBRFmiQTVuaIwCv
         6CLRnZubh13joZAM/VFoxlfqfdC5DejcD3laZX2pSFuU+PgC85ZJHNiNF9Ox0Ck9pAPR
         yFV27NxuULSGWhNt5J1tYS3tWEQfkLUpb2KRYRkbvXPB41yc/Vokivf5YewCguDIWErI
         3MbEOSfamdkz0BsFKFlObk1kH8ciatCiEQqJZNeKY0DI3DbGJsP83ItdJMuu/+LFOAvj
         4KLjV1hMmCRKZBnpybilrIKbaTLZ4vmRplfzWy6mqmVDPSPwmMar1gBZCdmYss2l8RI1
         HHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773416984; x=1774021784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngjNSuCvttZ3xvrVRmeGzmNnu0ReudBP3SkdJ0pWCZ4=;
        b=L9IslihIPHDEL7IdUlAQvl/wWn0vnTtmK5qnlq2b0bOCrCalEOIZQTsiTPlQGuJE+Q
         sfXEe0nbiGDlOQFX1poLf+MmLekPLYIM00Vf4k/kgbnJzVIE1+W7fj5wjreLzLDAc55B
         I11F89hJt0BpfeslIktvyB5qRBpMjqSSMngmsaNrHpzPYmYFKmHYuNfuYniEEPwBODjy
         67d7503QK4BRL0lzouW8drmDhqYDbBciixrJkgveqlQSfIPQNcQo82Ma5b2DmJXo4lVZ
         VmmrmNIdVLZMLZH+/xRzf3+bo6KioYDvURKrN9Xv+dTRxhwasgf9BLAhd9UEzuVVBSpC
         Xl/w==
X-Forwarded-Encrypted: i=1; AJvYcCWkabqbafAEts7wwaILSOUKIm1iQ2okuKLtm9jKgTzQPr/gNxzc0jRE75ADQZrWCt08xe+VTZVEoFEIUOod7XPbdbBO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ZXSf+ERtY9qXgZ2Ll/kycFzYMIim8VOXxfEnu4kPKPxTzhfl
	HQlx8Po+TR44FGpkoZUpHgFFQtcKc5IuoUX5vcE8VZUGI9tb3RxjuhaBM6GlwjnfiOJvE/2oIQv
	IQTShA4ri/YMkcwb8BDLnUo4VEvDincuYM1b2vhlkqe2BIkD92lrm+k5ACBr1tDG7zBNhYTMhus
	t9
X-Gm-Gg: ATEYQzy9D0GpVWAu96tekzt9NhsTBlLkNlWPN/9o+XhoARiMt1uGuwaNQpCju8j3pEa
	IJzkoFhnv6QeH0zSjIE0Zfrrr4YiYW5aIv3kmQo5w3WC+0rQtQMxhfFny7fktxmr1S0MF2GiypI
	cMSGPKLlKiXCZDPUT+38SISObLEiDOfhY1rHkplEJuKPo5qxKcZBKiQFEjoonagsXOJRC5pXBFr
	HGNiB6cGkUfqBTZCRNlHYRBSwoF0F3alURyOwrRrCgJdKJMBJjAaNSS+Lu4MSECX6H3CO5xPAck
	vfI9bpZNa5WlWLv3FtLabvzpKilN/zejbwxRPtfGisY8xETzRqHWOyrIKjhnuZ+Tx9UixFwuJ19
	zHBU50EdtTV1CDQZzyMJgEGNUdeWTKTQ3qruvGZd3iZmoAmfXxR9M8RAZR+4CDqprBk2w5ys4hl
	0wB8oYvwl+b4hdRoxdDMPTrrmzSHkcpY7lUZ4=
X-Received: by 2002:a05:620a:470c:b0:8c7:177f:cc1c with SMTP id af79cd13be357-8cdb5a060acmr531248185a.16.1773416984179;
        Fri, 13 Mar 2026 08:49:44 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:8c7:177f:cc1c with SMTP id af79cd13be357-8cdb5a060acmr531244985a.16.1773416983767;
        Fri, 13 Mar 2026 08:49:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15981e963sm1198655e87.64.2026.03.13.08.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:49:42 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:49:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Message-ID: <dexkqry7yafuhtfemv44r6g34iekldklhvq5t7n5koktfgibi4@w7jqs6wsxgxu>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-3-ca9d0efd62aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-3-ca9d0efd62aa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b43219 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=BYiauv21-j_JhOubGf8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: xPjbMoo7nmyq86pnrhjC8OxEA0hmcoC1
X-Proofpoint-ORIG-GUID: xPjbMoo7nmyq86pnrhjC8OxEA0hmcoC1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNiBTYWx0ZWRfX5wG5u2bVc9mX
 PFzHm1hxCazhLx2YHF+mMxxGs2yBmREJsTr5eSk5RvwMZIbOCASq/sAbOIuP+EffjZvCyHBwu2e
 cLR7XSUYYecTm8ajKCK7s8fT9i6PiAc8tECipxfrbQzxe05SaaEiq/5daObLL28q96zTydCujRT
 EfLhRsDBf/LGXCqGN/fJHaDhR0I4/WjkM2Qybmdb/YGFF/2XlZpShT7e3T3zzZuFNywfLanZW/E
 tDGe/EnI7whj/oxpCMEFNkmNP0sdAlRWux72UxfBnRN/qyWC5F/a5yRYry2NtxEy/my2bHrwBpu
 lUZayf8+16UHe3eKwa0mWhAbY2EyGA1nsxACxoY4LatM0fSEfdMfMQUmIk0Vvb6V+HDOsIA9vqq
 2vtJNpd4/PMSYj2+rW+3pFaPW8nPu4aGXKAqoReiZM4I5yaCNXfgbFS816daF48r65gXuDef17d
 nhqienckW93R1AEAmvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130126

On Fri, Mar 13, 2026 at 03:59:53PM +0530, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Glymur CRDs which adds fan control,
> temperature sensors, access to EC state changes through SCI events
> and suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
