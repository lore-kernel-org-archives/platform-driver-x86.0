Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42459449B33;
	Thu, 17 Sep 2026 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634700; cv=none; b=gtITAfGNkUbzLBAjMeq6H2RWYAyhCDXJFt473OwkZi7XTvAGMe/bI3fFI2BQ2txNdKvHHgBfxlLzDTlJ6IOH/M/oL34DULC4ND+U/DInUE5wkhnF1b6Iv+bzI7KTydoe0n22uu8/auXh5ADrbhpkF+R7FiYudH+95JPi1yL8jHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634700; c=relaxed/simple;
	bh=TMTaIbJLsJLv/mTg2rgUmjtIHOhKYVUPD303vPU1PyA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hnBlMHealxYoIfda0Ac6nq6fCc9OtKcy+uQeUPnQHVWqOLb8ADSC8NEWkAC0Q4H2uB+ILb0HuvLrjb/3CY8cmVUV1WKhlwZ5bkrWesDaCJ3oMqhoHi+sCcDfSL81jkto+vROzKIIxniERxkh/TETy83e0+oLTRImljjTCaDcxeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIZ1G7vz; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIZ1G7vz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789634679; x=1821170679;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TMTaIbJLsJLv/mTg2rgUmjtIHOhKYVUPD303vPU1PyA=;
  b=NIZ1G7vzss9ByRy7Hvwa+MMVhaA4uWwkzyTe6ZbvRu9sFcMro3Zy9HhC
   d4Vaog6rAILg4e+SaHtuCjz0lGNVRRitRANhPKDvbkTDTjxEu0COHoDJC
   AhRK0flDPyLJdlnYudTJry0JNYhl9N6g/Hjx7yT9DwFF82KqI6Wua89Mr
   Fprw6nt0DeFFQsx2Ifv6IL+XrIgWCISe0duPgGEvp07Fetsrr0yCSS3vv
   4izHSgBYsTnKYQx/dGylqJZiRt47FpIXV9h/PS45japFT+wT0KKG/B3Oc
   rED4CcBRIedRhAW9A8+iu9fHNIXurXLko6eFhzfU+GGPkrrMS7+o9b+gP
   A==;
X-CSE-ConnectionGUID: b11WNkkOQI6f+An0Jra2+w==
X-CSE-MsgGUID: 0+QFpiYdQHeW08u34FzE1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="543456"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="543456"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:44:34 -0700
X-CSE-ConnectionGUID: A7xAF+jvQ86QaNy8zguPww==
X-CSE-MsgGUID: nhNzkWHhS/yCaInJ3w0gnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1874791"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:44:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 11:44:26 +0300 (EEST)
To: Daasaradhi Mannava <daasaradhimannava@gmail.com>, 
    Denis Benato <denis.benato@linux.dev>
cc: Nikita Kravets <teackot@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: msi-ec: Report valid charge thresholds
 when unset
In-Reply-To: <20260916174812.11496-1-daasaradhimannava@gmail.com>
Message-ID: <12cdf224-08aa-d19f-62fd-fbc6e26d6103@linux.intel.com>
References: <20260916174812.11496-1-daasaradhimannava@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Sep 2026, Daasaradhi Mannava wrote:

> The charge thresholds are computed by subtracting a fixed offset from
> the raw EC value. When no charge limit has been set, the EC can hold a
> value below range_min (0x80 on an MSI GL65 Leopard 9SCXK), and reading
> the sysfs attributes returns nonsense:
> 
>   charge_control_start_threshold: -10
>   charge_control_end_threshold:   0
> 
> Both attributes are documented to be within 0 - 100, and an end
> threshold of 0 wrongly suggests that charging is disabled.
> 
> The store path already rejects values outside range_min..range_max.
> Apply the same range to the show path and report the maximum threshold
> for any value outside of it.
> 
> Tested on an MSI GL65 Leopard 9SCXK (EC firmware 16U8EMS2.100) with
> the EC holding 0x80: the attributes now read 90 and 100.
> 
> Fixes: 392cacf2aa10 ("platform/x86: Add new msi-ec driver")
> Assisted-by: LLM
> Signed-off-by: Daasaradhi Mannava <daasaradhimannava@gmail.com>
> ---
>  drivers/platform/x86/msi-ec.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
> index 566dfc73c..1762551e0 100644
> --- a/drivers/platform/x86/msi-ec.c
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -1279,6 +1279,15 @@ static ssize_t charge_control_threshold_show(u8 offset,
>  	if (result < 0)
>  		return result;
>  
> +	/*
> +	 * The EC may hold an out-of-range value (e.g. 0x80) when no charge
> +	 * limit has been set. Report the maximum threshold instead of a
> +	 * meaningless (possibly negative) percentage.
> +	 */
> +	if (rdata < conf.charge_control.range_min ||
> +	    rdata > conf.charge_control.range_max)
> +		rdata = conf.charge_control.range_max;
> +
>  	return sysfs_emit(buf, "%i\n", rdata - offset);
>  }

Hi,

This seems similar to case in commits:

186bf9031666 ("platform/x86: asus-wmi: do not enforce a battery charge threshold")
78bf392ba77d ("platform/x86: asus-wmi: temporarily revert to setting a charge limit")

(The latter reverts first one as userspace could not handle -ENODATA but 
thought the feature was available.)

So ideally, I'd tend to think we'd want to return -ENODATA when the 
threshold hasn't been set. But whether userspace survives that is a 
question we cannot ignore.

-- 
 i.

