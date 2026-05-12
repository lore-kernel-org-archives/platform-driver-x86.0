Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2A7360ECD
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587117; cv=none; b=WKkyRRf5AkJHG/nO0t4fVkkeAXrR9pCATBX913h1XgdVNV4pOLGnqwnLbzmZaLoul8UjjPcxEGKe0LBWG5xBwKIVY7l0HzkU+4fOF77kM/JMHO+01evHGuykc570BgUFzQiv/4uEWeQ7XAy6bN6c/bQ79s63AWekVU3Mw6e3MN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587117; c=relaxed/simple;
	bh=O8I8PBtwX4vjv5Y40d4VRtCG4MLQQ9bKzHSjhphOnrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fi67YHq7tkNSPPswmw+jSFwJajB9O3BFBL1qS2Afenqz/AWU191FzBOIOB0b4xCZC5qjwCFOoI4ouJdMEPXwCx/4TyEsTVCom7Amu1WONCcTTgxFZmQNGxU1OhSwFxuhdf04Skj5iypEfL9V5FnYDzbkNHD0egkE/PCoTucCQBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzUrG/pA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUpgDA/S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzUrG/pA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUpgDA/S"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAkeCX740581
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 11:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBdHXtfJBgnvple6m0Pzy1ZnAVL2Twf9LHk7w7qltd4=; b=HzUrG/pADxJ9P5BS
	agKPS7c8ZmTDst7mSowg88msOYC6OQMVRT4GHt+vPrggbmljY7g4lsNoA/dWKANN
	T4GgsYZLOd8GdR/ZWnpQCjhP6/atONGtRe9KQCEdSzkPt0xb0d866oSVwM0/v5cd
	XzBwrVGtXVd/WqQor3lSfHHy6mzZBSQckixwetmlKAsGhrqXCv6AoZc6jUZKKvEQ
	LSeRS1bgm8H3QMcekMgmJVkMB9xBmRBCa9iIv7otQ0Zdo6Q6ceQDNYbWnQReoz/J
	LExveIyZO+0BZgBPl/ioPfAUv97WkBiCTsl+qrKh70EeQ9CVbGgyYbvrS3DYYiqw
	mpgIZA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhrc2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 11:58:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-837cc5bc6deso3823500b3a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 04:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778587114; x=1779191914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bBdHXtfJBgnvple6m0Pzy1ZnAVL2Twf9LHk7w7qltd4=;
        b=YUpgDA/SqP/dbPmuaSBrVBGftNHelHAGrFqmy7SZI3MFbkacmj2HwZNn3YAQFIdx6T
         qJbGfHEDWxT0yaqoXc7mTY3okPLpR4sxgm90K0CA/FlRgq3t4f1IJMWv3lGxvp9inlhe
         Ekh4gWUXmsKNhUhZ6qpWSF74kPdu2rYjRs7eIqYk+d2zJhNWoh6/lFNY4t/qUgKxLD2o
         CRge36kiAXw/Jb3AGfWsR1x5EejDjz55DzWNa1+kcrwT3B9/lhac5s7jbBbg4H0Om9cV
         W9iK9rnCrQr3InBDMe/Nt9fZ1JwogQkf6hBnZSrOQs2IFyICFyeRiNiJIFYoLjI/9hMg
         9UYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587114; x=1779191914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBdHXtfJBgnvple6m0Pzy1ZnAVL2Twf9LHk7w7qltd4=;
        b=Qw2cL+hEba/Mr/iSRcw+MHOccu6L6K2hpSrgTGkenLx2jNmQ2t1Td5BbWk9GMZeQs+
         lpc8DWbjSvb7Q/OunZTlcVl+4OymMqV5Uo9IJklUXYJIBEYRVi7Hd7KgGJjbn+kJNsAv
         IszaIB6B7AK1Ikmge2ifJlJeidRBixtDZPkX0BYY8ScojxxCYeLkuZSg8KkcOECkHWOL
         ruM2z8m2NnnM7XcpBRD6Pn9qE4yim5O3/CgoLbVxvXYfSixUT2wxVFOxQXEXqRXVp5rW
         NdMaPmDKujrg1tluGa2PqMk3GAcbpyi1R5Nd/f1sYtSanB5aLW42QCyJVqRnk5G/CZzb
         WuDw==
X-Forwarded-Encrypted: i=1; AFNElJ9udRwpYHWRTAeeSjvjw36z7kJvxnlFz+U8Lx+pI8wi7RJMhCPjsN7TcnjeWxD6AoWmP5QI5PhlMy6yJ3WIQyhvo0tK@vger.kernel.org
X-Gm-Message-State: AOJu0YyGI1SFlLO1lFRhen/L7dVlXr/F8eIC0Dw9KDfRF8nuRzHlstZk
	KNX1TZYJbop+IDAx6fVN45eHr6KbwhdOiD8XgEGWLeavMVdCLDjqc1hFNnVVypNcskywDIRsG++
	XMXnGVXEhEDbsH1rkgrdSaVO1zCDbMAroMX/ECn1/KiwFHkIQlMSUz831dAVXu0iQAKceiywKc7
	UR
X-Gm-Gg: Acq92OGRb6czeNk+2HriiBsQ1mxPpECH3zYc1KzDY9VlvIKuso707mtyKtuqs8l0NvS
	ZpSdk5RBsih1TgAnzO4VvCjCqmnVsQtzv6jI4GRYMT3BEspHGmKONwWSNIU+894BB05FbRexVNo
	1ZeyRCJT5vMBmN4Aabyd0k3TayFHI6PK92HzCHrHZMQWYNBhDVrrbUOdWoGRu5hQG7l2IXTMB4i
	osvPsRMnz4GPN4lKC9nqA0/LY3rG9R7k38dos4e/NmVPs/ODXgwGupPgN1WmeSdCWUDShmZu10f
	VeDT4ZPaFAvItdiP430k//ydKrVEsIiD1tk+nXfwA3Zrm6+21lstrEClS79wGPTcq3zRUxqjf34
	KXQ1Bnvc87JkIGX41FSoa5AbscMiC2wp3ZQ53NgRTwsO6ch9VhQEqN3YMwhHJh6mhTnKo4ZXZDs
	vYsKml63V8lvb5gEsW70JbS5dP+XRRoxGA
X-Received: by 2002:a05:6a00:e07:b0:83a:78ac:edb7 with SMTP id d2e1a72fcca58-83eeb9b0fccmr2830000b3a.5.1778587113628;
        Tue, 12 May 2026 04:58:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:e07:b0:83a:78ac:edb7 with SMTP id d2e1a72fcca58-83eeb9b0fccmr2829975b3a.5.1778587113150;
        Tue, 12 May 2026 04:58:33 -0700 (PDT)
Received: from [10.79.193.65] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c00sm21885057b3a.32.2026.05.12.04.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:58:32 -0700 (PDT)
Message-ID: <58b7b983-b717-49c7-9019-8862fd47695a@oss.qualcomm.com>
Date: Tue, 12 May 2026 17:28:26 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
 <20260511-add-driver-for-ec-v9-2-e5437c39b7f8@oss.qualcomm.com>
 <84949728-7d0a-4ce9-f37c-8200ef792baf@linux.intel.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <84949728-7d0a-4ce9-f37c-8200ef792baf@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfX1UFca/aabJ7q
 vz6Iy+G9tZWfCo6MOtvkzVzFamtDgAYlUKETfFKDwtKAj00ZfPFQvz/TU+YIVJrxz/HyU87XZp+
 HCJB8IK6kYezbEXIpl0gniAD/jhBUarIqO9O0nuU/T8vS7WGUUqzesACjk3h1+KutS+qPZVtx37
 tbgdLdhVi1+rz1tHiIZsbHkL/qTchS1Lc4wHGXK/9p85Rvyoca6TK1Ow6AYdNv8/LTUciZUa45s
 ideo/iIoAv0C5CNEVHID7R4eKV/FtImgVkq1aV3+8SBT33vilPFunY3V2pn+UVael+1tvxh0MD8
 0LeXZcK/gyNFOdspSdeWyldtkkOE156pWL8P8zyXUbH/lW9B8OnOJEwZyJyFzSbs3Y9Ly+sdlnO
 ailEza9RpCzGDq01jl+iLCEdfvTvoWDTtuNxEbjHHtDOjQVoQAVhDI26IecF8XqdazeNekrWygg
 f+6xYEIWm/KZHytCROw==
X-Proofpoint-GUID: GRZ1PTlPxCv2dsQQ_DTKfPt61QKON5XI
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a0315ea cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VOWR3M7HpeV8rc-S3HoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: GRZ1PTlPxCv2dsQQ_DTKfPt61QKON5XI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120124



On 5/11/2026 7:40 PM, Ilpo Järvinen wrote:
> On Mon, 11 May 2026, Anvesh Jain P wrote:
> 
>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>> reference boards. It handles fan control, temperature sensors, access
>> to EC state changes and supports reporting suspend entry/exit to the
>> EC.
>>
>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Tested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> Thanks for the update.
> 
> Patch 2 applied to the review-ilpo-next branch.
>

Thank you!

Will you be taking care of merging the bindings changes (patch 1/6) as well?

-- 
Best Regards,
Anvesh
