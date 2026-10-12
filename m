Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C34AEBF7
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824047; cv=none; b=J4VA7Sr35maPU8c5BKg5slOJFjAA7P8sqEdHJMMSZTaLVwq2cST4/XRMpqFPu+ScFxq+aHbdy6lq6pOK0C4j0y+kaBooaLZz4rkv0A2Urf7wVDHPCV9x7pjc4uQ9dPB1IwnKej/CI/wb0fZANTwVfWZPpTN3jLcp16Fd0RHVLtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824047; c=relaxed/simple;
	bh=MBZlHXmk37tR5BT3xXEOjrgo/bHRwWaQK1AS7dscABU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFFfgsDIUC+uoD05RcB5tSY/5w9ipF5+vNBMS8qQHBV5QaFSu6EPY8BdpkjseqxS4K+VocrCO+Nc3XMsctLV6CPdEKXlE15JcxWdapUg5o3eXDQWdtqe8sbNxEqe9KkJ9MmM5h6RzkeOx0o1qNGSTNRligX4TPolqiJ2Vb4ZdFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIvCpBSh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gmmo2BdC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIvCpBSh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gmmo2BdC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFf88A2420197
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 16:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AckRZKhrIfVKIkA99O7IMf96v0rYfiQrck1GyiIbas=; b=pIvCpBShCD+MhrCT
	LahX8GWl+Ogwdu1PhX9brdO3bWoKRbm/QmqwZXv5l3cw50rOzeAeMLrI82hQfGyF
	cadnwuI/whfPfe/6TM964zA30QZmxhxUW3d6NM1wArAfjy0WTvMkQq6ikz0HG4Ke
	tBPPX0+DfAox7nArJ6adgWlbuDsLrebMnk4Y4GQNe2B+7Ks5YgrHjeYsY/WCqRUz
	k32/08I1lxvfU0hpLXncrNLkmaxgpwj0owUbnr+fZO29VGwzu7daVQ04dsSUo4ft
	7XlOAIxtl4yEvqBzepnRDTFGYKSbCRWEXvWnCOTyq+BS81vTYHNyubTF5vgI2zYy
	zETIoA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkkb43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 16:54:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a04491c56so1305322eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 09:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791824044; x=1792428844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4AckRZKhrIfVKIkA99O7IMf96v0rYfiQrck1GyiIbas=;
        b=Gmmo2BdCmRmnnYsuc6am/vc31O/IHGa9Z5aWy8ShZYdZGO25uMRgppxzwFK+xgQ/Uv
         wJEpTmJ5uYLDzy6qRyJxiabyP2iojWGN0j46JFs9A/u0GIEGc9YGkgPKhQdt8EHiICvV
         Uj/oDMIRk3paUcioEzwm5FF2SGgxXCODTRa2cL2P/ZoTsPZBPk9DzkFirgKZkVohMiZV
         KbR2rEvCPnueDckkRfVGYOcU2EgE2pisWjqGc1QXXbqj+60BlvUX9Hay3SnpDOeDDP7e
         fWNDt7AjXn6MEVB6etyosQ24SXQMFML6sjmQ99PxaYUY+o1WN0+Bzs2aL6i7murTg18l
         PSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824044; x=1792428844;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AckRZKhrIfVKIkA99O7IMf96v0rYfiQrck1GyiIbas=;
        b=Pc8hXne2lkJT3TFaztENgHYGbtKqvWlAq1Ou94laGm2RhnZkut7NdZPwEIShilPJKe
         NZDVvsJpEuOPytB6eqZVm7hsa5vO0382odvuigreO2+XaH0F392sILZIC7SmFv/+fCJt
         uLZTrvDLN9vPcYPLnrOtHZTca1g3E5wKy6kEQ6+zM7KETy1F/i0zAqnehpTyAHIGcssG
         qAY+b0CM5Gzzpvync1NrVXqcD9PSP2KPdKW1vpBLJc4onKY9reNDAAVwMeHY1ZCIvkAZ
         se8yDXbrZxEdcl4SAqgjBAGcXdizogXSn7haexNG/dxWqi1Fnh9bJd/9L2pdzIM2iCiQ
         ORcw==
X-Forwarded-Encrypted: i=1; AKwUvBxl2/Myhv06jMzcnVwZOb6C3Zv8Wwpib1KJTOiX0TBTMQSGEf7Yfo3Wg/y7u2rHwLY4z0++mfYWymhgG9pNHw7Ds89b@vger.kernel.org
X-Gm-Message-State: AFq9FYLDNAbwa7eHCSajSXeiBWhZXI/Hr1QmfqKv0rKoo6JZ88UOBtt0
	Ay55aBXmpPgGAoKiwI7qvCJaU4OYch7Q+/NHGeMZVDp0+UbJo9MimBKAmacdqgw4p9O9OHqA7R1
	Fccd23rP3bQcr4A/7nTUF7vZL1LntZAIFpNOkGB+knapUcm6Jvl0XpCP8u0pdsRsKagWUe/CHld
	Xr
X-Gm-Gg: AYBFou0EE83Hvz+2utnI74q577sIhGzOA0aHu8Hs+pq5Vuk7JWLWLhleLtWwtEgJZUc
	UK7a58COMTRwEjc5TkJ7sH2Yz1DlztK9jWrkbDYP0Z7w98LsiqfBA2g2bt1oXilY7qA+TmFPeEo
	TwFt/fOuWyGBAFM0pr8oxlCtXVwxhz2sGbUwUVFEjd+21zg55k54nmLcCzJky+GABmqGuFaSC9n
	al4Q5iwmKwY/+XQ2rvfjtn050HlWXWKTpUnjc+Nu7PxhXnOibFbdl3Q2Z4djcP+jszyd/dJG4uH
	0ejdixJaL7n0JKmWn1KubOl1Y1cIqhbU0jlRcq2ISP/PSupwU/Wzd8k+C8HwM+nKTE4SN3I9LTw
	fnjuAt3tANqfhxZtY9RNYKNViVQJPz56JuWVDidjA2xd1EMEjqnzBtHwKZg==
X-Received: by 2002:a05:693c:839a:20b0:35a:e354:643f with SMTP id 5a478bee46e88-35ae35465e1mr4121667eec.4.1791824043491;
        Mon, 12 Oct 2026 09:54:03 -0700 (PDT)
X-Received: by 2002:a05:693c:839a:20b0:35a:e354:643f with SMTP id 5a478bee46e88-35ae35465e1mr4121519eec.4.1791824041002;
        Mon, 12 Oct 2026 09:54:01 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm32044009eec.29.2026.10.12.09.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:54:00 -0700 (PDT)
Message-ID: <ef08eb14-0732-4c75-9f69-2173cba91b65@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:53:58 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org, Dale Whinham <daleyo@gmail.com>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
 <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
 <571681d6-67f3-47fe-9a42-dce5aca13c99@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <571681d6-67f3-47fe-9a42-dce5aca13c99@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX+xt+9ElwBRul
 b1o4Htky8YLIf/qCP8+iwvIbSc/784alGmSEcE7gDsdMjfbHiC+FCVmVHod/YvrzYtLQuofXXrd
 uDMfUIxD6BdUZHKiRLqS5F9pVBU6Ig9nrqqwMKLtm9z6gsFBzmf8oCka7KslLcAID0CCkC6D3Pj
 c5MxuU5tQs6XOFUsk53VqC5ZG0LvkHtuBCNDnYv71zVbX+g6JIlrXzXDFc5AEuKfV1MSnnVsCMO
 +1r8+u9C74AcOgdwiSUdmRl8F/lFTdq9/Vo3NJ/DAjLf8ekhhFfto6rMAQswghKw5D3ADHMeFoj
 +Z5KnCwlL+mBM1k9bpzrjvL7Y0DmKfyBa08pF9y5IQb1wu+i8xbNP9ZtR4f66LMH/VnF27UB5SO
 5KHspsV7XKK6lV6WqmWVdhiAAjBANtNgFx9onD/zOYf1bZtqHcWVxg/zjjcZzzTd4F3s53i3COQ
 UOeXKpdvjNWVrddDDTA==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acd10ac cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=IdRum9UsuwhjULrUfLMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX1zWZRazAkeAL
 gC3BDNBrYVgixFtPoaZwKtkhteUYXg4Lcv/s/EzP5NDPFMU8hkM4cwkT1JYNF0thozHyq/uyf49
 5dMeukveBERwAl12mFKjBNDPMsnsoRg=
X-Proofpoint-ORIG-GUID: 2b0kr_v43IUSLV2aRD1Z1vPe6gM0TYvl
X-Proofpoint-GUID: 2b0kr_v43IUSLV2aRD1Z1vPe6gM0TYvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120067

On 10/12/2026 9:38 AM, Konrad Dybcio wrote:
> On 12/20/25 10:12 AM, Krzysztof Kozlowski wrote:
>> On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
>>> On 20/12/2025 00:21, Jérôme de Bretagne via B4 Relay wrote:
>>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>>
>>>> For some devices, Wi-Fi is entirely hard blocked by default making
>>>> the Wi-Fi radio unusable, except if rfkill is disabled as expected
>>>> on those models.
> 
> [...]
> 
>>> Is this really a hardware description though ?
>>>
>>> Its really more of a logical/functional description. It tells the runtime
>>> what todo, not what the hardware is.
>>>
>>> You could also have a list of quirks in ath12k for this or have a user-space
>>> utility look for the appropriate platform device string name and disable
>>> rfkill.
>>>
>>> I think this logic belongs in drivers/net/wireless/ath/ath12k/ triggering on
>>> a compat string.
>>
>> This is good point. Either this could be deducible from the compatible
>> or this should actually describe the hardware and whatever is there
>> wired/configured, not what OS should do.
> 
> Sorry for digging up an old thread. The board-compatible change is now
> I think merged into ath12k, but I'm not sure I like that, as now every
> OS consuming this DT has to carry a table of board compatibles (hence
> needing updates _every single time_ we want to support a new device),
> instead of being able to convey the quirk through the property
> 
> Perhaps we could revisit this approach?
> 
> Konrad

I share this concern although I hope the number of platforms is minimal.
It does seem strange that something supported by ACPI is not directly
supported by DT.

/jeff
