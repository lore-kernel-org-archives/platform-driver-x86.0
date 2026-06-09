Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E7B3EBF04
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 08:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995017; cv=none; b=g3b6jmSbH+gn7pjEU+0BmI9fjvZc/aUsofmodXqXknd1QVvpOy8xpGQOhYmJ7KgnvQjdmEZO/zTyA++8cXCDA+y28Y47R7KaJiEBBKgE4YLn6sSmlcvpj1deH8/spNPYPqumITSKr4eSlUlWrV/bum3WbQjuPJU7GdyFHefhXcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995017; c=relaxed/simple;
	bh=aT+06l9JPS/W+pqx/huAMo+hW8G+qSykMxbB+7ekHio=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=P5T6so1AIz87JS43MxlLS13Gxe7pJhvAltzjLpk175MAhOpV8EP/JpdKuZnonGrWKQ9h12Y7zADmMuXcfZQl6sCJZbd4tS8PBD+a6A9Wl7xElCFe4ozgTsGL9C7FVSS7+dw7lRw68niqCyWZf6+4WJGZ8heUfdRBH5UyO1j1xcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a8uS1YDT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZB0K+MkD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a8uS1YDT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZB0K+MkD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rMKn1584114
	for <platform-driver-x86@vger.kernel.org>; Tue, 9 Jun 2026 08:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQ8sqSDtMKXLNJDD7UQJ1CI9HnoEnTFDVTKs30mRhZ8=; b=a8uS1YDTcw3zbn/F
	c/HWDHM7crqvSMm0jvRhfyD7y4g3j3AMCcPOoUivysrc+R3COCFZdyJEvTYDlJdf
	NeyFGO5vXHu9sUs6/I6My5/A7BTjNyuQugqbzqkWPHyjcVYD3jDBqqOfdKxbxdUS
	D/gw8KcRtvf8mX7S6bQOlNylrxHiay9pqZqpqMcMvTAZ4U1alPKjDZSsF8trcadv
	cLJCPU/2B6SoUU5AqeoMxILotqgKQRzz66AtZBJn20PAc5SXplZeM2+BYWLenVZM
	pyQg4nzsf/z/YwoMwsTa94bSdPkBQyStr03FMbeGCLWnnkf1nKnhO+assLR6BZ7V
	9dr24Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeermmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 09 Jun 2026 08:50:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51772325a64so71747241cf.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Jun 2026 01:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780995015; x=1781599815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aQ8sqSDtMKXLNJDD7UQJ1CI9HnoEnTFDVTKs30mRhZ8=;
        b=ZB0K+MkDpRYpOMqAZaGV49kVVJ5HOO0HTOOVC7hjYcYb7Uwvqic321d6TuBRYYW4FX
         TuA6bCd0yZrc3EBKMpcjFLcxcigY+D0IA9NN6EphAFz9HPiMKm+mBZsFCNwhekTgxYDT
         pGxX+OmJLLorjHvlSeObISbOoDlmUYiiFmYsel1Em1yEMKzRxcGkQlFu3xmXKxGELKf5
         7ANmMTAOupI6DdPBd4ex/UCcfWqw+qWyE7iAR5Xg+CpyROVWMRNTgD0WabkGFiWnsi6z
         gBpiLATxGOQwzMlxsakB878ibKFOBGe74Fe7IXQ0hxPgzGPvfVMGE2KYGnftV9MAHJQH
         agNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995015; x=1781599815;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aQ8sqSDtMKXLNJDD7UQJ1CI9HnoEnTFDVTKs30mRhZ8=;
        b=I+pUTSPupZI1pGwVvPj569FdTqOExFK++zS1n+iu3c1m7uwXT8h78m9x+T/EIqrkcC
         90LddlyAKQMQol30KoorQTJFtQN4C62PFYOa54o9IX+EqyLI2O9yNy5ocGhJuSHm8ALH
         qJHx36SMAq+jCerb1GQaCtf8VgHmKlc9P9OqWS5YLZjFzJBAdVWIMXFfaDMP2GKAPCqZ
         Sfin/qBJMj5AnPkc2rviqEb+fMCoRABNExSNKd5AsfepfpYRt3vgif9xARLRJkc3M938
         rKPH9cxpxBn0Zeuky2J/NrKGhye6obNRe32fkXOG5nxOXkQnaU0BehtWqd8O/Zm8Lfd3
         7jTg==
X-Forwarded-Encrypted: i=1; AFNElJ+kAwKEv7YK+BNqeyPNmbdwcoIrAQIH/XqwGqD4uu5IgWQf23gB4HpwzLWMmiO8PJpIOoIjbfLHk/kYfP7baYil+zkP@vger.kernel.org
X-Gm-Message-State: AOJu0YzlIlokqNdsF5JqP29E8qjX/OCItqhfsqkoaotVVYh0JF4nlWSL
	AQjBh99CNDZ5tofLNMzj4PMvueneV1gYD/WdMlrtl/cqS15OHcIVin3h9qGa1ep49x3bm1Ri7nP
	SIWyP8HVk37OtZsz81Wo1VaSXvSKnVwhQd6x4y6rZunaXw1kb3om8JUCYsDimJ3Dcfcswr5Gpp/
	/WcWZNOO6j
X-Gm-Gg: Acq92OGhEKjfKoWYwU7SKSLXKjY17EDWjd8hALR0SHsw3tnwTiSn/nPqtUguAzqJacR
	AGNhamI1NeUjoXuY8WQDyB9HdTViLAjU22br3BcFLL0AT0ccfT9K5r912beboMZITi0bGH/C1lz
	V2rSiO3t33Fix3XHyOvWt8W7Ng6Bagir3dEDI7CjDze3Z9LPGkvC+0qihF67ruXciLj9DPYdvNk
	Z2/7gq5mqBsaTe5yBvGhRVRN73aMl2ARkxSRYupau1pKOF1izG1Bgdt3dlSs9kWZ33cEwsOHDuV
	4bsjbXUfnOjIdB4UqgXDo6KttCLWLBvQzPQr59f4ccAeawpTiaETJXXwxoI4byFxG90z/wYa2kH
	Xfu0QN5mqvAXJIcXBDzMy7ZVQWjqrSFN3hEfaSLfarKfbeYsQNhEmJl/1e/RANmZKk47dIVP/VT
	6JL7fEcUI9HIt5HgvFh79S7HmuXoIrbbwpCnfNmjoMY1qSvCtN3AZXXgXW2wh8Cg4c38q929BME
	mL1Ye43d55m3he7SghWzK5Qj/g=
X-Received: by 2002:ac8:73ce:0:b0:517:8f52:2724 with SMTP id d75a77b69052e-51796953373mr207761931cf.43.1780995014653;
        Tue, 09 Jun 2026 01:50:14 -0700 (PDT)
X-Received: by 2002:ac8:73ce:0:b0:517:8f52:2724 with SMTP id d75a77b69052e-51796953373mr207761651cf.43.1780995014160;
        Tue, 09 Jun 2026 01:50:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e02b43sm980240566b.40.2026.06.09.01.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:50:13 -0700 (PDT)
Message-ID: <90e55476-691b-4528-8404-0a8577a532b6@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:50:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v6 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on
 Yoga Book 9 14IAH10
To: Dave Carey <carvsdriver@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca, ilpo.jarvinen@linux.intel.com,
        armin.wolf@outlook.de, linux-kernel@vger.kernel.org
References: <73c27728-2f07-41c1-82c7-fd6f46c89f3c@oss.qualcomm.com>
 <20260608215205.678182-1-carvsdriver@gmail.com>
 <20260608215205.678182-2-carvsdriver@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260608215205.678182-2-carvsdriver@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a27d3c7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=xL4ekoq9v3liqJ9o2P0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4MSBTYWx0ZWRfX1iP+sY1ldrAX
 5ZaHtklAlykG2Tp+5EiJUCekeq9NeP4OhqSqEe3skuZismUKRRGxfOwi++F1K3ywSEU0S5IVSzW
 rdNsKOE65OvQpc3dtRPYe0yEW8+PdtvdIW4Hqii2j91bZDKfW6JQGkI90MzAnhWuWsMi24g3SF1
 r8YtyDbIdX3QMB1cO2g36ZdpRBqs+qOz71+g7N6uID2OK8OOIjLxogB9O0QTfcjNpI1Pt8cfWj+
 zecfGxNzpDlSIFu0ZiyXijDGIXfDSzaNHGR+HLO6QYI8tZFN4ETmPNla87f8UY65V3HZRJhktac
 jiLOfelchmwb4w3XttMMuIMGKDczCb/9A5MHoVcNmkRNZ7h5B3NjUdRBfpMVuFRmTseJq2CAbXy
 pDNiJ9YArT/3+3HXvp1k4r6Ejs7+dO8bwPIVbwcZlea3+aDwguf53uJyFEs0dwoi/vCGA7SNu76
 7l9f30+UoQDgIQTFMPA==
X-Proofpoint-ORIG-GUID: oLbuf35P8jzOUe4s-VOXawjwLblEuCL-
X-Proofpoint-GUID: oLbuf35P8jzOUe4s-VOXawjwLblEuCL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090081

Hi,

On 8-Jun-26 23:52, Dave Carey wrote:
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

