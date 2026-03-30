Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5743D2FE1
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879739; cv=pass; b=R39k1iqaUzEng1VK2dJQHlYuqKo7Zzo0j2bKmx5tBnHLb5PCRCZlNb3VCTsIcl4lOG+z3T8+X00oFGP2BLjrTIk0N3nxyZTZLWX22zvyc0hue8G7vd7Eovn/Izqa8fYBSwkJNWMzbktS01gfHGvVbUoUW758+QzhICkQ+eQEZME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879739; c=relaxed/simple;
	bh=6j3MrGMGJ8BaZT6b2AmYMG2GmSqY2yDP1O8mNQuJISA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdfYnM54YTBvKpD9SoFli0Ire0lziw7kn0ynNNDpnOl7UHNRiCJJ5Uop9w+7WorNELW7Ho5tuxKzGCWpr4AKRazQB+YAHvl74jQeH7hO0fWfeXjRTNTEs/bGJPTJMjEu/pR8glm9oH4epqEui4o9xGpZ77rp/C8n/ZLKgiJPJtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W36l8p+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G//hy1+T; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W36l8p+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G//hy1+T"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UCaDn7303197
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 14:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=hN8mTpKXqacUhxQzUN9IZmgWttyQCUtx5hu1tCLpHfw=; b=W3
	6l8p+J0XWsL9jQ6AhGFi66uWIavFG8Ct733Y9ZIgxwCNIquINDtZR/ePRxVUdCMX
	FPUZRppvkn4alPbqsV+3/p/98LYjht8A+mZ+BihLx9+HnXfGP7SItsoj+HpZU6ym
	J6U3OHGzEK/Oh1nEiuyTL5LRaoIvy+LP/2dpkq1ea6LD7q8Yk3ABGDEf2y/qr1eD
	0a40/LoTn1sbPLwF3tPodmJDn87TbXXubvgVwQyr1O/sRx1FaEDSzoe81BkwUAZw
	/D+ByFFTsFLZPvsr31nEGovf/ww6S1bc2S0wMVHPry4DcASkdYo/hPn9MZyRoWLM
	j2njOQnDP4ZScoDkp22g==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqeme7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 14:08:57 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-41c05356773so14506367fac.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 07:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774879736; cv=none;
        d=google.com; s=arc-20240605;
        b=RMbcoqas9Zws/zJSjBITXHVO2Y71JLfrc7ivAsPfQvCAzgA+vK9saNJGcxuEiINyD0
         qB1Bh9PcpokpECEqiph/UcDsx5gzhH8gv69/bk9/qqSm8oIeQV0hGfSTwzuqrWBQ0Ev6
         hVdp5+C7MdhIRhbKJnTcJfJ9mkrRWaWQM17fJvHmKWjtVerBRJQ2YmC6q3Z2jWAjZPFs
         HrTAYs8nmJwwWVsYdeNGqQ4dcCxlTCQKBK0ucY1laO3oXEi5UheCv1QllCrnzJxmxCxv
         VbRDvsJQ7iT3Mi8n0CrAU+PLFxUamnGeNaZop9KB2qVfnx17L8H2T+fRFlQD4eayfKzp
         JQOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=hN8mTpKXqacUhxQzUN9IZmgWttyQCUtx5hu1tCLpHfw=;
        fh=oqq4pHZLe4ENqJhB846pG210scoyMBrNF8tGZUQKc2o=;
        b=kPSc3qjODWSDZId+2V4TUlNlITtcVkO0DHLy6KPTzlXQFoXqCa+cWMsPE2R7CD+Dwy
         30ONsn0v8EKbWTRgDHj2FeTDuIJbODsjciuQNIYSOhiNoWMyq5piIfKlba657oHcAsHH
         McGElQo3ELhPRI+yeiO8gsRvc75CjkLgPtbyleJdf7IsoMf4JPiQjdNjqkKJUSwDr10U
         cRitG+pWNMZvxx/RKaceuvtTJDhC2tFN1KqRIyWKmQq9WgBtondiYyG0/ZqIAuKznqFu
         6vhzglZm9E39a1RZxJLQx56nWHb9/SB9LE7RNN2C9elkaV1Bl/bqLbF2cNTZmuV2eLPe
         1L4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774879736; x=1775484536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hN8mTpKXqacUhxQzUN9IZmgWttyQCUtx5hu1tCLpHfw=;
        b=G//hy1+TDdX2BhFYmTa8lQSWpzMCK9zRFz6w4UdBwk8VlrxsWWsf9A5ux+/FnEFW0K
         QzJA7UNNiUXdd8im3e8L5AZ4uN8P1iXrJ6z2uzK2Qi/DHSjxH6unvvXuIcd3rtQqzdit
         8Wos6UngNJPrywYx6bb2VTaw5MjRHxJM+sngzxXZP7xxZYolZUxJ8DkCmKzdRd902U0Y
         KWOGW6dJaaMGFXMfb7JN9PPJ1tilLxcyXVCIAX+uD/6WUUeRotYI5282MwE4Vv4DWA94
         VC1NF2E2eU81x1bCcoBfE0QxO4XS1auDJYdfzPAmaBxk3Wvbp2fahueYr6t61jCBYtRm
         gDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774879736; x=1775484536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hN8mTpKXqacUhxQzUN9IZmgWttyQCUtx5hu1tCLpHfw=;
        b=HUJXyu/bVrs2XjUbhVGO7Qy8KWFa5PJAMoV57HRlOkNzX2mgXhR+DmIBDd84kakdgt
         10ag/FFaxRfcw4PXojgnfTL8LJm8yaAsoc85xN3xKB40X6qY0RuuTndGfMlA/vJAdQak
         QXcWJoJOare8xrqWKUVMwDqSG/VMSO0Dbnra2C+E7CQUn10sK7qEKb9PVmRtts9J+xMi
         98y5SBHgTmopJNlP+UX9yZn90OkTwyNZ62/YTCGLxv8OiwHrh221SudnUu1DRmdQj2UY
         WjjOq+vgN1GSbIWHGSZIhFH+Ji2Yi9azxxjRDopdl2EXj5kslP6m2ksk0TTsnfO3w+uG
         oqNw==
X-Forwarded-Encrypted: i=1; AJvYcCVWdosHmFWs4rmp2l1PSI1f1oc8wt3etqIuStnY1U5cjfjcAq0BMRmA7p7JqdERjR+lyA5t0Ecmus2pS4I/FATGh+FY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9hrGdA7tUUvsxNMlQvAvuHODtHiLztwKaGy2I6PwH73+VnHob
	hLl9PuwTbaGAm6WbE7D+mbUeQcyI5zcBIaucqYkRivaeAJi1BlRU8qRYknO90Fxfwr3z5ulVxoj
	tHrA2nzgYl/kQmgzfK3a6xb+4Ivkd2TMUhB8haxTQY39cn6rSNs1e2TvJ926xCiU1e8fs2+9OAZ
	J9QNt1jMhcbgPIBqIqu894PrXOH7d/a2bhqcarTX3IE8nfSFA+Zfo=
X-Gm-Gg: ATEYQzx5oxwjpjM3SaUQLH4cQRbmZX8Ta9xm9dAwi2EBLGeMICEBO8AtzftKQ7VI8nz
	WZDfdhrZOhA4j0cyKtDIpJjTdQzpuO2bUFMB18J1g8YESaTXOuc8SOojd4U8xJLPidMZCB5lDyI
	MruO95xkpUbPnF3xazCtR0dvtEgKv9vWQ50Q5xlCIah8C0ni4SHa3+6XbMUU5nr5kklTanp9kj0
	e77ieDbwqVxoCdNRC8YA6UIl1mBAAINK8BncQ==
X-Received: by 2002:a05:6870:fb8a:b0:41c:6bae:2307 with SMTP id 586e51a60fabf-41cec63bf99mr6133523fac.12.1774879736405;
        Mon, 30 Mar 2026 07:08:56 -0700 (PDT)
X-Received: by 2002:a05:6870:fb8a:b0:41c:6bae:2307 with SMTP id
 586e51a60fabf-41cec63bf99mr6133506fac.12.1774879736029; Mon, 30 Mar 2026
 07:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
 <45cad9a9-8bb3-4174-aa5b-7a7cb3b7603e@oss.qualcomm.com> <dcc83729-295b-4fb2-beab-bbea1daec7a2@oss.qualcomm.com>
In-Reply-To: <dcc83729-295b-4fb2-beab-bbea1daec7a2@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 07:08:45 -0700
X-Gm-Features: AQROBzDL6ig_KbiMSXTrORH4oZORYqMryEAtXqw9Iz3-jK_CaA9S6hXZtTmgKsE
Message-ID: <CACSVV02B9FOqi8w1VfgZXtvUxqDmsSsHMVF21qAAZNxDFTDNfA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Add driver for EC found on Qualcomm reference devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca83f9 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=N9dVvvH9XMu6gbUqmvYA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: 5qEjtPlTwDDbjxma9im1OovKM7RonNIO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExMCBTYWx0ZWRfX080WosUTHCKQ
 j84gQBbzl86s7xgMa+XIqMujLpHXKSgpR3AH3vo9Z/hTkq/24A4kPRNrExVqSVUDphfooHYmdwF
 fLIs3nQQcEFgrWPRPY+/DeND+bWy10E1FzSN2hXtYzSUUwMXJQMB6WlrCixx+DTPdls5w6ATcCL
 UhKJO+9aWJV0vevIyJ6CsNSxjjRWNqQJ6WqQGjkVRl7pdamnmdEqaOVjRmRrfJAUfOqGiV+DIfV
 VVYZs/VyoXo5du6JgSjY/6YFfGUFBxwamZiyvwp/HZm4jMADdslEB7rtcFJNdDGuNbzb/dGPgOV
 yvlQnoVPvbLE3bEsYw5D40iIQ5VsULvdqwOgbEe9ycJfd/OaGVZr0VH0mkzpjt0ODTn9UtxpVQx
 n+57jXjgwpMfqwNjgisKA8NtXgMJQNCvid5xI2DNQYMKb6uvwAOIgJw+k7PXAGHf/pFQvFuKczZ
 kNC9evuZwHtD4Rq5JLg==
X-Proofpoint-ORIG-GUID: 5qEjtPlTwDDbjxma9im1OovKM7RonNIO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300110

On Sun, Mar 29, 2026 at 11:57=E2=80=AFPM Anvesh Jain P
<anvesh.p@oss.qualcomm.com> wrote:
>
>
>
> On 3/29/2026 7:52 PM, Akhil P Oommen wrote:
> > On 3/27/2026 3:38 PM, Anvesh Jain P wrote:
> >> From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> >>
> >> Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
> >> reference boards. It handles fan control, temperature sensors, access
> >> to EC state changes and supports reporting suspend entry/exit to the E=
C.
> >
> > Just a question, is it possible to force fan to run at full speed
> > constantly? That would be helpful to keep the passive cooling minimal
> > and get a more consistent results while doing performance profiling.
> >
> > I see that you are registering a cooling device in this series. So I
> > suppose we just need to update the cooling sysfs nodes.
> >
> > -Akhil
> >
>
> Hi Akhil,
>
> Yes, that is possible. The cooling device registered by this driver
> exposes the standard thermal sysfs interface. You can force the fan
> to full speed by writing the maximum cooling state directly:
>
>   # Find the max state
>   cat /sys/class/thermal/cooling_deviceX/max_state
>
>   # Set to max state (force full speed)
>   echo <max_state> > /sys/class/thermal/cooling_deviceX/cur_state
>
> Where X is the index of the cooling device corresponding to the EC fan.

Getting a bit off topic, but is there a good way to associated cooling
devices and thermal sensors to the GPU device?  I could see that being
useful for nvtop (which currently supports shows GPU load and memory
metrics, but thermal metrics are missing for us)

BR,
-R

> --
> Best Regards,
> Anvesh
>
>
