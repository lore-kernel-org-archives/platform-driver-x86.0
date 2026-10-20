Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792534106;
	b=3+zO9H9ZfabJGAk2VXoca4CuBVH8Oz129zzJB9MxJMb5BSuR5Jxyny/MIoDoxuyFB0Ov
	 b/XKvClq/Fa51wgeRoeZw6iEySowEoz7b6FIjLnXSSl4bwZfPGC3A8vnpQPaxHuBPqVEg
	 gcJ4R6rm8PeM/ht469x0jmLECMKfHsl6IqPzcTjMzqvl56YV5X4eTIAQ/qjA2uTNZgDXW
	 1lQuWWvea0hV92B3/VOTFdzk04m2tGvY+Mihwh/4j0BDVnW24phTfbLu8i2bFHAqNA+UV
	 LzRDejBwpMiM0ysebbYBEdNL1W/FM9E0OsZbjCztO2Md0zPBi3YS80KcuvS8yzzo6rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792534106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
	b=Aw20qVh+UwpL0KIFjHTLwGP9wEDOPolyID7rqtBuOCg1TuP2q9aP284J/45FbJLtqwG0
	 JlgxqKPNAwZ12WOZKHowGUB3uDVBbCieUAQsUsSh+2TZgMrS2zKlPpWuoCiLzZUxCIShP
	 WLFdq7d3f3Ex5tMY5JJyyrLcC4O+qStakyPbKal2sSqi97NwJiYnYBxDDc+vZf3gqoueh
	 XEG6FjqVoIP7z4KcM4wU7b3vC9OSFZJ4hPpOO3Kd/MMvWC+402yC5YkJHkPJIA0pF3JEM
	 5/m3IdQCMpf6Px0XcCW3f1PutI8q5ThJr6snNlyAqxWefJp3RK66SaT8Hh+8qeEdiZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YlaRjfcq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VYJvx1au;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F4C606A31D
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 22:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98F4C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YlaRjfcq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VYJvx1au
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKteHT3856190
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 22:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=; b=YlaRjfcqXcboaVER
	1sRzZAh0HZmehbrFy3UhCVu3vYTichraLfUUhymZp7bS8WmM+1ILHlTWUJND9zH1
	molG1kOsh5qZXu4oWndIDWnLZYCKH5bhpLi6x7KTJOgQfqirofxKnQIxaeQxDMmZ
	T1ptdo6i4RT/9PpAHw8RWDrJA1UBA93lUQ6EvzTa/qWKVJrPqHe/hpRFmntVORul
	huURSP231+POlZc8B4gHgfOJibHq2Z+pltWIDWIcz0cUfyUsdLmvtm8pRMYXLrF4
	VPqplyftx/lioIukz+3RRBitIdinjEeC4elRpAXXTxtCIBRQwUlcOeoAROSmvKWV
	sCuQtQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabgt7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 22:08:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso808705ad.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 15:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792534104; cv=none;
        d=google.com; s=arc-20260327;
        b=jAS74/SSmAhtjNcw98IXH5VRulvPUn86zGTqoLZ61T2rpu1QVXBXX0ObG5eUfEZvMb
         Q7080VSNB0d9EbbXUSv1rf6V5EgpkWUIFP3/TebyRSq8N1w/3uf3OPHwuFOcXCKC8e1M
         FLkM7g2lFod7i/Y0sT112gaU6k7ZCndIZxkF4+ehgb81k4Hcd8cle7YqVe9HTgAa4jvz
         1C9JtLPgzsd0Du396nsqQVEvbgwXnV7l8lfCEbYKFWbA1bVFX0FU1xaOuz2OT8FjapP7
         QrIH7EACBY7V3RVIcxwziOvp3m8BYX2UK8W2DBkD9areK8NJb+bHjjCA5+8swySQ+1YA
         P6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        fh=hgwpDZf94PHNTClBp/2iL9Q+VhsumfvyUHFVy5hce1o=;
        b=JyiKiVAQc6DettdXRLXoSCjdIf3MrBD5ugTRE8o65WOyP/pTNNXPidgvAjcU1GyVmm
         QM96KEThyMEYWfUWKYBz+ARnrnEB5wSc5O38O3x0NXdoc/clbN92glI2jVqsJn/Wkp0I
         jI7Nh/gpj5zL9vzCylza1XIOlgRmp6KtZ5G34tLunDX/tTwDz6qqVjdoeRhhC27fEzpM
         wNYj/BvdvRwb143fLCzIPreGmi9gBk28knWio2YCuYi/9LFjzWbKk4ZJ23+61H3MIgH6
         41Oz1/hxxt7XZRLjZTlHQjPuyhVwGnQHd3ERVAjfTDv+M5crI+dDnTAozCPhQ5VLDvr2
         IILw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792534104; x=1793138904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        b=VYJvx1auuDRH2wVC08tOG9Z20YTD5JPjYHPtr69HH03y8NFtkUZcpGNLud3yPWIP1u
         miaymRq2HtxRfK6hs/X4WIkzzAYxIt59HyXwmDxmKCJlrES/2eqUjmZp4gjJXWFkTRl7
         U9p0gygH9rfH/75K96YMOdfoTuHvwtYJnj3rEFlfT4os85Vjb+hPG+qrDGs6u4Relznb
         tKnrZ0kK9mQmeSZtDJLi423qdZ8CuVYqdOIHalNpruqMDr1Ji//ryJZKdzwhsGDwbmfE
         IeEt2OKM/hBAcXFo0hZ1cSjnp0iPm1TUBzAgiqHOeqwkrjIMMMTeilnuummXGM4wtwqj
         t89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792534104; x=1793138904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        b=ndAX5d0FAMyh/IaniG+n4kOsnDDjwSbNkmquZVkvY2Xgjjtw9IR3kLTqGNqiTq1v7+
         dS/LfsTneYEdJ7ThfpfBmyiphvnOSJihhDEl/XGD1/TVaUYkntjJK96nwh40fciWuaF2
         71DmaSUzkd/0DpD5+s0s66/nhkvwujeng1UC+oi+RkkKtM9CymZ4MbpdvCoKTTZ/TLsG
         9kWOrMDt2ilKC6PL085iBIGKw5M38e1g4+M4zz6mVuufRdC/4H+bJfJSXIx2OpReRW3u
         CYy8MCjaJ4vamE+xPsFPNZztADyKCeND6V9wHdMnDJF7vk1ozQKYqeTikfABzLJ+ryhe
         F9Tg==
X-Forwarded-Encrypted: i=1; AKwUvBxV7LHIFtKBEN9uOmNT7TonoERHQJcRp9n5hAKMzlVIrOrQRWdsrjHBOUIMc/4uuD9ODnfDxY3TNdoqen92eaBbrs57@vger.kernel.org
X-Gm-Message-State: AFq9FYL/O3WfJHFkZPcBqV9xV3qlyInCYP9D029Mgl61c8DYfZHNlFbu
	4mwfn8evgdQNK18bK01zCmbL8hN7FdWmhDbltP1qJ8Sgzc7aUR9W1EmEzPZuB3hfc1KDUJmNcap
	6grQ5QGkYG8OjyAj+2AQG7QmWrou/o2zojvMS2T6NnNQNubm4NmkwBPvgIT/dF19IfgLQgpMo5+
	7ILLtneVfGLQWar6jqSX1z08ImFE3ylDvkZIpaWy6ygj1lxvatstg=
X-Gm-Gg: AYBFou041NUvw6hWGEXpDZZQQCJg8VA+TbGg6sAY6OH/VHUDn1uH6zm8oDKoI6/IxWs
	xfuduKjvFvyEdtaamm7Sxz+dB+BT0a37ucYXqe0FqBpaGG4YSbZihJT974M8j3m13VoEvbSW1Rp
	DlKtlDe7JcIj/oQpBuRYVJmfIZhOa33nca3azY+F4cdPUbihXz5pWBWPhCSayLZO4ZdAWrgQWsU
	JuXokXh7XyfJ/te/58wqNcFItjdH9FYZR1D4Awt0npSi04=
X-Received: by 2002:a17:903:1b4d:b0:2e6:dcce:8222 with SMTP id d9443c01a7336-2ea43cf0d3fmr947235ad.57.1792534104145;
        Tue, 20 Oct 2026 15:08:24 -0700 (PDT)
X-Received: by 2002:a17:903:1b4d:b0:2e6:dcce:8222 with SMTP id
 d9443c01a7336-2ea43cf0d3fmr946955ad.57.1792534103541; Tue, 20 Oct 2026
 15:08:23 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
In-Reply-To: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
From: Loic Minier <loic.minier@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 00:08:11 +0200
X-Gm-Features: AclHuK8EIJ8ZjWBQ6mFXW1Y_Kcn10ejjzpfnSn9R3N6EwnixFcyxmqimJkA2vVk
Message-ID: <CAAwKf-ftxr5fw+1Jkz17YCROjDB1G+7aEZnDyD-zs_d_OrWJJQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Asus Zenbook A16/A14 (UX3607OA/UX3407NA) EC driver
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4OCBTYWx0ZWRfX7CIhMXWDxnyI
 cxyB6Xw9qisAsPkUbmmEwyHK7KLGaB3OpPsxSC1U6kM+2oa44iNSiYF11NEif7sRBM1HZX7lw8R
 c+1KW3mh0sCXotOnnqIjmmcJWt/a2o4=
X-Proofpoint-ORIG-GUID: FAgNXIpVY-6MLsSw20MjKKu3GCQnyfLS
X-Proofpoint-GUID: FAgNXIpVY-6MLsSw20MjKKu3GCQnyfLS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4OCBTYWx0ZWRfX8a20sroYw7Ud
 OylB9gPT3xV1HUIY+XRZTnU5XpZPYNrQ5RRremGDbc0VNeMfHr5CkNcfypbW0Ir2hPzcOLSKhBK
 hrnd4G1zL1vjULme+eFN+ymHwSbx/alW+jlS3v9hesRox8VxJ5+x3p5K8V0jiXaCRooymru+9Bd
 gfc2RhNMLt4Sx+Rxs8g1Id9JDC51ccrArzQee2Alac7ZaFjUVOEUfo5qzlp1PVXsLdGq5/LAbR3
 gn8kCesjiai4Dr07l/SZQvOqw9JOFnA6nBEP9NzYNG5P0xKncUFH8zmJ2Z2upvFh0iuqX1Cc9rA
 4b9ov1fGaI7oOdWdaEIFSXsMNi4tX18Z0pK3TltJNb3EBOg+FVrp9kAgm/KeyoieZ0jgDDbEglu
 JEcRVFmXt0TFBpg+gcsvg4ts45udpix72mJlUnH/wQuzgY62ymg4PRr3miAexq82357V+2WpQz5
 4Q5Fja4xw2eLsvB98ZA==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad7e658 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=bO4u5d9499Dzb9AJ53AA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200088

Hi

On Thu, 15 Oct 2026 at 10:59, Konrad Dybcio <konradybcio@kernel.org> wrote:
> The Snapdragon X2 series-based Zenbooks come with a bespoke embedded
> controller firmware [...]

Tested on Zenbook A14 UX3407NA: hwmon temps/fans update with a
stress-ng load, keyboard backlight levels 0-3 work from GNOME/sysfs,
suspend/resume works.

Tested-by: Lo=C3=AFc Minier <loic.minier@oss.qualcomm.com>

Thanks!
- Lo=C3=AFc
