Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7A535AC27
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 05:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782797449; cv=none; b=Ok/9RwpyAmDs9E6pPQyBcmeKn0KPsADPd5my/x11YVvSt59wreVyuXqPtF7Fe/xfOuPdLGN3YG+vpx1kQUcwqa0zxHBXCnaXKtLNRknPhV7fcYXMEQaMWlcwGKFDYT9DXYy4Xk/+UzZY4ZrppraNGWegoGciFiD5m1l0SdlAIME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782797449; c=relaxed/simple;
	bh=AMbCfl1TqOeipjOiTdE0+IqDoXL9fNroA+PH+fRuGzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cR3O4MEUl3JH0F3UW+kN4cMyf37uKnE9Tqb04gYXEnVILRq2asHVHrK+3kkpEbL1DmrVtNZwsOigiuNyuyPVaNx1KLCAnAmhfr6LDGp5ZFEJlazMx6uNe32vMWjfvUC6zjYpEvra+Htc/gJSrAd0Vog1+YP8YBen+dOZe+3E2Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZl9E8Ps; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A34YschW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZl9E8Ps";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A34YschW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U1IjE5357780
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 05:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WhiYGokexxUvHxryATmlhdYY6XJnEz/snuGmeXg93hw=; b=cZl9E8PsrXl9QgCL
	jh31zWrJCAL8BAjCgp6BFt9K0QiFrtIWvjI9E6Lo18MFhpybP+cfEla8/C09rRPF
	5dbqoZ1DlXwbkOflsm8YA994DYvVNq95aYnGDx9ywP3WryxDrGzaG1aKv0h+Y8dR
	j3NP9NpWHUIL4V6OSwULCyUKQGGMboNHYrXT4MDScqy1yTTEkiMvdecm2wdMWx3w
	l+WAYl7Ao4vJezHEv0DiR/xLkbv5C8hUASKS/l8wtqYc5hp+vUSYOm3dbY2tBCpW
	ikzbjklRP5NT81SVHd2/d8XES/ASALckAB8rN3FHOez4syhh/aKynuO4vHK+X944
	f9xjNA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j1nmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 05:30:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ecfc5dea0so1763144eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 22:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782797447; x=1783402247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WhiYGokexxUvHxryATmlhdYY6XJnEz/snuGmeXg93hw=;
        b=A34YschWm9+uuk7NcgJnjH3l0Vma46ShVH33wlhvTsxkFCaGEZR/GrmRUwvMUi71Sz
         ibUCJ8oLcZzRfU2rkMmqn12fjYLrWeW1m7f/QhyfoWax80GvAJB16SGhZ1nZASFFVzDq
         IvFbXJwP/ZxSJ6SRKwNFU9MO1Fd6zkZwLU+R7QkA2H217YCczGlLvYghdv0hca4iD8O9
         Mv8ubyWUDF759YwGR07+flIEP55y+OSYlk/7uAnuY2XBLOX4lvMPIykJUz6PD7dpR7NC
         4DtXxlfmLxCbiTtOOZwqkA9KvYr5iZMOSbLQcGsOVyiZD+Lve+BuJsFIE/WvGJNXxIB/
         3cCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782797447; x=1783402247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhiYGokexxUvHxryATmlhdYY6XJnEz/snuGmeXg93hw=;
        b=ZDMaDLfzgs1PoZZiu+eMP9pNHTajUjgvnrGPpLTCE1/jDYNjcUrO5GqVWL7ZPtXCPY
         Xgy2JNdFu6mXmjmPru+OPKxwg38Jyd5frrHllafWqEmBWvYYOk6HAhVQTZYYRsvpOCv2
         NIpIi5Y1vlJ8dzY78PtikXOI2v+xqNM6M9gyUv+yNJWHQ/GyPpVmNYtG3RHbytpAfHRj
         l7fu/3JxQ3hvM76maIllbCx/5TSTTL6NHvx6ZPkyXpCsX/OCsoYR59F6gqJ0sAb/wvrF
         hKtavk0UNQuSdryYCnfedh5NbJ3m2BeV/KTcKh4Gkp/4Gbk+FSegmgbR8d2Av9m8duCl
         kvxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcGqfIT1nmQuBDKbFqZyb8mGcAynETtcCkpLiqUZbkWbmQunU7CeomZ4tzzoL3EC9eyN2uNDa5E49jSjZ4uKTC4Szo@vger.kernel.org
X-Gm-Message-State: AOJu0YyPmxpu89/8xOi0VOohdI9Y+fSGxC/r2E3Fzq3+LFweJg0Kb+I9
	VC6xS+2dJpdXVpm32LinxtWBCtyCAu///rZahGSecg4ip5OU/kK/mI8lm0LeEkjdx361DP7DlWQ
	XGiR64ivePSgU3HEoc17sUR53J5W2mSlIafrbdClyYNDag/MeVOAMOnSKS4AEL+tYnu8nD7Zn/Q
	NA
X-Gm-Gg: AfdE7ck0NChWs+68rEDc2lmsP+GURXNnYyK8xzqCQFEXrxWMIWHC65c2TbC0lergHu8
	TPs+x+fvZ8lGoYna61Qxv0W5sp8P5NdPI17Bdi4VhXvGMB9ICObMWPI0LH90Pdsm/TSdN5onfp/
	Da97+KNhz9e2Sb+jAUB1k0eUhNoPdqCSF2wrGmpeYpk630bKxbZPG/K+g2vwGeEgAyK461IJAhW
	bkFT2Jdeo6lpr4i+u9KGLyPE9pNWflQS/HHIsewzp7ZOK2F5IYONi9HtNM6PHk9G+W2QPwFfR4X
	i5O6VS1MnuCIQ+CWziMppZ8KP5wxed9r1pkhh8WQ7/OApB+HN5jSBm/ewo7zFGm2zPAVk4ZOWzb
	w7NeBzZlp3myP23pduqmY7Y90jPXTaKOPaXgNGoSokFmEsn+emtaCL/Wynpax/hFhSvTPOKYhO7
	fKnOYgrqPaHMiVXCjoU183DLj6//c=
X-Received: by 2002:a05:693c:3b09:b0:30b:bda8:a70b with SMTP id 5a478bee46e88-30ee12bf278mr1453051eec.4.1782797446906;
        Mon, 29 Jun 2026 22:30:46 -0700 (PDT)
X-Received: by 2002:a05:693c:3b09:b0:30b:bda8:a70b with SMTP id 5a478bee46e88-30ee12bf278mr1453031eec.4.1782797446349;
        Mon, 29 Jun 2026 22:30:46 -0700 (PDT)
Received: from [10.242.229.199] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.19.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2cd21bcsm6404411eec.0.2026.06.29.22.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 22:30:45 -0700 (PDT)
Message-ID: <5dae2ab9-76ef-4516-b21d-80729bf7ed79@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:00:41 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: Register cooling devices
 with their name
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20260629-fix_cooling_device_register-v1-1-c6e518b0bbd4@oss.qualcomm.com>
 <48334852-b131-d6a0-469f-09e15d6765d5@linux.intel.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <48334852-b131-d6a0-469f-09e15d6765d5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RHorkO1UHZ73ZSYdo9NrTPeL-2-PWbhy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA0MiBTYWx0ZWRfX6QSWB/4cxqoG
 1DcH0zkPdL9224bAaSiFEPf5tmEmZWiM2+4nenYviVT5LpGgQyVXvuAAQAQApWXcSnEgF2po9KL
 WCrfB7o5MLSv/KLaVE5JyHBwExneo7JXso+O/QDDBCwq69Wph9OSsxGgb44OTy9MbYAE8/+AsHi
 0ourlNvdt3yBbqGPd9fSfI5NMk5tu+xJMq0CzqOr+KBLZx3319ZSUPa2dE0k8uQc+HAfzuK2t1T
 MQ4sD9kSha99UQvykSvB5p8Q0gamZbwbwsYePiQR1pxKND9UesQcARi6UwAO9xNuH1g41ASq/7R
 66qd0IwkNXmboUf4TDMPQukPjqd12sdyl+kgDAEtxramEJQKv83J1dno96gXSqET0/DTrvSZKIZ
 SLNFcx+lA2jtZ8PzsAO+HOWJ0DR2VoLch8SSTrTXXjBWI+DAIIsE4kODdIW1PYF8t0Jt3aoeV2e
 z6EIbU8gpJuWV7QuNAg==
X-Proofpoint-GUID: RHorkO1UHZ73ZSYdo9NrTPeL-2-PWbhy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA0MiBTYWx0ZWRfX69oCCLbKviyQ
 Ej2HxMWgEc8j0EPwVASOwkgMZdJP7WpMTbmbltJsVWUIHavibdnbKlaDdH4mG9joRzbMe70lMBS
 X55g5D4wk6gs6l58BqearZ0TUXGmhqg=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a435487 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=3ivmCuETaj/XXnlAhr/wyw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sTVR4Ors8kAh6zT4N6oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300042



On 6/29/2026 6:03 PM, Ilpo Järvinen wrote:
> On Mon, 29 Jun 2026, Anvesh Jain P wrote:
> 
>> Each fan is registered as a thermal cooling device using
>> devm_thermal_of_cooling_device_register(). When the thermal core gained
>> cooling device ID support, the helper's prototype changed: its second
>> argument became a 'u32 cdev_id' and its third a 'const char *type',
>> replacing the previous 'struct device_node *np'.
>>
>> The resulting semantic conflict between the EC driver and the reworked
>> thermal helper was resolved while merging the drivers-x86 tree into
>> linux-next by passing NULL as the 'type' argument, dropping the per-fan
>> 'name' string. As a result every fan is registered as a cooling device
>> with an empty name.
>>
>> Pass 'name' as the 'type' argument so the cooling devices are registered
>> with their intended "qcom_ec_fan_<n>" names.
>>
>> Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/platform/arm64/qcom-hamoa-ec.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index 45829f2786b7..12196d56b60e 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -391,7 +391,7 @@ static int qcom_ec_probe(struct i2c_client *client)
>>  		ec_cdev->fan_id = i + 1;
>>  		ec_cdev->parent_dev = dev;
>>  
>> -		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, NULL, ec_cdev,
>> +		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, name, ec_cdev,
>>  									&qcom_ec_thermal_ops);
>>  		if (IS_ERR(ec_cdev->cdev)) {
>>  			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),
>>
>> ---
>> base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
> 
> $ git log 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
> fatal: bad object 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
> 
> Please don't base your submissions on some random commits. There has never 
> been code with (dev, 0, NULL, ...) in platforms drivers tree (and neither 
> in Linus' tree).
> 

You're right. I based this on a linux-next snapshot; the (dev, 0, NULL,
...) form only existed transiently as a merge-conflict fixup there and
never in the platform-drivers or Linus' tree. Current linux-next already
registers the fans with 'name' via
devm_thermal_of_child_cooling_device_register(), so the issue is gone.

I'll drop this patch.

-- 
Best Regards,
Anvesh

