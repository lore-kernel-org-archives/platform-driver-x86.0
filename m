Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486245;
	b=ieICK0rH5060pA8ua1SDVokUtVUYDMxppA/BrUOKESryrhZJ9HWNYXFv4iXdpVozbev4
	 qXC8A36AovKcnEWzLudAJowWEP2RPiVPomGDYoYH8Nh6fU+rUBrNliXC13Pvc2yV9u7PD
	 PmFhosFGFEjZDCEScAKz1a1ZIiHOXpJOJ+pRVZji0NSNvh0TsDtaS+F+k3Jm06EGuY/um
	 i89aGEdBw1rIg0Szhe8ItQ2QZ8exe6qX3C7sdca11+N66MPDoVvid1Xug5uRSqIIGDjku
	 cOAWIZIJh8nOXt1kQO/AMEthsWdThKrDo0rFprRpIZPUkBYo5q/lBgrfJo74wy0oQCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0k3/SQcwL9hW/Zl7iQWhHjXEYHWrKstA04jHEI5oZUs=;
	b=XTmFYun7n2OA0kB+7Ho96RYU5w2cGrdvVDJ++9t+eD0xinGgbP/tBbpDeAF3+vISxm42
	 eKpGjz5rQ2L9nxEOWjTl3do0wOrSMNtVVHDpD9riX+NhDx8JDTK/Lw2zgnYyA9ET3zgjA
	 7WwTZpEFroWKXXVD8+yazy+FnHHZAtQgOMFDv75qBNXfSvoxwVxuOkm5Nw3BJMQhglIWx
	 5ulgFDmWMQThr/dA9CwtQXSBLT7VHMSiTNdCSQMg6Dorr5FjXlYQJUKVNXy4T+TLo4rYU
	 3MLgUe1kIRgxLw8doNVHPpsYEOt21H1tDoGJoGercj2uGSEXNcApZ2SV6Z101nY0g7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KkmcOBHf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ARTGMDhX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620CE606A321
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 12:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 620CE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KkmcOBHf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ARTGMDhX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9E0ZG480143
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 12:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0k3/SQcwL9hW/Zl7iQWhHjXEYHWrKstA04jHEI5oZUs=; b=KkmcOBHf79jShrul
	H2EqW/ZrJ50XOHWwwifpXQ0TCJLYKzlC/vFsfnf3C4lLtqxGzT9oC158GqlDpUWx
	KFGDOCnGwgnAsXIXsI6+P2uHFBdJVuIGwk8fnjTmGOy4p9TxBDiCM7u1kAcqIcfA
	5gg27XA2hxK0KC5Gska/BLxLkvhnLECkeYpmAmjUi2eY1yGZOOKCpvOxVI+uinL/
	T/SQBHjQDO30bYig+i6EnCMxIZNoNxsNIOAWcTyoOxe3PCwgMjVab9jHU8wR+U0u
	8lCw1g0X2Er9ZwsB5ErDEl0fdKAlcwhV5YByiBSJ8X57ME2hol5wW1pIbS9Q6Khi
	tFxLxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4rm4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 12:24:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so40835085a.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 04:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794486243; x=1795091043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0k3/SQcwL9hW/Zl7iQWhHjXEYHWrKstA04jHEI5oZUs=;
        b=ARTGMDhXgPfvEwafXG8ZmcrQMTrPYGM1fQe2Foq5W7Loy2Oc4ELX1/osFES6zQhCK7
         bTbhq3uWo8o2t6tjV4xMjGH3g030lH+R3g4+F//JFiRxaI7nYe5KtlUnE7I334wciTBD
         Or+CIqYl1+Csrdjp/7DyrWATqoet28MyUdPT5Jb+bs8DlKcVuqBoL9TzeOhI0qNYIXCL
         IWNplRjKyI5Zc8BSwN01Vm070x7p1V0P+bcJleu2jao9EQCzqL7GOM3SY5r7DGWz44st
         Wn53gZjkR3pY+u9+6q70XeOlum+zL+8MBhruySD5GG3KZOKcgCHqPIo+P4aKt7bFRfux
         a1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486243; x=1795091043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0k3/SQcwL9hW/Zl7iQWhHjXEYHWrKstA04jHEI5oZUs=;
        b=N318GBG+skFagS5qs3QgChVIOXk6IvlKvU3yyFBtVQFX/Zp6l+6JeSGybxNmMJUlKG
         uDa5TQfrUOMveCZmGtFQzIg5SrO4Y0dxp/2c37+ouBlPZGHxMpgja9IV7Z9qCzzv77x7
         6MmNpZtqS2rUmDIkkz4+tSk75EqnbL5WJcselcYPD/iRsYa3HO7C1938md9N0ywKBz/L
         7G4gE+c6zSvoxpl390lFz7OwCE+EBtbCMe55HarzvwbuQ/kPw+bCer3C0ix/2/bWcDLV
         ZffXDX7LuDuvOrNSwjMytVtNeWr2qHeYGiRWvb9K1ahdbH9X7Sqv+8p5qntpTaJ7dnwt
         58UA==
X-Gm-Message-State: APuU4Z9ABy71oJhSJ2wIyJzkPOObaivoiShEsY87SadyBGNMaCbt6LOO
	Syl8eQaW8nHW8KrSpiMeNkIRgwHiA41VyC8MMobxk1X85LGB1AvgIauN6Rl0jChhOoZ2R1vKyEl
	umgG8ezfBGN1o+YMBv5mf5pUXIwX0/gSFAfjmwTDu7PuaXdW4dw46GGvgqLvSrEEdAQAlb4682/
	ZJvENOWo2g
X-Gm-Gg: AYBFou3308ly902ZD2tzIF1NDMcjKsrVKUUz9j8q/xOMRMvjhUHjR4VC75vJfIwIDAt
	6XzdHUbXFce94DtaHix7mufZqRmThD93i5/v3qWomCOV8DX2KSEavgL+CrrsounRCLg++ICXXyy
	TMBaAolwNu+hLd4fAAsVWfYobOckIpBknNVnhdA8eHwEpdDz8s8qAWiS4CwAEW7FxIrCSz9stdE
	N0y/TNaAMFX5Fkg32iJV82JqsMyGscr0VD7BUv7OwLU/OZFb/D1viyCnNv6toP/0gJHpCD0vYG/
	TTsr74h8GNw6ZTuN18oWIRuiCLpGJFn8ox5SyCUg76hcU5wI3HYY1Ipi7BwYQ3c6rR1xegVOWYn
	Ut41NuFySY3yRAdhty1hkg/fMN4ItLCnzVHkTvWpwt8tg09/3gTyA6VAbckxOeEQkWX7pCHI=
X-Received: by 2002:a05:620a:a8db:10b0:939:8148:1e3d with SMTP id af79cd13be357-947afbb28ddmr880862885a.2.1794486243607;
        Thu, 12 Nov 2026 04:24:03 -0800 (PST)
X-Received: by 2002:a05:620a:a8db:10b0:939:8148:1e3d with SMTP id af79cd13be357-947afbb28ddmr880859485a.2.1794486243186;
        Thu, 12 Nov 2026 04:24:03 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a6930sm334003466b.5.2026.11.12.04.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 04:24:02 -0800 (PST)
Message-ID: <444934fd-f094-4c46-b7bd-6bba62456dbd@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 13:24:00 +0100
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
Subject: Re: [PATCH v2] surface: aggregator: propagate -EPROBE_DEFER from
 ssam_irq_setup()
To: Wu Enqiang <janussss@163.com>, luzmaximilian@gmail.com
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
        chris@nilk.net, stable@vger.kernel.org
References: <20261003044844.63157-1-janussss@163.com>
 <20261024054921.48209-1-janussss@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024054921.48209-1-janussss@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MhQhJE1edGKgOMC6q-h4wfcgn4SzRVR7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0OSBTYWx0ZWRfXxD+GMycYaF6e
 QHxRbQfmFA5e3EXHmQg3yaLMKRgmcO4Q8/wiY+NwjTGvGJXRq0RP+Z6R/7jk7YgdOKTr50WFn+6
 bJ0qZ7lLvCopU9//0p4zvaS7oV2Qoro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0OSBTYWx0ZWRfXwGTdPbECYCk0
 n2K1EtttmM/ib0osQ6NP8/avwLHWSdQp/CzQJnThup3UQnYNFfXgUQK7IWOzlJSv7+6gSEvBhxy
 fkIHJMzeMgaBwoNZlpFex6U05W1miJe594rGc0C2qssn60QzM/9rBK1lpBfZqiUaWeHRpf9LFaf
 1enm0GaUOOQjg09PptrF1yHZqjllI3Wo81jDwx9u0R9uPreaPKQJInGpqJq0LLaetsfkD8nuXxD
 nlthlFyWZNsZMCsJp33FDND5+lLDqReiB827HGUjnT4o+tm+P+VJliUpE3Zpvir+rgMdZ6KB8se
 HkTiMylwhLdyS+SCFSca8lWemW/+8xO7i8n+QNIdONCr5/DQvTe3qr5UrsS/s5TKDpTj61Lg5ia
 T+rxGObhOkNkOU/uyFHfa254oGob7BgwbQGHt+3WEWa+onNgXnLTCt+fdZoMacwjiGycsRai1aN
 qM7wvD9ZGZJZOtLIJ1g==
X-Proofpoint-ORIG-GUID: MhQhJE1edGKgOMC6q-h4wfcgn4SzRVR7
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af5afe4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=LbjcC2kGAAAA:8 a=NEAV23lmAAAA:8 a=Byx-y9mGAAAA:8
 a=EUspDBNiAAAA:8 a=dV-cC-vd_xqL0F_XgbAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=wkD_FXWuM03SqqimxJpr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120049

On 10/24/26 7:49 AM, Wu Enqiang wrote:
> gpiod_get() can fail with -EPROBE_DEFER when the GPIO controller
> providing the "ssam_wakeup-int" GPIO has not been probed yet. The
> current error path falls back to fwnode_irq_get(), which returns
> -EINVAL because this device only declares GPIO resources. The probe
> then fails hard and is never retried.
> 
> This has been reported across various Surface devices since v6.12,
> including the Pro 6 and Pro 9 that were used to reproduce it. With
> the SSAM controller down, dependent ACPI devices, e.g. the battery
> with its _DEP on the SAN node, are never enumerated and battery
> status is missing.
> 
> Use gpiod_get_optional() and propagate errors to the caller so that
> probing is deferred until the GPIO controller becomes available. Only
> when no wakeup GPIO is described at all, fall back to fwnode_irq_get().
> 
> Fixes: b27622f13172 ("platform/surface: Add OF support")
> Reported-by: Chris Simpson <chris@nilk.net>
> Link: https://lore.kernel.org/platform-driver-x86/d0bb21cc-6d3c-4526-8204-2511da51a6ac@nilk.net
> Link: https://github.com/linux-surface/linux-surface/issues/2219
> Tested-by: Chris Simpson <chris@nilk.net>
> Tested-by: Wu Enqiang <janussss@163.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Wu Enqiang <janussss@163.com>
> ---

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Surface Laptop 7 (Qualcomm)

Konrad
