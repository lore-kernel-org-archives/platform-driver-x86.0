Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261779;
	b=bh6j+qqoKC7EOH1dXrctgqYXt9qcFMkwc+wioXkX1luIJGtvDPG5iyHvLVcG1EYvGKkG
	 nkzlSIn7qBzkJ+maFecPTasjfUGeyuh1Zhks3gFuRt2USbQ3lRFwUGl9tBam1gl5fO5Z9
	 0QPNN153ubVxRmUtQhSZeTSnQprJP6kPIILDQ/thNLsGVHoWvXpv9sLiegDFnAFTJi4Tw
	 aaUfr9zQM5pkSKJOlutsRmjgXCsdAz5lon/HfrOCjGIYIqtC4X7l9kUYpNBigyQtJZg0L
	 tasbAlSpumdLQSVJvDE/dveBvtUyxVOCL4xG9MwPGYa+BEridyeozqR3BCmaiPO0QfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AD5fB8OYC8HR6TpcbWLlkKIKZuUu5fuArtYqdnpv+5o=;
	b=2XsrXGodXmfwvtB5tXci00+X1up4wPSz3xioQDzPcLKVM9vTDD7N6jnWSU6PytojZpqF
	 jLZBcloQlL60OV3e96mQRDDDGioNvlb8RmYK9TreovCGbkt9hqwR77+9xzFdC3vkO1zu1
	 xrgaVjBT0z94Mg3VlZ+AhjUwLNU9naLJ/zKLmrhqzaBPuTbTZm6pLLfJazW0YHIlK0t1h
	 +eEDm7+STMxghAnCi/rB2mq2xAkea2g6YR3MmlAI3SlIipDKE7aYQRK2tRNiTMKdyaXxj
	 HP2/BKNLVrPX67v8GFV9D2V0NeP3oUeQ5Z3V0seVE9tJnJXUq01oH7o+ax3AJ69j5sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiF17yli;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCK4JOX5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BD2606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 22:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8BD2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiF17yli;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCK4JOX5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LAPxP1401243
	for <platform-driver-x86@vger.kernel.org>; Mon, 9 Nov 2026 22:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AD5fB8OYC8HR6TpcbWLlkKIK
	ZuUu5fuArtYqdnpv+5o=; b=JiF17yliFGrBffx23Bs8PotLT983x4SWY/TK0qrN
	iBZOZ8JpCAq7Iql5wQt4ScXtv5fHXk1Q5ve3RUz0KmYYH375IJwId7BUNwGePw2E
	po+iTMaF9lQmuvgs0bFRt2VVeqzvAnvasVGkhud3WdFZPtnFfvrR8wyMxH5yFuch
	maZsfPLO0JlsnBlPqPRC1Ay8cBIK64ZQRHwDncJa1qJEONRE8MJFDOZl1HEzKnGn
	FnBDhZMlmpSLjsTKAIwruz5D4Anv83eCY+Mc7tGwGTh83eYC+JZSzIPQxiHHO6Le
	5vrwcoyxv0obwy//+vU8/S5Xl31YlnroC1O2y9wygy0eCA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2kr2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 22:02:57 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c96bf59c31so441110e0c.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 14:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794261777; x=1794866577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AD5fB8OYC8HR6TpcbWLlkKIKZuUu5fuArtYqdnpv+5o=;
        b=OCK4JOX5AQuIMfmo6ZhNfcqpK5eHnWguZzoVm6Ej3Tp6K/DPF2fWKs6tD65mkwsTZt
         tQoz8F0/j8SeaArJemrkLlSiyratZpsCiv91Zgg7miCu/iqcUqBB3PJZ5p5ru/j1yR3K
         kZ2fP/rYxc21NIGniyzFZIj5GAIS0AEdBwuIooj46UeOpfBs2o7wDZrmFh+Evvwhvya/
         DVKuJSziP+DnztXWdmddxqB4mM3inlQqWpRZKY0qxXXwmPbAXVUhki2SNdUmiWtq0JkM
         5fnMOsgygUWRJPafc9VJayj4MW82ldZPJWBAVALBF9WGFiQ5hF5bduLR2Jyd/hIcLNQW
         TdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261777; x=1794866577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AD5fB8OYC8HR6TpcbWLlkKIKZuUu5fuArtYqdnpv+5o=;
        b=Rih5yEvNNgwKhaX6cHoeWYNiKbni41GlKFWoQXOSOhKANzgwZkAA9u0FJmguCqWfQy
         4XXg4AMLYIuUf/Quh/2V80LvSTQZQ2EzjpMYb+TnvrZppCos5I1uB/5Y0UW9Htm5vHhZ
         ZL5F0Jm4nAKm7QZUt8sJgkSgYHRU17i+i7pvKxX/WguG5tlSkz7XEmbTxWnKxjWS7rQR
         rmMKjvxvEHmWA3NH/9s2grfaqlkM28YP/DhNEcwqzqq2HWEAj1tpCWd9n7QHEZQS9KE4
         2xGNymq1QKXfEPMV7nLIcOucoC2hNZcI5OR4DMMiYMORkG4uYmeVDmolUQKmDWx3QGR9
         fHmg==
X-Forwarded-Encrypted: i=1; AL+hErH0+Am6DzA+n7g1W0/fCQJ5THBBGkl4MWmpCHIDz/wk9G2MXjPcSP3hCxlzBvSOXisVUtxL2ISlxW1CP/DMJvJ/hvRs@vger.kernel.org
X-Gm-Message-State: APuU4Z+n//sNRz/C5ILI5t4x1rv99vF80/wqVWwRb34zKLbXmE6H5nrO
	V2psombsu2oKqWYG9lJBSsfJuMfjctANnCvLAE2OGtNNA2+Ap5SkOgde9F8dk3dLZi3fSBKRirQ
	p4itcL0C14s134iZo16T76bAA65s3Hvqx4E3ofbG+9xEBU9aBveV9zCGxlVJm3o2cpOE8dkwYSR
	ulduMMo14l
X-Gm-Gg: AYBFou2Dtle7C+yCXRHVEvusdKjNzwwEqA8nEiuRNHhwXjfR+lRn4fAYb6P5KPc8o0c
	omzS2u/LkdhptegykMBVA6TMmZdl8pi2B4UnugbVuCm2BfSaefKXHg4HdcaD2syYFf+Qu/Wh3kp
	pYH13FyxKQtZkh9i5v82+qBaUvd+11zeL/AQhkYryIYlsAhGG784FSctwe1+wBqn4TL9grMicyz
	ObtQuMDlzHwJqll+eIPfEFNBqzwBX9VBm3i5yJT0q3C+CfvFJf4B+jtEtj9SqMus9NQSEmnr0dd
	5ZJtLTLWso+Gn907vfRh69oR0ZntZkgTtXuuq9oVlxXl/LZDopLtWJY4zmBXIhmSt78vsw6X4qw
	nMdZrBR0JL4Ew1nHpCl1FdFb9JPe0fG3YwzQ4KJLrvLbaTfY40bZysgDDoNUsHA5E
X-Received: by 2002:a05:6122:1313:b0:5ea:9218:eac1 with SMTP id 71dfb90a1353d-5ee0d1a2b45mr181662e0c.20.1794261776743;
        Mon, 09 Nov 2026 14:02:56 -0800 (PST)
X-Received: by 2002:a05:6122:1313:b0:5ea:9218:eac1 with SMTP id 71dfb90a1353d-5ee0d1a2b45mr181629e0c.20.1794261776020;
        Mon, 09 Nov 2026 14:02:56 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836c835fcsm1162965f8f.59.2026.11.09.14.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:02:54 -0800 (PST)
Date: Tue, 10 Nov 2026 00:02:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC
 support
Message-ID: <hhmszf223l4uz2x76rqlu5quefgigaowwsuesmfmuzsdl7epe6@hssfeonsacru>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-2-f4a8edaac447@oss.qualcomm.com>
 <44e4ede9-3eb8-418a-b1f1-7e9dc75e2e75@kernel.org>
 <0c75e1b8-db5b-4512-9aa7-f0cb84606ce5@kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c75e1b8-db5b-4512-9aa7-f0cb84606ce5@kernel.org>
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af24311 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=YC2Dopf-cczdmvoT8fEA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfXxYBlweBq/9JY
 w+hLjPnS7dEhZ08NHIAsKNuVZOROO+eVZsojqq661YTtMCYRQVRSkdYPSR+lWPU9qLP72kscg+C
 2uJsKb+UsOHHVJCS9E4NqTFaJ73hw8XY6b1PI4iArT53CmyR3Scl35MhIi30CeTASP/PKBFRs6h
 lsvTz2w134jqVT82s2Ps664CTkcNEirm0jmXehwNMJa8YE0PRTDPgx1WKBDkHbXGzBJfEHLGOJx
 EY3dLuGgpAmgfS360RrWr+//2ioPbiZZbgV/W94diASS7G1RIj4q/gcwGVf29uClFa/isQ3zW3N
 n2X7oXz1pkUjzgJI7hSr0fEfgbrVGGOg1yBmQGRfOiNu0sI418gjFROCvxeKfSo+ICVDM8C53nE
 devInF4YxYljMmstLW4xYY2SqwOi6Gf7IF5l3tTrTsewxL5XRbZu2kK6J+RxWWCbcMDl6TfoAjX
 c/PLCASaR/dUFj+E5qw==
X-Proofpoint-GUID: 7L8IzhSCIbV5L9OyxTwoIIl-imKkCZRj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX1DulC5PdW8w8
 vKU8gIV/ZM+eGO8EioWFmw7AE0ZdPd3qOA3DhI8agOAAVQbBjYdXWn2YwZ002mfvdXNaRYt9pJj
 IeWYybXkAX3xnD+qhNrTuHl7zOFaiyc=
X-Proofpoint-ORIG-GUID: 7L8IzhSCIbV5L9OyxTwoIIl-imKkCZRj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090087

On 26-11-09 16:14:57, Hans de Goede wrote:
> Hi Abel,
> 
> On 9-Nov-26 15:52, Hans de Goede wrote:
> 
> <snip>
> 
> > For easier review by you I've split the improvements into 4 patches (attached):
> 
> <snip>
> 
> > 4: Cleanup: has_kbd_bl2_and_standby and mic_mute_led_generic checks are
> > really just checks for the original (gen6) support vs gen7 support
> > drop the bools and directly check which variant ec->variant points
> > at instead.
> 
> I accidentally left some debug code in patch 4, attached is a new version.
> 
> 
> <snip>
> 
> > So about these differences:
> > 
> > 1: For the spk / mic mute LEDs, on a hunch I tried using std LED controls
> > with a LED idx/id of 15 for the spk mute LED and that also works.
> > 
> > I did not find either way (REG_AUD vs REG_LED) for the spk mute LED in
> > the DSDT, instead the DSDT ends up sending an ACPI notify event, relying
> > on some windows driver to handle this.
> > 
> > How did you find that REG_AUD still works, did you just try the gen 6
> > method ?
> > 
> > 2: For the kbd backlight, again the DSDT ends up sending an ACPI notify event
> > and does not access the EC itself at all.
> > 
> > How did you find that T14S_EC_REG_KBD_BL1 also works on gen 7?
> 
> One more remark about the kbd-backlight the new mode which reports itself
> as brightness 3 is an auto mode with brightness 2, but it turns off
> the backlight after not using the keyboard for a while (and back on again
> on the next keypress).

Thanks for the pointer. I'll keep it clamped to 2 for now.

Abel
