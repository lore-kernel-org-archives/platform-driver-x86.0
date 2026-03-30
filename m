Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543DB3368A5
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 15:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883547; cv=none; b=TMK/qujn9PsCM37uETLqEYadNTojYewQHgMYDK7TiUlEMdD/FpR2rya30OwdTKy0bLmGB/FFsxBqe3iE5s5Gc595yMjBGfoMI98puugc/2sc0PF8JZgixzXEh8GS3edW8HTtztQTW+yfeZSoGcO4jk4IscBDwFyPO9+7YtOf0DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883547; c=relaxed/simple;
	bh=qtkVpFIt17h+XtbVcQYfq5pjUgv1xnIo5T9F5keD9Eg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JerRJmvwH8/rfBqpxi6rVJFDnG2rx1I1SWHoGyK5V8E74b1/3tQXuW8ZJjOMMX4JTBYZqcT6NTPeDKw1HmOIzzQDeiPx9MXKixPr70mObfNvqAIYSKomf1YUS5SEF7cWp9SmeFpnolsckfWyX23i7APIbVN01tWlmDOHreRpGbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pM0qsBaU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJaLst+j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pM0qsBaU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJaLst+j"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UApnfQ2723211
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 15:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pCq1rraO8JDl6If4lOy4XQOIMxgapQ0bokLUVWDiW68=; b=pM0qsBaUKEivyw7I
	L0oA8Yht5rdBskd6bXlBaLcn811qig9iwJp7Vwj322xYgyzND5dv7F37+SvXTlD/
	oW3zNRgwlTzl08e4BYJZctyPnXXs+adQJ+Ig6MbLXoqPOIS5EYff5Km0aIU/FJZE
	nxVuPeOo3o+92ehBO+Ad5fYMJgSflspivAdJdDV9XhjEcSDKvpqdf+rqfCFWCIqH
	S74NP3TSQ40iWkVvgSoQ33zggiTbtV4HDk6h1KRNxEbLntBGggoyhWN4g2fkNiWB
	U+ihiOYOcPQOe8Q1FjOZ3j/QZJT+kHiJE3cIcY9Kw39jV7z8iIkh9RWrUAD2auB+
	5YQOCQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7qt0h2x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 15:12:25 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-951bc4921ecso7558872241.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 08:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774883544; x=1775488344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pCq1rraO8JDl6If4lOy4XQOIMxgapQ0bokLUVWDiW68=;
        b=TJaLst+jfH5/dutICSzqUDziBK48w+khkwTj2OGKlsX1HlZfpvFq4fhjBbIdYHixjV
         A3RaT5DlCA1lqZdD0hPPsXwFKycm6He495V+qhp8QXwCupFEFTLfHJdKtbUy9GNmutBb
         fz0QO2q3bQQdZKvx0gXefXBewvXIfPLNjnikk9YrgQrDngd/ssoFlreFm6Al2CKWlwHS
         eZDSWyEhG1NleZ1GHAuOPiopHtJoVWI30Wl7uZ269e/ZNIXbUY145Lu2uRbBMoVZUVKK
         CZzQvv9T33AZOeDRtb+ao/DX3GhxZHwlWSedPbro4fXx+2kgthXz5A8lkmBPJ1YrlqjC
         zvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774883544; x=1775488344;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pCq1rraO8JDl6If4lOy4XQOIMxgapQ0bokLUVWDiW68=;
        b=b/ULmmpr5dFu9nOOcAag+KP7SZ/HT/L9a4Q/Rbm9sgLqGgN2kui/tlo/2ueg/ZpUS3
         bpDAWBXcqAZNBFPPoRykY6QsEwfP5F8AaIUOI2v9jVsjZ++aAdSB57SmTDNS3B9bJ6gl
         1Ex54qhRjQ1hYORYHQ+JEIh9VDbwlKTo61TLkkmfsSfpMzAROfW9BxqWQPjWztZRl1dD
         YrIvwCFk7oPhxXIRi+MqDI8AwXdfz/Up8fNm/D76uTxeZlyW+ufztaIi6AxG5HzNaUZk
         CRi/LwjKP4QNzij7TsQ6c7b510RNDHY7eyaUGK3V/oTFby1mxNJ7zYG58TW3ImDlaefW
         CRxw==
X-Forwarded-Encrypted: i=1; AJvYcCXAuK9DzY+exHt7DwMz6+8w1+gziJvaYM3HK6SmMfT1CQs12F7StBWtbB37V7ukgFvycOzdie0ksr6nN40Pqmsswg2t@vger.kernel.org
X-Gm-Message-State: AOJu0YwKVxp+NfQDtzSiDuTV2Ag5/YTGkO7yYcwKx5E/PHvN+M5w370S
	ZhIq2qrKPgzovPu5HWz8tVLIOxf17tp/sX4sGTluAGPHVDnKbq9pVWkG0atdkxisQ1KwqWvo4w5
	Megla9QvNZRZ8M4ufFRcY5bQjeGAz4YSrwdTeSn1zXCwXMonqR2ZF3NFxwagGC5OeBDHtxZ+zjp
	+NtDTIpJzf
X-Gm-Gg: ATEYQzwQIjDCIIQfTYtRI3qJB13H/1O/2a3Jmpatd4tebBu78ihQL7+uA/2xAlx8y92
	HSLpCRnWF2mkXqtSxaUj4MYE1DxRaBK/aPYg1wt6RmMXsPOMZrC4LGaiHoTbGY8nTU80hH2tksF
	+c2S11QlxSSrSjxw3bcendCd2RW1xSo/az+GGYbpHoGZ3M9AOxuTRihEhogZwYZIGWDVYPL/GCw
	CHIgQN8w0A3oLI1OOr9Mmd6h9+mrge5rU9vJ7ehhGw+eQnJXJI+27WZA6DU0FTqeT96YZmrZH4S
	SN934Nh6imXDL3XKlG9FmdyhIhyOlzUZpaxI3EIV4ugi3yjLiBuRdCtNbnvtRupOG1Ic7+9yBdW
	CnznOakhcVLTz1yLskMdVndy4XRoGPkHHc3Bi+we/5Z4OVP/IP2xAG1ERow9Q4/IdeG+rDDomeE
	5efX8e82mChYelmLnpdZOsSZirSNWg6Y6k2hkdaMszgf/UfaTxGQbsFCbAab3OQV3Tpgg2Vbq3G
	xaDnqJPSal/o57l
X-Received: by 2002:a05:6102:800f:b0:5ff:ca6e:c897 with SMTP id ada2fe7eead31-604f92e435cmr6041246137.25.1774883543913;
        Mon, 30 Mar 2026 08:12:23 -0700 (PDT)
X-Received: by 2002:a05:6102:800f:b0:5ff:ca6e:c897 with SMTP id ada2fe7eead31-604f92e435cmr6041226137.25.1774883543487;
        Mon, 30 Mar 2026 08:12:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae52064sm294217666b.23.2026.03.30.08.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 08:12:22 -0700 (PDT)
Message-ID: <06317144-d652-466a-86e9-da2569a1acf6@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:12:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v5 0/4] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe)
To: Marco Nenciarini <mnencia@kcore.it>, sakari.ailus@linux.intel.com
Cc: djrscally@gmail.com, ilpo.jarvinen@linux.intel.com,
        andriy.shevchenko@linux.intel.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327181031.1489365-1-mnencia@kcore.it>
 <76baf0c3-4c1f-4169-846d-5c74dab69a18@oss.qualcomm.com>
 <acqO62_87TM4UZMI@spark.kcore.it>
Content-Language: en-US, nl
In-Reply-To: <acqO62_87TM4UZMI@spark.kcore.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XN09iAhE c=1 sm=1 tr=0 ts=69ca92d9 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=oQ7dI5K__yXUcHZEspgA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: YwbppjCtqFcIgIzzT4K3ZkeY_drS8ckZ
X-Proofpoint-ORIG-GUID: YwbppjCtqFcIgIzzT4K3ZkeY_drS8ckZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEyMCBTYWx0ZWRfX0aUQILfLf5lp
 yj2EahfLOjLiOW9gduzkvplqH5CAgKAnS94UzokuJ5FmuX3CLJrAAWlAAHeTSVP4g8PRHiyEuiS
 fO35N9nI9m+LtjReaGmeF5CZZY4lFrN/4evnDSv+7WVOniYsnrFgmeLW5DFkEFUvZWqHW4k3lfX
 H+TcKUkCQnuahbYsUgPGr0yigTMtTREGPMxPuZp1Mqz2hIZFoFU1TbUSrnNrcSPtM91hS+JWK2i
 PbPnkLk8QSWY8ERbW7g9vSqF3Ou+6KJo+5Wg+Pajtnw9VHO3IPhDD3dEZW6VmZZJs1J2igbH06R
 9852sP6PHA995zSzvdRxhM8AgmVNvhrbulSxObkiDo1Oa3y1zO7cQfGdH8B91aLiIvD26ROK3Ft
 pWA6WcqV/925wKoqnc5+DY89FU8V8LhHK0bcpGKZO9+YcV3js7eFIG7664ynbrGCHvCW4DIJwLp
 0H8YmGHVw2ZyQfwaWPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300120

Hi,

On 30-Mar-26 16:55, Marco Nenciarini wrote:
> Hi Hans,
> 
> Thank you for the detailed feedback.
> 
>> My main remark on the current patch set is that IMHO
>> the LED name really should be: OVTIxxxx:00::ir_flood_led
>> since that is what it actually does, strobe is typically
>> related to flash LEDs which despite the naming in Intel's
>> side this is not.
> 
> The series actually started with "ir_flood" in v1-v2. It was renamed to
> "strobe" in v3 to match the GPIO type name used in Intel's ACPI _DSM
> tables. But I agree with you that the userspace-visible LED name should
> describe what the hardware actually does, not mirror an internal ACPI
> label. I am happy to go back to "ir_flood" for the LED name.
> 
> We could keep INT3472_GPIO_TYPE_STROBE for the define (matching the ACPI
> type value) but pass "ir_flood" as the con_id to the LED registration,
> so userspace sees OVTIxxxx:00::ir_flood_led. Would that work for
> everyone?

That sounds good to me.

>> We really need to get some input from the V4L2 maintainers
>> here on if this is a good idea, before merging this series.
> 
> Agreed.
> 
>> I can even imagine
>> a default simple mode where the v4l2-core just turns
>> on the LED when streaming starts and off again when
>> streaming stops (very much like the privacy LED) and
>> then in the future maybe we can extend this, e.g.
>> add a control on the sensor device to make this
>> configurable ?
> 
> That makes a lot of sense. The current series intentionally keeps things
> minimal (just exposing the LED under /sys/class/leds with no V4L2
> integration), but this future direction sounds right.
> 
> I will hold off on sending v6 until we have agreement on the naming and
> Sakari has had a chance to weigh in.

Ack, lets wait for input from Sakari here.

Regards,

Hans




