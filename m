Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453753;
	b=e6xoNigOMlnOCZkf4VeDngrg8e3HsPuaHKsxOfjR78JFJXxW0Dmn8WJY8+202oE3kJzl
	 QlcyUQUd9Cg9qsZ+WoQKy53DzU5mbjRcO7MTRyW04lpVVVM9HBlAvvBxw7g6UjeAGrb/h
	 aG98pQ8Kng+pFSVRrDoIX1w+2gnGlM5ZFX1U5eEKzaoBj1l2HGSUf8aW67TdKtrPst4FN
	 lS+d1xhyf5xxpzoYW5QtdlFcrl8inSU7ZHmbkB3xIXGloLeqto4nI1IkBgCQpYB08XS67
	 i88wkzCkobQI8Kag1N+3mazT8ejf0zKeL5/h/2t3omlKxfi3jwNRs32Sq5OQYe5+/BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453753;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Nia/3Fejzq/8pwGFpOYXDtAfbAIiNtIbDIVtuujz/Q0=;
	b=GkWPi9VmscewD39nw/hpnD1QTfM5l5cs9pWEe7y/zj+wmcW2oV3Mk2W0feFAndqzOGOe
	 ZyniyAdBbaWP4jusizhBQ6OTXuLj/kaiK6v9+p3TQCH1BGLtklCwjCtR8MzlcWzz7qUW7
	 5ImtEpHGm06DTLlgeosFkZL/teNlXNHyyTgjnaI8hc2yNiYF+FRZUxSLrGC6L5h08iQ3E
	 nUh14p13gpSfXb/nEt148X/FDhrIEfX9R7CFbsnloMs0QosIQqAlAquRbzD1n9182ZIEd
	 tCi3kmwUPl2unH0JoVCRodsUMOEVxrm0HZxtV+pZ+y0O0IgKCFMZTDvWSqIfX79SFVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOpIkJFk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YfcOO+8b;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8879606A31C
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 03:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8879606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOpIkJFk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YfcOO+8b
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZhqF3813258
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 03:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nia/3Fejzq/8pwGFpOYXDtAfbAIiNtIbDIVtuujz/Q0=; b=LOpIkJFk1qcw9dNR
	IGn4sA5UCOtmAyOLiqsLJomBSihf4tRG/wVsCktehqAKlkuNZgtYphQhJjW6Y110
	kTG5YWTTru2Y4kr1/8Qaz2fJNsQUA5m5Ka/oMwTdFZcaTTHwgtDbyWShJX3YM2kD
	EmjFp/er0dKt0SxCLGtWua47LlVvaLI2blykILXXkO3UwS+VXzUWZRxAMyr0kUAL
	D2ZraxIHHVBA5T54djHiEvNFaJ4a29MejhkgHnvgHbDKd2hHf1ktkpCFc9c1JW8w
	HlSYTbk1ggYxW2ytlV2rCexQSaEEvjbUKJ7IAbCnqhsZMIW4j1I8fuadDWk7094Z
	MUoEtQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0hw5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 03:22:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eb5375cd68so34538485ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 19:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794453750; x=1795058550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nia/3Fejzq/8pwGFpOYXDtAfbAIiNtIbDIVtuujz/Q0=;
        b=YfcOO+8b58GCURpz5PXBLv24Uv1uH24sUAtfEyQOlUc9OwlPaHxRxUSu2Wb/xdKsDw
         9nNqgW7xq0qxgqaMr2Wbnrv2lxWwKO4qCJVKmNAeaWhLXOGKsyLr2FO3tqwiyEMcAKtF
         eopnhJ2XDhlR/ff9EIlREaT/fP6MarfDEOyZpQsDkJyCbP5b5QTm1G2QanAcyDn6yL7u
         0qFRl5AhkJ0RAI9Wh563lPvd12X53SiZRpjEphQr471LwLTDeEKjlyJMstJfqPSTjrJF
         KTU8mWBvJpuhlrCtzB3cY0UePYFekSC+EjfzsbCf/ghfk3y3qXlpZsicnvGR3fXBghZJ
         RL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794453750; x=1795058550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nia/3Fejzq/8pwGFpOYXDtAfbAIiNtIbDIVtuujz/Q0=;
        b=IEgPaNj7QBJjT7p6pCnNUD5ZruknoXeA9GDBS0mHtTxVaymCmViYTdiFEcWm18KrLx
         f4NL0Ou/QekkqutwzCgXzNkYuDS8O1cGVCVChaX+g+6LLmfL64V+nJQAVB9Np0sDHisZ
         XNm01spHdPFzVETwmMecUemZGDSF9Dtj4MVFkkN42dAgH55turuDDNdqwXdPtz3jtDJ+
         HLU0U43jzZl70QrnIwXDnkAIg/DtRln+1x1ZAmXRM5h1jtKgH/0zXwJ3UROy4c/BTf+c
         kcesQ7dzvORg3PdzN6fMDIQIqI9OLEmZvazx0cAsmjs0oxzCUu9ZckcaQYeZHoxsebtg
         6XLw==
X-Forwarded-Encrypted: i=1; AL+hErEjg/laQWkXr5xPbl8DO32Tn4Ui70C1S9QogsETvKvJ9VFEzaQYW39tkjv8+IpLDbnyEmFScZOiokng6zwusjC6I9Dy@vger.kernel.org
X-Gm-Message-State: APuU4Z9iNt7OApTaiCIElsooeWxDcpLoKbtzSuaEz92WBDJFgrVGLLcC
	kQOipQkYz6X+sFlO/bTqr+UQe11EkjNDJKU5CmuVD2SyRdAJAFRe2Osvzm0+dGYTOoG2WSi+kFz
	DyEhhLTyXzPjGGl3b4YdFDBGPx2NgDIGXujTESWjC71H4DdPefSxOp6RyXYxsWz/mPv375Dox1q
	Ex
X-Gm-Gg: AYBFou3yKgPFX3rOiTPwJLCLzhEiAhj1rt6GhZFjdyR6PUXl3mPyhmA6yOsmwluS0xt
	IncjFbcmq4AmotYO+IAzrMo+cYJvbAy3MHd0ZGfG1IoDUoVf5lXbkl4O+GnxFBrsH+ZHp8Xm5vF
	tSU3H1sOI+zaD9zyjFQzGeeDGC3o0hd2M7KiMhECSVThssH73VZzuEpcdlYgo83/DFkhaHwS1r2
	zpLQBg002SHryIeLbmSjQLvlaTdMWEfbU9k/a5lbKEpPytBpgBUG40/iU620G/tRonT/3fAAeqm
	sSejyPFKC0D7mtRQ1XnUJlzbH1RPm3aGdpmacVHc6RDHc/eXdibGcfbyeyhji54wSqBq0YSX62n
	I+Iy09K6FSgPqzKO3R7zZZrmDr6AryaZ2v5WQZEcjl3vher/nBnKFjk5pMAVVt0J6lywQqkmcxX
	HoVzjFDweFFnypAyb/ERtPU40ZSSLTX+P7lkWvumcDxEYD3w==
X-Received: by 2002:a17:903:2ad0:b0:2e9:58c5:8c68 with SMTP id d9443c01a7336-2edd7acfcd0mr38208885ad.54.1794453750514;
        Wed, 11 Nov 2026 19:22:30 -0800 (PST)
X-Received: by 2002:a17:903:2ad0:b0:2e9:58c5:8c68 with SMTP id d9443c01a7336-2edd7acfcd0mr38208695ad.54.1794453750048;
        Wed, 11 Nov 2026 19:22:30 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6dfb58dsm26134275ad.66.2026.11.11.19.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 19:22:29 -0800 (PST)
Message-ID: <acd476e0-fb24-4f11-b917-c4e86f86171a@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 11:22:16 +0800
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
Subject: Re: [PATCH 4/7] cpufreq: ondemand: Include <asm/cpu_device_id.h>
 unconditionally
To: Pavel Popov <pavel.e.popov@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin
 <tursulin@ursulin.net>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Logan Gunthorpe <logang@deltatee.com>, Arnd Bergmann <arnd@arndb.de>,
        Len Brown <lenb@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        "David S . Miller" <davem@davemloft.net>, x86@kernel.org,
        linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261111234821.4814-1-pavel.e.popov@intel.com>
 <20261111234821.4814-5-pavel.e.popov@intel.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261111234821.4814-5-pavel.e.popov@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZyzoV-Ac7FKi7xhzALHBLCDPrwbkgs5F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxMyBTYWx0ZWRfXx77O6XvYpbaq
 nwvmb7oXvhwgetsC+K/vcANZ7qX+r4v9kK5Qpo3AS3wXdnu3WM0hy/tg/+7mBpOG8leU85aVPzG
 g5A9B61QgzKLgBcUCKETLP200F5YyZzR1ul9FFmKR96wx59IWbyU/Vhktd65VLq6AgrNIqYMkLI
 8LKS9lb072RSyKEZc83natxV+FDizoADmI2sM1xuutHdlIGtOm6XgjBM4BLEyzeCahpdSCscqd5
 zVRlzPZbffs+LB/dCKE/zJZIQA3HQ6sHSxsdP3gUgtu0WJMje1sezkPkTFGcKsFMuygx1VDfQZT
 cHVOZ8QblQUEVz3JXLyJ4yBnv5QBwvucX7HRsayXlCmhHjRCfQUU0sHreCR82lyyPhY6GlleHJp
 b6utVDsJBvFyd1YD4IrQ7axpjqFhft7Ox8w21xYnOBNZfOFtDRXoRyrxjXI7z77MkBQ0M+j7Cvx
 JKEzzTM0+RHQlCwo4qQ==
X-Proofpoint-ORIG-GUID: ZyzoV-Ac7FKi7xhzALHBLCDPrwbkgs5F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxMyBTYWx0ZWRfX9TEdH2rxJDFj
 WUko/e+3d6b94Qs8C7rWHUsw5eSpskgVuNu733Ts9LmNXG2WS6XPrWVYUpELNrdIpqPfdOD8HW2
 J+arcUCRNyaa4eS35h3vGy3uId4/muU=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af530f7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=L27Nr_72VT4YvYD4_PkA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120013

On 11/12/2026 7:48 AM, Pavel Popov wrote:
> <asm/cpu_device_id.h> now has a generic version, so the #ifdef
> CONFIG_X86 around the include is no longer needed.
> 
> od_should_io_be_busy() still needs CONFIG_X86 for boot_cpu_data.
> 
> Signed-off-by: Pavel Popov <pavel.e.popov@intel.com>
> ---
> Depends on <asm-generic/cpu_device_id.h> from [1]; please apply after
> it is in mainline.


Yeah, this patch strictly depends on [1] (series patch 1/3) being in
mainline first; otherwise non-x86 builds break.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> 
> [1] https://lore.kernel.org/r/20261111234439.4098-1-pavel.e.popov@intel.com
> 
>   drivers/cpufreq/cpufreq_ondemand.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq_ondemand.h b/drivers/cpufreq/cpufreq_ondemand.h
> index 2ca8f1aaf2e..0e33865f9d3 100644
> --- a/drivers/cpufreq/cpufreq_ondemand.h
> +++ b/drivers/cpufreq/cpufreq_ondemand.h
> @@ -6,6 +6,8 @@
>    * Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>    */
>   
> +#include <asm/cpu_device_id.h>
> +
>   #include "cpufreq_governor.h"
>   
>   struct od_policy_dbs_info {
> @@ -26,8 +28,6 @@ struct od_dbs_tuners {
>   };
>   
>   #ifdef CONFIG_X86
> -#include <asm/cpu_device_id.h>
> -
>   /*
>    * Not all CPUs want IO time to be accounted as busy; this depends on
>    * how efficient idling at a higher frequency/voltage is.


-- 
Thx and BRs,
Zhongqiu Han
