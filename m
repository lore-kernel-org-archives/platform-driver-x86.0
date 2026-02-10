Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0AC2DB7A8
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717189; cv=none; b=SCxhdzlP21MEPyMLcpemqWqyalzkK95wxADSGDS/R+LIN9mPLY1FCNA8pKdSgG1a4DjLrcmPDHqQX3fqIc9OlgZxZrKuSuPF43z4oYEV9TwLD0uTu9D6iCFLhW6i/PR0x7DVXDXtOmt0okav7MF7BUBPkCjxH8mbakwlAjOxS/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717189; c=relaxed/simple;
	bh=sI5yXAMV0JZE2+l2yViRfVeGq5Bfnf3pZ0f+Za7CqDs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IcDgXSKZN9vL89je3udioONWjMsfyEBYUXiXcpv+ewoBNVf4ou+C8GPsMqncXU5CwGBIF+8PX3Vq4/n57fI2VwWCo81MzezmFRx7gRxuarEO3k+i6V+u+5bAarzz7g9gHTAddJujDFMGb3TD+xmxtRM8gpo0i6pEUjIaucAxqAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cq5/pMxc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+CkpsXk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cq5/pMxc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+CkpsXk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A3e7gH4102283
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 09:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nEx/It5p6yZ33v4KSAHenxC+etLia2LZS5v4aF+fzZg=; b=Cq5/pMxcYjBgsfVw
	VEEiNorPv5kQs7IX9cubt15HgQNSuBVyisClZEquhymV8K5EaLCBfN4TNlKIRWuC
	Y4sIEN0mUz/aNbJg5uXFTl/okRTg0B/vwypQZTtlJkygOrTxSxEJllFWubEWz+NU
	k4/F1JAnbCSb6Ofd2l5ejxtByGJ1BPQTr+f0iUkyRg2KY3Fd1v9dvFMSkMutdf1Y
	g4XGatyO/cycIjYLvAWO69mPvO4MyQtUTEYUO6oOLwUX0DKVaLNxc1d94jWTTnFi
	7drJQFRmhV/6MV87U8by7RY8aaCHL1fJqYSUZ5q5pzMoW3BONQhrXEtl+FuiXRc3
	VmAjaA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7k61k3t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 09:53:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70a62ca32so207183985a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 01:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770717187; x=1771321987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nEx/It5p6yZ33v4KSAHenxC+etLia2LZS5v4aF+fzZg=;
        b=g+CkpsXkJktDMf3DWiKD9e+bOHTnBUJ29RQyf9pOtklwT8dDPvgW1rBff+pMKZFrMo
         8tSlJ+Penb/POmtIqqvR8EZEXQvugm/kcXCTEaM/2dSpvkBN3OEUKG5utqmYGlNgjCuJ
         EphfxMBmHzItobPCbccqlGSqm/E48/daB1XdjrM3ZrKJrui5IMSzeAcr9uGMrfTj2UMQ
         rNZWA8guo1iorKyCzhEdz7fOOAUy2UaHZpwpOagtyd/o7CIDP+RA4U3GVjT5ZU8XQatv
         o2Si5T66l+I83W48hWGBkup+4iTkpVmN2BEDUeFpwwGLLbJIYYfekFUHMMQhZGUKnj6E
         5HfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717187; x=1771321987;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEx/It5p6yZ33v4KSAHenxC+etLia2LZS5v4aF+fzZg=;
        b=RTlZncH0QGpPHtMwyhD7EREo5VobNkg7lEcObANgBj6rFUwg7uAkuHb8HmPLhNS4ju
         /UI6ShIx+jTlu6WMsv3GZEjoaY2se8DroM6NeCFeRuZkIt8hhUDXd8gegnOrYnMnLOcM
         2Ke5w7A9G/uMMWGhf/dhaGitVTpf5axblFwK/MlidjmRKawQhMujbhP1/mH4yYCWpifQ
         20EK3FMUh2Rvni1IcZKaaYg8lwiPIe3Th5CCeFLolBH4v9/Jsk9Dvc1aOkgPOuJkZ07g
         jo+e3a+nvWgwqf/wMZXflOuASr9qGkvkoWyWeukiabJUVDLZDbbyioPa88XE1cBa63G6
         YfKw==
X-Gm-Message-State: AOJu0YzAU5LntttdC+PhfguZTIK8L1sGlrEzBMyNSx1D9jLEOnht6vEy
	C2if1vsBCQ7PXb/AHLvYoGzvjltdAci9d4mPpaABZ97YaCBbl3GM1uaPGVR7R8AD/wX4LbXByxb
	CroGvz8UofGld/6+K1raQjE+Q4MN/ztpMi3LF9I60cZoh7vyF4M4A5mGif5b6/xca+jvhkLnEJU
	gXoPhB0lWe
X-Gm-Gg: AZuq6aJSLHbatlebCcRFTid/NSZLCaqJL5GVumdYlLJ1a0TZpoxh4/NokR8tTBJH9O0
	/QUdsQSukJjmk6aCCd3hzndwcFQ1gos8FgTY0azyPjHVJ8q93PKfEqHJI8I0RwyGsq+1QxIqGmy
	Jf9IFAJ1oA5RaPClSayIE4ibazL2dMl9U2BkySi0+q5BNikfS6xmTWYejGVGNo28Na/EHAw9UOq
	7Tu2MZh/+9Dw3r7wuEMwv5K9p7lkW2l/0DtFqO3wW7rUby0KFE/6JDi/b4uOVJYswbqhC1JIVTC
	mIhe3xO+O9G2WdZSnnYroAD6QomHplkorEegpmyxAXEastPhXxaBb62T48NAflgC3/C4AGnHoH5
	B8B6j8hsE77j5ccICvT9zVpnpJADGOY9um8uB+WqWL04VVIlEW1ukMfYDSX7swhT8SWZohsr0Io
	XFi3yMzJUIB0n1Ks8gCJqDkVhS5raxoihTbU2Pd+wZfTXuhhwD5WJ2oia89fAgQhw1YmoToFy+O
	woaur+IiVDcV5MR
X-Received: by 2002:a05:620a:4144:b0:8c6:ff8f:58af with SMTP id af79cd13be357-8caf1acb367mr1912989685a.51.1770717186826;
        Tue, 10 Feb 2026 01:53:06 -0800 (PST)
X-Received: by 2002:a05:620a:4144:b0:8c6:ff8f:58af with SMTP id af79cd13be357-8caf1acb367mr1912988085a.51.1770717186367;
        Tue, 10 Feb 2026 01:53:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda74a62fsm518788366b.10.2026.02.10.01.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:53:05 -0800 (PST)
Message-ID: <9287782a-436c-4331-825a-18838f71e4ee@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:53:04 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH 2/2] platform/x86: int3472: Handle GPIO type 0x10 (DOVDD)
 for OV5675
To: Leif Skunberg <diamondback@cohunt.app>, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210081830.29581-1-diamondback@cohunt.app>
Content-Language: en-US, nl
In-Reply-To: <20260210081830.29581-1-diamondback@cohunt.app>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M8lA6iws c=1 sm=1 tr=0 ts=698b0003 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=rCIlLBn1XvrbnAp3xPgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MiBTYWx0ZWRfXzrZt539OXwnt
 nYi76Bc9fRbDdvCKI1SKlZQT9xpfuA4biobozaojpQ+DKZCmhGAHwWAijrIIqjCzhLIWSnJry20
 bGZy7QI2Qm59Wxxl2Pw3oFVKOBAXMMDU6235Lh7CbQUqPC9KdX07MyWap87/lw+qnpkaZok+JSq
 A2Rw59EZGkVUXFSAZdQnPp6cLODBc47OPkOaOFU6MM+IFFgwEE9crUSD59PGU3t5yX+gly+n5TG
 p456n7Qf6whcicP6PeVmMiEPh6P395f61oGGea8qun20mJGI1y5xfQarCCZmnQh4164WUmecNzu
 pWXt5j+OQFBgBSjgSSoYn4KKIXb3XrqlEPqfL5CXoozMWuZQqgGuyDvAdFOsdFjN+Moky7xGzgg
 by4uHdkre4CMNb4s4xtr1nmt8eFr+c6S/kxFQKM0nJqLirg6YIsj2R+OkJ2eHhsEczTv42UC45H
 uBcGbBhdlNlJ8cJlUpg==
X-Proofpoint-GUID: Z2GCBn17qeOMzQbPx1lGuvYaiWPZrt9U
X-Proofpoint-ORIG-GUID: Z2GCBn17qeOMzQbPx1lGuvYaiWPZrt9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100082

Hi,

Thank you for your patch,

On 10-Feb-26 09:18, Leif Skunberg wrote:
> The Lenovo ThinkPad X1 Fold 16 Gen 1 has an OV5675 sensor (ACPI HID
> OVTI5675) behind an INT3472 discrete PMIC controller. The INT3472
> _DSM returns GPIO type 0x10 for one of the pins, which controls the
> DOVDD (digital I/O power) regulator enable.
> 
> Type 0x10 is not currently handled by the driver, causing the GPIO to
> be ignored with a warning. Add INT3472_GPIO_TYPE_DOVDD (0x10) and
> handle it by:
> 
> 1. Adding an entry to int3472_gpio_map[] that maps the DOVDD type to
>    INT3472_GPIO_TYPE_POWER_ENABLE for the OVTI5675 HID. The con_id
>    is set to "vio" because "dovdd" exceeds GPIO_SUPPLY_NAME_LENGTH.

Note that drivers/media/i2c/ov5675.c: ov5675_supply_names[]: actually
uses "dovdd" as do many other drivers. Please use "dovdd" and make
the GPIO_SUPPLY_NAME_LENGTH define bigger to cover that.

Also please do not add a int3472_gpio_map[] entry, entries there
are for exceptions. Since you are adding support for a new GPIO type
you only have to handle it in what you call the fallback case
(which is the normal non-quirked default case) and then this will
become the default behavior for GPIO type 10 .

> 2. Adding a fallback case in int3472_get_con_id_and_polarity() so
>    devices without a gpio_map match still get a valid con_id.
> 
> 3. Adding INT3472_GPIO_TYPE_DOVDD to both switch statements in
>    skl_int3472_handle_gpio_resources() so the GPIO is acquired via
>    temp lookup and registered as a regulator.
> 
> Signed-off-by: Leif Skunberg <diamondback@cohunt.app>

Regards,

Hans


> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 14 ++++++++++++++
>  include/linux/platform_data/x86/int3472.h     |  1 +
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 1505fc3ef..0a293e73c 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -164,6 +164,13 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
>  		.con_id = "dvdd",
>  		.enable_time_us = 45 * USEC_PER_MSEC,
>  	},
> +	{	/* ov5675: DOVDD is a power regulator enable */
> +		.hid = "OVTI5675",
> +		.type_from = INT3472_GPIO_TYPE_DOVDD,
> +		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
> +		.con_id = "vio",
> +		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
> +	},
>  };
>  
>  static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
> @@ -223,6 +230,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>  		*con_id = "avdd";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_DOVDD:
> +		*con_id = "vio";
> +		*gpio_flags = GPIO_ACTIVE_HIGH;
> +		break;
>  	case INT3472_GPIO_TYPE_HANDSHAKE:
>  		*con_id = "dvdd";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> @@ -251,6 +262,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>   * 0x0b Power enable
>   * 0x0c Clock enable
>   * 0x0d Privacy LED
> + * 0x10 DOVDD (digital I/O voltage)
>   * 0x13 Hotplug detect
>   *
>   * There are some known platform specific quirks where that does not quite
> @@ -332,6 +344,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	case INT3472_GPIO_TYPE_CLK_ENABLE:
>  	case INT3472_GPIO_TYPE_PRIVACY_LED:
>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
> +	case INT3472_GPIO_TYPE_DOVDD:
>  	case INT3472_GPIO_TYPE_HANDSHAKE:
>  		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
>  		if (IS_ERR(gpio)) {
> @@ -356,6 +369,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  		case INT3472_GPIO_TYPE_POWER_ENABLE:
>  			second_sensor = int3472->quirks.avdd_second_sensor;
>  			fallthrough;
> +		case INT3472_GPIO_TYPE_DOVDD:
>  		case INT3472_GPIO_TYPE_HANDSHAKE:
>  			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
>  							     con_id, second_sensor);
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index b1b837583..d72c621f7 100644
> --- a/include/linux/platform_data/x86/int3472.h
> +++ b/include/linux/platform_data/x86/int3472.h
> @@ -26,6 +26,7 @@
>  #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> +#define INT3472_GPIO_TYPE_DOVDD					0x10
>  #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
>  #define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
>  

