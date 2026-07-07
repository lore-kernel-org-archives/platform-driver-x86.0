Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C712EDD7D
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 08:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412413; cv=none; b=rQdCnG1UtdVHX+e0pf9hOuJuPr/pAzjtPoy6PFfj+NiR4ipV7KAO+2BjtTDd7V9dbS5ENLzZmm7mE/p7ngerYhpM+RaPonO2VpsXOv5wcxLbKjq/5nuQXDBZISq6l3e+WcM5H4DY1kG7XzcQg2uq7/6Hhp+hxqgnnA8zE+m0c+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412413; c=relaxed/simple;
	bh=n5OeMK1bQ8yHLqI/ZoKerpO3/6fLbnwqt2JRjj+RJ4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lsae1uC/GVb2W+kXMTMG/VkbcRT1/wJGa6Kq5fEUSfVqm+GLv/gINiIiPuDpb1j5M/jmHkskrR/x/TeW7sTWZEbhedP4eBLcjwChT/YyGTgyJi+KNUISkiYVZF6TdtQ4YYNsmdWDiliFn8yPDuMbps6Mn5WSDUq2FqTuHxKSm5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwR7a2IU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWupFSWi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwR7a2IU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWupFSWi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dw743070339
	for <platform-driver-x86@vger.kernel.org>; Tue, 7 Jul 2026 08:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajiWotAS1acnmFOssC6CEZcKuC/BL6UhgNsm6/8ZsA8=; b=OwR7a2IU4grZsFRg
	tJ10AyJ767+wHooZigQqyP7lwpzdi3QdLvIFSI4IvL3agnXL0xvBSDDMx7nbEbDe
	w046s+2s6XOJwzSDHgfaVnQDNoc/rmfbOQDjlje9RH1Ypz8ZJ5fSr4cEIzKCUtLP
	bEJiKt9Ysv42GJY9bXE/vKCxsfnAFfLK7UvWZ5Zjx20ZA1cmi6kdWRvE0MWwUQAo
	GlZaKUAFocOyJw1gCeyHUG9jpPzXc4tBApLe4hOpkB9ujldJD3nEAy30/fcub8k7
	x9Mc2WAvq+QuwW0j+jldxp+LNsSrO2+wBXd1+2MEmrkf5boAOistFdWg93RmPguL
	b9R5ig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8h0c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 08:20:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf321d786so48415491cf.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 01:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783412410; x=1784017210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajiWotAS1acnmFOssC6CEZcKuC/BL6UhgNsm6/8ZsA8=;
        b=DWupFSWi5kAwf/750V4ez4Qfn0FKacmv4GMhLlti/dNYGGJ4rQn3DqEKAnsTllxWej
         6d7bHVcMnO/ID4KhVnPxVQj1ZX6GcJ0TazJ6LyckjjdR3dIB1xyRDplpWMjgJLtkpZeh
         aL0fpszGEu067/XUDR4Ab0s0TonsfoBwObG0zGTT/esKHYg56uN5Sgoh3/mzmpesaunU
         8vOf7hoirmnmKxnDVNDM+JVCvsVauVegMcFkeeqxXAprzzH027zCnd/4ALvdsZqV/TYs
         kQgs6YP2yTrOu0ulwhRPE1F0xzo76gEz6CTgAiNTzsgD/rhoQu6cLkd7aoRrjC4fLDg0
         A8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783412410; x=1784017210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajiWotAS1acnmFOssC6CEZcKuC/BL6UhgNsm6/8ZsA8=;
        b=hzn1xtR1+EWh5Uj5U8TU5D6NoTg+Ea11+AutitynQc6hrjJGAwrMLCt2N9ZYpPAJwR
         fYjXfGUQn80FZG2ilTNKCXatSmx/f8d0ZKiajfVqQIM8hgej/uD+C2KaafBBzdSYuirq
         M9k66WeMa6F6pOGmwZkOtHS2A4qqgNHfreZYeP3Fh6acANE3pKtr1wFHuykDl/BC+JHk
         trYTz4HsHPG9adGRgK7aUxjunWf91bCmeNxrqGI4d62OP+CQ60mnhTBrTSwnJpHbophe
         ZIcpHefKeNb85XrIjq/FCyVxiHaphptTfRJZby1KGPbwwXOT7SuqiNV3YO87o8vYpDod
         e+nQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/iiC6V9DBpEjOVcCkd/sgA//yFvdGHrKRCTtM2QrMd3SSW0Faf5doGag/+PMN+xun7YUjjClOX7wA32OEq+OkvFxT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2r7KZVSGibTpaZ0AQki8erHOa733dWXowXVlCAmsCqrCfqL3T
	gR7PhG1Zt8N2PcSKBY/G9ymocxqbPbrDfLqkDDgirWnUQHvsfsM++satPwoO09t2kQsE+3nIB0x
	Kfu8e6mg8FevLhCzJfjiwi+M0FRkItsml83OkiJFzeIc1hcCu3db5HzBqhkK0I1kxTZF1ZFQS0x
	fE
X-Gm-Gg: AfdE7ck9dN9q0FPzR/+CqGiEkOgZ5Jz8SOaXWvoNxstiXiWbSzkd5O/Jc20S04QArcg
	KXiRqCsPgLux06JWKOgFGepMkR3ijDECF0COhh3e0QZ6kZdtQpNufS5TFX38Crcpj6p2oVa1/f2
	omTIYXejVsVRckEYPzP/8Grz7kWGkANh7Heq3p7Cnng0XNTf+UtacnY3NayMqTulAH/1Z+NNAM0
	P6jX9fzgQCG8xzXPUxRSy3i67k9UyOxHVv3mwIuKFP6gppIVao1HgBMtjIaQhYYAEtF4yg+OqH0
	NTHIXJR+As2krK1NSm++F24Gi0u+2O+rhLz507fAaFtg1P3KHHgKYyDFUl1r1I0tfCFFOlBSnkL
	GyIY9w2Nbkwhou44IA9zIcPyj/LRxe9jThitDd4zSj9k4mJeSqzvtqd/k1LR25tz5yIM+58nxIg
	==
X-Received: by 2002:ac8:7d0c:0:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-51c7487df08mr45476181cf.48.1783412409856;
        Tue, 07 Jul 2026 01:20:09 -0700 (PDT)
X-Received: by 2002:ac8:7d0c:0:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-51c7487df08mr45475921cf.48.1783412409444;
        Tue, 07 Jul 2026 01:20:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f32660sm37747195e9.2.2026.07.07.01.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:20:08 -0700 (PDT)
Message-ID: <38f5a2ec-ddc5-48d8-b76b-c2ed617392ca@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:20:07 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad T14s thermal sensor provider support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
 <20260707-armored-azure-terrier-4dc3d3@quoll>
 <8d579153-efa5-4c8e-acae-87f3bdfbfc24@oss.qualcomm.com>
 <457242e3-6a40-49a2-8d86-214f9167a928@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <457242e3-6a40-49a2-8d86-214f9167a928@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3OCBTYWx0ZWRfX08P9waEkgQHI
 9MJGI7xpakdcxszbHJCeaJ+nslKv3RD2NIn1u+Akis1Jof8kAcKqNzg1byeMSY2uSFZaGx2T/5w
 tWkksNw2eCqbXUXJodnPxp2Q3XP52/G8Q479pKeJo8KLvyjB8xB99jW2l5s31N1Hta2NpbINS3P
 u4AL2i7kmg5UPwXb4OkySl8/apsyeqrcgdTLR1cxuB9PPudhW/17Q67nKnbZSnrnsHsGHzRoEXE
 bWNB8I7fN/p3bWlcpVKmOgu583i5NkePbvBHuovuXe5ZlyDrrPfZBrzIxjHXl+U6rtHiQmoMHFL
 /zBMLo/mC5YYrvDpBdoNx7+iWhuXeSZOsZjYk9yWSF8q+P3cL4sFzXGJWUOylQ6SOJCYNJ7u5Fw
 ICMgBYtWWpgn2+nWmNRT1lt+N3U0scAbCIyv4lqtQ9icWBNLilFlnSAuLf1+u231h2TuehxfFuR
 cSP0naGqgg1W+68KLrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3OCBTYWx0ZWRfXzvUauUWC+CW8
 P5i6q0Fwt5qnIraouRl+NAVXw+tLNewUFDDmfUbCtRiccYy7TUJ3Sj0t2xyvt3ULY5Wjk9KFZc1
 Npp3rC8g+rsiyaHZOfYA/quSgoeFspA=
X-Proofpoint-GUID: YkJVKrBdaSPIiaFA70zOSYXRhHjToY_t
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cb6bb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=qYa7bHtEPbO8xArO7mAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: YkJVKrBdaSPIiaFA70zOSYXRhHjToY_t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070078

On 7/7/26 10:09, Krzysztof Kozlowski wrote:
> On 07/07/2026 10:08, Daniel Lezcano wrote:
>> On 7/7/26 08:38, Krzysztof Kozlowski wrote:
>>> On Mon, Jul 06, 2026 at 08:46:46PM +0200, Daniel Lezcano wrote:
>>>> Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
>>>> sensor provider by adding the '#thermal-sensor-cells' property.
>>>>
>>>> This allows the EC temperature sensors to be referenced from thermal
>>>> zones in the device tree.
>>>>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>>>> ---
>>>>    .../embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>>>> index c87ccb5b3086..0d049979e35b 100644
>>>> --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>>>> +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>>>> @@ -26,10 +26,14 @@ properties:
>>>>    
>>>>      wakeup-source: true
>>>>    
>>>> +  "#thermal-sensor-cells":
>>>> +    const: 1
>>>> +
>>>>    required:
>>>>      - compatible
>>>>      - reg
>>>>      - interrupts
>>>> +  - "#thermal-sensor-cells"
>>>
>>> This looks like ABI break without explanation.
>>
>> What would you suggest ? explanation or removed from required properties?
> 
> I don't know what is the explanation. If this is actual ABI break as I
> read Linux code, what is the rationale behind breaking real users?

IIUC, if the DT has not #thermal-sensor-cells, but the code has the 
patch 2/3 then the hwmon fails to initialize as well as the EC 
controller, right ?
