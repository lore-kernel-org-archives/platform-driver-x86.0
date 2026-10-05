Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC214AF9E9;
	Mon,  5 Oct 2026 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214667; cv=none; b=JRSMJY8JAkPe0s8iX7U+KV2Gkde/9eHin2ux7ymE9yUQljliYSldDpK5bxqF4mxgwpmsxxLv6dkS5qea4l6VBfMH9FT3aTCuOi8hJxfm56qsMA1ghQJ24P8GiHhjcSrJTBS9c4Lx3LtHD0iGoNYr5TdwGDTUgET4VZQ1kP+NZ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214667; c=relaxed/simple;
	bh=jeF1YsPqR3d4pumll+p/fww9AiPfZvPeqTDwEGc7N20=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dUqqkcLPXpAe5qzwsHmxpfBro6Hi0kZU+Px2yyJdwDO7fff76a7ZodbjSxPD05mk0wcwFFHfAyrXV66nWb+1hhiZ5/q+NL90GSi8v/614FIj+l84ZOzGpdQsbbr/GQSEkU/MEKT5mPfwR5JjiXV0Vot2DCqXYZWM3S4EDCZhgQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WpsO4If7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpsO4If7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791214666; x=1822750666;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=jeF1YsPqR3d4pumll+p/fww9AiPfZvPeqTDwEGc7N20=;
  b=WpsO4If7S2Ew5vjRaAZrB2Cy++QfRKDasL4vgjEjoJkieS5Qy85vuFwD
   SMCxS+um5UJtOEU/+I89E3UABG+/7w8q8gpBeH78l9TfKo7jYxbEf6hXe
   WDMVKfDZ/LPoLhoq7yzRsbKLusVoGI6M/T6MKgeMwf5EKBD2IPFHi0MT1
   i+AoGqY78iFdjvrbgxXBDlRdtsnCY9McQSmfjRLE+754lwcK5ssZMcdUr
   himmc3Pm0wTmW6x/IT6YPOtW87hKbJnWcRZXQgSgTfGUH+yjwGBTc6j+h
   VzSMO3ppkor0z1ESvjE/jiNMacdqo754IwVTXCNZ7leHsowhgI/FmdQpd
   A==;
X-CSE-ConnectionGUID: MlvAGO+/SMyWTQWeUo8Lng==
X-CSE-MsgGUID: z1aEB5MbRei+4hmxpSnqlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91995660"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91995660"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 08:37:46 -0700
X-CSE-ConnectionGUID: i3EoeAFhSVuayWOJh1ZpHQ==
X-CSE-MsgGUID: c3HuIzocSJSCKWWHHUrifw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="273242483"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 08:37:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jorge Lopez <jorge.lopez2@hp.com>, 
 Muhammad Bilal <meatuni001@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260905214801.76265-1-meatuni001@gmail.com>
References: <20260905214801.76265-1-meatuni001@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-bioscfg: consolidate common
 package-element parsing
Message-Id: <179121465972.12659.2362347240581895957.b4-ty@b4>
Date: Mon, 05 Oct 2026 18:37:39 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 06 Sep 2026 02:48:01 +0500, Muhammad Bilal wrote:

> hp_populate_string_elements_from_package(),
> hp_populate_integer_elements_from_package(),
> hp_populate_enumeration_elements_from_package(),
> hp_populate_ordered_list_elements_from_package(), and
> hp_populate_password_elements_from_package() each parse the same
> PATH..SECURITY_LEVEL range into their own struct common_data
> sub-object, copy-pasted five times. Factor it into
> hp_get_common_data_from_package(), called from all five, mirroring
> hp_get_common_data_from_buffer()'s existing split for the buffer
> side.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: hp-bioscfg: consolidate common package-element parsing
      commit: 4de5dc3bf805e96b41081d8001aaa416e4e58d98

--
 i.

