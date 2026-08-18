Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C204143CE71;
	Tue, 18 Aug 2026 11:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787051407; cv=none; b=dtvwQ8OdjNpSx7Iy4ifcOjxji/SfeI3T3tzfdAedTzyVJt8hI2t7Ace6WtfpW9y8//XFxzQCfxF3xwWOWUaaZLL+usoVVKw9sTt+l3xSat7rgAkAX1YGbigkVlhz4jG1OQfLgC1SspJOD5ULKyG9yAwkZV/Er1y+LmyjGdLkZdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787051407; c=relaxed/simple;
	bh=RSbZwHHfsu79a37e9IMewLtgHgD6jHZWmuQeHh+guhA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tLEZJ4YH9mOAnf9kq1SO+Wzfhf+d3J3Um8G7+yoVjA3YkHGIlQSEIAm8qQBavgfmDWVxe+e3usPl8O7iz1gPUfUcz7cl3n5f/nOnCfxavB+IcuX0VivSGDeWauyGl3c7kOiWQBB4XOQxti9CettIfk0aWBJvSLqBkLckZwLkpuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RcW2YecA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RcW2YecA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787051404; x=1818587404;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RSbZwHHfsu79a37e9IMewLtgHgD6jHZWmuQeHh+guhA=;
  b=RcW2YecAkdXpXwTecD0hv6NBtGwvXa6hlVc4oxSavELcOknyxWpAgxXc
   bGpQEd+1qeIc6s6zM5Iwg06VaHMowmzeCIwGRYFXwAC8bZl2h4qNlz9yA
   p2GBln6L1V7txtn8fN49zqCBeul8Aw6KhpuZz0U3b79McdpsVDw00JHVe
   4R9nGFzbFPYoVLukkw0FQreuZjaim3QRq79Y4zb+iScipMyF59nxhGD/b
   eIG8xNfg0zizb7eeyXIZedayCcMVjDU26b65NeaupT0gI11i7U4PJ25c1
   8dzn+jOj+xTnEu9h4PMeybhHaTXbPFJyBPGz+Wt8FVIYG+Bg5tfkxx4JM
   g==;
X-CSE-ConnectionGUID: DMFddCEDRC2C+gOuNiBqgg==
X-CSE-MsgGUID: zkSgtyHITjK+UpDD2qv7pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="99060797"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="99060797"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:10:03 -0700
X-CSE-ConnectionGUID: 6kW+PMEYS2Wnv+k6il7b4w==
X-CSE-MsgGUID: q3vj+XxBThWgA77h390F7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="290006623"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:10:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Aug 2026 14:09:58 +0300 (EEST)
To: Hilgad Montelo <hilgad.montelo@gmail.com>, Rosen Penev <rosenp@gmail.com>
cc: kenneth.t.chan@gmail.com, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] platform/x86: panasonic-laptop: Fix sentinel
 write past pcc->sinf[]
In-Reply-To: <20260813221744.25668-4-hilgad.montelo@gmail.com>
Message-ID: <976da746-9bf5-f2ea-9968-4b6c21ff67cc@linux.intel.com>
References: <20260813221744.25668-1-hilgad.montelo@gmail.com> <20260813221744.25668-4-hilgad.montelo@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Aug 2026, Hilgad Montelo wrote:

> acpi_pcc_retrieve_biosdata() rejects SINF packages only when
> pcc->num_sifr is strictly less than hkey->package.count, then
> unconditionally writes a trailing sentinel at
> pcc->sinf[hkey->package.count]. But pcc->sinf[] is allocated with
> exactly pcc->num_sifr elements (valid indices 0..num_sifr-1), so that
> write needs num_sifr strictly greater than package.count to stay in
> bounds -- num_sifr == package.count passes the existing check but
> still overflows by one element.
> 
> This is exactly the case probe()'s existing num_sifr++ workaround
> ("Some DSDT-s have an off-by-one bug where the SINF package count is
> one higher than the SQTY reported value") is written to accommodate:
> when a DSDT's SINF package count equals SQTY+1, the workaround makes
> num_sifr equal to package.count, which is precisely the boundary that
> overflows here. Found via UBSan (array-index-out-of-bounds) on
> hardware where HKEY.SQTY returns 37 and HKEY.SINF()'s package has 38
> elements: num_sifr becomes 38 after the += 1 workaround, the loop
> correctly fills indices 0..37, and the sentinel write then targets
> index 38, one past the end -- a silent 4-byte heap overflow on kernels
> without CONFIG_UBSAN.
> 
> Tightening the rejection check to num_sifr <= package.count would
> avoid the overflow but breaks probe() entirely on exactly this
> hardware, since num_sifr == package.count is the case the off-by-one
> workaround exists to support. Nothing else in the driver reads this
> sentinel value back, so simply skip the write when there is no room
> for it instead.
> 
> Signed-off-by: Hilgad Montelo <hilgad.montelo@gmail.com>
> ---
>  drivers/platform/x86/panasonic-laptop.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> index 93e6511..9511440 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -476,7 +476,16 @@ static int acpi_pcc_retrieve_biosdata(struct pcc_acpi *pcc)
>  		} else
>  			pr_err("Invalid HKEY.SINF data\n");
>  	}
> -	pcc->sinf[hkey->package.count] = -1;
> +	/*
> +	 * pcc->sinf[] has pcc->num_sifr elements (valid indices
> +	 * 0..num_sifr-1). On DSDTs where SINF's package count equals
> +	 * num_sifr exactly -- the off-by-one case probe()'s num_sifr++
> +	 * already allocates a spare element for -- there is no room left
> +	 * for this trailing sentinel; nothing reads it back, so just skip
> +	 * the write rather than running one element past the flex array.
> +	 */
> +	if (hkey->package.count < pcc->num_sifr)
> +		pcc->sinf[hkey->package.count] = -1;

Hi,

Thanks for the patch. I've applied this fix patch 3 (only) into the 
review-ilpo-next to get it in within this cycle.

I did add:

Fixes: a3d0dbd18ce9 ("platform/x86: panasonic-laptop: simplify allocation of sinf")

...because I think it removed one extra entry (there were initially 2 
extra entries and we didn't realize the second one was probably for this 
particular assignment) allowing write past the array.

I'll consider the other two patches of this series later.

-- 
 i.

