Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3EC40F74A
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 10:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529209; cv=none; b=TKhg3DJACOS0Wr0COj7XIPeBsY7G5P/X2FOFUh7YOim8AHo/u9BhHUyMCdQF3/IRXPvHCU4nHiqXoBYkSf9u0r21ztF53qjIULDdLPV/nuMrazz8IyzRkefMMucB3sVBM18a8ymPLLac7tLoZM7kb2+5J6w/7DZv2dbzzaISUXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529209; c=relaxed/simple;
	bh=RnikPEgzeTjUJnEQSdQKHOjLYEpAOh4Q0UUB04GXxj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0bjYByIPcuh4XcvbC33vmSqPjQ744gDQLrtqdcVl+zpzoPpMTENjWOCAushGJGq+hoo2V/LZeZYgtkEVDrOEMiE6qAnZXCfjnc5qFtO824/cUgkoO79kI5ZgbuB39px+ag0HF4PegVNVOpY3yhpAXS6Prv0jGHrSI2a5TmcEtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/0bpBRo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUlMfcKf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/0bpBRo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUlMfcKf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9g2ac3481719
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 10:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t/SOUpUwjDpAt++MVooTOPUKZjfOYijo38yy35xnxnE=; b=P/0bpBRoYv1osyh4
	EAkk8kxe2DJERN5N3w78B5e/+lesGS5HMl8vMkcvIwuiGa/Ahn327h+p4QMv2rc4
	SxeYZPEM1DymwEsgBin2TL34WUV5fPAjmygLIFgxTqLiNNGZEx8IBiiwNiolRDS/
	Y1fTd8ET0ui5cFVH9j56O5mDWkndWU/NU4pG8pdTGPJInpKpUByIOxTmFG7Kxt23
	C37rEApB3vYvqzcXkzjQszX/GfZ90nnYsUw6gWyYcAcCU5scrGEyRxLoKZcHhdGB
	bXweSN1dJ8RadevfMuDptwwsH3QVi6cdQtf9URG9tEeu4I+WdRei4VBYGcP75Dr5
	J67yvg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0m6rgndb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 10:06:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a9764f0so8127211cf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 03:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786529205; x=1787134005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/SOUpUwjDpAt++MVooTOPUKZjfOYijo38yy35xnxnE=;
        b=kUlMfcKfl8YJx21hHjWrJz1PUviEHLnRk/VUO8SB2Myyu37+raHUJ8mC2ka2tAnMA4
         cYz5si5DmXUSZe0U9aMb1BrN689Y29yBLePsbgksL0GjsLAHbdOYa+9ihW3eMKf25P7Y
         A0LWcObkcAicTp0B4thMPHiRIOqGB+PMd/7qBEf8aRyOvG9+yJs9glKal7BIextTkyT9
         uoQFYehAnyULQDuw+5Gd7VeB6wY1mGszyr/bXzeJ3hWoASX/P5Z5s4Wmw3/4HY2oFYwF
         hklRsb5jtIB+iTC9MpZFUe0r3ee69PAWsE6nNsEppl4S9O4lZnqQwjixWCm/t5TbMtA6
         Yszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529205; x=1787134005;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/SOUpUwjDpAt++MVooTOPUKZjfOYijo38yy35xnxnE=;
        b=H+W7ziIHFfwilrk1Sx8YmIQ8xAieogirGUc4GljWDhRd4Ihuf/hyeHzaOKF3x+sPO6
         +aqWburjIYx6Ub4UVeuNF7WMGUUBA41YBf/8Gayo/CxXN1/kaojgsT0JVTACUb9bbw8c
         sx2SLpthLclHU4q8/fE6IirpmsdxAE4EbCqzFZKNlorUgYXJVFophUPInF5UD4SEFmaD
         u2MrneFyhbf+CZbgXAcobkqXFVtMnQo6iCXflwtEDOHcquQ3gOMAChp9TmJvk7ns5ZJ+
         7nW3nIdPpIqHPFOKJr0+XvGYDVyFanT/JeSiKd93SE77j0BSZPXm2uAsJqQWkBTHft66
         eyeg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3iAAG4mI5dGmm7fkgohZNI52xxyWaVY2VC1mI0r57kP54U8d6n6f2w5xN0uV8P8VBTd1GuMzGqv8Xel/IJgkjl96F@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5EogFO6L+7y60IkYYGVHizH1qDsjjfnwIDg10LTPKZno+vRM4
	uMjWK6D9pZfx7yeTI8tAouSb+bSvieBxqvrcZ09zAaH3EPc5NxY6SS4IXAjzC/SdrWWGG9OHDlG
	RQ+47lXiL1mC0PB57bOgHashI9cB7HyAvguypypbz4e00Fhkx3p7L+COPySnt7SEClZS3IoADv0
	3J
X-Gm-Gg: AR+sD10QjNHY0jpGVlCKrNh58tB+bQkpskSEX1B82Aq5RoxWAOCmlwhAe2Btn1KRha3
	Cj/A5zHX2+NCz+nt3iuviV2qkoF8t5P1R2d43M7O3bYTsz5My0VQuvtfasyVi2vZ2C6MgpSU/A/
	M2tP0lknu8RjniC4R/7XZLv69t9ZgHFIxM6c8og6k91ewMbfjyTMJEIgB4ey+iG1J8c2Yt/RGIb
	jO+Db21C11TIJoOIR2eLlgNVDnk9Puu/8W6xSYT8wclaO+eXVmRK59bBENcTxu8MRQTToSOinr+
	YpenOBHknbedS/bp0VssBoY6AvGIeU7GlzvPl53baNxc8Sp+RJIRqS67XKjGq2RBu8JMi9WYChB
	KVQm4oth3aR3Uyxt2H8n3XDVx1qD4pw==
X-Received: by 2002:ac8:5854:0:b0:52d:3ccc:968b with SMTP id d75a77b69052e-52d646b85b6mr26390481cf.9.1786529205387;
        Wed, 12 Aug 2026 03:06:45 -0700 (PDT)
X-Received: by 2002:ac8:5854:0:b0:52d:3ccc:968b with SMTP id d75a77b69052e-52d646b85b6mr26389931cf.9.1786529204950;
        Wed, 12 Aug 2026 03:06:44 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c946ce1sm34512735e9.5.2026.08.12.03.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:06:44 -0700 (PDT)
Message-ID: <c8e4a3d3-a96d-4fd1-85a6-881e68385c83@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 12:06:40 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] firmware: Rename google firmware directory to
 coreboot
To: Julius Werner <jwerner@chromium.org>
Cc: Sean Rhodes <sean@starlabs.systems>, chrome-platform@lists.linux.dev,
        Corentin Chary <corentin.chary@gmail.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>,
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
 <64d82edc-87a0-47c7-8a17-f0d1c806a294@oss.qualcomm.com>
 <CAODwPW8B2-i4Ne-ZTVUM_H-EZwn2hoaC4joRhxNM=CREDd_aUg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAODwPW8B2-i4Ne-ZTVUM_H-EZwn2hoaC4joRhxNM=CREDd_aUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4MSBTYWx0ZWRfXzIuTplwVDKgW
 WiVhcQ2HA6BmCkDgyAvnrZpTx099LDyX6jMUDm6eVrwxR8hYlzXPLFbPaUPEyy4cgOrnlccsOO5
 YJ5qM1/z7jp270KOXx68ChAZapZF0PhMhX/VuU/irx4BKDdy1fCyEW9QkejBcWGdhRZAfOgXXzz
 l2eZZE1aQcxAATomih1dG+yq/olehdQuLswmXHSKLJIC8WtNIvRVk0BIHw+v8Z0si6/PaTuDnCL
 zNTDJgCeeeIOEpJT2hjSKwgCEYo4AUMJvPYj3eTAdVjhxxLjcGQswXQdYiiEhIt56ORnTxvOpgG
 1eUY69a2WzZQvhRe96ltawOZ54o+Eak+yj96ZKlb9gpEqjJM98tSswwrsHtTsEA6kfxvE58PI5K
 66vm55ldI9o2Aj9iDmw3FbyCvgumSNmsMnW8wO4vcjY6HaS5YcV+LFY06VlAm6pJB1p255K/QyX
 EG7p5X7vmdKVAuL6ljA==
X-Authority-Analysis: v=2.4 cv=Wb08rUhX c=1 sm=1 tr=0 ts=6a7c45b6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=WubhEmtZWPFaE_0rBY8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: DwuM70OanHJleuTU4z9nxwUX1hejKMpJ
X-Proofpoint-ORIG-GUID: DwuM70OanHJleuTU4z9nxwUX1hejKMpJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4MSBTYWx0ZWRfX2AhOy75GOL/J
 SIQeimum7skXhJaP055RbERSR/jyJmTBoyqfvGS2SMzpROom6lnXzmXrkBiIMELTH9iV+o3ASfD
 zkuQbcGgvq+9yzBcsdzJveG+UzGRnH0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120081

On 11/08/2026 22:21, Julius Werner wrote:
>>>>> Do not change this.
>>>>
>>>> I am surprised that such change appeared at v10.
>>>>
>>>> Changelog is quite incomplete and I do not see any explanation for this.
>>>
>>> Sorry, don't follow - so put the names back, or split it into its own patch?
>>
>> I did not find explanation of this in the changelog. It cuts at v9, so
>> maybe that's the reason, although lore pointed me the v10 as the first
>> version introducing new CONFIG symbols.
>>
>> Anyway, IMO renaming is really not worth if the sole reason is Google
>> name is disliked now.
> 
> Krzysztof, the idea with this change was to introduce the new Kconfig
> symbols that more accurately represent the new directory structure
> while keeping the old symbol names available as fallback symbols for
> people who continue using old .config files. Doesn't that avoid the
> pain to users you're concerned about? I thought doing renames like
> this cleanly was the whole point of the `transitional` feature in the
> Kconfig language. Why do we have that lever if we don't want to use it
> for the kind of cases it was meant for?

To me 'transitional' is when you actually make changes to drivers, their
dependencies or to whatever Kconfig hierarchy is there.

I do not consider marketing or pure "I do not like this name" as valid
reasons, because this is developer string (or kernel/distro
configurator) not end-user visible thing. And for us, the developers,
this marketing does not matter.

Anyway, defconfig change must be separate because it goes via different
tree, unless this is non bisectable. Keeping it here initially confused
me into thinking you are actually breaking use cases (which you are not).



Best regards,
Krzysztof
