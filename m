Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF32431A4A
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Aug 2026 11:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841515; cv=none; b=TfU+nsC39TdHcW6xXbk56XG6oj8MjuRTk3Lez1drjqmlKEoLo8V2a6/wwmFkTAlDZ5VaEmX3+crndbTNrWMZAF2I7kfyj5O88XH8U2zVvD/hCzKV91bL15NIum+mvJJSmYXhjClumEFZ5TbI6FNkMNJWmqEX8vrRZBpvmscScvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841515; c=relaxed/simple;
	bh=2lY0SOEwL0ULDDS/GDmUQgLg2WOaE32j4is5YMsE2T8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HduwqhBcyyUwox1hJFj46NZZy+qSdTt4YXMSn8bm/l/CAvMgneGLyirynCwTUIYaeRSWmylH5/Wn6pcZiOphX6in/W2sK8ae4yTU8JhNctBnyLB19Lv7j6dSLT3OLfc6KGW+cq7B/II9EZ7ZSRUQiQk9EoE6hoLofYqWuiS3iEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EYNXCi6/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADWj4ueF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EYNXCi6/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADWj4ueF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CHTj3236537
	for <platform-driver-x86@vger.kernel.org>; Tue, 4 Aug 2026 11:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEAGrPimEHKTw1Kpbd6XZIudXgicxhiY0c8XhCSfyL0=; b=EYNXCi6/pebLxskk
	2k+9+1+e3q7sw4f0Gayb7A1RXpNyrx8ANCaLzBT+q+zFR8CGIU6muKBD8UoOSzUs
	MQv6HavyobpLTPfEG5RO6fsNEtI1a7jaftnFQSXoWesi2BqFPdt8bP+Q/nf2vgXG
	ldm+u7uoZlfGOC8GIiccWex2Lyt0EuMEqW/Aptd+EEBdfEbE9cwcK13r4/M/ILXE
	hthII4fy3Wnt8ae6iO0pCJuG1DJ/xSpm7v/0nEZ/fffII9NJpxBmyi8A4ojwRX3z
	2btOniUY4ktRwFhEmJaXQ5vZdVXS+lPwuvfzUXRxBZQXMcI4U6//QUp5nm815fm3
	5bqoBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu5hqt93v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 04 Aug 2026 11:05:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so51438501cf.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Aug 2026 04:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785841506; x=1786446306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SEAGrPimEHKTw1Kpbd6XZIudXgicxhiY0c8XhCSfyL0=;
        b=ADWj4ueFVHNNPabSSfoNDQORkIitQuFPuZmNhTyi52rk7f66FIHjTh0TpVR+Mcmcc7
         o3LsCZFRlAupMyWbFNQDtJwYdy3dJAHT3st4Z9zGzG4A8Mo7pGEKPY1vuyB0Aov/E7Re
         gyuyl1H8gUMmKT6QrSJ2s7spNupAjC0AD1+wFq6oYMtfYJE+Ohbe0gY6wU/Qn6vryEr7
         8KNI06rHxG9FEq7wQ2MfkugCcPo73upF2nUoNoooKzvnPvq464+9f3Dgn5dDXRgmOqp7
         c5NL8EkzOOjYL96g7/P/Jps5Gx1itCBAoFzt9mYTULzazfMXm3J5j/5FcXzQeSN3zHGu
         CRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785841506; x=1786446306;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEAGrPimEHKTw1Kpbd6XZIudXgicxhiY0c8XhCSfyL0=;
        b=nrqWxdb2tfm/Pp4e5hQSbB4OtLxFxIbFxflU6H9HVT/PxwMe7snzfG33QSlY8jtUu3
         m0DnQaGR9GdA7oKRKirhfWYhL9wWIlglah6/WVe+BSJRkyD78BanvmijyRwQe0gU4gcI
         cqZBHsNqpfVEZPwCFrJ7KD1Hd/jHbYTh/QRRbdJpjPHUgBSOfZRRv5ncAMAdjZ2h+xeO
         NQy0mz7EXQR9OjxATBw1prKdVg+6Ov+ECstPqqYdcBmfSoubNSFPo713YNZYAhbAyGAp
         VDS0rgtm0JJA9yFlwNuDtcSxTE+julJfLhEU33XbJ3idHpOaULdBVj/sSLS2gmHPFVmj
         XxOw==
X-Forwarded-Encrypted: i=1; AHgh+RpzjGKAAwUXYoMl8NDU1LjG/3y6Mt7QCzYjxD8AGxfhE6I5Ecl9L0YkFrSEXD6IH91hqXR4DoEQu7usi1H7n8ucBo3l@vger.kernel.org
X-Gm-Message-State: AOJu0Yy71UhcK1k3nuCU/aeKBqyXAK1IXx1ObyKrl3jqY63jCFJ10Qnt
	In4t4ECscFX2ubzL7HxjDjsHUb47FlVqiGSi+0xzvwBAtevUxMBi015kcL0Nx00e5oaxyur2tGQ
	VcTyzbvzIXf1IOYRmlfXMNRmyxBs6otds/zo77db0lMGZArxHAARJOWWOdULY9QFZ29q6q8N6Du
	6F
X-Gm-Gg: AR+sD135dBdYwbYkMnjP/Y0O2e8avYg4MpuXn6XAcTcgUArRjV9Ohy/6t1ZEP5Cd1gW
	xmghasMMdRRNjITkaf+wq3UY5ltHYEsfDMrXkkxI6GZlso1BHV+x1jUcsNewLSLfc2hhZyZJufq
	IYG4nnBdVUquhSZfwtEiu5aLvNsdA7QTOPUPiukbrJrGQsPPIvePpDsyuUK44FG/IL7pdh4BQVb
	lp6ivViqwI3IQ5NYWFQJB5lmgruNfALYemDclkmOZuiqxfh04aQq10hdQIGHd8IbOY1N+bwv6v6
	SU3pq7aUw8eIcN6yqSXh8TbkqCZotdXzQ6C4ja8FVOqKsQVSR2UqSOBHsesmSRBEljvZXj2/4kk
	Y1LpOaLzNcbtFDHYoSwPP/zPBWcYXUQ==
X-Received: by 2002:a05:622a:5916:b0:51c:15c5:2bf7 with SMTP id d75a77b69052e-52b56695898mr286929081cf.12.1785841505978;
        Tue, 04 Aug 2026 04:05:05 -0700 (PDT)
X-Received: by 2002:a05:622a:5916:b0:51c:15c5:2bf7 with SMTP id d75a77b69052e-52b56695898mr286918941cf.12.1785841500668;
        Tue, 04 Aug 2026 04:05:00 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807eb1256sm159296705e9.2.2026.08.04.04.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 04:04:59 -0700 (PDT)
Message-ID: <04db0ee0-a8d5-4f30-a494-5c7f8ac757c8@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 13:04:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] firmware: Rename google firmware directory to
 coreboot
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sean Rhodes <sean@starlabs.systems>, chrome-platform@lists.linux.dev
Cc: Corentin Chary <corentin.chary@gmail.com>,
        "Luke D. Jones"
 <luke@ljones.dev>,
        Denis Benato <denis.benato@linux.dev>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Jorge Lopez <jorge.lopez2@hp.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Joshua Grisham <josh@joshuagrisham.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dell.Client.Kernel@dell.com,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Chen-Yu Tsai <wenst@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Thomas Zimmermann
 <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
        Kees Cook <kees@kernel.org>, dri-devel@lists.freedesktop.org,
        Oliver Lin <oliver@liuxiaozhen.dev>
References: <cover.1785838269.git.sean@starlabs.systems>
 <6f65c9869714188539f2890aef6cf30e7bd2edcb.1785838269.git.sean@starlabs.systems>
 <e0d2a22e-a0cd-4a71-82c4-b88abcc7456e@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e0d2a22e-a0cd-4a71-82c4-b88abcc7456e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4NyBTYWx0ZWRfX7zhn24bDzX1B
 IaRW5Ntic07IxQ8l6ux5Zzl/0DiSrsPQcTyYHO6k2MaXCQJUgv5s5Gd9dag0E+X5gEESlzPFN+h
 bGrzWL4glc/zuWzDUMIvMK+OdC/66es=
X-Proofpoint-GUID: HOLVlH4Dx9MGo1V7RWw4lRkEUiKSbCRp
X-Proofpoint-ORIG-GUID: HOLVlH4Dx9MGo1V7RWw4lRkEUiKSbCRp
X-Authority-Analysis: v=2.4 cv=EoniaycA c=1 sm=1 tr=0 ts=6a71c762 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=fqswe53bbStJ6VhJXE8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4NyBTYWx0ZWRfXw3W6RonTK3/P
 Ys64C9qWa3n2sIa4ujGVbWufGfhq2Ft+6ytq0PhMqkv8EgadFfyQ13bWm0JhlbQ2ZjJLt9rdf+O
 kKQ+n4AbDEdhxMEhJPkdeKvepwykENdFBNM1Z2xqFDJ/S/h9oHJ1shHUGUR9zY6w8L++zhC6XJ+
 UpzxWS2fHeQz42Zv4IS+dLz8n5RkIaMCJePjRxzeh83jsEuoAHQzPSAp81qMLIbRv96HLtkNhJF
 i4/Td1V4kn+VohIwXoO+qfxDuJhW5mq/VMpVVZiFV3xUiSA+RoHiN4IlEXLAmU6hsjORrZDvpah
 XesJcaLyTnzVV/QXxguQyOGRH3jZydIYEaDo1KysAjsgY40ejU6ndHwChCYd1IYSWnyT+e9wn8h
 rJC+TYrCQVRG3yhHpAZI3gmS2lQbs25qSkyeWVwhTa/WFJc3OfJd1c2712MnmmONRkmx2L4wOsl
 uIYACsi3jS8CmGv0rzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040087

On 04/08/2026 13:02, Krzysztof Kozlowski wrote:
> On 04/08/2026 12:13, Sean Rhodes wrote:
>> rename to drivers/firmware/coreboot/Kconfig
>> index b78c644fa253..d273bd836245 100644
>> --- a/drivers/firmware/google/Kconfig
>> +++ b/drivers/firmware/coreboot/Kconfig
>> @@ -1,13 +1,16 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>> -menuconfig GOOGLE_FIRMWARE
>> -	bool "Google Firmware Drivers"
>> +menuconfig COREBOOT_FIRMWARE
> 
> As pointed out by defconfig change, which is supposed to be separate
> commit, this will affect users of the kernel for no real gain.
> 
> Do not change this.

I am surprised that such change appeared at v10.

Changelog is quite incomplete and I do not see any explanation for this.

Best regards,
Krzysztof
