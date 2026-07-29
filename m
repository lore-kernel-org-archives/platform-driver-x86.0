Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260F446C4CD
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319734; cv=none; b=OO6w3X/DL39+UWIIts8HNOYyt+zfJuXvPpiqd0VHw3QiRCwGTy595rv4OFnUiVD8FmyCxJGieJe1HtbC+ClFetGavr2cFCQ+khlb1PBwFUNaMfgt5hUKlMIxlsy/hj0Zg+UQe+xCDoumhlgND8xLIoML3plN3pnWDFlrlRBqgB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319734; c=relaxed/simple;
	bh=Hwk1S7lzdqiZyZYak8BfsEgEB1WeXddoxPOqV4jqlD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Koz8CWg2SfuSVUFEGU/lZRLXeFUCZyuyUHtGex9Tz3/9vfTnAFwl/zggeJbVNiKgMeCNPdehg7a33LlyX3HbZ1V5MkxUig+dYIX9dN3uoT42Ew046LMpfPaPg17bxBP29rQp/IfaJOhM6IJFHfyA55eRLJ0Z/f8W4s7w9rU7V9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSoJU6AM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UA9WAPcF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSoJU6AM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UA9WAPcF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f4Oe1088932
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 10:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3jwyr/mYfDCCJ44cwnelmCu9rUPzg7i6vRo3FDhb1Aw=; b=ZSoJU6AMcrMXItDu
	FyD6tdjPGz2ddJw0MVywREFMf71S/0sw/WG5A8gxSxNU1w64Fjry8c3PsTHM5eLF
	Zfd3vjQ35GnbLxgMslgiAa4HojPTfnYnAPVsXYdn17JBwxtqY71RltsILImPBKcC
	ZBv4ym1PhuqosR6uGTzfES/QQgBd8mnQVB/O4PN+Bq0+c39ZI5pqEnkhllUisplS
	NiXmsN/RjrrydViybCvtLXAlH8Cx0tSYdm/xyg3czcc4dPkQh6XXym0eZOQ6KKDC
	UXaP53GTQcNR/S7rGJtWc3O3zaStAgTBqv/dIl+0xzVIM99YNUoJE/4zg5t4OwC7
	4JGaKA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5saj8sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 10:08:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so1403870a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 03:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785319731; x=1785924531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jwyr/mYfDCCJ44cwnelmCu9rUPzg7i6vRo3FDhb1Aw=;
        b=UA9WAPcFQFw91wZxK5UuAXn78bdCkYncfwvl/AA52PB5bDwebzRsnV1VQ5c3SMjodo
         cr11OIWsGZcQq4V8fzDOZ3evCy3qUVcHoy4UOopNybOrdftSncJHzo3XhUaSJU9rlh2s
         Lv5mxbVWPwnbU2UVzz2nJxa4+3Dfi/UfBZADQdan9mq4aooUA2/EXTmyN1FGUov2XC2v
         kJZ3OA1Y5xnSEOOyOMFyM7yVR+9skBw05DxUW/CdRDqLDDhSIXeUXYyT1nmrfxgG9pB0
         ZCbJJcHEeAPLgj87JhCXH5FgDOXaePLzNScaX94yC4MmiE1Yiw4r8LMS0qf7IHAsfq23
         t95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785319731; x=1785924531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jwyr/mYfDCCJ44cwnelmCu9rUPzg7i6vRo3FDhb1Aw=;
        b=o1K/j9qj0EW7ApBzMngI+MTeSF4Dq6s7atXnEEdi9E2d4U5mjypKSJgPUA72qCzTqu
         YUcDlrNCcxzjGYej+YBu23/SvMKvtBCrXDZz1ZVKMFSPJNE+z6ug8Sls6S5eyob2ky/8
         Lwng+mH4WMKHxC6E5EqUOTMpTfeakYG7f8+mSxXWYTPYeOQqKPBC2iNTaBWvHr1utYOE
         QnhXO1+wQwkpQsnozQ1fliBS74iL+nLI2bspS1NIt+kXUMCWio2vkbc6BtI0K8aHgvbH
         CnsM1Gno7Kr8oKSTbYcTkiZXKj143IfIQIwt/rCrnP3KVSEvALVPnZYk5F0NW1vB8SMg
         vuLg==
X-Forwarded-Encrypted: i=1; AHgh+RpHeGUPdqXOuY5okrHS/RaCZcffdFvFg/5Oo7EUoRA7bbZUQVKKvxLCDqjA5E/j+j0g/Mxmi1dwStTOyHrTeFqTvNby@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+uffdLSj1IxVfOsQiiBYgaR7nRfYhlBobmyodgjr2Azwx5Ti0
	TEJSKIMge610X2Udbz1dv/Pa/h8qBcBh5yT9D84YxTSLqtNwzd3gIFDmRD38BULAqcZjBjlydro
	sQvTK64IyL0k5L2XRSYrdNjPIw8+Kf3OEmkAtK0INuAt5hBEwezzwTerTeYuGT/De74wdDkYMsy
	pc
X-Gm-Gg: AR+sD13pJ4sb89TP48u3QFSNpvHmqf6tnNL6mEIz+k7mdC5GltFPHEc1trG+qPFvGaS
	KCNgsh2sEraR1CIQ5vybMN8zRiWm4RZ28IiH87UtEusdtiIGmD9YA4CokEpbG8E/0rgBusWTy7z
	51fmvlMiTjvNJHf83IlJDI6sG4r+rN0HqgxpjftaLr5MwqQJjgw7QJah5exrQoEgSx5nmV4oJAW
	XSNeEx+RXprr8YWZSIEDEJn0Rp5tWuk3aLAw0j0Mxd7RCGocEMG0FqwGiMmRqme9FrboMsr/yHF
	pxShDwu8z+DNlA4g5GA/xHwBg2nrSy22ShecvoM3Kyl2SDPEfJ4x6MS28fHlIVBZLbzra3zGV5s
	RrK6swyxK4gggcnh5dRdafMZxrsX6u0LBhBL+KgA8i96MAvylqGhgotOE1b5c2qjM+hrQxch/pJ
	vDH0K5/7LrtQwK
X-Received: by 2002:a17:90b:1a8f:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-38f6a46a55bmr5936864a91.24.1785319731286;
        Wed, 29 Jul 2026 03:08:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8f:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-38f6a46a55bmr5936829a91.24.1785319730798;
        Wed, 29 Jul 2026 03:08:50 -0700 (PDT)
Received: from [10.149.71.180] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f8072e258sm479397a91.0.2026.07.29.03.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:08:50 -0700 (PDT)
Message-ID: <d1a6474c-68c1-42f1-8d2d-ad5acdd25fd6@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:38:45 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: reject incomplete
 responses
To: Linmao Li <lilinmao@kylinos.cn>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260728111924.4106898-1-lilinmao@kylinos.cn>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728111924.4106898-1-lilinmao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Wvh_Jo8cq3xhwraM5ihzN6ytjSsnAXdg
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a69d134 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9ISaEpGMiJIsBVUMf2UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Wvh_Jo8cq3xhwraM5ihzN6ytjSsnAXdg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4MyBTYWx0ZWRfX4UOHsmDmrSXb
 Qkd5qZUm0X99y5sFS4M4jLFhndPTlglzm7UDEn6FYsebHLKvMKxyyYNZdTgnn2l9u7DHa3rlY7O
 Aswo2T5qVXmk+jlJp/yPPBddI2qbdyk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4MyBTYWx0ZWRfXy2YaBmtdvD9+
 dUT8sIxezrj5fVTcgfjyB+V0eoo+IWaVRZ8ZLG6Ke56o08eUDh5aTG1f2W7T0XoNvkEmYk8nfw+
 H+ct7EuJItbTytukjKRw8iC7Vzs7Gq4YjNvev/P8KgyUHdRUsAAsONdf/rLRfSHYlP4vStM5VHR
 m/jlxsf/tKJu0X0w05wmNBX7jhXe6RddEtuOxEza4a8dWpdQ3iJyuLkKd02GZlinz2dLxehyisT
 Jfukq1L/9rl6UlUExacdAyXWyk506HrIk5WBuVKW+MA4xP+OwIh3rDXXqW9v57GLP12Fb3sfzFI
 +Rdf/cRQk9V/CJMukzQrjHrlue6cLPwA+T9RZFl7aj3magThCjAASUQt+U2ybYaSqSFoaokL9H1
 KW0LxA9Ur3qR3KBqUZviahVr09zmNpx4fi84vCpU/Tv86M8EmvhIvqHp4WNthKU63z1uMiwSgYM
 KVnMMeRMSRtfPdjgHdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290083



On 7/28/2026 4:49 PM, Linmao Li wrote:
> qcom_ec_read() accepts short positive transfers, while both callers
> unconditionally consume every field in their fixed-size response. A short
> transfer can therefore make them use trailing stack bytes that were not
> returned by the device.
> 
> The first response byte contains the number of payload bytes, excluding
> the byte count itself. A complete response of resp_len bytes must
> therefore report resp_len - 1 payload bytes. The existing check only
> rejects counts that do not fit in the response buffer and still accepts
> an incomplete payload.
> 
> Require both the SMBus transfer length and the EC-provided payload count
> to match the expected response size.
> 
> Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> ---
> The resp_len - 1 requirement is based solely on the response layouts
> documented in this driver. The EC specification and hardware were not
> available, so please confirm it for supported firmware revisions.
> 
> Compile-tested with CONFIG_EC_QCOM_HAMOA=m.
> 
>  drivers/platform/arm64/qcom-hamoa-ec.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> index 5ca7308c6077..4d2ad042a7f8 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -92,8 +92,10 @@ static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>  		return ret;
>  	else if (ret == 0 || ret == 0xff)
>  		return -EOPNOTSUPP;
> +	else if (ret != resp_len)
> +		return -EIO;
>  
> -	if (resp[0] >= resp_len)
> +	if (resp[0] != resp_len - 1)
>  		return -EINVAL;
>  
>  	return 0;

Thanks for catching this — nice find.

This is independently fixed in an in-flight series that reworks
qcom_ec_read() to use raw i2c_transfer() instead of
i2c_smbus_read_i2c_block_data(), removing the partial-read case
entirely, and it already has the same resp[0] != resp_len - 1 check.
That series just hasn't landed yet, so your report stands on its own —
happy to add a Reported-by: Linmao Li <lilinmao@kylinos.cn> tag on that
commit when it's re-posted, if that works for you.

Series:
https://lore.kernel.org/r/20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com

> 
> base-commit: c5e32e86ca02b003f86e095d379b38148999293d

-- 
Best Regards,
Anvesh

