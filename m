Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491134;
	b=2uP2tQIDsVMO0b5UQD69lBxv+ecgvyntNtbKvkWLkFgp9nR2JzzdnhZtFmpMskVj8WSY
	 vt2gk8YCALbl7H5x0vIggplAC9+qOZHKMGFRJfplCKKvlylGXZGm9+lRXl4nW2BWAEaeF
	 2zcVvPG3HiVniKGZZmK1qCrjznXHW4JGRmWxvVQp2yDP06Kt/ELHy94oeOA4hMBvqHhb1
	 pSvlcGwWzLjHwdFuf8kaZ0vwI47gPeF0ccadmd3ZNYRUfAeKtmJYo48U/nmCpPlSgEuBF
	 C9ueE5SDnx5IvvssOrfiHA/Dr5oqFROyOmRXS/DdsWoOoP6LgPeJIaIfIE2QvSBGJDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SSHTQa6HyakUeWII5QwTPdRVYIzIGg3+WldbvYwS3KY=;
	b=pMc8xk+u7XwuL4IhBmHT8MqO0TFwtVpwj8GIAMFH3nAxg//EgTNkhfT93aMC2r8rP/Oe
	 c7coOVXfPiDJi67kX383t0vTZ9I+IkBg5Q+QHAPw06dOFtAKkL4+4TrLIXxqsA+8HS4Tk
	 oletlV9hJ7VTM5pd9vnXZezytIM9wYtNia8guNHu7PymSnAGBPHorVs4Km9b/fFQxTnWk
	 fokokrRpBGgljvtL/L3VaIZ7jtBLca/ySL840f8ZPp+oDMdmKm4rtJTv2kYDMzfCTiNJo
	 j/SFQg8b8Us3w2RdtDBFH6Djx+13PJrQYOZJzoLfv+Co1DfA+3YlcpG26IjMyh6P3Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nj4sXmSj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQan9dsG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70789606A323
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 13:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70789606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nj4sXmSj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQan9dsG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9L05S2514150
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 13:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSHTQa6HyakUeWII5QwTPdRVYIzIGg3+WldbvYwS3KY=; b=nj4sXmSjUAISGVD3
	5Nk0C06mgyyX4VE8uX40/BJCKpM4N16OAs60W/ZAciCWNlW8cAl1QpqJku3wdRCV
	jaNVGAOdjUUuQpR10aejveIzpUJQT8PBymo85eWtuqEUSeglS/Ms/z0SMigMOvNl
	vybNoXozdjlLrX10l5rJnPCv5vJks/LYxee96DMVmZnfQahU52gzDBLnbQdDl0Bu
	EnJ6pL/itJt4UalizLpynU+e8qTybWcuImpuOSrEEm+m32VNnSvU1VLNYmP1O1R5
	Ryz9lNmA71g14b97fB5GrZ+mqqmtJzyhxWcN9WYaHvzmRgvHD5GnqCGPb9U9rb6w
	tUNblQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1ut47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 13:45:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f559420f3so512546085a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 05:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794491133; x=1795095933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSHTQa6HyakUeWII5QwTPdRVYIzIGg3+WldbvYwS3KY=;
        b=jQan9dsGKzZYYoQRa9U+IO7oLFWgzRMazYZTjkZoyVi8kFGfY8/D92E9jk7H30UXod
         DxsaEhHsXOanbgur1i1EPGv4ClXMWW7zxjXYjjedPDU53JA5j+UYgPzqitvulSqBSGoe
         jVbWfgq/Hce592/YDjC3N/4QqoOLwWlTk/GRhfJiZcACWntOa1ZISdCWHLyMaN9eEaue
         diproXsnxrLZrJkt/MSMdla/tEK8tzg/w1LrZJIPt0eOJgU8GaJh6r/vtD11ZPzFGa/l
         lhZpcbzqUv/xz3/S0mihKhafoacwVrECrArIWLkFSOTQU3NhdFUkfcURdi9B9ApJJgMr
         CT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491133; x=1795095933;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSHTQa6HyakUeWII5QwTPdRVYIzIGg3+WldbvYwS3KY=;
        b=rw3zqcYnvXvg4PTHHF4XBEl8qrxpxEKMv1VRlX8A890XlEk106kYpd3HviaIWa9DdI
         EiExmvHexzGLSSHEDTgcKxbnKSMGl/YzV+f7gD1jgfq+1+NKnNN9uApwz4X5qdav0k7n
         3KfHYv1h1DGd+njwpFU4cuV4UkY6b5CDx70X++I1O/TxP0I3B0uvkLe4pNJWee9MG+TW
         c9JlWli6wzd/689Cqg5kokerUKuZPNjezyRSAPdqbSqMVxBmtma+VBjXkd6zUKC2AmyN
         S80YRxnjPsOAX9oCdazHa7mSoHW52MuQTDuXOo+uknim1wf1U8SZBypGAsfnU8vbbZYP
         jlzg==
X-Forwarded-Encrypted: i=1; AL+hErFRDCl4XHDiSvk+SXiDpgfoCZjlzOGO9gQAsLRhq8QMOzvJCwMZfGSsU6WFpr8ZbtVTKLAeIangSvcaTgqtloFOFccm@vger.kernel.org
X-Gm-Message-State: APuU4Z8ejAI1tA9CoyNZ8Hn9CoHkTdYq51Dkv34QVH/t9GQYfzJwLboX
	dVcTI27ScE09gy7ZMPwdEuSEt4RCBUNdGoMacu/dYN2OQtjX+3NTB8aTyu+AyUB2OfGuEvNcqoI
	0SeC0kK1QbPr3rd7gxHz07VeiFjY4eMzVb+GYMlr67byMc9SIncj8rcgON4IJ1zoiN5LOtMH5Co
	RV
X-Gm-Gg: AYBFou09h4D7EFYBIpuVTAAUuwrODhtBCwf8yDJPPSp1oXwQ9SGrbFFzGJTDHILsxr3
	vznk84datqbJIM1gu15QKjzGmAcuc8h7sGYIJpB4+gg/EUX7LIJeLSKrf/2i8BJAIrQOJHudn7f
	ZfyLcatJwVO3PBzXz6t5VJJwudTc1dCAiz4FNDBzf/5LRokBZMdJ24cVCRgPjFCg6xIt11F9wwE
	2IoCVgEmFBMY9gAfcuBYvCmkqIDXmV14ILI1XVlg7fBNB3ACvoA2gHxPfS1vxKY3lSXlNwZvrpM
	/eAdpQFENhlhFzwZAwEpxoXvG8C9qjRXSYl4XDBCQZZaujJhtazjG56so/QKXLyPfR6yVix0X0Q
	M+plMp4ZyWYZ2B3M2xjjT9Lgqrm06UlUIa2ZIn6oEsLAa1Wlub1d/obucf4Rlik66r2kRUE8i7S
	OkIPphN61tD6nWZFExMHqrQmGh3QQMXPGsUM5HDNRr92upM/etDy4qusgvbWiao6d0PxzfParnf
	wjWtC18Bw6t75G+LvSpXUYs60CE7BqMPrOUlTFiGhA=
X-Received: by 2002:a05:620a:2b46:b0:93a:2611:270f with SMTP id af79cd13be357-947aff88b4bmr1027606485a.13.1794491132583;
        Thu, 12 Nov 2026 05:45:32 -0800 (PST)
X-Received: by 2002:a05:620a:2b46:b0:93a:2611:270f with SMTP id af79cd13be357-947aff88b4bmr1027599685a.13.1794491132056;
        Thu, 12 Nov 2026 05:45:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a62b303sm342113466b.58.2026.11.12.05.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:45:30 -0800 (PST)
Message-ID: <993586ff-a618-4a92-b95a-552e2ba268f4@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:45:29 +0100
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
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] platform/wmi: Allow wmi module to load when acpi_disabled
 is set
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Han Gao
 <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20261111131613.6290-1-johannes.goede@oss.qualcomm.com>
 <8382881b-f2d4-7909-d7d1-3a2c74f3b123@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <8382881b-f2d4-7909-d7d1-3a2c74f3b123@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af5c2fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=j-yhcRukXSKXep7fvDIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: vMV6Q8qns7zOAfYCZgCSFEwX-QkvH8lA
X-Proofpoint-ORIG-GUID: vMV6Q8qns7zOAfYCZgCSFEwX-QkvH8lA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX5YEqZ7SsaWLm
 83Pmw2/eohCsFp3Tnf6WTDh1Hh0TaWtsRtR3P3dHiAXQQw3fAeWHVJdPFnhjLysIt3nqiQta671
 w8KcoNYntA84bb+q1fhqynl52ps6jtjK7WteBYgD6K3lCI+RjTSCkSjSWsOWxRn6OVPAK4XD5On
 cYr+El0EhE9gEDOZ2u4naX32+3goczF1cu3sdWbIo8tgWCXyBqXrAbvWE0y+YnCZGbtdcZJXpY1
 ffEinqUTyk0NFPBqXkh8pHxslGcJOqkYwSZbwXsIOYSBWW/mf/INnYIf8EwVI0KIE0VPBPBhkIv
 2kRuWt68eThVxEXsF/PchsBcUKZfGBKcWmdv+fKhMt2/Sgs9FGP5llU30D+XAs3aP0svuT9qJNK
 cHolF9JKM0KF+OKyhARgu920/PGoSD23ZsT5XvHgEwwPooq9LG3uYsPSE+2Ndsl0wW3SkEMryIF
 N7tb2tGnh+gPcYjZ6YQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX5GDMJqYr5Ldw
 2jhUUGRCB634kogczS6PLnBh8v7aHqipzuPdQVUauwRQ9Qj4SdHAOGYLbh153OK3ZO+iZirvOlR
 fch6C0vuOK7cwrk+T7q/OOeE7i/EyFM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120054

Hi,

On 12-Nov-26 11:21, Ilpo Järvinen wrote:
> On Wed, 11 Nov 2026, Hans de Goede wrote:
> 
>> The core wmi module provides symbols which may be used by other modules.
>> These other modules may still function when acpi_disabled is set, but
>> the current behavior of acpi_wmi_init() returning -ENODEV when it is set
>> causes loading these modules to fail because the wmi module these depend
>> on fails to load with -ENODEV.
>>
>> One example of this is booting a kernel with both DT and ACPI/WMI support
>> on an arm64 systems with devicetree which will lead to acpi_disabled being
>> set. Trying to load the amdgpu module will fail in this case because it
>> uses symbols from the drivers/acpi/video module which in turn uses symbols
>> from the wmi module. Note the video module itself already contains handling
>> to still load when acpi_disables is set for similar reasons.
>>
>> Fix this by allowing the wmi module to still load and also register
>> the class and bus instances since some exported functions like
>> wmi_driver_register() rely on these being valid.
>>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> No Fixes tag?
> 
> Doesn't this fix a real issue and we want this go through the fixes 
> branch?

This problem of the GPU-driver -> drivers/acpi/video.ko -> wmi.ko
dep-chain breaking loading GPU drivers when acpi_disabled is set
stems in essence from:

fe7aebb40d42 ("ACPI: video: Add Nvidia WMI EC brightness control detection (v3)")

which introduces the drivers/acpi/video.ko -> wmi.ko dependency.

But that is from 2022 and was never a problem before, since booting
any modern x86 hw with acpi_disabled is not really realistic.

acpi_disabled however does get set on arm64 hw when booting
a machine with devicetree on a kernel which can handle both
devicetree as well as ACPI. So the real trigger for this being
a problem now is:

e2c1b56f3dfa ("platform/x86: wmi: Move WMI core code into a separate directory")

which allows this dep chain to now also happen on arm64.

I'll send a v2 with Armin's Reviewed-by and this as fixes tag.

Regards,

Hans



