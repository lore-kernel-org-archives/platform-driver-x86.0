Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950827;
	b=HlJ3dtlcckPSXBwqYzXfc0BVcDq7HMwS/7H6LWpFSqRngADQPWLFwAQ17nIGZUTU/ZES
	 YukFXs/4lGHaKy7dFwu4gRsprf7lJy1TJfsqpCkKoH7GrX5PqNuV6LDAR6u9y7SuF0DcD
	 4bnfzxoirqpIxjj7KrNL4fm2x2mkigPm2DfLTl8z0TX8FTUbvSA8W7E6ckCqYEvLOrWFq
	 yGfy0rkLdWqpbW7kmB57x0qO71VJg6rrpRNfAw/sqFQ5yPuQAP2WgFYhnjvUTfvKX/4Fn
	 bEf+Sdl42cjp7M76eoa3oUGC53z04xui9GQPQ3n9u/TrcgJRdrGq5j7W8/XYRFsg79A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kye5UCFhAlBn+MOXhNz9A2crB6ZLISzlyY8FztGTBT4=;
	b=mwzLEPiISnwQMWCbpOQYicBPZAwIpa06X8tz+s95iEWkO0rvOHwqfxcYg+YlA90FkqxV
	 d2jeEwpWbCE0NXO5JtPLlnGiYCNPCepK2tmnlHnfT5LQu/rShWe7Is8oZ1SFnF0+rP5Hu
	 0fz5IltMOxYFzTRX9LMO9LE9+i/nxp9wKpq4wd86OXIqCUTjD7UmvN8fsT1qEQOBXwDJN
	 oCroF574qv0yaKiGmY5rMTVEjfILFAnnfFdCqHbjC0ErbJiv/MFGyOA4nFgzMdPXIDsfE
	 UhjW/LT0fzqIxjrRzxpbvUoR6kLFllwt2eBoCnHqosAZS4V5MTxeoFbWeBy4yMQo2PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mzqgtgXh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e7DlLGgo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C5C606A331
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 21:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8C5C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mzqgtgXh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e7DlLGgo
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHKf5PY1206307
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 21:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kye5UCFhAlBn+MOXhNz9A2crB6ZLISzlyY8FztGTBT4=; b=mzqgtgXh+8LtF9DP
	EF0D5lQ3qW7+qC4zKERMkCrEqQKmpFz7ZEkgFGX0pLrxYz4k5h5anxYY9Onv61IE
	O1yMYDU1dsuOf8EYLIbQOULw30htv2ksBapiCniOlj94uWXKiuCASqeiFc+S0iB0
	FAB8aEH4H6t2nYg4QMG8Bo/mkt4Q66kEFW5/u+ZpWXvwAWMdE3clhQCYU30/v4go
	qWBbGFQcMMSxgnA21BKrCrfv+0MDmRyi2mwGpho99EsGgOkEKCcdOPyHMK+jYRJi
	zYnTb/YGV4smLo2nlgjPYYC7vdMeSlwbTR8GaxBQxN9ub4NiPvdpCVgD6qCSoMz4
	e3ngwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0tbu9apq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 21:27:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94967c6d4f4so44126085a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 13:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794950825; x=1795555625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kye5UCFhAlBn+MOXhNz9A2crB6ZLISzlyY8FztGTBT4=;
        b=e7DlLGgobmR+QOKQq0e8FgMxDMyehtVrveDPjc354olS0UaDAZob/9BBxgU5awPfR1
         oPT7ne2R6527xtV6/dwrBUJJoGV97Y2Aeqeaol8BMf/OOlxk4/3JRuZ4MpiVi8bIbnKl
         C8jAbTR4vm6OESSOGToRkDqOdt7imZ50tlNkOx0vSr/XqmL2SAlk8E03tRgsFODu7gTR
         qGbk8W7DpBKJaJ/pYeu3dkNnKQHsSXNlk6xtljgRuoEm2lwUSxhLVUK6nQGMczIBgnCs
         gxEsEYOf7snZz8tqg7cHPx2BirG4xlYNYmbCuz/yGPKHPw++agQu1zQ908YYfUn5h4WP
         fzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950825; x=1795555625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kye5UCFhAlBn+MOXhNz9A2crB6ZLISzlyY8FztGTBT4=;
        b=H4UHL1gdgjIVLTVBkkGkjqd8gjd1oTIJrkzPDYklY1SJDHrGfq6bVC+vv5m+2QDn53
         lr7XYg53p9SDmtFc+poEWI7mfhBs5V/5SdXwGu3FhQKh3/eClzW1mns7Rf4pkGH8cYgN
         mjGfYDlqMPe6d8Pzy5wS6e2R99aBNhmkAhAMlAylitezAV5IH5v3pNXjPfAIAdxoGcZq
         Y/8rrymKapcXrwlrDurcPx7qVof/akVYqvdWFx9Wfx6WBKXKswZoLJvL7LMCwjLt25PR
         76Qd1vbBRb/7vGFolOffP5qiB2DZAKef+rDrM1vF59xWb02vHIlZ6Z1AOF2NjhsrU5Ej
         SejQ==
X-Forwarded-Encrypted: i=1; AL+hErGbjVLYTh8t48NeQ5zCmB0yKWA04wr5WLzIV02qdxqn7HskkPE0cGFOlZhfMeoc6iNHdV4SDac5hoxgHwa1dg9mkNkc@vger.kernel.org
X-Gm-Message-State: APuU4Z/gekHrcI3DynA5WiVapRU8OCXxum4loIaQpK7VBbw817Crgq5/
	V+AgqVoENwTdMUDECLlbiQ6N/LshfhvYskBZ6KPj72aUcfejD72YCTJitxm5zFuvCV8m62kd5/P
	4MnVvpzQjeeIZ0TTfIcSsf0aVJ5XIvNYbn1FLlv81WYsXpjy0qZMhynoumluRNg5hQOOV6+lubb
	VX
X-Gm-Gg: AYBFou3iXhWJxPGK1aoI7ZFALj1b9+CcrhITajeqUPVzhg2/VBZy5a6EbBCXGZQgA78
	f/GsmVtaHIU5O0vakqJGl3DcMP865VJi0zLsv3kX6ZPvfPvxF6MT8opnHFYHDSCddWMwCwcfGqX
	zlTQfb56D3E+xvWtQMKJre5TKgqhDSNkPWMCn5c/vfrsduh9w8Xo0wrcZ3yr/qva0oHa0vgMZfD
	2pBusiDiN+2KtwbfoW3azfK1xWrK/txw2EvMEColPTK5fRWyhj3lK+6mpzH+bEJkcOWBwWsqHaf
	kIoR9GjAs+3xRYH9ARVVmSnV2xKPjesjcGNcO6Osv0WAGRbEZalipQEQNhWewFHAweNkft7BwtD
	XpT53aX31fz4yafuMrzIjLJNSp+SBSOnxmF+phsycKBsqJhSJc1nXZvgUU8576wPK2WvWXalrcb
	8Du/0Mg7uclnfm+0rTge12WnJmb0OEdBQ6QAg=
X-Received: by 2002:a05:620a:8014:b0:949:78dc:f90c with SMTP id af79cd13be357-9499960aefamr136052585a.60.1794950824641;
        Tue, 17 Nov 2026 13:27:04 -0800 (PST)
X-Received: by 2002:a05:620a:8014:b0:949:78dc:f90c with SMTP id af79cd13be357-9499960aefamr136047485a.60.1794950824084;
        Tue, 17 Nov 2026 13:27:04 -0800 (PST)
Received: from ?IPV6:2a0d:e487:16f:e583:d876:5ec1:ccc:7949? ([2a0d:e487:16f:e583:d876:5ec1:ccc:7949])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm104139015e9.1.2026.11.17.13.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:27:03 -0800 (PST)
Message-ID: <4f9abffd-1794-4564-a752-60f99ccccb4e@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 22:26:58 +0100
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
Subject: Re: [PATCH v3 1/4] platform profile: Extract the core from ACPI
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Len Brown <lenb@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Viresh Kumar
 <viresh.kumar@linaro.org>,
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
        linux-acpi@vger.kernel.org,
        "open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Linux PM mailing list <linux-pm@vger.kernel.org>,
        PDx86 <platform-driver-x86@vger.kernel.org>
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
 <20261024223501.1420953-2-daniel.lezcano@oss.qualcomm.com>
 <CAMuHMdXJOpcC3a6wMXF_m=uNjuqSO1Z3kyM7Az1uP_2GBurOvA@mail.gmail.com>
 <0de1444a-a0ba-4e16-a480-74a39c865ab6@oss.qualcomm.com>
 <CAMuHMdWfH+_4ijxko=LS_P6b1Y76WWDc8m4xL6qW1H+qKRQ98A@mail.gmail.com>
 <CAB9z6xC4c=o1DwVARBek7ozDxaCON9rpwTmJ810sDGyP0XYQDA@mail.gmail.com>
 <CAJZ5v0jg61_W6hgtMzKdMa+f27ApaNunnpkzM0MoYxN+aV-xog@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0jg61_W6hgtMzKdMa+f27ApaNunnpkzM0MoYxN+aV-xog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4NSBTYWx0ZWRfX4GJk3I5oJzsp
 m06W/nVmA+ONcklMy8BvpiuMraQAwIu3WkFXlAaGqTlhyilOvS1prx16svK9Mm99uujEBqi22az
 7yuPBGDw5ZfUOmvp9u+thI/YZ3TgjYQPlR+wdjrU3FVCy3R5gQr2rew4Cgvi22lkmwJd7yisScN
 Oy/fqlVv13yBarMszb+ZbMKND6PHN3eOiER8TVgjxefGGtYbQPxv0mHQp2nKSx1cSavxb23UYbN
 6bIo/Fxc3DqG9kdOoJAq4VFiz2MRSJTYHe9WFLlB57W6tAkKAc3A2zDSLwGhSnsZpF84ki9jqpC
 jJ0M6/IOWrbCsaRpC7QBEptCOVJV5KrVC3DEbOgA6GNwH1DfSzkLL2b7fxCSTu0ureMBtzlhQBC
 QH7hTr0JhNjMf1taRnIzaqZ8V4gK53cnHCUVhqgFfmngEt68beV0/cyOYzcmyZGRfdA+IFsiZMC
 g891BxMzWHJrsKubStg==
X-Proofpoint-GUID: PuoGGi7m47L08ntb8j6zbbdDBKpdP8CN
X-Authority-Analysis: v=2.4 cv=FeOiV5+6 c=1 sm=1 tr=0 ts=6afcc6a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1nFPZZerRWjXyXi6724A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: PuoGGi7m47L08ntb8j6zbbdDBKpdP8CN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4NSBTYWx0ZWRfX8bbeoXiW5SF0
 l3egd2r8jBqd7SA3jhrHsJJDryYrxvXbMHs/uYW91582bEGqb1FUA6b2+iRVcBVhFvv74OLNwWK
 OiaH7d2KK55Ann+GGAx5kk5lHnfef0E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170085

On 11/17/26 21:22, Rafael J. Wysocki (Intel) wrote:
> On Tue, Nov 17, 2026 at 7:27 PM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:

[ ... ]

>>> Sure... Are there any users of it on these architectures?
>>
>>
>> ARM64 is about to (patches are cooked)
> 
> Geert has a point though.  There are arches that don't need to see this at all.
> 
> You can add ARM64 to the list while adding support for this to it.
> 
>> Others IDK
> 
> Well, exactly.

Ok, I will send a patch to depend on x86 and COMPILE_TESt
