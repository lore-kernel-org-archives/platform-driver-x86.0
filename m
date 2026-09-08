Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6503754B1C4
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 17:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889922; cv=none; b=pV6rlc+VLTivpMwTmtesJaOO8oAeZXBsW9o+eyYi8PCklA4Ce39872T52w+7DIHXOMxUpNNZXBQZV+dw/ARyvcfQFhJfkdnkBmTQDVe8qYepV7GopNKbCxosgwXvq+0pU7BoLarByYxlFygAETp1LwQgJfb+MKXUiIzoBxaoKIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889922; c=relaxed/simple;
	bh=v1ZkL7yWlSGyJ3Fc5ocWE6ZEeSoCBdQwdcuTER07hiM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ABvhY+v7ALj3K7hAQ9vtquMxRbKfFUTERUEVyjBhTNAMGvgRR2SfCVuTmUDpwf7qS3cv5du6OpDl8IkbKinPBtrAgyblLCeAOENKoupbEHvItPhmA6GVmqZcHeCXvmGEcNdXI76KeFFI7WRQK1PDI7JUuBQtwvLgQSRYHakTnBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXUTz5+Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8c4akVz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXUTz5+Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8c4akVz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdXg72899194
	for <platform-driver-x86@vger.kernel.org>; Tue, 8 Sep 2026 17:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	azgjAXmjf8A4dMcoN+gDs7MgRMcCWUuSNPeDhg+Eluc=; b=GXUTz5+YjoVbQDXb
	trNBIWd1wngyTe1wIDVy1gDpSWyyA+dimrViZubVF4SXirMZsgq43v4c/PyUPl7U
	7VTG8SiTZQIMNr4m7Qw+PTXYxBmZJ6QgX2DBxkvhT58Ydik4eEdzfTUwUMy1IZoR
	6H7YCNX3Ycpk+nkxQv5Mg2+IcpPl8m6a0PD9MAuB5uAbfYgatGkHdKsIuSYb52ja
	G5xYuWqeLc5JeA7y1tI454geRaty58j/jIn5Xqj7P/Bx1X31iK2zR8LoUr/y1xTo
	4+5Idt7LT6o75w31PLLgfVva69ON+4FB++tM9pwJmNGUxTZqBM1YipOLuCp7Nxwd
	dS7M2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvuk1qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 17:52:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93771aa0379so967384385a.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 10:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788889919; x=1789494719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=azgjAXmjf8A4dMcoN+gDs7MgRMcCWUuSNPeDhg+Eluc=;
        b=j8c4akVz3tAcVHDIRtrpgN80ZzjETnRl1tK03eV2B1khkUJVH/omN+9S52/pcoUrd+
         TR0f1wPW6oHbZ30NR5C37DbCGwm4KKCBUYkVCToQ0FH2vBbG+2Uyt7xz48UQJJoisoa6
         pjmQRKDSUEcLoCF6kJXqzWyesEGh51GdoUgg+P9/afIxY7Sy89GbnaaVUz6h88IWHZ2Y
         9Ta/dQwGafhVrSuCDw/k8taZ2CFTuKedi/k8VpNtYXhCpZOOEArPUzMo1e3FjnTc3N9s
         BdxFRJj1+npRbhueDiao+awcdObIRxH8YUbbD/u9tcoYuRD96oKBOKwzCHVAF2purwnP
         86tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889919; x=1789494719;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azgjAXmjf8A4dMcoN+gDs7MgRMcCWUuSNPeDhg+Eluc=;
        b=IIgLe9In/cNVGLoHaVJXeez7CTyXaaXFS+roEUAfQmrVmGZcr6tYdGYhrgJzKrI0A9
         TR8V0VBAcn+dsnL7f9NHZD6wOQPWB812lCQ9XBdBw+5pizG1FkRaMHu+xi2S1xPOB5Ez
         7o3QUZGt3p7AlX2ArkCKHYkHgUurEoMhh3JPUs2GbM5vzZOMB44dZrF+ArUrDOx6rlhd
         PNmEYVttTn7i4yojdJMTK2s1PqhyYgCDt1JE06dAVNGTCV4af+rbHOyrERJhA9X0/51M
         NmzZi8i3HZidrdzU3TS9JCjDEUOUig8LgKOXhE+fDStAvV/lfCQb7dCw4M1jjoGeGvs8
         RVpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkrASbcEUZPYXjkmsebRKMuansGCqvtbuzm4DTcVWnRaxngnHY7HFEjmJW7gehxECW6HcyZYfAuBjQaMxzWHEQW2F3@vger.kernel.org
X-Gm-Message-State: AFuF++k9SUB1N0l9kEWG6sG5cfNYlkvaeFAMfM+stCSxEIgc4d8dyKaB
	8CMZ+G38Af9sCl3VjVUi+lKXtQSk23366/ccFygJH43XaO1HNXNEETSVrnX3VWYsDZY5p6thWuD
	Jh/MJFn4lIowrBbGYV9QM3RbtbcNwsU3hKAqLTXQbjJH1RMbA1TekjVTMP6kqU8VomrTjs2XD7z
	dd
X-Gm-Gg: AYBFou2MraE86K4S1Bby75q+b1FDcVPtgzhUfGTBNOQ5lYKmwhdaCpq/NFSJwpSD4G+
	tY0s6u4yfRRrwxq/K0XPNSlLwJwJf9KKS+mNZK7QPN2ZuMq396GZ6kBv6nxbBZULWOyYWgBiNRi
	cD3E18msDoDmeuKq7bVoub0yBGxLz0VbOgubKNO6fybVH0l+wxtmH7cU1pjQUNoWShymNfYCFdU
	Iod33oOY2KSVThMsyZLH12V1v16Rt2R2h2ZV4gzKRKOnaF9I5xSaix2HMioynx9BVxErgjZUsRF
	VYXaMWyX61R4B3ntfKygyhvq1UZL7/lxAdPux5Pys6zOolX7/XKi8R6B3VvLw8piNSaPxe2RQ10
	GvIzgU11EJaxPulpRjeo2qC/9UE12LFlby6mYA8yj13o3Pvmx7a6XxIeHovFr0F+LG9PufpxnQy
	yrEH9P1oPDESx0ETp0lzLMHgr8sq0rx62HFebpnknxX9INHzpd0Oo12W/q14ZbFMfWDAQ=
X-Received: by 2002:a05:620a:880b:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-9398033d269mr3383246185a.15.1788889919455;
        Tue, 08 Sep 2026 10:51:59 -0700 (PDT)
X-Received: by 2002:a05:620a:880b:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-9398033d269mr3383239185a.15.1788889918979;
        Tue, 08 Sep 2026 10:51:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68e8f2fsm6615662a12.19.2026.09.08.10.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 10:51:57 -0700 (PDT)
Message-ID: <2666d5fe-994b-4f5f-ae5a-60ce9fffb867@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 19:51:55 +0200
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
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20260831201157.36397-1-johannes.goede@oss.qualcomm.com>
 <apcRAvoHkh9blDwK@black.igk.intel.com>
 <74f149f6-caa8-db4e-9ef4-5c15b7a5845f@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <74f149f6-caa8-db4e-9ef4-5c15b7a5845f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6aa04b40 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=BT1ATNTy4jSW_0grJ_4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: decw928j3Zcqf3ydL7I8hC3sQlhGYq-4
X-Proofpoint-ORIG-GUID: decw928j3Zcqf3ydL7I8hC3sQlhGYq-4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE5NCBTYWx0ZWRfX7JxfmooHIhUG
 3DhaXyGr96Rw5RlKV4HDNU2NKs6aWRMBSKEtszKKrh3T7c5XuYqC3OQaFTS8+xJQzb6i4+rbUXb
 I01wqv7UY6PqfkA4n81GxFByto3i+gR+bYkCypFwRJ3VBQl7pEQHTkIEFBTNPS4aKTu/Ni1YKeb
 txIG4ePQuDIuz5fY6FVU0fROTFzOwtFnzss257z+vGFmWZqv/D+nXdk8jdZWK/shPpnBI918h5t
 rPHmBqNNUOamfidPt8+H1KE/SPbIbct4eDQ1zip7N+r0OO1AmrCdVBzG0dVP/zxU5QlhKNnHE0x
 LKtJ85gslx/f0exA/w5V4aN45UH9XX5skzqnJB+NTvvF46sZmH1JzsI9vVoz91r/FwPwuCbF9Cz
 PkFuB18f2eZBCf0qg04jSB0dUOtjsnCoAj4V/j3w2UHCBdY3unuBxuwLCSIMsPYiJdFvYx4knmf
 ZhQZ/XgiOU7Jecm6OWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE5NCBTYWx0ZWRfX4nNwTGpTApDb
 x5Z4jO/nNltsN5NnSk4tBJk3vCj2Rs0L/3uQ3h6NhcZ5uNuuKELL5HfoNYbFW6bZCNdFxGnE3d5
 jVVQfvcMUp4JfN/4BMGJMA7DK11qXg8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080194

Hi Ilpo,

On 3-Sep-26 13:54, Ilpo Järvinen wrote:
> On Tue, 1 Sep 2026, Andy Shevchenko wrote:
> 
>> On Mon, Aug 31, 2026 at 10:11:57PM +0200, Hans de Goede wrote:
>>> acpi_bus_find_device_by_name() call returns a pointer to the device object
>>> on the ACPI bus, aka the ACPI companion device.
>>>
>>> gpio_secondary_fwnode_init() then continues with setting the secondary
>>> fwnode on this device. But this is not the actual physical device for
>>> the GPIO controller (e.g. the GPIO controller platform bus device).
>>>
>>> This mismatch is causing GPIO lookups by secondary fwnode to not work.
>>>
>>> Modify gpio_secondary_fwnode_init() to instead set the secondary fwnode
>>> of the first physical device associated with the ACPI companion device.
>>>
>>> This fixes the GPIO lookups not working.
>>
>> ...
>>
>>> static int gpio_secondary_fwnode_init(struct device *parent,
>>
>>>  		if (WARN_ON(!fwnode))
>>>  			return -ENOENT;
>>>  
>>> -		set_secondary_fwnode(dev, fwnode);
>>> +		struct device *phys_dev = acpi_get_first_physical_node(to_acpi_device(dev));
>>
>> It doesn't look like an auto cleaning pointer, so let's make a declaration
>> outside of the code?
>>
>>> +		if (!phys_dev)
>>> +			return dev_err_probe(parent,
>>> +					     -ENODEV, "No physical device for ACPI GPIO dev: %s\n",
>>> +					     (*swnode)->name);
>>
>> Hmm... Why not %pfwP?
> 
> Hi Hans,
> 
> I'm waiting for v2.

I see, thank you for quoting Andy's email since it never made the list (1),
nor did it reach me.

I'll prepare a v2 addressing Andy's remarks.

Regards,


Hans


1) If you go to:

https://lore.kernel.org/platform-driver-x86/20260831201157.36397-1-johannes.goede@oss.qualcomm.com/#r

it shows a "not found" <apcRAvoHkh9blDwK@black.igk.intel.com> entry, which it
only knows about because of this reply to it by you (Ilpo).
