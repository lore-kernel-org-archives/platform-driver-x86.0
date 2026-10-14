Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D804C651E
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983036; cv=none; b=BzE4gquWdM2XjYGwXqndUQSpOULTI4/xAK6GaCi7zbP+Kp7zpmj8Xu/X+1kGflpy6Th0wmNox8xhlMZe+WowlXoApisSAT0yCqDLpOZ6VQ+pZHn8KUU/mz7v5Wga5JlAJpUfXzrR7eGKEfNie08mar8YhusW5IZO05v0Su49Pls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983036; c=relaxed/simple;
	bh=ZBbiT59gNmAD7YIsNv0Ku3NckiKgCA5G86153ib0FIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jww7n3fGWCoX6tTlXiQVPlXxr+DOCDbs9xjb4APN8MJfL93IUwBy9hfF+lkIKX7gK36WZcgbg7eDsA1dJQC91B/5Sh79ZZxbE1XeBACGeZ1lYTxMrLpcSihpwfJ44Vr9IVb9UmjvvZJ3yC4/p8sJTiFiBpUYOh8pqe+WVVvZZaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsKD/+BJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EImEj6Y/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsKD/+BJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EImEj6Y/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7VI0C2874162
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 13:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a1jZF4qvhuNSKdOQSW3Mk+W4koGj3p8wU4Z5h61N8J4=; b=GsKD/+BJIC5tAlzo
	sPIL3ERW//zrhQ/g/tAXIXxB+n2qDG7WeUsH2/MtNDtIO038cyks3vlZn3FW91XS
	FrExRQH5teDuqjI+ixHf8wUdj2tPVcWizJLeKVJVlaGGLymbhtYY2GebYN+CdKCg
	HY5kgeEKXy6G1Y++CSXwgSSS7bhPVjDhjxw1LFU0dWVsSKz/1U+QvGllHLh2LaQg
	zo5yPjoAPpVl0wOc3uC4u7OqDQhLgPTyIYMfLcJbUqjbOK+wCwEy4TLXtb3VUq0a
	ySFK0288pKO+G0Oupuk8JVJ11tqVqPIikv/Qq3PvxgtDvAryXkgsJudQbXcXnCfk
	LMl99Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphjn5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 13:03:53 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988d5a1080eso214639241.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 06:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983033; x=1792587833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1jZF4qvhuNSKdOQSW3Mk+W4koGj3p8wU4Z5h61N8J4=;
        b=EImEj6Y/mOB1QL+v/NzyPTYXC5MnYJXbtFSXosD955JoH0cquMe3fAbzDkDIFE/ZKk
         k/K3OmpHyZhJUDLCyAFqxjxDKrZI0mP+ZO+tWeyl+zflUtyjrAEx06uOQ7otsA83kwrO
         BK+BsNax4PYly0Cpbwj6HvS7hjZHm4/jzf9Nquqixt56A13QvzuTSvthPMNXhC61Vybj
         poICjCFLKVMnvxlRR4qkyxBPppB7g3Kf9mhF9N/UzrCgALqxQa5ijHFQ4pSOo0yv52TH
         1hI4BKyA1kCdw+mDBLZCfqApq3ORbZ9ZatyWxSLDHvdaURD4PeJ2mxgYtmzA8uPw/QoM
         tPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983033; x=1792587833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1jZF4qvhuNSKdOQSW3Mk+W4koGj3p8wU4Z5h61N8J4=;
        b=XMpQDS38yHtKLHXW0teSwJDxVN+zAS9tUzjL8HJe+HiXDqNIcyO6J7Wm78tD9Pa295
         X6bZoIo+9E8PwfYcw0w0ZPTvv+uQgpBYpwKGZXZ4HfYd/jv+DpTdzZ+wwaZlf4eS1b3D
         pmRBE6m27OmwTy7sjyIW2QRQJnKfsIvUrh103wCQ2I6j5zkZlXMk3Kq9MJNrfi3Pjs9r
         sSUuiBs3uUx9IyWVKGIWLPOuqN7xdIjVR1phHKFSr7eVloKy5bt64WgIum6B4JxNDVvd
         1n2QKMUXDatLz0l0WA8YFYnvz05fffzCuQJbcFNi7IpeL4tTFN8ENQCqdVUKU53GbVXy
         1KcA==
X-Forwarded-Encrypted: i=1; AKwUvBzUdZ4nDYkVi8dBXGPssZLPtTqwb1kShAUOajpsrtgqmQ5E8J47W1Kxj07fYCRURPhfiCaRJyhAerZv6RPCDgMc5Du9@vger.kernel.org
X-Gm-Message-State: AFq9FYJu85ndn+KPJmDVYD7JKeBDhWmoD9RSqmIo/4zoKhtIXnu5DidE
	yFlHom27bOyZXZL4L5j/63ufQGAlu9G7U+F33j8gzINcdly4F6WOQ7dIz44fj7dCU6s6HXxrp5H
	JmpDR2oMflFjcNg4SqI6ksG/7LJsmRqVeamKvlEgfVSy6+E32R+FZZcv+2lgGElKX9AcHIVboJN
	R0
X-Gm-Gg: AYBFou2zqhSgLfRel5fQa47zO8mW6o0rn0HmXYieEiwucUGdnSE7KOmI50L8OxUzbBp
	eYBVaj3bJYNk93Qa+qlFhhFiNUoba0YboPs7DZEcVLhzSPgkOYfdlXquGpiLdRbmzcxpdzVdp4Y
	z0yxQblhtxjuG5qdv4PSO7jWBn6anOHGDGJXp4orSe5GPsEGPG15OyhUx3fbwugCV2xc0VOjMsr
	L5GZVL1O3Qgcz1F3qsxmh/XriIiA8BMrJ+NSYynJECnxRKjpPEGupmUsuNhqI3YHkkpiXDgwMF9
	Um0qpl/n/HNeuAFzdnycX97hDkyWHuqa8YZesOECx5Sp4BZUhMvrRSajUMwhuLGTi97GJs0asjW
	HKlt+b4aiXOlcEVKNHM4=
X-Received: by 2002:a05:6122:3284:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5e91f44016amr5664842e0c.4.1791983032569;
        Wed, 14 Oct 2026 06:03:52 -0700 (PDT)
X-Received: by 2002:a05:6122:3284:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5e91f44016amr5664812e0c.4.1791983031983;
        Wed, 14 Oct 2026 06:03:51 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.90.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b3615f2esm48762455e9.1.2026.10.14.06.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:03:50 -0700 (PDT)
Message-ID: <36418d4e-ba34-4c31-b676-1e636cfb8a7a@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:03:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] platform/arm64: lenovo-thinkpad-t14s: Adjust thermal
 trip with platform profile
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Hans de Goede <hansg@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Kurt Borja <kuurtb@gmail.com>
Cc: sre@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, stephan.gerhold@linaro.org
References: <20261001181917.9367-1-daniel.lezcano@oss.qualcomm.com>
 <1eb6d74f-28c7-8f0a-4001-dfe717196836@linux.intel.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <1eb6d74f-28c7-8f0a-4001-dfe717196836@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rYB5AnatPmAHn6jN0zSOdgsJSVlXGnFm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfXzZit6CZ1OtA5
 qSbrhmyTiR3EYE3ycyrLP1geWCvWdlr3TkSEIX2HpHpKvFSC9b2j5hEfjf8OG+CLQ6M0Kny9KDF
 qtF8uoQCnBV7axXy3pb4BX61+GHAFeA=
X-Proofpoint-ORIG-GUID: rYB5AnatPmAHn6jN0zSOdgsJSVlXGnFm
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf7db9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Z+RgMFiR+YmuKcUK9jJrqA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=aZIhWqgyBre7og8ISb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX4jKXo+KJ0n1J
 pSduFXPHT56oQouCZVCeMlSdhTOY+ylHV8CSosaNxQqehOPHmQrkEMLJvlyge6ugTUv1uueXtxD
 fpLPMCPgbSA9kaSuALjTI6imoxN76XFVE3D2j4uQZQzVF8J59Y8W4FW98R6Zq9VL/yFUY3Yrc9I
 YTWsMX4FFXkgOOYrkPsaWfRv6LQ01I7zaPGN5ZNLD9n3t5OEyA7r5w0YIlUuR5QpLiuBw33KfMh
 AcDfe7bNW1kOmregqAnwMlbs8+MvDF4XC3EhqM2ULr+J+h8J9vY3Ay3ehYRXvhwZX39AlH5z4jA
 QV5+tLcLm/+eRaTXbNE69qC3sFvnJVRnIZ0xDiT+6GsTr9EcK6CYl/QBGyW77Qo8aemqlrSeCXO
 W3PEzYkb+220mmPBZWkeekHhGPxuEv3/HBxkmeaSpoU/2407dp5+9RVysJJEu2IWkKPhuPBYl7n
 lJ/JokG9+laUH93TPTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140051

On 10/14/26 12:19, Ilpo Järvinen wrote:
> + more people.
> 
> On Thu, 1 Oct 2026, Daniel Lezcano wrote:
> 
>> Tie the keyboard thermal mitigation temperature to the platform profile
>> selected through the ThinkPad embedded controller.
>>
>> The EC reports Fn+L, Fn+M and Fn+H events corresponding to low-power,
>> balanced and performance operating modes. Use these events to update the
>> passive trip point of the "keyboard-thermal" zone to 49.85°C, 57.85°C
>> and 59.85°C respectively.
>>
>> These thresholds match the thermal mitigation temperatures used by the
>> platform for the corresponding operating profiles.
>>
>> Look up the keyboard thermal zone at probe time and locate the passive
>> trip named "keyboard-ec-alert". The trip name is used deliberately so
>> the EC driver can identify the device-tree trip associated with the
>> platform thermal profile without depending on its position in the trip
>> table.
>>
>> Initialize the thermal mitigation threshold to the balanced profile,
>> matching the default platform behaviour, and update the thermal zone
>> whenever a profile change event is reported by the EC so that the new
>> mitigation temperature takes effect immediately.
>>
>> Using the platform_profile API would provide a more appropriate interface
>> for exposing and managing these operating modes. However, while the API
>> itself is generic, the platform profile core implementation currently
>> lives under the ACPI framework. Making it available to device-tree based
>> platforms requires separating the generic infrastructure from ACPI,
>> which is a larger and independent piece of work.
> 
> So the only problem is that platform profile resides underneath acpi
> namespace in sysfs?

Yes but I have a series I'm about to send decoupling the 
platform_profile from ACPI

[ ... ]
