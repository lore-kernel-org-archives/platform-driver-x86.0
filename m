Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604A726ED3E
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029832; cv=none; b=sIFJub+TOHIj2X15yQmId4QxF5j6yjEJkY+jpGxMQwZNu/uPeit3caHX9wBy1z/ZlOuWBeO3xSGRbzEGR8dI0Hrl8Oahd55M6KFN4cwkVCbkxdYvtrbwF8dru99PIHQ7wMefuClmYjxJEx2hWwmzjvBscDfkgAseOM2a3ZRIuAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029832; c=relaxed/simple;
	bh=eEr66d69pRMLa7uye6L6l7GSlIwsxhWoejkxpcsCj7w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PurIbKca7LAeBbp7qrtfTLOPHaHFeDPlj8AI7Bn0q6AHiaZWOiqteP23CMJI4Ab6fNHYcx4X2QWBsUNcBV8BQOAGLhVd3TFVTEXBGdQGTJFyFGdtyCaiUuWiBrsPo/0PF519WTNG+Mgf08IakkbUXW94vrP3v536HvcecGbRT9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYpbk0P4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MINZsS26; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYpbk0P4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MINZsS26"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gq7A810317
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 08:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MtiGDKihwWXaJj+ph8EISAiatJoUykhVq4J6XnBzE/Q=; b=dYpbk0P4OrOxhO21
	WzPEyM7wBniiHqjL7jQPgwTSSMCEJVEMXIBKdmV7Qmw0fYaXekS6bedaq/pbnSWZ
	KJJJLBNYjOSQzahOoBgj6/D31UflfXGo3oXYrrjWFPE19IWZffCtQWtmW5VvjV8y
	84EE7slIhcdO9N0p3hygd090d84SoXzzRT6npNNXYOqq9cOWxhZdNHnzbXuG/Kkt
	GG1L3gsvYQSKcQ0vPhTha7S2Y6oGXLse6tpcTv39zqMb4UjhmHmFW+/OkM+RcWox
	HbFcIvArlpYMIkhzvMHnaWoFjqgDOyVXbsyE0KBRLtMpDEl2Y/DJJdI6iqWreBsC
	hGaYiA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydjwx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 08:43:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939665a1ae6so952251585a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 01:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789029830; x=1789634630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MtiGDKihwWXaJj+ph8EISAiatJoUykhVq4J6XnBzE/Q=;
        b=MINZsS26CJKuWtuoK1AO1waLV4vCcikgfiw6UQa1eAy4bklP6P2IvKAyBwgBv9SmH8
         HOwKTNHDBpcf/NzteWCqcvnV5QEXn+GVJKen/hsibSPSVvXQb0PdTsTK7lHx20WtEBui
         wxRn8mrd2/OOyCy+13cvScoUecMy+W5anNnKVsCvduoRDFRH4FmAoGLjBU5RFL9dH9ky
         AssAmiUzgZWhOd19y+rZ4reA4lnEcCENv0O0H0dbJOrjL6zltUefFJqji4Hd01QBf8Ls
         fMrViv9iUzopUe3WS1AOi3wNAvvSQS36jbbN+7+mrwpqziRLwOl/XIT+YfRVMh2OWT7J
         82SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029830; x=1789634630;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MtiGDKihwWXaJj+ph8EISAiatJoUykhVq4J6XnBzE/Q=;
        b=Q4CVTGKbvo16a2A6Nzcb4dXevw1sEgGoya9ldsIG6y8ZyhIb9woPwu8+KdivQBsxNW
         mdk+RZu8a6IRon2QpFbZQOBQ/mw+B/Mlth3+X5/uarI/QuL4YA8L/SZDjF61SxAWYFdS
         vkFr70oiNvwqpLbOGMnK6OEg52mNsXfj3ogHTpTX+y8p6vW1gsve/xoNItjJcgD6Glle
         6bQbGXcw0upIAuqQW+Hz63mbXH1p/UDqglRY2CmQK0uOV5c3SA4jpyOV978yLjwk2SHq
         tYvsQBlzHIUKsZOkFU0yXBn30eUV2fUhe+RFHUlcCOzIy7S6LfCKmwTolpdYAYgL+uvf
         b4+A==
X-Forwarded-Encrypted: i=1; AKwUvBxa0ZL6nMkhcijSIIhRKJWZMtVW0w6uOOyYQnxYRxkPHK8xgGfUJv+3SWNRReLui+je1ez/f+JGkc1i5Rk8jLmA7lfv@vger.kernel.org
X-Gm-Message-State: AFuF++kZ0YbU1IXUNQTRXWFGdtG/0CvE1fzURDkpXIOnbZF+pC0XzFKm
	Pl9aRka0ykdpRw9cLw0npBQkAK50gbtzNNijpVaYH+qexv99/m4bONxV3H3fr8ItB1K8Z90JrA7
	j5kGyqW4xX6XxW6yDC78Lsv7ucgNfo4GvdLGrqU5+D6RTiFzdipIMYHzNTPrsFHh4uQK3EtC5xl
	gf5fOGXwa5
X-Gm-Gg: AYBFou2Pld4Z0AJffzkmpK8ahhCg0NLjjPLgcBCtMWRTE0gSM2KBtbxoO+Ir2JKrTWX
	r8vjOevJDbEWgsonmd78yR5VI2oraN2f7xZy4W7P+DgudTL9Qzh0ZGC/njFbt3yW9CjqPyU0yw2
	yBF/UOWgAGxPlXfKWDwgKEbU3lIhlNKwEEWiHx4sUep87kjJ8G7EJIocanfT+XbgmSjz2AbYgYv
	R/ZZMz+b1HJIQPhdQP11cks/z0F7F0LBlNIl91gwqGeqdZZKzoB5zxdxBYdeQ9RWbJ4GVCALoGK
	EmdGl3qXyZtbVPnCpq5QRkBpONdO/m0K+QVOMx7734MF8SrJi7WelZxp1SJD8AwDK5mEPU+CZhI
	EFkSfOviIVtdkqiyrJIsDeqcJIkV/XXRk8DG4AaOqnHctalMzMidsV80ATNXDESH4u7YgyGBiug
	Euys331bN8lUih8Wu7U+ulum/a3pm1b7sVoXX7Gd5a/4W8ZR8zgQXfnaEsxe5EK++Y00Q=
X-Received: by 2002:a05:620a:8423:b0:938:fc91:91ce with SMTP id af79cd13be357-9398036365cmr3566661685a.20.1789029829648;
        Thu, 10 Sep 2026 01:43:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8423:b0:938:fc91:91ce with SMTP id af79cd13be357-9398036365cmr3566658685a.20.1789029829086;
        Thu, 10 Sep 2026 01:43:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm801689166b.25.2026.09.10.01.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:43:48 -0700 (PDT)
Message-ID: <bb913cfc-288b-4ce6-befd-76c774de4d02@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 10:43:47 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] Input: soc_button_array - fix MS Surface Pro 11
 probe failure
To: Sergey Lebedev <lsa.uz@pm.me>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        stable@vger.kernel.org
References: <20260909093934.29411-1-johannes.goede@oss.qualcomm.com>
 <20260909102521.67488-1-lsa.uz@pm.me>
Content-Language: en-US, nl
In-Reply-To: <20260909102521.67488-1-lsa.uz@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5NyBTYWx0ZWRfX1/ssQ0PUX6yI
 JRGSY6Hg5Oj1NL06NwIv6uSEIXsik9sE7/uXeUyakykfZRHMn5GCGpk2dlz0ekRzN9lOO8wkmfw
 7/uf9g22IyL+zwjrma3UQiGMtYbFtMw=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa26dc6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=ruf0KxjLdvrAcJlDzccA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: qrynvkMGtG6gHyjSR3tojhtEsAfAZXhY
X-Proofpoint-ORIG-GUID: qrynvkMGtG6gHyjSR3tojhtEsAfAZXhY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5NyBTYWx0ZWRfX3ZEj6vfFlkwM
 JnE2gr0+kOLB8YpzftBfdNSAeZw1TwocwuJXdQ9APu7fHTyoH10nSLz2b6iQ5XJNzJ/ZQDGJT50
 vbFaWmh9FaVrO/nxfssR+39T2TqCmbXIQ8SM0ETcUj1dw7TGwPz9qR44sbfpmAXqjmFXosNFzH+
 6rl2rTbW0EUG/pNV/vhbUWdDLCAmVOtBPs8TuX6SpcGLmmhtTEIGjSBj47mIekW/yDOBH67pwqp
 7tejnX/9PPrrdzV7/ukA5UUaqJbceWnRvvcZKTVPCSKoFxurGTZ7i9gIvze2t6eQG5ZqIotmzn3
 t6jeiG8q6bvZjvUyVHwywzF+hxhazRqYc6gN7a0MXUKO8brmshK9Z48jpKoHbT73B5JM/CbUBHA
 EtXSKoPTYFEuVN0e3IM5sAdBELRfBWU84ZiKCy/4wVifT3O6ZybA6oVLTklHW4Jff5gowU4V2zH
 X6Zm1zAbq3po79Jd7uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100097

Hi,

On 9-Sep-26 12:25, Sergey Lebedev wrote:
> Hans,
> 
> It fixes it. Sixteen consecutive boots on the Surface Pro 11, every one with
> both gpio-keys devices present and MSHW0040:00 bound. The baseline in my
> report was 13 boots in 40.
> 
>   boots                     16
>   buttons appeared          16
>   first input at            1.242 - 1.377 s
> 
> For comparison the 13 stock successes ran 1.28 - 1.78 s, so no boot here was
> slower than stock managed when it worked, and the spread is tighter. The unit
> that binds this device by hand was disabled for the whole run, so nothing
> masked the result.
> 
> Built on 7.0.0-30, Ubuntu 26.04; both patches apply to that kernel's copy of
> the file as-is, 2/2 at an offset. Ubuntu ships the file unmodified - an
> out-of-tree build of mainline v7.0's source carries the same srcversion as
> Ubuntu's own module - so the tested source differs from stock by your patches
> and nothing else.
> 
> One note for whoever tests this driver next rather than about the patch: on
> this install soc_button_array is in the initramfs under MODULES=most, so
> replacing the module under /lib/modules does nothing until update-initramfs
> runs, and modinfo will report the new one while the old one is loaded. Three
> boots of mine were recorded before I noticed. I checked
> /sys/module/soc_button_array/srcversion on every boot above.
> 
> Patch 2/2 was in the same build and caused no regression, but I am not
> claiming a test for it: the buttons appear here, so this machine's ACPI
> descriptor package is not empty and the new check is never reached. So for
> 1/2 only:
> 
> Tested-by: Sergey Lebedev <lsa.uz@pm.me>

Great, thank you for testing!

Regards,

Hans

