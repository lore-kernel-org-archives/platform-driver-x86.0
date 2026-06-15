Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8EC33065D
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 11:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524202; cv=none; b=Dxa5GI+75WPV60z9lBvAem7eeSMdrJBL6+rSM9kjVIqVCfRR/dHPbxx0JPFv0X8x/RCClsAHhW1Z1JEKKweXMsD9UcrHDmRTi+QEPfAywMxg64gGuMVkZEuQn//0b03IOZF/6KWa1S0RlC6wJiCaALkTARpRPWG8YdE/54vK2c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524202; c=relaxed/simple;
	bh=bEEsZLV7PPSJuZMZ0TUDCqsG8lEzuoLvm6l1FqNwz3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ch5oWnW+LL41epu2G/cV8RfzUS0/Dpwv+Hq+8Np6MRnv1VLMxnDFp4pahywHUWagDJ1HKwMHYig6zHrAwf4hf4fuRka+w/xRdYJoJeBwrHh4XyFqqTXZA5zX9C86mgBkixtTB36yCp+SWl+UxKiaN7vIIyei1QRdLGyOiExgWgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVUNxNtz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIFRlPiN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVUNxNtz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eIFRlPiN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAoQPu2481259
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 11:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUvYTTUsOLo7RNmxiDZ33LF9UzPszjwFsJuntJrwpcI=; b=bVUNxNtzgRyilwCr
	gVvbautuEcty47KsC7E0VuGc3NH2PSjsqN6KUN0RcOltnEvywtQxHKGyYvTZgIEW
	sDC2gI1bfHZy3+emTe7dfklVzyUxov2DTfmlYbXalZgiUNr+fg1NdY7f5L6Z+6Np
	ECkPiPQTxiSBQLvoF7Y5dHfL37le5jpCIqEYlMv3uuvyXhdhG/YlI7w6SQttGmyw
	ElES+hViBXDmBEwSJhYDl7WUvKGjkd+mi82lsB1iFZm+tZh4BZzYzpe5d/+QXxrv
	cJoJEzC86s5yXmGun9EydrZNb/Ln5DhSKIrzpfgvBmwatYqkKOf8hJGrkXWlt7Oo
	VmmpQQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete980nw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 11:50:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842208d5b0eso2644069b3a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 04:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781524200; x=1782129000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DUvYTTUsOLo7RNmxiDZ33LF9UzPszjwFsJuntJrwpcI=;
        b=eIFRlPiNe9VQx1YWVmylC/5OAPM+bhMxPVh2Iqdkkgw8+i/rsgPP35YBmTIOwDqa5+
         gi1j2M/Hm1bH6YPNuHYhje7ssY1xJTLJO+nQkPMBkTs6L58NEY4yL8cyF1hWxOhJIQSN
         W5ySbLPYTYyhmpNbbQByBhx6xuleJ13Bs7VEaYAG2jpn5vXeSlv6lkO/wL0rPtzrNMYU
         7+8JsadFdgkMdbnaReIBS4DV6cty7EwIOzBMaGPZO9nqJhHFuLlohMea+KtBvj4k28uz
         NCB3LiyqTDUN54JhGYNinRBkh76rZvh0nYtP8RdjeUtOzYmqrJJyfUtXJUCREcUvvsQh
         I/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524200; x=1782129000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUvYTTUsOLo7RNmxiDZ33LF9UzPszjwFsJuntJrwpcI=;
        b=kIb3JJxiHgJurRVKK7g6lZzhlXdPR4BTcI/o/mRwGjQq2BN/7YihfdjxO+4jwxHkG7
         ZtaG4m4HeP0cF0ZqrDZKtqViRCVERSpHfFDf8wzDdK3O/qaM3wB9AQbEIgpjxBMQWZNB
         MqKSo6YaPcSxgY8UEFHN9sB3fAholDCXtErYPd4AjRaLMSo2H/d97/3zxlIFI/B5w3QA
         EQfUVQrrISJNXW0kWpCxJRvoY5CippEP2FQ0X+RVmONSZMP32f4c1fAS+c3saxRgCP+H
         DePE4CydjBw3bx+kT683gFcun6F2OJKsG/N9VSZ91ELQeCWxAxlO0g0BxMNR832uYKAR
         8kcg==
X-Forwarded-Encrypted: i=1; AFNElJ9uxyX6XF3qgfXZuv+Lw58eZl4jmftpBhH6N2ipHlHF76NajxE/mYJ5p7EHAoZVJPZV4T1VwyonKF73yLfoMdLBZufW@vger.kernel.org
X-Gm-Message-State: AOJu0YyaOj/aeLHf/8fLkTelK2C2OzLE9dp5XZivdutnedYQ9BTzEHbc
	Hdj1yQ4K09pKJ9dDpmzoYsUSP0QwkEqWkLgSBXAYEcA5AgGOBwNunxiQRFgAmObtYv0Wbs59KYj
	iQN1PGlUgN+6Qfxz24C6pmNyizJIvYBOVwJuB/xU6tuVYW/BK+9sv72qtLVfBX2ZXGf/r5op4Uz
	CI
X-Gm-Gg: Acq92OF6t62BhHocnF+xZyZPRrhc2Ur9Srb8FUNO8yIRCWJel18Nb4bQ/d+26zT4una
	Tu6+JFJUgW9wrOsLlIMDA3Gx4VXrtHTsht7xjNcvV7/TqYmeWaQi40zBZ7Yh6yl6UeYf7EaqvUK
	95X+piM9/P6sqQYzJ0TPvi0A70xWw+w9qWSLh/qC82BS3Ksoujcd/Bg0JGuYA3MlY+SCpFReTy9
	3dU2JyiuNWKAa2dXycbnY7d0cQT47ZbX2BqsZ9hbNcrlR6wDWpnhbuhy9vg2evi7OwlYIfxZHnz
	Ec4Zgf02bc5UuDQdqakSH3o4CQPmJEY3igYRsaRYa7efHv1TlB+CSWtYFB8j/kIQeThT7qAP69Z
	BWxHEmDplsxU/lgOiVTP/MdK0bKKtXfHglzDRZwIFZSOVf9iUd07NijHfmepZVd5cN0UyMOuF0L
	uvkXAPFiqQDrpVxGVrPQAFo7W5rLavlNncqw==
X-Received: by 2002:a05:6a00:2191:b0:842:2f28:4e36 with SMTP id d2e1a72fcca58-8434cd4ae2amr14954086b3a.17.1781524200175;
        Mon, 15 Jun 2026 04:50:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:2191:b0:842:2f28:4e36 with SMTP id d2e1a72fcca58-8434cd4ae2amr14954051b3a.17.1781524199763;
        Mon, 15 Jun 2026 04:49:59 -0700 (PDT)
Received: from [10.79.198.165] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a5bsm10309617b3a.33.2026.06.15.04.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 04:49:59 -0700 (PDT)
Message-ID: <3f97dd62-1446-41c9-b16c-fce36076d345@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:19:53 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/6] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
To: Rob Herring <robh@kernel.org>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
 <20260511-add-driver-for-ec-v9-1-e5437c39b7f8@oss.qualcomm.com>
 <20260612222259.GA1960900-robh@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260612222259.GA1960900-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a2fe6e8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKCGUzlOdHAmEzU82osA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: mOZdtYs-yEg8jvA6azUzSrgz6oG1xMwu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNSBTYWx0ZWRfX2JX//4oFywol
 g+VGdHFHuieqbOYGplJWw+0zJjTn3y9lQ8jpzUzAPT3PB7IWln1LaT3H01U1RTXT7rUMrbaBgUy
 53ew6vdzW955s32fnnUiCdCjhbrhoj4=
X-Proofpoint-ORIG-GUID: mOZdtYs-yEg8jvA6azUzSrgz6oG1xMwu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNSBTYWx0ZWRfX+UoHogVf4gDq
 wn/Gr7jXTCs5Kjb5fniAES+TnTAZlKjocTX8aXjf9HEzJbGkz4iHjevTuq/mb/U9vFFveaeXQ1M
 Ru6FA4tzrOpYhNpGVgo2/uOUAQaSG6lYJROSL1IRf2X6SvDTIakRASnlmnkdmj3fDGlF3rYh1f1
 b1e4T3sMn/2gbxn2QHOqX0RI5hjhe3Hhu9Zf4mNMuEophzwiGVx5rvgmMLq1ueSAlqMEmfcUGTd
 h4qqbYLARL9ZPLNSoAK/DhsV2EeqshbHKFkRave1yFZ5ZPqmtWdfNgJEl/P+fRNA6AstC2tWbHd
 EYmse4LXLS2+HshF0YcAmBr7M8n0Lk+/0gxYMLrQuTaVO5jLrWp6xOT29u2UIx6uOM01rSyvb5w
 0FUuWf4llgKT+TqGuNvTWt/iggHmpr5PJEydoGjRWeJNuRNlLu//GSqtgv4IZkJwo3qPhHqryv3
 2ndduMTxWK7srMtebcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150125



On 6/13/2026 3:52 AM, Rob Herring wrote:
> Looks like this was missed, so I applied it. Please make sure your 
> patches are applied. This should have been applied with the driver or 
> .dts files.
> 
> Rob

Thanks Rob for picking this up.

-- 
Best Regards,
Anvesh

