Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261310;
	b=43YuVd6/JCbefDjCIVNnTyLYyHARYmb/f9Hgq/QBRCzra0C/6+9OAK8Lu6BSzBnVReRd
	 pfLd+NVHM3QY0oGZSslVbbLQqXzhyNYWLXiXvEvhBVeQBGO4/bt7nzjiWvh26muoQYTjt
	 cEbvwl/r3wl5JESv9EkpUyr4NVcKhxfEerfaCnuubyrZz8Ve7qrAmKroBNiy28IENWt8V
	 6VDZCjcG45nGGmvSIBUDJUl5IOS5fIohuctppqCFlKe4dJ4k30Ng+tx+MmpJbJaJLxBD/
	 GTzRrf08JMD4E7sIidnfAxB/43CD7QIaSzjKsou9qzRKx9MR1xfZSVZaLarNe/tkr5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E8uYgL7FEPaUkpU4wJE7nFzr434D0ruCIL9ZeeArc4M=;
	b=WnLlnrC02Gxb8nEiM5AkqrrszndJlEYdtG4MPbSSqu+AuqxDBRTb+CYXDQeX11uLtypH
	 BPaU1KK6gjEMttn59hDMUPw6a1YSt4BJy01+N93eITyE3SK3ugSvX1AzBiMPDEuEVI2YG
	 aW3YpPkOQXlkEmgdPfRvX6T9tuaAzj6Iocs7yxQCFxeZkMurWmzXxfl+l5+/ls7R+DH7N
	 +Tm0dY5wbFIzaQMUcslvc7pDIeatXNLb4QP7OyrbztkB6gNCa5ZmTNJ7+vbZQrjvvG4zf
	 Y2ZbDMTYvpwJ3fZvizC5k/ooe8Kk0biE3ex5zaWxcZUFxLGoFSGsBzThG0524HHNoXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aJr7hgrz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ukz2NAeS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FEB606A31E
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 08:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03FEB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aJr7hgrz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ukz2NAeS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gusw3294190
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 08:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8uYgL7FEPaUkpU4wJE7nFzr434D0ruCIL9ZeeArc4M=; b=aJr7hgrzZevpCt3O
	4zEntwDY/rCcJ1gkJlJkRkGyLmUil+SHryTwNpfigXF0SP35v1DKo5ufSWQQFCEI
	KtTIUAZEMfV7IpumJXSBst1sWEW3ANI2GLUs3oRorJlVmTga+VxDvgdlCFgKRA2u
	cbIeo/A3xN7XyP/J0i/8IPGLkWERt266f6OR3WW4m40zjInDJZhWDUNWBwUzq0JA
	tdXfAfvBrHV0FjxoOv1rwx8FL9TUtEJKf0qaLTLUdnolpK7HSDytku6FBluJsr5c
	dNmeKm01P5sOiBa5fwuIoVadH5/4gvrtXzkJu4KulRKXw8KLdrYYz4Ryd9GFW+yf
	K+P13A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshrsbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 08:08:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so44575485a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261308; x=1793866108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8uYgL7FEPaUkpU4wJE7nFzr434D0ruCIL9ZeeArc4M=;
        b=Ukz2NAeSQb5enXXArkZ9knl5A0uHJILkzbLyBDvih9jk2xqoy8ckEF2JN3bnAx18/W
         W2bq3VaEFik2fMKbuUYfWhQgBbKtQekVADI6zWhWEZakA4Q4bvItjtO3K9bvsfD2Quan
         HqbTIeHaONcuWhGF41AVMxk3flEw9Rf9yVfpUyDUWBliZ104K6yQh4UcvfY0Uy7+3Wjy
         VDRyxZSkhR7VXiWayWROsG0j4xwILlzqay0h9wVM2IDByt2bsVHxi60vc7lFptqqGiRd
         Jds1AHhRxLdPdp+8CfUT+DM2nFk2Yg256RBawC8by3cunqozOOZvDnLNz4ZtYH7qQtO5
         HByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261308; x=1793866108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8uYgL7FEPaUkpU4wJE7nFzr434D0ruCIL9ZeeArc4M=;
        b=ZSvNZQgGJcF3OJWzpNnVhrQuIWvwWwMdlXeFqs3crCHQ4GgG1HNbCE0myfcC6favna
         24D7bQlgZWjC7/hos0eRVY9yY7SobzdETKMDfK+Utm+XrGA/ZHErUlQm7z8JQ1qiBPPb
         fLgIPaVFPSVH1nZFoHO9fK9/4A1dBRE92JQaPLRALpDX6NIUPwEl64Z6qjrjD3Y86MNO
         L1L/ohvURaBNvonrDm858y0B2Zz2jgxMg2jdnvRs3eBMOJj7NPByZBoeyTl5tZWfgh2l
         bWb2CE6kL3PuZWScrFgaQuPB6taD3JA1nciSNYR5dsVKL3lAcxGIKAFEUTIA6w4RJYYN
         erYQ==
X-Forwarded-Encrypted: i=1; AKwUvBytDF6Sx6OjW0F7L9qRkl7YwdTo4oG9pzN5WckzXz9wJXRudVqFYn8keowZyqgBTJTpUK5STV4JoQhwCG+YNWXqdI2G@vger.kernel.org
X-Gm-Message-State: AFq9FYL1kNSzZAcIQ61NSEhxK6irrZLBdBmGa+I1vqFyBA21wlmvwQrK
	5eKHTS/wqq/xlTK1FBeuAA8629s/Gigb4itcLyOQD09V+onZF25HarPzUIntfeQJQACVhNXKYt4
	pa+lR7MWDjsXPMgxUH7Q/yRkr03MEq9rseLfsTCmeg1GkhaILTxJvLmOwnrvsjpmTPyCDF0KQCQ
	X1
X-Gm-Gg: AYBFou2BEDUCKLSYhcOAZjDY1b3LpvyefimecfmKYfQ89ndJOcMceAE/FtR+ZGvEFzl
	9U7fUe8180v7afoAS1mQyFnlqWwwDs0CRft8sbIUVVMcsz1a415PaAKKdsKpTS45gwiB3IdsfZH
	cYqyjZ91tmJePOurv4NSdhzRqE8T/QimtklZ+c88z3avWQGF66M/0nK5QyVT4hepVKl1TqT2zVS
	wElWTpeyXIIOwEYodpfOe5Uq8EGQfnDjuNaWUykVs9zP5qWq3OBUuluNlLMXHFBq42ObcXF6c0m
	mg8JnR0FECLWRDFv4NGf4vXiZuaCsIWdpi6Z+8ckx0WCRMlhZ5dtAfy6V7ESbyp/s+1m+I6HDQf
	5g1KZA+ZLKi/RSZuthzV0c6Qko0Ex41kIT1Z7eL+0f0atDXYA+EFdCe2BkqGSn+eYA7T79GI=
X-Received: by 2002:a05:620a:a2dc:20b0:93f:a34:d9fa with SMTP id af79cd13be357-9440898904fmr679896885a.1.1793261308133;
        Thu, 29 Oct 2026 01:08:28 -0700 (PDT)
X-Received: by 2002:a05:620a:a2dc:20b0:93f:a34:d9fa with SMTP id af79cd13be357-9440898904fmr679894785a.1.1793261307658;
        Thu, 29 Oct 2026 01:08:27 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd798391sm704558666b.71.2026.10.29.01.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:08:26 -0700 (PDT)
Message-ID: <416a5c60-910f-40ac-b452-3ce68a901238@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:08:24 +0100
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
Subject: Re: [PATCH v1] platform: arm64: drop the vacuous THERMAL dependency
 from EC_ASUS_GLYMUR
To: Haiyue Wang <haiyuewa@163.com>, platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029021330.460192-1-haiyuewa@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029021330.460192-1-haiyuewa@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C_9jDoaMiAsFAFdOwGZY_zjzai3-x0Sy
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae2fefc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=dHcd1t0V7vDCV6_KY7EA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX68cnlYEwQWYb
 vGA091j2p6ZRmxG4QyCT1bJIJerpYtTyMQwOkE72FrJpEk8VFVnUcL0+LNaJU28oONkJW2mzNcf
 6l6D+eHbw9oTWKi4Su2UsFbIdTKhRsc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX29ADNlXazPV5
 ES70tTK/eNFDw15rjhOSsSRQQMYBVSdovsjk3xsFXC4wXzhjCgX4veowwRZ3sqYThFe89TOuTTD
 CuSji9IiQ/tXFyp25LU3Lk7cffcudo38mYw4eTyyGGaxtKi9Psv39HfcgzvH2isH1sUFHilu1eK
 j/kuyOhEQ902fwEqy3X/K1YlNMbfVmMPur1zDbVF3dqvRm69sJNlfN2RW4Yp90vR8PHG0PZBNQ7
 Lc1pGlt49SbGZywNrnh3IYUoepQ9qm8tdITUGQWLM7DEM/DLMxQohFDycdfGxrea9i/9BwdZAtR
 PBvpuJZ+V8NHEuYifdborhpul8cwS7h+IggaAPXtUDBls1kzF4gGk6X72eBtcXjazb+IarPAL/3
 ABdIqM2n6PwtA1L/pljR0BQiNgroS9BkV9r8yPIKDo2NEytSA0smabUNR9WaK1R+eOCBuVWV0b3
 gayiwCgz4V36kJUXc8A==
X-Proofpoint-ORIG-GUID: C_9jDoaMiAsFAFdOwGZY_zjzai3-x0Sy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290031

On 10/29/26 3:12 AM, Haiyue Wang wrote:
> 'depends on THERMAL || THERMAL=n' is always true and is semantically a
> no-op, but it couples NEW_LEDS, which is selected here, to THERMAL and
> closes a Kconfig dependency loop. The C tools stay silent because they
> fold the always-true expression to 'y' before running dependency loop
> detection; kconfiglib, used by the Yocto kernel config audit, does not
> fold and rejects the config at parse time.
> 
> The loop is easy to expose with the in-tree tools, using the technique
> from commit b33a654a5bd6 ("drm/tiny: Kconfig: Remove always-y THERMAL
> dep. from TINYDRM_REPAPER"),
> https://git.kernel.org/linus/b33a654a5bd6: temporarily make THERMAL
> tristate so the folding stops, then any config target reports it:
> 
>   $ sed -i 's/bool "Thermal drivers"/tristate "Thermal drivers"/' \
>       drivers/thermal/Kconfig
>   $ make allnoconfig
>   error: recursive dependency detected!
> 	symbol POWER_SUPPLY is selected by HID_ASUS
> 	symbol HID_ASUS depends on LEDS_CLASS
> 	symbol LEDS_CLASS depends on NEW_LEDS
> 	symbol NEW_LEDS is selected by EC_ASUS_GLYMUR
> 	symbol EC_ASUS_GLYMUR depends on THERMAL
> 	symbol THERMAL is selected by AB8500_BM
> 	symbol AB8500_BM depends on POWER_SUPPLY
> 
> Drop the vacuous line to break the loop; the driver still builds both
> with and without THERMAL.
> 
> Fixes: db3a9dddab5f ("platform: arm64: Add a driver for the EC found on ASUS Glymur machines")
> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
> Assisted-by: LLM
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
