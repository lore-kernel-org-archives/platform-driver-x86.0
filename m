Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403151;
	b=pgO1mI2MDneF8jcHQ6hX0hqt2q2CL+aFdhtYUHKMOj61upLJQwPM7l1Fvhi+/Ytl7226
	 wQ4ym+znwAnUwfAG15TeN236D9AJe7IVNg7t067vNRrUyPkaVyjkeVXiV/ellyT2WH9iK
	 2h3jHCyKIqr+1xcSdZmea5Xq/7V5e82MGj2UbTVDGJ6IN0smllZ3HxqOzC3hGS0uy66Dh
	 /Z3eRKK1ZF+1AGjoTJw3/TkkDxb8P7kwaydQQ7uWI/Pyko9RIiraMyJDyWQO0dXVqSQCD
	 P2Wdqz8Qf1DG0mLD6KLTXyNsAcsaSROZrd3t3nR+B816KbB6HgWRwbN2IRTT++lS7RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403151;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Wq0x5a4mY8xB9yKVASur7KflnAB98WTg4FjBdau/vd4=;
	b=xZh3o/zSb9rTAgzcSmWEYfj/NkQPJCxN2f4ug92STmQGGFKOdgwZQ5wpsULcKb39z2T9
	 GaJ4c8VrW5rojg4Xs7LVKAtOjBeUjOFSFIA6W98nvZVy+yP1gdpbQKSL5oyM6qDA66ZhC
	 eOgiY5LJNkn5gNYomQ0mxLKyPkufV7QXbp3V0Gb59DWrzvBnibL4YFUIDRuVsEkU6gfYV
	 aZfn5NiojkBYRreeYm/1au80UZ8hUYfrlIetAY7N/nhs/9Vs7cF+hocBg0Uw3doZh+FgU
	 Rk0ODTkl7oZSGZfa+dBtvRuEyKz6gltquHBKylVQo4pjiRZrA1eq5Tz34DcpIxVWH0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mQpqHWPm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HAA7ldxD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0969606A326
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0969606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mQpqHWPm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HAA7ldxD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYuRf1806575
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wq0x5a4mY8xB9yKVASur7KflnAB98WTg4FjBdau/vd4=; b=mQpqHWPmMGcnsiWf
	hpO1cKg+Jtxp/uwmr3icseUD75KSQGBoZgTj+xRXcYgJjR9yrckym1UxN1U767Rz
	Y0cjFwgFiJj7RnFB/zhSiI0OsZZn6rsMxWcUFDLYrMlmmSX3sq+nvZhrHf5G9Sq2
	ivV+L+8RA5D5qCptz8SAyO+Jm04QZwE9HE2Gh2myiEWRxTPy/hTOc09Hry7LqCLf
	Go/4nhCBvtSSe0LfKZ83Y+eRuKaWYad5aiaKOTx3yFtDIv0AAZ/DoWt5Da+qb3Zn
	Aq7xTfxQEC1qT0LtzsoCnaiNCiIY7Pjt7yz9tQ51dHfpp/tjCRLG8Ug0uAkQgptf
	OK/bTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawj9ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:19:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so805876485a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 05:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403149; x=1795007949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wq0x5a4mY8xB9yKVASur7KflnAB98WTg4FjBdau/vd4=;
        b=HAA7ldxDaAof0ShezcR7fGz2sJQjVpywtFtxwqRDX6dsmrcfn6lPDuAt1ZKqM8qy0e
         TfeJ60XxN0JEKjV+gO4uqXc9PLSBx0k8Kjbegtk0QILSNjEoPSQdN6PHi9RIlf+nL/dn
         foAvOXoTaeNWQ4awothtI6FgnDmlVDpYeAbRqs6HcjBmlv3QKxr7XfULX8Yj/TLWqit/
         NeAIKz+R0NMEMcknIniezAeNqpbtllTa5gwh+RfaOqjupRONlKc3qO24IYDUmKIzMpei
         /w9Lffz4KijxpGVnvGO6ex7u6XlRGA8a4ipuBZUKRIX8pWc8VM5gfmtL9mTqHxw9ZRae
         an0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403149; x=1795007949;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wq0x5a4mY8xB9yKVASur7KflnAB98WTg4FjBdau/vd4=;
        b=nD1IvF42UgQQuua65ntorg5ZXolPV51LyzxXT3H3lahaE/BpJuSrYD2Krhlgiz09kc
         1Jdn0IJoQgIJ7s4c2UBUvaVeXFPtfIxoQgKnRoDGuHnNU00RI82sm3y0bcs5QsJAhYd2
         MeWfB6jGCbR1CEZ5Yq2QOybqmLZuy3bs91KcfRIe6mJUY5Dn9I5kKj+tgwABm66iOxYd
         zJzebnAqXwAzqNhDno/+RG4yC5XyM83+WOf6E5+1L+wxNXV7hA+Y9NJBPja3bfvab8Nn
         NktiuJJBUVgrsOVc4hB3FkdVZtXgJclSTLIowKAotIdgnpSA5JfQqiytP9rWdXdoIEoS
         GvYQ==
X-Forwarded-Encrypted: i=1; AL+hErFpCdpq47YvdhxS40VH19Hep7e0tLR9jnjYdm9DN/nZKxrRjKQtXljhC8uLMdOPz014PdNZgXR/B8bz/8f0fTh+v6Ku@vger.kernel.org
X-Gm-Message-State: APuU4Z9P6rHoe8mItmiX5gmL/nMmNLdgfCXU3c0y1qtJdVZA+fqoo3Oq
	nddmfJ1vZTb6KdULYRotv0uf14WLmPRUu996T3S0ziZ6Uc4RgKAv6kh9/4Zzq8yVnS6xqpG0Dd4
	y8Rzq0z4e0xg4grk4lS0sJhPyL0MrKu1is4CfltPCtDBrohydsaWYx8Svt9LCN4K+4MpB86NbQ+
	1A
X-Gm-Gg: AYBFou0k8L/pTUz18PnnC4MJFVj2S24/Z7nCUwVy83Lb6T4siCS+7qLtH38Hxiw89bp
	vT0lzbc7mUY1vsRyr+nekN3KkelBYWculDDoF/4zSrhQx9/OgDXoxG5Xt6pP7wiVcMQnWHgvi8A
	lYBzvB7P8ngVtrfpDUTbIYNfzGueYAWKlpRBpI/SwQBNzrn2rWdjn26E8yY8BH3Swp9Ct2scYFu
	/9szZuEuLLzGJqIB/ZyxJysQS0HK3dJAch/njwrmhTgi1yin68wOlbC9/X8hUq4ZsRtLKzXPPna
	8EuEwHhYgox93mm6ICCnqzLwwIQzhtZ3ri4mo5kvohV+LBLuVkBAKX77QzkDGcU1Nc3AHnK/lUX
	9Dm93qkDbPny5nngYDLGrlyGy5nKFWykveqWV4vcJQlmUXBk9PioFvQWwY//MNP3bco0BB/4Z6/
	GlhL9cHExDqepmcwFvYOFPAdV8CaU+9abVdGktH2I/t17uUADa1SufcJOxzNqwlCcmJImRKDuz5
	CuBdjuLClwSXVickpTR/pDrsakGUgb/pMr7pVtPDdfs
X-Received: by 2002:a05:620a:294c:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-947b0051f3emr367305185a.68.1794403148776;
        Wed, 11 Nov 2026 05:19:08 -0800 (PST)
X-Received: by 2002:a05:620a:294c:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-947b0051f3emr367299885a.68.1794403148297;
        Wed, 11 Nov 2026 05:19:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823caasm2343467a12.1.2026.11.11.05.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 05:19:06 -0800 (PST)
Message-ID: <c55d221b-4c1a-4b7c-b91e-dd89a12e0675@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:19:04 +0100
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
Subject: Re: [PATCH] platform/wmi: Allow wmi module to load when acpi_disabled
 is set
To: Armin Wolf <W_Armin@gmx.de>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Han Gao
 <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20261111131613.6290-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261111131613.6290-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX0ahPTI9wsOYl
 ua0dqVy2KyIu0AnWJLpipWuieZ5ga/jlqNSMPk2389Xonj9mRI49yuNc+w/RGAI1oLX1injHsVv
 3l4b6A3o0Wg8TQahjhVYVDHRzxfaswY=
X-Proofpoint-ORIG-GUID: I5lZbBtBimg39hu3MjSZsf-EZ8u_e-d2
X-Proofpoint-GUID: I5lZbBtBimg39hu3MjSZsf-EZ8u_e-d2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfXyhWVRvRfnskC
 cuTlM10AVo4KJp0zheg1a0uZSsQ15Q1Qa5+u/B+Px1V7pZCVNDGRJT771v5Njk/w38di7VYHGcm
 2zAOmBhgU50l6QsPMYnwJPbSjfpuXtFI0R9cZG5LLIMv8CQIbZbxpxoKoJWt/h6gWOa5DjLQpz/
 DdZfJGvChMgTy8gZbaNmERvqTn4IYrVysUvB4honS29WbqpvPlj5HKHXZgumzONO/qOqNIfC5IH
 NQfM4zJmR8trqk2ePKdRU2pLI+krBoB6TlsovTTqJKwsDEKxkMipH8qI2wkUKCHyB8UD+PfeBzx
 VB2kA3kYYkoZcY4iUcQpTsELDqjLkIFAFHZPH4W16Rhu5UKBka8hGiqWSkYMy7JO0Y9mqpPHYTg
 1j3vmKjOhgj+NqSpaBmUHKBSrWWd13Wpk9uTjSgkI0Pbu123VXTgIM04hkmZEgQwfKpffk8JJEz
 tj8ZgAqj6sqlpCRzMWQ==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af46b4d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=gDy9M4QhnISp6OFiptMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

Hi,

On 11-Nov-26 14:16, Hans de Goede wrote:
> The core wmi module provides symbols which may be used by other modules.
> These other modules may still function when acpi_disabled is set, but
> the current behavior of acpi_wmi_init() returning -ENODEV when it is set
> causes loading these modules to fail because the wmi module these depend
> on fails to load with -ENODEV.
> 
> One example of this is booting a kernel with both DT and ACPI/WMI support
> on an arm64 systems with devicetree which will lead to acpi_disabled being
> set. Trying to load the amdgpu module will fail in this case because it
> uses symbols from the drivers/acpi/video module which in turn uses symbols
> from the wmi module. Note the video module itself already contains handling
> to still load when acpi_disables is set for similar reasons.
> 
> Fix this by allowing the wmi module to still load and also register
> the class and bus instances since some exported functions like
> wmi_driver_register() rely on these being valid.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Note there is an earlier submitted version of a similar patch here:


> ---
>  drivers/platform/wmi/core.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
> index 529825dcfbfe..412f2e23b01d 100644
> --- a/drivers/platform/wmi/core.c
> +++ b/drivers/platform/wmi/core.c
> @@ -1573,9 +1573,6 @@ static int __init acpi_wmi_init(void)
>  {
>  	int error;
>  
> -	if (acpi_disabled)
> -		return -ENODEV;
> -
>  	error = class_register(&wmi_bus_class);
>  	if (error)
>  		return error;
> @@ -1584,6 +1581,9 @@ static int __init acpi_wmi_init(void)
>  	if (error)
>  		goto err_unreg_class;
>  
> +	if (acpi_disabled)
> +		return 0;
> +
>  	error = platform_driver_register(&acpi_wmi_driver);
>  	if (error) {
>  		pr_err("Error loading mapper\n");
> @@ -1603,7 +1603,8 @@ static int __init acpi_wmi_init(void)
>  
>  static void __exit acpi_wmi_exit(void)
>  {
> -	platform_driver_unregister(&acpi_wmi_driver);
> +	if (!acpi_disabled)
> +		platform_driver_unregister(&acpi_wmi_driver);
>  	bus_unregister(&wmi_bus_type);
>  	class_unregister(&wmi_bus_class);
>  }

