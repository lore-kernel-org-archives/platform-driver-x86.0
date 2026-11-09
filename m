Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242216;
	b=C1KeJo4jEWHSdRfZ460AcOfdwxKqbcib6tMNYQKR3vdoeUfGF2oN/DVvLTOyFowIODlz
	 NS7SH9ls7C81h8lBePNqSZjn6/S/NknSU1GhncBow1WK8pYyiityQ6R4oAc77MFuPQgfR
	 JhYndzO8x3fApxGAl4hY9p9KW+BuklMd3HVDlS9tNNswIKymHDcY9bsjbQ4S+cgmZVT5I
	 LiaWen6/lZp/nPforPHYeH7wshFG92lBSYMT9QJR6iPxuRRNZI8Q5CrVutDWZINzBfAoE
	 pr2qtNmvIN3muHz5E33QktolhtNl5KqpxgGHcwkhCXMB6/oPDqhp5mYQSRdDhYPUIeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Jn9CEocg2zylizZLlU3oTB1VMEKBAaE2tCfugJNdHSQ=;
	b=kD9MONkef+K38/Ly+n26f3ysmg/y/f/ay48WrCyRHX513TlGEzN8TXRTBEzLjE4McC4m
	 uP05WPokELbWRBuUYFz/ThyuhIlA3jU0RtNwPTqowz3urPnQzvGMTjpZUIHnsOhl07dc5
	 eX+QlZAxOoYEayv0uZTgclNq5KJ3XkAzKnh94PDk+HuEdF2q4B7DosHNnKahCcxcsjZcB
	 f1K2Tgz6CJ/1kDsVqOO2tl/M2qlAGT0nWgLKiyVzoY8xFV98vMQVuCTYRIeZr0eH8ACnC
	 Z1HGIxLRpGUyH734k2lJ6NOsVVOeV00h1tQwzsYnDlk650N5r7FO+WDW+GZ1ttqUHCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=msfeHy88;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VmCTHo9P;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6976860A6F74
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 16:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6976860A6F74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=msfeHy88;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VmCTHo9P
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFJEH3588583
	for <platform-driver-x86@vger.kernel.org>; Mon, 9 Nov 2026 16:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jn9CEocg2zylizZLlU3oTB1VMEKBAaE2tCfugJNdHSQ=; b=msfeHy88415MBPwc
	L2uACbLQp0TEuRExtyxYzU291teu/v++InscGb4Aaa2Ur6ppwNzx450ymMgkJ6+T
	RsKi8GKr+ln9kS31RG1mwE7HLQ8zS9AkBTfrRvBIp8KaomUIGxjcbXLCcazMAs9t
	IQiA20uJJmBdCDwoT/mRRETRWRxdcF+cGqiUN7XjYq9Siu5kdnHVZgCVgIBcXc5P
	58qz5s4legHs7/U50tGU9KDu+NKv3Ldhtcbc68SZ+oTIE034fBt4Xb7K58F8UT/5
	3l8HcU9tCM+fn3FczPhTZAoOO0DYs/PpWqece//gUUofGWuBUeeGDlkKdyI0H3iv
	EyNxwg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj92x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 16:36:54 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2c5eab8e4so532287137.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 08:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794242213; x=1794847013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jn9CEocg2zylizZLlU3oTB1VMEKBAaE2tCfugJNdHSQ=;
        b=VmCTHo9P3nq14H22L2oDbfLfwhrGPkp6VEnMTESM3QmN9yZkISASKbnip1cDIwJmcc
         sjg76JJOpSNgENcm2bnxlgHCCYD17jZ8hSHQxbjWxfBOo3TGqvvWXmS58SXeicNUhL7x
         cebL495uTS+qGnYPwbRuMekpiBRWnM/L2Md8xhceG6lRu9FD7Jz5kiDhwN7me89cvu45
         b2E+P5y1RA7YjVF8ET8ehxXXsJU47tY57p3LWCWg/zgoOZIwGtdmJw/+8tfypegcOQqY
         fpRVYKeCuNFztub+JQ0Yw09CHcFFWWuCTxG7FUVK55zm7l0hVAZPvvfMb6rNdMut3c2C
         4VSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242213; x=1794847013;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jn9CEocg2zylizZLlU3oTB1VMEKBAaE2tCfugJNdHSQ=;
        b=eVmyi3HMMAJiVEFKVveH30BpZovIRzdvqkD078DNo0I9VJqEJAOO0RaT4oqgzjVujM
         FiXz8STdpijrwJd+ptnF8NLSPciChhG4ewJa/wsDkG+gAqSN6LOU30IxPgVJ4a6ZjwEF
         emFsg6B9E502n1rdBg9IWoTFJft7Q0DsIxddyh/UEY4icYkaiEKxlim8PTWy1/RNaxot
         lNFwiml0/7xC6Bpo5HZQ8VwLGLipav2ypFqjc/F9+KdWQBw6GpPr2OBGGhPklBwOazHU
         RUic71WeU3ye6pXVDzyqcw8TD53F1bwUOHcytM/tEmM4Qz4VaZtRrhYoJCkeJDrnLcw/
         YXmw==
X-Forwarded-Encrypted: i=1; AL+hErEdWyu4ktN2jV3txOGssEFo8T5dnil8Fz/bHH8HQyykyU3FmIRJL8YNjgDnnio86YxOy9AaZe8nUG3q8roW4hnJcM7M@vger.kernel.org
X-Gm-Message-State: APuU4Z+IHnmvJ86T4RHMPS8Y+1EuA8xgIUy781KviCeleZ3SXV+17T6e
	NSxTUzGkRFY4LCJoocIQXqqEn/tKdJKLEU0sYvxWEp0n60fBYDmQ62OpXh3LnJxaxS07RPwSEFK
	ija3ktfh/z/l3YSyaqqi4R6mnoUpxHLqk5NrLNMw6HwdocJDZ3uW+EE4ARDacBlvRH7zECeW0/V
	yQ
X-Gm-Gg: AYBFou09VdgCxAxPmleEDMHznmHa8JKTHMy4kDdmz/f5VjQEY+LZAgPhsfs+l1yxJV1
	GYElxgmdog+xV5Ernnkhew1uxry91BwbCNdq1XLEvHMExxLstRpQrsfc0jINI5aDYy7CiC28Hp+
	5E/1HTlSEyFkieff8jq0QFL6NjZlkXJf1T7VUbkJlPR0HJpGKnsfMsz34BHNhGVQpH9l+cueAuL
	3l3zPQq16qyGrcG7tBNqmH+ys5l7Q73cjF3wG6QQnSft/Sxf4b/QDwkqSNmUvmMIfXR+tv6NpsU
	2mQy3th+b5lO1Uz85YIR61UFYmN4jkkDaCnyTLJrT/ySnDSiz0kwnNTRf6jfP2QU9dMfVN6K+nz
	0ro1kKP0Lqt3laMo8doG4IHqomTVsnjNct+cvWcdP/SbESSweDgJQMlXZIFSiMicqKTKrZzvBCT
	YFgAJaegoAAXt2E24TReEFsvorT3zaTrRjhg==
X-Received: by 2002:a05:6102:390d:b0:7d2:cdcb:6b4a with SMTP id ada2fe7eead31-7d301120897mr5317137.22.1794242213438;
        Mon, 09 Nov 2026 08:36:53 -0800 (PST)
X-Received: by 2002:a05:6102:390d:b0:7d2:cdcb:6b4a with SMTP id ada2fe7eead31-7d301120897mr5297137.22.1794242212750;
        Mon, 09 Nov 2026 08:36:52 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:8ebe:809e:5980:89b4? ([2a05:6e02:1041:c10:8ebe:809e:5980:89b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596f9a9ffsm11476601f8f.30.2026.11.09.08.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:36:51 -0800 (PST)
Message-ID: <ed4aac63-ac58-4e2a-ae45-ebf4da158228@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:36:50 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Make platform profiles firmware independent
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Armin Wolf <W_Armin@gmx.de>, Jai Luthra <jai.luthra@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Wu <jackbb_wu@compal.com>,
        "Mario Limonciello (AMD)"
 <superm1@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8Z4ThWnRk39dIrN3a4Gz3pU221tPMwDp
X-Proofpoint-ORIG-GUID: 8Z4ThWnRk39dIrN3a4Gz3pU221tPMwDp
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1f6a6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=I2DTqkVBWxGU35LqPC4A:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX/hHxzatqTV2/
 z21pHnldl8VUuy9sW27gVUgimc/Yr2EhfQm/zke0bM8yKQvjZNViRNjcRqns6dSfhMJZQvmCbr6
 ZfDlk9UPkwoZ9cOUBMTfZQuGgoGSsCc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX8knOE0Z842Zc
 kQdQXz7hv2V3952vEpstsrD4d1VB+AMQvRkgVsrPupJLAs0BTYbaKIMmnKYSAcVwBb/CYzwjd0L
 8JZQp6aFOtYMfdn2m5hoxE54efTCJvlQ6QL/QmuAMJG8EhrWlGkr/dUF8TsTlh6v5IE/HBr++Wr
 /CROBCLWdRKCqaa3pTpC1FSENnoqs5qow30H9fBm2MehzJMrKI0rb4wmqw2p2tCfz3HxOlEgGjB
 cLuMq98Ig6NqqAsINAD4+JMnYW8m0RDB5uMf+GwCPnWo5WmYfJffJYIYAu51pshX0nG9lklZ0XT
 jdpoyWNiWHQlfCM+1VvPQ3C5CpLidlPxcYRYyJGa77fgdqOpQQ2j4vY18j/G6PwxzQoK8lT9qkl
 JsUY0ryMWTfM/LY5DtjbHEdL/EWKhKR/EdLUTGInau6c18bcwZRmcWZsy5OYsW0wr3dlgvXSJ+g
 sUSQEd6yjzb0wK53SIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090066


Hi,

sashiko validated this series

Is there any other comments for these changes I should take care of ?


On 10/25/26 00:34, Daniel Lezcano wrote:
> Make platform profile selection independent of ACPI firmware.
> 
> The provider API already uses struct device, profile enums and callbacks;
> it does not require an ACPI handle or firmware node. However, the core is
> built under drivers/acpi/, its Kconfig symbol depends implicitly on ACPI,
> and initialization fails when ACPI is disabled, preventing non-ACPI
> providers from using the existing firmware-independent class interface.
> 
> This series moves the core to drivers/platform/profile/ and introduces
> CONFIG_PLATFORM_PROFILE, updating all existing provider selectors. It
> retains the tristate configuration and platform_profile module name.
> Firmware-specific discovery and profile operations remain with providers.
> The core can also be selected directly through its Kconfig prompt.
> 
> An optional ACPI adapter obtains the legacy sysfs kobject and is linked
> into the same module. The generic core contains no ACPI types or symbols
> and initializes without ACPI support or with ACPI disabled at boot.
> The existing /sys/firmware/acpi/platform_profile and
> /sys/firmware/acpi/platform_profile_choices attributes remain available
> on active ACPI systems.
> 
> CONFIG_PLATFORM_PROFILE_LEGACY controls the backwards-compatible aggregate
> sysfs interface. It defaults to enabled to preserve existing userspace.
> Disabling it omits the legacy sysfs callbacks and ACPI adapter while
> retaining class devices and kernel profile cycling. New userspace should
> discover and control individual class devices instead.
> The interface is deprecated, with removal intended after the 2028 LTS
> kernel once userspace migration is complete. A shared pr_notice_once()
> warns on legacy attribute access rather than on merely loading the core.
> The default remains enabled while userspace adopts released class-device
> support; this series does not claim that ecosystem migration is complete.
> 
> The existing firmware-independent interface remains:
> 
>    /sys/class/platform-profile/platform-profile-X/name
>    /sys/class/platform-profile/platform-profile-X/choices
>    /sys/class/platform-profile/platform-profile-X/profile
> 
> Non-ACPI userspace controls providers individually through these class
> devices. Aggregate selection remains available through the legacy ACPI
> attributes, and aggregate profile cycling remains available to kernel
> callers. No new sysfs directory or userspace ABI is introduced.
> 
> The original first patch, "Separate handler locking from sysfs lifetime",
> fixing the handler access race and sysfs teardown locking issue, has been
> sent separately as a standalone v3 fix. It is not included in this series.
> The base tree used here already contains that fix.
> 
> Patch 1 extracts the core and initializes it before built-in consumers.
> Patch 2 completes class-device notifications and registration cleanup.
> Patch 3 documents firmware-independent profile selection through class
> devices. Patch 4 makes the legacy ACPI aggregate sysfs interface optional
> and documents its deprecation.
> 
> Validation performed during development (before this rebase):
> 
>    - ARM64 built-in core with CONFIG_ACPI=n: W=1 build and sparse.
>    - x86 modular core with CONFIG_ACPI=y: W=1 object build and sparse.
>      Both CONFIG_PLATFORM_PROFILE_LEGACY=y and =n are covered.
>    - Full x86 kernel link and QEMU boot with lockdep and list debugging,
>      with active ACPI and with acpi=off.
>    - Firmware-less providers exercising common and hidden choices,
>      profile reads/writes, invalid input, mixed profiles, cycling,
>      partial callback failures and POLLPRI on the class and legacy ACPI
>      interfaces. With acpi=off, class get/set, notifications and kernel
>      cycling are exercised. Both runs check that no new aggregate sysfs
>      directory is created.
>    - Concurrent sysfs I/O with two persistent providers while a third
>      provider is registered and removed 200 times, last-provider attribute
>      removal and repeated provider module reloads.
>    - QEMU with active ACPI and CONFIG_PLATFORM_PROFILE_LEGACY=n: verify
>      the legacy attributes are absent, class get/set and notifications
>      work, and kernel cycling and registration/removal stress pass.
> 
> The provider API and profile names are unchanged. Aggregate writes retain
> their sequential, non-transactional behavior: a failing callback does not
> roll back providers already updated.
> 
> Changes in v3:
>    - Send the original first patch fixing the handler access race and
>      sysfs lifetime locking separately as a standalone v3 fix, including
>      the requested profile_lock protection comment and Fixes tag.
>    - Reduce this series to the four remaining patches and renumber them.
>    - Rebase the remaining changes onto the current base, which already
>      contains the separately submitted locking fix.
> 
> Changes in v2:
>    - Add the Fixes tag to patch 1 and explain how the mutex-guard conversion
>      reintroduced the teardown deadlock previously fixed in 041142d7d252,
>      and how class-device support subsequently extended the affected paths.
>    - Drop the proposed /sys/kernel/platform_profile/ aggregate interface
>      and its ABI documentation. Use the existing firmware-independent
>      /sys/class/platform-profile/platform-profile-X/ devices instead.
>    - Preserve aggregate selection through the legacy ACPI attributes and
>      retain internal aggregation for kernel profile cycling.
>    - Refocus patch 3 on class-device notifications for direct writes and
>      restoring aggregate visibility after failed registration.
>    - Update the Kconfig help and documentation to describe the existing
>      class interface and distinguish it from ACPI aggregate selection.
>    - Revalidate class controls and notifications with acpi=off, legacy
>      aggregation with ACPI active, and the absence of a new aggregate ABI.
>    - Add CONFIG_PLATFORM_PROFILE_LEGACY (default y) to make legacy aggregate
>      sysfs code optional, independently of class devices and kernel cycling.
>    - Mark the legacy ABI deprecated and describe removal after the 2028 LTS
>      kernel, conditional on userspace migration. Emit one shared notice on
>      legacy attribute access; retain the enabled default during migration.
>    - Move the legacy ACPI ABI documentation from testing/ to obsolete/,
>      document the replacement class attributes and update MAINTAINERS.
> 
> Changes in v1:
>    - Initial series extracting the core from ACPI, separating handler
>      locking from sysfs lifetime operations and retaining the legacy ABI.
>    - Proposed a firmware-neutral aggregate sysfs interface alongside the
>      existing per-provider class devices (removed in v2).
> 
> Daniel Lezcano (4):
>    platform profile: Extract the core from ACPI
>    platform profile: Complete class notifications and registration
>      cleanup
>    platform profile: Document firmware-independent profile selection
>    platform profile: Make legacy ACPI aggregate interface optional
> 
>   .../sysfs-platform_profile                    |  12 ++
>   .../ABI/testing/sysfs-class-platform-profile  |   2 +-
>   .../userspace-api/sysfs-platform_profile.rst  |  55 ++++++--
>   MAINTAINERS                                   |   5 +
>   drivers/acpi/Kconfig                          |   3 -
>   drivers/acpi/Makefile                         |   1 -
>   drivers/cpufreq/Kconfig.x86                   |   2 +-
>   drivers/platform/Kconfig                      |  35 +++++
>   drivers/platform/Makefile                     |   2 +
>   drivers/platform/profile/Makefile             |   5 +
>   drivers/platform/profile/acpi.c               |  15 +++
>   .../profile/core.c}                           | 122 ++++++++++++++----
>   drivers/platform/profile/profile.h            |  17 +++
>   drivers/platform/surface/Kconfig              |   6 +-
>   drivers/platform/x86/Kconfig                  |  10 +-
>   drivers/platform/x86/amd/pmf/Kconfig          |   2 +-
>   drivers/platform/x86/dell/Kconfig             |   4 +-
>   drivers/platform/x86/hp/Kconfig               |   2 +-
>   drivers/platform/x86/lenovo/Kconfig           |   6 +-
>   drivers/thermal/intel/int340x_thermal/Kconfig |   2 +-
>   include/linux/platform_profile.h              |   3 +
>   21 files changed, 255 insertions(+), 56 deletions(-)
>   rename Documentation/ABI/{testing => obsolete}/sysfs-platform_profile (70%)
>   create mode 100644 drivers/platform/profile/Makefile
>   create mode 100644 drivers/platform/profile/acpi.c
>   rename drivers/{acpi/platform_profile.c => platform/profile/core.c} (88%)
>   create mode 100644 drivers/platform/profile/profile.h
> 
> 
> base-commit: 8244dc8f69f0e73cb1789355260b7d68bf5494e7

