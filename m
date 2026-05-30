Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80E83546C2
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 13:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780148090; cv=none; b=YrxK1TuA26AWuy0B8gqSgrjubtvLjl6YgWyGqCFFmmCElwYB7QwvIQorp7evAE8VrmEm9n3KYyQuzxFnLTUNeZaNk5k9MZp/4dti00h10OWVFW/tg2w443wqBvlt7kGZ0m+N4c+Nl6VQ/v4VC2MVHBQoruOVCfjExSvP8+PGByA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780148090; c=relaxed/simple;
	bh=nZm7/KrAFnUmw0HLeCbq5IVzJNNGM1ZDj6512w4P8Y8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lnvzV70IskZuJhDkhiUKrXc1wd6ep8gM7dlDOQsW1ZPYHrWzhrgA3HVTnBrMqaRKEfZcSBPtWK5swetEQ6cSfwvZu3wQJKVEl7Ph1wnYi8fArnUupBuoB68x1yZGm2GCE+4Hn5Uv9VS8ApU4KRE3/7He5if4FUqV91b31Ki5D7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJk4ZQAw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYlsJ6DY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJk4ZQAw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYlsJ6DY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64U3Q25d1399325
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 13:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZoiK8MxIGVbxIKBU/zLhqCKZIIFuB7l/xTg1Y+vmAc=; b=CJk4ZQAwCqxaXy3r
	L2HLKZg9u9DRzbofSzp0fLi+FRrJG350s7E78UPm9VzTvligyzWOUzAj6ef0VKP+
	I9pKrRDQs/e3HDhpl7l5bOFe2NE5MoT2nWM6QJS9zW0gUHB0sQQQbVfbRCr3vcMW
	znMCDkJDeCwYusRp/DvZTQXMMn+4DSz608FBT9gnWulhfuHUT1/hlMBCpTdua9HW
	LfS4Kbvz8z0y1hiN8OWnONUwPVHDoZKyZw0iMpPk1P6I7JdFOxGHuWmOHEaKL22D
	xUgyR/H1xF7XY3xmN9sUeyGnaxsjnP0eAfYd7CgSauGF4NZxRzQSRErUmrAqEADV
	9VDH5A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqyus11a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 13:34:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d4b3f3a1so175663671cf.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 06:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780148088; x=1780752888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vZoiK8MxIGVbxIKBU/zLhqCKZIIFuB7l/xTg1Y+vmAc=;
        b=ZYlsJ6DYJKiykTHVfesJ/D34RApF97+DhNyv4as7iNwWp2muTAw1kC4LOHeEuNmSsf
         RESKzKgBG0YFK2cd39gjOEtcrdoxdWPjac+gFtli9Cfhcl+hdYF5VK8NVCt1m+uip7FH
         O2cQDsm0EpN5RhJXBPq++Biu1oimi0mOhUsRjR0K+iPjUZV7993zIFyTVaHDPIiPlOBP
         rqWxtc/hLUDMAOnBmnK/X+cXEGKCJ4IKED7Yg+QcP05FBClehakMsb+8klorIRmhKEPk
         hfkCUS8AMbW5tRkRf+BM93pQ/SgL3x2bd5p8zf6qIvx/R6PVr2K/8nVy7i7AWKSlK+CN
         9RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780148088; x=1780752888;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZoiK8MxIGVbxIKBU/zLhqCKZIIFuB7l/xTg1Y+vmAc=;
        b=V9PqOzY+Si3AeOW0LYjOrO4tXCcGsLWvYT9fikVFrjuJTZ3cxg2uAA00PbkFaGbo4g
         Eh+D9Rq1NCvfsEB8XC34MaWfPXvNJQaIC11223NfC4n+7EvY2BMfKbX49TPb/b6dlZtY
         j9YFlm7sMgavk8FoEhu6yJGjsbBFM7zNtvWR8l1x6OLAjlkjVAfcaDQNLRLOVA6boElK
         PndKYZ8bZFEoXcfEtY8kwIi3cYeOPu/t1qSQ4Q2btH5wKaU/yqBJh55sMhO5Tkw0hVGD
         8cATS+TTNY5tHWt+5FxafbqtQ9kD47UfLEZqHIeIyXeebJPieu15frCLJ8PNCdcr63v0
         D65g==
X-Forwarded-Encrypted: i=1; AFNElJ8bQ0ULWWSxjFTRgIM3haoFMXHl3O6X4va7+9iKD79+BlZRzm7PB8uQjc5OugfgiiU3IWr+olznAfQd7OQOAPPs3tWs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+TnfSgC3Ib0ejRgZcC1R9j+cOsap1ITP6x+W0UJddxFz+SboH
	yvDTYs2EeTMbm7F5tikpHBBjjaNL+89qt6YeWWVjSRlszAHwXv7q1fcPGIs6vEM4L21gn3k/H9+
	tVwqOtdhjuSi8TjMWDDCPljBSLj6YY8mTA3ct+b4UxPXrtzE7rYEbw42+Vao+MLauDSaXFgUxO5
	c0
X-Gm-Gg: Acq92OF2z/05Tf8v19bB4Ad7X/6pOtBxxzPAqdtM6N8CPiHcBBLc0jp6iTbB+buwhKJ
	rtlbPGfnpZR69J92LJTP5MAOtkqqoHwLh6d+HwQxaV2Kk+AeKyySu4njPXNZezg+64IGQhlael1
	SVn2CE1e965PfRvpur1rveqPzm+fClhuV0ecql6twf8I/z97mldjUlOzXGrCR0vFt9HNtI8gU0W
	qfo+goq/QyhPwsL8sX9SGSrCmyvUqo+Nt6jUfV86ubsnJ3eundTBy8kqGQON8LnlGq/diOkzc1l
	CceeOEbjCKwQjDqoV2qxZHp0JZY2m4WSVuw+hNpZqk2Ui7PqBBnxrlydn88Fj8oK6DemYRJy0ZT
	b7Rau5H1H6fB4Ldk8S0xlKU0CsMX7TUoVpiu1plOYIwj6Ecdm5WIJIytmlWcbrXCOfiHoEhwnO8
	JLlkCIJc7nraXFzpyWKMNlhZa680pgbI1tELJdJ+iVPnRo+387hVQaFly8TrK4o7Ef+KSBOACFZ
	ZGM0Q82iFgejDsUyPds79rR97g=
X-Received: by 2002:a05:622a:4c8c:b0:516:dcbd:aab9 with SMTP id d75a77b69052e-5173a67adb7mr54009801cf.16.1780148088262;
        Sat, 30 May 2026 06:34:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4c8c:b0:516:dcbd:aab9 with SMTP id d75a77b69052e-5173a67adb7mr54009351cf.16.1780148087807;
        Sat, 30 May 2026 06:34:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-beb4356b901sm38478066b.9.2026.05.30.06.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 06:34:46 -0700 (PDT)
Message-ID: <8503d297-68ca-4bfe-bbdf-537a85890d86@oss.qualcomm.com>
Date: Sat, 30 May 2026 15:34:43 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [REGRESSION] Toshiba Fn keys + lidswitch
To: John Veness <john-linux@pelago.org.uk>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Nick <nick@kousu.ca>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        regressions@lists.linux.dev, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        todd.e.brandt@linux.intel.com, xi.pardee@linux.intel.com,
        platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
References: <E2OXET.4X5GTP37VTNC3@kousu.ca>
 <CAJZ5v0jVQyWYqPo_MiUwNQb7FLNR_Q_++Xq=xA1owcHpcjN=OA@mail.gmail.com>
 <bc9d5258-d4df-46a1-bba9-de3486f722ab@pelago.org.uk>
Content-Language: en-US, nl
In-Reply-To: <bc9d5258-d4df-46a1-bba9-de3486f722ab@pelago.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE0NiBTYWx0ZWRfX9hJntLdd8CnK
 f9zFehkP5gdORmbA75RDSmxgll1wFiPpB2c8eAE/ZH47x5aLDaVGIZRw3eX8sUQTEMUjcXIYu1T
 bxt6l4vs4+VRq4touopNMEz84EDheBnswhhzHLcGjEknFxsRinvImsms2+uqrHcC3e7uvJAkkxH
 f6LEXvTfs9TJodnYwsnPQIPUfYwuA6TbrYyZXLFU9QRZeonXiHEngZBZEB4RrNbyxjbAfDJS+P0
 15vdqXkUDfhhFA9euyXn7sTTa04oXzR/X3RIZ2Jj6az/QFUSyKzTWL+HEn5CKmu1WG70VP9DebV
 2fQ76iiIUUJVqm7njx5jk7ORDeqI90PZF2pCyZ/7K8RsXnXGsetPvBOSrYp/j1Bh3HXld5Em2Yx
 BGlrXJVWEaMksl2836msLTu+tS7qU0DfL7gvWfOY3XKeiJUc+fW1iWIGsmujy1fFlV1y1XcTD7j
 KAvz5O58iiYq2bO0jFA==
X-Proofpoint-ORIG-GUID: drzlj_FV3grKG8qYxCanwB-Dj-fkkuEo
X-Proofpoint-GUID: drzlj_FV3grKG8qYxCanwB-Dj-fkkuEo
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a1ae778 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=jmGAqP9c4pEhswuVvyEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300146

Hi John,

On 30-May-26 14:19, John Veness wrote:
> On 19/05/2026 15:08, Rafael J. Wysocki wrote:
>> Thanks for reporting!
>>
>> I think that the problem is acpi_setup_gpe_for_wake() doing too much,
>> I'll send you a patch to test later today.
> 
> Hi, can you release the test patch publicly? I'd like to test it here,
> as I have several Toshiba laptops whose Fn+keys don't work (apart from
> vol+/vol-).

In case you've not seen it yet, Rafael send out the test patch
publicly later that day in another email in this thread:

https://lore.kernel.org/linux-acpi/12896447.O9o76ZdvQC@rafael.j.wysocki/

Regards,

Hans


