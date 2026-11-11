Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403179;
	b=KzR0zHOxr3OageMHwOWeqXrS/cPqNWBUgGsK/jpH4tAnQZoOVQshWefOWf9rlEHbh7mT
	 cYeDmCoGmvLWaiN5NUL3LqnKs8s3v1isNDYpQhkNJK4djv1l0rVkkkY5U0gBfuPhedYWJ
	 appEp0AXNhjZcE21py/TYvma6cAOYC0BSya5QETwOb4QPhjg94aqoP+nUabIIo7nhbI86
	 0hMrl6mQ8BUQW1FVlQA8uvN3S05dyWuj1bESnNYH8t3zK988FxVnsEQNYboV61QOtuFO0
	 3Ig4Y8a8wmseSS/B83koJhVG/SW9V+9zDHI6iYJkEvE4mNeMcllE+qacXpcPShTE3Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XSLwx4JWXrb44TFN9YjVKJs/9lxbg9iaLEGL8zMJBvw=;
	b=5PN2RDlmQ+uF/P3b/AuThbOMNky+Phe1/nPksYX5cCZ1R3pR+WBQvuqhPTiPWKw79lwk
	 XtnvtIUEoM6WWABbVajj1JZrWcRGJhNTornYDFsNx82xt4UuX+qyhXyItopzJ7W62V5pS
	 B/OTfQ9fwiBx+TegLNipxKlg6/rHdvxBu62NQ5VS+ViTetTv3YD8YTnU4LslAhLABTA0B
	 I+Y3qDgtA5sUShMrbqsuPTxI929bywI7KOOTnaLJwkZkRSrdph6Ep6w2VHhoR8rFATzOz
	 8mrZFzk2bfOqvvgSM3lxkSOnPCky2vB/AKUTzoPIv3bGFB1DZBrsPIyiwzuA0d75IiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUdel8PV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L01FN8xm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE50606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE50606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUdel8PV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L01FN8xm
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYu0Q1806583
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XSLwx4JWXrb44TFN9YjVKJs/9lxbg9iaLEGL8zMJBvw=; b=nUdel8PVYqIl3Gsq
	/j/RTqd7yVEa0MjHJ6v5rYud3wkSYnllQnO9MltQoIaGStS6kHn3GW4u3GRfqNPC
	y4+MElDtsFvBfG3J6M5orv7LPDvrtEWQNyGtigNjlTHMf+U/IUliVGmQrSjTA+ge
	y7e6escSzYO7500HAse/Ob9fd1WOAx6YQ74qqnKvGbi5PFIP6xElHzqjUFXWYkT1
	X18lTfyYFJf6CSUe2AhJgcLpWPn/AhdoY+abaJMZwF3S3r4QUamMlXGCeM9FzM8u
	W0MikvrfB+D9WajReR77NXIL6FBWBer2f1A4S+OKLMXGJYC27SyCY4/GxdVuZwbe
	z/1wfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawj9bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:19:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so388515485a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 05:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403177; x=1795007977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XSLwx4JWXrb44TFN9YjVKJs/9lxbg9iaLEGL8zMJBvw=;
        b=L01FN8xmollv+4s+ue1VcfUhdPmSKAz6wPNne2jwbmaF3/b3xx1W82Vs3UkO0ULycD
         fBOwseOa735pWY9BdExgtDNZORduR4zSw/QlU65Mx7XzJ22pa9HuaLJx1Y8QEaRlK/qQ
         oqvgAmR2kyXmDp7GgWliSRLaReQJohUFHAwqlDjDwikFWKwToYrQKdrG59HHqHP73aRs
         xXAWA0eNN7gedq+YQmUlc85P3flR2DY7XuRzqJF1jJjeon9RL3wNJv+aFXufVWsF322y
         OXbHM25WxbPTRhgKxLk1vCwURPzv5Bh3ggFGHF8PnNr5lBc3VaIo3XvbA0WdD5WQvm2S
         Km+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403177; x=1795007977;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XSLwx4JWXrb44TFN9YjVKJs/9lxbg9iaLEGL8zMJBvw=;
        b=iaVN38PNAPcV0al7KIl7pLUdrqTkhhxwzjc2KvXeOq5fVoq1ZK6VK8jfnc/QlXE+5t
         ZRRuBP1XatCaQJ/8yzqJ2cVIMzB7c97ikjOiw8FypSQIEQr8JNATwxqEiQx5RRviYZ1K
         f77MeK/gZ2QgWhlUQ/yWU40aVYwgK6sKGJGranGMeFWdzN5XHqxap8l3tVS9m9T6cnFx
         KKSzmEfX8umhGKKKh3Qid6VvLouFSuc80ZZufllOHI0pkfJfau8oz1unrZZQzs3lxRbx
         q5zSLyI0AAO7eFOUj4GOHFnaMXc+RwpgZa47dGgO6/EAPD3CBpplQTUrPfntAZ3n6V/3
         bkYg==
X-Forwarded-Encrypted: i=1; AL+hErEruQTQeQrgRbM69k6p5G6+/iw6oKayp80zOvt+3HjyARUxj7vGns/FIbR5RmnaB/fGQjblE6qQ+PNLIVCn5fNVxQRG@vger.kernel.org
X-Gm-Message-State: APuU4Z9UEw3loUHatI9uPMxdjr9H2/CnttltDyy3GZ6MUnf1HKRqEqCU
	U9V5PMowtFnsqBd36E3PR8HcFUE9oaKzb1Jxsqh+k3HUQ3BCov4ywNqRFvgJEF3NFZFGETokdew
	KVjMyWewfcF7cbaWTLViXiPWqniyA4ejVwJDVwVh1rkOpP+8Ow3K0VtF0/o2rqikIju4aOxs+LD
	ru
X-Gm-Gg: AYBFou0+A/3p/q5EKpMgTZFbdauZZRvdeKRXKZdjne+NKkXiKkVAIc0rRJIbUAUPK/O
	MtZKGUvxUaFrBlYvsJq81n5mxeUaFb4pX8mnnhUujl4NpGfFGutUsaeLuaD/2f8a8rrpZ+ENIvR
	mzmG/HXquqoKqK0QQkKpa/xyleNTmYcxQyERdSTBBx0Gm6ohuG3WXSxurIgovnd+p4MORIAfuhb
	Hk+OSmwJTXi9J1IFvnndj/Yu/Hpl3BqC/OwVifeMqugKP6Vfp9ql5UrE+YUMuGJQZ5rXFFeyPgh
	h3lM4sRFhY+XCj/gXEnvVXfHffspVqulzDcZVpqkm/UPsLox9PGgH6DRn5VUN0aiSxmMIRCxKXZ
	SjD6G1Iw6oB3qCGcKW5nyHScsCizijHGlvKzspZ2XKIhSeT32imxWE6Sjd9HBb1fg7bhweKCyfD
	+jAT6T5B1AXywTIHbCzFtXPR6Rgbleyv/jniqiaQKea26rzbNulO/nK/X3tvdl9Unt91Q5wyOIX
	ecBOKvGXrJ78EKuHrQIGnNjsu5S1GrZKSMydVNxF4fr
X-Received: by 2002:a05:620a:4042:b0:93c:c2f4:9182 with SMTP id af79cd13be357-947aff88c6dmr383702285a.20.1794403177207;
        Wed, 11 Nov 2026 05:19:37 -0800 (PST)
X-Received: by 2002:a05:620a:4042:b0:93c:c2f4:9182 with SMTP id af79cd13be357-947aff88c6dmr383695985a.20.1794403176506;
        Wed, 11 Nov 2026 05:19:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56e064sm229943466b.30.2026.11.11.05.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 05:19:35 -0800 (PST)
Message-ID: <a72084cb-21b4-43a1-93b0-e3c3ed2859a6@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:19:34 +0100
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MyBTYWx0ZWRfX8zXboUUq18bQ
 ZzoFABDP2vD6ctTV3Nwb03/2L8op5qKZRQYqkuP4s5gLxi0l3GliDmft31bPVol+arp+O2uyb+G
 5QacvYysP8xdguMAO6LFBHKcd5s3Y+w=
X-Proofpoint-ORIG-GUID: 5l6QZQVfLgb24B7srZAec01IfqMYaT5x
X-Proofpoint-GUID: 5l6QZQVfLgb24B7srZAec01IfqMYaT5x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MyBTYWx0ZWRfX2CNT+SuMC2Sq
 35Su69Y2HL4tthLb97bEcSIVVEHb9wKjBQFxPe6lgoRXGxkV8YxGK85V9XKS6mPRbrv9cIPC+Rx
 s1+ghth3OMZr1EUZVGzMML78cXdplZsHdoynNIQiP9pfGxypnWNmcYHcCTTuFpOvd+R4Fm8GIY3
 uZFaN5cHLCBJ2gJrJyIk2hC2Bg5X6mf1+Rsaea0+gxrJZhJMfxf3gNyxgsMEtax+LFPDAz5O9ZS
 6Eu7+pwQLdmCsC1tPMw0PpFI+D6sFqS2seNbHBJOlQmmvALOqzNXhJrBV480qjnWr2lAMeP42qD
 V/q19yFhipSN3mzAOoN1L9xEHiJWCGr4Jkgdcyp5USi/Pb45oZo1geXwwlFJ9sPRqIp1Hy05ARn
 qbRs7X30bxcDPnP/RoTVDSLUW045T4pxyyH3GxgPRMJJao+AzrOlnEdxIIJ60NV6Aea8NKaDDD6
 tlcoRt6Vi4EE1GY8EAQ==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af46b6a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gDy9M4QhnISp6OFiptMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110053

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

https://lore.kernel.org/platform-driver-x86/20261110-wmi-no-acpi-v1-1-eebea07db551@iscas.ac.cn/

I developed this patch independently in parallel.

Regards,

Hans



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

