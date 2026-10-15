Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AECC4A1DE4
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 07:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048264; cv=none; b=NgwKrSkeOavbfyBDxnS9DtYkHUuWv9p/u9yGI5TNNGQAFzQpwRZ7G5P8sRWAsPwuK569TBAIncogIBfDLL37bAi1aT/9wIvMqEdENIa4xyTrFBWGext4A0oP70LriIEvjTgqd4DugMO8/mXv/PlIQMQng1iFxl0pVWwgSnpoFIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048264; c=relaxed/simple;
	bh=xy/pbJv5rk0AZgE0MAUUcXJlIE2Ibp6hOh9B6SVt5N4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=osvEDxzd4v7sXLz3ywZ49FVIlx6DsF9RbxfgvbKl3y+2PO29wc85d/VIMq4C+1cXpIEoh5fyCUz91aohl40FQH8gDQx8wUHwvcsv/PIiclJ9HGdHYcHsdl7B7CghOBzrjZAFTVVkVbmLEpNUFoO1jWKLKd4KNI7a/ARNwYwFIy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Do+45MFE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eT8rgjpL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Do+45MFE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eT8rgjpL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1Pnef3468853
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 07:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CqdmAbJsWzaNsPsG0T6wcp7j81AciEH3O1LUc2xXTBo=; b=Do+45MFEVGkoS9x9
	t81Mq7WUK1m13qgQihjztuztYBlk1r9cHtrWGBm39Gun+br75kuNpQ6GbnF7yaXY
	qrskbdXlZdPoYwvjJyfm3WH6SCOoPpr34D02AZQM+035blR7hUVJ9eiZd82rJxnA
	onUU8jCrXii0fqjzEWrdYl7+Sm7mrrloFL6MdYOV/bbPpBDYSpW3LAiMKtMvSGlG
	dlCrDjOSpRjDjbOtJ3LWVidLZHmJbyWN01JvWjlbQMbzdhXuZAVi525ORoeBsXpD
	hSSa0M/oJnfRiifVUh+ulvChU0EG84NgSclt3lmbnLYC7Qr1vzsybI0dnDvA9zvu
	W8nWsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7awnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 07:10:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca9b53afaso1360998285a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 00:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048253; x=1792653053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqdmAbJsWzaNsPsG0T6wcp7j81AciEH3O1LUc2xXTBo=;
        b=eT8rgjpLpQnd8oiqazHJ51xhiwt1eO58dzph7t1Locp2+t/4lqqxQLayaAawupp0o0
         k+a9RQAn1SNR2DPfc4zxpcCUQjBB2cHwMQ8/FzaMU5dhDv6PTGA359xoSfRrhcHHOkB/
         mi052PJnluqmlNY0y0mAraaTh/mGczPnak+z/TuVBk/Uff0x34PwMANRaKisC2+qhU5S
         uM1lY+xUmoWVVhFWh4Ta1Lo2OKoX+Mm5UovyVHcH52Y2nh+dSAVDO/hbM8KNZBmqbnit
         yxL6H3v2BG8bp9ej0HMHa5Zwuw5XL75uhk5UkTNZjDbiceZ3XAcRf/fwVQcle4k23Olg
         MsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048253; x=1792653053;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CqdmAbJsWzaNsPsG0T6wcp7j81AciEH3O1LUc2xXTBo=;
        b=GBYjwaJtDOcjnHl1Vx0gn6IKH+SM55naWbU7rUnD6KzBVN3fT2CLRxnjf2kXzyID5S
         vj9KwdX+RpGPgnrDhA3NEfBri5kW4IzG5L8AF8c/Z3MDG63Qi5vh5K6//j5uaDt6Ocfp
         BhD1t5wGuFcMZfMLn8viMM5zxEnJW8TcGDR5xnwNwAqDvEo+fg7Bn5ZrjDc4prlGWaUM
         oT/M/WCdpCs83/hRWF/s1Qz5reX+QdEE1ucsTqy6g112A0RMOxp8kZZUHLQR6GOfCxi1
         Fkn8zgjI2caobLg612h0avszyj4szEpEW31F4EUpuZQm4ovWgrpJelOJXLXtGczU1bn1
         buiQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ6db4RWUpHebCvENxGT2U8KPZnsfmCb9R/1oGMo4jlKacQDA+Fq4nwN0YfSqRPI80/WPg6HL1cIJIrbzI2P2xE1dV@vger.kernel.org
X-Gm-Message-State: AFq9FYIAFyX6mu6zh4BO97qZXy43GUoiGkcFM9Svj0tXMo8A/BqnOofc
	LF4nO1YSQcuH4T0YxhbKcR/VO/YpiWlsEC+1iaAifcRiPkd0T+JtE57dBiqRy6KKLWBuri/iWoV
	UUBrGpnK9UaJKrEOT9miTwq6cp9rG/ByciA38yE81j7XgosQRh7yFeBJ/MxMqxCe44XUAPCGj0s
	5r
X-Gm-Gg: AYBFou1OSDlVPjCz9Y2OOsMeC26jc1jmLPG4dZv5OOrgrGOuaVETuRoemhkvqh8Mj/Q
	dzGKka1ICsvMWTM6h3m1A5tA5gRqm+t3g+Bg1/pfvOT+cOyzttzWJRuA74uuKokbbdhX9eP/d01
	+/l5OKrWYrXip9gouk86arN7fRV016KV/bpdnyPlLxdDVsVDakw5eGPr1gUUPI/YazHOjwmH7Ni
	badFzly7yT/4YMtuGUgu1uFvjYA11qijGvHG9cxgXdUGLRVZEg9GoBPT8rXsZrwTDIEmv7H9KBV
	zFV5qnP0uB2TOwdN2NpOXo+dWeio6bwMwG6Xln4egqFbvZnRXZHENtnZS68f2ikTfbFdnuhX4y7
	SPEvBZRNOBiafybr2cPFrIa4PhYaZnr+IiwtrIodSkbBGaYi8UoX7fOFXchhvng==
X-Received: by 2002:a05:620a:1b87:b0:93e:6c02:d173 with SMTP id af79cd13be357-93ebd26f427mr3142071485a.46.1792048252861;
        Thu, 15 Oct 2026 00:10:52 -0700 (PDT)
X-Received: by 2002:a05:620a:1b87:b0:93e:6c02:d173 with SMTP id af79cd13be357-93ebd26f427mr3142068885a.46.1792048252403;
        Thu, 15 Oct 2026 00:10:52 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdbace19sm49809535e9.14.2026.10.15.00.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:10:50 -0700 (PDT)
Message-ID: <0ca8681e-8402-4540-8635-9a98140b8243@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 09:10:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] platform/arm64: lenovo-thinkpad-t14s: Adjust thermal
 trip with platform profile
To: Kurt Borja <kuurtb@gmail.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Hans de Goede <hansg@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Cc: sre@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, stephan.gerhold@linaro.org
References: <20261001181917.9367-1-daniel.lezcano@oss.qualcomm.com>
 <1eb6d74f-28c7-8f0a-4001-dfe717196836@linux.intel.com>
 <36418d4e-ba34-4c31-b676-1e636cfb8a7a@oss.qualcomm.com>
 <DM55HM3TYCHT.1F7FX19ORJPG@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <DM55HM3TYCHT.1F7FX19ORJPG@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad07c7f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5Kx5z0Epgnzjo5jacSQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0Cy4QCBSkt9ENgnCoLKwMrSUwldFTAno
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXyLLXbwHsypLU
 /Efkz/rAKt4ZLjDBEWQRq+qZIMSIK8d1e2PMfYBc6wtRLSIj5e1WpqK6Lqr4tt2+QiEKJMk0Vci
 c1/LczRsJtH8Gt+TIBx7zlBBDghPKU/daDIKLf8wgt3mavVBVuUYy9aKJcxap9IIs8jp1onj4fI
 eun64N/5BdRzK2NSx6oohRWma1LZYW4IKIQ6Kpy6sHJvN8fdTVpw1XJupqEE+X3tNVFAJTAZ4rF
 Odj0yF8tB7nff+f0YofKnSBk2zF4yHGg7FPRnUNHc/urJtBQyTqyP5z9GbrLlw+cWXJ5jMnZkc+
 a80xFbAFkR9bNjAjaQCi79e4fzbSdiac0nhcqQ94s0aLDSnD9rn0EM+TjgjDQ/gm1HKc7h51fsA
 dhKa7bBOs75/vax3PgurRPbSFDrczmyqLjgNq/A1uKVbNUE8Muad2xr5cgCHVT3NkVB62FUmTio
 CJfWoT/nB0NYAeaU47Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX0TukJ176riqX
 RUK4qe5EYMe0yeT0QFfNoXbg9WdgKoVhTqUOkxKi1tB4A/6vBGuB9udLgF57eMI8xK1KeZjxfTB
 +sJrHLhqcxcQqkTubXpHUxwW4BX1pw8=
X-Proofpoint-ORIG-GUID: 0Cy4QCBSkt9ENgnCoLKwMrSUwldFTAno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150028

On 10/15/26 07:08, Kurt Borja wrote:
> On Wed Oct 14, 2026 at 10:03 AM -03, Daniel Lezcano wrote:

[ ... ]

>> Yes but I have a series I'm about to send decoupling the
>> platform_profile from ACPI
> 
> The platform-profile already has a platform agnostic interface at
> /sys/class/platform-profile-N. Unless I'm missing something, I believe
> that interface should already cover your use case and its also the
> recommended way to expose interfaces to user-space.
> 
> I was not around here when this functionality was exposed to
> /sys/firmware/acpi so I don't really know the context, but I personally
> don't see a reason to duplicate this at /sys/firmware/devicetree or
> something like that.

Yes, I agree, thanks for pointing this out.

The platform_profile is however tied with ACPI because if acpi_disabled 
is set then platform profile is not usable. It uses also a acpi_kobj.

The aforementioned series [1] decouples both so it can be used on any 
platform.

[1] 
https://lore.kernel.org/all/20261014132500.3817549-1-daniel.lezcano@oss.qualcomm.com/

