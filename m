Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FFC25948E;
	Sun, 29 Dec 2024 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735487042; cv=none; b=aFFIOwpem8LCnoqg9K4TQHPLuJKUm6nO9aLla5ERUNZRrO7Bs4Hr5C45LIOcur/M1+l4WPkQSids9aFe2x7OSVYbnruYMrq7yK9vChJsonaYoQm3wqsqky+14Dv52eQlTFPuuwgfqHfCPL7jNN2l8gJnb3spYEuXO8XengOQ5Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735487042; c=relaxed/simple;
	bh=44SWiTFr+CXt/AnoHtixn0sx2cGxT8V7kDHWzN22Vhw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iUE/GhyeTXAMkuha6k6hrdf881k/hmTdmf22pncwiF1PL+U1B+OW7fGj+iZwyueJlBJh1oXBV6CzOcm7G/voZ+y6GoV/A4IDIvyxFd0TYh624ijr8LJ3RFM1QXSGIWR6vSkiHrNv5Xq8BBncbarfhDrhNcX1TDQ2FjLdytkYM84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qgdv2Luo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qgdv2Luo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735487041; x=1767023041;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=44SWiTFr+CXt/AnoHtixn0sx2cGxT8V7kDHWzN22Vhw=;
  b=Qgdv2Luo4LrEn3Lje4DgPCLLBTtRslPJ/rd1DsIOhnQj5XBP4YcmGJGD
   8J6q5lbX5i+OYcxnVj5vHv6LsVxcngXloAf8a1KIADO8m1v4qGRkpBCQV
   wF0yLq2ithMTG7p2mA3ytWjPLStoy3vMe5YgvFow4IskhZ0petamh5SEX
   z540QIcCWTIdDenEyXnnlIrA5mb2coPurvW9v38XO5tnHM6HfmoiTKMc0
   keuh1eFnZRGTixl1Us9R177SZjOBNHXgT8icgCToZcy6TnRAhVEk0l31c
   /oPhn7UduQ+68EDqL+nIpO/PFWb0kUvUw/X21zfx5Q2G2kufnSc5BfXvn
   A==;
X-CSE-ConnectionGUID: GcmOZ/MvQvCc1kGeI7UKOw==
X-CSE-MsgGUID: 645M+FSxRj2DQjp8/vEp5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35672345"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="35672345"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 07:44:00 -0800
X-CSE-ConnectionGUID: kZWwyW5PSLKGI+gdfz3/rg==
X-CSE-MsgGUID: UKNjC4cmRMOZfaubjkBSuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131531612"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 07:43:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Alexis Belmonte <alexbelm48@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
 Mingcong Bai <jeffbai@aosc.io>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, Xi Xiao <1577912515@qq.com>, 
 Ai Chao <aichao@kylinos.cn>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241226062207.3352629-1-jeffbai@aosc.io>
References: <20241226062207.3352629-1-jeffbai@aosc.io>
Subject: Re: [PATCH v2] platform/x86: hp-wmi: mark 8A15 board for timed
 OMEN thermal profile
Message-Id: <173548703218.4495.8886515367026701996.b4-ty@linux.intel.com>
Date: Sun, 29 Dec 2024 17:43:52 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 26 Dec 2024 14:22:05 +0800, Mingcong Bai wrote:

> The HP OMEN 8 (2022), corresponding to a board ID of 8A15, supports OMEN
> thermal profile and requires the timed profile quirk.
> 
> Upon adding this ID to both the omen_thermal_profile_boards and
> omen_timed_thermal_profile_boards, significant bump in performance can be
> observed. For instance, SilverBench (https://silver.urih.com/) results
> improved from ~56,000 to ~69,000, as a result of higher power draws (and
> thus core frequencies) whilst under load:
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: mark 8A15 board for timed OMEN thermal profile
      commit: 032fe9b0516702599c2dd990a4703f783d5716b8

--
 i.

