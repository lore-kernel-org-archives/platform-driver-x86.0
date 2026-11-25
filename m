Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598018;
	b=dwOR3ysjQBnj4Ng7LIByMU/OavdHnTUtIoP0N330Qt67Ox/vudnSAlNc3KJUihrO3VsO
	 XWTHbjt5oHlI0knc8t9+YDMJTgLFXdyHOZLpjqpUqSDZK0FwEEEqDIUOCRvkMA79woNeZ
	 zADu8P514728RTn9fZ24gQdXMPzbsm+KFa9EpiaYzlfFSO95uR+54TnwHmg5/xJhqNZZq
	 QqDLz8isRDwiFuAJzCoo+NSsVGHvUVa5Nq6xD63GrPBMJMCSS5/201hyySDCe7G694HMg
	 eArfTsQ6i8YTnhyNKoTgSdFK/EU+MptYQYj5Ttm9uRCWMddlP4PhMQk6Gm44yc1SSkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=;
	b=peBfOJIh3Q+0wfERxSE7dCr9+mdQeJw/9mfg0SsmO+xsMFebUvpK7KNXOwBIPoeq3Wd5
	 p7gE5G0JMD3l67FV7zJI7uXP98dj90WSAa5kSDi4ryaHx7ZwZm3YUPWi+EgIf0kI/j8pO
	 efEgt4pUfFdmplNHRNsM/qXJlE2UzWU2V5rjW5Eg6oKoVSLpsizKUD3wxcT5ZwocUo8aC
	 5477Ob4tOcw0JHIQySRx8RwxQn7WwP9jh/p+TxKa8NcNFPOY1m6cznCafmQVlXpZm7vQF
	 BE2qJe1bTMNXUpzj/UM8iiMQu2l7En0nYjuZIORNTB9LnVe5TJrD8uMSGHmddpmfbkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fKbpflYN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIh6NEl9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C889606A32A
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 09:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C889606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fKbpflYN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIh6NEl9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68baX1860444
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 09:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=; b=fKbpflYN2Li6SwsW
	x+0dVOscZ6J/P88HrREvH7MGuODuqPalnXAOpCuBvPZ59ShYGzNDBtRLAOJmjRQV
	53NMD+0JkdIne0+qz6/U4VXo5SlyMzCC0FOTbWMmz8wR21AhwmHk+AdUBGKiFqa9
	pf3+PWllITR6Z/IVb7E30EDoXgrDACWfusmEbECbkjR0l06FRmRoYIHe/cW3tBwv
	/6B0GJDa6W+SoJ0lCYczbd2nrrwJ6BzAdx8wJBiAQJJzsh2jjLu4Ov5Xcso9jhDA
	RoTpwZGAZd7VI0B4qsDJlCS2BkLJNp59fqLsqlTVog/JiyyCSsKqHoxmbIAfb2JW
	fUF1Tw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu69pwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 09:13:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94964828890so69580785a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 01:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795598012; x=1796202812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=;
        b=EIh6NEl9BDJk2OrN+wNY1uC2Fe7oSAIlvrYTEtxZdFnQdXpp3qdiLRZqumcTyrr2/M
         0gm2aAhoYF867nZbN0wyLYRcUy4vnuCRbkqbj07z8StnFOlB+0Za5jb3tyM8g5Ks1peN
         kbWN7T+R9AwxCecBy/Qq4cdUFYdEykiYuhd8qMFk9vLtnyIFh4vr+soFx5WSmFfy9vu0
         m3dHj9yjJZjJvQ6ZSmf0Y5R/R2TExTXRYSSnfweY+kT9MGik6BSlcnJkiuCCl+NFrobD
         gghoXfOFxW3IYciie6NP8FYbZfaAjOStF/5kThZxzoCksyXFo5Br6EczF1TfG2TjU+fm
         nH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598012; x=1796202812;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=;
        b=niQyOdrh503hMrKTCNSUrJU2blYptaOBSvUg+9m204lEYPgiO3EDQcs1r98U7HzyMk
         HcqUbcJDGhHyHVX4W4cejzHBAo5uSPXVPq7bo3AdoyEIZZVG3+VKJDEpZbdOAkG4wQP7
         CcA7n1zI2eP2j1pcwbfFRk69GmwbCUFX50i3ArD+iz+LudueKfNDSUBrktWZxWC+RPL6
         q8xWegK1mpG4TPYHF/1LwV/cnow3ZSxnxXWKNhdOEm9gcGwKGvWZnYfjLOmNX9tkyxnE
         yfuidlGU4shCbVueXmLcCarsSthmjKvZviDllz+0NguDYn2iIei6LEQ2R8O6o+YQrzwj
         s+ig==
X-Forwarded-Encrypted: i=1; AL+hErGxYqyx79zMi4t4VPlvqJuCTfpOQBTqeRm0jiXI04+mbXBt8N6nXBUsP6fhUSrjPU7wfd1D0X/q0/Jxi9rXdp6NS6A9@vger.kernel.org
X-Gm-Message-State: APuU4Z+E7UM34Ece8QU002vEb2SOqMGeUIHV6LiPOTog4W77xG9cEvkD
	kNU//vvuK/VV8QljCAxVsC68xf0c0wofJWsfeG8GaNeb925A4BbsSDTEAwan0Q08u8035GOjNaE
	Pgq9YaUvWkvNjTDBl6xgwrJbxmYdCYJXOGTDENGcXAAN55aYBOo+m1xQDCF+XexnXYgJXCG/+NC
	DW
X-Gm-Gg: AZFdTZdf3FcfRwQH36YpOyS2kJtiLtJ2XEvZFfP1+W/MHFh7KSu1hJwmzMrJVsSdEzQ
	PQhTVr39ENDIfeY+I+pKxAtyHQUqF3Q0BgOB8/GFmxH4wYkmFpEcFkgXNAD0nsf+Sj4NpsCcYCv
	Bg/cJnm+rNZs8Qne5miJzR5CD3xNKFNEDCXZTwWI/bI4YYVwskn1FlueJ0RxRQcr/B/ftCpODHF
	SxHh3s6y0v7zp7kV87jWT9uIA5bzWTo2d6EeCp3npsm3nuxPcRVAlXYAUmhpea+wLNF15J3GPe+
	6y/E3wN7FO0oy4DihBeeAxHM6kOBVUF/Fwn4l1z1tbwRC8wKHXky1fsFGJvMDw+CHSd3lIgEa9a
	AmZWtQFCCR8yCjfPv7tBVUvYC2N7kPnBiY44ircJQimFMPE/i7Kh4zxKMn+O4/iBmtStOt+w=
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr2845919585a.6.1795598012592;
        Wed, 25 Nov 2026 01:13:32 -0800 (PST)
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr2845917385a.6.1795598012173;
        Wed, 25 Nov 2026 01:13:32 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710601esm7951603a12.27.2026.11.25.01.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:13:31 -0800 (PST)
Message-ID: <25657ef3-3bbc-4d70-bc80-e368eda447bb@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:13:27 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Sort the TLMM states by pin number
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
 <20261123-t14s-gen7-ec-v2-3-3420a6202366@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-t14s-gen7-ec-v2-3-3420a6202366@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9oBBlJCkAyylYmwzYMUkQvQSdIc-YRa6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX5z/AkqFJFEyR
 rtKFKlQdi4Il/r/X0AiG7hF8EfR0QeTkUC7lGLWLNPMxwXH1LKejkEDvYYdSHdrYKTeeHsxt0bl
 1jY29opFo2451Jn3PHC/E3uoMWDcNNI=
X-Proofpoint-GUID: 9oBBlJCkAyylYmwzYMUkQvQSdIc-YRa6
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06a6bd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IcN9rPl5bsQiho1bYRUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX2EXTTQCNpVcM
 Kgweiy1aP+Ldx2CnQmLUtZI0LSlroNx4fP2Y5VjmXlOHnEjQdNAWQsCkvCki5dnHsp2HCSOIWLE
 5hzBVyHSabE3GPUmXsZugP+FODHjeAO3eG7pbkzgdOWfVFd3mxgp2EKKlpC7a2by7pfhnhnZ4Wt
 Z55HUsQbmp70yvQ1cxkuvFGe9dkNgO68yP9DcrcXLh1f13tmt0X50W6GSjry9B970qZY5owF33A
 QmqPBWWc0bRp2eatevVMQPJBwcSD2YyD4AxIlnebRK4OpKXN0zpVQAj9NewBHKS3PG/cmVbreGt
 +lsvgIlRLdmgB/41eSwWgq1bDcBdKUrb4/vyfm4mLgkQ7pPEkj2ZhZ+IgiO4M+Qa/y3gdNmSGdv
 MlTQkZSaHOTZVMxWEn8sNesIJlZHs0kdchWf1i30GkZySl3DlAH/ateEqGaQzRfBcYBMwcWfoTj
 eaeJDhqTXRMN4f9MktQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036

On 11/23/26 10:35 AM, Abel Vesa wrote:
> The TLMM pin states of the T14s Gen 7 are ordered by node name, while
> Qualcomm board files order them by the GPIO they configure. Sort them
> by pin number so that new states have an obvious place to go.
> 
> No functional change.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
