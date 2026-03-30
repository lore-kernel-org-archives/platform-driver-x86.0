Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A8D3E1CED
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 19:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897421; cv=none; b=cbBZE6oJ+mAgGLkjgTgfCT7D9qGesOXTj4A3Lwea4puL9a7a+kGm6nYpYjwnJI6+GNjQzX7wszbPaY6TSzZ3kB4DHXFS4Si/FKkJqj1VsDamzfAk/rc2VFYDXZGljZIpiVeF3XxhiPnGKbezaj4GMuaiASLD0nuiJAh13Olhy8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897421; c=relaxed/simple;
	bh=MQdfNe0iWrkeE7odJSzoRgjqdWdXch7HoJrElAiYXOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNB7nk34szzEUXM2VB5bN/RM8w41FvRraIvJST15YN3Fp1bSwP3wLLKJuxHH/6TsUzuaBsXvzspxHElaWoxZCc8gP4imarWhH6/Zjk+usdvVis/g5rBiUdT/KA+3f6TTbh0XSgMI3oKY5sWuixQxq3mi8zaol0tzoredEOdiTTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvTu5zeT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbrwsFUi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvTu5zeT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbrwsFUi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UF20kD3722902
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 19:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GDUjl7tFEqxNNCDYOtkshNsr/EvHhDf1KIBdRBBNzDU=; b=CvTu5zeTqot+M/t2
	XZndndwcEcFl/MjZVz7ykGFy2qSz6PeyyIVVlYrUWATz52el4T8kk51j0stGS2Za
	g7lZHJL6ZyVSLIsLZNcvQKXv0gTA1D7wJJ6DmoOHV6ZHDUtrBh3fEhGI0oFZfFdL
	0G+SSp6kkWCPLFCzaYv2SCJhOIqWvznwoT57vgmybsCmf+fSlyQGYmmb+kOKYdwz
	kYnGy/XDd/XRCguXYnEzNph/cUjXg0jYbygDaIPdq6B3WVXDqePIz9epRZ3Uz2lG
	jRroIwe1lGR8c6A093ttZpc1sSsv8QqMtW7KaBV6zTI/+sKP4YVZYni6l7XZ1JKj
	05E9tg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmt6h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 19:03:39 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56d3fbd7595so1744078e0c.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 12:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774897418; x=1775502218; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GDUjl7tFEqxNNCDYOtkshNsr/EvHhDf1KIBdRBBNzDU=;
        b=GbrwsFUiC96UrpQgguNaFumxlFxLfkpM7k/dUDrFO9ZBRcX6WWj6dOvSAxWyQKszPy
         HjyuCetbAz6vE6W85b63/wuhYVZfqWJhBGg5sQtDHLMzroJXbODdVzeveJCunfYZdJK7
         fWdwRp7vj7cCUxo52ykf3IFXwnripgvHiZVl2GqHTsyG5IGTV/YGcd4JmgtdEKEELLKV
         D+Y8bMm9JEiM2s2MdhM9WWTE2T/LZGkaVrOVVm3dHnPNHzApK2KW9oHTgSbzSkekp355
         ziO9jWdsb9z20ZoDNNH2V5L8RCMbYHPaJnivj7uBx8hrKoJO/S+GRLk1QA4ne/ZhfmAm
         Kccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774897418; x=1775502218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GDUjl7tFEqxNNCDYOtkshNsr/EvHhDf1KIBdRBBNzDU=;
        b=k7ljkXj+SOh0uufKF6zibjKw0DAgx8WGJ699J9el7qjNiAW9plTxCCBZ7c3KzE8CKu
         aRzH7zEhTe3zvx4pEIYLPxCH+tEciYjEUN1RZxeoljXv/hgSu6Zvk5D3+WinQYgr+bwk
         8A8kbph68VnmtKaNXOOflVWZY2Yw81Z5j26Bm/qRnt7y5vhr7hZ9tt5HQ1LnrmMTMV3D
         kT0b6lCn9qhlZfE9xz7lvEidb37PGAKv0VYtOdHm7Gk+o7ks4dX86Y4lITpYTK5Dp6Wc
         OPTAfmyklOSZXEUnE+SG7GoPm5d9Y/E5A+rxAs/3ofYIZutp8ddIeXarmVmNU5zBuaiJ
         5HJg==
X-Forwarded-Encrypted: i=1; AJvYcCU9eDwEldSt8oDObOoTGqIF750eW+Iqk8Bf3M/ne0J7x7+xlcpnFuBLPLfgYzdD2PPkRVK+ODsh42pgjGU2tleH5PG2@vger.kernel.org
X-Gm-Message-State: AOJu0YyNf9+AlJTT8Xj5R1do2V9OFMz/TQE/nslbNHD3Z5u2wfqv64TA
	ChBtQLm+XNCP2Zc4qaiVYrODN+n4wN2KV1JYOTdX7ZKnQbpwwQ91O/ibANDsikwKIZrIdMj2veZ
	PuYGg3KmiltmBRTuOqC3J722H2h7uKcVFBuDvQr08a5d6f2X3/2frSY7RKI6BOJj8SiuKsI+ZZt
	Hi
X-Gm-Gg: ATEYQzypG8JWp48NwKrzbJIyZx7+U79Auws8jS78H2gCGarYNXtePyCEiQ0ZowzcdE1
	fEsgYWDeN/t1Vs8GJhIH4wUul+LwQI0dGJ39ZkslrNjC2zy9PZbe0c+IjHnaVFQbe7bp7SpulRf
	T9e+9uS8SgJIZCOB9JKtpVitpLs/hB/celJPxyPc9I0HQMALehSqMAJAiRhSvMDfBDB6ODTSi+N
	LzBFqW1pYkHDbRlxrOaa2hmukBj0qdqgZk44TarIVOcbOGSfOtkCWMnBRS80UvernVcKUg0EzpP
	K9FIeqdeO4w49LZR3ItkjggQ9XDx4PVRZM7CpKGzdHzM9kDxkx2jqikq0z0K2br5/b47lUkUwYi
	mHVS9wbX/K1o2nkrduoZyQY90h0/LgPpFCPvZoFXlvK9rX4Dqv4EQ3Ruo/Ir0febca0ncnzzmNp
	k2oCs4vnVuapeU/JwRwPRG7OgkhF/GvChEyDI=
X-Received: by 2002:a05:6122:f89:b0:56c:c88d:e8c0 with SMTP id 71dfb90a1353d-56d4a4d60demr6242009e0c.6.1774897418262;
        Mon, 30 Mar 2026 12:03:38 -0700 (PDT)
X-Received: by 2002:a05:6122:f89:b0:56c:c88d:e8c0 with SMTP id 71dfb90a1353d-56d4a4d60demr6241941e0c.6.1774897417788;
        Mon, 30 Mar 2026 12:03:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f429fsm1845663e87.2.2026.03.30.12.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:03:36 -0700 (PDT)
Date: Mon, 30 Mar 2026 22:03:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v7 0/5] Add driver for EC found on Qualcomm reference
 devices
Message-ID: <apuctb5nyxpkljwttvb74gcxcv3pe2tvu3yut3xpeze7l5xkzc@ej3msenxdrx2>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
 <45cad9a9-8bb3-4174-aa5b-7a7cb3b7603e@oss.qualcomm.com>
 <dcc83729-295b-4fb2-beab-bbea1daec7a2@oss.qualcomm.com>
 <CACSVV02B9FOqi8w1VfgZXtvUxqDmsSsHMVF21qAAZNxDFTDNfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02B9FOqi8w1VfgZXtvUxqDmsSsHMVF21qAAZNxDFTDNfA@mail.gmail.com>
X-Proofpoint-GUID: vzBojNSrmeWAqoMmRBmkQr_ZNlflopre
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1OCBTYWx0ZWRfX/KdJNTLEUxrf
 zBB76z3vxXLYHTxhLJnaxAl4rtyM+fMojTZsBNFZppuY5ILJEgbCPJO4Vc0ouAgtjFBmq8B7yh2
 p95iuFvEFtOBscs2hjb1GAgIG3MgahHkG1MBqoPMCNfLdH49LHS3G9NH/2eQiI57Ef3qORKzwHr
 dWZk3bHBBpreReyjFN/r2t+h3XPQCii4L3cfarugXX0Q9qAww9aHS8G6OTQ8xjheOdjjuQ+MbXM
 l+eHKLvw7oiUfupSp6tIq4YHLSr04Ruf4g3zstVSeqs9lV+baHgCE3besgEf+/TJjYalqwGLrq/
 bMW+bonbYvODon6T57ktMwOdMl6I5C9YpSJ4CDfWCH89hMfnNri+p4OxcLAoytAThA/x0dlPHfg
 PGJqGYNmUMqBdsYM/KMMb1zfsY8vp0lYdTRw3AnFHds9sDHX5+e2666Qmb9ayp3+Et02BLz8GTc
 CKPBO47bomQQben5Pbw==
X-Proofpoint-ORIG-GUID: vzBojNSrmeWAqoMmRBmkQr_ZNlflopre
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69cac90b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8RI0V0Q6YUoWoVOrNxAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300158

On Mon, Mar 30, 2026 at 07:08:45AM -0700, Rob Clark wrote:
> On Sun, Mar 29, 2026 at 11:57 PM Anvesh Jain P
> <anvesh.p@oss.qualcomm.com> wrote:
> >
> >
> >
> > On 3/29/2026 7:52 PM, Akhil P Oommen wrote:
> > > On 3/27/2026 3:38 PM, Anvesh Jain P wrote:
> > >> From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> > >>
> > >> Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
> > >> reference boards. It handles fan control, temperature sensors, access
> > >> to EC state changes and supports reporting suspend entry/exit to the EC.
> > >
> > > Just a question, is it possible to force fan to run at full speed
> > > constantly? That would be helpful to keep the passive cooling minimal
> > > and get a more consistent results while doing performance profiling.
> > >
> > > I see that you are registering a cooling device in this series. So I
> > > suppose we just need to update the cooling sysfs nodes.
> > >
> > > -Akhil
> > >
> >
> > Hi Akhil,
> >
> > Yes, that is possible. The cooling device registered by this driver
> > exposes the standard thermal sysfs interface. You can force the fan
> > to full speed by writing the maximum cooling state directly:
> >
> >   # Find the max state
> >   cat /sys/class/thermal/cooling_deviceX/max_state
> >
> >   # Set to max state (force full speed)
> >   echo <max_state> > /sys/class/thermal/cooling_deviceX/cur_state
> >
> > Where X is the index of the cooling device corresponding to the EC fan.
> 
> Getting a bit off topic, but is there a good way to associated cooling
> devices and thermal sensors to the GPU device?  I could see that being
> useful for nvtop (which currently supports shows GPU load and memory
> metrics, but thermal metrics are missing for us)

I had a dirty patch, providing temp readings in NVMem. Probably I need
to clean it up and submit upstream.

> 
> BR,
> -R
> 
> > --
> > Best Regards,
> > Anvesh
> >
> >

-- 
With best wishes
Dmitry
