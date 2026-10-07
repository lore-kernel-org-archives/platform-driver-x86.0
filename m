Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8FD4ACC7F
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379393; cv=none; b=Grioc/dFD6vr9P+znAHwePcmswODUJGHf6FEogHgaSMt8MNygyvP/k8YxwZG5GodWjLLjAGFDU2DMQfQfrDlJNamFoUMWPdGe0cpirZfITTX0xmHPIvLMDXYgGDMYkNpEBEJbt03QbofarLWSIKPGe1g4468/WEyz0H64RbVRNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379393; c=relaxed/simple;
	bh=lcYghPYPQnAUdk2tTeEOuezyDzc0WhSPRSI7GgfJz2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7enrtEKcCfjI1PNq/xZhQNAcGAhSnxg35Oe6zBKnCJ1z16fW3RxG7XM2HGq/ZrKpWP8mWkIBc5BE69oCz+bhE4+egZUsV7JvVmbR8o3YPFf0BHbIQvvtd0zoZFjw+PCN+dtt+73lDy7fsiqF0KazoKy2wJ3yFrMAI07jGjjt4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQVLruBu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmE3Mh88; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQVLruBu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmE3Mh88"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVCfH3198234
	for <platform-driver-x86@vger.kernel.org>; Wed, 7 Oct 2026 13:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BjZrN+hkuGyVx/Cflq3VwuxQ
	GN0nui+PJTPi3KeyDmY=; b=hQVLruBuIcAcZ58hbB1ru6pS5+rp2PchQurd9mzH
	Cjd0KVZG/NnqWGIQdyVQg288r219R/JEbMS3svvQ0klRULTlugDVr6+/w8wRqxet
	2S6F8MD4780Vz3obRwb4BBFYOQKy9jT9f/soLNJuPyhVpAmxLcsaqhSfxOqFl5aE
	64MCXP72bi/M+/LwZbBsyN+/sb9mNo4gUHKzk/CTYe/nEVqDQ0vac6gD7w/CLDvU
	jaoJff+EyhomLL5I4gUXkcAaVIQlETGRMRVcZf1GlaHqcA3+pzj2mPqeRBy3PHJv
	QzyV6/ZRtG2KoQktzO4735tsYTkeb21f5/CTeqpbnu7JcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s2bg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 13:22:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dea1b6c89so692367485a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791379375; x=1791984175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BjZrN+hkuGyVx/Cflq3VwuxQGN0nui+PJTPi3KeyDmY=;
        b=RmE3Mh88HO9cSGJlpPowPddd/FjDsoAgPqN74P3iX7tu4xTtC1RKFON3iMKhzNzGAg
         O9JSsxhbMVnvLg6H2xGEir7c55CGvaioc0Wr13bBlbtSoYKwTEZlpTOd/uXL67QMPIxk
         3fIfyftQB7P19g6JKidTXkCdwUseeYxpeed/kdg6k6D2cxDl3qn3+M2J7JdSkz8r2tx7
         PbGmv/H4VU2mHosW3me7gBHKF1sqEPHqNeG+kabG74Q/OU5VnTIaofy2pBHBWxomg4TR
         rYDW+aqCwVruywPQvMmchSUch1583mhDypBm3af82bd9aQWILrEYUtgh4bi7bZHrqTZU
         b5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791379375; x=1791984175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BjZrN+hkuGyVx/Cflq3VwuxQGN0nui+PJTPi3KeyDmY=;
        b=V9wqAMi5ia95BoGLwqkqz/VEY8MJw1JHfLiQIcuxeeD4cGlOLi2gEfUtxDJApGkOTZ
         VxKFLjh+fnz3vbd6IcYQY6zMexYVdZWTB4Vzp4NWQHAb4b9BzfnOLbUsJn4cfhHDIRsK
         Z0KfBJdNIdzigPOICOHfzoCsAt/qS89mxp6LO7XHseTcc5ZhrwDic+lj5UIkH4jx5JDd
         XEEVicpM+WRkE6VkKajxORGbowUVZN2vbeX4SDu8mKYIsYQfulXrH5oFKXLMXHbcy1ZC
         dg2XBOStQjsBxOS08+plIE3JsKNQbklo07UQOJ4iyidE8z1b8H5eS1wBzF0M1kyDn6BM
         N22Q==
X-Forwarded-Encrypted: i=1; AKwUvBy1qaqZtwklYkaI+exvrOAfUCWqlTUmvlicO9FC/tdSbW6oQAWJjuwSaaqefxN8zPpFXWnCb8NFPjw83s6k/MyfHHwl@vger.kernel.org
X-Gm-Message-State: AFuF++nNMBnwSA1HIb4fcayvHuFB/337G0lUKtFiWcyL0hJvoBQqsrFy
	DjMoF9FywQCZQVwnnypqKRMaQDUt+dKe7Ykpzxny034U0XZ6h5WYHZFvSp2rGRCtGxity7v1hBr
	GZP90M34WtBcEoLq4lN5nE1O0qyK+Wwn4ZcPYe1fpsmuAULX1SY587fMMZf+kJ0XhpErO+rpYwk
	le
X-Gm-Gg: AYBFou2oiJ0vM5gsceytpstOeTF8CRyVblfaw1xguUL8AOcm55KijylwhgaKfc3uHLz
	Fx1HPvVeMdWZxbfAiwYNmUZXXHp2SKt5lig1pzjOemhVrqZgeK71glbRKc+D60/Mrt0pFF/LIkU
	sv44hSi0vwySnBcOjnkQu7LzM5toBHkm+BVTlXya3Bh5QJ0diKWOSNXB5a8EztQK4j6d/uXiP/6
	r+mo8Rqn5ZcrjZnVwkhY3XleGNJfRFN5cw/Av8McXjjG3baco3ExCttHBHPu3bmV0RguXur0g7q
	dp1++tvSXWXqdBW/F7pLVylLN1KEsdIopmSsYljs3/Go6f/XKlfUouuYgyXkJPFwvxwuiNgn3G6
	7yvJG92Td95xNE7o6ai85AdDeRjhf5z7siufDfs7BRQvyk+DHZix4NRsFF5X+q0EUl8L+VMCxzg
	VTvh74wU7iwmkJ
X-Received: by 2002:a05:620a:6408:b0:93c:6ded:4665 with SMTP id af79cd13be357-93e9b2e9408mr369822285a.1.1791379374720;
        Wed, 07 Oct 2026 06:22:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6408:b0:93c:6ded:4665 with SMTP id af79cd13be357-93e9b2e9408mr369816585a.1.1791379374144;
        Wed, 07 Oct 2026 06:22:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3014cf4sm41282e87.3.2026.10.07.06.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:22:52 -0700 (PDT)
Date: Wed, 7 Oct 2026 16:22:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/5] firmware: qcom: scm: Allow QSEECOM on Surface Laptop
 8th Edition
Message-ID: <gfjao7xufwbu5unlqhvwri6k7h3inujospqwilwqhywqxuvs4f@gx76h6ntiqhk>
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-2-406fc042162a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-mahua-surface-laptop-v1-2-406fc042162a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: efj5Eyyw97TPw9sziXimJQVZJLuli4It
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MyBTYWx0ZWRfX17fWXWR70Qcw
 0kjX5WTRBOtycVIvhxJjo9Fj3tMRTW/c2cGFX6uFLKyjvfAyUKZArPdcFCjFn+7DjaBTK8NKS2V
 g59/QEFz8hdP3axZ4yihJeRxduJYZOm9MGPG957hiDcxkjuyJlWFrdtmH2pJK3Sel9PqB2+IxF7
 snsrwDO4XJ+Z+1DvrkLI4LXN0k6oM0fw0wHFm9engVGZ1FISNuajxFKAH9Hmetz4kpLjPQN5RSO
 eHXinopTNqN0s0nuxyshM63W1hTelEB6KGKlnNULo/bAXfasJ1lA18fCPjOnCFQO1ZK75QvHx+5
 Lh8nOVahwpIEQuM5XjAvqFcy2JzsmoUP3klv3aj+nQQ5jETqb7PqWPL5W3Invs/FdFdiIewMRAZ
 QPAzHfreNdcgOsbkk+B0pYXKTcTadOBs615DB1oATpqeuysI9NSPan2qAyP3ROfqPUPZ5vBv0RS
 NPdnd10Ds7YOcTQwQ7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MyBTYWx0ZWRfX8JXEaL3dFQEB
 cSDeM8LZllfIgFutHQBzgMPJ4nBGzWt3Hc2Eslkj6dxWB2Jh6rey7T/HXGDCg7HA4h2a5LrRNqo
 +DIj3hEOfBaf/PY7d1DvgPPb1KGGOMQ=
X-Proofpoint-GUID: efj5Eyyw97TPw9sziXimJQVZJLuli4It
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac647b0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=JbvdwL0Z4G9UtC9WzY8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070053

On Tue, Oct 06, 2026 at 02:50:28AM -0700, Gopikrishna Garmidi wrote:
> Allow the use of QSEECOM on the Mahua-based Microsoft Surface Laptop
> 13.8" 8th Edition, giving access to the UEFI variables and the RTC
> offset stored there.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
