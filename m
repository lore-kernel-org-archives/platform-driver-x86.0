Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7651D443AB5
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 13:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330204; cv=none; b=H6xJwEAZ86S9+0MlRCGDR/a3xRwFVV53F24MbNxi8Rs/ViQu4wQIhCMzjVtszbchXSA8e1/YrNrGT2hR1prYogXe5gghnJjXK04xMjGwUXn3wki62ghnkBrB8HMeov7kZZSJrQMWCNZcwPRbeB2vVIIxXpO3xUgrX9NE999YPGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330204; c=relaxed/simple;
	bh=/YeA6e4h90/TYAApBQ5RFPCojqWub7XeOGXkeguNddg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dl/XpxJDX5rEYsqkiOyeMRwdn++xo4/pB+lRsKsCHPyIT4iA/KwS3S96JXtHG2h1lr3Lk6xaR1cTguaX4yOpTl2xP6thyBnx3/t0cmcAvnyjJ+ZDGd3E0XPDDcc144pkTZBSnWqVm28ctooRfAyKp7dhCsJP38dthijMLuKDLrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opC6dvDf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bEEAoVJW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opC6dvDf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bEEAoVJW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBusZJ1981753
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 13:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tlh3rnxfJkXfV5KarGkZfL1Q3S+pBYhT9xp1RWLyIIQ=; b=opC6dvDf4y7teSIq
	f1gZnd7WLAx8MAXMbfxooWoZlq+OgUkKeTEFcLhao8AZlmjo8kNpYbBz+O03AtMT
	89w1oWmt4iQnJkwyMKmNyW1FpJxk1Z75bSnpPhT71QOaqI0nCWCZIG7n7gZAv2YU
	JqDJJkLc5Mzdm/mQlq17YUTZutsubQxjumWApDHuwcWH1vAOr0NYM//2d+p4gVqd
	zIrWAX59UsOANgV6LQJ85bqfNh+Dltm3EFvdjtDS6KmsX3bMieEYFQ5fPbVie7UI
	AsdoKYZZgLjuCXn8vs5x9STsc5JBBPRjdpt2JF1KCzHRjhc3LwDCO8yOLlQ23IVL
	Pz0N7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3gg88g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 13:03:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7621655eso1587510a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 06:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785330198; x=1785934998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlh3rnxfJkXfV5KarGkZfL1Q3S+pBYhT9xp1RWLyIIQ=;
        b=bEEAoVJW7hBeKuLwerY/7vNXT8Lv95w9Nbaqc4P77hDC8MLllq8kJFiMDNiasGZJ0h
         Qgp9usvixjWO705BEnrowjnONvPkDS+kPFWKuZKg2g9xdfDzwIaOpgo8CwFwX1s9dV3I
         KhMRw8GZChLzhgeYGapwbWjYAg5QMhIjObzaEsSNj4CYeSNrw1hculAftkiATSum6/BR
         YOd4PyuKYNbxaAiBrIJ5/5rdUXIOAwisiydCHfPG8sZH3Re/WX5XofVK/p0IWhNGGc51
         bzDEsl8mgueo3YuNxmUcdMy+bEzttvkTdbh1DI51BkjdYrqwOXhbhyn9TWH6sPU1+kgy
         pZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330198; x=1785934998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlh3rnxfJkXfV5KarGkZfL1Q3S+pBYhT9xp1RWLyIIQ=;
        b=g35bSvW43nod+c+s5pDzMbOJjRxWYMb0UX5X1payKIxdbi2opgXe05uJ5DwbA/JN6D
         AuxrWl5puSlg9RI4g69zeXF9LHcsPUHGTTienayXBfPBhWful3CdA9Y5QyrvIq2kpFlh
         xeGfynEtijSgSjvs7iXlYPBe6ZaetmJe/eCAZBzxOMzkRYBnU6WkkRo7VwFvPvaxiUhe
         WVhjEVT81BXUo+EpfilSFToSSktKea1+jS8nxAR/rHcWy/65mbZWOh6JXPILEBzgfdoY
         SgQMA0APcLfKw4rXI9OyXPe8vZqAvCqV51EvcYC/4qXTYq4ObVDL0RzSHdY3IhQC2WUv
         zPRw==
X-Forwarded-Encrypted: i=1; AHgh+RoGPuIU5iHxbmDZASPIbHcmGXtqmQSEq8gnQrcIr2UqvvgMXnvykfI+rWEcKYYfad0IEXLjeus3rCFfBh9aCeQeTreK@vger.kernel.org
X-Gm-Message-State: AOJu0YzRZ4lZJdLMmThFZDKmUiET8vVLodnp2i2QXfaVu4sMTzo4OzMQ
	3ziUfE3GQSicktZPpgC6Zsz0slEYWYA3qMH615QWxJWmkXDGjJZIASg6Cfx73YMEqONX/MHI6y1
	0ZUEAXeVvg74iyJ95kmWw4l+cf/+pRl5zQmv8VRiAWT2bmIWYXjMF2Z4UInoLLU8g2XcjaFB5nP
	U5
X-Gm-Gg: AR+sD12zZkbFJmqpjaWxN3qCLhQB2eRKjEcAStlSucjzhxZDS1MBhb1XdW/bXFoKuZ7
	B97cJDY2d0156ubLL8/8k43Lte5z4Hr12rCtV9wt2mDdp7QRkwW4kFdf1w/xd3bj28m9COyh70C
	05eM8NaX+fwouPq+JiIkgYTxpLn+ya7RXKgRoR0y9kizo8KbI1gB41qqA1wH4X0eYmEHcff7ea9
	nxsf7onMD57xKqdYl9XFrSP4YDOpr5f4qBOYn//Qhlwm7+K5buqg7Dwh5t/1Ju+as9nBBYlnVF7
	uXpDQk/ur6VyITV1PQdPv8OpQSbZTCvPfOGL7k8oPuAP94b3P7c1CjQeINLMc2ferPUnYBWmb/W
	r+VBM5ABNtrvq0WmdLdKh4g59j3IqCX5bOnYX16kLUAbvVD4njQhw8VMzAJ984hFoYxfMScZssW
	M3Pi5zRVyqNO5K
X-Received: by 2002:a17:90b:55c5:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-38f6a1b8aa0mr6429836a91.0.1785330197194;
        Wed, 29 Jul 2026 06:03:17 -0700 (PDT)
X-Received: by 2002:a17:90b:55c5:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-38f6a1b8aa0mr6429771a91.0.1785330196459;
        Wed, 29 Jul 2026 06:03:16 -0700 (PDT)
Received: from [10.149.71.180] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc71sm2710478a91.11.2026.07.29.06.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:03:15 -0700 (PDT)
Message-ID: <95133f63-c7fa-4c68-9db0-2123cf754f50@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 18:33:09 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] platform: arm64: qcom-hamoa-ec: Add SoC junction
 temperature reporting
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-2-771abd65ee1a@oss.qualcomm.com>
 <94081897-2e6a-4c8f-bd95-1961ca843478@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <94081897-2e6a-4c8f-bd95-1961ca843478@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwOCBTYWx0ZWRfXxqGIfqIXqKSl
 R/0eN9hjYGQUHFNrSM5gYtYlLDJA/p+axFSh1H/i37NjLrYa2dteqRpk8v5tbywyH6vwETKbhIt
 asw9jtVbE7trNoEGhKFZ9MecxZQLgDjiNsoyo9nN2S+NYdMpxEQhgiXnWa4kGezTQyAF7IZ3TW5
 oMyrh6t0Nz3JbBEHrd1/sskIK5aLI8Wklgvnx2Xd0UNcKY2XfTVI+CWt8SrNfQKK50dRVvIPMA5
 n4Te6WgnIHZXXOGYs4MrggvbZVRO0VKej876QPmU5iZSRmPFjhVYDIs7kBWXqSK4aTCLuie7KF7
 bq6AOoz/NpfTsW5TPDhzjtoylkTNk2Vf+uKDUPSGRmBmnQFctKacsFhkAAeHYmlbbhh1WuX+QLk
 40PLesuAhP0stFbwxElbootB6CAmaqf7CO//x+AwNwSGHzJ3oAG9smfmZbHrfrU9nXTZoHeVMGg
 zloVH515QLTP2H2Udnw==
X-Proofpoint-ORIG-GUID: 8xRb98xb_C6dPgFAsK4j5P4nrKB03VDP
X-Authority-Analysis: v=2.4 cv=EOw2FVZC c=1 sm=1 tr=0 ts=6a69fa16 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gdiicE2fkixeoH3Uy70A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 8xRb98xb_C6dPgFAsK4j5P4nrKB03VDP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwOCBTYWx0ZWRfX3TLDBPEf+VB+
 HnepRnLlFWvupLP4WU6BJkDwvffjY4RrUnaFuKvb28+P5DrUnC6HtXm2jhoYmmTYHjS2KFORUo/
 3QR4Rq8002MihTfITFDw3ge/18TLklw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290108



On 7/29/2026 4:29 PM, Konrad Dybcio wrote:
> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>> Add the EC command definitions and handler function for reporting the
>> SoC junction temperature (Tj) to the EC.
>>
>> Discover the platform's thermal sensor to zone mapping via the
>> qcom,tsens device tree property, average the junction temperatures
>> across the mapped zones, and periodically report the result to the EC
>> over SMBus using a delayed work item. Serialize this and the existing
>> EC command sequences (firmware version read, thermal capability read,
>> SCI event control, and the SCI IRQ handler) under a new io_lock mutex,
>> since the delayed work item now runs concurrently with those paths.
>>
>> Re-arm the periodic report on resume and cancel it on suspend to avoid
>> racing with the modern standby transition.
>> ---
> 
> Missing sign-off, have you run b4 prep --check?
>

Thanks for reviewing my series.

Ack, I missed to add sign-off while splitting the patches. I verified b4
prep --check did pass clean here. Will add the trailer in v2.
> [...]
> 
> 
>> +	mutex_lock(&ec->io_lock);
>>  	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
>> +	mutex_unlock(&ec->io_lock);
> 
> Does it make more sense to simply stick a guard(mutex)(&ec->io_lock)
> at the beginning of qcom_ec_read()?
>

For this call site it'd be equivalent, but a few other callers (e.g.
qcom_ec_update_profile_from_power_supply(), qcom_ec_fan_calibrate())
hold io_lock across multiple qcom_ec_read()/qcom_ec_write() calls plus
state checks in between, for atomicity. Pushing the lock into
qcom_ec_read()/qcom_ec_write() themselves would self-deadlock those
callers unless their outer locking is also removed, which would then
narrow the lock scope to a single command and break that atomicity.
Keeping it at the call site here for consistency with the rest of the file.

> [...]
> 
>> +static struct thermal_zone_device *
>> +qcom_ec_sensor_to_zone(struct device_node *sensor_np, u32 sensor_id)
>> +{
>> +	struct device_node *tz_np __free(device_node) =
>> +		of_find_node_by_name(NULL, "thermal-zones");
>> +
>> +	if (!tz_np)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	for_each_available_child_of_node_scoped(tz_np, child) {
>> +		struct of_phandle_args args;
>> +
>> +		if (of_parse_phandle_with_args(child, "thermal-sensors",
>> +					       "#thermal-sensor-cells", 0, &args))
>> +			continue;
>> +
>> +		of_node_put(args.np);
>> +
>> +		if (args.np == sensor_np &&
>> +		    sensor_id == (args.args_count ? args.args[0] : 0))
>> +			return thermal_zone_get_zone_by_name(child->name);
>> +	}
> 
> I'm not sure that's the intended use of the API, but this is NHI
> of_thermal_zone_find()
>

You're right, this duplicates of_thermal_zone_find()'s algorithm almost
exactly. It's static in drivers/thermal/thermal_of.c though, so it's not
callable from here as-is — keeping the local copy rather than touching
that file.

> [...]
> 
>> +static void qcom_ec_sci_evt_disable(void *data)
>> +{
>> +	struct device *dev = data;
>> +	int ret;
>> +
>> +	ret = qcom_ec_sci_evt_control(dev, false);
>> +	if (ret < 0)
>> +		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
>>  }
> 
> This should be a separate fix. FWIW suspending and resuming on
> linux-next/master currently gives me:
> 
> [   43.754787] geni_i2c a84000.i2c: error turning SE resources:-13
> [   43.754811] qcom-hamoa-ec 3-0076: Failed to read EC SCI Event: -13
> 
> Konrad

Agreed, will split the devm_add_action_or_reset() conversion into its
own commit — it's an independent correctness fix (also disables SCI
events on partial probe failure, not just on remove()), unrelated to SoC
Tj reporting.

On the -13 during suspend/resume: that looks like the SCI IRQ firing (or
its threaded handler still running) while the I2C SE resources are down
for suspend. Will dig into whether the IRQ needs to be quiesced/disabled
around suspend/resume here and follow up.

-- 
Best Regards,
Anvesh

