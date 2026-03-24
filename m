Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC103DBD51
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 16:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369878; cv=none; b=Vr2owIJWQ53WHU7GtKacjLFs3fNmvqDqBeauNd7Piw7axQ2h3zrxw/ATBqVRqTWFvtdvtGEA/5UxFUP7PWKwFueTpZzmA+7iTb1euBiY3y+fc3zaSir9a1EPX5OBjWg6wb341V3O3UZCUiLrL27HfHypQcaijt+VVQyfUp7518Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369878; c=relaxed/simple;
	bh=CBQ/HTj/+gacw7tT3f4qCTthPnRKgqCdg8MA3D487EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9t1k9he2mCA4HrfL1IBgimiR4jPmyR6ftx6I4yHVWYUD1Xny6QRY+lXk9DPYzT+0JyzjFIBCSJ7ptrUYFe5wX/ZNy/DN241yCX+X93hSWwGWy1FFWDvhAG9THZxee/cwAmu8eLRsJ1/zDn04mIzuaKqDDbSjFHIBNmaIDZHS7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VudKAD4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBZo4Q0t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VudKAD4M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBZo4Q0t"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OCqlKC127807
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 16:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cJkVB7soZuEH2OgjtJtIPgf7
	yoWxt/8TCdmxiXUUzOY=; b=VudKAD4M+oCBkzKDzrpsErjKgn0Ss47iVyXroDP3
	1NZuowztNktcYI1SjmnWHcqUfjoXbBVxGOg0ANX2kIY0i5W9yvirD4KKs2NSS964
	s23nh1MEFi9tzx4JicFt21O9UkIdyrlsLUXCnmg8CUBU/NQDSiqkPeagCWDnRYW4
	BuRYHD/ZTw5Yw7/QeS5nzmbqXfsKmUiqtOCI+0NZX93roti/YZb4ncdy/7yXjZy+
	Dg61ZJF5xLBcmXXcXNamZ+oqAiiUU50imkaiPoYUuujB7NyAu37y3d7XuXJr56Qu
	kPFuH5pQpHKp2DJPSXR1gOkwDZ5HvTSZn8Ghr5TPBwsuwA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m0v34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 16:31:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56ce17e1f56so3653968e0c.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 09:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774369875; x=1774974675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cJkVB7soZuEH2OgjtJtIPgf7yoWxt/8TCdmxiXUUzOY=;
        b=OBZo4Q0t6tBTo3L2yu8C4kwJiQ29JF94UxIqXL9lxROWtwz/kBKKkQ6q4t8CzYDqpq
         kc4KyaQJZz1GJo7Z4aZMKt9VSzUcdhPkTfk01P1Z81FlM4R1f5rXvLFojWEolaFBJgXV
         TEx/msJvjS2ZL1chtdVu4+CnJ8exGa21xXF/O0gHZiSPE3UVPDB+d7MKFHvN+gtG0T7D
         1vz0lzCRyNtgvCLsaQ7Lt+4NJNwZ2WeLDO6uvS3v91d4FwgUGWV4ZpwSGBT7jBrzmDKz
         9Tuw550d9ALAvWW7Gjr4VXbZQWayElGE3O23D34SszbpKl2kDsyJp2e9dZgiXg0tUiRO
         TGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369875; x=1774974675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJkVB7soZuEH2OgjtJtIPgf7yoWxt/8TCdmxiXUUzOY=;
        b=dlqHgo82MXmsyr9EcYU9Yy0pHJrTvl4KKB2k9ytWcSN06AbOrfiFcSa34KHr0CCp0Q
         gECz0H4/yG4lyML0cXBwB6cafJAP4zTaR7Npuw1GXXQKqToa58y+yNxOLh2iHZ3ZbhfC
         Lx7nehHgseQ0I7QZKpZ0sD6slEHuoS05imvhSoULAAZ0WfFCIq82n6+Yv9EI8ID5LrL6
         1KhLmfgTq2Gn9gtWM5U0kFR8VFo6A5wyQGT7ELb1csY023De3uVHsFeuG8B4EBDfLIKQ
         e9GEX1UaUG6s25SMxJDEiFaMGBkaiX+1zWZlEDHapO9i2gSjZzWsCTLpZluk3vhgPGQE
         RJFw==
X-Forwarded-Encrypted: i=1; AJvYcCXym+lBZhFDhtRcKPmMQsWKhqin7r538ceQo5uo2cRUxGRokLGR6AXuwrJVZcs+t8+dNM2251nc/VMbA4ENwjVBHUWl@vger.kernel.org
X-Gm-Message-State: AOJu0Yyigv9UQ9wyMEPEoE9Kl6MY6pxHxNXaLocGHdIXHcHuE6gMeICY
	uj129bG7LfPs8N0JKbdNpVdNXHY+wEv4FBrEX5JYgMXzEdi9BG0tS5Nk9i9o4p/xLcl69izULC1
	3+9p+rcfmKNXCGY/s8rmXjwUaxrybP/Q3DtXkIG9mJPCOVtZZR+MAYM4ziyYp4jeN099lp1tzzk
	w5
X-Gm-Gg: ATEYQzyDWYxzbFQDaeYAgmbfqIsxgJniPIWeFTFqErmvYrLjRAH3QEhLEZUOnqZLGQU
	U1keSKnkups3ifbYmozlvfxfnAKJGUSRdXiwuTlPJYouevnLIjK/qbI9voFFTE+U9pT/5Xm+COa
	mjLYTTyfMuLOWMMFR8lNLd8DVSOaYnxu+TNUUUTb4Xs7aPnF0mzdqnbL4z1hUiEfBy/KX/iSBdW
	tNHvXLsuBqRSx5rMy37smBg7DMLDsHjOzeucr2Y+ExZI0MTN5nRKcDkDh+fXRBIG03rvSRaQl51
	eJYMWPC2pXX8rBwoFm2HC0XUcGkxKIzB4Qz6BdmjGp1GtDszCfystrtCqfpSmlr6TC9ulQyYjnO
	PmLb8lVLZElACkBygkHqhz7WVelqg6KoarA==
X-Received: by 2002:a05:6122:3383:b0:56b:5e7e:d3fb with SMTP id 71dfb90a1353d-56d220627a0mr309519e0c.12.1774369875040;
        Tue, 24 Mar 2026 09:31:15 -0700 (PDT)
X-Received: by 2002:a05:6122:3383:b0:56b:5e7e:d3fb with SMTP id 71dfb90a1353d-56d220627a0mr309309e0c.12.1774369873747;
        Tue, 24 Mar 2026 09:31:13 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c0c13sm121899465e9.7.2026.03.24.09.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:31:12 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:31:10 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Message-ID: <pvdg745e7gfdsmruhve5u25zkjyvpmudihalojt2hmldbc7mhm@4cj3gyiza4pg>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
 <20260317-add-driver-for-ec-v5-3-38d11f524856@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-add-driver-for-ec-v5-3-38d11f524856@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c2bc54 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BYiauv21-j_JhOubGf8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: M4DsNqpifRWJfmu2PC5V9MtJM9NHfHS1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyOCBTYWx0ZWRfX/zJwFNDl+eMO
 vmCmsY8UbSm/68k0YGLNMFWdGS99SHomkeDmok2+v8NMtR5TWE4BOYDOYBrTAC/3bWW8LwISZ7f
 riX/9OTtxSz0ie+lmrRIi7lThmwbSh1BaNJkx95vpVtisre+lG7Wm6NquLOwVog9X12/YS9uPwh
 D5IJAQYJ7nPIYzcTlVWNp7qI8Bl5G8rX+POyJ1oleyk8CpaOhpDcHnQqi7R00IkjeGN8wvdhgum
 GbYofAKqdgvlYFK2sWUNioMJahUoLMja+t0ic9YLRmAnbz+iWkCFGZ7Tnd+0Fqmr1NKZ258JfpZ
 25U+CGoBKBvRYZg6WZ0gaGwITMZxAGi3/1fwY423oii/U/wpvFTqOC2msbkVqOpEgjYCxx5RT72
 ClUm8yAXUdI3FkjAxq8Jd1XcjgFhCytM6TMCxGIkByz2ZOBjBTHS0JGZ/+88t282jQa7h9KG/YV
 PANPhxbNQ+K88Z7YGHA==
X-Proofpoint-GUID: M4DsNqpifRWJfmu2PC5V9MtJM9NHfHS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240128

On 26-03-17 17:57:57, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Glymur CRDs which adds fan control,
> temperature sensors, access to EC state changes through SCI events
> and suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
