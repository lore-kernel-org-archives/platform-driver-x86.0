Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2AE44C642
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Aug 2026 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841344; cv=none; b=fZGiY5aeLr29GLuX0eOGsv+kp4syYsXXDZ04UCXYcjw0QaMy8SN2or3u1uFpd0z+DJ0csaR8GtPxmUYchxgCg9JKZvC6qBk7lEtv1riC3FXbWyxHNFM5SbKfQF+Q7XBrqRYpzs87ZrvpnDftzTmCEVbdzTbC4OTdZJuxK4Pb+20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841344; c=relaxed/simple;
	bh=BrP+m8z5UArtroO9vy4VYaIMSvWxpgz0IUCt5aZIcwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XKno/s6Gv/pQkcjIOMF15ILhZCikQp/x3070WoA/ArKVmCs1MAK1HVh6PT98QA8s/Rsf2DRWvbr8xsiM9BGTkZ8sXQOLA7bzxahKQLIWIGdaZOkflheCVHG/f70D36R/zA81RQmOJc16TeAnbFoN8A189UycChhN7W2MNbKK2Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmM9yrRg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRoinaba; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmM9yrRg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRoinaba"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CXWM3531705
	for <platform-driver-x86@vger.kernel.org>; Tue, 4 Aug 2026 11:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VQIegxZjpPZ3YspDwqcWiPpjE3RowqNYy4IxabijtU=; b=fmM9yrRgfGUbBYc+
	GdXUwXlKzkpSpmM9aw1kTRMroowBL5dT1HzBFha2cgXrgzZk3d50a/R3NFiP5WU1
	F2GK9+BuXXUeJgVtVqZdwxOG9UGLetg+QKjvY0fD85aIw02RNTV6nK0AUHG0JkY1
	w7aS+7/iM7m+3nKfc350hlMyPywq1gviJNA2A3bvFj7b/ZJ7w0fT3oOCe90W0NUN
	mZawIlwhSBiS2yusR5s7OY+wQ9U0p5EUP9rJ+J63A/jHhfeVkG0u4GX+BUhb3A2m
	owEm3ZdRlryoTM7RsIt8e6P69rrMXL3v8K+9Nhr/jBlMyg8i6xLSqjAbp7qGRFVP
	WE/foQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3skxw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 04 Aug 2026 11:02:18 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c2e166dbc4so4376256e0c.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Aug 2026 04:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785841338; x=1786446138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7VQIegxZjpPZ3YspDwqcWiPpjE3RowqNYy4IxabijtU=;
        b=RRoinabaI23rxkFmNM16B+n60+8U/KIrGZ8SHm6v3V+4XRUKwkBG2aIMhEkodIxnko
         Wft2182lT7w4c481hvM9pAi4bTFkNJ5SbeeSfjxg34jMe/wvAfMbE6M0GRtI1ixaIwi5
         8uiN2MTrdTbns4Hbmm7Q1jafz4+G7zj2cHWYPW9Qx77XADHiqILZPe6dwIUb1WqLGocY
         zEhpc7ggzSHh71EcS7lSvhBCFKKRC1ndzheq3F9coVKDKm6ouhQd+2KBlLYs5BefH6zQ
         IbVXK2pJp86hjAeUg0z/K5LiepwyaFlQyFQFy3S4a3qloblK94KqN9/4jzNQ0d4cHp0E
         BA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785841338; x=1786446138;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VQIegxZjpPZ3YspDwqcWiPpjE3RowqNYy4IxabijtU=;
        b=E2o8tB7aYRCFqbLWcuWSlvAr6L4NIBMv3t7WdZSukXNQHAByc6UXmpit8whAeMhS5V
         COioIwE9Uce+FlE0N4AyO7+QX3kj72Rl837YykHVRF0Ra5PXtZlN+j3s1JlkJdOv3IYC
         dsVD6iC6fclhY3+aK09czykhsGCJcg+is4N1GfSZu08Yn5X3ZCWZclS/X3AhnFul1Ioj
         dwbci86VpfXpxlBAhCkToWGskjZLcaPek5VsN8HGxTngR5rRJO0UcJUsiJyUxxfvG/8x
         a3GlIjVYYUyAQXegwWb8SgryWt5TNWgwIGFmriBVOWsmrS9UXleYuP+KoSwGDPVcp94c
         OzzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqt68Q73ftPckfgHRVb497NfKv4lLD83SRmNN23NGIHpSQnPpXLUwcvgHl8G2LjFsg06OZPsQIYFE2pH46QE2J8QIc+@vger.kernel.org
X-Gm-Message-State: AOJu0YwwopOa7hKAd//IxUroCcsdASwTaIdR2o6rKhQrvMRSsmRfn+ub
	2Od9aRxwlKKJEI+Nb/iWZeFQRbP4xsTkklS5+gjC14XCBoUnjv0Kx8pMshwnGXq9Sr9z9sptvtM
	p8+0Uek0yVliatum+xCVsmY0jM0k9Gn3vzaHXSjorLI03WPU7Kn/dkyAE2GFm9iw5BZ0PSmDoNF
	6x
X-Gm-Gg: AR+sD13UZai3ypdlqUUMmMXlnI9sAb+EZxoKyHwcv/u7TFwT7d7XlMNVQdQKWLP1MRb
	MWwRTzqePvHdbpBg0heMTeldn7Tx5z7o8Hhq4pSVAyYIIWzrZWW57P+5VKTx8P0qSVCjIXtYXP5
	2ligDL0NLbXoyPFhxm5l6FGdR5Kya/EVVFIgZuj8J4VDfS4bZwXxJ3gHI4dmTM9TB9jZaXeR97L
	8sdHibLJrJs2melpWYVBSr1LT538FZmJh0WoAKwhgz98MW9vWCVZqJfHFeL1Teg8KYbWTE+8lJe
	hrDk5rEFRLc6ycv2NjCAw/mWoziuDQp0EmwG4iismSQKjjnNOylJpNb1PthahYcZr04ZNBMjQMF
	zJRUfXe7smbxgU/VW2PhBsohiJz5+Pg==
X-Received: by 2002:a05:6122:c94:b0:5c2:c0de:d291 with SMTP id 71dfb90a1353d-5c3878dbb3amr4934711e0c.9.1785841338421;
        Tue, 04 Aug 2026 04:02:18 -0700 (PDT)
X-Received: by 2002:a05:6122:c94:b0:5c2:c0de:d291 with SMTP id 71dfb90a1353d-5c3878dbb3amr4934622e0c.9.1785841337942;
        Tue, 04 Aug 2026 04:02:17 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm311773765e9.4.2026.08.04.04.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 04:02:16 -0700 (PDT)
Message-ID: <e0d2a22e-a0cd-4a71-82c4-b88abcc7456e@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 13:02:11 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] firmware: Rename google firmware directory to
 coreboot
To: Sean Rhodes <sean@starlabs.systems>, chrome-platform@lists.linux.dev
Cc: Corentin Chary <corentin.chary@gmail.com>,
        "Luke D. Jones"
 <luke@ljones.dev>,
        Denis Benato <denis.benato@linux.dev>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Jorge Lopez <jorge.lopez2@hp.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Joshua Grisham <josh@joshuagrisham.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dell.Client.Kernel@dell.com,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Chen-Yu Tsai <wenst@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Thomas Zimmermann
 <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
        Kees Cook <kees@kernel.org>, dri-devel@lists.freedesktop.org,
        Oliver Lin <oliver@liuxiaozhen.dev>
References: <cover.1785838269.git.sean@starlabs.systems>
 <6f65c9869714188539f2890aef6cf30e7bd2edcb.1785838269.git.sean@starlabs.systems>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6f65c9869714188539f2890aef6cf30e7bd2edcb.1785838269.git.sean@starlabs.systems>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4NyBTYWx0ZWRfXxjMQqsPwLSR+
 XRBxD/jtPE7ADpEoEVYBOInKqI9+514bDNV78De1VBp9LVj52tQwNuDTbXIGcSDZnlAS/fO5ri2
 PHHJLURHnVZYHum8xJpv//D42lGYIW4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4NyBTYWx0ZWRfX1MJ+mhwI/7H4
 NgX0cBAtiN3WltBleUA9NY+nyFcCS2tnHDPPA5tJF5FdRyfc3bU0sxUFeflB4qoZiAYp8HgtHTx
 qz3McIvXkBNY3L2WOG2ca+9Fh0e4/Y+q1yTsqiPKbs2zsmXnJYnv2wJ7kPCnt5plv9VBHz66KIk
 5txrRqznFjEM2pbnh8+s6I8ObK6VysrAkQsDJVudlGyBcEtFWlsYQYOJkhkrFya+flUXi1nG2Ob
 D19uxpFFcDCwIHOM7su8DCgIYzW6vv0DcRSBTzfr2sGmNNAmGN4118Ng+vCyejr+bU8EOTgoCWl
 sk2260VcCVp5e2ecaCG2nXJkJxDG+BWJOEb3LycvtaXsU5YCnMtMyAi2t8ZE+vsvt51348inlp5
 sWihMivdX3wNCZ1j7AfXhfCufvYwcm7sdLPVsg1AbUgvNyXo5ImWUwxJsyP6IpkYlhRcD1UKGtU
 zBTQAHMye1egbPj1c5A==
X-Authority-Analysis: v=2.4 cv=Nu3htcdJ c=1 sm=1 tr=0 ts=6a71c6bb cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=oilz1mZvSc2HNm1MEWQA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: gZcG1R8XBf1qIeb5QYqddswNmInSskg9
X-Proofpoint-GUID: gZcG1R8XBf1qIeb5QYqddswNmInSskg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040087

On 04/08/2026 12:13, Sean Rhodes wrote:
> rename to drivers/firmware/coreboot/Kconfig
> index b78c644fa253..d273bd836245 100644
> --- a/drivers/firmware/google/Kconfig
> +++ b/drivers/firmware/coreboot/Kconfig
> @@ -1,13 +1,16 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -menuconfig GOOGLE_FIRMWARE
> -	bool "Google Firmware Drivers"
> +menuconfig COREBOOT_FIRMWARE

As pointed out by defconfig change, which is supposed to be separate
commit, this will affect users of the kernel for no real gain.

Do not change this.

Best regards,
Krzysztof
