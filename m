Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAB53081D4;
	Tue, 18 Nov 2025 08:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763453500; cv=none; b=lJwuMUusLzIIaiqWpk2OdpHQCjjtEKJvhMZsAT39F4mtkZj/RoHp4d5GDpfgZ5OBjKfCmbGrdQFG1MJa6XqwwQES2I11qQKMgFgkMbWdWPNrYJmib6sfr+6plj47lko4SPDmN5U6vmEYSsCiD+SV4u3vVVpi25MCax666wUbmXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763453500; c=relaxed/simple;
	bh=UqXTktWds7CFPxMhufRiH/NX0y6l93/T/nBx5eJEOSk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=izo6/8sLMAW9iTM9c/zuukPR7L1Bn8vCS8C7TZBXBSI3/uEUTAzhILmCp6DrZ+M/lEsTW98VOWKkPi+50eAQhjtJHWAGt8iCe6kIqd2Ma/q6divvGTv7Zd0R2wgLbqH57T/jNe2nkk/Mbph2ima7S1jxCrd6hc5IxkZWlhM0UXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HR+aJNK0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HR+aJNK0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763453499; x=1794989499;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=UqXTktWds7CFPxMhufRiH/NX0y6l93/T/nBx5eJEOSk=;
  b=HR+aJNK0GAiy1HBqD78xB99f+7oqwVUFhd7VmdnqI1oI9DmvxMR6cpf1
   ztUNgkjxIHLyqyLXNIasSt7eWmY/udF2zolt1pWuTXA6I3YSwEWfbFY4l
   k+btAygDbqEcusBm8WWRB7B+iF8dyo0zYPSdHcEThBMZuU9Gh+kmL2dXu
   EvmWvTc7MjPieSZ+sXSUcjHCUnVpd+0W2GnJWOFxmk/ygaJJQgHJ4cYLT
   W2vZuApAhlQvti2mEdzMbYTwKyRnrPgztK2OdEwLcGetMKNuJHpGgIX3n
   os2Yfb7WSG3UXQur0NDAs1pcgpjVMbe+uY+Fgr0arhhDYubfqKpVn4h1Y
   A==;
X-CSE-ConnectionGUID: d9/R1aTfQUeBSkHlPd9pXA==
X-CSE-MsgGUID: UM8PbKsPRVKpuLcw0Rod7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65367463"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65367463"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 00:11:38 -0800
X-CSE-ConnectionGUID: 1YEgJd5hS5282VOyinEEZQ==
X-CSE-MsgGUID: LkquBIBvSZihHz2XV2mPjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="228029748"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 00:11:36 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
In-Reply-To: <20251111060938.1998542-1-rdunlap@infradead.org>
References: <20251111060938.1998542-1-rdunlap@infradead.org>
Subject: Re: [PATCH] platform/x86: intel-uncore-freq: fix all header
 kernel-doc warnings
Message-Id: <176345349126.8636.18069708901921659797.b4-ty@linux.intel.com>
Date: Tue, 18 Nov 2025 10:11:31 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 10 Nov 2025 22:09:34 -0800, Randy Dunlap wrote:

> In file uncore-frequency/uncore-frequency-common.h,
> correct all kernel-doc warnings by adding missing leading " *" to some
> lines, adding a missing kernel-doc entry, and fixing a name typo.
> 
> Warning: uncore-frequency-common.h:50 bad line:
>    Storage for kobject attribute elc_low_threshold_percent
> Warning: uncore-frequency-common.h:52 bad line:
>    Storage for kobject attribute elc_high_threshold_percent
> Warning: uncore-frequency-common.h:54 bad line:
>    Storage for kobject attribute elc_high_threshold_enable
> Warning: uncore-frequency-common.h:92 struct member
>  'min_freq_khz_kobj_attr' not described in 'uncore_data'
> Warning: uncore-frequency-common.h:92 struct member
>  'die_id_kobj_attr' not described in 'uncore_data'
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel-uncore-freq: fix all header kernel-doc warnings
      commit: db30233361f94e1a84450c607989bdb671100fb6

--
 i.

