Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C9A52CCD9
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690068; cv=none; b=cdYsBAtd1yRuooVHlbvmZoOW1dtqV5El2plyIOaX/ikufu1vT7B0MGf59z8O69pBBR+3D5MwLXOVyqKLG1UjrxwR4OVTLrT+Wphb5X4s4fzc3rLQJjvI+up88YfgGFy+1A3uuR9GvqVRQJ6nlVMbr2TpPXTGVQRcjPs8TSOO8Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690068; c=relaxed/simple;
	bh=2kkUUFp0qagaU/gKBiglRLEWrZQHJpp5922EOC53ExQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4PCkol5FRirv8JqobhfLJlL5egUJ4JftEoSBAvVz+6yKjWFq/3+YOEPPKDOnArOts5aT/dGpzfhVFoJmnm+5e9yrEKLr8E2bg5ZEJXiTjP8a2cvjsQiRt3j5g6FJwTdil37uSBStvMs1kF7RKgX1LAjpF+8+Iu9LUkEEdk9nDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxtttK78; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OzlNcmzq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxtttK78";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OzlNcmzq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqeLx611496
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 13:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lvd7lu4mno/Z990JhVXgfPPLfxZWBbM2OSjnR4iGsbs=; b=ZxtttK78tsI17zTa
	oEMJjOXzY8l8UNNCrtK0HnDa3Ic7phPrwafncq7VjFwgEK5geFUzG1IrrLtE2KWR
	52NUIha3IJNOjid4b8nAmxUwQDsJxJ9fM8TXXUCf3++3MQVeaDOQrXsQqHUafRqr
	PLG7XAwvtFXEHHCKlZkQi6kEWDI2kc3dn+phUkoiN6io7AtJ6rC2E7Sq8rRJ8KJq
	yIcrYdP32yZAN/maK/ULIYicqJ/RJsUnPyHE/kGGDtcw7AICqkqMD6xKpr9/k4Qt
	EV65Sx/dU/OdvsWbzc/RxRQfIQ00ECAN9BJQAKYIXJn9FpPuk8NReg9pNlKw0yvn
	rmsMzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4udf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 13:54:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939fc317691so77437185a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 06:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790690065; x=1791294865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lvd7lu4mno/Z990JhVXgfPPLfxZWBbM2OSjnR4iGsbs=;
        b=OzlNcmzq3Skx+AeVpBPSJETB1DaqzV7Tn3r3Kd8GcVw3c1tPSuLFdZjtFDjzHFc9z4
         MnHABAUIfVCnkee0EroYZXIsdFthra69y2ATPp8SH/Ilt+8ur+4mMsjP2BZA2Yv+q4g7
         urgZty//o7qepoGM0pRBVxpqNyFDVI9Tem2qB2cjV/F4ZdGmB/0zuyLpYBi4PGPM2Wgi
         txzNUS942G2MOIRXgrFNvnMgrkExqeVjN0Q3DiSOlOkptTzt5sGWuFmDwcR5uT0hWn3P
         hidUMAphNlSmFjB8r3/+IunuXdEvCPI/1qAIq9O5pT5WvIxx8PyHRtUrlj+YyLD62eNH
         YuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690065; x=1791294865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvd7lu4mno/Z990JhVXgfPPLfxZWBbM2OSjnR4iGsbs=;
        b=KuibVcT6MUt4G6afsxJdZe2IZFGAqblJW0pB9P28Hw5t9LiB1WA6k3PiyZROsDMHuw
         gJGEtzcLaWJJHcm8FJ7NNdTEHbsPNJJUk+Un0Qr6b7tVMAIxL4HmsWP1XvZQWmtmWTwQ
         mkWoU4qJk+mss2Mvmvm2bAzE8aJvf6HnBGSvba9OXObINEzLj3ob5p/3kBHdVk4cAPDl
         I8GMGjPCcmwmjAYQC2Dpst1rslueC1zuf5yUUW2MHQqKV+ZXdSSRKQ/4Lx5b9ljI7xvA
         cmu2mICL3ZBkd9z90/LlOKETRrRFv2TriF96Wi3XGAsu4FTdv3/+YcGMvoeGgDT2h97B
         X21A==
X-Forwarded-Encrypted: i=1; AKwUvBz+OjRA6mm+ILnHkPkvqKyQzsDfJsYH+jYceKtSBYEwHt63izcLcotuJrHE09apoWh9UhxPfbqnyT67zaag5U+NkdjK@vger.kernel.org
X-Gm-Message-State: AFuF++kkdlwscXiSwDZhiNxj5Hxa7Dm4zqT+P8XX00Fsh8fTjWyWYfh/
	3rHqRupht/4V62yTVnPsI+Z4aJZ++OIxGgnwALi5/6CPTQ8bAPtQVad77HA/qnslo1umkIAGN6S
	VqO2uFOU+vFUO1oZtc8p9scH0Ty+vrssTV92XzyYQE3xAOFQY4HEclrtHNcjELhdjOZudIgKqUg
	l7
X-Gm-Gg: AYBFou06Snva+h61uVI/lMQbV1UdYgkjcric/euh0Iw0Qdjb12QhvfeBcHKLvIeNYeK
	oZrj5nddh9l82k//2rpQExbqTJQTP6wvuvX7foISNwXTgWLSHsQtKxxmsymwuQORKwodMdSsLLt
	reD7+aFWPpVIOUmbCg42bGHCM38P/bxFS4RVa63Xc/B62YgBnCm+Ic+bOE5O3VZXOPSHG21T/fk
	RoLmbFGY1z0E/e7Ai2Fh/eX/JmunPsWFHg2k2e2oKhEUk027rDKcJ9V6FvHLvpwF9hd0rCejAVE
	okpU3NS1L3rZJ0puBGBhE8VX32kol5HL6joKPfQnLWYM47GZYPO94k/JVHmhztl6l3YC/50gqVD
	iJqIZAsKVepCjCOj/TWviyQ==
X-Received: by 2002:a05:620a:1a15:b0:939:9205:4d78 with SMTP id af79cd13be357-93c43d40617mr2603508685a.3.1790690065133;
        Tue, 29 Sep 2026 06:54:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:939:9205:4d78 with SMTP id af79cd13be357-93c43d40617mr2603504885a.3.1790690064613;
        Tue, 29 Sep 2026 06:54:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9e873f45esm1414207e87.82.2026.09.29.06.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:54:23 -0700 (PDT)
Message-ID: <3aa4a96f-76b4-4961-8c9f-4eb099016a01@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:54:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sc8280xp-x13s: Add embedded
 controller
To: Alex Robinson <alex@ironrobin.net>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Steev Klimaszewski <threeway@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260928222056.10044-1-alex@ironrobin.net>
 <20260928222056.10044-4-alex@ironrobin.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928222056.10044-4-alex@ironrobin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX4+b3bg5ghytS
 ReY9cXUzX5Ov9s+dhzzq66kvVc24HaaFZIbP0OB/0GVuleegOuHw1imWZjXg9Qlu14+RoR/z8pu
 gOPwdDjRkOxGTojsXYvagdbXX9L+jxs=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbc312 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=USHUXImS27okXdFuVjEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX+i7AZq8kk+MQ
 5tu8Ayw9zdKpCn2bvQP/UpOGzhmUgYRvFoSYPzFlOQW1UBb3dzr5QXNproaqRFPHvEtxCCHHJvQ
 fmQHooi6TNOS8x/JWEA9QbH9WFKjHqn/HqDyyrbBxUooGC0Z1/pvco60AWBPuJ7XpYQiKI1RCQT
 yC+yXkuf2f5L03afdkiYmbYc99teWnxRFB4pqY3vIGn3qeRz+oHiV0pTRewXAlylS+WB7YQa3He
 MogkCBW2Fbt+bwrXXKQKZITM25RFlDRN/pfy7lhCWYHT+tw96nfzdqfTlbBm3s6Zi38tMNkeWoh
 ZJqUM4dCSCWTP7xwXYmgWdMgOtqI+MSzj8rpGENVWdwtSSd311lUXtYf8JzI6ooW00Vkrtlfctt
 IRJJXBunW2gdeCVba8u30XlPWvP7sEvZpMRz4sr8dD0OP26Tg5oiZTuCMvvIdHP1w04I/a8xrrS
 bkC/vRsorDTGhSc96Nw==
X-Proofpoint-GUID: E4bh-4FYsgZ3uBPK3C7f3RU56jK1dhxM
X-Proofpoint-ORIG-GUID: E4bh-4FYsgZ3uBPK3C7f3RU56jK1dhxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290055

On 9/29/26 12:21 AM, Alex Robinson wrote:
> Enable the embedded controller at address 0x28 on i2c8, with GPIO103 as
> its falling-edge, wake-capable event interrupt.
> 
> Configure the QUP8 bus on GPIO43 and GPIO44 with 2 mA drive strength and
> pull-ups, matching the working firmware-established pin configuration.
> 
> Configure GPIO103 as an input without overriding its existing pull
> configuration. Describe GPIO176 as the separate active-high power-state
> output and configure it initially high with bias disabled.

Most of this commit message is unnecessary and repeats the contents
of the diff, please direct the clanker to:

Documentation/process/submitting-patches.rst

[...]

> +	ec_int_n: ec-int-n-state {
> +		pins = "gpio103";
> +		function = "gpio";
> +		input-enable;
> +		/* Preserve firmware pull configuration; no bias override. */

Please find that value (read it back at boot) and place it here

> +	};
> +
> +	ec_power_state: ec-power-state {
> +		pins = "gpio176";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

Drop this line and assert the state in the driver as necessary

Konrad
