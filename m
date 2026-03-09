Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719E130101F
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 21:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773090373; cv=none; b=XipyDIfrbozSK9W+/HeMiKt0g10sKBJFVLz5dFBYmkJvLBTbQT+ZVjAMDBtVhMEEZqCb8JyGW78MK7CyYAvuZRTir4nN+5PLLGjXzkcuhsWQlq5qlQl8fnRDHtrahSEche5tT87QsBZSxL/+Gj10VYR5kKPkO1yxEcOFGkZsVbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773090373; c=relaxed/simple;
	bh=xaEeiX6OmsoumLdOC5tJ63/jO1CWQAAlNzVa0vnV+80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7uLVrTVrMqnZtF7wsr5CVxdr4cJtRUJ6PEAxbmwSu7oAh8fg673EyzUFNhsUEGHXSwzsBNTKgAcjA7/TQO4Zru5OSnhtrTPewitPTjahLIn0NpJs3MQbCl4Vp0W38nsIZQ2R3IFcUvMVm87Xm2bnkW5jnGOpUn+rQ5dQSgb+FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhbmR9Nb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAHURRJt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhbmR9Nb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAHURRJt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC0FH744386
	for <platform-driver-x86@vger.kernel.org>; Mon, 9 Mar 2026 21:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n698Dyj5P7b6CPLnLLa4Pbha
	fMLunYH5Og2awom7UOo=; b=jhbmR9Nbz4D9t2k9X0lvO+UqzQczbJ27xXgVXtPS
	iaqkraQKDT6PB4F9YXFAUMEAOsBZfoKHomja+ga4gzop8yQPWYzKerbwz+MddKMB
	LqPbvupPSkksg+dzVccVZuvVFCQnZUDRjhTRvOIxxD3yUSxr2g6rWssDLx1YBvaS
	9Nkmq9JVLnzxQMEGpyeqzTwlJT2Kzcfc5onoEgUgr/Gsqp5U28G1GkjTHhQ7rctM
	A4K7WmIDQTXSKIcHd8iSFvFbrFnE071C732ChnTmQ5rcZ56YCAXon1DHmkbzPS9v
	VvYfXQM6laGa8xWDsypBarzqC7nxO8tPeCYDNEPjHsLI1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsaafyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 21:06:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5092135f2e9so35538281cf.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 14:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773090370; x=1773695170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n698Dyj5P7b6CPLnLLa4PbhafMLunYH5Og2awom7UOo=;
        b=AAHURRJtZL+xgojYBEH26JltK2qWeptIFMM+S4bcgV5dk3XcvSFi0MW44Zf9IvSxMF
         C1u4vM3wrMbLIrEFp+McU4KuQOXKXso27Pw4f25D65nh/wmLR5iz2/MgwkxD8R3Zd+/8
         JGnHpzth783pWgERPeZ+XvjEGo+eGqJ8kWgxTO5b9Mq7Sm/TAApN7Y2wf/tbQfA5nMUs
         /kC9/seBMQyC/BvZEbV9dCglcK0q49KSTiCOBPJQVLzijNiNgBu5k33bFkibFr2twL3O
         MABEM9m0BgQB3YB7Av/O4OYvXocqCessj7mvB4RNo74Z+l3aPjvigDOqLOGEAIG782Yw
         YDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773090370; x=1773695170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n698Dyj5P7b6CPLnLLa4PbhafMLunYH5Og2awom7UOo=;
        b=SR6lVj2UDRFv9ovlDv+d+vikUAt0oNAi5fN/dlMpBKV/PcLH7ZBo9n0Xqu0qfN17kO
         mms6lSogBV6P983J3X2ltFBRDVA37obNAb6w9+6V7HiCNSwy0YbwwnQxHngbwWCK06bF
         O668Yo4I43Ua2y+QnN91pNlbbIhRXyMGHnKGHWR1I8iKiGRuBISZimsQ6EhBEzW7Um3b
         ihFgkQREoqyEV4kmmT8Uj4+qTDhkOL5tMmmQBXKKFCsz+XWOjujzxZmKmti8DJgrFNlg
         s7OMAfBV3NTlYHmHIMBZMFlKmI14/BcyanyF8/G2X2s4sG0pw1/wtoJIlW38u4C2zIwH
         DzdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkAsZn3zYZKapZTesUL99cQmsnhT+dCRU6CURZ5TSEGh7/S/+JpSWF0wVV6MRAZ7p/BYMlKtZRH85XBmw2GubboIGw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8UunQqwoe5Sh2n3vcaQ4R28I/sFUB72UaBaJVGTeFGSrWgqoq
	yXFz78X7eAhQqPe8X6fhpkBnnb9X6LXiQxeF5ndE0UuoVcfIHMFuhyjvgB9ewgW98H1rAZpdY+Q
	b8fYZJUFPo6oagf+mAMCc0aQjDL3BzS28KjegJ0FbsNqygvWsWeD8OHr/qsEK/mZYJLEc03fP/V
	nRzDFv8AN7
X-Gm-Gg: ATEYQzw+dIFxQOc7pWZtY+E3xz3aexGRM5qVP/iE8aToBGUMPdClinyEWSs0eHKiRWl
	Oj4cZdVRDbh3dFjn6+kiwNDa1zMmtK5RQrUleiStJWQVrhhb6/WLuzrWL+CXYdiAfQe4aiTi3La
	7ss2FcmmiTBfR2t0xP8X+RzjDSAvT53OWd1dKKUeW/NLZI/0dYnfRphNsAReS3E20QemIdPL3t7
	6gNym7IegjITkH4R49d8A/pTryNnsK9fWecX0+pUJAkUD6ZJPN1a+0AH3UCaEQPxovuHUmJCNYr
	ozIGiakdXoPN8eEVqJCSQLz1yca9F6UvJKMFg05Km19PHcKiMVt5l4oicX73tjqeHdfkQbJPbVH
	VwEe9DmvjOo8y5fQsfl6OST4mwKm7ZbLSI/W+ibrcgeXO/JDHFQDrPAe06CTnBYKQnc0yeoGN17
	0V9Dzts36zu0KAE+r1gwCYFIWDnc/Ngwt8SMM=
X-Received: by 2002:a05:620a:319f:b0:8cb:66dc:9fd8 with SMTP id af79cd13be357-8cd6d46b265mr1656312185a.65.1773090370091;
        Mon, 09 Mar 2026 14:06:10 -0700 (PDT)
X-Received: by 2002:a05:620a:319f:b0:8cb:66dc:9fd8 with SMTP id af79cd13be357-8cd6d46b265mr1656308485a.65.1773090369630;
        Mon, 09 Mar 2026 14:06:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e16dsm2298947e87.42.2026.03.09.14.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:06:08 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:06:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V3 1/5] dt-bindings: embedded-controller: Add EC bindings
 for Qualcomm reference devices
Message-ID: <6wim6vo626jy627k32nlhxjd5dh7cvvwxraqyv7uujfgbo5p4m@cesxgplycnpm>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-2-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308233646.2318676-2-sibi.sankar@oss.qualcomm.com>
X-Proofpoint-GUID: xYQvMA8oMXu5hpF53vcltYKQ0geYx351
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af3643 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=4Fh_A_dtJNkFtXRpuoYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4NyBTYWx0ZWRfXz/qRsQ5IEUy1
 c6hY9HF+Qp97z+vrRTHJUu7SS9F4Bbkg2Qox7JU7/Kl8hab0Zeey8daTDiCZp/HgrdFFUyEWZG5
 vskbDltGu/oKrSsXXhXOiS6NktT1sR7A2QAxG0ikJefPjm8XZX8dnJLPZ6SAQFQeGY7YlLtUOd8
 mNT4jkq7j9n8NfQSdKa4C+Pge5jPwEQo/sJTkn2rdwFAo600rDB1x1MxfkwaxdA7IMBmNK5d0Ed
 IM+/piHEl2ryJ1xjyYp4X54Ofe6hDvMD7Y+1V2dvXHmmIodyLe0X9RSnSZHKma1VwJRn6TuorTU
 orYr8AGQB6bL7KbW7rVSJrB1WqjHK4QHGecd9VlZ1jVwJt3cXBB87Np01wPmQhMl6r6cBccCg3U
 MwohwF9j2SC3FZ47jocNCSi7rQP2Ry/WjkA2uDRxlhwCiRFhuAPVvIPgpe2OsHvovExBYLaAW4P
 VN9HlagnwAw66gZdq5Q==
X-Proofpoint-ORIG-GUID: xYQvMA8oMXu5hpF53vcltYKQ0geYx351
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090187

On Mon, Mar 09, 2026 at 05:06:42AM +0530, Sibi Sankar wrote:
> From: Maya Matuszczyk <maccraft123mc@gmail.com>
> 
> Add bindings for the EC firmware running on Hamoa/Purwa and Glymur
> reference devices, which run on IT8987 and Nuvoton MCUs respectively.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  .../embedded-controller/qcom,hamoa-ec.yaml    | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml

Looking at the DSDT database at [1], several laptops are using the same
protocol for the EC. Do we plan to use this driver for other
Linux-supported laptops too?

> 

-- 
With best wishes
Dmitry
