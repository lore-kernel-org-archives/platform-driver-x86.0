Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBCE18C933;
	Wed, 25 Mar 2026 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774442411; cv=none; b=tH5BdvlMuj72G336z6LFegxTRl40pX/Fa3O8WqvcsM5VPRPJ0MxoPKrR3KlsEt9IdhUoqZjIAQCH8iLp+IQmmaDeFHpM5uf7A0a+RAkb2tCnjuRAD6dDEoyOgemmjJt5YM7oXdHZvtRD+4raBDyZA4OfejrrPW67Ud6ESE7waw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774442411; c=relaxed/simple;
	bh=iDTJEmkn6QJcWt99hQS4yf9yVnP4W/A9/3Y7ny/JdGE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rm6dm4kqH6j63adaNM3AgWWRrxjQPvcs/aRk06sOFAEqJLLEfykuJlazaNm6E4BlftBtAYUEn7457W//FYlONT7KqtWLvhCEaf1q6UQ0VlX5u1q9T82WVUO9H4i0k4ssdNo2373bNNB0I9BVkgBHO4q0VwhZXv3vWA6eQOeNOKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LI4GsuyE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LI4GsuyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774442411; x=1805978411;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iDTJEmkn6QJcWt99hQS4yf9yVnP4W/A9/3Y7ny/JdGE=;
  b=LI4GsuyEr+/dpenAlp01n5E0LSnM4yiWbJ/mNpkWwlhWzCe7q0jxZKIy
   43sPgCEoL972Y/RsdPh2KGrQmrQ+AHYtQnqfTTVhWN2hM4i+leqaLK4hz
   JH7bqwTWl2GlmOyflv5BNJuEoLz2EV+BEWx6AblJopaDC3njdrqyQ0oHV
   1HbnaXJvGOtJAuvS6UCaKsjvVSq+JQTb2O8FbJdolZrG3AqR3ABbNCv88
   SEv0cOs0kt65h86Z93pvPyaVQPEMGpcYSAdo9/1Bs208QaNWTZ/MWQ+Fb
   aqQtOwp9daDBC45JN5UBZY2X7DF+t4ib3VxCMeLNQ3m97jjM45WhB6Y3d
   w==;
X-CSE-ConnectionGUID: vx1o0qlURAuaBSL21nrJCQ==
X-CSE-MsgGUID: WAFKizSYRWWrhNi4rE9k3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75358702"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75358702"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:40:10 -0700
X-CSE-ConnectionGUID: ezgiAjKiR5SBO5cIqEQbNg==
X-CSE-MsgGUID: D5Ht0F1UT32Hb4vnyuaAPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="220264398"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:40:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Mar 2026 14:40:05 +0200 (EET)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 0/5] platform/x86: uniwill-laptop: More support for
 TUXEDO devices
In-Reply-To: <20260324203413.454361-1-wse@tuxedocomputers.com>
Message-ID: <704a7de4-ee2e-5f1b-56e1-452fbb1af242@linux.intel.com>
References: <20260324203413.454361-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Mar 2026, Werner Sembach wrote:

> v2: Incorporate Armins feedback.
> v3: Incorporate more of Armins feedback.
>     Rework USB-C power prio functions
> v4: Readd system vendor SchenkerTechnologiesGmbH for XMG FUSION (L19)
>     Replace for loops with if statements for USB-C power priority functions
>     Add missing mutex in usb_c_power_priority_restore
> v5: Restructure patch around new entry for XMG Fusion
>     Add missing Reviewed-by and Tested-by
>     Spelling fixes in documentation
> v6: Fix small format error in docs
>     Fix Reviewed-by line
> v7: Variable rename to lowercase
> v8: Move USB-C power priority init to after probe call
>     Clarify documentation

Hi,

Does this conflict with something that went through the fixes branch? I 
tried applying this through for-next and get fails so I guess I'll have 
to merge fixes to for-next before I can apply this.

It would be nice to mention any known conflicts in the coverletter.

-- 
 i.

