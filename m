Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593172;
	b=3J+0sxfQvmPKvGeiRMrNvMz6Fbsn/+F+gA19NmJ57W8I7Z0CRGrgF2o4rQi0oFwD9YjK
	 GaMb25MqZW5l/JxxkB4RGljJTiQKMcRhO/qVr8ruYzuieMUKINeuChda/bzDtAesvujAk
	 0fEFgg4PmKPrNTn6gqCWiAAR9nBkO/dVX7Dagz5unUCMSqVhmboKePxuLMddi/sS7TwXS
	 sl4lCDWxbTQwIk4zJMbw5xxj6++JNyJE47HUy+L8ptYVLxHTnK95mvioclVRBwx1LIyrD
	 yoCpikG0iHbX00T+yQO2R9q0KmU3xiXudJQSoVv0HJ7UZsBTTaEn/T0qIp4D625P0yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593172;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AM/NbC4D/S6IZaw9GLu+10DxkxGhyZ5Y2SK3qxYlc1k=;
	b=dSuM0upClcCNPSKsvakO68uTP4s/sYiInvUIuLECySrlvaBxwdiwgEonDlgzuE9yyWUz
	 GDg5iMXz7mum3Wmnp/dq+dGQGcuQcDZ7zkuwqReTXko88WjanXdagZOXbo9IklRA1L1mA
	 VcyoiSmxM4P0LazmV/VioHSQzu7yFkmVF3sSNydQBbMnPbIqgSdytoKz8yrggeldXNs3a
	 72eP2mPMLgbsVPRSlJSUO0qqThUuUj1cQCds5XyuFcqWCPC2x1bs58rP4l74IsdBmCbQt
	 Y883ssTtNXk0bFrm86hPsLd8Hwd/LbzOe6PEwwh2Q+gCbeUmOykvcC+qsz29tsm6deQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoBEpexJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RzUfWia4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507B2606A31B
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 14:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 507B2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoBEpexJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RzUfWia4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFDkf1313695
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 14:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AM/NbC4D/S6IZaw9GLu+10DxkxGhyZ5Y2SK3qxYlc1k=; b=OoBEpexJhcDUokcv
	/oJpmHQE6KvS06+mnpwKXbS/cq9oVcerGhZKgecWB+oN9lSVwSVVaV10XG1g/pKa
	P+0FZEJFZcSk9zd6oqOSNUilJpdMQKM7v1UzbINMwu5+v+/i4C5jf9YWlRy4tXny
	DOAXeCNNT8YbjhxNqTOntZoRZWNLTGx9FQB/V5gM8DQ+fvFMvlavtbBRXWF6HeeD
	SdSjwc9Sgcl8/R2wqRZfCaYCvOaAlTd3Y55fiuYQESJC08A8ahuoLJ8neleSCDLz
	J88mC7sYbgR+y6clgNM9ItDyCt5kCeuWswrDZ1eTqIrcOFvbn8h0qoTaluURL29n
	xD7+IQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs03m7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 14:32:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so90171785a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792593170; x=1793197970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AM/NbC4D/S6IZaw9GLu+10DxkxGhyZ5Y2SK3qxYlc1k=;
        b=RzUfWia4qA7nT1HJcy/RuUX4lmo21XKKgciNyKWslx3rXmwS58A2eXQG3JfJ5tDEbi
         tcy0omQQAQqJX6MhJGf+Qptlpnb2frNgLu8O++qAGcaK0rriStjjUSC1ROvj5j60k2rJ
         JjY75lnsCQkggw/1PAXvkf+2XapaEkqRR6kM+vtxE4Vu6H4KJZn6Ov6BJUx7pmZU2c4W
         moVS4cjeeKbOAQ+s+g2svlHZd13gKiLrk2mEWgEBisqPu1sHma8X1BbvWSrpydBSDL+A
         HyvYup+Pb9S43GboPguMe8I1QnJys7+7bjlaBOTe1AevmUHft9kLr22AglVo5QQ9kwWk
         nYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593170; x=1793197970;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AM/NbC4D/S6IZaw9GLu+10DxkxGhyZ5Y2SK3qxYlc1k=;
        b=fQTZg6ZsBEOqykBrCYAydXOVjfacWt/Tzy6kdTVXVQi2qJKBk/8ZoBGxl1xVPdZHSr
         /PPYPL5x/eGUkFZAE3ICwv4k/CNrFKzS1kr/CToYFU48x1glGW1DkyLIBq5i0hHXMiO5
         YzwTMLUEq0tY5yY9PWH4qxRAzcHvTCfINaadYT7n2InnDur+j6JlOs1h9DlZNA44oT5q
         i7uUkMPXLwfHv5O5CxEyPhsrz8ZfoJlji3WTgSDFvs8eXmg9EpKvscESaAauZaHp5qC1
         /GChv9+rsa8okdrOBNeyHbjlJ00dvqEp/+YwToIyXxu/+5OMCn7kMN7Hw0qEE7uw0fYv
         Su3g==
X-Gm-Message-State: AFq9FYJHOW5s5P8yPOyqwgXX9HHkvf7tvKu0HcniM++k0aEuhs33jZR+
	2TdKKDdzx51RdgeAho3gpiAdji+x4ztJQ76REe4mGaNoZZ0IybRgiHQyVLi2iln6pJQn3jRGHJS
	HeLCv2K4WqDU+JSSzQb+Xzg9JMWEwaCDP8hJ9RUNqd73TSkXOG5MCxEwUopepRn7wpZ2sOPOWXX
	JUxolBp3gM
X-Gm-Gg: AYBFou0OhKTgMK2RKKVyXwIl2uiYcIwY8fCzhAilNnsbHhptJO0W9b8TSLE/9GTIHvF
	g2PBvar26k0ugi74a6WanAgLu845uo2JLMrCBkvHTI6igFT2brEwlDo9YuYPS0qdyoGpkqNZ/Xz
	kYlrgnIVcDwNzMhO5Ht2K2y3GGHGt59H0ZzCnVp5SGJKeRv09XKGo1JmGwk7XtBQfWi+s+2PdNN
	ERJ2mf+GAccjlJTC4j5tFxn3ehSI/g6gLGsnj8O69z9e1RTm0I4x1ONj4rJfKT4waC4RS2NZodQ
	ZlvEtXF7kj5eC0OMBmZlrInOtvbf790NxGWsGLm1cscHiAblllkBSYWYxwRQj/ek+UNUMgl8fCX
	+u5P9YZ9cCzssszahggScYoRgGIAdPsOLyb7KlDJhnvfsZl97oxWpRrrgds8EPH0VWGObjgX0Gn
	e6N5aUkzrylbMHf4RwFpBDsKPm35S9+v2xx5jQLqS24CFZacwMQi854tz2e59IgvGWCw==
X-Received: by 2002:a05:620a:1711:b0:93e:f9ba:68fc with SMTP id af79cd13be357-93f57f65f39mr488312285a.21.1792593170248;
        Wed, 21 Oct 2026 07:32:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1711:b0:93e:f9ba:68fc with SMTP id af79cd13be357-93f57f65f39mr488305585a.21.1792593169636;
        Wed, 21 Oct 2026 07:32:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f2981sm10594866b.10.2026.10.21.07.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:32:48 -0700 (PDT)
Message-ID: <2711274a-94f1-445c-9f8c-ef4bcc5987f4@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:32:48 +0200
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
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] platform/x86: int3472: Fix AVDD and add DOVDD +
 DVDD mappings
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20261020142243.25072-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261020142243.25072-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8cd13 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=BrVY_DFHyF5R_7dy03IA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX4ACW7PqV2+U8
 sOOogML+J2P23GcotHOx6SKD+W7DfbDMyz0llDFSNLA7/aIyB6bVl8zzvbtP/SuPwwYalhvvSVg
 BIMItzqMESf+l5Id4gQR2glE339UIZMZViZHFgtihI/d8UyvvtIATKW9Kk0Cx57/xyHyTT1RTVf
 +/V/6idkB6xc5st0h5WELHx3F5Ky1tYAMqVwhm7kMsNSRUmzNRuAx5DvxuPrH/QgI3h5JkUojO1
 aNwi81b4Xv4raEUDWp7rwx+BXZ7k308KS7oBLEwdE59kGIRwWhRQNnU6/88j0EP5AddBeMkgS4h
 ezS7M0J2PUZuLyq0bYf2bBdVAKr+Vq4Hghqwa9FTzS2HNEcfBhbC/HknI9gluhB3fTCpgN6UX5e
 L4DaQzp2+oNdSiUnw/krMo50M4ygV6TaH0XkUhVzb7ztsLmP3nniflNbMf8mxv629QuCdh6VLoi
 XzXPICOMnnB5WyBkHAQ==
X-Proofpoint-ORIG-GUID: D8ZZAya89GYTH_1C5l7cl2QwGCi845bj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX/KRyFQWGTEXE
 mbeetnSAnB4+P/m8iIillRcNrgcoVAFVdDdJ5zBC0aFrlz3Ygc9PuMtszcYqrAKhTzuLpPzuG8l
 z7X2Kc+qQ4sWgcdpaVzY3r3zM8l6UfQ=
X-Proofpoint-GUID: D8ZZAya89GYTH_1C5l7cl2QwGCi845bj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

HI,

On 20-Oct-26 16:22, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of the patch-set to sort out the problems with the Linux INT3472
> code mapping the 0x10 GPIO type which is meant for AVDD to DOVDD.
> 
> This should allow the OV5678 front camera of the Lenovo Yoga Duet 7 13ITL6
> to properly get powered-on by Linux, without breaking any existing setups.
> 
> See "[PATCH 5/5] platform/x86: int3472: Properly map the AVDD GPIO type to
> a "avdd" regulator" for more details on this. The other patches are pretty
> trivial prep patches.
> 
> Note this series is ordered so that if [PATCH 5/5] somehow does cause
> regressions it can be easily reverted without needing to revert any of
> the other changes (which should all be safe).
> 
> Changes in v2:
> - Fix #include-s sorting in ov05c10 patch
> - Collect various Reviewed-by tags

I forgot to collect Alexander's Tested-by tag from v1,

From Alexander for the series:

Tested-by: Alexander Patrakov <patrakov@gmail.com>

Regards,
 
Hans




> Hans de Goede (5):
>   media: ov05c10: Support full range of power rails
>   platform/x86: int3472: Rename DOVDD GPIO type to AVDD
>   platform/x86: int3472: Add support for DOVDD and DVDD GPIO types
>   platform/x86: int3472: Rename avdd_second_sensor to
>     power_enable_second_sensor
>   platform/x86: int3472: Properly map the AVDD GPIO type to a "avdd"
>     regulator
> 
>  drivers/media/i2c/ov05c10.c                   | 32 +++++++++++++------
>  drivers/platform/x86/intel/int3472/discrete.c | 16 ++++++++--
>  .../x86/intel/int3472/discrete_quirks.c       |  2 +-
>  include/linux/platform_data/x86/int3472.h     |  8 +++--
>  4 files changed, 43 insertions(+), 15 deletions(-)
> 

