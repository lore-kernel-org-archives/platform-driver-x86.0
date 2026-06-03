Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FD737B41E
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481737; cv=pass; b=pGVOu5GP0xRSc9B7kVPzq/2Dwk+/DIS1AIEnprDI1MQyFUPDYsILg3cbptLyGIofq72oj7BcAxcGpzyJvBUgK1TbpSCZXXiGQDOHou/tvZrW3fVc4jjeU70Cwhl/wJ1jGRsChd0SfW7dSyn7Vcy4GQ48z76aI9NlpVqNumjv6HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481737; c=relaxed/simple;
	bh=ImyaRmLghxFwQsTJnShE9IsVAyUjBEQQdEnQ0b9Byos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qnwk/S4S0xRdKL95l+n4VOams7kpY78N6b2atBVSkiLm706SXyRJ9OdGzRIn+5jy+7OYpYO9YLYxFqX4T5BWD3K6LJNYFPzpYapYKfF0J5/3Grbzp3R33Q2rqmqi3HeHVccKTDim7BYk24vCKZSoCmeeGRGhra8hN2YXLJQ56/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RV/ZBQBW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EatizQkV; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RV/ZBQBW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EatizQkV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RPj9873803
	for <platform-driver-x86@vger.kernel.org>; Wed, 3 Jun 2026 10:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=; b=RV/ZBQBW1Gz7WB7g
	C36gOhNhdL+lLAmqQlpap6noJbbxHcrt5EIxi83XQdvwRajDeMt1YFcY+H3mGLXT
	9XatmhW6r/yTEhIszMkIGbMkNaO+fyhhVMzwIGL7bcpZ9ReeDX5jEpLuRbcstKSQ
	YhnhXEg7Vp0lJ0rPhBLgdWq78t4NPOsw/LugKMhQPSnThw01mcIgA9my3R2A/CFD
	SMxSsEToum0RhiBvscPxkFsFs1FxqjfwWOQrc5lvshnJbrHXt0WtI8psq0P5nZyX
	LEs1LzosAOE89oi/Bezr5wGe+ccK2iGDRjqfsqOH5hQOImzaSe/nMOk3SRXe02I+
	vbBXAg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9jxg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 03 Jun 2026 10:15:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccdfe1ff26so85824716d6.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Jun 2026 03:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481735; cv=none;
        d=google.com; s=arc-20240605;
        b=EGl5qywreiXsWEBeiJo6h/mVoO95KuytdTmRm/bppI1jRpOKtqat5Jv1cwQZVODAGT
         6ZVTFJdLwzE7Zx30bdwDCFPq5m+f8W7NoZI/vh2b2OLO2V4Pl5oCgkGYXPtMXauyFVbl
         geYML8dXpHYCyuxJE28mmnCeICwPC8MU7+VrKXV5tl8RSAHbNwtN7WiRQ/RF29nR8IkC
         UnZXhnhjZaWmeyncQwNGYL0P+pfmI5jkcbzQYFc5hFOu7edoC2K+HnqDZCxQFWNPjnn/
         NShvJYoqdMmbV+ZEhwyYIR96kBz3e5Wm1rDnWxgYCcb7sWKI0Cva6uD5yAcTObidrr2f
         h2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        fh=oLh3Eqi/g7f5HcyuIGNyLXXmWfsyXOYgtT8OzhXaGJM=;
        b=UweViGA+kXSma8YjBqaeq9jLZphjlqbAg4eYw+6D5tyBCk7yy9LgpT7y8pJMv6PJ7O
         /LLGE0buYZMC9JbGN2puyS6ACrqrb14BPBOdK5e0QXeTPseDsCu3wqXzqcajWWHWx+K8
         WW9Gu8ZyvuEyw1bfpHz3BrChFELK0Jvv7z+LXo1RC2KKcJfQ4NMXaLTHH1dScjZyLsJQ
         B32vsxmWfDPrkWOGpJqJvsxEGDlvy9ayzdjb3cHu7rrUobydTJ5EfnwSd7GpPEurj/V2
         /bp8srvvMUM7vw7CKYJVKLAQ9YTyvZYry1CEQuxYLu5LqGvE21j2rCPkKoq9sg7scx+r
         32Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481735; x=1781086535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        b=EatizQkVu7YoBqs4qPwuLBDMEpEcTxnuqziYKDt0bPh9McXDPanapbct+i5amdkN3F
         Jajg9ZgkfC1/+jaUiPBGfN6wi6ZRDxc28EKDs9Erk02sliQ3TkNYnj7U7vizOnqwEO/C
         YL+eKxv0jnupOirDhq3mpKzt7RP7ts656r0cFVfxymb9MP41VbGf3AYdNhieLGJXf/ze
         2xt13struA3s6xht/UE42oQzJerwyunWlc0ifNJ92XwPKl20aQ5CEi/YveJoz9H6LDTW
         MuDA1GKISMtvP/l6g9fsxaGNmZ0xSQtsPgWMp1+c/FBoZyfq1TPeGfZiov1KEMegbzp0
         3nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481735; x=1781086535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        b=YWguRND+JO69gBoexhdRwJeZ61zLkqp/RgFYaCMMmFKLCw5XqStXwiQwlF07dgZ1No
         WpwYHuDnSEhgtEBrdFCom4mXBSZvJbLgg003LzBG7y2nnsctz+y6SJK1UVJNmnjoIY+O
         P6ZOv7M4TWIwJfjj+f6RfwX84ivy6R8aHsAzDXFN7UG8me1IMu4jCX4wVXtYsY/n0GJc
         Vimn9rIoA5uEakK50UmDxr+k1CLgStsPNr51l2YVrlUz7boSE6uKB1SCjkIkZgs27Dpp
         HBTX/znHiE5wnLFPUBaG0IGHJMRdIq7doWPpbufxkfIoVN366ZzFuxXQ2+YOTsJu7rJN
         vwnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1MO8di5bNbkLa8+9Muw+/yTSgZE58pj36KrNAxThw1gmggzp6keYupV9ak88ZDWVzsNM1ngshNfcIo3bO/DPy66V/@vger.kernel.org
X-Gm-Message-State: AOJu0YzL2x5hFV35tj65KTquiqMY5WsMSigjHCLsKDP01XJ5HnkmHKv9
	gq5bUeuTFvr2e2R9zp260y92L/t9TMen0LCugioT2y8V/RUzn/Ir7cj6szKM7XbV1+dvUgZoVOu
	TobUE9xHYyY5kRq2Y9wtDswy5pBDAJP6UPQnIwo1O2cU/5vhD2/Fbf9tn3XsWHOrsM3jahQScS8
	+pX+LiYUlpPevUPN/kvSY9HVPc1+qugyGRI4E6OH/VEN0IKq74HXU=
X-Gm-Gg: Acq92OFxmNkSLyRpGBOFDC2wsDqb9LG60X3X0tenl6E4dXn1gPXuLhdiT/M0gbqgcM4
	VXLdftoIy+bgYhANrr3NBfqM33TnpQxwpZuoIprEoFL6X2HZl+kV8X+Ot/vEVZt21uQFAz+VJa/
	/xHDkB0YxDLD+2AgE/cFWvJDGqXHEsWy7IyCEY83Lh4ALt2Ran2NF7DueMgkAyHcu/nWAnrIOCz
	LVcwDANLCLP+vfu
X-Received: by 2002:ad4:4984:0:b0:8cc:6c08:552f with SMTP id 6a1803df08f44-8cecdc03682mr27951746d6.9.1780481734740;
        Wed, 03 Jun 2026 03:15:34 -0700 (PDT)
X-Received: by 2002:ad4:4984:0:b0:8cc:6c08:552f with SMTP id
 6a1803df08f44-8cecdc03682mr27951226d6.9.1780481734358; Wed, 03 Jun 2026
 03:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com> <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:15:23 +0200
X-Gm-Features: AVHnY4J4K5UzPNs1yW8q3X0LoIQq3c8UfPuD4kHDjf5PzjApCRf1PSF1rlsmtoU
Message-ID: <CAPx+jO9iJBx6Yifap55NOhn5YZk8Bbwpnk+aeH+0PgYuMxke1Q@mail.gmail.com>
Subject: Re: [PATCH 04/23] pmdomain: imx: fix OF node refcount
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: BzggaRZvtZ2VjLFHUcqZJ1iokVh_ZQAk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfXz4fBPNyer/uN
 OQWOmUzHdnTClFB/y0z7VWaccKuwsyDxtJl43JveTBFxFt44UD771Py29bH24VWrZv20RI3tzYW
 Sl7qu+zJwjWxy7wffers48PEfVxZmhPvWCvv0ZFO2fBLZ3siK9hMr42ubFzxdyw07UT+Fz5SbFl
 Yslv5lKjhwIl3PrYnTmcSzk/jKs46sLMvQloMh1zBHAWvuywWUK1QHYmmR/H8ey8PtrMlHsLKrW
 FOzewXTXVw1RHAuRAxbjChp2k9n3WJAxnzd7i6BdxxEZPM4RuMhZH7s7xVWOsybJavxJW8CwyLV
 zlN7Fq0fL2GWX7mDTxJkRKijcLeTHJ9t2kw2zq7nkNfNp4E9VtYnrJl1QtA8iZczpjhda4KWEpf
 SlDS0UcMxgy3SULsgatGAI8F2dxPCsLusCv/zULUlGyqtEom2/0pHAIZTz+zOX3RunTAYqS34FX
 3xGzvcJCE6fNgKDqQoA==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a1ffec7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=RwuSGLWl7VkFDbmKPUAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: BzggaRZvtZ2VjLFHUcqZJ1iokVh_ZQAk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097

On Thu, May 21, 2026 at 10:36=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> for_each_child_of_node_scoped() decrements the reference count of the
> nod after each iteration. Assigning it without incrementing the refcount
> to a dynamically allocated platform device will result in a double put
> in platform_device_release(). Add the missing call to of_node_get().
>
> Cc: stable@vger.kernel.org
> Fixes: 3e4d109ee8fc ("pmdomain: imx: gpc: Simplify with scoped for each O=
F child loop")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/gpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index de695f1944ab31de3d37ce8000d0c577579d64f9..42e50c9b4fb9ffb96a20a462d=
4eb5168942a893c 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       pd_pdev->dev.of_node =3D np;
> +                       pd_pdev->dev.of_node =3D of_node_get(np);
>                         pd_pdev->dev.fwnode =3D of_fwnode_handle(np);
>
>                         ret =3D platform_device_add(pd_pdev);
>
> --
> 2.47.3
