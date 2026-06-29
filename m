Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520D53FF1D0
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 11:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732085; cv=none; b=j67RtC3nsxliq4jNFuO0La315VMGif/uhshWyXx4VITc1uMiAh1gd5gLZH/5gv/zvpzOeljkrDMUOlW+emVpcaVBbTnqy3dwZdVkwShiOJzDA/8eMNtCoGivi32Px7Kcs0Jo7Ama0EkI+jRlw+nWKea8HYu3Mg3zQzZCvGiEKrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732085; c=relaxed/simple;
	bh=DwKXwX6baoOIzTXJrJpGh5Ew485gFGr7gK/rfEbqA+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZlxkRx4vn+rkp7Zej/SY0Gqk9S4J9jz/sZJmX8yi8tv2+r/oKfR0sY3KiWk+IQIbEaQR9z9NdgOvBilVXxOeh2VNafWK5ga4utx48TQ62IQI3G3pTPJI1DFTFuost13Z8fX4CLvplWNbDJAeGNK87T1YcWSP7BWvYKBqJBg87w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cu3waHvS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTYlkVOo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cu3waHvS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTYlkVOo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAStN32640759
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 11:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LXOilQQrt51TOYTeVjRcNsmOe1jgvaX2sVFJQ9kcEWA=; b=Cu3waHvSC9aa5XHC
	Lf0BecL03csE7Lr2SUHnjqCsvBYGdtRBM9GIdAujBV5WHi/tjoivVFX2L1l05dEK
	4xZRnizC1CwRau9dMrcgGX7TrC2G4L+sIrDydw50xxz1xA7Gpcat8vxehVYbb1sj
	rk44nE5ogiqnuzr8Z8yUGGa2o/aalpiyWf2xNb2jLF3VfCQvJnovgmX0Xb6kTZVx
	fZohAecFw0wd/aj5NtB2rgl+4SoIrpdAIs3ZCHxUN8BLqHR4GUyoD4MrJxuN6ha9
	p7A7Tqohyo6cKLHkoMJHeovVsS2YgotIAO6tndQl2hB3kkib2bfGudFpq7p+4l8n
	zYbp0w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s0pss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 11:21:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738f59cca12so15464137.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 04:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732082; x=1783336882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LXOilQQrt51TOYTeVjRcNsmOe1jgvaX2sVFJQ9kcEWA=;
        b=OTYlkVOoZcfrSdGsyjOhENpUkKalrq4SLz9Q1XdnZdYnG3Yhvf8LtJHwwOVSB8nOq8
         pkbcgQJZycSfEQPaK2BFO0s5tRlO2lw4Mw5bRcehLVSYcKkznw/KR5qByMRDWgjPkm0w
         fLRW1XwBKsE87mTlyPv2/LYQa5NGxm2yA4UXsNA8gWRRt8EjBx3R31lScMCV3eXUz1mM
         z0yHe2Rw29ONId7F3FrlgH9AOrOpZ1KUjusqhNII4p805ErkT8LOY9Qi6FrLdKUgza1o
         KncVTZIU3EY8TxUjD+QwWle0lQ5kvnT5nFtsdOIWE1cPAkWSPR8pIu0zHkLnyzAbP9UC
         N/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732082; x=1783336882;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXOilQQrt51TOYTeVjRcNsmOe1jgvaX2sVFJQ9kcEWA=;
        b=WpbQS0tzBAFbvI4AXaCteHzjI2t7mIdvo8O+lgq8glg5HkEc+RF1Oa6IrTnI8GVVjn
         tUJX36mrLj58pJvNoumn/6lk7ip/XmuEOnSd0iV4vUjmp13LjIAMp9a+/xL8lrUH0ACW
         Huh3vqDYbMHcJCvbLhvommR6gK2UIo/Ohn8BtAs/a5tJYfuJNCmXYeMAEiD3HkIJ3NaM
         aW0X4LeJOw2+FlDfdfFva27bWtmkC4udjan2J83rTxk8IHcyufbWOby1yQ0mv8zu6+GZ
         Hi9RUNFD9yLQYSjzq5NJTSbEd715dKPd/iJnM56msDGQNdk5NPRIZf0ghw4RS2g9gTai
         BjwA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2cUcLVKr00CYDTCAi3jeH313aBIEfq/MMFo9A/ufyzh0jW/0WLeO55pqB4fua+y9bpQnYjRVF/Fmr9ZiWHreWbp8Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg8RuYiqXe5m2wonUcxFQ0/YN2c0nS9GVXZD77f/D//t4SqlUK
	ZCUfThJDbckX6BqWxgY6llkEA7q9bG2q50vFDDkjKqOr4rymVrWE288yLKsjUEHepzJ3juqJMiT
	H0x7IHMtC2DHuahMN3bCEyrtdgbhDeb+5MAo6M9WWRZslpP83T5Gs38OwSWnpQqEczYK40LF/rQ
	Qg
X-Gm-Gg: AfdE7cmSi7p8oPYzZQYqF/8Wg11gyIoCGz1BAMP9ywdpFmTzePeIygj5piFDK9cglTW
	XDi6yhXQL0NuD01ySTzZIQqfiWFjXiYSCiVy58U+YKlvJ2OMD7h/N+8xJR8C5TkSMWIvc9njfst
	tiQhhwS4DIpMh616PlV29fwRhV0UGWoDQZwMbgpuHFam0wzsYhQfxrzc0GK7FENdkJALQkTJxTR
	xAIC+LqH+Ghp4NfkT4wcplFVxOgXNKdep1fVxfn9M/pO2jvLg54vJbStp+Ju2tmW94/d7upBG6w
	iAoiONm2X7yUt1fslNXy91IDVAMR+iDEkJ08ENKwmup4hMNK1wmNcSKUybvhGtrLIXQJiy1DSD8
	cjMDOTZW9KU2r/OsQlIcri0NQrUxm5+5n37k=
X-Received: by 2002:a05:6102:5121:b0:739:5c3d:605b with SMTP id ada2fe7eead31-7395c3d68d4mr228121137.1.1782732081655;
        Mon, 29 Jun 2026 04:21:21 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:739:5c3d:605b with SMTP id ada2fe7eead31-7395c3d68d4mr228109137.1.1782732081236;
        Mon, 29 Jun 2026 04:21:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698481d0359sm3239926a12.30.2026.06.29.04.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:21:20 -0700 (PDT)
Message-ID: <b0d0c7ff-fe41-47d9-bd53-89b111823c2c@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:21:17 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: Register cooling devices
 with their name
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede
 <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629-fix_cooling_device_register-v1-1-c6e518b0bbd4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-fix_cooling_device_register-v1-1-c6e518b0bbd4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5MiBTYWx0ZWRfX2tyCJLBtEVjL
 FL1R5Lq+PDLrUBeXJO63jB2wtp3Rvz/K82TMtfTu4APTDhZPczpjVaUXRFFqPobOpndz7VrG1oh
 s8oQ1/6Ah25JRRjYwYYpXOG2XmTEzU0=
X-Proofpoint-ORIG-GUID: h5UaDC4mbMk3VnM6gbaYujvOR4aODyod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5MiBTYWx0ZWRfXytyvR3as7epm
 y+kcvnzkLiX8F1JqecNjlx096wAnxsCJ47MkRKmR4WRfIKJiPk40FHYuNREicbl0nLtUyHZa51R
 CM70re4EaUVr/tXhbJOl45TaWDD1kEUo/U5pq4hjRLubMXxmI4+itEqj5G1HqQ7gupO1muqTQMa
 DDYL827PHWcH27kIrW4way7k5Ts4HSmZJuMLwCaoYTP3LDvExKDXdJRmls7Zu3EfwpVgBiSDJh9
 xcLSJw7OXdTrs+IWoBZ2qGCHb7PkJvm0SYTyDvykkUreZTVVd9izIj8q/2pnp8L0hYLVdFXvS78
 8EGM7K5dNWwUP/HpUWtiKsVOIh5ujgz9/b4hlSa7gM9aN3GYTl2lw6DGZ0hNBggvNG9qhLuEFgF
 jHF+eFKUw6lhSOPeiZHJOCHfrG6+DYnD5YKMahs2Q1GoBm3Jc968sDjAhO56Dk7qOrKFVLXPvVp
 f/WzPeVzTKK9IFcNhog==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a425532 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zNzZX6S8Ja6Y3dQqPR0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: h5UaDC4mbMk3VnM6gbaYujvOR4aODyod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290092

On 6/29/26 11:16 AM, Anvesh Jain P wrote:
> Each fan is registered as a thermal cooling device using
> devm_thermal_of_cooling_device_register(). When the thermal core gained
> cooling device ID support, the helper's prototype changed: its second
> argument became a 'u32 cdev_id' and its third a 'const char *type',
> replacing the previous 'struct device_node *np'.
> 
> The resulting semantic conflict between the EC driver and the reworked
> thermal helper was resolved while merging the drivers-x86 tree into
> linux-next by passing NULL as the 'type' argument, dropping the per-fan
> 'name' string. As a result every fan is registered as a cooling device
> with an empty name.
> 
> Pass 'name' as the 'type' argument so the cooling devices are registered
> with their intended "qcom_ec_fan_<n>" names.
> 
> Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/platform/arm64/qcom-hamoa-ec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> index 45829f2786b7..12196d56b60e 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -391,7 +391,7 @@ static int qcom_ec_probe(struct i2c_client *client)
>  		ec_cdev->fan_id = i + 1;
>  		ec_cdev->parent_dev = dev;
>  
> -		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, NULL, ec_cdev,

This seems to have been altered to use:

devm_thermal_of_child_cooling_device_register()

apparently as part of:

f31c00c377cc ("Merge tag 'platform-drivers-x86-v7.2-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86")

Konrad
