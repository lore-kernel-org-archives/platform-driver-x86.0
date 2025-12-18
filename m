Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE048F4A
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 00:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766016436; cv=none; b=jkd6IncYIVCP03XAUp5jFFVwt/fE5rJVTqOtnvGjYhpz3vFZHEbVqvwjRaLTTmBRvnC8GJNzt+/4lOz1f4gCNXKq7i72ryCx2B1tYd00tjKmkXCelFxP+wQu9dI8iLufUmweKKcZjATXgMOyCXwNNxPYZaHJVzmQ4rNRIZMzqiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766016436; c=relaxed/simple;
	bh=MkZFiW8PVfEXC9iEw+RiF1rkp6MiXEJyjsZ/QWm8WpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ds0aC4uOJmy6OPRY+jXnsbAFWQIfdJhTKDc5f14YCKhZ+Fr1y6HN7dEtq2sKyzRTxnjb/FF5HT9xzBO/yzFMUg87KLGbjF+OYVNpK/HBX3OVeXp8Nom+pUwgWpJp+XPp/Y6IfqIGM1wLDabD0S+lk+dM4KLymlJmPi2FpWRzbz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnhpDrrh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrMzGrst; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnhpDrrh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrMzGrst"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHJBUoX3268527
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 00:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+6X2ksbSDC2ya8H3LtEZEvp5I4IfOZ3iAR1V5pLfhRE=; b=XnhpDrrhKEMqop6K
	ZJxFdaUizCFjoYmS6Rm2/mPPWnuGlZYv2J9PnMpWNmwAf2HgWh8m642pU56Mfacd
	AHH0PdEGeZLU+7lun5fMhLro4ANvHO4McJst2HoGPpiAwos0qsEqqXv76EZiUDuu
	Zj0eFh4AQjjqYWOP8X6ISk+7UUNajlZZGZ3GWK7238Pi5ultBuKCgsy9ea8UpmX+
	oHlAwwB4ZQQNIGLKR61LztS2qWcWi2TBcQWxwXPokWxSL8Yi4UrULot63nwox0zY
	vBR/05yeaJnLdq2hXVu6qTL16Na3RUy8BCnU7LfreSbZsn0HFPpPGZUtIWUPfbcX
	aneM+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr59fsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 00:07:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6855557aso23898591cf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Dec 2025 16:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766016433; x=1766621233; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+6X2ksbSDC2ya8H3LtEZEvp5I4IfOZ3iAR1V5pLfhRE=;
        b=VrMzGrstwYuwqKB4LgYwOaVP5BbGAct7hlDGhtWzqLJ801lRTL0rr28/EDgQtuXGHY
         HTTfErxvL9WpUQgHT7SJqhOm8weNq2Wttwx9M7FFqUV04sHQhxHh4vmRJO7w76D1CCwR
         Hw5rOFCvg619BlYoLpIDtPG1e37qvKoi2FoPcg1hyT7MAD6d+eSkKfr4GkXc6pxiSyNF
         2Zh2lIaQXhNmo55ZPukLlmaZcXuvgc7Y37UDOCmwqpDVelUpLQW2nTGUkWPL16UZ9Lh9
         haMhCg+B04P2bSbof8OtDL3oTno+bYlHOU+ODvMEis9q7AvU8E4P3BFlptUu4zV323jN
         psTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766016433; x=1766621233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6X2ksbSDC2ya8H3LtEZEvp5I4IfOZ3iAR1V5pLfhRE=;
        b=S1tIazgwyg+46ROhS8xbSLjPbED6byIj7ASAc2LUcf9jYQ5JkVzJmoBtAO+q7V697+
         Jy43HqiZkryL+XoCVtMZx28YCeQwZkLhUTyWJFIQ0x+EIl5upoXI+dQPoDLCaZoDOHxH
         fA1UNJ9bKPOsINYhpKfXc2y/hK66snXW0bLgHu8pLonRrI373WdtD9V7Q2okwvXlHeO3
         HmZzXgohwIHP2u8BoGooXJkAzk0XC+ivJHKpNkHnkoqrK32PExVteElNsz04POxYQ6OA
         4HEAZ6oa7F6e049Fcb1wl7L/aBHgrW0/1nW0Zst1KQJ1S5MLNbR7sR77oLqI2MnUqufv
         jjqw==
X-Forwarded-Encrypted: i=1; AJvYcCWNa8+8owbBAeikSPVnCiQ+oXCBAT6LPHSeB/NmLug1o03axmgcmv/K1dpi7NpjuKfrzTiuz0hTpcblS2ZRfkerVKc7@vger.kernel.org
X-Gm-Message-State: AOJu0YwZYyHstzZ4CT5+IfEWQspNH/ebBMlJySw97qHN0Sm0AGt42gHC
	fBJnlNMEUIULTBD7NgRYcJFuKgUIRFzKCBETq7D6O2ixcnu7IN+j3SVqGP2YtBLJDqERXD1eCBW
	S9MQfbaM+JVx6MqwjvrX9QYp243WcNsDw/PiTHGRGwtav08Tn3ENLcxhYORlDFC/rPOEuiZHD3Z
	1r
X-Gm-Gg: AY/fxX7v8P4GbRZDRzopnVEzlNSeiECkZQ9J8QukjQcaUHnrK6ovPf4ZGIMO/OkcpZi
	xJ1R27/DzIKSZ1lBX6w+7O626FVSHgKbPlVzY4nn1/a5W2sGAL6f87o5IVZ4DPyBQt4qeCveabC
	szysDy7pZF+TxZDJdWdywn0BuHWSEyjfawuEw3GV77E6E035lfFYQNfAhd6lYnoVJCMtlK7Dui5
	dsKjxldgxVC6OM6MkjwM5Lzzg9mkGZd0s0I7PDqCvv7RMQX0vETX5Rnv2Lhr3T/+1A5b2/V9JKT
	nQRsy5LQvFvspt8+KhinrxzuDFNwYy+QG2tdEhwtx6r1Zym6ttkGaCCZf8dmlIkij3G6qs8wUNv
	nIvCdeiwDdRlOaAC5P3Ydm7XpyxQzCSzCHFPRxQuXdl5gp/NDR1ZN4u741w+6Y4cfHt6X4orxPd
	y+cXj6TPoVWtKCrPagWaXhg18=
X-Received: by 2002:a05:622a:2d2:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4f35f43ab71mr22024541cf.21.1766016432110;
        Wed, 17 Dec 2025 16:07:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7r9ikBXTn9EQK+HDVKOPnuyMaSvuztty6xD+BwyGt1UHdgEs/NzHIQGQgsKy4i7SuFf+65A==
X-Received: by 2002:a05:622a:2d2:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4f35f43ab71mr22023971cf.21.1766016431146;
        Wed, 17 Dec 2025 16:07:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a132cb5f7sm321357e87.4.2025.12.17.16.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 16:07:09 -0800 (PST)
Date: Thu, 18 Dec 2025 02:07:06 +0200
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
Subject: Re: [PATCH v3 4/6] platform/surface: aggregator_registry: Add
 Surface Pro 11
Message-ID: <s45ki2ckgw7fu25h5wd6mb3mc4kzs6qq5eitv56asqf2suxh6l@s5tbqce7gz3f>
References: <20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com>
 <20251218-surface-sp11-for-next-v3-4-875afc7bd3b7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218-surface-sp11-for-next-v3-4-875afc7bd3b7@gmail.com>
X-Proofpoint-GUID: 6Z1cnFBkec5KDCK_Sz58y-osTEPJw293
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=694345b1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=27tkrN_41n3i1SKUIiEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDE5NCBTYWx0ZWRfX5//k9W0vf40u
 eQhZFg1shI8Egx/6hUmDUSXK7iyryrzXCkq/WZ+gbe61OGwj+EncbyqrHM3huErycWcHhMnymD7
 wfJlAxPaobE/MruNWQnXhQ0U47/+aK96W4T3oGKmK8NN0jGAawiav8T1plUTw3fpVnEPuov2t0+
 iRPHgnvHJrARsC5hSCYNXendcnlgicVdS/RzYQZ0AvFwY0+Uq1QvrMrKwW5V6KTPP+2pFSdTM+x
 jVqPf3WX+P70rRDTajtHMWJud+8M0vyQ4X4YGWZazszSZZDfHKfya7kMCEQGeloyGKADH03J4oT
 MRlIklOQVjaFEcEaf0hPqBCuCw0a9S9Ihab9d516eFVu3y5vpk2OH7HyvvDDdf+ZC0IdcX0j+VG
 Lq1qGkRlcC45W1aN5cmuDI0xmc6ysQ==
X-Proofpoint-ORIG-GUID: 6Z1cnFBkec5KDCK_Sz58y-osTEPJw293
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170194

On Thu, Dec 18, 2025 at 12:56:40AM +0100, Jérôme de Bretagne via B4 Relay wrote:
> From: Dale Whinham <daleyo@gmail.com>
> 
> This enables support for the X1-based Surface Pro 11.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
> ---
>  drivers/platform/surface/surface_aggregator_registry.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index 78ac3a8fbb736384f7e50f1888a71297a892a7c3..c18d991afc8b0a0bbb26966351b75b8ea01097a4 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -406,6 +406,22 @@ static const struct software_node *ssam_node_group_sp9_5g[] = {
>  	NULL,
>  };
>  
> +/* Devices for Surface Pro 11 (ARM/QCOM) */
> +static const struct software_node *ssam_node_group_sp11[] = {
> +	&ssam_node_root,
> +	&ssam_node_hub_kip,
> +	&ssam_node_bat_ac,
> +	&ssam_node_bat_main,
> +	&ssam_node_tmp_sensors,
> +	&ssam_node_hid_kip_keyboard,
> +	&ssam_node_hid_kip_penstash,
> +	&ssam_node_hid_kip_touchpad,
> +	&ssam_node_hid_kip_fwupd,
> +	&ssam_node_hid_sam_sensors,
> +	&ssam_node_kip_tablet_switch,
> +	NULL,
> +};
> +
>  /* -- SSAM platform/meta-hub driver. ---------------------------------------- */
>  
>  static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
> @@ -485,6 +501,8 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
>  	/* Surface Laptop 7 */
>  	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
>  	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },
> +	/* Surface Pro 11 */
> +	{ .compatible = "microsoft,denali", (void *)ssam_node_group_sp11 },

Please keep it sorted. arcata < denali < romulus

>  	{ },
>  };
>  
> 
> -- 
> 2.47.3
> 
> 

-- 
With best wishes
Dmitry
