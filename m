Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422778;
	b=1Uvmu+V3H9cB+w8ZKPmXCetRwTBjUVJ0vMBI+i2orrzJP+NHqTAftEj5GjfLLbBm2t5Z
	 4eh6AFUZRBJ9umudHvLeIA0m7qkwQHiwpCiwPOsS5JCplkzNr8F25qYqydM4Om6utTkh3
	 OAVOKdVAziuJkk5H7SXRUGf++bZO/gNzH44BIdOVR6lIFFbh1sNwIpLolvVFiB+P5grts
	 cD5zOCp4d91tEDRCyW2eHLC3+eHDk6IA8+9+QBEcGRSRGpl/5hsX/SDO2NGU7fpzYjsUi
	 q2NfnW+lzWnqubzr/z83IpEEjkXVIt/2MgFb4LoEjj9L4lqCqgGqO884LEqOtY37P/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422778;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=n55dgsYNis5nMkVCX76zkEz0gmaGG+jJDQmh0p+MIrA=;
	b=Mcg5jHnuox5YWbYsDwDoRIdNqjaVE14FjFIIUyOxNwC1AZdgOKgsxlccXDb/m/eHsw1c
	 OYS402m7r7nyZgHGlpfmQ6BiHTRkz1ImcqcY3P78U9uM0ruXfcl82/yI1rBU6j0SxOGnM
	 d6VAVj12y+oZ9MKmxGUugChdyu6luI36CSmnlKjX+L6GonYRrTaQr3e//BQesm+MQErT8
	 27RSnQDU1b3jMwGkS0f/cqKPol7XtAos3JoIfoQN30vXATaKyaq+dcFC9bgdINApx0R/s
	 ChZ6tsUrgk6MEZiQwcLrBe/6/5gA9jSjfN8gp9XxdIbbK/hgVbVW1vy7LZL5P4dPSWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oCJ+mkSZ;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F252606A321;
	Mon, 23 Nov 2026 08:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F252606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oCJ+mkSZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795422778; x=1826958778;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=za0vRKr80ynhtYaXvLncKEjvB6Yq1k+fm4wxoQh6+YI=;
  b=oCJ+mkSZ1AFzhK3wyHAfTRJC7gneioQgEywffdVWmC+WpQGpeaZnsDY2
   sM9QwFiweLagksnWA9P46vRL+h3j1OLruvCPFUzgoYey9ieS26RL/HDGT
   OXU3opydrOotnKqxPz+D3Z2ZC9M7NSHBqMu8lgafdrbkUXesfwx7IAeOW
   R4/Q6X+LnavkGE3OeGsobTOLBtCxJFRay8sai4k8+nYl9Lpbb5VtPmwg2
   zgWrq1HilfUG0LElLh2ZdQjcCKKm/mjI2aNBP7YQ0+gVxJhUqUBUgALCb
   Ke9ZjzqqLKXfbko3J5Nn1tc3p3ESAnv5UoJtPqKMisEh5yNIOpyPheMQO
   Q==;
X-CSE-ConnectionGUID: lfbP05YSTiWoyJZNCidHiQ==
X-CSE-MsgGUID: BAhhIb8YSzCIadyWQu00fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4114360"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4114360"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:32:58 -0800
X-CSE-ConnectionGUID: mq7Szv1SQo+J2OjIU5YbWA==
X-CSE-MsgGUID: h1ug/Oh9ToO8cQkWj9fC1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11542955"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:32:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 10:32:45 +0200 (EET)
To: Rosen Penev <rosenp@gmail.com>
cc: Matthew Garrett <mjg59@srcf.ucam.org>, 
    =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Hans de Goede <hansg@kernel.org>, 
    Gabriele Mazzotta <gabriele.mzt@gmail.com>, 
    Darren Hart <dvhart@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] platform/x86: dell-laptop: Parse the charge end
 threshold as an int
In-Reply-To: <6abac23d8f9985b55282ee56c97155a67076257c.1795219225.git.rosenp@gmail.com>
Message-ID: <51f6631e-62df-0e64-b358-805d343475b7@linux.intel.com>
References: <cover.1795219225.git.rosenp@gmail.com> <6abac23d8f9985b55282ee56c97155a67076257c.1795219225.git.rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Nov 2026, Rosen Penev wrote:

> charge_control_end_threshold_store() passes a pointer to an int to
> kstrtouint(), which only builds because the kernel disables
> -Wpointer-sign, and makes the following "end < 0" check dead code.
> Use kstrtoint() like charge_control_start_threshold_store(). Values
> outside 0 to 100 are rejected either way.

Why the <0 check has to be kept on the driver side?

Why not change the variable type instead and remove the then dead code 
check?

It's somewhat disappointing this even has to be pointed out by review.

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/platform/x86/dell/dell-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> index eca348497ac3..c512267be4c4 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -2382,7 +2382,7 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
>  {
>  	int ret, end;
>  
> -	ret = kstrtouint(buf, 10, &end);
> +	ret = kstrtoint(buf, 10, &end);
>  	if (ret)
>  		return ret;
>  	if (end < 0 || end > 100)
> 

-- 
 i.

