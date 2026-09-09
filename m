Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EA53033DF
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 04:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929909; cv=none; b=p3/J+5kFJSaE3zYdAaF17voFYAPg8jcinpEqiW84NKr90dJtLoN4fZz3QvRq4jbcoVHQ+flrCSfGLt0kS71NG2uFWhviDbk58y2bRXQgBkXm6tc9FyiabmfK15RZ0cTwpewQhLzZU+WwqRz+pzJkxX1rz0kPJ8g4NRr7nlwiwRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929909; c=relaxed/simple;
	bh=5lrHC0k2zcfllWc2Fvzf1mTjEPO+aONQ1+R2c0DuGn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXLckWn7OhmC7MnvEFw2xN3sa17YQBfMMzjOXrG0jco9kTBob0nWrLP7hfjXB5XSPOSWyN0b2uIEE9oo0n2w9ayKGQKgk4aSoGARZeYBqSU22X3XqnN3yh/jCruCFV5pIjKJS/yBfeqokau3ydNrAw2eaG8P3S9n4hyP67QpE4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzR4Fa4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SB1kfPL1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzR4Fa4t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SB1kfPL1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgAxk129691
	for <platform-driver-x86@vger.kernel.org>; Wed, 9 Sep 2026 04:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LUlpyw9W+HelyIeeXNtDQKDxjhNyFJhI6vx7P1VkvH4=; b=MzR4Fa4tvrEypJdp
	5oeZIRoUMBphKCPDdOMZC4FblmXs+klvJnyllfroRzgHObNTr7t74xwm9cdbq+lD
	DXCosvY58OTUnVVMhEKi/QEsdLYOTe56LwHZLTX7jrw7n8233tr+hfUQ6KxMmzf3
	HDuWJJrBPsLJ8VUJUfYQTzxBic78Tk7q7oaOP9BVnrUOIQgY2rSdud3r9WRsN1yZ
	PiYLiFS5WbFQEB4m571+IUK123v1BmcadMcmW3Qc4ZhVPMvvYzr/Tfkn9GgqIaCq
	em7yPjxkCxTrZ3xH5vK84qtNGuQKIlDzlMqILsEV8Mhs4H+wRLk9n12KLN2NuwPP
	7Z4jSQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpjqks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 04:58:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc487bd6bfbso2678250a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 21:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788929906; x=1789534706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LUlpyw9W+HelyIeeXNtDQKDxjhNyFJhI6vx7P1VkvH4=;
        b=SB1kfPL1j4nwK7UtVR3mln//J540/PONUqJTDvjxc1n4Sd++JuC9BSSI7lLFiiEDWU
         EzU7Yuuy3+OdfSMXtv1SRWGqZDUbAFXHOq+aCEJireBFMdtntA86PLnZQWusDFMoY8r+
         U8nCVfEQRNvy7xELSM1SesthlXD16JsY4a3taD6m3QTgTrWagSgt+1YwD9NIDgla6+gl
         z6iOkucMHAqfZwTDyz46inXT6oikD7WyrGDgwZl+NxSKMxoWpydzgnfLwGSeOWvjz68U
         ropDcvhIjomL7MzR9S0CNKgPzkl5tjKXl5u+sHPlAIyjZinbjcvcsCrJmPunAlK92JqN
         eKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929906; x=1789534706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LUlpyw9W+HelyIeeXNtDQKDxjhNyFJhI6vx7P1VkvH4=;
        b=pNUhp4hjXIKefPh6XDD1gwDU8p9V+0uVY27AOE0EtkuGN8Ks1AM943LW3eearC/d9c
         WqP1CgAYmkzxeCw/qR1pXgckJr73MaxUYZDtBoZl7Bk0yqsrbZiuSQz9C3EJ5EWr42kg
         ocYb/EHw9e8HnbwmWzjSIO+JHQkfhW9HY8c6lFumttpbhyCuLOf2rAoJABqftzkezOYs
         yKUniEWQ7cGuksXcqdKR5fTsn8fxKhCLTFyVdnJMnb4uF5e5Mlh1Fv+4Kxd/TQg/Mt0o
         X8CbmdURBUXUxYW19YdOQGAP1qEy54XXXVOIYMqzzfu3QKI1Ajq0D//E9jmCo0WD+lls
         gG5Q==
X-Forwarded-Encrypted: i=1; AKwUvBz40Fh8KGEpEu2o0SNSQQffr6e18URRUGNrKuZtjwqY/FrSQZz33KQNeNXQVU2kyuoZhbYDgFET/3g84lVGMBeFix4C@vger.kernel.org
X-Gm-Message-State: AFuF++lhQofWrIU0KhJ8mDnJziXDr8umni8pznOYF89cqJyiEzpjzLas
	m6dI0QUb5geCCaoTbv/F1oitlppTYXhLR+qqAGAkUnZQ/Nt4lyG7rANbVyJEWBwD6BlEkiu8o7L
	/jdSLZiJRMMBQywsBbumBDlxhmFYJeoS21MilBt+4jFIBEenGszyCIk9O5VjmVr41a5c+ADq7Ea
	YL
X-Gm-Gg: AYBFou0tMwFcwQ+7C/rcVV7dQNhAmgbMNueFDbJqEKMIFSFVCPihzQhuDl6Cs30/HR1
	9a2fyQF/DkZ5Re0WtmMJCqMI9c1T9hyxca0zndlOhHP6dwHWSzTXjJsxD+0v2h4rDk3J0KGAYfG
	Tpu/xc362kmiQcaVcrKtn3BZHiktaL3Dmg1sYkdv6c7ppm7712Kg0yBr392FvPt34mdjZ4fH4ep
	xMChgI48Zda/oc+wmcjHqYRFJC7jbZcTjkBloWcOkCUqeynkY197INQ/cfbrdcW1mpvmZOmXDwh
	U521ZhpxWgf7vLJjhdpxMwMpVJpOtQz8ZHUdwyZmxi02BSD8ggSQb6o5HNS1dZeQdjEa3wlxXQZ
	hRZtIUx5u7OYZ/QvFym7vtha8BEDmCjEHiPEzupOg3DMpstEifCSaHQiAPOIk8fHsj6BJH70Zk+
	Rwxg96cc5ZVM6j
X-Received: by 2002:a05:6a20:a108:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3da39ff4c0amr44295612637.13.1788929905773;
        Tue, 08 Sep 2026 21:58:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:a108:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3da39ff4c0amr44295553637.13.1788929905334;
        Tue, 08 Sep 2026 21:58:25 -0700 (PDT)
Received: from [10.79.117.175] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm33551065eec.23.2026.09.08.21.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 21:58:24 -0700 (PDT)
Message-ID: <695a5c15-9028-4b7e-8e37-b2e08ad1fb93@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 10:28:18 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] platform: arm64: qcom-hamoa-ec: monitor Slim
 7x legacy sensors
To: Birk Skyum <birk.skyum@pm.me>
Cc: sashiko-bot@kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Daniel J Blueman <daniel@quora.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908135801.81436-1-birk.skyum@pm.me>
 <20260908135801.81436-2-birk.skyum@pm.me>
 <20260908140849.229ED1F00A3A@smtp.kernel.org>
 <20260908143650.30134-1-birk.skyum@pm.me>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260908143650.30134-1-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA1NCBTYWx0ZWRfX3N15BmvYZ/CM
 o2oA4EqyA+Wlr1XBj6LSkz6nxNBfetwYgGaqmHEjBQuEr1UU4wCSVyG26DIWVHHVMH1rvyXNXaA
 rB5pi5udJbM9hgec6W8gM7PL5gmj/nHCZ0JDK+BFZN7vpzKquwfTnbD14tOHvXLoBKhKbkBZj0N
 1cP/qBxR/VNo1VNiV5KS59DsmSVrEEClFQLjjIBkhSaMX79G1+h3LUnTJ6vIdu15SSXZiuCgSY9
 TRWFmu6vNXM5bNPO/nlwK3ji8f1C1QKfAalP3XI55L74RiFsYZndl5paQT1hxsG9av/xOH+0ral
 adLXM7WP70iLp6q0zYFAejYCaVlh4OtC3ZCtWMGEEsFSGytDFl/EN19HLGb5CZRjRlp4XA7DIKN
 Y/m9QXXINdHQjOksnW6mfjNmkdUINxqtuZpkbo16K5tQJWVVWNdYgwq4YzbIp7vASC24ijEl6Hv
 Bs88idS6YSiofkXFanw==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa0e772 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=IA0wh2spAAAA:8 a=2NzAWjCmuF5XDdBpOFkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: AEZWYnHtN5anFtAbP5kWRi7_zUybiWC3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA1NCBTYWx0ZWRfXzZ0nsZyYxqOo
 UHsoKYkDbztTPPwt9ghr6ULKBKx4hly/kpNSjhBuDyoCAOVNNWlTyfK2ql+jyTxjguhpVI4JwUG
 BNTXWHEz/M33rXjqvHqdkPdNGyD2vwk=
X-Proofpoint-GUID: AEZWYnHtN5anFtAbP5kWRi7_zUybiWC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090054



On 9/8/2026 8:06 PM, Birk Skyum wrote:
> Hi Anvesh,
> 
> Sashiko flagged the pre-existing SCI cleanup gap on the reference-board
> probe path. I reproduced it in KUnit with simulated I2C and IRQ devices:
> when the thermal-capability read fails, SCI remains enabled after the
> driver core releases the interrupt.
> 
> I noticed you already proposed the devm_add_action_or_reset() conversion
> and agreed to split it out after Konrad's review:
> https://lkml.iu.edu/hypermail/linux/kernel/2607.3/10628.html
> 
> With that conversion applied locally, the failure-path and removal tests
> pass. Is there a standalone version available to test? Happy to share the
> reproducer if useful. I'll keep this separate from the Yoga sensor RFC.
> 
> For the other v2 findings, I've queued the named I2C initializers for the
> next revision. Guenter left the driver split to me, and v2 already moved
> the documentation out of Documentation/hwmon as requested.
> 
> Thanks,
> Birk

Hi Birk,

Yes, we already have that fix, SCI disable is now registered as a devm
action right after it's enabled in probe, so it unwinds on any probe
failure, not just on remove(). Same for the i2c_device_id
named-initializer thing bot flagged.

I'm working on v2 right now. Once I get consensus on all the review
comments, I'll post it with these fixes included very soon, once it's
out so you can test against your reproducer.

-- 
Best Regards,
Anvesh

