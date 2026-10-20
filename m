Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504357;
	b=VC1xXGV9i9HWuI5WbKlYPmkRFfWbItKNePiaAyRKJU5wf45rBkJpA4MYKTC5cn757pfP
	 9EbkW61fTyahUx00YDpIi+XHJjOIBAjzTHrZaxYF4Xo4Ec4mfJTnVo0DklSxpM/dRlM3c
	 uJjuioAvwzwXdnIV9CHW8jvh5vvWA20OUP77jSzj1opq22cPKXhLxwB26S7fmn82YDmuV
	 yea54ru4fChGDqNj6ViDhTBJ6CPXxv6IP0e1Zpa5ZHCqmAn6zmh1Nd473Wfs4tu0+YGCa
	 9jq59tqysydiFo9K/Fiu5idaSqi2nFfBq8t9oXd6/qe/LxNBFRAzJz7g+A9EoSPjC0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504357;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=R8sga/m2NvCY076z1Fv1XeDyz3d8jWnI9Hw+ncaRq8I=;
	b=iXZSBQ6nsykVxSVSlp54XZcHGhXfKXYHdjT/3KyoaT/Kwt2YpSsoG83D3Xdvo2/mdGH7
	 WsVmXfyuUgKr8I8zQVr5uoAC3+c6oJ3D7/9cUUbVtSO8gnBCZS8Ei5Q7XHK9xZVJOAsgG
	 Q5n/urGP/DkyGWgzVG0XmGcsvd6qDWy0KEB304wQiu5HD/0DXx8/6zoePBMwGH7hgo3A7
	 Stt0GILUA1DVmwjvztPhDY3p8vzJaeOHnSBimJD6SdEkJMvyUEXWXA1otPePAnB5voft0
	 L9x/5i0jJAm7MXtvCwlO29uWCRRsNvTqfSEbOoEqyXXNd6NWgVwVp8NgOLOMp1BAfqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E5pQMM1b;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66C4606A33B;
	Tue, 20 Oct 2026 13:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B66C4606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E5pQMM1b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792504356; x=1824040356;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hUne80GpDyo1HHQIW0VzFgnz43mFg3bFCUJV7ieLX4Q=;
  b=E5pQMM1bNdC8GXDEZSoSCRGeRLVuTsBtESYTVl9OtdgDR1oUkKMrZSkg
   8N11b3outxEqVv17yC59mDQKBizM3zTenYOwayQu8RQmj8KJxIhx54SAB
   mBhbwGKsgoo7M/YxpUVH2SLkb9Un+bPKcXPtYxTvzDppjmyzuTWK4CDez
   jTuW75DWufpVcHUTzE2ydZ8a59QkOpFiL1kjSNY9jXYtYM4Gfop+Mpq2e
   0ciJWFJ3kApJEbF+js7/FKHKnXfh6zQp5s8efFS1Qw0HxTeSSvdv2CaV2
   3IUWXDhER9Jua8xN4BOx1M+sTxIVq7pBbqCdm0lm9+FiNYW5ToOpx0MNl
   w==;
X-CSE-ConnectionGUID: XIG8QMQcSR+c+5CDrhC1sw==
X-CSE-MsgGUID: Jwf0hwwkThOmP32cVoG9uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1216809"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1216809"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 06:52:36 -0700
X-CSE-ConnectionGUID: 3v0WZaCKTnOeePGZEeS4jg==
X-CSE-MsgGUID: 8h7C9q4EQD6ko7+j6Yh3bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2704959"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 06:52:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Oct 2026 16:52:28 +0300 (EEST)
To: Takashi Iwai <tiwai@suse.de>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    Junrui Luo <moonafterrain@outlook.com>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: ibm_rtl: Fix potential OOB read at signature
 search
In-Reply-To: <20261020130301.351768-1-tiwai@suse.de>
Message-ID: <818a69b8-785f-9eec-d93a-89c8833d94fc@linux.intel.com>
References: <20261020130301.351768-1-tiwai@suse.de>
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

On Tue, 20 Oct 2026, Takashi Iwai wrote:

> The loop for signature search fetches 8 bytes at each check,

But that's not all it's going to access??

> while the
> loop count is calculated in 4 bytes unit, which means that, at the
> last entry, it fetches over the limit.
> 
> Correct the boundary condition to "ebda_size/sizeof(unsigned int)-1"

This seems even more obfuscated than this code already is!

I think it should do this instead:

(ebda_size - sizeof(*rtl_table)) / sizeof(u32)

Admittedly, it a logical change too but why you think only partial RTL 
table is good enough just because signature can be checked? After the sig 
check, it will read the struct beyond that.

...And that other sizeof() should use u32 as well.


Unrelated to this change and if you have this HW and can test changes, it 
would be nice to also get rid of the debug parameter and use dynamic 
debugging instead of RTL_DEBUG() for consistency.

I also don't understand why it's mixing readq() and ioread*() for reading 
from the same area.

> for avoiding the potential OOB access.
> 
> Fixes: 15dd100349b8 ("platform/x86: ibm_rtl: fix EBDA signature search pointer arithmetic")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/platform/x86/ibm_rtl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/ibm_rtl.c b/drivers/platform/x86/ibm_rtl.c
> index 139956168cf9..6d6998049d8c 100644
> --- a/drivers/platform/x86/ibm_rtl.c
> +++ b/drivers/platform/x86/ibm_rtl.c
> @@ -271,7 +271,7 @@ static int __init ibm_rtl_init(void) {
>  		return -ENOMEM;
>  
>  	/* search for the _RTL_ signature at the start of the table */
> -	for (i = 0 ; i < ebda_size/sizeof(unsigned int); i++) {
> +	for (i = 0 ; i < ebda_size/sizeof(unsigned int) - 1; i++) {

Also remove that extra space after i = 0.

>  		struct ibm_rtl_table __iomem * tmp;
>  		tmp = (struct ibm_rtl_table __iomem *) (ebda_map + i*sizeof(unsigned int));
>  		if ((readq(&tmp->signature) & RTL_MASK) == RTL_SIGNATURE) {
> 

-- 
 i.

