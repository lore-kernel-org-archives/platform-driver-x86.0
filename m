Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B8141F342
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529337; cv=none; b=NI50UXkLFTtkySwdPdXV99vqoOE3rMAEcBXbdDGzO1YC09i5EVkek5hZuRZVI/YOaxO7MLF/LkJIisnDmuwLtUR/6sUVqnqedelJisBYIWQjzhGM+Y8iW+alopGKUXPwbtgqMQ73/V9NRSgy5aB5hPoS3EWW1EmJcs1yAObnDlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529337; c=relaxed/simple;
	bh=cp49XHaRfrDqnDYoNs9YFT62ZnGM6id6uYMDIkqC4x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=boZteOuabadk6gIyFLxJaFYaYPkx7qxwA+f8u7S0FsA9G7o1HtG3LTi4u2w4XzExleFhvksKUQx7UNkU0yHfJcCoLyDgx5mhqB9UkcOrlSe6D9VbLOLM2X+M4kxlaS28rVt6A/phelJoRXif3PWSyuKUQzXQ3tPM/8DaEX5zc1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/tu1/Vl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QESaP1A7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/tu1/Vl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QESaP1A7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9g07Z2677362
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 10:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mpmAQvf63WFWZ8A0PHDHvJxNSfZra1rqR63BiUT7B0E=; b=W/tu1/VlrSvlae9j
	HXVw2pO+K0bPd6C4A89ekThl6N4CzpnsWPQtZg0mLfT4a/G7WYJlP44emaSvhNjP
	5p7cZYNEinl2M2vQAh+jyYdY21xcLxFYf+VqeZNzO6C5nzcXzhWcG2wSYvQha8Yj
	0+QPBPSTR317GqqBHpkjEZIyh/feeba3o/suvjQh7I3/g8QTFlTv+ddqqZj80x3e
	BCoBlLkGab0BQTXoOB8j+HewEh8e8FsEQOcVYFYltBaxXiaY5si7+W0SfjYMGvhe
	eCvcLPfjDNsztY2tcTB3luWUtC+sIWitQo8BFL2FGg0fsmp7o8dsR8Lr0QibjFA7
	dr8dAQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0mnd8hqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 10:08:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8b0a08d2so6838931cf.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 03:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786529334; x=1787134134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mpmAQvf63WFWZ8A0PHDHvJxNSfZra1rqR63BiUT7B0E=;
        b=QESaP1A759YDcwZmBFSc+1i4eCllgisR2dpW1XBO3htdfj3gUIvu4vnZ28QuQP7lnG
         0WUa/rWeyWOb/QJFdC+cCSkUmiSiootTuKbphCe+bcStfFCCQ0DpJ3+aUcEqhRsNkuo3
         DxSytk4Qin0l3c9EUP8EAqIL7acH6pDHQmAj3iivYrStHqPDUtNisBLsWLe/fvMiSevp
         AIMaJ0LjjF9MiauRRI930zW+U3ykiHg78AjBMQkKPYj674jysIjrhZBDfMdzvTklOUKd
         ghzLyh5MCjSO1ll2SGSnzR9nmB8YaYbv1qjAivSMBdBGTLpRiD5OLZYUXcTbkqxH07R9
         7V0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529334; x=1787134134;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mpmAQvf63WFWZ8A0PHDHvJxNSfZra1rqR63BiUT7B0E=;
        b=TqUepo03iCsw6+TGQFHcv6q+J5aYU42cz/qxKSnLM+ASwrTlIrFFvqOULFiGlizIW9
         PtKOosX0UEokJmmjw0TQtljaRnDiMYjyeb8KGY/AgWxcx+HqjOsO2hb4llqQ2irspHXo
         koc2xgrmeRsa0ZGGWAcU+1EHu966zEKpsrO4lS9/VogoRv1km068+SqVR0keOwyfgkRM
         HumZ9YKstS8mEiD3WhHDmbkDRPJxFDVZajT9aAs4q98M0q6shZCtV1buiMEQvY6QqyT7
         neqilrskoi5FiajJLRU+qLMlHvo4erHKEpiHRX62v+0OhcH9Gr4xpZ8LRV00V0O2eUM5
         6Mxw==
X-Forwarded-Encrypted: i=1; AHgh+RrjSFh9t1U9RnlagxlIVxFszD2fh+KDW4iG5K/bMpV7opS7+qnad0z9DXU3JcHeY5Ho7MuwxkndurkbdOdCbZ0ZscjX@vger.kernel.org
X-Gm-Message-State: AOJu0YzH2OckgbJ+A5c74w2LPzxD0HqCKtCXcTM/vaZEuMkbs0NKmGFl
	Bu2zuDWYyo2FzipB/WcQckZc/rGRLJgoRofR2EvmTMauY2bgK7J0YVf17yHdiFi3d2LqyRZ8qne
	Fpl3Z3cHZGtAdD6hCk9zJm+zylpvrbu1uapFEa5c8eab2gyDr19kk5M4jeNbUgcG/lGvZL3a1Bi
	G9
X-Gm-Gg: AR+sD11SVYit2twGzrGfDM90OaZEU79SGRuGnPo/HvE03+jIVy1d0Zy5n349EUKIy05
	AHRv9mF555AMsvxlhzl6sFibIFkrhdskOt9n8vAZKEfdrX/qF0q32iWl+d2h6iBv08vqNa0Z3o+
	80N+cx/gnWaKOmb4PE412I/vR5N2TXRdCWNazVtbNgpN5HjAjgnU6cnVVMglgD28/PEsEf7AVBx
	pzL0i+GorrurF2n7YBbOy++ES7YJYp0M/kY1CsxINW0PmsMhGhX7esnxwkIEPhhY4h6fICvB82s
	0i6qWZTcq5H8wiezCge/MjMz2sem1E3GaawKwgMhmLarjLHCa6yZSUhsddQNS7+3jd38nbqWkLT
	dnTSueVGR4t4xpSHWQJl/9R3QLwj0ZA==
X-Received: by 2002:a05:622a:5c09:b0:517:6d6c:187f with SMTP id d75a77b69052e-52d64719ec8mr31153931cf.14.1786529333724;
        Wed, 12 Aug 2026 03:08:53 -0700 (PDT)
X-Received: by 2002:a05:622a:5c09:b0:517:6d6c:187f with SMTP id d75a77b69052e-52d64719ec8mr31153361cf.14.1786529333276;
        Wed, 12 Aug 2026 03:08:53 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d5dfadsm6433746f8f.29.2026.08.12.03.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:08:52 -0700 (PDT)
Message-ID: <c2bc1b2d-1191-4f1d-a627-626513993b6d@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 12:08:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/4] firmware: Rename google firmware directory to
 coreboot
To: Sean Rhodes <sean@starlabs.systems>, chrome-platform@lists.linux.dev
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com,
        jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca,
        derekjohn.clark@gmail.com, josh@joshuagrisham.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dell.Client.Kernel@dell.com, florian.fainelli@broadcom.com,
        chenhuacai@kernel.org, mst@redhat.com, wenst@chromium.org,
        tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
        tzimmermann@suse.de, javierm@redhat.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@gmail.com, simona@ffwll.ch, andersson@kernel.org,
        geert@linux-m68k.org, dmitry.baryshkov@oss.qualcomm.com, arnd@arndb.de,
        ebiggers@kernel.org, luca.weiss@fairphone.com, michal.simek@amd.com,
        sven@kernel.org, u.kleine-koenig@baylibre.com, bhelgaas@google.com,
        dakr@kernel.org, o-takashi@sakamocchi.jp, titouan.ameline@gmail.com,
        kees@kernel.org, dri-devel@lists.freedesktop.org,
        oliver@liuxiaozhen.dev
References: <CABtds-3MAA8y5ksGcps6s-iLx8dOF7EoJEJH9079Y_E+-bJB4A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CABtds-3MAA8y5ksGcps6s-iLx8dOF7EoJEJH9079Y_E+-bJB4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4MSBTYWx0ZWRfX5UY0ThNOvtFn
 QZ+/GqI+Gbdn59UM7mX5P6/6h+7Ng7FvTjBCABprxAW4M13NhrTjE7b5qll/UpGVf05s7Tle5Or
 gTcSqJv+fZcu9P+Fy7HwV/lpm2ePCIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4MSBTYWx0ZWRfXxJMBfc265xs6
 wCbvvqxL8A1uN7gZxkO1QxaRFFlrcKhaNHcMQNO7+dWbZSxCuHtg3Lny6dfKIAFUscvKutXPR1y
 4I4Ks+NlAy7scspgRjZTVHjbTiTJ2ZxymHkyaJTMD29Ht7UMGkwWrqO1uMQvNsI1wDQbcF0k3QM
 ZcMd4aYVagLjes8ywPzcrvURNjoZfEBqPCy56LQeR90hQLNgUdRgMUPOh3AWY+pSk2rW1IAdl+k
 90cglHcYAc/HEZzQsmuh2Tqj5Y1f56UpUykM6QeExjWnl3dhGLoGJv8TNEMPjLCre2dDzPU9wm4
 sk3XczB6kJ4ltHj3mzKmOXdVwWLeIr52RxRtsMCmCHLY01xh/abQB2tsD6//AwP5FtxV783mzvI
 dSMHg7VnirC+x4/qwCP8ICsMTpd5BrGSMwD/1jOy+66NX07NYCHBj9jbMpHb8aF4AeQkz55oism
 Z00fQ8du7H3/pYbx9RA==
X-Proofpoint-GUID: 1cvCm4B8EH6c0Q_FG66EheEI0FqfDvfU
X-Authority-Analysis: v=2.4 cv=C87ZDwP+ c=1 sm=1 tr=0 ts=6a7c4636 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=nDlYxSoMtbksMSfX03oA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 1cvCm4B8EH6c0Q_FG66EheEI0FqfDvfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120081

On 06/08/2026 22:28, Sean Rhodes wrote:
> Most drivers in drivers/firmware/google are coreboot table drivers rather
> than Google-specific firmware drivers. Rename the directory to coreboot
> and update the Kconfig prompt, build path and maintainer entry.
> 
> Keep the existing CONFIG_GOOGLE_* symbols to avoid user configuration
> churn in this mechanical move.
> 
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
> ---
>  MAINTAINERS                                                 | 4 ++--
>  drivers/firmware/Kconfig                                    | 2 +-
>  drivers/firmware/Makefile                                   | 2 +-
>  drivers/firmware/{google => coreboot}/Kconfig               | 6 +++---
>  drivers/firmware/{google => coreboot}/Makefile              | 0
>  drivers/firmware/{google => coreboot}/cbmem.c               | 0
>  drivers/firmware/{google => coreboot}/coreboot_table.c      | 0
>  drivers/firmware/{google => coreboot}/coreboot_table.h      | 0
>  .../firmware/{google => coreboot}/framebuffer-coreboot.c    | 0
>  drivers/firmware/{google => coreboot}/gsmi.c                | 0
>  drivers/firmware/{google => coreboot}/memconsole-coreboot.c | 0
>  .../firmware/{google => coreboot}/memconsole-x86-legacy.c   | 0
>  drivers/firmware/{google => coreboot}/memconsole.c          | 0
>  drivers/firmware/{google => coreboot}/memconsole.h          | 6 +++---
>  drivers/firmware/{google => coreboot}/vpd.c                 | 0
>  drivers/firmware/{google => coreboot}/vpd_decode.c          | 0
>  drivers/firmware/{google => coreboot}/vpd_decode.h          | 0
>  17 files changed, 10 insertions(+), 10 deletions(-)
>  rename drivers/firmware/{google => coreboot}/Kconfig (94%)
>  rename drivers/firmware/{google => coreboot}/Makefile (100%)
>  rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
>  rename drivers/firmware/{google => coreboot}/coreboot_table.c (100%)
>  rename drivers/firmware/{google => coreboot}/coreboot_table.h (100%)
>  rename drivers/firmware/{google => coreboot}/framebuffer-coreboot.c (100%)
>  rename drivers/firmware/{google => coreboot}/gsmi.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
>  rename drivers/firmware/{google => coreboot}/vpd.c (100%)
>  rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
>  rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e6a8c271e79d..62ddee473f55 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11069,14 +11069,14 @@ S:	Maintained
>  F:	Documentation/networking/device_drivers/ethernet/google/gve.rst
>  F:	drivers/net/ethernet/google
> 
> -GOOGLE FIRMWARE DRIVERS
> +COREBOOT FIRMWARE DRIVERS

This is incorrectly placed now. All the entries follow strict
alphabetical order.

BTW, only this patch reached mailing list (and me):
https://lore.kernel.org/all/CABtds-3MAA8y5ksGcps6s-iLx8dOF7EoJEJH9079Y_E+-bJB4A@mail.gmail.com/

Best regards,
Krzysztof
