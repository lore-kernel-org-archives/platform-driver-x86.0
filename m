Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D53D311968
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782235543; cv=none; b=J75MYjgwXAK/7FQURippSZ9ptGjF4TWEYTn5VDeddLLZKHM7J2r/Cncf0xsnj4j52ZMzHGQGRcD0oGAKlkUd76S6+2UyFzlAYTbhVk8yNmErwJirmsAPwhqfW2ndMbG7HFEhOPb1y6lvkavKgv2j4c4UrapBYVBO26OcYjGWYXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782235543; c=relaxed/simple;
	bh=7xpdqqOexDyXfuvNP0R2WagBlv+abOm0IoUpXnzn7ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XE523uBruhgM5xroJ36Fq/Qx31NJ4poN46GpxqT9viKt2hft0oe+wRR01eovTwoM/niI/KILYwjlFAeHNSY5fb9YuvBHIF82WnI53P6aRpc5xdgBpAVm1kMbfHzA7jT4n7a/9C+qHONnnf2iAMBnLd/9FhSOCvZUmeqT9W4xFR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pD6KkBja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iucq8h5H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pD6KkBja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iucq8h5H"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXaA13752853
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 17:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S0o/pMRQe4CmKGPoVmXwqmR7zJeLr6n31bsjYwjX2uI=; b=pD6KkBjagTsGq9kS
	0GX4kdFHTz15FI9CkLoymNADsdWZyOEjOsuEogHwVg4NZ4umdT5vDwvvNk5Ge1j3
	N4SMnzri7XTBI/30MUJ/jvCh3l7s7ebWjOe70qPM/8aPsRtSPSKglntkoORMargw
	fAGrgsaPijY6qz/nDELM75DbrssJcODEhYgD3LHwPsaFFxYny2KX9aj6/aM8oj9l
	tiIfKnMJPH6LkVyfuEBQ0IydKGkHSU/poQJ7/w9IdT/Nw5S8PayEUJ+AjBxd/JoV
	8CdWqlAAZgxQmrSckFFEKZuXD0pnOVBP/wRfwzxiyzVWtdMze4XJ2xKsF3gaFyt9
	4NqvJw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29jg4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 17:25:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-72684a6c61eso118398137.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 10:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782235536; x=1782840336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S0o/pMRQe4CmKGPoVmXwqmR7zJeLr6n31bsjYwjX2uI=;
        b=iucq8h5Hnz/toLR3OGW4nQM5nkXcEMRpAfww8ROPIDYfwp/vx3cMyIgVP3F59tcSvO
         Np0tSR37Fvve9z27iW9IzVbFLHoBouQDva/a4mgbDVAVtHqSEbNon6hWJcophbzeQsqT
         2IRMxqfCdMV+1z0y3gGvsDJutXO+6+wg3E3M5AqhPk9hYqPKTdIENBnA/4cLvIbm/+5Z
         Fkui9xFxrsplHLCT/Lwx1TMD3s08flyUhNTmvpVmX3hSUqbhx3tE8/Uc8Gg8rIDG5lh4
         4tc8hN3pLhN7PxmcToMaIbVX0i8X2UkQ4GD3XPlY8aAnfQAf1olRO9FHV+1IlZIHQt6c
         7BgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782235536; x=1782840336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0o/pMRQe4CmKGPoVmXwqmR7zJeLr6n31bsjYwjX2uI=;
        b=cPySjH15ZHgiNgnN7HaGJKyHPrXe752IoF7aRrHn+tdjgjKt402AQXdkSBdVMJZ9sP
         N5VQpOWrNsP7xY+u24E8Yn7qkoGCmrRBIykfsG9bfun06ewybDf86jkI90Gf0ZdYTJkj
         yxxma42yUzNsBC+7xfNXvEgpBeQclxIDzmy7+1xJ4j4gY72pWplvBQ8k+ZhAMPi3tfXI
         5lKkRHZDztu/JtM/jwn85nWVva/BjH0ix/FDsXEQZvlWYnEtNcfldU0iPZBaze2rIV4S
         IamPnPZkW8x/TgcHX3b8qE9FfS+TtLYbQl3WC0AVpsFSo1ykuDRHOcSh6OaZI9Wfhfq+
         8HTQ==
X-Forwarded-Encrypted: i=1; AFNElJ841602NEMaU1HIt6+XstUwaWajvA4ZfwUxHbz/1HckA83QJh3xHfTNEyvP0alhDCr96T6RBACJRawIBngBFXJgGXsC@vger.kernel.org
X-Gm-Message-State: AOJu0YxvCO9uEzpFxat6a9prwfjhyoUQ7AosnmSfJbs8zxCYTlZn3iej
	MKyT3YMW8v+rZSEB/USC9KJC+pGPcWB34WzTv8FwVjPJT1mhe8YPVIsbSv5VglCfM6uSAMkAv1p
	+Nov1nSCvoQU7a4Y/pdHay5vBciVl3dBr08vLe5J55Quz8muLW9aXxUHbG7HxY0ifMg3Td126TC
	JLNQoGw+XA
X-Gm-Gg: AfdE7ckg0qwis5W9x14RnM7AOXpVwDO5bdyX7hrSA3hH999ZylpJxQLjZjYBHt5iQV1
	tvBigRMnedE7FFtvWvVw3r8wl5jrR7+I4RAtOUEdOOkCjOFenFjIZU6pXT5nFMvwetCW7dgNAze
	kiqiDb9L8AFlNdhhBfdvdgge3WVfoKRz9AivygScfsYzNYV7I+0RUNKAUO9M7C8TgUuMs8nW32d
	hDjRXafYwIGb7ez6h2+zonvUB5Da5NDyF8zmMRvlbUKor/FhIBggGDJBvp6uP4ige5gb8lrPpWc
	sHp1ITt2fqGw9+jLw0k33qqaAR3+fGbnPgKyXFZWdQ7UQZR2SC4vVG6+TopT5stc43a0vFj6hbs
	iJPAxsIBeBzgoR1+Y/yosy3r8Zo9LNSPU3Ihz67hjJAAkrg+MdDXr1Wh5Diwwqupszqz1ljFjhw
	==
X-Received: by 2002:a05:6102:2928:b0:726:717a:696f with SMTP id ada2fe7eead31-72a1fdfca49mr13026480137.25.1782235536344;
        Tue, 23 Jun 2026 10:25:36 -0700 (PDT)
X-Received: by 2002:a05:6102:2928:b0:726:717a:696f with SMTP id ada2fe7eead31-72a1fdfca49mr13026454137.25.1782235535858;
        Tue, 23 Jun 2026 10:25:35 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f215:464f:8820:b8e7? ([2a05:6e02:1041:c10:f215:464f:8820:b8e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c579d4sm38533258f8f.28.2026.06.23.10.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 10:25:34 -0700 (PDT)
Message-ID: <60e45b3b-7c47-44bb-ae3f-7b3579633434@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 19:25:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.2-1
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Daniel Lezcano
 <daniel.lezcano@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        PDx86 <platform-driver-x86@vger.kernel.org>,
        Hans de Goede
 <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
References: <pdx86-pr-20260622211510-2801419545@linux.intel.com>
 <CAHk-=wi=29jSstqyF8EqRFccWnA=1TfXW_jcURhSd4rJgkSxgQ@mail.gmail.com>
 <CAJZ5v0g8GUJxy3TPfXa=Hjwk2puYKUpAZzdbo35houPEBLs6cA@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0g8GUJxy3TPfXa=Hjwk2puYKUpAZzdbo35houPEBLs6cA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3ac191 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=qNABUOcEAAAA:8 a=Z4Rwk6OoAAAA:8 a=QyXUC8HyAAAA:8 a=K5_vvi-VMt-VjxNi3mwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=Ytm653ucTKQjCvbzLygB:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-GUID: hdaBo9De9r0qhUED7kBj9XkNeV4a1cGI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE0MyBTYWx0ZWRfXysE1KfM8iQ+t
 G67la7TzHy8JmJ8etEoS3GhjzzPwGiTfkuQwTxZogM7o8ESum3V4mQATKlHsZMgpR6PjdJUzOpI
 nbBz+C3CZ/zC+1hR3KzUNwSw0UAlEts=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE0MyBTYWx0ZWRfXzBDF8icK8A8L
 9fEBsR9czItKUWNq50szqbZAXmhBIA04uyO1ZKppW4m8j8zg66xjPK8uPnMWNMsWbW0tjCOHqd/
 dL7+HHG0qEH51ABhyccyKo6KTwlpjsij4WJZUjl+9HyANUNpl0KfZr2mX2PjA60lXGai8miZ6wY
 axJ/z3kvZ/xKDMqaqQNU/nqUZMHGKXLxkv20i9knvDGvwH9lxY8ma6qbs4g+6QmfWG6z/zTq5IM
 6qw/Q0aShUatjkF3GJyuI87nw/sKZnqxFqcPdw8XKKLcNW/KV4K302zkWwmjUmonXW9or52ngFP
 iWuWw1Wpx3ukcuPdhJPgYvnzbMABX5pNUlHrG7dK0wgL1xb5NTcy7fPXA5meiW0aoiHl9Aa3Iw9
 3nv2/G+LI+VarGvuNpzYlQ2J8tN8wQ==
X-Proofpoint-ORIG-GUID: hdaBo9De9r0qhUED7kBj9XkNeV4a1cGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230143

On 6/23/26 18:53, Rafael J. Wysocki wrote:
> On Tue, Jun 23, 2026 at 5:37 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> On Mon, 22 Jun 2026 at 11:42, Ilpo Järvinen
>> <ilpo.jarvinen@linux.intel.com> wrote:
>>>
>>> There is going to be a conflict with the commit 3570cb58e317 ("thermal/of:
>>> Pass cdev_id and introduce devm registration helper") and a few other
>>> commits that came from thermal tree effectively resulting in a change in
>>> devm_thermal_of_cooling_device_register() signature. It needs to be
>>> addressed in the merge commit or the build will fail.
>>>
>>> Mark's linux-next discovery about the build failure:
>>>
>>>    https://lore.kernel.org/all/aibZy5rrdX3ltGpr@sirena.org.uk/
>>
>> That resolution makes absolutely no sense.
>>
>> Now that qcom_ec_probe() goes through all the work to create a name for the fan:
>>
>>                  char name[EC_FAN_NAME_SIZE];
>>
>>                  scnprintf(name, sizeof(name), "qcom_ec_fan_%u", i);
>>
>> but then the name is actually never *used* after the change.
>>
>> The *logical* resolution would be to make it use
>>
>>     devm_thermal_of_child_cooling_device_register()
>>
>> instead, which that function was renamed to in commit 8e1529e79385
>> ("thermal/of: Rename the devm_thermal_of_cooling_device_register()
>> function")
>>
>> I have done that resolution that at least makes sense.
>>
>> But honestly, this is all a complete mess.
>>
>> Why the hell was that function renamed, and then a new function
>> created with the old name - when that new function then has exactly
>> ZERO users?
>>
>> Renaming a function, and then re-using the old name immediately for
>> something else is a BAD IDEA. It causes exactly this kind of horrible
>> confusion. It's an even worse idea when there are exactly zero new
>> users that make that confusion worthwhile.
>>
>> Thermal people - you effed up. Stop doing this kind of crap. This is insanity.
> 
> Right, the new function should have been given a different name.
> 
> Sorry for letting this slip in.

Yes, sorry for that. I'll take care of not reusing the same function 
name in the future
