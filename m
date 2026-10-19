Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CB04A688D
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410022; cv=none; b=fjLu1PRXgo1S+cEiq2Cnj00iLPlEh51AcbQB9rFO0AXNcmxyqV+CVYF86cUyuPr4VLT8YrUXPN0ih5vr8RQ1tNuQ6ckLC97P9RED12xBED+Q4sAISsIoiyRvHusoZt0dPDa4mYwupdlmXXnEumbkXTuJmZaSV4hAAiBGRN6NUcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410022; c=relaxed/simple;
	bh=zNa6hjnbJsZirNp2D6itt1WLH37BdWd7BIdoXDU6qOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLydcyNh+RdmsJ65rfMQWe2I9f6clQbCKTmYfKnkPLENiDUr5f80wEMjFyMQ5SpVsHDtjkan57ClcIVc35eAWUw0vqNVTW0CD2EvxZT4XtrxMO7g1F72Goli1olEWM3rl2EaMYVXZfC3+jPVHcTTHV//gjOfJdV4E+MkzV9twYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0qske6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDQbixxJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0qske6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDQbixxJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Os7D1665655
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 11:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IqIT7unUNeDVbUGIwzQRnFuw
	+MAaKeTUmeCgf8MNO6I=; b=b0qske6YXg+7km4y82nPrdnSjk/9jGB8dE2zAfS2
	aLdB2rwbp9/1KnLBds4r2l+TrTfOr0U2KAQr2xmzeLUMdUyF2/jWc/jzV2W/Kzk1
	MtUZqw//2uZv88Ml9ugxhsStIbmxF22YsG21P7WFiHCPcXOx5sKcKQgO+9SZqewA
	Nn9U5MxRg+2/s3jR73PD5JiMN7wGp5myf7+uj7UvOlcx+8Jine2wHPRi1OIIzv5o
	HDwZfAfu8RHnZTzOeU/78hxlJnQnc9tUb76eQE7DRNM3yaeO6PY6HP03SIfEdORN
	Z0W+8/fHeQ3IvKkWvCw1PCqKIIktBR/PKTyWevAi2Ib5rg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0v48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 11:40:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c5ab5c136so337964885a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 04:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410019; x=1793014819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IqIT7unUNeDVbUGIwzQRnFuw+MAaKeTUmeCgf8MNO6I=;
        b=EDQbixxJ0NfTXTz7U+4qvABrqvUor5sanbWa0DR/E+8gPR3poqnx8Wdgz9lWq+g42R
         t3jdLH1nSenRiBJ4HOnH1VbzwsfHAhKx3apt2+zQtHSZlYCTIlqDTp9x07HuY19N6BYp
         qMIMgu5iBC07+0/cXDZhNC2kOo+7Ag0FSdNpjkwJUWvqmo5pHNeYpoFmgxrCcwaGUj7n
         niBkZpnsubaOVkk2zk8bDI664ZGJG4zqN8QRo4HLxcV7rPNCyCIWNGYJuDFxmKXQZvp1
         kvMdmu0pEV+995FCdPF6+6GxsNK78ki5opgFJxt+Sel1iGX5jdjHzkb/EmP59VHEuWQK
         Hk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410019; x=1793014819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqIT7unUNeDVbUGIwzQRnFuw+MAaKeTUmeCgf8MNO6I=;
        b=z5K8XF4dEuVkglS9CIf9hyWUOpaj981Vs5xDhR5Q3rvOKQKY6MwRRUmjc2Mor3m4cn
         qu5u5HXlaYRTUI7zXhcI4WwyxWXrpDIlFUasWyuJoNz9WK3nmkNzRbEEtvoA9gUDWBao
         u+9Em3Gdq/RbqjMc5GAJ7qCs61xX4tSfeeZQWMhlG/5seOqXztCqTLaqpdLr13/LMR5I
         LldAPZ6w7pjgcNhzaKqbDjO0MBn3f5OL7LhSEbuwFoQIOQpWTv06rKbvwjLXeXBjArjX
         E4dDiBkNb4wjkGFAJbqBIlVyJWprXAQCbgVvd5EBQWLPcNxd5FLUzq5G9f7pcI/iaHm6
         ZBlQ==
X-Forwarded-Encrypted: i=1; AKwUvByrWclLynUm4r06wHgCaykSekV+Chibvr2j2ujn9RhF5St2J1/pP2NT34ZZ1qfcJNoBTpkEmj4POuH1JrRoZnwYoMgw@vger.kernel.org
X-Gm-Message-State: AFq9FYLqwHkYatitPKBGFv4ousl85ZawyZVnDfPk+ZG1Mb8pxVG0+wft
	bOJmT5XM31s/6Y9u5moLOnMp5wzdiWBpPrbTF1RAlplgyUAxzKLP/f0UcuehFCX94lHL7Y5YemE
	HusYVDWerlExotGTdrCh29u4WAUPeDXRqVj7Dv5h+ET8mukrgGdHGkrbZtUkqKgTwNmzFtYIrB7
	N1
X-Gm-Gg: AYBFou3b31wnrDFIkoE18v5tVtXpJpPRXyRWpmqgE7RZAsv8x5tXS+1XYCCcXcvxGwr
	d2rOJ1/ZiBFZbyNU84VaTmfSsvZzRuM8tKq0HevOsjjmsVLKy/ikLz8HAryepI4OmKND2NI7ddT
	Vibou7zXj+PkVdRgUeY8t/LOBteuVjc4vAC2crtLbGWxrwuH9ahtfjXgUfMrp2wOzFtVpBnSnvu
	gjUxYGyv11e+tlLpDvpAiM+8TK+h819zm8z4567JsJJS6a+4+VRLUMItm+fL1U85u1+0aJxRDZ2
	EPAbZqUZJ0+g4uevsy/4ohtkq5hEH5qIOKlQ0JoRUxvuuymbiFw+YkBXYsbrvYcbDdgDU/9Su7i
	J4OysibaFpnApnUhP
X-Received: by 2002:a05:620a:258d:b0:939:6dea:374d with SMTP id af79cd13be357-93f29d813camr1251144685a.49.1792410019024;
        Mon, 19 Oct 2026 04:40:19 -0700 (PDT)
X-Received: by 2002:a05:620a:258d:b0:939:6dea:374d with SMTP id af79cd13be357-93f29d813camr1251139485a.49.1792410018424;
        Mon, 19 Oct 2026 04:40:18 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm519633865e9.1.2026.10.19.04.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:40:17 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:40:15 +0300
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
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: glymur-zenbook-a14: Add
 Embedded Controller
Message-ID: <44vpjtmnwg7wtp6xsqgl54rbpos27fndfru7pmudfvzweyl3zo@r7dxlf74klfl>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-4-af6305ffcb10@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-topic-asus_ec-v4-4-af6305ffcb10@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX2R7XfQ5EM1hR
 j+urK+7KfhQ763ELXfANFhIYSmD/iP9Xa3ByUCUin4t0ruU45nyRq5gTciTqgIC0nr0CSnKRyUn
 lxmzqKtXpziGbYjiQuNrtrwumj9zzOg=
X-Proofpoint-ORIG-GUID: ifRdmlfUZqFuyrDbmHwyR-FKQgEAv8rx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXxFyKiq7c29KW
 er6Y7LQ+91W65N55NhjeFEJSC4RCbP1XGEIIhmKn2YCkb1eJ/ohIZc5tmvlOY8qpIJM1nw4sINE
 S+vWGImsNtGf0r+8knPinwDqMZkR4Ori/ZYnJOWPsLvUFFB9gW8fMqqcUpLetCkiLN1Oay/Tmv/
 eNJJixGGw+CYAe93/6MzjboVNIZ3nq7WHpXq1xxUgaWzo3SKmZcHhsMmXfUuA/mkTcaxyqZx5By
 +Bqs294g3RbrcwH0l7tVoT77fMsWcNqAn3wb1tKnTbNfdSPPPDiiE0LERPy95FoaFRNdissSzz3
 jQvFqBEUR28JZzqKmcEwErh7hOS0tz9WF1TT1JC/zDJ9iXrBHnj8l6IVeZ/cliV7pK0IvhOhquN
 xVX3nlXlujIb6CEzs+WDjf1fDie7B6eiz7qzNNdEiDJfonxnRmDVl67mkF5C9sVM2trzMmkTebj
 fKZgK0Y50qa2lnQxgdg==
X-Proofpoint-GUID: ifRdmlfUZqFuyrDbmHwyR-FKQgEAv8rx
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad601a4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-FifcBtKAQNI-ioUATQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 26-10-15 10:55:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur-based Zenbook A14 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
> 
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
