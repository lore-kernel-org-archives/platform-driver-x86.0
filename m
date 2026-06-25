Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97E4276050
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374591; cv=none; b=g9nfX2TfuYtf2hYiUPNPtTqGDEfjYOdOYwzuDpAIMc90PtxJw3L+RGz7RPSmeHl+Z4wRswSNUPE7O3mDgLYKpCugEoXQA7ynp6Dgva57FWS7GW7wQGu2X0t5GxwGhS37TwYDvv1zBzvBUBsJhW1uNR6jOT+BkJHmPFAw3hAxJZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374591; c=relaxed/simple;
	bh=+LeUK2W5WFxMKhi1pUwMIkmIdcqHQRyIWqYHLGd/T/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWDKrZbibh1QNZAEIMlhZDW50u2evUT0fNfKq+RboxMKpHI4sI+1BmyCX2c/GgilOHQaHAqaH54eif98WQUhizQ6L9mXSAOLJ2BdU1SMwAbH2h3daZ5i5MJYPojxHw1AIX3LEuaq5ndw5CK5leffF8vRmnQa+dZeLSlAUCyUH+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqIS9j1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEGvldsS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqIS9j1t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEGvldsS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3ePNj1192274
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 08:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rO5FCGXsOoFHvv0mUd0JcJWaoLBN4ynun7BHL8hKdy8=; b=AqIS9j1to+afer2w
	TBq4LwesK9SicCLGAyGSt08s7w0zPebsw7YZg0wTrIa8NQqDpF2CSvLrOXzh1nK1
	vwaNumsxuvNfWr+X7k0wcoTa22j8ydLkGKabfRLryANYtODU8Tmbx7oPyb/LxLFs
	SNNse8jCF7jR/jxa38+qzk4X7y2HLWd8KB6R60skirMK/VoJtCuJzyfYch7Q+gTb
	zQgdD9V9PGVtkmlsQ0EeHj0c6DnHINfFDF7siO9XMm1o5YnzJZGh3uZAsRfgJEE3
	pA1cvXx/ezBX/dX1RgfKIF8/9u/ZW43exOYR/4dEBrLEcWau0zPWit3kyR9rUSBR
	ds1/WQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uhmh665-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 08:03:08 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5a503b1766fso56023e0c.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782374588; x=1782979388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rO5FCGXsOoFHvv0mUd0JcJWaoLBN4ynun7BHL8hKdy8=;
        b=AEGvldsSKfHU7MuVHBGJyXthXCQVM9RC/a6LBzhnlduPif/3pXJY0bq/tRFOZABg3/
         na7BYBdKwOm2+/gHr/Yi2Exa06G2wq0rQu/rALgxuKbIkIL0aczAHVXVDpmZmjK2o/D8
         agdcCJkfhZ1/5n3QVSp19i5ooPODkdzskO8lwo2eturfTx8HyznS9CSIjM9ZM8PkHjve
         jxcVNGS2Y6wZlJ1/QulpjIbys2iY+xQLzPomUjPqrofwQwfAwT/3Ga/sjKra8q1OUBcw
         4RWeGRGs8vTCwebhbe6GzWMx46b+VqqDFHxWCeUZm18muSgnqG7h4QrdwUIfz9OvckAe
         R+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782374588; x=1782979388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rO5FCGXsOoFHvv0mUd0JcJWaoLBN4ynun7BHL8hKdy8=;
        b=mQF2LHJuaSXmX548+7h5z1ijiLn0cpt4zCO7WLCDtjDru0/+exlj58EtQr8P5QJI7b
         F3ILAVFj1hUPa5YhdGV35iVtxoiz2+EBem5kQN5WxKaQ4EDw1+nMhemz9r8OIJn5cchg
         i3VOE3t6KbQdaacuHoOo8tFayOx1uStZq5MkbfnYakBAzpCNb/Vn+jxGkV7PbjW96moC
         sAQn0Ollq20qsBeLq/q57PFn7SxPObuKDxJKCO7AexhcuPgdDLRjcO4M98yxjHiSExAn
         WA7/JlO+5y9QVASNKbmsvw2BGq3C40y66oMUUSBN1OyU4H8Ro2/VEZa/4PncCzFSQIN/
         lHnw==
X-Forwarded-Encrypted: i=1; AHgh+RpvrHfpWU0R8qeL7Bo6Rzkd1pMFiEdNBrfJkxNjZVRc6NfhiYKCo9sE3iY2vxYj4LyoQdmjFxHHiEz2Q/hl4ddNBp7W@vger.kernel.org
X-Gm-Message-State: AOJu0YweeigMjns1+yreqd302mdBFrNW+kBqj3ImRPoJnRxsPjV9uv+m
	11NvllN7wYHTXMnGySEXFCCUXJFJ/cVLP+4Vx7fFT85luwKly8rZCFh0mBonn94pBDd/w+MVkl1
	Wr4AzOKNW2zy9nsJ13EhGG08q9K2zzTmtPmDg8BMQ1mVbfcIrnpKfWboi2YwaxHLZfnRevdDfhE
	Yx
X-Gm-Gg: AfdE7cnKPXZnOir+kpvCF1giOY5yQDd+etx1ppHQJ4gttV+/7Fs1dtv84AjjZPemiit
	x5geY9/IIsGJW5eWaTm25MBm58wXH2hDRpMHGmlAgdYTag13vxhRCZEGExmMn2vH0HkWyDqWXpC
	m9jF4J9hOGBZS2cvXRL7mGaO3Mlc3dEUov++vrGEnayma4y2Nyk8Mnc5RScctd2hpSCIcCWPoW4
	Zd4krhYsPDT0yC7R8hKSn9WypkLTRsRwGjkC/FD3+Y7Ob7p0b3/BnNVv3iYKPI3EA27RYhr5p+R
	RE1E6ojyipnW+f5l31jl+JlhIgS5BBaarw4UDX6O4XvJdJrPuEJA5gs+WwpGRdUxgZb0WRuTaFj
	Fh4/DCeoP4owMmo2o6K/Y58W4q9+Ssbq77UQ=
X-Received: by 2002:a05:6102:548a:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-734360a285amr157871137.4.1782374587917;
        Thu, 25 Jun 2026 01:03:07 -0700 (PDT)
X-Received: by 2002:a05:6102:548a:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-734360a285amr157854137.4.1782374587428;
        Thu, 25 Jun 2026 01:03:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe59504sm121399566b.43.2026.06.25.01.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:03:06 -0700 (PDT)
Message-ID: <1d26c917-917e-41b8-ad52-8c1f3e306ce6@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:03:02 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cqerVV4i c=1 sm=1 tr=0 ts=6a3ce0bc cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3l1M8v5O_xJZoUiDCkgA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2OCBTYWx0ZWRfX1v9Kpc5FCwHj
 jIs7GiS0cex+6xUhGie3uUqQe+edlRfiqXXRTCcLUGpL1/vQcRajeXfzZzU1peGhBHZw2qiKs1f
 GxUbTqBnNB8AkAgD+HFriMeWqtK3ZKRAwPJZm1uK5cu2l7c5pVkmni2Z+geRiM5YAh6gphcvtiV
 EyrXl7tkhLXaeyScet/1bTWr2Qc0nEIerFdPJrnOd4NtNmRinRKGgzSR+ls1+divnWCfz+gWnCc
 G9znzfr6gLKD7+vmO9Jf3JisqNIXcuG89BDksW3n75qNBOIlF+ArIvw3QkeLa8SefS6Is6KkNph
 6Cu8SlcE8NP5BcGHrKeHyRe/Cj3lxtynJGP3avmyDocUG4U0FWKzAcogdfl3HtLEEC8biHqcKlt
 rk4JMWjqWL/YVtrXve/2M6zhgvlqMm93wUSBicpqGDpNP4ZCOQYV9euOgq3nkHTZ4JFD3CB8s5C
 YXJROOP/tnpiVYg14pQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2OCBTYWx0ZWRfX3erPhG6GCldz
 hQfkRMMh7AOu14Mo6Id7N3mTWK95d+PGLmtxUEc5pSWrh4D/flqeIbhWUtqz/QvRN6RNVaCtxHr
 h/BUj5wRCiIdEneOo3Hi1chFP9UScvM=
X-Proofpoint-GUID: LQnsvzrBZa-WiDFxjiwGrplQNqRW3s7z
X-Proofpoint-ORIG-GUID: LQnsvzrBZa-WiDFxjiwGrplQNqRW3s7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250068

On 6/24/26 11:08 PM, Daniel Lezcano wrote:
> Expose the Lenovo ThinkPad T14s EC environmental sensors through
> the hwmon subsystem.
> 
> The driver now registers a hwmon device providing access to six EC
> temperature sensors corresponding to the SoC, keyboard area, base
> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
> are exported to allow user space to identify each measurement.
> 
> Additionally, expose the system fan speed by reading the fan RPM
> registers from the embedded controller.
> 
> This allows standard monitoring tools such as lm-sensors to report
> platform temperatures and fan speed.
> 
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
> ---

[...]

> +	case hwmon_fan:
> +		if (attr == hwmon_fan_input) {
> +			int lsb, msb;
> +			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_LSB, &lsb);
> +			if (ret)
> +				return ret;
> +
> +			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_MSB, &msb);
> +			if (ret)
> +				return ret;
> +
> +			*val = 0;
> +			*val = lsb + (msb << 8);

'+' looks funny here.. although t14s_ec_read() only reads a
single byte and assigns a u8 value to the u32 that's being passed
to it, so it never *actually* breaks..
 
[...]

> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info t14s_ec_chip_info = {
> +	.ops = &t14s_ec_hwmon_ops,
> +	.info = t14s_ec_hwmon_info,
> +};
> +
> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
> +{
> +	struct device *dev;
> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
> +		{ T14S_EC_SYS_THERM0, "soc" },
> +		{ T14S_EC_SYS_THERM1, "keyboard" },
> +		{ T14S_EC_SYS_THERM2, "base" },
> +		{ T14S_EC_SYS_THERM3, "pmbm" },
> +		{ T14S_EC_SYS_THERM6, "qtm" },
> +		{ T14S_EC_SYS_THERM7, "ssd" },

Makes one wonder what happened to THERM4/5 - may they be dedicated to
the 5G modem, perhaps?

Konrad
