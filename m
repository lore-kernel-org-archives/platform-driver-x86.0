Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426524;
	b=gDapvJ5RPEmD2RkWspuiG1FuI+S/ClyJ0UzvdjAPsl+IknD+FddRqB62yTzTN/quC5m2
	 C71LLMdbE5k0lLXMOWkiMxam+/jPeMZqY1s2Db5Ze7clut9haRy7VV4FOFzy3lu62zpVy
	 UVHBeN4Y3IoDUbLjxUNp5gKMXZRDxaIcpWLagzJmfgBbBLctttDmJIwiQnjG8eTQSm1M1
	 zaYDfJZOHHAZc5OEWFgN4l/e0lcfEnhyZZ4R0QicO8C9ee4SlfE69NjxoP9mGnpG2nxb8
	 Qhs2VdBSKDk27zHqKN9H5eD+6lQp2zJq3hS+29kESD8bl0y+/ourUgez5TTZAF5XsTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=au/lqSIvjCDlFYBkZ6wmQ+r9MXW9GHZNgvB5cJ3OfOY=;
	b=Du0UmGUcLPfJvqsTMQ/4hUQi5DndLRr315k8wyuvZDECiEUUymj3eks4+b+6ylP6X/30
	 3tWMTCGRZkGQ83ieJCHa5TSASFWohZiSqJMP2gY9DZ+uGqoGdjK0JwWmuR82sEsDdKub1
	 /6HloMFuSndNRS3g1AcdjRzHoJXkMtszFBadeefKLgcc6JHyJ2UnlB7fj2n8CaMkR/nlV
	 5GVPxbXuo4WKY+4Ej0tSyhYMBtMA00I9G79XdzyRUP2DLmgKWVg2OU27uilYN/xKC2Dma
	 iXZOTpFobflvM8fVAWQxHYgPlFipm1ePsYyAjPiGPB1RhhuOEXgVXv4CNM7DseqBwSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eh6lBDN/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OI/1ZjY2";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E43606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 09:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E43606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eh6lBDN/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OI/1ZjY2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FuS91395965
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 09:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=au/lqSIvjCDlFYBkZ6wmQ+
	r9MXW9GHZNgvB5cJ3OfOY=; b=eh6lBDN/hjrP4yUwh2eoUzSJnBsJzbL2KDNu/U
	kniV1nNKl0khJB4oKRATUG822+e8uuClO/8PkC/9pXCihRWp8RarQRrOncBFYPSx
	HB8aqPIHfU4mIgcWybFW5WmOhX7lTRIGFLU/3YJPof71BBb5cvq4av4X0AeG6MnA
	/l/l7XZKcFRWruE4zTT7/xQ69J9o34wCQeGLg0nmp7PysKrG279FD8us4fFnAgxV
	zSKT6ecUuYE864q2lMOXUPoqwjkEZ0+3K1u2QLgNlru48TvDsTSqP+fG+PAXIZ7e
	10HlpmEWFIqPQ1LvaiW/zBJAXjK22e0bzrq/Qd7PFG5AIrYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx0xw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 09:35:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94970ad532bso478468485a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 01:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795426522; x=1796031322; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=au/lqSIvjCDlFYBkZ6wmQ+r9MXW9GHZNgvB5cJ3OfOY=;
        b=OI/1ZjY23x9IoopzqGY1jGeq73sGWdQ7+bCtf84KHBoYaorxs428m+So7hT0slVONF
         mj11hMRv9MKxviLMfINCP5UsaOPMwVyZHnSYPEJzt8ATaAj0SA2+twA6G6lH1wqnauH6
         4eD6gLXjA3Gxd/fh0UIKSu3J8dPiupOoFfIol37NjU9U42iYICh7aAjeJ3DGTpbpeHFM
         Eo9DwiUkiG8QcL4dR6rFSXJ+rRx8XPo0kruS07TI/w/4iUnzUU7uj1UOeFq4/WTJbeI8
         e5xeow+AHXlo4M/rxjSN0ucrdRgFRslA2zmceY/F9pUuFN56PTMzxeFHYAebn9c65Pdl
         kyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426522; x=1796031322;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=au/lqSIvjCDlFYBkZ6wmQ+r9MXW9GHZNgvB5cJ3OfOY=;
        b=BIIDyZB96NtUmIX0GKqeG9A09SZumSJLSOVFY1PwwqQZpYoOIZhYQXKjJesKom2ryx
         qEyED/h9RPZOd2u+tGLShm/3KsuqO5vsHIY0vpE8vKmp48uHqfdB/J78PciRGyesaXFb
         wOVq/xA4cy9emVvM+kmnJiKJwRM39Re1zflMyVACBnqk7n4PMjKc9aXOHzSl5xpsks1L
         rpw751yXPlEnv8FXtb1/Dh8fOaBP+v1SKkH+7yiBEhKqoDO1EdDRJD5Rxo2aEfuybZ60
         0CYgsXPmfkq1n+gDvhwZ7T0lz0uewvhYvlRYWydPnbbmdt/xzlCZ7WSh2Pf4AggFItQE
         YQpQ==
X-Forwarded-Encrypted: i=1; AL+hErFrwGvCEsTqmN0fOM/q60+NZXU5FCV9hjTKXP+5iwv8RDficiyhEBHKpCxaxyOpbAjD4DMFmYrcVMygpDxb+6G/z8Yp@vger.kernel.org
X-Gm-Message-State: APuU4Z+scHFkm9mLhWiyK2mm8x4MAEUGbH4CgRj4LD3JFFOa4bmStwzT
	fBdAglgcfQl9RsQ5Nyd3kqIC0bVpdMZ+gziErWCpwyrwaH40nUkHNt4bwmCArbHZYLDE8yHqLv4
	dCTnfr6ifyPg/xqJZ7at4gUeSMK+YfBN4YmTLnZRMNXN7y/UZ2LukvkZoPJwZmyXSLJ62kW67Ay
	bz
X-Gm-Gg: AZFdTZeVF+OUKGOV6kQ9yekk3uhS0LdQJS5C193XtC5PH2W9GghfDcsdD/dxtk2P/OG
	PcSOrU7cC1YhMAQZsYTYoRtfQJJu2CO/lziAZYNteEW53V1xvaFhMJcEQ4y3LqhkA7+3avCqA1a
	sfFVg8CCQuGQyC1ZLWVyKz0iIm+XSDZv0DjFmTBnLqyxfq5eZsv45wHEXaAPFClUjUyg3lJ0yS+
	JRAayxppP/+TNsEMMnFjpH+4CRc1J6OzsfsJ2HNzXBaIU9JRZNbOFgAMaZ88qVX8lSuSqx1n5kU
	dq42YLwnLRAlKhkfmDx4fH5JOutMmxLRUnbXcm2b5OuRPNvHJ5MBhkpwSKes47cMBoMv9m6FDc6
	OXdtBGRySQsbiNMf2tRD5ezuNrwSd9tENTgGyDtVGzIeAK1mELQHdTH7U/Q==
X-Received: by 2002:a05:620a:bd3:b0:93c:6417:f9c8 with SMTP id af79cd13be357-949ba9b3e00mr1900373385a.29.1795426522159;
        Mon, 23 Nov 2026 01:35:22 -0800 (PST)
X-Received: by 2002:a05:620a:bd3:b0:93c:6417:f9c8 with SMTP id af79cd13be357-949ba9b3e00mr1900368985a.29.1795426521455;
        Mon, 23 Nov 2026 01:35:21 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm123208315e9.4.2026.11.23.01.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:35:20 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/4] platform: arm64: lenovo-thinkpad-t14s: Add support
 for the Gen 7 EC
Date: Mon, 23 Nov 2026 11:35:13 +0200
Message-Id: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANEIBGsC/1WNQQ6CMBREr0L+2pK2ViqsvIdhUcoHaoRqPxAN4
 e4WjAs3k7xk5s0ChMEhQZEsEHB25PwQQR4SsJ0ZWmSujgySy0wInrFRKGItDpqhZTLXp/xY1YY
 3FuLkEbBxr113Lb9MU3VDO26OrdE5Gn1473+z2Ho/tf5Xz4Jx1ihzxtoYq5S+eKL0OZm79X2fx
 oByXdcPQF2M5MEAAAA=
X-Change-ID: 20261106-t14s-gen7-ec-297593bda0fc
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2910;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=blI6AwuqcaJ2elfDvzAakaLljojAtt1Pz/ZlSN3Mziw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBAjS5xxW3Ev8QtMtb8W3cIPQYDZX0CxhyqkU/
 DKUW1UeCHyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawQI0gAKCRAbX0TJAJUV
 Vo7xD/wOevjc+K049UslrZSx2p9bbI5v9Z9GkeHR0RsaA1cq4pk495alAZlD8e42RAHE4jU9Jmn
 euBGuwxGG0oVPp0h9q4brMlVX83be5W9qdP+Jh5Gt5mW6+GBV+6cAXIFfMRxZLbUKv3hNALbReB
 wz3WQNZfEJbBFRvgYmGQqtuQ2g3+JW6Tv3z8rHr1n2bcvYH5+Kywrw+R5clVDkdbXGLaQ+f6SBk
 zf/TBvLmiGTvuFLfBnjdxhQj2s75WqIX4oDrOsVPp4Dj/hnYsgrnJm7ElkwKYuLroUPncn2i1wF
 VPMkGveouIhzRk/+lWoWmHHFqfzPlUTvuIll02rf7LQPcxsBAG2DdYXmMN+a0aCJTBlHQdKX42c
 D2RaX2MtAh2HbdYyIE9bq0nciKD3AOR1sqTg2ia77oAuE1fCFS5chagQNXhQM96GVGjJBy2nAC3
 t51/+eFFGJ599p4cowhrN1iyIyEy5csd5F/fbXv0slFDMU7F0E5oYWxEtIhW4Js/MxtJ/JERs31
 zzk9TyY84KFf/pBn/aPOvotltcwU5cIMrm676KBRjIGQ+8xuLjAdNoNgi0qf/33eVekoB2jese7
 m2QUP2JZhvx0fSkMXdJ9gNnb4nd7RXLagVCNCabDE4bweBeH6OqmSKIS67bZeq5G2pD+8G1grO4
 ka0GZRhBRF0z/Qg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b0408db cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=L8UcFDWDmyMNVybWMAcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: HqNJOtuhSTFOs27BJ9_R7hYC4ZTkNaT1
X-Proofpoint-GUID: HqNJOtuhSTFOs27BJ9_R7hYC4ZTkNaT1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNyBTYWx0ZWRfX2Bkma3H3stkm
 gLFw5IPxu03m/vE/qm3V6s/7crHyeQWJn7Nnm9yuJDlewc6JYiduhVBPQqan/o6E++90T0+ljcI
 usMhagUkIO4QvYvmPYTwlJXgXuSIM2I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNyBTYWx0ZWRfXyWmlxVy6okHI
 plM+rKufJ8H10+A/HJkiieTI7YiJ4B6M+ZQ6/AxrU4s0iD+eHYgXJnuNnxUlmqy3unIZ12++qsz
 UPQJtSqZ40So81N/zBj8RG+C1hvMPXpWr6PxcfO8ygWH0zHJnZ5W095Mku8H15trcaDrUt7xKef
 rs/kfn3cOde8JXWc3qOmT9P05xezYanP+0aMKDfG8klgeyTZkuvS9Ue3SK4ARl4a/Rc4nUNd4sD
 fGtfRCzJotu6lBTD8+xLJ8PHcuKo4L2gplPZt77nZ7j6X9/LmlVuojmmfLSVyElFH2OpZm/+tUn
 wcrs8XHQC44lrIcNG3fLPa0yLiWclCec+ndkN00lk92YRGYhqgsqkVdmmWKVzzd/RE0PgR6/TXs
 S6tbXERYNBeNEQ1Al6LBNhFlu4t8XS6x0ir/W/lti2VE1uR+30xMybW4RxvTv4WSdSHvGFrcU/f
 PrW3tlXEv61InT0Z94A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230037

The Lenovo ThinkPad T14s Gen 7 (Snapdragon X2, Mahua) has an embedded
controller at the same I2C address as the Gen 6 one, with the same
register layout and event codes, but it speaks a different command
protocol over I2C. With the existing driver the EC never reports any
event and the LED and keyboard backlight writes have no effect.

The Gen 7 protocol is taken from the ACPI EC accessors in the Gen 7
firmware (RDEC, WREC and QEVT): reads, writes and event reads use the
0x80, 0x81 and 0x84 commands. The firmware also describes the EC
interrupt as edge triggered, active low.

Patch 1 adds a Gen 7 compatible to the binding, patch 2 adds the Gen 7
variant to the driver, patch 3 sorts the TLMM states of the T14s Gen 7
by pin number and patch 4 describes the EC on the T14s Gen 7.

Tested on a ThinkPad T14s Gen 7 (LCD): the hotkeys handled by the EC
(mic mute, F10, F12) are reported, the duplicate EC events of the
volume and mute keys are ignored, the mic mute, speaker mute and lid
logo LEDs (including the hardware blinking) and the keyboard backlight
work, and Fn+Space changes are reported through the LED class.

Prepared with help from an LLM-based assistant.

---
Changes in v2:
- Patch 1: pick up Krzysztof's R-b.
- Squashed in Hans' fixups for patch 2 (added his Co-developed-by and
  Signed-off-by):
  - Gen 7 suspend/resume: set bit 5 of register 0xcf and make the
    power and lid logo LEDs glow while suspended
  - report Fn+F12 (event 0x19) as KEY_BOOKMARKS
  - ignore the EC events of hotkeys which also come in through the
    I2C-HID keyboard
  - check the variant directly instead of the two feature bools
  - lock the I2C bus around the Gen 7 reads instead of a driver mutex
    and drop the 5 ms delay between the transfers
- Patch 2: return -EIO instead of EIO on a short read.
- Patch 2: reword the commit message to match the above.
- New patch 3 sorting the TLMM states by pin number (Konrad).
- Patch 4: place the EC pin state by pin number and pick up Konrad's
  R-b.
- Link to v1: https://patch.msgid.link/20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com

---
Abel Vesa (4):
      dt-bindings: embedded-controller: lenovo,thinkpad-t14s-ec: Add Gen 7 support
      platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC support
      arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Sort the TLMM states by pin number
      arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Describe the Embedded Controller

 .../lenovo,thinkpad-t14s-ec.yaml                   |   4 +-
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 126 +++++++------
 drivers/platform/arm64/lenovo-thinkpad-t14s.c      | 197 +++++++++++++++++++--
 3 files changed, 264 insertions(+), 63 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-t14s-gen7-ec-297593bda0fc

Best regards,
--  

Abel

