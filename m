Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B907235CB6A
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416976; cv=none; b=b9BnIUHSo++VffPTe+zmgK0CxslQL6OCX9nd9f1F1lHqiKuUYHuj7Ne0n0YXMjp3+nDr8Tq/Lq4bbwOcGQcXzeASG4MHnvjtR2LcIK23IfCAlJn4U31QrX/g4Lw1I8qMXUf2i/BgHJm9absUBhI6Hb92XPq91XJhMrRuG9zXbEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416976; c=relaxed/simple;
	bh=ZM52gofR5yjzuJ3AdMUfS0gmcKkKJxWhjvHVfvQQZMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UsZdliBqdMhJtwgKl4keqnuC73gYqzKp3Rv6sRMYDYCTnyfwqYLNvQbpYT1aQBVuffZiwfSeBkpWVEUx2zLZbuVhgmOlCp+kqaAhH0IP4TFjoIhUolzmPQSH6pTdI8LSPYI0LVcG8/9l4u/UL1Wt1z6py1RkfkuBW7T7PfkHH+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0/f8p7a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fvdtu3gE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0/f8p7a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fvdtu3gE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DC02c74140725
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 15:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WSj5lQ9aMzbJTDFdtGczs+50
	8xvStrruA5rEQ8Dn7dY=; b=F0/f8p7aHq3CCWMCaYqM2lm56MD4XMrbfrUWztRW
	NhxldCZN3+ppZwERE8Qkn6aG52O8wkNJNyKwUjTyty1ArRz+TeohzAVBFhzvU8Yt
	uOqa59RX2zAIGVWetGck+4A8/Uayk2olBETL2inXopLE9UaGarmeIPG+fkZUl1y2
	zzCs4rT/cyz2/+d+CDin53TRZ/99KSqkYIZo1mNGrUJkX0veLG/tM5zQdRowqs4t
	fZKJTm81AbqRZP9GUY+Ry6yHnpTDoSH5IXNX0Z+8Wr3mX5GASI7AG/NNPMc7PTX7
	14+68Aai5Twd1WlAHqlm/YAgZEuhE0ejMZ6A2qkF+sAIPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn2a83f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 15:49:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7f6ac239so1437473985a.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 08:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773416971; x=1774021771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WSj5lQ9aMzbJTDFdtGczs+508xvStrruA5rEQ8Dn7dY=;
        b=Fvdtu3gE2AjE051u5zlP97migIN0GgxMM6UzfniMWQvZknkbLsGbqfi0NnPfCeKc5q
         Qd4pEf0pzo9Q4l3H6U2ahbKe0Fc4DtwEc+2xPQK2Wjm0g60K1NAjzRSwLI+wCnu5pTH8
         H72ZWFqt7lISHmV4ld6xZ//FbZB9GIUurYKh8LLV8W2o58QaP78w+HMABZq+6PoTFb2n
         b3vWwU5zE1pJdnZnUZYsdbz8SLcBvJIwXMxSCPidVsySTgJ87rDaCfTcAqdKGbMheT+1
         MUoElfhTrDKX8X407M771Z6fg5upfl7sTM9Gz1hTa8zvbfVQkJpVaAlsiqYREiWLhuCT
         cFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773416971; x=1774021771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSj5lQ9aMzbJTDFdtGczs+508xvStrruA5rEQ8Dn7dY=;
        b=Eb+j3OsBQn/ULA0YexeQwv9GtrrMshBbXp67UZ79QpWnCwYyzQqXWMRZHb2+4ZCUil
         /jDzCu4x384yR5mmHsvtZ8esLPdOuEMiH9NGScHDmS3BDswVXr6ZX6KqklemKmlGV8Zp
         ue3mRRiidZM4clhcZIpCRgombXy6MBuRhY0swkfdA2faCa4oFtpCkDiJwpAMI9/u+iiR
         /VUl1o+8YRcl9QPiRMMlg06Hy8wraJFm52VBokPSMuM5BqVDtuYT4pXKBWQ6JJUCueyg
         ipUFWxXpX/H4PbTnPKEbVbCtg3C12u6j/kEcSkym51wfE3Rhf5kq07MX2kydskjI8Won
         ovTw==
X-Forwarded-Encrypted: i=1; AJvYcCV0BLjm/Sj//vYJmEgdzQVSI1cyCTakdQQj/YuIfzxq3rZb3zcaZLTehxjBmYLGr70ljE2o7YgvPjfIn3frOp/NlI4h@vger.kernel.org
X-Gm-Message-State: AOJu0YxScg80F1XY2rKfrV5MQ5NTpg6VO8Y/uSly3RjE8/fq7GmoKfsF
	VIfGAQLH7vKyH9lEV2pxxftTuHZ3jpsQyWdz+5qH8bEmgR8hc+0ZjQvsY0jToqL0P5Z1/a9Wd6J
	uqqV0viQERF50bwy63I+Z75lI/AoQ2/m71lvl2QCIlvczrIAo3vNBKzwm6l63TUwXbP6iyEUpnL
	7m
X-Gm-Gg: ATEYQzzBkKj1TT0N7d/O2a5kSrnO4lz6QYz9k0MF4KvmOLdE11FYSJ0NwS87DH3KYYW
	w1XWRZZNPwWiw0SZ2KZvgi3gkVg8F2ZXFAfMTlXshTN37U8CtK6WtmWquXcwvGKtD88oSapjb5L
	Soh7eDAdugVSw9PeCvOLiREQifbqvgrBL+54ak3K7qYaZNRVhv7XwRehOVmAXfiIiY86XgSLZaL
	e8fObkl9sWxRPb5EQd7YJSkBwU0QQx+IjlWsvsFq1kghworZ4aXPKoe0G47no3Ol1n99EsQdT1q
	HqBwmCNfjhOwQqihDyU6VcyXh8yqQLapsWTc0lj7Q4uaNdH7kRvhDxUwp6QHuoNS6tFUuM1+lXL
	2crZ4qSjRjW9ARWnTuBAqkedu0kk+9OnCUc2gm9qGJ0ZEXzRlyBcLC14N4N6C/N2svjbVzZEESD
	stzukhK89Hzo+m5twRf3U9RjqcoY2MOPX2v4M=
X-Received: by 2002:a05:620a:cf4:b0:8cd:b60f:9ef6 with SMTP id af79cd13be357-8cdb60f9f68mr362760285a.16.1773416970994;
        Fri, 13 Mar 2026 08:49:30 -0700 (PDT)
X-Received: by 2002:a05:620a:cf4:b0:8cd:b60f:9ef6 with SMTP id af79cd13be357-8cdb60f9f68mr362756085a.16.1773416970410;
        Fri, 13 Mar 2026 08:49:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c0asm1613682e87.18.2026.03.13.08.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:49:29 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:49:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Message-ID: <5skljak27gm7io4r32l3hbhrce5iul2bp57liujvdok7aswyva@z5kvdb5b2n7x>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-4-ca9d0efd62aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-4-ca9d0efd62aa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: eZfAMaeoxEmA9fjKORSDRmneaVNvxx58
X-Proofpoint-GUID: eZfAMaeoxEmA9fjKORSDRmneaVNvxx58
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b4320c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6SiODLxq02sLjzxsB7oA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNiBTYWx0ZWRfXxUCbCsyqwgDD
 9R0i22FRM4dpAjW5AXiX/hn2Gtyy8Z4HMi2QYB4k1zfumK0cJ5xsTE5hf/EZtdWgml5WQhq0EH+
 oyA+UShET28dgnKPtBbroxnfPSUBm5FDi1qd5zioGHR41OQuH0HWwq3xDxqXzwbAafyHqrz5b3O
 xud8EvC80KIRWV5d7VPAIQmVGNzovTCKc5oDZaz/efYl9xhzmpS1tLyKEPlSSljk+9jRdMjIyyW
 PuyRsgUmhz/HM8YlMcxV+8RijjpPMouHMDlNGhIzq4Hnyi1Jlvpjlcehm3U5ADGKjil7QyxNjyl
 /hKxxL+nPnnqpqNgMehWgh2sBKtcre3lg0NJ9A46nyNc76zoUTJmIHUP1FJaGF0y+9qBPHJC94w
 uEaUaZkKm7imgakOaq6C/KiAq9e8xukWt1uYJrZcJjgRL1n1KBRT65L7wOrHDFcs0hng385TKwZ
 Qz3q3UjbA3GOdqxK8wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130126

On Fri, Mar 13, 2026 at 03:59:54PM +0530, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
> temperature sensors, access to EC internal state changes and suspend
> entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
