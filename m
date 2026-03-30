Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561B7382F31
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 06:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774853539; cv=none; b=YAQoIqzxwdaq4EcGIizdQ+OKZIXzGfRQShvSdevsMWgLt4bdoadI4QrQfzyqw39RllwesaSOHoqcuUB7a3JxBN9BCcowFWDnNtORuhy9jfIE8LwK/zPpbXOMAiAxrgXFsQkhykeIStqtresSgnQLhEy4R8dHbuRVHVQHeHUF+Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774853539; c=relaxed/simple;
	bh=EmDj421TyHr/sfirfrzl5JYdDAMG9Vp7WLhUIhB1Oqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SP/QzTyrbSL9CBpB3jPnwWgRx2l85WiP9DwphM/OqfI4rm+SeDSejiEuzLudyaQfOcVnGWMziSxo7x1dXdl4CU0utHyAq1EA3mLDPosd9B4oXmZeDeN1E3yZZKlncB2dwT/RAxCPwOS43YTdB0Lj+r+w0NAB5JFXuDms0mawFsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+l1yveQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zq/Ue1Uk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+l1yveQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zq/Ue1Uk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4OeI22197293
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 06:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69P+91lyrDDQ/DKIeOYy+Twbri3cK6MdMeGzg9mFaNE=; b=Q+l1yveQ93C0HSow
	mlgwFFcOOuoc89YBzv798i7FKO0FnPPH9UCQ6tqpDgjyxfXHo8jp/kG4vjkdcTSW
	cxE+iH/2RD9JMiODGDtsL0/S3B7mYUVJ3Lc6w+WgW6CvYgRw/M/UunMYPY0T1mtz
	SQlwX+X6dofzWJxhtCkZ99UbwQ2Wpyq6FiDOdTvFy8xUSsRGAd06kTADwU7uR574
	g5E2XjLm5nEmRSNsdm6PRmixfYQu1qxDrpyFCiM9sSu+SJ4xFvmO7/4UhcjEkK1/
	uFpD1eZjTdOzhmtj8PxxAkgX7w7KBtEktg4Lb4JupgOWRvuV8bGDmPEs0DdbXqc2
	UitxKg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c2snd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 06:52:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c73c065dd15so2723979a12.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Mar 2026 23:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774853536; x=1775458336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=69P+91lyrDDQ/DKIeOYy+Twbri3cK6MdMeGzg9mFaNE=;
        b=Zq/Ue1Uky8YYkVUgeYqRycdiYPLS0pEl5+bKR08AvbHv2oqHwCJ5vwiHl6AkmmlxIS
         4ylCrutmNnP4w7zBoguWE6WiSEeO6v2fGJNsbD27iyD+h7W5SeVH8+2EONx1yDUeU6mw
         N7ST4VfvkRyY0ys9rfTDNol1yk3vMCR5QHLgVUOjrnwYzkwNoGX/83XjLdouqzY8K5MN
         OswUTvsJeXfQea/F161972WPZxYEZRfJm8mHqaa4YaA/C5v20uwa67bdt5E0Nhr2O+O/
         ULyyY9Spg/CTBqKpYmqIEI3G9/5AgyW/SVzXjDxsRRI+u4Tkqb5Mif0kBrfgO+15sN6j
         vV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774853536; x=1775458336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69P+91lyrDDQ/DKIeOYy+Twbri3cK6MdMeGzg9mFaNE=;
        b=emV+tRvS8cMoWbnkPS4Z2rBpysu6e4lRkHrhieq7gBFkjvJ8beIwfVbruAcLtkLqz7
         iBqKU07paJAnQn5YO1Zl9rszjd/ifcwiPKwmdt/Fq1U4GSYiVqiWw9A0x+ynTWZW+sQd
         Kz9/7d9e+c1LyjCaU154a0qnFNS0DkBVjvL7czivkvQEdugqUYYigTJPbaYn+HyDjd/T
         dDYTeDyHi6dOO58srdJ0ynf4W/SzOSOdX9ur47fnGzl2dtQVMNFbT0bVErxsMRNO+WQH
         T+BU9429lhumVZn8DuhX9tR06vSdr1EhL7+tXflsAm0DDM7kpL7FOgD1uebxDP3NJyv7
         Ya8A==
X-Forwarded-Encrypted: i=1; AJvYcCWk766ymfydHYzqURpky9EgCtjcCLpYTf10S1yE0nCJrXh6XL51IkaexlvRLAtWSuVTObvWJrieOj/m183b6OJ9EVn8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz24YtZLR4LIopOTf96XI8cnfC9r8dBBV/KtHlbC9e4kyDt2yST
	murXXWWS09NIV4hnjRc3BPGrHrF0281NQOj4c4hPwwd2GNQok7BYbPJq+W66oajUPHxLLguXpEk
	24uEnvY1jGesvjHiT6WihfPqQVibA+ZS1wSWD/Bj0dJGm9eRGZ11UXPkHdceqT28LFVktAJv72E
	8i
X-Gm-Gg: ATEYQzzQtYiXXEwQqstg4fXR/WIacZHKfq0Od1wg+gettuFegWTMkZPRbOOdsGyYEEQ
	iKip8nndU/6I1Pk4oxpQob0eUG8lCFBz8hao5g21GC00+gSE0hZI3WHYwn1OSgGhRMhR4EiLoM0
	CFXAQXmmNi/xQh3A8xINbfK0QEfaiqfsWPt10U/YUXgW3alwpOfFHz2awgoD4MhrLYU4wg6FrIO
	or/GKwtGRQLDRuDtral1Jd0MItoZX2zsflpIIG7nZnUjkDWDkDO0WzZunT+wh/Zf6rGEbOs1hMA
	oHhUpJQMW9HjfKKXul7U1nUOkCFQtNn82wbuFQVaHzQWYxKNqPKpJvJUSim87czOnv/sGPSlnoQ
	xICuzHEuho29Eo4jcoyYV6SR0GQqZ6vEAoIl6cgwkbMwMmsDdpkf9c8mKLVJWlH6gVBZOX+iruJ
	NKM5+Gzi0phmAeHGdbjlnQHWwxWhSmNlvPKw==
X-Received: by 2002:a05:6a20:e293:b0:39b:87f0:758e with SMTP id adf61e73a8af0-39c87779bf9mr11974509637.8.1774853536436;
        Sun, 29 Mar 2026 23:52:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:e293:b0:39b:87f0:758e with SMTP id adf61e73a8af0-39c87779bf9mr11974472637.8.1774853535822;
        Sun, 29 Mar 2026 23:52:15 -0700 (PDT)
Received: from [10.79.196.200] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916ba75esm5324404a12.6.2026.03.29.23.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 23:52:15 -0700 (PDT)
Message-ID: <dcc83729-295b-4fb2-beab-bbea1daec7a2@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:22:08 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Add driver for EC found on Qualcomm reference
 devices
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
 <45cad9a9-8bb3-4174-aa5b-7a7cb3b7603e@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <45cad9a9-8bb3-4174-aa5b-7a7cb3b7603e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA1MiBTYWx0ZWRfXz+HuZFo6K747
 HAX/bhfyvW3OvA/QdMUwHefp/a/xnkMNk48+AyWOThQSwPYXgYNsu4kj3ZPjE/Aiiqi6NkuQF6V
 POe2AxplSwvivsbEIvNZtZe4fVZtt02clc2x4K9esS2FVITBJ/TNMASnKCkhTBikZ42S52AmItl
 RqiRvCs4O/Wn6077fgacjQvQZP9sgIy68yxJwz0Fg9IuTYjuuqH7uaC1T/oddYTgGLJl4TjSG0z
 zna67b28alr6A2PXkXifhuneGIkwE+RT8GcPnid3+Bzg63t7XHeejI7QVHIuWYIpjc5PAAgAi++
 A7jMqhxgQ0bmb2xbWaw7axK1Abjm/P9lJQCWc62Ea/AnpRjd279mFfQ82elENb9Dwc9j7wPbep8
 nJxqmCfn+faTy+2rkicHYX6Yq4rwVOy18QyOPO7tT93NYxVwCO8/IdYJgzSi0zOsH0wYUyvvYme
 2wOklN3nF2ctHDP3KQg==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca1da1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yVnEH6U5_fyVt_M49LYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Bq6p0Ht7muTeD2U6J5Xd0P_eusv6mD_-
X-Proofpoint-ORIG-GUID: Bq6p0Ht7muTeD2U6J5Xd0P_eusv6mD_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300052



On 3/29/2026 7:52 PM, Akhil P Oommen wrote:
> On 3/27/2026 3:38 PM, Anvesh Jain P wrote:
>> From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>
>> Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
>> reference boards. It handles fan control, temperature sensors, access
>> to EC state changes and supports reporting suspend entry/exit to the EC.
> 
> Just a question, is it possible to force fan to run at full speed
> constantly? That would be helpful to keep the passive cooling minimal
> and get a more consistent results while doing performance profiling.
> 
> I see that you are registering a cooling device in this series. So I
> suppose we just need to update the cooling sysfs nodes.
> 
> -Akhil
>

Hi Akhil,

Yes, that is possible. The cooling device registered by this driver
exposes the standard thermal sysfs interface. You can force the fan
to full speed by writing the maximum cooling state directly:

  # Find the max state
  cat /sys/class/thermal/cooling_deviceX/max_state

  # Set to max state (force full speed)
  echo <max_state> > /sys/class/thermal/cooling_deviceX/cur_state

Where X is the index of the cooling device corresponding to the EC fan.

-- 
Best Regards,
Anvesh

