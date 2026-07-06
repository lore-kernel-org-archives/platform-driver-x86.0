Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3983CC310
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 19:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366183; cv=none; b=ZLl9nm2J0jdxtv6Yjg8vqYlzm+/eSorgrDrI+z4NgMdkDD22pClxAiUFrybMm2RaQ4uSYK3FuWkv5MUxu8U5XuML3+NcJp0yb8wqakbT6SWgMaBP6NyHHlw1p4JbXHzxuV2uzlxPd/ltxXaSTjOpaZaC/lWj5nSZ7Len+C1APT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366183; c=relaxed/simple;
	bh=w3L9gA3qWCSJOJycfuLUhr74UkEspHCqcITKn7/B1Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdPz8Zz1NX/kOHTiPe8U2MjLV5zzT4JPaOGNaJlSj3lqmrVAFl8hPL20I7xxWib7jJpDKmbp7E9G3wvr+CbEdZUp3+/7yI08PsvmyfE9G2mm+Q9I3iHqLMbCzOHlv7cQbvR145XmUPclCGHGaPzv5thKILPtmMg9fOsWPUS6xWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OA23AkmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/tIcdTw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OA23AkmY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/tIcdTw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFNQa972706
	for <platform-driver-x86@vger.kernel.org>; Mon, 6 Jul 2026 19:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MNHaWIk4PBs4MJ6Wrebqp4A4AMrSu5e1jkD6u1Sr/0=; b=OA23AkmY3caOk9jB
	dNUnlz0tTKUiOmhQT/60BasqZkYmtET8Ptz2FHtHF65SEQNdaHEKbUA7U91OLXLH
	h0IaflwetgJaohLkZydtXvrbHM0m5kLLhYJ/fHuMbIHpSZzDFhW9U17ND/8p3aeI
	tRdo0BCQ2mNQo/OFjrZjokhSiAx+J7MQfQ0cQnYPOzW/VQpDv1dQuCntiiXkOb/B
	lM003tlj7LVU//H9BsGG66yxrbLqwf4J7PaFyLGzCuJDGyB3erUuiQ5g5x/qrngf
	84FeJTr5NnBY7e5yxwajq2xT0gRruMaOHlu74kIz206u/aYC4ozBwquujD79mZEw
	HvPzrA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r2h96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 19:29:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so252584585a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 12:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783366179; x=1783970979; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1MNHaWIk4PBs4MJ6Wrebqp4A4AMrSu5e1jkD6u1Sr/0=;
        b=V/tIcdTw3wO8CdE+BLX7cMbfXDw4oqcnUF0gB8y8xRuFAcF7PYY3tBBXGXL+OTGL98
         m1c2Q6UIzuohG5KLVhaW6kKY1HzbsTuk+7yGXy0iE0VSTR4DTi0cK6TdTlTDwOmibigI
         Pg8QwVawko2DFfxuYJI4+f6ZIGcubkmJfmOoM6nytuXUG5zFlcA0HRb5e1W+gmvLNbN0
         ZusW6cG+9NkXgNHpEQxBLRhhvj09xb3Hc9j471hVooVrPOtTlwp6OPPo44gm6SvwpzfA
         d917Sjg2lBT/TmIp+qbYpDP3rARTARHoN+ang7jSS9htr8oatFO+gKvYuF2eAj4LtFZR
         jkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783366179; x=1783970979;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MNHaWIk4PBs4MJ6Wrebqp4A4AMrSu5e1jkD6u1Sr/0=;
        b=qALch4pyzSwWyx8RXRhukFoOG9Ed2L+KLkQ8KIvvntzVTgd/59JyIBdklMwBbFoVxV
         +2xB5o6RpmIUBQCfYZ/b+1MImYUPOFZjjIdqH/Ak1VlTbr1CUHlEjyx1o7DpbucLMB5Q
         l0iOQB/Mii+au13GINQ+cw1uFjgCIuXx6qnaHj1X3qqm6WBDJYmLsHUxlW1zwbt3tXj0
         IsnF142Z2c7LlzsUqzYUr9E6By2RY6LDf3R6Qw1wJ4xtgA50MTIt7g8MvG29qVjPfJwi
         SGM5eGBNjAjs3x1EbQMfPUqhkXvioCkL38wLjz+aeRSWdBEg4mUjX/ITbQpdoCDpVgmc
         zdeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqmc9vWTrSp0krXyrAmXtTkXFM6aHKBrBhFc8f1SWFz2lSuI3Zd/5ZIcmZqtROGYEXoLtN7JmhT9+xNlZWO0gt6ozkS@vger.kernel.org
X-Gm-Message-State: AOJu0YyocaibPJwAVgqoyL751OZQqqC4rsm97mjSUhJK3V7zYRuM677H
	qg7gRYZnYx409NLjMHenl9srT1jJ0va+pGC257ZwMID/PEu/8IGFZ6YMT4o8PcS12kh/FupRM78
	JAqHAl9KgIudh8XbKmSCy4KtnmcZtAfsliyMo8wKYuR41Ih1m5/YfVhmo++8NGSnmy+HmAyR+Ea
	bn
X-Gm-Gg: AfdE7cnwjek525BRDuZ1Yo5+bWawT1y6COJJvLt7UzAJ2ZAsOaM9CHaYOWhrsGJKk3m
	Myjz6voDK9PF0AhXN0/jD1xUfOBSFhVPK2fin0xv3aAyWtmXcL8fAK8tAg7KhF+6n47sKeS7LVc
	cG4/DpMpTrQPC4ELRJDbUzCAxHZfafMVChTSG4kJ8OLsNXqcST57hv+c83jqMXuXIunBjkH8Ncw
	0hvKpotf4FjCjC5iEJ0dldgFu9ans0wtkoF4JAELo4rVHFw/HiT7LBTczZNRfx9lsCtNkNsvjjC
	HkmziwOyjnxd34NZMV/j4FnrDwfQQxIcTllfVr349zEVYEax3SX2frKxWkcd4LBCRaiNo+/C7Lh
	IW3wBfSzhDvdGgy5JTkoxcW8ei/URoPm4lXcHwQ5qUQ6AqoUm+1o9laorKWF4RqUWmXhq8TJluV
	ceNlCWQoa7jirh3/yaTn8TEcni
X-Received: by 2002:a05:620a:4412:b0:92b:3720:bc59 with SMTP id af79cd13be357-92ebb4f9c01mr259962585a.28.1783366179324;
        Mon, 06 Jul 2026 12:29:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4412:b0:92b:3720:bc59 with SMTP id af79cd13be357-92ebb4f9c01mr259956885a.28.1783366178684;
        Mon, 06 Jul 2026 12:29:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb685sm3095513e87.46.2026.07.06.12.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:29:37 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:29:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v5 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
Message-ID: <qfqoes52fjrd5ivq2tqfnua23lkm4qgyrvalik35qb4u2njmiu@5e5wugwoxkzb>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-3-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706184648.35613-3-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX7aD41yS8icPE
 cxCyUFzhVkb5Bgm07qwjN+61XaixRaZDzwMgbIa2ro2fOcBzWxOaksteTWX6LxPg79xkTq6Qqmf
 rZZiaPA0z5t1yuWn4yZplWCcuVxhs+itMW/o1ply4toT2SVXpl+sxFsGui+TIZVAqHBD6wNf60q
 ZrsEIK2+yj4SFRq+pgysOspjONWhY5+s8OZvWQXHy9TLtnhfnq7F9GEzDcfmKxdwR4TCxqmgapc
 cxA4qKyx5ZP79ZTD5hK3aaw475uqBLc2HsqmKBokabaQQTh7rMMNXWBsgQGngfM3+H9BU8NP4Ib
 ntk0XIXQqM9dd9aXuZuuP3ebUZucOzBF2aEMHZk2rwSmrMgNdOdfG1Tm9h2jMnVLUfJ38MsxatI
 VCQcqxkBAMO8CBlnXDmjQtqc6isxkHgQXhV2D1oWOOMLYxuLrXusJ00VRecY+XxL0gF65rAHgZG
 TKioiR1Ygr4ldtOzMhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX8fM7XSfmuck/
 IWdg4Sp2SPL6g7LZnyFc0wwbhLbEyxQynAw0dVbUATNDzHEL/iE4xmLCKqGWy+BRayMcqVda4lI
 RROj1UKD3xdU3+73XQdnxuGzK8aMeZU=
X-Proofpoint-GUID: 8XloTq2jPpzXws7rL6Vm5jX5RtwfYyQS
X-Proofpoint-ORIG-GUID: 8XloTq2jPpzXws7rL6Vm5jX5RtwfYyQS
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c0224 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=n5oyEeUQHuXu7Mk2C9cA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060197

On Mon, Jul 06, 2026 at 08:46:47PM +0200, Daniel Lezcano wrote:
> Expose the Lenovo ThinkPad T14s EC environmental sensors through
> the hwmon subsystem.
> 
> The driver now registers a hwmon device providing access to six EC
> temperature sensors corresponding to the SoC, keyboard area, base
> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
> are exported to allow user space to identify each measurement.
> 
> This allows standard monitoring tools such as lm-sensors to report
> platform temperatures.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
> ---
>  drivers/platform/arm64/Kconfig                |   1 +
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
>  2 files changed, 132 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
