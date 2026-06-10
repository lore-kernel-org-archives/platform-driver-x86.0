Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A760C39B49C
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 08:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078446; cv=none; b=YgjAIW6vGSasUor3uED0W08E4euU6q6mjL171QGHjrcRGfWsfrFeahFDqrBPL0t7JYNY2aZFY4e4feveIQW7dkRqHfbRDQiAwNeLUpwl9mkvfZYkXV3lImKJ/jeo39lIbPj9nHVYfAb+fCwILB06CkaVg98MX6lh0fpwLqP5tXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078446; c=relaxed/simple;
	bh=sDTlRaHIQmiGRIRKko52QvjgdIEtCb1f1T3mtvTcr0A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Bem2CfRrKGHEHLZcIo5V+bgQ50zQcZEVozbYeQVsPCvbjYVB5gA6RXOZXqD0F1e6ugnA+KqrvuER8qIPk9QUMD3RdZjePaVjONlYzhnrAfqBMtF9ONxSjoMDZq8GnjKcgcZKaf0SjYbPB92DevxEPDcEdi5zeMRbiN43HOLMlVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckxpr5nB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jEj7QZyh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckxpr5nB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jEj7QZyh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iLGv992632
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 08:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQ1qMFZnEcfEmHrQcLlNp7BTXYqqiZIUVAVuFfn+664=; b=ckxpr5nBhlDNqrw6
	Ix3YXXxDQm2HrFA0R/TOzjy2eR6EiT/XjnN2B1kJpMbAiMC2/alPoWD90tzwgWgG
	TTPz2bBq6+GOA4ge5kLclwZqnPaSAL/eqpU6v4oy4jXqUysyW5itT0hFC3jMON9p
	OgHTjvCKyhG79uFcMurkPvJoq/+LKT9taFpP+wJ4BuWSaLHoEDQ7HLmFOX1M03In
	kH5dURJw3vD5au66Z25n6ZsYyUBQ/qyxRYthDmf5IC5gClgsbMGLJzidVVRsyaEn
	QeSWBq8EqbqINK3wemarMgVz8tcrbm3TEZlJUQQ7bDQfjP58BbBIOWJ17471gy8e
	Wtj4Tw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg0hm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 08:00:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177f07eb05so128659011cf.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 01:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781078444; x=1781683244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GQ1qMFZnEcfEmHrQcLlNp7BTXYqqiZIUVAVuFfn+664=;
        b=jEj7QZyh/Ez5qNDvIaOqHUjtZXyeCSCPbFsFwZKn+A2kbJb2b4jEjpERlYyPWDOPBM
         YlQhDTsQDZvMyaNB9WkZsdPzQ7RVGpvqq/UD3h+w1/+vbPCvpM8j/kMFQgIICYV8DcGr
         uOhEPteKvtR2lxPpd2FSuePMIe65FjxMi6+ZEOpvAtS+JA9Ig7ppU8KMYVrirAsJc6EE
         ioTpIFDBs+ALDZ+KMO5CpPJuaiifcvWhyqMqTvc0lfoQIcDktQ3o62kDeiqc5rIMIqV6
         SonF1AgQJVCGMbhdliCp1JSsnXS5lybXjbDc29p/Jncoims2AGZnsCinYUFKOCJ6bMW9
         OG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781078444; x=1781683244;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQ1qMFZnEcfEmHrQcLlNp7BTXYqqiZIUVAVuFfn+664=;
        b=imVnzJ2A3LLsg9vIxfOPeVVkzloMTIuyOavKkF593EGBh4CG3ibS12L4r0+FrSMjoa
         s62FvFOntsAKJ+9k/sece6B36Kofjyz+qOmwgooaG68XplzLCHIdF0s0TCXl6ai8rnlf
         UNWB1gDSVbzf98xgXXuAp7n2O8f+tUxFs1TPZdPXgK0IX/2dll90wuuFXLGnWpaVPN+x
         P8ingyeXgXGTMCKfIWUMX4e29rIvJZg+ibufy7a0zSFrfNMsO7nos9I1QSmj3+oVJmOR
         mjaQ3NAKquc0VtOtxBjiURInNlOay95gVPbs+X0ZSz7dObzzEnH4MMEiPvkBTSsm7nB+
         GsRg==
X-Forwarded-Encrypted: i=1; AFNElJ8vr6izVRL/qVzNwSwYChpkMe89YWkJo+bOv552aYSgfknoNkWq9BwghP74sbYcH+OBxfQ+mld0bMJXyG+PDZqa2RnK@vger.kernel.org
X-Gm-Message-State: AOJu0YxMr+s74+D6tWh5iJBeGDLbKgWPRceJjhBsNQfnPLt0zj1eSZ6x
	XWIvx/b6RTkANPKYqgUekUODrxuthxQsjK4EfHZeG5qZ5YQ5sJ90to1cWh1iPBAegvDhTsGeiui
	o/d2i1tI6gXMPe4nOv98oYrhhC46fEZgb9l+1vF/YkfrLd5oBWxd2/GS5h+3HmnLM/2QrLQohe9
	8c
X-Gm-Gg: Acq92OGC6Mt5BSdANjcwZagomBCgB44pXXFt5qOme3fFNWJoaCSvBJJ4L3nYbhVakv+
	wpv4RVV0ZeE5mMdnGFsS2BB3QY7jsuJBfjToUo3wVekHQdxD5tsHZCGWDwprZMC++LJcYJ+bAgZ
	VIqcU+/UAXOWE0YDYrkZD8RIPD9sjqOGHlMV6K40LwkLO43T/uBi22ApZ/ld7e+0TbqDMcnwXgd
	YTwFJdWTNIbpsv/SB0BdggaJ8aCU79YHfU2N7H7EYbw527OkHMxUkw9G07xI60DjqE1t0xAXNAT
	6DqFKd43VMstvFzOOTIFBk8W7Lqb+YkI7jcQ7Zlbz95qTZ1VZxIZDPhkvEnX/yXBg9Xu8C9aB3o
	eVprV7c3QbfX/rhn8pw9aCOpzMN9hzpR7GiLu+m5+OIaV6f9Iy+896l3sKymAVu/ll90ULkgWJ1
	wcoo2/ttV8v92uNaGKvgRvqV0AM2fBd+PnwjQSI/UkREXU7O8iM+iWSEi9aKnni5CnxjYTHya+O
	d5gSACUgHy83pJZQRPnV22H+h8=
X-Received: by 2002:a05:622a:345:b0:517:b750:642 with SMTP id d75a77b69052e-517b7500b3dmr184048131cf.47.1781078443731;
        Wed, 10 Jun 2026 01:00:43 -0700 (PDT)
X-Received: by 2002:a05:622a:345:b0:517:b750:642 with SMTP id d75a77b69052e-517b7500b3dmr184047521cf.47.1781078443322;
        Wed, 10 Jun 2026 01:00:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e650287d9sm9700069a12.12.2026.06.10.01.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:00:42 -0700 (PDT)
Message-ID: <a4fd35dd-2fd5-465a-9351-49eb72268362@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:00:41 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v7 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on
 Yoga Book 9 14IAH10
To: Dave Carey <carvsdriver@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca, ilpo.jarvinen@linux.intel.com,
        armin.wolf@outlook.de, linux-kernel@vger.kernel.org
References: <20260608215205.678182-1-carvsdriver@gmail.com>
 <20260609212631.925943-1-carvsdriver@gmail.com>
 <20260609212631.925943-2-carvsdriver@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260609212631.925943-2-carvsdriver@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gEa5lYhN9H6TfQl0GnbCfAKa2z4g7XXe
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a2919ac cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=BqHIVXqeafSIuN2z4QsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NCBTYWx0ZWRfX4AgmTIvxQj5e
 bIcQZ/tG3CumAARNQxECqo9S/iHkWi6VK6KNgWYLBMzc00Xa5ocntAvVe36op4qRCx/c3bSmyWF
 GEqRpj1YvpWM9ohh7hYAdj01MYzW+sYTn8OnaNjoI916YTDipiMt3HZUJ2M+19LkjJiYzuoxvBv
 I1J1DabvxBTl8AY0r7qxr3IupOt2F3+TlvhluU6w1vHsOfGRG0UOMkFcHldyfetqITQ18EFaAKC
 K0ikhO4Zz6KF8QfpLUSWQHkcx+x5wg6dNQR3Gj07oZeIwfeRGNL/Qo2sM2jhf9DpO41GPh5XRXm
 mfZxwC7Rs1ar6qtyCHhzISXRHB+80jbi8njXf+u/LHbEMss3jgB01dJ/KcRFdL83LPgSV/9Juba
 6gipZMT+dlJO7MoAICsCLDRjea3SbLYhM9ODa50T7hFT3hnh2Vv9/5bLOvOFFdkkEc5HPG3zJUZ
 Zsm17yOKjE4IRZME9lw==
X-Proofpoint-ORIG-GUID: gEa5lYhN9H6TfQl0GnbCfAKa2z4g7XXe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100074

Hi,

On 9-Jun-26 23:26, Dave Carey wrote:
> The Yoga Book 9 14IAH10 (DMI product name "83KJ") has a dedicated
> yb9-kbdock WMI driver that registers an input device reporting
> SW_TABLET_MODE to track the detachable Bluetooth keyboard.
> 
> lenovo-ymc also loads on this machine and creates an input node with the
> SW_TABLET_MODE capability bit set.  For input switches, the presence of
> the capability bit has semantic meaning: userspace (e.g. GNOME) reads
> the switch state at startup from every node advertising the capability
> and does not expect more than one such node.
> 
> Add a DMI match for the Yoga Book 9 14IAH10 to probe() so that
> lenovo-ymc returns -ENODEV on this hardware, leaving yb9-kbdock as the
> sole SW_TABLET_MODE source.  The ymc_ec_trigger EC write, the only
> other action taken in response to a YMC event, is guarded by a separate
> DMI table that excludes this machine; no other functionality is affected.
> 
> Signed-off-by: Dave Carey <carvsdriver@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Dave, note it is normal to add received tags like my Reviewed-by
above to new version of the series, just above your Signed-off-by.

With the exception being to drop Reviewed / Acked tags when there
are a lot of changes to patch.

Regards,

Hans




> ---
>  drivers/platform/x86/lenovo/ymc.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/platform/x86/lenovo/ymc.c b/drivers/platform/x86/lenovo/ymc.c
> --- a/drivers/platform/x86/lenovo/ymc.c
> +++ b/drivers/platform/x86/lenovo/ymc.c
> @@ -23,7 +23,23 @@ module_param(force, bool, 0444);
>  static bool force;
>  module_param(force, bool, 0444);
>  MODULE_PARM_DESC(force, "Force loading on boards without a convertible DMI chassis-type");
> 
> +static const struct dmi_system_id lenovo_ymc_nosupport_dmi_table[] = {
> +	{
> +		/*
> +		 * Yoga Book 9 14IAH10: SW_TABLET_MODE is reported by the
> +		 * yb9-kbdock driver.  Suppress lenovo-ymc on this machine to
> +		 * avoid userspace seeing two input nodes that both advertise
> +		 * the SW_TABLET_MODE capability.
> +		 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
> +		},
> +	},
> +	{ }
> +};
> +
>  static const struct dmi_system_id allowed_chasis_types_dmi_table[] = {
>  	{
>  		.matches = {
> @@ -100,7 +116,10 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
>  	struct lenovo_ymc_private *priv;
>  	struct input_dev *input_dev;
>  	int err;
> 
> +	if (dmi_check_system(lenovo_ymc_nosupport_dmi_table))
> +		return -ENODEV;
> +
>  	if (!dmi_check_system(allowed_chasis_types_dmi_table)) {
>  		if (force)
>  			dev_info(&wdev->dev, "Force loading Lenovo YMC support\n");
> --
> 2.54.0

