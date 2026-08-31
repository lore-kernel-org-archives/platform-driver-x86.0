Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3CA37C92A
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 20:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208119; cv=none; b=Qki6TeeTaGcqJcp8t4aBGLqkkCpz5nCFfPo9HOFoYFMwRb0NITBOnPeiyD/eXb9NUU5V4+UXbkoSS5D8rUt7SnLsCuGxYkqWtDLT35Do/1nrsO+Pr2ej/fVXOklRw/WdO3A1/v4/KPWzd/McLJ7fdjWCvummatAxv2NSBbQ4sUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208119; c=relaxed/simple;
	bh=F78qXWjKVgGbT0jvh8UqBvIJjhJr3EXEjO7s3m/azFA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cnuxc5USnhr0yeQw+ABZdRs4GgfJTQ+v4O2ThXJqPkOG0/k34b6xf+bC3IGEl9KQE1de6a6Jds3jpi0pVtnHfPpsIx/FZhjWRMsgKc98O1HhniDsdA2/5JFFNCL328Mt2Ps0WeirxdmKeBBC8a0TprAt7+xS6rcB5vUYzXQ1re0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Su0qCQFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TliOmVZB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Su0qCQFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TliOmVZB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIYT5t3897920
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 20:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmaKuWeenJoFZTUrv1H2bv4EEMkbti1YI30tlzQe4c4=; b=Su0qCQFjSExyKxoK
	dXeOXtjNh0PMH1PapYzOZnZW0JNJPwBd0NlF4Cquk1Iep6zEebO05a0YneQqMjcB
	Q9mdyacCdnEwVz0/Hl8Xo1ZV7nX++SxSp+8WmTDiGc7BC953vz0X7pa3+e8G0WTS
	jb3GzbhiwiCFgXrb1MU+AiJaPBjP6v8WGHtxZoNDFHRuIL8F+qGUTqlVcYSJ+DMS
	MX23UqbnW4YPEfUWdNL8FFffE8d+u51S4gmKpTg3LCHWSLLfXhYa/l7CYqb3KszJ
	tlwRTUEy1qlFi8znRYo9QSykqLoNunsYGBlHA82QZYp0jc9U9i2aefJAPueyKk7b
	H4wn2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556uh1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 20:28:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so650689485a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 13:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788208116; x=1788812916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BmaKuWeenJoFZTUrv1H2bv4EEMkbti1YI30tlzQe4c4=;
        b=TliOmVZBHgd8noeLcs3CJ0G1FsCG2QJdEamJsiIZvjWQtAbBxb4TvLlhxy11XeEqvC
         cr7e7FpJ3ImtUgRmfR4op+qPRa/zMLSdzwE4NRFGFO3efwhPgYt7fq5QVYKtKsZYGvAy
         BVb+YsApXX9M4ltY0uGNnUz2sPJBCI6GA1LaAWrMhbb36gCy+PA/glfxe3Df5VjvkVfy
         Dij0OOESioG2RXPdBrJy1f2E1TMw8ERkdAUmd7eGKl6fe+nzTFvpgfciDG3xCrEJopoh
         FYrTxId8PAfPUzuSTd4g/trUobnU9ytFozgvdaSVgaNmbO7Mxpqx37jNxn96TeqW43pS
         +9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788208116; x=1788812916;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmaKuWeenJoFZTUrv1H2bv4EEMkbti1YI30tlzQe4c4=;
        b=kC6wp5PJQATLsA47jGZpeSpFGhxqdoaMgG/5y42jaSC5jU3nJ/TIiiQdCIVw2LOR3T
         CUNoecY8PeQT8OmoRIuxn25OKYtNJxT+3FtzFgViKalFn/s+kXpmaDG23P1TB3p/pdW9
         vngV1vFTg5fvXVJL7hXZIZ0LjGkiCUFlwqSj381y9vPmrut5WJcWRqvZgvI1vWk9FyUH
         cupveZ9kPby9FxxhYcYFs1GV0v6QtYGR4mtksPJvQT8czMIWOcrGlscRx2gpCRHFywU+
         14WpbMGloUqRsPuCuiUZNdBp56O4B2T1LRtph9+SkjbEme0ONjG2UxxD9pjlwrUe/vX1
         LB3w==
X-Forwarded-Encrypted: i=1; AHgh+Ro6fFOPNE7YzdC9BYbIdSLCf+tkE5sTMHomoWXLECGBBlnZP0KaX2surnk7jLjvwhyr/T6w8IO0/sjol1enclXEzPuW@vger.kernel.org
X-Gm-Message-State: AFuF++kpC9X5ti4XR2EmADZf6AadnbcG+x9dyJNbKtR0FoszyrI4bHJ5
	V9IZabd3W5ArQPe8VHSZ5Vdo+94S/TGgyGj55Qte6AYQWmy2X4wAbqShKsB8mADuPUWvXHnqW9K
	gLRfkqQWXHl6y2YASMNMeNPMVbmw9/U3sChyyhVrH1jTYV5XoRFEwMh3ggMNyb9qzvVVOkK5AOt
	9E
X-Gm-Gg: AR+sD12E9VFD/oTLG1oyXgHRvwCXLe8SlNF4mJnMGfOiy2nCreI0e+MgWvuhpZAdrf5
	jUPbqSzitGNi1uFKEbE+WGIFqY6v47VZXyMkGh4L2wiQpA5fyy7szqPsqMg51iPhY37QgytKQG9
	alQu9gMTzuy85rUTeI0ZNCTy4a6k2aTVQ5B95FMp+A7pWuFbckZRryIW5Z/pzVAd07btleK7zRo
	9Sl1Bb9i362hriXRmevI14HLEZ+0mOVM2eSVyyMCP/rVKNdKvrMMis6ZVnrHRmWsSbNkej1e+T+
	1irO3izmOWOiwSnO+Hh16ljJbHKR3tWP+yP9027bZ9A59Xirozm5uE6JoIGtcWGJswraZBZpujJ
	bQWqeZmgTP7WeBFO1sl+rUCgH54sMjsDnsJNiHE7vUaDjKhFqqmXudJ+vfK5NhxnaoVC90Xo7mt
	22i3UavW0LHjbZAsGU1UYhy7WR31Tz3Xpz5uHE9/NsDvt//Xyq9hcjEH1PoH9FaLvQIAk=
X-Received: by 2002:a05:620a:319d:b0:937:2e9f:70a8 with SMTP id af79cd13be357-9394819fd3emr490796585a.39.1788208115639;
        Mon, 31 Aug 2026 13:28:35 -0700 (PDT)
X-Received: by 2002:a05:620a:319d:b0:937:2e9f:70a8 with SMTP id af79cd13be357-9394819fd3emr490787985a.39.1788208114943;
        Mon, 31 Aug 2026 13:28:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c256f8e498csm381093466b.8.2026.08.31.13.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 13:28:34 -0700 (PDT)
Message-ID: <aae3cd89-5c0e-4695-829b-f5e81a0e4633@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 22:28:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] platform/x86: x86-android-tablets: fix
 gpio_secondary_fwnode_init() not working
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20260831201157.36397-1-johannes.goede@oss.qualcomm.com>
 <apXgib0baybxwWSc@google.com>
Content-Language: en-US, nl
In-Reply-To: <apXgib0baybxwWSc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE3NyBTYWx0ZWRfX4E6C7FH+9gf8
 veRMOgwhZS/Ea2r6lPDAR+JcF4OBjaxstX6xbTNdRfHTTGqzO7CSxD4oPRtgeWHtGULItdZBov8
 NZALiUKgJh9rbD9FYaUESBNIVBVq1QQ=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a95e3f4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=g-YZ7fNn-hVvz8OwhfEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gIZvx2rZGxrrguX_g24g3wMGwC9lRYrN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE3NyBTYWx0ZWRfXxo70XkCTywZn
 GLUraS5N7xQtCrkwiQ45j1ch7QVOaQstKliVX6w9zgqnSmFpD3FDSw8GOo2JxBL4+LipG6Ah1dq
 PJr9VQcNl5NXaswqhOFWwxWnuXzs28X5Uli1Bl4MHzp5oWWQwjua+i01O4DVrUBDA4gUMBRupRR
 Nlc/NXQSL3H33aPtu82Nv762fvuRvr/8n+SxQHS1kzs8znbd03E7PxGjBImJZUG1GRxCkBnIvz/
 l3BYDPyZeoSP4di9P0+6OK2fOyavSGn+t9g06xSEkiQru6fXi7rlVVnQr1uXmhRaXKjmrqGj51O
 WqhkBmjgf27d8WX1xn5DVYZ2KsikLdkJjSN7ruaUAGwbrZ0EVNxcydmiN8A570mlGegBBUKl+Gu
 cOKhNEJNVIO+nJcE2cTmHrGnyzSXcz/F7AvyPUrRhXPnoZ8NFdtSRyZMHE13uHYTfPlWewxDmKl
 9Hi4Ex2agrXxhyD4MKg==
X-Proofpoint-GUID: gIZvx2rZGxrrguX_g24g3wMGwC9lRYrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310177

Hi,

On 31-Aug-26 22:22, Dmitry Torokhov wrote:
> On Mon, Aug 31, 2026 at 10:11:57PM +0200, Hans de Goede wrote:
>> acpi_bus_find_device_by_name() call returns a pointer to the device object
>> on the ACPI bus, aka the ACPI companion device.
>>
>> gpio_secondary_fwnode_init() then continues with setting the secondary
>> fwnode on this device. But this is not the actual physical device for
>> the GPIO controller (e.g. the GPIO controller platform bus device).
>>
>> This mismatch is causing GPIO lookups by secondary fwnode to not work.
>>
>> Modify gpio_secondary_fwnode_init() to instead set the secondary fwnode
>> of the first physical device associated with the ACPI companion device.
>>
>> This fixes the GPIO lookups not working.
> 
> Nice find, thank you!
> 
>>
>> Fixes: 1448c2d2ca5c ("platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips")
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
>>  drivers/platform/x86/x86-android-tablets/core.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
>> index b028af1c9942..1706287fd136 100644
>> --- a/drivers/platform/x86/x86-android-tablets/core.c
>> +++ b/drivers/platform/x86/x86-android-tablets/core.c
>> @@ -417,9 +417,15 @@ static int gpio_secondary_fwnode_init(struct device *parent,
>>  		if (WARN_ON(!fwnode))
>>  			return -ENOENT;
>>  
>> -		set_secondary_fwnode(dev, fwnode);
>> +		struct device *phys_dev = acpi_get_first_physical_node(to_acpi_device(dev));
>> +		if (!phys_dev)
>> +			return dev_err_probe(parent,
>> +					     -ENODEV, "No physical device for ACPI GPIO dev: %s\n",
>> +					     (*swnode)->name);
>>  
>> -		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, get_device(dev));
>> +		set_secondary_fwnode(phys_dev, fwnode);
>> +
>> +		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, get_device(phys_dev));
> 
> I am surprised that acpi_get_first_physical_node() does not bump up
> refcount of the device...
> >>  		if (ret)
>>  			return ret;
> 
> This leaks refcount on error though...

The or_reset part of devm_add_action_or_reset() will call gpio_secondary_unset
on failure which puts the ref we take here on phys_dev.

And the original reference on the ACPI bus device returned by 
acpi_bus_find_device_by_name() us auto-free-ed since dev is declared as:

	struct device *dev __free(put_device) = ...

or am I missing something here ?

(also note the refcounting is not changed, this just exchanges dev with
phys_dev)

Regards,

Hans





