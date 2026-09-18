Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497DB4A64CE
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 12:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733925; cv=none; b=oQgInEV0QnfRqSnz5xCo6pYJ6bNvpOUxRchfxpT2cws7dmfIhIwiSKHq0xDCJ7Y2smUP0cMxkHo/cowg6kdr0K5yv44ZxAuiagaLXt0WmB1cbgRGmlPnd2zbBW5xOV8Q6JzD6crhn7JfKk4TefSwgd2/tF7RNq8r8sm4oHB5CQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733925; c=relaxed/simple;
	bh=wapxrbOKn0aJ+lRvm1E7CjXQYuLnjYoitWtQ+7teQlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EpzBQGUONqWpnGu5Qfccw8TbYKvavuBXUNdwtnixEja6q0Dt6FGmCaaGfgtK15JX26i98AYGg0+l5fNBlQ2HkmJnH53GVel7JoYZvxkYMANpKYi1HfuUZ7uJgxJ4QBLwgOInmPoCVKcOCRt7UaS93QgFNQSpMzZqzf8zJVTUYkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIVnV7Fk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vws3Jglk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIVnV7Fk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vws3Jglk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dafH385306
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 12:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=; b=hIVnV7Fk2rOPC2+Q
	7XI/n3bpaC6WD9gitchTLUpGTFRPt10Dli4VF/T0zBviQTzRbBnkvlF3j5IZyWc+
	9JMIKkUgFMs3ablTZTGJkI4/Tl38m8GphLLeo+odRedmdfQXJrAWTW8DJapPwUt4
	PZVxGNcLy3mjz457GCKGksfFmwAraseJ4Wye9K9hBh9au1aCPhxF+O+N138QcQwO
	PgQDBsKjYMyG6XIKtu6Ds1ukxX8ODQdbFpoOgxmduyCcKY45hXC669xnhrlEs7AD
	Xe6yESzibXRIRrZXHjjUST69VReCrCfnthb5rb0kqdB26mRh3iYs9EeEccTDrcPv
	QuEGfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrsuhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 12:18:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso14359485a.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 05:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789733923; x=1790338723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=;
        b=Vws3JglksQmrQZeAJaGhoHlrnp7TAhe6Eg8ZOeaQwcofHKax5Z68ykFxYCI6nNuqxr
         leUnDssxXzvzFWPBUJpC2cn3ONwe6dFtdhio8ha/Nt4qyaESYhM2/G+icYiJa4tAh2a8
         7biVv9/f4AcJoCRxraPKcKl2ltqC+WlXs7mviGVbIJ7LJQ3gpbfOkMnn+fFjGKuXGo7H
         ta0zVUai2Pv3BUeh9m/3kawPiQMRHoJv67vtjPAUBxIq89D6h3kmJzKHCgg6IrWfrHTo
         CvoZfB+Bba1a0gUozXiH2XaU8vwM4HuvAeNh/ly02AvVcRp2eCGRIzO/ESXLKj2rQhae
         SMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733923; x=1790338723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=;
        b=odqrvj//0oq+gW5duX9UDz2PZYRpy0PYjqqRqBxPnwp7IYX9+iATURrSkbRRp01sEb
         VdZjgJb43tZmlwHLT6JN0Eo6+stXSeVX1pRnoCV+2iCFsSvBTNKtRE89vKXQk1e56+qS
         qcnmeQqOTTRFnO7A+woHTNUmuysPVKlaKTVBPh39cFaVyN8djfbSOBh18uz4XYhn7+5p
         SMqSwFPOcaacX877mysyFwj1VvA93Lv63tMeFLxGykUibHmbro0yf7VxW4eUIuTwnqdr
         1eysdfBBRctkhCFPzzyR77uLhX3LoHLLBWm3FOgsAJE+USC8cdUgKL9tuOOCoiE1SObJ
         YVtw==
X-Forwarded-Encrypted: i=1; AKwUvBz/RVlD5hwmPNsEM7D6K439LtuCovcbfgdlDX+o7uxQZbeQriA5EATkKjgism/y8SxJi+bvkSIQc6pT7bueB/W/uguz@vger.kernel.org
X-Gm-Message-State: AFuF++nm8vBPyezOGvfe/uHi/EMCHYlekbPC62SYRB73wF93DWZ76tJi
	gG5eoyN2lv+54DT5IEEZZyEeGPMXLLWf3XZtEQBY8qQA3Avvaj7i4QIC8jTdKlcp0c0siR/tO6k
	8ME7caNvII7FwDlIDK7ZueLajMOpFRWOWpvfHq0LH4xL+xvChuIyiFxYCjYk/50SD2/ND+DA1Wy
	1w
X-Gm-Gg: AYBFou1ApK4z1JU2A5oQjr7JiuHHTC681LlBm22Y0J+qoIdagyu7b7ZKj5ytpZ2+xaw
	AuiC8iIX5+hp9rtXaOn1Nx7RwedeRp0398KD/QEEemaeAQJeKGTJ7YU/sbRa4A9vHXNcxAzvM54
	wtqImjw3tacu1cR1Ka/c5IW7Aq+pwudr05XFtd7v9Fi8DbiN/21v9+jbGn4YAY3gPPISmILkVKc
	ujh9hvb+24U6P3MjMBEKUiXX6zYf4lWO5WKtcXRXtnRviqsMm1DTpQb17ruxj642M+l7ZFADoVr
	S1cJ5B4ia1rFshQrN5zm+Ius9yWvGbzzkOzjHgrP4iHST8tY6isCIxzWuz9y+tjiDEa325Zod+5
	GhDgC2PjRLwXQM0/N8HzqRg==
X-Received: by 2002:a05:620a:438b:b0:92e:6485:f640 with SMTP id af79cd13be357-93be06c07d9mr240484585a.4.1789733922802;
        Fri, 18 Sep 2026 05:18:42 -0700 (PDT)
X-Received: by 2002:a05:620a:438b:b0:92e:6485:f640 with SMTP id af79cd13be357-93be06c07d9mr240476185a.4.1789733922045;
        Fri, 18 Sep 2026 05:18:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa5979cea5sm785612a12.31.2026.09.18.05.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 05:18:41 -0700 (PDT)
Message-ID: <002eb70b-17fe-496d-870f-ac15c62fe32e@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 14:18:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform: arm64: Add a driver for the EC found on
 ASUS Glymur machines
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-2-373516d347ae@oss.qualcomm.com>
 <20260918-calm-gainful-turkey-8ba016@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-calm-gainful-turkey-8ba016@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad2c23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=BxavHUX6cQikRYdMHAsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3MiBTYWx0ZWRfX/xgJwkULq5FJ
 X7XbIPnCqhDcxI6mDigwjuK6p5u65GF2XAKjbx1lKBquy2sjMUUDj2Kqx0kf8Ub2Q6Sqqna8cpU
 ppyjq/12EJ4b3pGpqrb5O9t/kT9TYVnydM27iNGTaMv29T9QvSJnDC4pAZ84U2+MrAjxFPPw91P
 B9TsQ6rWn61pwkwQix6oYzSWfZA2P6q9Et27LwoKmvStX4+y8n4VyrfvebyJkw+BY8SAEJ9Qxk2
 QH35onT5sISotd7mzkvHbSSQM59FmZq5AUsXRdZNh6ENwhLfFNUnlsC1EnuhflUYMdnea8xtm6L
 96hlXQbjPkwXcX25Et8DUWB/MyRxkmUC3FiBPrKQor7IC5PBJJTPqlIt8sR/h4e4jSAHTD93+y4
 B6Zrlu2tHs9fnGE/fWABSAC/9VpPYxtx5xL8rg67HuZ5XEoaUC0QXxzmoek8ZagFbeMYynWW0u+
 /AjwITEOGRgQcmS6vfA==
X-Proofpoint-GUID: X8rFAVUaNrqH2izQ6XcDX0KO7ywL26Eo
X-Proofpoint-ORIG-GUID: X8rFAVUaNrqH2izQ6XcDX0KO7ywL26Eo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3MiBTYWx0ZWRfX6B+WRxuH587+
 lzXSfwxMQw4uyPQyBB2EN7moxZuerfHICctFdY12prYpT3mbSdKnxaoRsElNuxU2Nsq/a/VEV1V
 gIF8yUIgI+z7CgPIvyzpzpYke69lpV8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180172

On 9/18/26 1:35 PM, Krzysztof Kozlowski wrote:
> On Thu, Sep 17, 2026 at 12:54:57PM +0200, Konrad Dybcio wrote:
>> +static int asus_glymur_ec_resume(struct device *dev)
>> +{
>> +	return asus_glymur_ec_modern_standby(dev_get_drvdata(dev),
>> +					     ASUS_QCOM_EC_MODERN_STANDBY_EXIT);
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(asus_glymur_ec_pm_ops,
>> +				asus_glymur_ec_suspend,
>> +				asus_glymur_ec_resume);
>> +
>> +static const struct of_device_id asus_glymur_ec_of_match[] = {
>> +	{ .compatible = "asus,zenbook-a14-ux3407na-ec" },
>> +	{ .compatible = "asus,zenbook-a16-ux3607oa-ec" },
> 
> Does this mean devices are compatible? If so should be expressed in the
> bindings. If not, should be expressed in bindings commit msg, see
> writing bindings docs.

They generally seem to be, but because of the very limited information
we have, I don't think it's worth risking associating them.. Would
a mention of this be enough?

Konrad
