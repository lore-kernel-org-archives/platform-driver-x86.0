Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810794078C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 20:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109099; cv=none; b=iEYLK4UBQBXMF4nscyq8PsrakabIu5Ri4AQqZChNEE73St2SdCRyQJ7hcD3o6aO5Yy6AJSEHM2AdnLUkwPKatqCNAz8pT6i8rayhj82ClBbQSAx63dDKNziB4Ooo24Hnd5lZsV/jTPr5PehQWUXuTyXRsUd4cm8DZOtixvMljyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109099; c=relaxed/simple;
	bh=2SILvg0NRELw7Nyp8PHvnzfGtHVKPwkLNhQMISSJheE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1lZgROr5hKwhsinLDGaLcMhEn06kWs//y/I0jLerj3sJTfdO+2pqvVtNVluNAe2tGDUTP5WHl7JfF/tiAqWZc7puBf/cw1+ielJMqEB0E3U+G7CUDx1O2V4fAq4Am0xPB4ay/VsVP/T5XVqEks4rfrvG7GwSPpIBAPBQNJ3+T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MunD8rhl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6aqTgn+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MunD8rhl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6aqTgn+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7v8g767703
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 20:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SOdGFJHM+QY3bQbQemDVAYpt
	gztbGbVsScvPY9HEk50=; b=MunD8rhlSUsNocyd9LcmWUU/fdjKDNQZi3JSA/uS
	Mcp91FoVAlQPLsCNC8zYbmOSBlvVbp03jkwp9aMDlYiJtHIidZRtIjd6J/QZEZCu
	6VjLa8JUUGMdGERs4toWO/ptXkr5aXaidp25cBCKU6zHXcbgVI3qBIMc4YWcLq8Q
	atLCS3kNqg6Hu9WKINFaIdJfda7fc4mPtrECZF/n+5N7pIrnrPWS5jfXppFHHshB
	5k3d5akJKIQhi4Hwe9w4YlMefpyovbmy5/ClBBXzWNRWbu28GzRQlEeNFOzNnt9F
	8TS06L4gsxqPCfGTFVqlgm6W3EiYgKN/kNyLI7GNxq6I4A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqkfeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 20:31:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78f4d6af128so102818137.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 13:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109080; x=1790713880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SOdGFJHM+QY3bQbQemDVAYptgztbGbVsScvPY9HEk50=;
        b=E6aqTgn+C4ON8LM5Njs+KvJ99+mFGsXuLJZY+gNg35SNgNPIuGOxgCabiIH1Uo8ogH
         3cb1nKnLp3HqhSjB2ZaAzrfT7DkijrzDArSN+QG0zB8ixR2+1BACXWQwjCoE5oI1ni01
         2mbLXsSM7GP30yfszHjfCdD9Inxr3vKbTaIqoHwZ6iE4wezuWxQWIUpjYO5nuoRqCO70
         uWF6Rwuv8uj+UpaFOyqeidAXF29Xk6oRmRV6LVKZRS1Ph9Rq08cFobRApEltvreE10L9
         3zLB5gI++kxx4U3Li/I0wcc1fZ0FOATIJ1IEVr1J9U2C6sSk6ZobovJkZdo2oSSHoM2x
         4Bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109080; x=1790713880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOdGFJHM+QY3bQbQemDVAYptgztbGbVsScvPY9HEk50=;
        b=YCh0xe192z7XxHFjVdvfKSsyy/shV7j1wcHaHqcFLWOReiRLDQa4M7r9kwYhCvHe/i
         XLfpQcFupq6OfqX5uTb6Eu554freRUxkJ194I5QPbWepCe7fbJ34/tOzhtH32B2Dd7Ze
         awUOL80OYee2Jvsgmm8o29umv2gWmi0BELEYHfy+ssh/ZlPYr//2IY7K+Ju9T3FcBR1u
         RrematdoAMIx/oAakCXWIBK7OXplAJZYMU3/XQh3MPOXRZD+fO5UBo8uQGIyH3K67HwB
         Kls1jP0U2XniLVH+JoWCnXirUCQB3RxjTfTpNhtdKjGLh6NGAUASh0qZJBs1lHLF5ry6
         rBtw==
X-Forwarded-Encrypted: i=1; AKwUvBwYhPmsh2fgJzAf6FvfAj/OYvGv4nJLpgQcNv2HT/dBZUaUeXs4k28qH5iLA+4yQ6V9HE9q/yvYx6Wdaj2HPORMfseG@vger.kernel.org
X-Gm-Message-State: AFuF++l9r9ojMMM4CQg4humy2e0q6nl1e1wnW9bnVwdPmmOv7aXHxIF0
	/jHbJiSrG8zdJnUL2qg/KVx9KRnKzVR3G+dr+7FQaFKe25YySsK4tveT9GbraWBdCEsFt8J6X5l
	mkg3tJiZZlxE0qCnlsS7cT6nTT6nLh4WBEzA8pQETgfdF4PRw96Dlo32F+P8+Buwq659h8NaWBn
	CY
X-Gm-Gg: AYBFou29CpmKgy3uor2ojx3hOV4SpS4u0ureY9WxfbKpX06F4EZ5ocJm3tjxLrWl+GX
	MQBvwN7NoZMdK96T3gB8Mxo8QchwYdjdO+XfcPeDek+s/2ivIEIeUjef29AaHYbQq5tr0uRIwaa
	DVEsLN2Pd10CWsvjn8chQdT1att5/7rHbA3rI+GMLtyCe4fV6GH0VOltoFCV/nxgB4Km+BQD1og
	2wmcMFppDKfdK5Xm9I3GUotzU2yy0hIEN1DOaM2q2Z8MjAkPurT4nc7FRC0STsWtqspD89xI58m
	J5TrEPzD/1Tv3n2j/Kr2fxbFI3cCjoGkficwuDWzMUg2C1kRp7vCDYkObrGLS7DMSQYAY40imoo
	pOnzy5G5jO7Pn4481iCUXRB3CTg==
X-Received: by 2002:a05:6102:511f:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7ac1b625004mr630615137.11.1790109079842;
        Tue, 22 Sep 2026 13:31:19 -0700 (PDT)
X-Received: by 2002:a05:6102:511f:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7ac1b625004mr630541137.11.1790109079268;
        Tue, 22 Sep 2026 13:31:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf99df60sm5738655e9.1.2026.09.22.13.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:31:18 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:31:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add
 Embedded Controller
Message-ID: <uv52rxc6llmlas45mejbeeriryiozh3v2f2itbvfzo4f2sgazm@ly37763jkftd>
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
 <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX5NQCgR3N3Drx
 mO5stvkhKJ8ga9BaIqyo0RtEJxOSMkXLb6G/CxVRjXZXz4FeakfSu3Rrj7OXuA9a/cejCIzJFti
 W1VYnrCAtHjnj53IOQC1QVj7RzO48t2YKZ2a6DiEf/wJinb/jzxlzoJDpRB8LKnhTAsNAF3FwJ6
 8YScuzFURXIUutd6WIWoAOKzJTx9QvV/ApKbCRxz7oi4hwW/BAFTlZ4CXFSTwygNEAi38vsFNyy
 7VRCat1/yoERUez6GkHV7dTx0YF7tKHjiVluw9++qCjTONMGlgp7DdqDdY3WJsKWooS2zvCkYjF
 t8nsKgAXvDWbHWoBCHwHWop+N7fSBLT5mqgZy/9hb2lken5zEDk67twqcZyV3mu9txzIIHBmVxT
 U+YctAsivJNHXRGcongNReRw9wvH2NSPBM95UipyzxtEUkAFpHwzrXrUCMxKyvoaqdSdQ4z01Sr
 mKfejKe1MFqAxSVZChQ==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab2e598 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=B_ILVBOIu_Z04Xi5GswA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: sBNwBJuVgjgGPYgSpjjw_LHcRy8scTQ0
X-Proofpoint-GUID: sBNwBJuVgjgGPYgSpjjw_LHcRy8scTQ0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX81c4uiC7DJs6
 QgvTQ4QGlxXGcgousxSQH50Ch4Z5ItRFgYdC+z6vpuij8/Je/6/4yZa7G1SZ4REMGypPoya9Ede
 kblLCvLIUoEqc2X2n2saiGHyhY+7YtU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

On 26-09-22 11:33:38, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
> 
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> index 40433dc2d6cf..d3356fcd25f0 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> @@ -670,8 +670,19 @@ &i2c9 {
>  
>  	status = "okay";
>  
> -	/* EC subdevice @ 0x5b */

So what is on this address then ?

Anyway, LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
