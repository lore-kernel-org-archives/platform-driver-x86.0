Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358A52144CF
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 17:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764349921; cv=none; b=snvkMwOwaH0d2dCMIR4fDaLl/JH8dKfaYb2G3PwrCcFfbZ4aAGn3KgpokQ8P5bzH4tymqdXWqvtAYQUhKFHvNT2U38Ea+7tWlsHRDZIxM7txwuHWbrI4HioT7kMGPOcBlHq/oqWzU/QpDFFqjWgmDAGDJeiOa/IcCs3sQutO13E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764349921; c=relaxed/simple;
	bh=xMt4tDyR3nrlou4hMBh7cpDfADPS67o4fueVPJ0SSm8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=fJDz3cCh1AWCKHzoiwtlnkBHeBLg2lsyxSYDHq0CkBHDwXecEdvXYFE1N7yaKkhH3SLsdfxhWVP5RubNDqVu+Jqwavz1jVyT0MDN8NruJdXdhcej9ZRxxZbDktPLuYJtEFZCdK81AH0ev9fj/WlF317qdVGcBUEa1TnqHydL4EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KW0dvgRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jhpG5Ug3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KW0dvgRZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jhpG5Ug3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ASH1ok3542226
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 17:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z9M7IlSh4iULQElpqj9976fHdhFmTZIiAl3V8r1KaQs=; b=KW0dvgRZz4vib2PY
	C6Egpy8OxGO4wYH4yQ4BVhsVkvrswFi318EhKH+njWTeQWsFb54BE4tVZQxymqVs
	rsUTwXBERBv+JJLiqZfabs6MfbpHiNqtVmaNxtGPOxZSy4caXuX97/NijddJKDMo
	Pi7hUc5sSA8BBVpfwK13RGLoFCL/vum5kfFjVHqaLH8HmHwRSsc+NXuaYlFZyE2S
	GroKl+pI41Dj46Se5fvAh5KNpcu4+0HJSrnhswMx/elzE6IUAO9EAWF4fwhq8Wcu
	rFPYfJxjkpkVs8QFRJqNNGN/oDLltyt5MM09G8b+cN0+Pv5fEW4fPWuGOB43e6MQ
	/cApyw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmynv13y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 17:11:58 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9353647cc30so3652567241.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 09:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764349917; x=1764954717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9M7IlSh4iULQElpqj9976fHdhFmTZIiAl3V8r1KaQs=;
        b=jhpG5Ug3eVWB387/SCDgafrWWZ8Y0QAGXuZt5nI8rSTuEz4PHL/+2q3oThxISjD+XA
         9cy4tEZHU6KTrkPZWq8/cyKgCYhkh3Uz9ap4NkiXfDEgloiWSugVF6LKi34p4IpJH297
         9VpQmzU5qKcHSeiUn6CFh84mF/4EZhw10dXCH/iOVgT6Dfqiy4X2UtQZ2dnHihYpUE9i
         VZLCqtlT1zauwgl40+W10wBZcpfkw/i43gH1xrckwv0y8tXo6YeC50w6xC3RURpd0Vue
         lKwbgQ2CqLROVH+4Ja0ame+zDnL2RedEYU8flPLbhr8mvDzlggzjLrs0y9DgSiR2TMJi
         YR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764349917; x=1764954717;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9M7IlSh4iULQElpqj9976fHdhFmTZIiAl3V8r1KaQs=;
        b=OllKfYBtBcmlF0P2xP7cigZZEse5NqgVZeExxRlP6Pd4iOqVdHyWqxyg2A9OzZKr+S
         QOpjj/WXSmIyPscKPd4/ioDgRzT56nAA+yAtDvmi5nXzXU1SwzN2TRPYzW5R9nrweDSn
         1j+ckf1mOVC3jy7SVYPVSXrpzYELvu56FVipZB+M3TmoSpeie9LLg89w10/0NiSBxF64
         MVL678DHuT0XQubauqiMEpBigUrh0vRq8X6W1/dB7SlN5WgMUQz9XI36fl2toP6+lJ8C
         deOnNPxzJx2Pyc13N4azzbLYYYn9Gs63vzguzPLs6cGhTaoKbR9hWGX8352dLHOfXbjH
         HP4w==
X-Forwarded-Encrypted: i=1; AJvYcCUWx588w+C5iMODzJ4yEioMGncWjuRQAl4Ur4R7LlJVoFL+h3Szmq8xnhCq3jHpTz7dR5jtY4dsXlW7NH/metVugb2x@vger.kernel.org
X-Gm-Message-State: AOJu0YxMiPBu/eEFzB3zPE/CTlhGICIG45I4OF8xcXIpLPNG7Beiev/S
	ZyOgMrmhYp2yUKlxJ/hPpQJdnGb9yRNK4o0iaDA6FvUZnJlYYZQeKwR6U8/prC9razs9ceZU+NG
	FbWfXvD3n2vtmCfT57HNj2QKSIdjx3dfEtbWsVAxYj0walv8++lTvuRg6/oja7o5Tlw8AxwVrKu
	QF0CVs8KPT
X-Gm-Gg: ASbGncvNmjPm76wPv3Ng420vckNRG1sN++01pgzEgm6/L0r2Wp/PXyGQfBdzjIvZCr+
	4ZX56wz2LM2IjI8a2FEh6RMQq5rEczeEHgSr+Iy6EHYf10KNu3xXfUM6zxH9KAGoeHPxRs41WeF
	FMeTtLRFgu6l5oCdRHIYX7IWijULm059POeSQOcjhGJWShSb0NNDqUXtv30Fq2pNZgpaqmwlKmU
	xoz4/3ehYYuDdLr9v+Ah9HjRNDiqmI6M8D797n29H4SLnYYWKTqXrWWthZifKqw00uwF8XDLiZt
	s92xjnP8B8QRqpmfOm/JbILYJDhGSCe7lqsOIl0lKt1vcu78evvcNH9iVbSKF5VWjZKovvVtkl0
	ltaU2zrDuusq/eUyD6j7ffipXv6UuJzmc8vtgN42nsvCatMhQC4g1xO9TEY8knIQZ1ivbF+ffzs
	Pih8XfmhS2N2J445ZzjCZI96pdInnR6XaNPCBZvfCSC3zX45Ns6XOLsUPRiSSlTrW3Y2oDQd6zC
	Iyt
X-Received: by 2002:a05:6122:d1e:b0:55b:9bef:2530 with SMTP id 71dfb90a1353d-55b9bef4661mr9704372e0c.6.1764349916891;
        Fri, 28 Nov 2025 09:11:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGB/h0XO14YW6nL1xQd68V6QM5iI03CiV0XTjFQqoVP1S1eYKjZpp6FO6XMoS9EaHYg13rHGA==
X-Received: by 2002:a05:6122:d1e:b0:55b:9bef:2530 with SMTP id 71dfb90a1353d-55b9bef4661mr9704304e0c.6.1764349916427;
        Fri, 28 Nov 2025 09:11:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647510519efsm4692929a12.29.2025.11.28.09.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 09:11:55 -0800 (PST)
Message-ID: <08ae4f83-a62f-4b2b-965c-6d04aaffbfe1@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 18:11:52 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] platform/x86: dell-lis3lv02d: Add Latitude 5400
To: Dmytro Bagrii <dimich.dmb@gmail.com>, platform-driver-x86@vger.kernel.org
References: <20251128161523.6224-1-dimich.dmb@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20251128161523.6224-1-dimich.dmb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RkRNBgSWJcTsVEZjcDgl7A0CyvmxV5dd
X-Authority-Analysis: v=2.4 cv=QOplhwLL c=1 sm=1 tr=0 ts=6929d7de cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xVwF6FL_aRjpLl5APUQA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDEyNyBTYWx0ZWRfX9ZUPU472ij97
 1VdU5CkpUCo+xzxlaga9bScyZVkFj1yxbg45ofuWKARSdxVK9v2rQ5GMzV+RchMVgLpr87jT2xh
 0znriJawKs6lDVX4C5+9M6FFMoLM/l6ZUcPI311kCj4g+e+GgYXojKe+NfQJ8UvnNge85aZdWE6
 a9SAE2HlGsk/c/Eog/9t0nuM8bmGKAvLrOWoZ+HiEY6+y8LFUvfPXQ5mk/GcVSfosDOsgVBy5Q8
 6yDgvNf2LKS35012F46F4/9Dp3TJ2j35Y7dHMm81EbovoYRLAQYqyRyPrAQX20aE/L/BqBd+fBY
 SiXEuiVkYrdKyICLtBnhlA0Bd8L/fPrnJPUzW9LZJK1mF38rj83+7FrcJ50ygu/3fzuFeF/VfHF
 5QVAcf/mwDX5K0Y5LDHP56d3zsbGIQ==
X-Proofpoint-GUID: RkRNBgSWJcTsVEZjcDgl7A0CyvmxV5dd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280127

Hi,

On 28-Nov-25 5:15 PM, Dmytro Bagrii wrote:
> Add accelerometer address 0x29 for Dell Latitude 5400.
> 
> The address is verified as below:
> 
>     $ cat /sys/class/dmi/id/product_name
>     Latitude 5400
> 
>     $ grep -H '' /sys/bus/pci/drivers/i801_smbus/0000\:00*/i2c-*/name
>     /sys/bus/pci/drivers/i801_smbus/0000:00:1f.4/i2c-10/name:SMBus I801 adapter at 0000:00:1f.4
> 
>     $ i2cdetect 10
>     WARNING! This program can confuse your I2C bus, cause data loss and worse!
>     I will probe file /dev/i2c-10.
>     I will probe address range 0x08-0x77.
>     Continue? [Y/n] Y
>          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>     00:                         08 -- -- -- -- -- -- --
>     10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     20: -- -- -- -- -- -- -- -- -- UU -- -- -- -- -- --
>     30: 30 -- -- -- -- 35 UU UU -- -- -- -- -- -- -- --
>     40: -- -- -- -- 44 -- -- -- -- -- -- -- -- -- -- --
>     50: UU -- 52 -- -- -- -- -- -- -- -- -- -- -- -- --
>     60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     70: -- -- -- -- -- -- -- --
> 
>     $ xargs -n1 -a /proc/cmdline | grep ^dell_lis3lv02d
>     dell_lis3lv02d.probe_i2c_addr=1
> 
>     $ dmesg | grep lis3lv02d
>     ...
>     [  206.012411] i2c i2c-10: Probing for lis3lv02d on address 0x29
>     [  206.013727] i2c i2c-10: Detected lis3lv02d on address 0x29, please report this upstream to platform-driver-x86@vger.kernel.org so that a quirk can be added
>     [  206.240841] lis3lv02d_i2c 10-0029: supply Vdd not found, using dummy regulator
>     [  206.240868] lis3lv02d_i2c 10-0029: supply Vdd_IO not found, using dummy regulator
>     [  206.261258] lis3lv02d: 8 bits 3DC sensor found
>     [  206.346722] input: ST LIS3LV02DL Accelerometer as /devices/faux/lis3lv02d/input/input17
> 
>     $ cat /sys/class/input/input17/name
>     ST LIS3LV02DL Accelerometer
> 
> Signed-off-by: Dmytro Bagrii <dimich.dmb@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
>  drivers/platform/x86/dell/dell-lis3lv02d.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
> index 77905a9ddde9..fe52bcd896f7 100644
> --- a/drivers/platform/x86/dell/dell-lis3lv02d.c
> +++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
> @@ -44,6 +44,7 @@ static const struct dmi_system_id lis3lv02d_devices[] __initconst = {
>  	/*
>  	 * Additional individual entries were added after verification.
>  	 */
> +	DELL_LIS3LV02D_DMI_ENTRY("Latitude 5400",      0x29),
>  	DELL_LIS3LV02D_DMI_ENTRY("Latitude 5480",      0x29),
>  	DELL_LIS3LV02D_DMI_ENTRY("Latitude 5500",      0x29),
>  	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6330",     0x29),

