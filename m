Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3B73B9D84
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035005; cv=none; b=TwV4lsQyUJFhuYvTJIeaMcUUmoGMBjfp2XAAVr6nTtXFiZEKDAAAu6HgaINQJFCWObrxd5SiznIC7yl7MOnYaUPgNsbQsbV/hAzmw+rsrZ1Bdd6RB/WQwOOeDR5ROUGgOzSEF1CpPbDpoDpiNsgTIgh+k4WB+fV2H2wDrfZmPhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035005; c=relaxed/simple;
	bh=vxiPU/CghZ0V8l3HZJYezZsMM247sES4zEEMkAqZ8eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jiFl92h+Ukv/h+vq8p7/8tbgggmOky28kMZ9UcqSYNoBm8yzdDOzk/WAm0ztVkdNCYtfAy97CjFYVCoMxH5JG1RJT5Ilh8I6wjCotN/P0b5qJ0h/7DFDIjdrWi0OF52stT+qRazulR6rWH2NAJBUQPKJ0Ody4uDesbTTzi/VGvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ccgI/hhK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfE2xvVy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ccgI/hhK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfE2xvVy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317jtMO1004266
	for <platform-driver-x86@vger.kernel.org>; Wed, 1 Apr 2026 09:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYLS9EyJfFCFWAF1/cQCFqZ3LfYNSZYdzW4EeWxH2xc=; b=ccgI/hhKYztpf6Rd
	Q4cHjKVPwTja9hvD+Vn2t4ZRzswb26NOo6YQvH9EEa66GYWl+A/a+mNr/1w8oh4r
	irSVYaSoI2R+HOl1oMF1yuySa64C7XnzGc5amayYAxZHagfocceA6Qhiue3rYYPf
	x6KQY95HdjT8pUX9qdxFR8a29KZF9sPSOSqHDM3yQAQCEOLE4darYTRe31SzoEYl
	KzWoZuSMKLaRRBNBE1dSKgs48/lEs0wpe2J9DjNItg8fzcjFjCSor3idiPJp/wmH
	ZF5hWYFIQ39b4guq5LagnnwGRw0ntDM5VNKAsAPflJMi/1imSq8OFmQQCs8op0LG
	dk/fwg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjhh5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 09:16:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d0095b0d80so214669185a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035003; x=1775639803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYLS9EyJfFCFWAF1/cQCFqZ3LfYNSZYdzW4EeWxH2xc=;
        b=LfE2xvVynn3L3iKrA91fA6JmohAorLxCrPOgYekaWTHACVi1TUzEAI5IqcwmFQ2V22
         +OJIBBDGr/KoSPUOU3XRm0vXispooNHov3xus/QkFagsd8rIdgTYdyp6S1pRgU7gP2JC
         CWmVJJjYcVXcNCDmNYSt4Z0vJPHt7n0V0+CyQ7PxoKMCWEdxustd1RYlDWfl24yKk4Kb
         bjyuu2tPrAvWNeSkguxl0m9r97mopwrXQCXcRayRs3vo8MxJeROzHjIlR/6n4gjShLCG
         UVPFjprxKYLC6gCVEcXTqLvDiz6jWpmlbeVm0BxMh5dmxBUHiAcdiKGUq7cwVr1QkAab
         NfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035003; x=1775639803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYLS9EyJfFCFWAF1/cQCFqZ3LfYNSZYdzW4EeWxH2xc=;
        b=mNjVWRDEGywuVrxqbSPLTBgVeVrXHnT/lKrJRoOvazoYibdu+KbQcn8yuqACYRJgl9
         20uhe9Zsp+K2D0xWHT1Bz6qYBo+cLfhzMzXlTUQgBJGrbS3VQXjUBxJOK+oHnEnIaAuv
         2XODn+eiSWd+Nkis4szX8P+HPqFAa+e7cB+OtxOVSU88xfN0Pv5Lwr8t7gNQgqeY1FDJ
         6o86d1FRsFEUEM+ddeHvzlpiusEkRgAMH/f2zXAJz1mDZuQ6TQvcKct8E7qetTCIB58x
         HIPMIqbnMVAInncIc3ABOExUqQzXN78a+YlNFhdywZVZLV6c0/EWnV+Yk87USBV2ndU/
         QCEw==
X-Forwarded-Encrypted: i=1; AJvYcCViY37Yjr9SpH1nUR4zP0KW/8Lf5OwncuYk0/uXG8oFjwQpl5nPnU5hXvRFU/ZSgg0VmY2Lb2MFeB1d8JCCN4FtfEmy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw00hWVed4xYN/XAQQirZoDOpLSrF9UoF7UvW2co160CksWRpxF
	v/mVq9b1QRVlrDshyN13Awox/gnyuWtzHXFCPxEy/Vy3ZI9DFHlhmKNMjOHd7vS29vK8ZZRTBxR
	ZSLB/ca5hb345Lkwu0/vS2gPQ90eLmpT3vR3ff2dfzWNovyJR6vw0z6ISabFdImBUsv7rpfV4xV
	IL
X-Gm-Gg: ATEYQzwaEjxxfLVQO6UbYB5cqlka6+3GGpH5g7Do17vxZ6XVzKg4BVFsiX+//S4NZmW
	fmtOaw5GzEh2yoBjAomObUsoTpQrPLc8hZXq4bN0k/Y/XYsQQ2aY8L7R85IbKT06WevVU3F2zhD
	bzIKjl5CaRqmacV8K/37np5NAP7Mo9VO+7hacfk17T9A9YRy72Duh+Kg/3e1hpNWMah0xHWrs+9
	rPeg6NkM1LT63moDjqKg/pxq7h7EphFL5zFV9ULD4pRaC12SyVsyf8tGV7siNxjdbbdbH2/Uj8N
	qW8NjPJuEunoaC1Mlu+JboRFJ+gIQkowOnssmH2AkOQmp5MaEvtD4kkcoqfVIBQfqCanUsVWVDY
	lCjURUzcgmbj3Vlqcnf/J3tkAStZjJZTtyXcLyZ63OvXlTZbwaBauvNcs2nu7gqvFC/l4h+P2oL
	nze3A=
X-Received: by 2002:a05:620a:460b:b0:8cf:d953:b4ec with SMTP id af79cd13be357-8d1b5ba9ddcmr320526885a.3.1775035002646;
        Wed, 01 Apr 2026 02:16:42 -0700 (PDT)
X-Received: by 2002:a05:620a:460b:b0:8cf:d953:b4ec with SMTP id af79cd13be357-8d1b5ba9ddcmr320524985a.3.1775035002201;
        Wed, 01 Apr 2026 02:16:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66bf3e16f80sm2826294a12.25.2026.04.01.02.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:16:41 -0700 (PDT)
Message-ID: <328acf2d-988e-45b6-9553-240108caa91b@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:16:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform: arm64: dell-xps-ec: new driver
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
 <20260401-dell-xps-9345-ec-v1-2-afa5cacd49be@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-dell-xps-9345-ec-v1-2-afa5cacd49be@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tSQRML8g43NgwzBdrcj44oo9zhmn4C8C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MSBTYWx0ZWRfXwhh+ikRaU43L
 I2d/EYRMrcA4BWjZJmTLd41SdsJ3NFtwAa3BTdUcCKgcl5TtN5oo/f/fqoD6aXhjN275xN1za1d
 IfDqFSLiV9MSO/UDodjTvdDY+arK3Zj0c30UJW39wjReq762cbifP/z9UpAFrZHYhaG7hJv4H9D
 T+vlhw/26f38BNzRgf+YDQZUktP4+TkC9BBj8/Iu1FSc0UklM8mhUba8Mghk7KTsFgmwAVMP4z1
 64vv8oSUrK9EGqJz48Bpc+CVwT03CahplUbifyNcQMMDnSNw55RKOik7tG0Ol7vckDtm+Ljqv7q
 oasA3JjhTqLwO8evhlvJk8rhWUTTD6L1BdxOo22d462HytdCafvHkEHuF6n//B4zq5XEfjblkxQ
 FWsfAq0l0RXKDhbdAUaDQvxS+oueW35YPjIt/3RfKwJtOZgG2wSZ/0DmwI2cC8aZcdgqxyWLnG2
 RWsg9GCU3Ph5EIz/pdw==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69cce27b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=yMhMjlubAAAA:8 a=UHR3rlkMSTzHGIdMw-oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: tSQRML8g43NgwzBdrcj44oo9zhmn4C8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010081

On 4/1/26 9:33 AM, Aleksandrs Vinarskis wrote:
> Introduce EC driver for Dell XPS 13 9345 (codename 'tributo') which may
> partially of fully compatible with Snapdragon-based Dell Latitude,
> Inspiron ('thena'). Primary function of this driver is unblock EC's
> thermal management, specifically to provide it with necessary
> information to control device fans, peripherals power.

[...]

> +/*
> + * Format:
> + * - header/unknown (2 bytes)
> + * - per-thermistor entries (3 bytes): thermistor_id, param1, param2
> + */
> +static const u8 dell_xps_ec_thermistor_profile[] = {
> +	0xff, 0x54,

This is super wishful thinking, but 0x54 is ASCII 'T', perhaps for
"Thermistor" or "Temp"?

> +static int dell_xps_ec_suspend_cmd(struct dell_xps_ec *ec, bool suspend)
> +{
> +	u8 buf[DELL_XPS_EC_SUSPEND_MSG_LEN] = {};
> +	int ret;
> +
> +	buf[0] = DELL_XPS_EC_SUSPEND_CMD;
> +	buf[1] = suspend ? 0x01 : 0x00;
> +	/* bytes 2..63 remain zero */

buf[1] = suspend

(since it's a boolean argument)


[...]

> +	schedule_delayed_work(&ec->temp_work,
> +			      msecs_to_jiffies(DELL_XPS_EC_TEMP_INTERVAL_MS));
> +	dev_info(dev, "Started periodic temperature reporting to EC every %d ms\n",
> +		 DELL_XPS_EC_TEMP_INTERVAL_MS);

dev_dbg()?


> +
> +	/* Request IRQ for EC events */
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +					dell_xps_ec_irq_handler,
> +					IRQF_ONESHOT, dev_name(dev), ec);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +
> +	return 0;
> +}
> +
> +/*
> + * Notify EC of suspend
> + *
> + * This will:
> + * - Ramp down the fans
> + * - Cut power to display/trackpad/keyboard/touch row
> + * - Periodically (?) power them back, such that wake-up source still works

FWIW

https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/modern-standby-firmware-notifications

Konrad
