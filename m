Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D8B320A33
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404227; cv=none; b=lzyPIJXYa5BGL0KFS/Tg5Qdx+5EtPbhOC6CFo6PQoClkmFauxrAOnyGarX5MlP+t9JNABzuDyr8Y8wqxr9+y82ACgjxdhCGt/FT//RfkFWhCO5akWohpPCw+NEZWI6huHRxHR4sonkI39kFD1ppPwNmk5AOrSSWCrOHY8pwmf3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404227; c=relaxed/simple;
	bh=t8MZQ/ZZEwlyiwhBvjBltm4YE5vk7TMCaSJCZpqS7hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxeQYRBpzqM2kasdbKzwcnMlyEIQ/W0iDFw3o83G3pt8lUo/FQKInx/JMzKPt2Ig8+Px77ltheBVP/Zgf75nIHr2zh0JgF6LX26aUZYT0AUb5Nc0gKQGhZN2KcnmklojHUYRmdK787PGu+qoRvt2FIUDH8Xpjy3nxOTJvkE6rRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTY2qGB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LV063I2p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTY2qGB0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LV063I2p"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HKX0P83694037
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 08:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D11DLbhgRQAYOxcXhcBA1YEKOPZKFRqaz0G263o14M4=; b=lTY2qGB0pm8qVZ7D
	Fqgvtie5yySSJlMnMA8Bwje+H/xaeXNYaeEFVN6n740mGv+fNlohPt2hSbBEy+Km
	B6QQ3OxcekZXYLHYAyfY9lqvRfNln4zc59SOxgdTrm+YaLlqie/2DZ2ITya7dJgm
	TyV/QxY891Q3KN1SIC7WxadItCfNKd0XzFYkssvECN6wzJ3utH4ZADZ7XpzH4z3b
	KjO9HhGBNeexDhVBLcl0Y6f8ldvr2zWAiOR3MqZLVTsKPbhvPsoS9jyZ2o4bTaXp
	iWrQAH70QRRh/gs+yMneXHPZhHn5wRUSN86KPSWxfMIXg+k/nhlgRS0D+0Ylap6n
	wuJoVg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyfb1nm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 08:43:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506a07740bdso787795741cf.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 00:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771404224; x=1772009024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D11DLbhgRQAYOxcXhcBA1YEKOPZKFRqaz0G263o14M4=;
        b=LV063I2p0LlYz/eqwKEbSZ6iCVslTNfnUjoozxj4OzMNuAUsB4yFhjz9nSgTKub2+w
         aBCbzw6L2o2xVXs4XlOp2GOPCf+jmSjRAFF4b0BUoghdFxw7RLOCVuL3+d499ZFoQExP
         m7LHU/Nq1T8i0T1wqEVjZ3eRCNvWSwvuxzU/pTSQO3XluMVB+2YW3BEQ8//OK1Bf0bPt
         mpCLYLaA1f3q0hEMSQGvnkEGhXCEm1er2Tru/k0K/ZzdQYmbYi3yg6607gYKaTQAXO+t
         fmY7nKgyx4l7U/zoZ6FnVHZIw2Ql7B7DGktWkA65/H2iuwlS7oWe4wacWgBD5LGlRFzs
         NI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404224; x=1772009024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D11DLbhgRQAYOxcXhcBA1YEKOPZKFRqaz0G263o14M4=;
        b=jo1kupMPMJIhh7nEIq5/2mb9Uy91gt+pBgB/YItrmK2CyRWuuu4jd0pi5PGxN0Yqu2
         iKKpx1cova/fWM51WkyVE7wPpILiissvXN0ElAseBw3RmIcCxR+xUK8JL6b4cAwub/X8
         FHNgqCbD/8f4h3O+fkj0qInYIEICuL9FxlRRRThWxKxF1C81WffuefzORcHW6024Jdvu
         0nUA/nnjIEWZeFgIwnsp0UPoioJjkXZLQMWbOXShj5KP5MClAqmKQXW+Gpu1peZZVzpK
         Dl8dtPaeMHYh4nJCduM7MeYiFYLZVRjuJlEueJumN/o8YZLUo+iIHdkGX1kHEdHXl1P+
         L1zw==
X-Forwarded-Encrypted: i=1; AJvYcCVKKKL9yVX+j5uaXB4Cz7G9aeSrlk9WNEQWvVw+ze2v/A03P/d9ynwCRRGtk/xdpC2270/HlN00anWceXGddym6lB0F@vger.kernel.org
X-Gm-Message-State: AOJu0YyeggK38vC4uoQscFO855IT2lZgTf6xLlsWEHa0oL4W5/a6WNJF
	Eaqks7x2Md6qiNTYRbFsXtt+66qCsZi7cBU05iu8x+sCmE6j3+7OA8Q+istaqC7kMuE9Chet56w
	BijzsEjKoY8qon/zyeoms5F2nutlwLcpOTVB33fWi1Xi4J1XOF2gSi790NPLbFjHqCRf53Zp5pP
	XM
X-Gm-Gg: AZuq6aIgjFh2EjIqyKMGZXk09Yk6/GUSiL+C031115oVSfDs6Bq1SBu+GUtb9i4exgF
	i2KRza37hIYXpUcaSzkOgzQzOcAlYnXvtCoobJuBEPUnv1Bzn02o69hcHNeTp8pqv4379zeeBAQ
	9+4Hooq0Jn/wgNVGVpNDD2+UfTzRp+bs1fhnL99oQDzAO+6FimAAEyy0hJQ5HgZ8hFzuOX2wRM6
	dvA8YeSHD1cNb+kMSCKrAQwicfo04kagaU02WHVUUdeMietE6rTKcbNfuh7bwr5YbMB/+R4Hq2A
	MbuYslGM8Zh4W/4c41Od6F2II6vPcwK1clVwugVOwO9UHBWJ9CtmEGV5eEs8Y/pN8keZ+VKeFX8
	bC1Fg5KdqC8SartuMexbQaFl/slu7dmVNIXydYbIauhnr3bjZaI8=
X-Received: by 2002:a05:620a:2683:b0:8ca:55:ac72 with SMTP id af79cd13be357-8cb4c024fbamr1719913785a.61.1771404224352;
        Wed, 18 Feb 2026 00:43:44 -0800 (PST)
X-Received: by 2002:a05:620a:2683:b0:8ca:55:ac72 with SMTP id af79cd13be357-8cb4c024fbamr1719911885a.61.1771404223856;
        Wed, 18 Feb 2026 00:43:43 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6f70:9a29:d138:f5ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5e11f5sm583750455e9.4.2026.02.18.00.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:43:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: swnode: restore the swnode-name-against-chip-label matching
Date: Wed, 18 Feb 2026 09:43:38 +0100
Message-ID: <177140420873.51570.16441963571525422397.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gOs3ADjubOeZjj7vTE6DIFoch1V43yqy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA3NiBTYWx0ZWRfX/6E1R+r6ueEC
 C/ifsb65yrWYsnYMUOEQbSEiveKCWx2kFwVV3IhXjBoC54dmOqLpQxyXn7aZRyROB0fUzIUGBK7
 7xwaVYd+kVQTfhptuLrQ5VWn2ZACVWV4cbziTFB+F8SMgh0w3ZF5IG+QqvoGtcv6FdihWNIVr7d
 QqnwAQFnYcCkELEoaxbKV436lJub+fHgfXwwB7OFEXE/UItuOd3s3/aioVVrCS0V9R5bw9KmVHX
 EGCGygw/tTZ8YzzCduliqEEy1+OBgJsKc97iIkOFqGQPTQL2tQoysPjgT4Z0AE7sZlsS4W55GJM
 KyZxB9onBnLPTFQJ4jJZJ6bH3K/2oLLBRdT0N8QRKPZRO0DUdOnJObrnNwPAaihN2YGjZuVSPUW
 gjcHyGI7CFDft6YKTylhwc+zYAy8w1co2VshIXGIQghH2emA1MJBtugwUz+cbjHj23/3X4azoA1
 eWY7gMeiOu8rRXqC/nQ==
X-Authority-Analysis: v=2.4 cv=JNo2csKb c=1 sm=1 tr=0 ts=69957bc0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=10r_2F6UnNXIiLmb3qwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: gOs3ADjubOeZjj7vTE6DIFoch1V43yqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180076


On Wed, 11 Feb 2026 09:53:13 +0100, Bartosz Golaszewski wrote:
> Using the remote firmware node for software node lookup is the right
> thing to do. The GPIO controller we want to resolve should have the
> software node we scooped out of the reference attached to it. However,
> there are existing users who abuse the software node API by creating
> dummy swnodes whose name is set to the expected label string of the GPIO
> controller whose pins they want to control and use them in their local
> swnode references as GPIO properties.
> 
> [...]

Applied, thanks!

[1/1] gpio: swnode: restore the swnode-name-against-chip-label matching
      https://git.kernel.org/brgl/c/ff91965ad8b214e0771bc5a15253f14f583a7649

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
