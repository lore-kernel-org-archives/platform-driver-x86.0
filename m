Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23ED43901C
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Aug 2026 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842933; cv=none; b=plz45p5ZapMDbtS3FPVaxDS1oGzmQDX1iCGp6eFdxA7nbtHOwzvAIw421W6lAsu2iT3v4WdDTYwvOoKoh6DpJcPDNcPuVAebHT/JkGCKTcR8FMMnjdn8ebNvHFsgXk3jj5iR1Ag7TzwlvguddKznmXpXcpUkjJXoSJnNpQRIFO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842933; c=relaxed/simple;
	bh=8BWqG4YqfiBjM57lNnCy0KH8Akk8pgoZ1KQjJG8hIyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o0TCtI2C3F5USGUu3GoDGBQPdDzWoAYAaNHPocSjLXzPQm3rkpr3mPz+64IhZPbSEW9wQX5oy3PIfY0gYExjfxsLi48BFT4G0NII9SAu+84lIIBwGzcbzpWG5SgxLdbI/kHcUq/t7KO5GTMobr2yldCNRKZwXS5s7wbrlr2fcaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bAYlkwkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGirrsxS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bAYlkwkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGirrsxS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CNhN3217935
	for <platform-driver-x86@vger.kernel.org>; Tue, 4 Aug 2026 11:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mUv2doTcB2KgzQLoxafx4RHjj4cI//KwVl9sabgS/aA=; b=bAYlkwkTUdWwAann
	qho0NpK2qHNsX8QcruRCnRYdzvsvTQYXi3DmTrPv3lNOxIZv21nj//tAHX/ZxXQZ
	ObH/d/Xzh4DUkzUXACYog/kr5jZHNlMjqxCBCPLuLaSswQtbLhpF8CqMMYaohwCW
	Qtf/B6HxcUzRFXCKuDkY0W3fOrpSW9+ejkBihU9j9I0KsqsR3rET0/gADFT6144W
	xyCmHtKKTVn2IZJgsFWG/96ab+j1PZcxoUJOYDyMOeB/9UxcSlnQfT3aUHpeE8J4
	xsieTqeR6M3K2vtijqZH2RK3u6A6Hir98iFoP3yMnbxXe6JAe7EzWrCbG91Qt/Db
	oMxZRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty5sbxpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 04 Aug 2026 11:28:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so39246721cf.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Aug 2026 04:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785842930; x=1786447730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUv2doTcB2KgzQLoxafx4RHjj4cI//KwVl9sabgS/aA=;
        b=iGirrsxSLG0FQLYjoq4FKgMF/JL/FsmzIdpnBaZSjXyEa+UkNo8iDLpgvYvOoV5P7N
         7GH/kkLesLFSjTRWGXD8u2cmiF2FUHntKU+tMhs33NyJnO8me9eJHIcrQt3hFNgSfV7e
         86FKCFrzUED6/eCieAEfVf5rQ6pfgfKILsKGJgqTbpZMLqnMpBcUxo0jDo3sD08pDdKC
         XqB0NkUrFEwY5hD/48h/OqEoCeg59CSSkGLIoRMOGsHHrGIg2qcjVFGtS7v+tZ2QiTvw
         +zNjEfACxw2lNezTOposCfRwR3yugzNaDPm92ylYk/QRXwtBd1ItLbYaYiSTavcE7zcJ
         158w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842930; x=1786447730;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUv2doTcB2KgzQLoxafx4RHjj4cI//KwVl9sabgS/aA=;
        b=NIT7Osu7GuIy/5C+X0nOfXJ7B1L1uCz3OK9xDQHRBlOuUed2F3f2L6BTjz2GC0X8r2
         cn1TZFKs8sv+VbOj/N/Inan+bIrkjduBdyMBVEPLb1U4ex5UgbmfQPe1RYJMLFZcyjCG
         LO/ZSbkIghfA1OJG6IxYU21LCSKxbMqQL57GEdZncqU9N+A7WvEnyMyQoz+aDom8a92q
         ReVX8JQbcZc9sq/UME8Eiwvgie0ZTJ2CuH9LZO9YDx6vxgKgIbEKxlljD32EG5A7uUqZ
         fQMzRmB5+BZ8Kmysly+OuZfk4gyeOxyxiKbDOqRO9ehRYDlbuQ2MQIagjOuN5Fkkr7pN
         wPKg==
X-Forwarded-Encrypted: i=1; AHgh+RqDszyWBNmnSR+YkE2Xau7S9KPKkhjf34eAHBK2KynWZ0wygW0QuyklLRwmhZE4h0gM11vxsN1ZAHKSZMLXWNXK/nh7@vger.kernel.org
X-Gm-Message-State: AOJu0YwW2tf5ILALhsceofR/sEDUUxYK7oqARkpHRIIciAfjnPPEvhzt
	OEOhq8IzLFeKgs9OaqLXbQ6+j6yzoxkdTee5ggvdrdjVGmsFYkP6akehPlER5dDW71p3ApDVqtv
	NodILH8qPjkAlLGHKd+DKO9gBd0TyC+ig3AnYyGUpJVp57YDeOiSBHy1n0XFW6BGFR2Gc77cXPu
	Ih
X-Gm-Gg: AR+sD13M1C+feANoSFp0KhthB+bCejAA7INIm2HGonPdZJfcnH4pexIO/pm4VTWzYPo
	jG5GM8IECg2pT8n9mfyMhsjsM0daQ70crULLSXZN0fV9VkbSiQnmOKsJBggGb28RrK9/q3LTmx9
	TST+OSw5R/KrW6jCRvvOPFD3RLiS8L4d3HRzyt96cNuCkOcpWNSvAAW6Irtf4yHDBS6z4hR8S+r
	7Lr34SKluBx4Ue0fY0p1S9bk2X8emH3N04G0TSo0Zg+aKsSFwBEHt/ukBq78Ra/tI021UTd8W5F
	roe8QkePT71JlQNspac5r4Pt4jhS9oX6YCGaX0+My/WCrK+XULyGw9gE2IlOzEyIfssi5EcgwDR
	ck54ttn55Q2GDsTvQKSh7BxWqNRpkkQ==
X-Received: by 2002:a05:622a:14d:b0:51c:1241:3b09 with SMTP id d75a77b69052e-52b567f58acmr239416721cf.39.1785842929536;
        Tue, 04 Aug 2026 04:28:49 -0700 (PDT)
X-Received: by 2002:a05:622a:14d:b0:51c:1241:3b09 with SMTP id d75a77b69052e-52b567f58acmr239416081cf.39.1785842929012;
        Tue, 04 Aug 2026 04:28:49 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fec606sm95734265e9.14.2026.08.04.04.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 04:28:47 -0700 (PDT)
Message-ID: <64d82edc-87a0-47c7-8a17-f0d1c806a294@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 13:28:42 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] firmware: Rename google firmware directory to
 coreboot
To: Sean Rhodes <sean@starlabs.systems>
Cc: chrome-platform@lists.linux.dev,
        Corentin Chary
 <corentin.chary@gmail.com>,
        "Luke D. Jones" <luke@ljones.dev>,
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
 <e0d2a22e-a0cd-4a71-82c4-b88abcc7456e@oss.qualcomm.com>
 <04db0ee0-a8d5-4f30-a494-5c7f8ac757c8@oss.qualcomm.com>
 <CABtds-35m_cfT=Vm4MZkJYRe=dOPAKR6HYO_fu3SnwkdVQE0nQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CABtds-35m_cfT=Vm4MZkJYRe=dOPAKR6HYO_fu3SnwkdVQE0nQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPJykuvH c=1 sm=1 tr=0 ts=6a71ccf2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HHStz9QFAu1F9MAjIKUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: k1RKQiLUchHA0BD3YYySzv65uKsin39I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5MSBTYWx0ZWRfX6FQxQbouvp3D
 bDQ05TB7MoRxpjoYuF+nryDCUXU55NDcy9j9rVavLfNXHUYVy9lSyD/9VucwNtxGHsntdpOTn3Y
 LH93AM0queccUXy5gFJHrZtD5JL4vQchOICQQd3ZeUVUTPekm4En2CR1DDUkog9mEpbheiuLjZD
 SOZwOxy+e1tn+/YzYFSU1jnlkSuWhL5+HC8T00fICxbZrBfeFD0aBTlvKvKmbi0BL77sxZl1fgS
 uJA2394EeTVUFRyTFz5SXaqbnNgWuOKpvVGpvzSP4hI52qZ+DIj4c54m0fXGYFnq7diXdkvEGX3
 CiYz0z+3xGyxuhB5Db79zJfJeGn/9e4RMPNVQkvtuH/3SsTq1BU84tafq8ARwar5ClUURM1BdbG
 P0K2e/MQhiXw38kWudFUzW1xS5ZSj1hQCAMoMFrK/IlKbQ5jdkk93dPFaWDZc4Ny7OGwVfUzEqI
 iNAXRQjnBpqy3e9ZZyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5MSBTYWx0ZWRfX99Xn4/a1dhhH
 mMyKV031nFb1YTR6xxSSSU3EGFTko/xuDOIfSxlVyJQ4VJMmy8Q5uRMCyQb7PUrlPTPj0dJ8hWe
 ZkgAlVTz61gDpk/YQ61rNRPnzV64+G8=
X-Proofpoint-GUID: k1RKQiLUchHA0BD3YYySzv65uKsin39I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040091

On 04/08/2026 13:24, Sean Rhodes wrote:
> On Tue, 4 Aug 2026 at 12:05, Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> On 04/08/2026 13:02, Krzysztof Kozlowski wrote:
>>> On 04/08/2026 12:13, Sean Rhodes wrote:
>>>> rename to drivers/firmware/coreboot/Kconfig
>>>> index b78c644fa253..d273bd836245 100644
>>>> --- a/drivers/firmware/google/Kconfig
>>>> +++ b/drivers/firmware/coreboot/Kconfig
>>>> @@ -1,13 +1,16 @@
>>>>  # SPDX-License-Identifier: GPL-2.0-only
>>>> -menuconfig GOOGLE_FIRMWARE
>>>> -    bool "Google Firmware Drivers"
>>>> +menuconfig COREBOOT_FIRMWARE
>>>
>>> As pointed out by defconfig change, which is supposed to be separate
>>> commit, this will affect users of the kernel for no real gain.
>>>
>>> Do not change this.
>>
>> I am surprised that such change appeared at v10.
>>
>> Changelog is quite incomplete and I do not see any explanation for this.
> 
> Sorry, don't follow - so put the names back, or split it into its own patch?

I did not find explanation of this in the changelog. It cuts at v9, so
maybe that's the reason, although lore pointed me the v10 as the first
version introducing new CONFIG symbols.

Anyway, IMO renaming is really not worth if the sole reason is Google
name is disliked now.

Best regards,
Krzysztof
