Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98C0402BB1
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jul 2026 08:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499944; cv=none; b=WBTv8u2sOae8ikl5CcNJ8OEJj/pzEdSbAbwisEjcpDLVuZIGsaqREUPgVfalR4YH/VcmNWivOdfxkzF4k1YIswbIYW2egZ3z8/perNty0gHZ96VVR/j+TyNeHdFs0x3DZMoC+Hk2rq3SLsJMOUnWx9nVxGtI3WYie+kwohZfNOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499944; c=relaxed/simple;
	bh=bgB4zWzbm5nPnDgRkckzv5MlzAsLHswlLS4WHPbWaB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=To/mBnAQWtomDRj4vCLp7roUgP/PeVAPlZ0sHw231Qco1wE2I7PEuXdxH3iqSDwzllXxsBFPxt9R2tHFBMjijT2rgemMICR3/YFghW/SSjuW7yWJU7RVmAklp4Hh9KEzjq2RkijS/8gUpEL0AL9j5xQjzPe0CwCWWDJohpsm79g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DerzV+u2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpaLE8KK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DerzV+u2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpaLE8KK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889gC32052174
	for <platform-driver-x86@vger.kernel.org>; Wed, 8 Jul 2026 08:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GZt4yKJAJwIgvmsdUsVQCiNImI+HU9ORBaWda9zrk+o=; b=DerzV+u2wiT66Lh3
	OsswmCwM5fUK3oTANpYnlSvRZl2YitbN8Q/LveY4SFP39eRkc7uQX6DG/19qYZlI
	gXym09chIOTAAsDTMQ2dk//HTanp0rcAFm/5l1vQETmsttx03RLKHoKhmvWa4Nf3
	+L1DOj0DbBJ7mIZwVcjl4gGM9i9hx1oKW30gNa1w+42e6DB4boppobf+JULRRKh5
	9fdaHLtM+H+DjpFQoavXDkY4EryyakPVe7AdwpYleYyR9dahKNQSaoTPjim0sc2W
	CsM4Ld0XZ4d+FgHrjc0JXe9GV72FJB+jibLysEt7nuNYX+ZOoEV0wabJZ/qxiZ6J
	eX8JFQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5g9vm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jul 2026 08:38:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so9837091cf.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jul 2026 01:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783499933; x=1784104733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZt4yKJAJwIgvmsdUsVQCiNImI+HU9ORBaWda9zrk+o=;
        b=OpaLE8KKdqV1L1TRgDYPoJOumjUHR82AAEc5VljF5XpTa5riC39x390CYZh0doHMzh
         iXwbFAmV5YJmmnuEbExvkcaS+SAEWhFuP23UiAwv+Kkzf8Nn90/2G9cjZWjWj++d87ay
         nWalCNKD2TRM2LeJ1psLMpWITUIM6x/gOnZ6Ue0ybQ8CVfzijXxvf3YDSUpHnyDR/GvL
         dYuy9OjE/dGXvYvQiX+ysfWGSMwbN6KwdcCpjTQzQYVOk5UHx/2Z5rDANIwkA9sSSuQQ
         EY5WrpSISddJlYdHlQz7K8UXw7TfJ/YGr2ep7k7YyvsYNefXFT0eBxuIB8p/OGCQfF/a
         x2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499933; x=1784104733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZt4yKJAJwIgvmsdUsVQCiNImI+HU9ORBaWda9zrk+o=;
        b=UmHp6KB2wyOhCifcZLbskQQSuvYHeuJlnOjHCgPntrYX9k7qNqNrgNLkLs4HdpgKzx
         UQbgOMaDdmralpqhvO3RofGB/4aQiz8/MCRo2G5SyU2ynaBvi3Yl+Qk4sNwVdazC+GS+
         oRFdJTn+v/aPVeHUjis3DErDNyyn0SD2reqHKKgU+zBZ/8RVD8QBVukDSQkqkdMCUIzl
         TZaLmarypisGtQCF6qnS57JxiyHNCbeQ5SKQZcQnKwvPOuUAZrNgGny3cBZMaZDx/cH5
         L7cv8A5OPAP79nqU/9quWzcwan+Vml7HRpgdgc0Yq33nTd1ScoTOaq9R9+X2Wv2xculg
         ZLlw==
X-Forwarded-Encrypted: i=1; AHgh+RqOmfI631p3VNx336DZRKwYkQQ+vXsnSA/EOdjx9W8gTp5Qc71LxEgF3GW4m0sZ1AfY9WhX9Vof7/FaB1Zs5qtR0Zax@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZaV693znfr5DSucN+PO3B+EB/6Q081oqoLiMqU1XBjwvTCpQ
	x964/mntdIKQalRZIqMZWL+jLtJirORP2Xo7S5WaCClMYWvbTHppkHqs6hhGbX/5VlEabqHssEq
	eTU0QSCJi+phOiT6lV16HEqjG+fJjm5H0fd1UE8T+sVSZcQ3SLlE2ArxZYr2szWMHwC4I05UKFL
	sU
X-Gm-Gg: AfdE7cmH1zUmh6O0X0106M1SJUDpQ4C6VQsyICS1fmYJQKChS8RNo41966C7UN2NyTB
	YOnAcBS4Kr2kD1dbqxtgi3qZltlRHK9A5eNp3ffhVglLfKR6CEC6RZFHzseg/go+ScTz9B4hexO
	qTqzencNwcoqlXJmbLGKczwJVHt6/JLnpd/RP4bInyEPLn0hhKXOfvoDID7qRYwS/iUabmKVm1T
	TD0LRIhaGulF5OzzvjNCCcFK8K+9cztVVnNTrJ2rYU/DeQ0LaoMhQ0kEIRiZ6FdPq/qkE13Jnq7
	O16UNlWk0ij4mav1if3PIFHfINsmIUtWjhA1M9fZzKwgIGJmdWvPh1b8tr9eWE3fDsgzwc9dFE3
	2skpA+JFqgNCruZE2K6Dw6akiW/O4BGqaL3JDQnZh4rcq
X-Received: by 2002:ac8:5d92:0:b0:517:875a:d634 with SMTP id d75a77b69052e-51c8b39fac2mr16427621cf.2.1783499933084;
        Wed, 08 Jul 2026 01:38:53 -0700 (PDT)
X-Received: by 2002:ac8:5d92:0:b0:517:875a:d634 with SMTP id d75a77b69052e-51c8b39fac2mr16427361cf.2.1783499932643;
        Wed, 08 Jul 2026 01:38:52 -0700 (PDT)
Received: from [10.111.138.111] ([212.136.9.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb482f7sm278181466b.59.2026.07.08.01.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 01:38:51 -0700 (PDT)
Message-ID: <ac9c6ace-31f1-4bd5-9d81-ec850179e85b@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 10:38:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>
 <20260708-wakeful-cyan-caribou-35fd09@quoll>
 <bba69f4b-9a09-4e9e-98c7-3833924131eb@oss.qualcomm.com>
 <c2e5e168-bc94-4b17-87e6-8974bb83be3e@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <c2e5e168-bc94-4b17-87e6-8974bb83be3e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4MiBTYWx0ZWRfX/ol/aSH9AFju
 YANP1LJukftHd94s3sjr7rFEg+EwAq1kcfb7vyquH4rcX3d8o0uihn73QK0oEJyih1g5vt1nUUe
 9q4Lrt1xSE8aS76S8Jg21F03Se1bPjI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4MiBTYWx0ZWRfX/XxhtN8Rv0YA
 efFzN5apKSN+u5Sz32j3zFKRQmyTH5rRW5EL1OsGlLiDADWg8cnuDW+FJ9DCjtw6GrLJ3uBpDR/
 Jdb/ucPbs1zyjMWPBWQLVqrhZggmK78B0/0ZYbuRgRtmf1+ZFFbyDV1QTlN5PMmHiFFOCwwbg/t
 G2MfxsHXnRDHWJLXC3H5LbJLqxX8Y5hOThAcGcbghmOeiEBPcX2ZpQGm/4jTvt1jRddJxYRg5IW
 0JHV+oI57YUTMbdL3h2crKiLe/yzobtlED3S8gzGUnbGvOhgc2ycjtEPWrZuH9bBr5QmPMiBEaR
 FCw76LPujMqVTN3BYUCDx4HsG3to0kVzLYAa8x7un20XCgleKUY7WLphogjizrcHJY83/agbaoB
 8gUI1dYrWsjWVxuGV4L4GjV5ZqFcxwFKmjh5qm4dM8DDyoZ3lMQN5RC4wJ16vuRuxAfjEF3X2qg
 G9ohA/2gctPP166eCPg==
X-Proofpoint-ORIG-GUID: EHqpWLm2cm-EAnX7qGiOENmukejmVvN7
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e0c9d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=kc99uptPwIIcf-mWtqsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: EHqpWLm2cm-EAnX7qGiOENmukejmVvN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080082



Le 08/07/2026 à 10:24, Krzysztof Kozlowski a écrit :
> On 08/07/2026 09:31, Daniel Lezcano wrote:
>> On 7/8/26 08:30, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 07, 2026 at 09:22:27PM +0200, Daniel Lezcano wrote:
>>>> +static const struct hwmon_ops t14s_ec_hwmon_ops = {
>>>> +	.is_visible = t14s_ec_hwmon_is_visible,
>>>> +	.read = t14s_ec_hwmon_read,
>>>> +	.read_string = t14s_ec_hwmon_read_string,
>>>> +};
>>>> +
>>>> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
>>>> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>>>> +	HWMON_CHANNEL_INFO(temp,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>>>> +	NULL
>>>> +};
>>>> +
>>>> +static const struct hwmon_chip_info t14s_ec_chip_info = {
>>>> +	.ops = &t14s_ec_hwmon_ops,
>>>> +	.info = t14s_ec_hwmon_info,
>>>> +};
>>>> +
>>>> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
>>>> +{
>>>> +	struct device *dev;
>>>> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
>>>> +		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
>>>> +		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
>>>> +		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
>>>> +		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
>>>> +		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
>>>> +		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
>>>> +	};
>>>> +
>>>> +	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
>>>> +						     ARRAY_SIZE(sys_thermx),
>>>> +						     sizeof(sys_thermx[0]), GFP_KERNEL);
>>>> +	if (!ec->ec_hwmon.sys_thermx)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
>>>> +						   &t14s_ec_chip_info, NULL);
>>>
>>> Last time I commented this looks like actual ABI break. You did not respond to
>>> that, so I assume my finding was right, thus:
>>> 1. binding is not correct (although driver should be fixed, not binding)
>>> 2. the code still breaks users
>>
>> Sorry I misunderstood it was a question expecting an answer but an
>> affirmation.
>>
>> By ABI break do you mean:
> 
> Existing ABI contract is changed in an incompatible way, which has
> observable effects as below:
>>
>>    * new driver with old DT will fail ?
> 
> ^^^ this one.

When we are incrementally adding features to a platform and like here 
reverse engineering the device protocol of the EC. It is difficult to 
give a complete bindings as we are discovering things little by little. 
How to prevent handling all versions in the code when providing 
iterative completion in the bindings ?

Is it possible to have something like sysfs?
	Documentation/ABI/[testing|stable|removed|obsolete]

but for DT bindings ?


