Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7DD1AAD2
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jan 2024 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706094150; cv=none; b=BsED+FF/7CeyYmkAnwVOXV1Gz0ycon8Xij8lRacoyjb/GSbZKBIbZlc8k5BrBLcL9MBa2Kra2VsWvO3fyc9s/Z6mAhAoSRmR/qCXQqSetbl+pukRmGc9FrY/UhfpkirSNEYBXzRwlTZSjFtG8AVBRT2W+7ilP685Nny8gZcNoAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706094150; c=relaxed/simple;
	bh=4mpqpzFBfMvbqxghA0sKLCE2NLXRRpxqEubUijAT4iE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sc4qw0dRW7PcV/f6XogObzE8woTyH+s2YZmU64y19rfGNeJKtNlEUW9iBobWYE74Mv+6io82I0iFZCc4yWvOjZg1v6CAq7FZXCXM12dJ0IyYrYqagRkuu60I337Uk3blXqMVIonCRsOXqU1M4dlRiV0MjIzZ0pX5/0LEGQGIDGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SfX3iKqd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SfX3iKqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706094150; x=1737630150;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=4mpqpzFBfMvbqxghA0sKLCE2NLXRRpxqEubUijAT4iE=;
  b=SfX3iKqd7IaUoS/ZhuhRLfZq1YlSS5J2Yn+oNQNuCjdsANsz2FN2bxs1
   GdEAAOuLXccbKh47UigzeZsvgIEiv6B7kjnG8Gsj8TZbpMBdE7el7FOvj
   x8g28ZSgtF5bydjo4Cak3InG+IaawgpRs6C8v+7JpndCiRY26Jy/c8w2k
   oTBwjh+nT4o/cgiwSLmz8E+LrYfSnxjhzildk5QS1bxZu5TQrfWBJ2nWE
   LNeVjcv70dJsntUzcHMAVCDbnA7y1wKSfFBZewLa4GW4MVf91b5YOJ9b/
   cfeygPpKa2wV/NCcQk5slqKtjs36Iiusg+28PCHqcNHfMg3aNvTHyyhKU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8464532"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8464532"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 03:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="786382034"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="786382034"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.46])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 03:02:24 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, Matthew Garrett <mjg59@srcf.ucam.org>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: acpi4asus-user@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 ibm-acpi-devel@lists.sourceforge.net
In-Reply-To: <daef7331-dcb4-4b3a-802e-656629486b4c@gmail.com>
References: <daef7331-dcb4-4b3a-802e-656629486b4c@gmail.com>
Subject: Re: [PATCH v2] platform/x86: remove obsolete calls to
 ledtrig_audio_get
Message-Id: <170609413797.14220.13217709877219637231.b4-ty@linux.intel.com>
Date: Wed, 24 Jan 2024 13:02:17 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Sun, 14 Jan 2024 18:14:54 +0100, Heiner Kallweit wrote:

> Since 64f67b5240db ("leds: trigger: audio: Add an activate callback to
> ensure the initial brightness is set") the audio triggers have an
> activate callback which sets the LED brightness as soon as the
> (default) trigger is bound to the LED device. So we can remove the
> call to ledtrig_audio_get.
> 
> Positive side effect: There's no code dependency to ledtrig-audio any
> longer, what allows to remove some Kconfig dependencies.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: remove obsolete calls to ledtrig_audio_get
      commit: 2cee4d0c82c023c9012a3a8814cc5c2bcc9b6db6

--
 i.

