Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A058F3D3302
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2026 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838244; cv=none; b=ppJiFHqHR9fsSKdaLmKaABOigUdR5eOvffrRHF12rgivZiTuqhAJJl+cg4Va2m/GkvEZXM3Y1/afFHUJvSkHDi8DkUMv956cBi4xMmqoJDuFyTZEdWB+6c4NuJOqWqNc9nUz+wxihD6rQH9OJLEFI3eYxarElhK3Lg/BgbcWn6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838244; c=relaxed/simple;
	bh=4Dhcuw5tUuTiZQSI15Ese56b5x3LeFF3S0x0Fy/QLEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F89cXB2imyXXDwVYuc9KbnY8nd6qSnUhPr6GNYbN2i72wJ1qKEju7tEGsNcHl8FtT91EaeiFKX/KBBknQM3y7SdBSsmqxuaJe2OaCr19EvPkSya7bSeqvoL3Yob3NAiIKObpGt4yqaBUQpY+ECxiRsZ5LUE4TMw4NXWJ3bkbr0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvVGtHo3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6NimU/y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvVGtHo3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d6NimU/y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xk0g396181
	for <platform-driver-x86@vger.kernel.org>; Thu, 1 Oct 2026 07:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	96a7P/fzTBbDLB6LmK2sa0Ytq4psqM6uEcSlt2wX7f8=; b=VvVGtHo3GT6jOBK5
	OTk4ez7ZiK85rfgHwyVndsoBRvtv7V0N1tKSEccwwJ/33H1KZ0qwFPuhoZnjV9gD
	ECZUVZHA5DESK7PsUw/OcqEzdUeTCZxzzl/YKEjELgJKYJywRGP1GJLOdVu3mOkV
	Ym/QFXVgdngluYH47+GU0GLl2Jy3VHXjGAjjASUW0wC+6k0/vuSWCPPSwlcypain
	etz3SkBiM2F4nWfX1j0Pbg4JU31ZVmfqr3jF+dr7D0AOGRYIqrQzE/kn7JPk2M/E
	EeN6PotCHtHODpGQWB8Z9C72yXgyuuD3IJybHmxTcoTJ5BCTCPMkCZB0eBTLg6Wj
	h5Twug==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh59g8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 01 Oct 2026 07:04:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a470ead068so3757580a91.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Oct 2026 00:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790838241; x=1791443041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96a7P/fzTBbDLB6LmK2sa0Ytq4psqM6uEcSlt2wX7f8=;
        b=d6NimU/y0cv9RdKqIdjddUtm1Ri2PTcVnFNLd/OuotsJ2yHLix2+D+tRcKt9n449dW
         VZ7ObvVyUHRoqCyE/dWjXPuW1beQaxyXFvN3Jq8wJrfU9q6x6KB/c7zespo6pEuBcxSw
         lA/C/3lZl/OjZEa1pZnXeucNlhBV806SMTzA1kTrVTFkngrn/fnYZlVSNpjjAX6P4P+r
         i9972FqGcAStblWCMTrg+XIr/JsXygg/PTqvBCxKB7xGtNCz0C/qrykSCRMwXUGNeBMP
         AFxNvx3ZfmyA5vk54aXwBs4F2zszz9RsG7fqCpCf/OVWVeAJNgo1yGZ3g23uzIiS/u7D
         LmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790838241; x=1791443041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96a7P/fzTBbDLB6LmK2sa0Ytq4psqM6uEcSlt2wX7f8=;
        b=ecw+aGznY8n47O/nqcWxuLaTHWWC8/uUsmqRFYvjplm7TLDac6+oNSvA6EaaxyQfvt
         MVOYQu1dYdKs13nRGH9Vx2u4/o9x5koBW1lZ/MJ3sP3I+/+d7twtSY5v7v0FWJx8k8mW
         aJjK1rUpV8+4Rkv63BaQ5ejphB/ZRD7Xp/HK0OygWsu3h5qvBw5yxRGnYwVLFIuKkz5S
         VyzcZvEBlGFacTOayA1v6I9gOFaxEHDssWoL4r35k3+tJVpYwZSj2SyldD2xUExKCQZT
         wDYSxcTkLD8RHX3WnI0vWj0FwEjLTuHh8BtNKiUGL5X/fnmDKEWL44vauu31hsNJM5gQ
         JuZg==
X-Forwarded-Encrypted: i=1; AKwUvByeA6zc9+vY8DgsJitOstF4sTt4mGDwvsrL/ifXY19VRINI00YRElBcFj2X4dzvMCgxGrgtIrLeTuIPVMdPUH0JVkiW@vger.kernel.org
X-Gm-Message-State: AFq9FYJdOQvre1FbaPXa38Fh4Re7IiObmsun9aF8cIx7eOKYc2VjUHf0
	HD7lDw6D/4VVsEGp7uARXoKz+twtgVTd44rdwcjKYBqzhTN20EAtWoAGy/fgHR1+kZVGn/k+Wzf
	8LkrYZi2l+wzMSkf6juMvJ5c0MgjLjCseEi2II9ZFEEPweRwjfTKPMGKdGN3paDVRiWdfAvahqP
	Oo
X-Gm-Gg: AYBFou0gyUKeygujePEMtzKysxWrY2uaJKbJJKICg2ZUE7/w6J07lh6nnIsx+Vs4SgF
	c1sVpH7SoIN35URqkkqhz/O6XYmjzSAPISWgSKnFsbVwiEBB5OeO1k01SVeqSHwL+UwxjnUAUuo
	wUe8ArIfQ9dPbKH0SWVwtWSnRfVcBLHMQMhF2y93ih4MGfvweykIMyu4qNY9MvRp/wcv8z+1+CH
	8JITsLfOnf7KTzFswHYGaDwx/HZfFzJVggFYNSTc4pHXJJ17WkXQUnztx/LXkDpcsC4qi9r5Rai
	Mk/YVCFrgglhqnKVGoKT6j8UWmsnorOtspUdjdm+mgbMYcFclceR7J88MqdedV55r38KuxN9rNK
	zTpf3krmLeBTp+YWIyE9fLF+fMkBRnHOC
X-Received: by 2002:a17:90a:38e2:b0:3a2:b246:be70 with SMTP id 98e67ed59e1d1-3a4e92e5a4emr1279817a91.22.1790838240873;
        Thu, 01 Oct 2026 00:04:00 -0700 (PDT)
X-Received: by 2002:a17:90a:38e2:b0:3a2:b246:be70 with SMTP id 98e67ed59e1d1-3a4e92e5a4emr1279794a91.22.1790838240255;
        Thu, 01 Oct 2026 00:04:00 -0700 (PDT)
Received: from [192.168.31.121] ([157.50.176.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e548992asm918159a12.17.2026.10.01.00.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 00:03:59 -0700 (PDT)
Message-ID: <91c1ce61-a8f5-4da8-9373-46fbde6947e5@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 12:33:52 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/arm64: qcom-hamoa-ec: Disable the SCI IRQ during
 suspend
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede
 <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyNyBTYWx0ZWRfX74iTPJ+y9xxt
 /hCJXfdsu10CT8/mjwOONVX4uJY9Lhe6I5pNF+Pjbm29dMCO02Dxlr85SPskwmiyUPWLToAh0y1
 JynsFgMkwS/TBZxaEzGAf3KEmjlA6QotmI6z2ogBC0ZfwM8IzWmNvp9UWmR/hP6yoqFlU1piUFf
 yBt9jWdvMmDHAfT7gcIG0lBrY1fA1/ZHxB7MZQiCdkHTolP0fYLa+qBjkFXcBbiyxSlnJCQODLE
 FqNEoeYdefA0QmONn1y6R18lCigT6PK0W2OhWvfhjLTEXkPRnOPDefEI5wg+63waxIhoQXBiGFA
 ueHRKNTgn6QsRmaG8WQXS6uzxtNoJelUu4/w0OrRrXTslN3o8weSFs9FjWHQibMH129fEA/Fmar
 kVl5C2UKOvRh4HgO/1IHfRcjvppODu871z6WiE5ze1kWklTEPFMn1VjUHGmcuXrIdc7Hr1qMOth
 DgAHzGZZ+Kq9CHu4pLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyNyBTYWx0ZWRfX196y6WhJhmDs
 iqGRb68GgrXefizVIdMy2Rb1TEEwr1kcwuy1ioLRxixxuqJNDWAPnpCL9XMymFIKSCoyaBKDBv9
 o+og1KnBzYfQFm4/yiwv0hwln6kzUSo=
X-Proofpoint-ORIG-GUID: K4A7NERjTISTH5mFJ7eDcPjQPV904thW
X-Proofpoint-GUID: K4A7NERjTISTH5mFJ7eDcPjQPV904thW
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe05e1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=1jaPZz34DRay/F7TwEaVUg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nLr9611-85JZXDtJkU0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010027



On 9/30/2026 7:48 PM, Abel Vesa wrote:
> EC SCI events require I2C transfers to retrieve the event information.
> During system resume, an SCI interrupt can be delivered before the I2C
> controller is ready to handle transfers, resulting in failed event reads:
> 
>   geni_i2c a84000.i2c: error turning SE resources:-13
>   qcom-hamoa-ec 3-0076: Failed to read EC SCI Event: -13
> 
> Keep SCI interrupt handling disabled across system sleep so that EC
> events are processed only while the I2C controller is available. This
> prevents event reads from racing with the controller's suspend and
> resume transitions.
> 
> Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/platform/arm64/qcom-hamoa-ec.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> index 4d2ad042a7f8..d34afd901324 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -331,17 +331,28 @@ static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
>  static int qcom_ec_resume(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
>  
> -	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> -					 EC_MODERN_STANDBY_EXIT);
> +	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> +				      EC_MODERN_STANDBY_EXIT);
> +	enable_irq(client->irq);
> +
> +	return ret;
>  }
>  
>  static int qcom_ec_suspend(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
>  
> -	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> -					 EC_MODERN_STANDBY_ENTER);
> +	/* Keep SCI reads from racing the I2C controller's system sleep. */
> +	disable_irq(client->irq);
> +	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> +				      EC_MODERN_STANDBY_ENTER);
> +	if (ret)
> +		enable_irq(client->irq);
> +
> +	return ret;
>  }
>  
>  static int qcom_ec_probe(struct i2c_client *client)
> 
> ---
> base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
> change-id: 20260930-qcom-hamoa-ec-suspend-irq-464201cadb6c
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>

Reviewed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

-- 
Best Regards,
Anvesh

