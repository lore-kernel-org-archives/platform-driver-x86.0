Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7361E832A
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Dec 2025 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765118625; cv=none; b=Fnhmivo/WPF8r7b9vKEEuH6d3KY0fWL/lZZZCQleoInZ9u2O6hAqobigaz4sT1P8WQi+dnefCTgkSnApv+Tkk7IM/hqfOpS9PIzPhT6jQXhvtgjKfrd/eDGlDoUKg/LmfB4DMG7U1ZDQQG8IYX7OUGHaC3ixPeHAUsQJPjMsEAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765118625; c=relaxed/simple;
	bh=N/AlMPNy9lcY4VhplAEjXH+tZcWwQ6XaS+OqFJZACXY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TnGyK4q48qkRTaFfrmyH7JB5Q6a8zve8fLn+WHhJEx3uJkMHSQnqYvurnJdARMBGqumY8VLpe8vQaUxFRS7Or8RwJen7GSlzK3EbUAVEceggX8fVo45KHpNvvBgXCG0M9bgc9vn9jMhzbFHqsPyUFlIdZJjI7gCN+OgHgjRsuCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKHHXiJ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VqjvVKsj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKHHXiJ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VqjvVKsj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7EVXf71565479
	for <platform-driver-x86@vger.kernel.org>; Sun, 7 Dec 2025 14:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/aaJFyQoXHpvQwzDEFmgidOgL9qCsCAZ9X7taPnYrc=; b=BKHHXiJ+nUEgoKku
	Fvdz+fmK+FjsgKxZvxrHErBn1BTMTXrQtN6eF4q+UmlcdMVIoiLfQoTWqkRKrz3Q
	NnvkBLXs2STX9raqgwHxWKLOZtVpbFqWsroT21Nvw+ZGvzMdD4ZDLlfqA4wA93oj
	nxs1RacIE7DhSoQOixd2ymfpIp1UDMrFNf3Zq+sWidv/x00ef8EjN1gbcxDt8wtl
	ycdaIk48S9hSodcpgkOOqwIEPVbu8ihMcCBpXjuAkbl0i8apeTOeeXB7yZYGwF9j
	fTpFkN6IvxkexpQPdH908sxJfjUG6w61KnwfxA4FxhhTKoeKX4BkhqyQWIU32YMW
	rhGyVg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avds9af5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sun, 07 Dec 2025 14:43:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b19a112b75so342613585a.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 07 Dec 2025 06:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765118615; x=1765723415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l/aaJFyQoXHpvQwzDEFmgidOgL9qCsCAZ9X7taPnYrc=;
        b=VqjvVKsjCHvm0jC0KzsUzs6qDcETc6xDmV5grCLuHpnmj+IXJ3KLmNuvVbHEWsdpFt
         H46321oRaSgaKPdXnG/wOm+M22S22ediMRo0yfBQUmajrv7fCbybUv70KHL1irCMOPTR
         Se9zatmrK+9t23F9qCnWPjF4/hsJLU7ISY2+5AeELcL4O49cEdrFFxmoT6kAJsxN6mQ0
         BBOgfvA5ei5gvlvAqrRyPyJ9XAWg/zCeq+5HaWKJUfB8c6uKu3EBfuXwFarfK9z9OhUf
         O9wuViosffO+0/NRTXPSV6lViou7zOlbGTE2rJOtVaPq4xjdSUThtFp+/xrLOwYKapd8
         QW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765118615; x=1765723415;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/aaJFyQoXHpvQwzDEFmgidOgL9qCsCAZ9X7taPnYrc=;
        b=dJHYvLgkTqgUQfGfOTN/q4ZvvRRGH8ymcS3bFMsy6INKHWNW5sytWXKvLAxwelyCuV
         1SViDiGidnIkv4Lfwtr2Kst7qd1Gw4x0b57EnTbMA9JKjUrdEz6hC53pB1LMzHy/t3PF
         vl1KC0jVjGuDKrM21hD3T6cVav4cR5gq2ROLAClKRTO1DMGE5+m1Ft/UMJRedy5ZSd/7
         /T2HkxMuTPDQEjELYvTBqulAbUbyIXSTOzVB83fBPTnw1ywCkz0j/TaN9ozw8wSZaMl/
         XSOZdwmiu7PSyLOMvLfVBOfLF6ZpVoHVc/pV9RGx8mjJhlS+KHiAGSwTsomgOGRvBX6l
         2vfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGwr7JWlY0Kl6+ehdpUadGxf4zLAdwkvtBf2TwN7ecuOMN976Delm/O72EsrU4o6oMFXfL9t6vnzOYVI6eHSQjIyQ5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvb/V/adhvGJqLbthY7VVJ3XKtN2vnjyZgU1uw5k0X5RBvqYNs
	eqZID4/Un69pGQ7635TytAVDjbSWtju+OVn1ZPsvLo9t3m2eW7tqzOMZABHXe4vUqLeuhiMi8A9
	uTf0+eSxUyV6OM61rp3WWXV+GchF+avkBOrigDni2l59pBLD0Wi2OwTFePEa/ItmkU2oz8LRIMv
	bI
X-Gm-Gg: ASbGnctGhUeX4rpYuZfI6wHKqs+DJ+PI9qxyi4pufmSTHeOfblmnKQCMoOYRZaAgSZH
	q6EKzwgYMBkmNzTNHUyKvKvSa/sZRrL1Ls2ywmIvdHBh3DupFVB9oJpdYVjqr1xD5W3h+W1IvW3
	VHdD9ZefRFAXxfhjnGpfEdujpTctlClrza53fvDafLfkfEmDrHHfG6IiHKOerOj0ZxcyLDlq0xM
	Winj97ZZiMHtcfTyoIbYyQvGi8p9ov0uDiWqGHmhvVJvrB872unZnXIWv5k7sHDy60eWh+WkaQz
	qEPtNUt9LglWjRjsQYOjJpNMSHKSTbGbW9tAlfIgwuWQ0nMPib7PM2VKqGmVx6f2A5f4FQMLCA3
	FtzWD0D+FzF3v2oik8Q5n9AjeiOhkaVIXepi6EPNryi2KXDYnFnb2uXybvCUPz75gAR7cZWbj/r
	hoFu9PCsBm9lYMv7MYg/pLlrGhKUNkiVL5CR7Hxl5+J5TpEZNZryHs0cOOb7JKGMuvCBuqR2zna
	i0K
X-Received: by 2002:a05:620a:2a11:b0:8b2:e7db:253d with SMTP id af79cd13be357-8b6a2388c05mr637280185a.38.1765118615660;
        Sun, 07 Dec 2025 06:43:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0XFmkIf34WFVbXKGLe44+OBlysT3op2/v7IyhvdnovY4Uv/rO0mzOwvjhifu9aaaI5NRsOQ==
X-Received: by 2002:a05:620a:2a11:b0:8b2:e7db:253d with SMTP id af79cd13be357-8b6a2388c05mr637277785a.38.1765118615137;
        Sun, 07 Dec 2025 06:43:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49d24a6sm847908466b.54.2025.12.07.06.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 06:43:34 -0800 (PST)
Message-ID: <d036f6dc-1150-4478-a3a2-cdb5723ae4c7@oss.qualcomm.com>
Date: Sun, 7 Dec 2025 15:43:33 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] platform/x86: int3472: Use actual clock frequency for DSM
 method
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Hao Yao <hao.yao@intel.com>, platform-driver-x86@vger.kernel.org,
        hdegoede@redhat.com, dan.scally@ideasonboard.com,
        ilpo.jarvinen@linux.intel.com, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251205095525.1264971-1-hao.yao@intel.com>
 <d4f08e2d-8257-ec95-9f67-7514240a4f82@linux.intel.com>
 <aTMs6PB2O58KbikU@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aTMs6PB2O58KbikU@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HICkmtK8hPdHD487qjz3BWQDEGkNeE6H
X-Authority-Analysis: v=2.4 cv=P+83RyAu c=1 sm=1 tr=0 ts=69359298 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AdU8BewJLfuzazTBXZYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: HICkmtK8hPdHD487qjz3BWQDEGkNeE6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA3MDEyOSBTYWx0ZWRfXy+ZHia8J6a0a
 b9Ki+BU+ZBg+cqFZ1Z5yZ17J6KBM8aqyRCk301PEAaj6kqMsg9fH1Jn6jrfYIMRI0P6tbhmqFM3
 nnFRIHY2S7N25QLmFwBEYY2mBP24bMzfwYmQp54zfhfP6+uvJ+xSMnUhciZPlSH2X0kNPVKJptL
 CB7gfYoBxW+kd7BYjzuKRFKb3JdIhdh17dJfhEclaTfub9uKVRL2ipnQ2sB6bwEf+Ypk+LkB78m
 yEfS/Zfd3jHu5b0DZr5yXhlTz7eNejdGzGv/mXJLDPIRep9PHORiNZyitrVvwEqqAINFuPlXcVu
 xoxmOZMRcyim24/2+rpe4d5LpOtAY6F0GI/WV9HwoveLo07xNb30fOljNLDOP78DmBkER8hhxi0
 8buVFkoAydZdKqGrx+cSTSFh1dmLig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512070129

Hi,

On 5-Dec-25 8:05 PM, Sakari Ailus wrote:
> On Fri, Dec 05, 2025 at 06:10:10PM +0800, Bingbu Cao wrote:
>>> +#define PCH_CLK_FREQ_19M	1
>>
>> I like 19P2MHZ.
> 
> How about simply PCH_CLK_FREQ_19M2?

+1 for this, this is the standard way to write fractional
MHz clocks.

With that fixed / so for v2:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


