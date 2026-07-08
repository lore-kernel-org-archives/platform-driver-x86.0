Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC51283FFB
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jul 2026 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495897; cv=none; b=oNag3d1/EFGa7yvajO1XvVsrfCXidrOMAP5qOT66QfD3qVWWs/FWa/2+7WM2ZzXydg5iie2iScIqGoNsxPCKZX0qO3yonTa9s4x06OVzo7cvZo/IbF6EX212zOMG0Z/erTsYtv7JqRB2f+dc//zp/+M7+1d4QhJkxDtP4CAi5io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495897; c=relaxed/simple;
	bh=bRHwrAZC93czbdFOntiYykQyXzYF6wbZB3hH3rMeWVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iryAlMPDZyTGGUgn29TgfWSP/ntYGIy5uKkwAhbRXj7JNoh8yIcDOD3GxIiHZ/1J2C4lcM7Opc3iQfdgM4KpuqIoqWqWIdHw92epAZiOC1l5ODAFO2C/cVkudbKOnDKMsO0/r9S33u11Hp3E7hzrxgdD96ms/d6BVg1MUwH+vn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/M4JIKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqW0kbCw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/M4JIKG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqW0kbCw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842knY1625499
	for <platform-driver-x86@vger.kernel.org>; Wed, 8 Jul 2026 07:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TzGrlXz/k86ZY0yzNouv6JvvoTJVqGivqV74u7X/MlY=; b=C/M4JIKGO2NdUVBX
	Yyc2Ob+dgO752sXwa9lwqIS3Xpd8DWTGhiBfoWgFP9kiC+yspWQGcIvtcGMkcr4u
	cXhlXn2J+Hp5DSM7ocJvD60KZbv6y4qhmzlj3QlOvN+9nOwx9mOlWlKDXp3aN8VV
	EWNLQKw7VJ6DPkWTcWS1HZQM5xOuLYdPSqnpSJW8fg6uh0972TBWt7JDhR3ebwA5
	Js/00Is0Lscvy4qRTMDXIWNymISI04g4OJ8s1hFfyvS+FR4Eu9wZoAwZkKOTjwpB
	qGF57FXByGddRp5/qWJU1AMxxz1+s7WU7Jb6kIPalQzsVBJDahr+ae7DCXDbsnOo
	e3pOTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd390f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jul 2026 07:31:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517e054fe07so7658541cf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jul 2026 00:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783495883; x=1784100683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzGrlXz/k86ZY0yzNouv6JvvoTJVqGivqV74u7X/MlY=;
        b=eqW0kbCw4AlzE1n4nDuDs4U0F0ECD52EmpCQiIl9we8Kvfo7dg6gXFPztsoBOTc67Z
         Gd+QF3xdZ1oyyKTk3VRI32dGBwLM4XwJcHBsgyjIrXfngsP8M0U9GZ0fpGxt9FR4vkE5
         B+eDq/rRqHLI6jQSI936IJa+zsTLLijGf/HnAJGIgfvY3ZSm2GIisXPztFIttFINqnvg
         Gpc0OARvy7acUezP0J1r6lZ1F8rvSRiEIy9umB0ZWHZqXIBjEbytmBWwwc8eiGpx0/T6
         ArZILivBNui60myBIrPR9ctmlvwoRRUI1UBCYpHEo5JgqILVJXH71ol7Kw1g/PcRZWv7
         SruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783495883; x=1784100683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzGrlXz/k86ZY0yzNouv6JvvoTJVqGivqV74u7X/MlY=;
        b=MduVlyZgXTwBwLnLW5+8y6kglg0u7c1JkO5yvruieGJxa2ocojhuEepxDJFRxCMG7y
         S5u3mdMR+0QOhWqVx0q809jA+DAwvGu/nVjaKbb47z97dKHJDfTnrp/zG225Afryn5vZ
         jqPH1Xcj93N/yDSsTuUKyPO66ljkjZxtTcRufs7r9iZH5IT5WQFaIvLs53ntr0+5waKP
         9uOGPMPJkGxVsNtAi4FN7fE5X4bMHKreQvSN7iAP3KISrwHTGIHQnZw3i2KfogO41OA/
         gBmaYXY9qPEMx7AYCUHgEZ03/LlRCsfuapUWGd+jLvQNCeC9559WZiaZDYGaJZKHSvus
         +bQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrChIJWypZGX30uIgMy4Cb7Bs5AS5/I21hZzYA2rqQqurCdDllDRFegRiLLpeGZKk5FfH83zBSReqe3zPccCUOehgqW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo81pdx3wlBBOXIFMMbiX4QiZaiieq1vcm/HEJ3JwKKuuMhCT6
	2NixOWQD49co+P5EA3APmw0+6WIoklhi7NO0tBtXB84pDFuXQTTqAQq6gWO3JlgoX8ojqNFqZ94
	eIn3uOl4tygzNlu96odzk2nPT/+jWvrsBcICYVSWwQ/anNetEwKGhCLjm3XkW83P7El4JlKUYHK
	fp
X-Gm-Gg: AfdE7cnRBg0m5mj/KH06srM6bA/c49udld/3WkD0QMdn+O+EVleCs4FM2T64i2r9TlK
	WeeUKDz5uRX0tfmd0kqR3PAEMJUdwSJ9j+4hOm0oaiBZBUInsaOAK/SzoHe/yN1NyhScyLVIvpD
	YF47rS5HxTo2YFeyqRu4fr+ciiNGCCLMmgNj+1vHXefUa+3IBJdsqmgGwCGwLnp8BPPz5tBqVAQ
	iuNURvznmLDKOaXGmVReCcUElaQEhsSjaAce9osqWe+cgjRJMHg/riIfEuS0RQl+4OiQlg0CnSK
	m3FKcm+zZclU+xO2RV/bkuro7LWem5mVABrxHzAQenMawAGCqhnEE2xQSeLtlvklk3xzUlwRpug
	VOEovNAUjM1+OKP0oB424+Oeicaudg2KqoMbNG0pEVJUDxjNWkaLwvaZoBCurughgZMmsw8jZNg
	==
X-Received: by 2002:a05:622a:44:b0:51a:8c9a:8fb6 with SMTP id d75a77b69052e-51c8b4c2ee9mr16996311cf.71.1783495882748;
        Wed, 08 Jul 2026 00:31:22 -0700 (PDT)
X-Received: by 2002:a05:622a:44:b0:51a:8c9a:8fb6 with SMTP id d75a77b69052e-51c8b4c2ee9mr16996001cf.71.1783495882167;
        Wed, 08 Jul 2026 00:31:22 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:9094:f7db:443e:b97f? ([2a05:6e02:1041:c10:9094:f7db:443e:b97f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a572c3sm43480075e9.1.2026.07.08.00.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:31:21 -0700 (PDT)
Message-ID: <bba69f4b-9a09-4e9e-98c7-3833924131eb@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 09:31:20 +0200
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
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260708-wakeful-cyan-caribou-35fd09@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA3MCBTYWx0ZWRfX/Yy7ToDA4SK2
 r+kza0tFsxAxKP2MDTwuXhh4zIMp+DJ/z0jGP9VrRtKn1po8Wyo2DQqal/D7f1GYWqKZtTaIfnG
 ldbmK9dhJbuhAkVvemEiZdxzZQVvCsPXtBHVMmdbNF93YRZx4AZigyK2+WZ7l860Ad/ixLd6gZh
 0p3GC6PCRrrvP/L93s0Yg1/QdMS3npW9KLDMnGOIL9mzIzHgRBj1QZNtuBuC7ba6GNYZC1p7AvM
 +OD2vS50y0EL7onISR4HLp/7fR3rX7hte0Wukpw6H1GMhDoxsWPiT5wX2gKihCLchXMT0mS3XxE
 lmJ/YoRgwqjInrVknXzaSdagP5j2WZX3WtCE0mmaROQSRnPeXl4eMsJngp600vwDZzCitKcxbvu
 DBgFkw0ruQsR/qhNfPRptoxgpGVCvUroi/BwsGzWK6YadsC9UwRfsBPJrkVNRsftpQCsTbQHSU3
 fqig5cVYX91AGqKZF6A==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4dfccb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=PiMqHjl-x4LjNog7iuwA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 8RtwXdPSvakRa0nrR4HqbEwiJJJkEjn7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA3MCBTYWx0ZWRfXzVoYbFYadtPi
 DiMj5bvMMIMFPCPf5/+3UDd0FWRN9jUmmvUOeKVIL26hjqUAQzEI/QtPh/dpY+ghvhsAiNw/Gev
 4mfHXZc4oxxMSbMZq6UvMs45RXQSymg=
X-Proofpoint-GUID: 8RtwXdPSvakRa0nrR4HqbEwiJJJkEjn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080070

On 7/8/26 08:30, Krzysztof Kozlowski wrote:
> On Tue, Jul 07, 2026 at 09:22:27PM +0200, Daniel Lezcano wrote:
>> +static const struct hwmon_ops t14s_ec_hwmon_ops = {
>> +	.is_visible = t14s_ec_hwmon_is_visible,
>> +	.read = t14s_ec_hwmon_read,
>> +	.read_string = t14s_ec_hwmon_read_string,
>> +};
>> +
>> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
>> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>> +	HWMON_CHANNEL_INFO(temp,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>> +	NULL
>> +};
>> +
>> +static const struct hwmon_chip_info t14s_ec_chip_info = {
>> +	.ops = &t14s_ec_hwmon_ops,
>> +	.info = t14s_ec_hwmon_info,
>> +};
>> +
>> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
>> +{
>> +	struct device *dev;
>> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
>> +		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
>> +		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
>> +		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
>> +		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
>> +		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
>> +		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
>> +	};
>> +
>> +	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
>> +						     ARRAY_SIZE(sys_thermx),
>> +						     sizeof(sys_thermx[0]), GFP_KERNEL);
>> +	if (!ec->ec_hwmon.sys_thermx)
>> +		return -ENOMEM;
>> +
>> +	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
>> +						   &t14s_ec_chip_info, NULL);
> 
> Last time I commented this looks like actual ABI break. You did not respond to
> that, so I assume my finding was right, thus:
> 1. binding is not correct (although driver should be fixed, not binding)
> 2. the code still breaks users

Sorry I misunderstood it was a question expecting an answer but an 
affirmation.

By ABI break do you mean:

  * new driver with old DT will fail ?
  * new DT with old driver will break ?

* If no thermal-cells is specified, new code will fail with -EINVAL
   -> is that one a problem ?

* If thermal-cells is specified, but no thermal zone, new code does not fail

* If thermal-cells is specified, old code does not fail

* If thermal-cells is not specified, but a thermal zone is specified, 
schema is not respected

Can you clarify ?

Thanks



