Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403077;
	b=3qHjlfi9CTnEw2vpjroE0Igj1i4mF9dV1cSKd9Dj0V5Y+ZT2iTlm9Lf9bZl49NpmXGTf
	 epwOHrDd/KYOQR8OsxGPbKPY8oDbHZF+koWtI8vPgx1BE9doQuuUhbdv/cSzDmUJ/hauz
	 UYGFWF8TxNkdERIcTtSGfJOHsfOHI0QOod/DrwEQAko5QIYWtwPwtB07BqpJuC0JLg9BN
	 m03ppEsO7LUsT5CN8uz2wQhCTvt95k7dMJuF6mT+HTH2CQU5YeqedvtdrshJ5ndo1nZBY
	 jzhU85h/chrhBpHb7JcjExdaqLJd2jtHL9SRdlPZagllHkAezK8kE1sk2n+xZ3dh8jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NGj0HJYwMLzByuwZ1s2H4bizl1YIeJb7PxkqCWE/g0Q=;
	b=R3RxqAfVhlNwEsPnPbI80/OoJjvlS2Swy9ykOUiDX1iZSkAAPm7o2AoB/benuvltdxgD
	 H9PS0fNHTkFzzMOgxtUvDAnM6+SAs0GtlUCeqSUflnFjXek0xkeGJICMPVRv9MTcckZ78
	 JizGZOuZ/4RnHEX36TeOIq+WO09F1LzC0g+3YndkSMTwUtwMWUc8SIXWCkrpBoJulkwRI
	 +0QGEo4uNWLfJ4hupxAxYEtW1PAllsTPQgX2qvUcbmH0G0Ze5lOuFCRkRxk7amJnh7Dwr
	 pjJ0Q3vBeYmRHFwv5D7apRGSjbG2WEn8reYxItBc62v2+xqpjZZCE7asT1+zQdF+bnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="coB/S3nB";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YoBNj24i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72888606A326
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72888606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=coB/S3nB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YoBNj24i
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZGZM2357069
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGj0HJYwMLzByuwZ1s2H4bizl1YIeJb7PxkqCWE/g0Q=; b=coB/S3nBGSl4q2Kk
	3wr8HinWmENbWSkl+ktWvEokd0uaXOHZD5r1L4pdmrD9RqOIboijjSGs2RrhBz0g
	k0Yy3AdesaWLHSV9WZ2S8/XT6kVK+7zo/29ILGUm+cGoLkKESh4oG5LicBSgUepG
	gOuGhzT4s+3+UxbmSZxl2J465UjQl5cYVqEA305oYDzxtIgqFOcbKds1lri7KQ5x
	CLjRdMIag+g81XJUgxcHX3h/IBxEKIRzhelxzPdNn9GANkql9BUhuQ6a+5XYgi6M
	rIKRHlWY4d84E6nG8niLy4VIJgJdCNKMMXOtT6wK2Mqo1/1yHXZKgZjEIqr3GHZF
	5yQaMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdhyb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:17:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-946038e22f5so752899585a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 05:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403076; x=1795007876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NGj0HJYwMLzByuwZ1s2H4bizl1YIeJb7PxkqCWE/g0Q=;
        b=YoBNj24iwlNIwzqqcvk39mijS8IzmWURrwX9hjuxeg3MgfhbJEYaj+KzMJkvIg48A1
         nPzmJSotf3uJfCj5Qtt3Ii1u4+CQpd4Pko0Akv7L0ib5sNVMmQGJtSlGnRenxeG4g3eB
         D9CgUG5MYyNij5jHQlH1doWichvNPEupDRNGoaJstWSfYxNLBQ0nsnsaLUI9RmlIMA+5
         rQvFD5BBy5xL5/PPtiCSQfpgjCY7mQ1b8bSBjvviC+Pv9A2R3x03zm4YVVy4bKoCmq7U
         mzI/GLBc1o15DocaOR+qcZ7jdgoHhbS7Hf+GgVqTVCcpHVC5eVBamU7iar4jBFULUPCp
         dA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403076; x=1795007876;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGj0HJYwMLzByuwZ1s2H4bizl1YIeJb7PxkqCWE/g0Q=;
        b=iik4Cu+fkDQ//EtVFxWh92uWaavN1RvugPVMzD8pTjiC8bp8y9K2lM88Kai27mv96Y
         QQfChYXtNSfsII7fjlDmbhv8n/ppy1hSymMY7zwXUq5Hz4kEueF3m2IwGnFHO4qZIrjT
         FO0XswypVJDSPFvs2q6ehrjf7aTFwArR6m92a/jTLxQ6NGluli99edw1sAwZui+TPdIc
         6o0FyAwXEpcCENDwiW4XqdCKonsMycdhYgaZavT7WhNnwZhcnnTlvDqie6zW3/3uVCqX
         y7SJ6wAIzAC4zY3p8rqEMTTpxoIO78G4pQADnRFrHG38z8d4oE3MMWTDX5sJQAFC/a3V
         SH+g==
X-Forwarded-Encrypted: i=1; AL+hErHsXJfejZdqs9PPe7YR7Hg8oh8L6hHtsTvvjhQTbPwy7NncpsJDxPW26SZnuG6l00s6QDSDwJB8kGzltWWf/nf2NPtt@vger.kernel.org
X-Gm-Message-State: APuU4Z8gNGUswSYUczPwX+AD3ZNarddnJEqygZ/sOqQ3Oa6Oi9H2xbIU
	E9pAoOWyRJOFFePnpyt+EGr5O4JUNHhyMVdYVC/8JU94p2fbjZVt5p+VVDDAzEYhXdAtsg7ei+m
	xB0P1/LJXzBWmKA3jzgypfwk+wNx7iLTUpCr23jmWlFuCrC1XON+MW6GvXUkwsLUf08y8yqzsrv
	eu
X-Gm-Gg: AYBFou2O8YlodwL1WljjlGbPjQpO6Od/wC84cfFcue1E2KYhCpHdWiIgibiNLCi3uZY
	7m1UnGnMhqkXtbgdhVaVwH8izY4f0T3Umh/lQkoA/aP81ckx6DZBCoSFPnwW+Yr6Gz0MbIG1DKf
	xIHhCVQxcd7prSE6y3maffx74VO7IhfE9rpeX4UYBVL9Mco/k0j4OX5s3PDOp8LJnOBoo46Rz2b
	UvZ4I8fx4xxExHAEYXrNrf7YHO2Q4oBgusxswiOPgalxa1vlpuSnFKIgAe9WEQjDBsB+lnactlY
	nd8qphmJJdp0L56AmM1YbJCPLMpH9uL2Zrh4z1pl9sDNrJZv3D+Bs2XCQoje9pPPCjOcyDr6+vi
	418bTAH2Y1xpj1y+ftzBzGaTz8g0eRdJFRU3hqpqxEVnGGGCjrJaYSGAppKGsT63rPTWR3sAPQz
	0eUO6Kt6fHxLuqeycO+DaCI38pPLufJpmg66a9CE191IsqNf17qRluTRzqHsZN693ZImA5ZBS15
	8mTkqb7sP4mHKxU1ohhZzbgEJg5Nidd5TX4i8gWfirg
X-Received: by 2002:a05:620a:2796:b0:93c:a40d:e3cf with SMTP id af79cd13be357-947afcd6115mr362250885a.1.1794403075692;
        Wed, 11 Nov 2026 05:17:55 -0800 (PST)
X-Received: by 2002:a05:620a:2796:b0:93c:a40d:e3cf with SMTP id af79cd13be357-947afcd6115mr362244685a.1.1794403075158;
        Wed, 11 Nov 2026 05:17:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a57085fsm233201266b.22.2026.11.11.05.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 05:17:53 -0800 (PST)
Message-ID: <38b7e73d-71a8-49dd-85c7-7cc496c57c8c@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:17:52 +0100
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
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] platform/wmi: Allow consumers to load without ACPI
To: Armin Wolf <W_Armin@gmx.de>, Han Gao <gaohan@iscas.ac.cn>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org,
        linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261110-wmi-no-acpi-v1-1-eebea07db551@iscas.ac.cn>
 <c9a078c9-3b95-47ce-86b1-feefe65a6eaf@gmx.de>
Content-Language: en-US, nl
In-Reply-To: <c9a078c9-3b95-47ce-86b1-feefe65a6eaf@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af46b04 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9ttZ_nxh5X5bo92EjBUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -UDcbvl2WDhQF6dUef8PEr5aZSXA5ADW
X-Proofpoint-GUID: -UDcbvl2WDhQF6dUef8PEr5aZSXA5ADW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX3LPIJS5/CxcM
 J+0IzB5VsF3D1IVhy5WFPAGahuLPWpBknyJbaTSrHEhyNjNoHPVM+ZBDmMY3eTTrrfImmSCVkvm
 r5MjuG4VamenHY0TeZ2vcA3nMRxCEIeFspdI/AhZEhMSkrqdWUqeWeMorQDJFeC9LNN7Kkt9679
 Moi2QYM3bXrB4Hd2RWybA6No1cKVQY8dHjrxvVPvzdDRte+/YWv1N0dm9uBitVJiyBthgPnpzY+
 488xcXxBbyBr2A1/+VWtTYj1bu+cf5WmkK+BDy5LqRL6h7UakzGyw+zmjjDTYIWTyKRv7TvcgHN
 v1T62o0Nynt5sM6J9QroKn+PxrbmJmgTiCYPXAjMe4EGjRcXLDtxVJpPwKK/XQM4B3GOBV+dsax
 YFhNnMOtJjau4Y7gnXevU6WgkYIykKWma6ki5Z+ka16pJmRwdMTYqbdjjRo7LWArXfumRCNNjEc
 aJmZYG8fLk3jmTbE5rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX7uxGzX20U5yb
 YJkfqr2ytCtzlttprHqqh0RIbCQ2TmCqX4mXg2NCby/+lveoTJlRuE1HbpjqJ3jJC4NZrypr/Vn
 2E6a94Gk4yX+felRUUFHl+oNBPzcdXk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

Hi,

On 10-Nov-26 14:57, Armin Wolf wrote:
> Am 10.11.26 um 14:43 schrieb Han Gao:
>> Since commit 4ea18e604272 ("ACPI: video: Remove CONFIG_X86 handling from
>> nvidia_wmi_ec_supported()"), the ACPI video module uses WMI on all
>> architectures. When ACPI is disabled, e.g. on a devicetree boot,
>> acpi_wmi_init() returns -ENODEV, so the wmi module fails to load and so
>> do video, amdgpu and radeon, which depend on it.
>>
>> Return 0 without registering the WMI bus instead. The exported helpers
>> then report that no WMI device exists. Skip the teardown on module exit
>> accordingly.
> 
> AFAIK wmi_find_device_by_guid() requires that the WMI bus type is initialized, so we should not skip bus_register(). I wonder whether we really need to check acpi_disabled after all, because the platform driver will not bind anyway if ACPI support is disabled.

I developed the same patch in parallel to the original submitter, but did
not get around to submitting this upstream yet.

I just submitted my version, which does keep the bus registration here:

https://lore.kernel.org/platform-driver-x86/20261111131613.6290-1-johannes.goede@oss.qualcomm.com/

Regards,

Hans






> 
> Thanks,
> Armin Wolf
> 
>> Fixes: 4ea18e604272 ("ACPI: video: Remove CONFIG_X86 handling from nvidia_wmi_ec_supported()")
>> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
>> ---
>> Tested on a HiFive Premier P550 booted with devicetree and an RX550,
>> with ACPI_WMI, ACPI_VIDEO and DRM_AMDGPU built as modules. Without
>> this patch, wmi fails to load and so do video and amdgpu. With it,
>> wmi, video and amdgpu load and the RX550 is initialized.
>> ---
>>   drivers/platform/wmi/core.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
>> index a99da9b7039d787ce3c1e0ece74ffbd79fafd3f7..6668789904a903c8d4e7810976f4e485d7a1b32a 100644
>> --- a/drivers/platform/wmi/core.c
>> +++ b/drivers/platform/wmi/core.c
>> @@ -1598,8 +1598,9 @@ static int __init acpi_wmi_init(void)
>>   {
>>       int error;
>>   +    /* ACPI video still needs the exported helpers when ACPI is disabled. */
>>       if (acpi_disabled)
>> -        return -ENODEV;
>> +        return 0;
>>         error = class_register(&wmi_bus_class);
>>       if (error)
>> @@ -1628,6 +1629,9 @@ static int __init acpi_wmi_init(void)
>>     static void __exit acpi_wmi_exit(void)
>>   {
>> +    if (acpi_disabled)
>> +        return;
>> +
>>       platform_driver_unregister(&acpi_wmi_driver);
>>       bus_unregister(&wmi_bus_type);
>>       class_unregister(&wmi_bus_class);
>>
>> ---
>> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
>> change-id: 20261110-wmi-no-acpi-159a4cf19580
>>
>> Best regards,
> 

