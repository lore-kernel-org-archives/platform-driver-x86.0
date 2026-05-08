Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B583C377EAC;
	Fri,  8 May 2026 18:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778264120; cv=none; b=d7DNOQV7LpF0JJBDvtUoPPNDMzjFZtsIk985R+bylzolpon+eMX7/C93SACE8lG7GjOGVAmSVh5mC2uD+K6kPA65u5w/AHTyyyH9+UqioYYz8I8t+t4J83ce62Xm+H4YiNRlw81uE2DVs/PeITcK6QYJR+bij71fTiMvkBtBh7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778264120; c=relaxed/simple;
	bh=mdHroF9S37ifppBRs0LKR1K0mBmTt/gahpNf+/WECls=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sRAhOtG3W59T9E/fb7pkUvXYcYwxJ+lImje+7Dcx4W3p+iNlwmQBKqI35AVVQbdunYwz8UGb7nSnwJKv3hHWBApBQLkUBuxOBigxy0WK9ODQN+TFdOYp+yRAaZkINhq1E2zJ0z8Yn7zx9D9rbwoUIQHIghdXSa0UEaxeXQs5KG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qs9E2Msp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qs9E2Msp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778264118; x=1809800118;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=mdHroF9S37ifppBRs0LKR1K0mBmTt/gahpNf+/WECls=;
  b=Qs9E2MspWe/V9DAl3hIXxZLz38xPkt63E0nBDNE/pmyV1enR6wlAgBnE
   1/a009DeTHsdJgfLoFVxxM7/VjkRSKhLUWtO+yQwskDxNOzELDyLqWJgD
   /p4q68nd0rUBc7l6n3/qxPRj7vyB30rlPpnaJaOLvvsfw4X+rbRhtl1tv
   SZFI0MOUBXMK1Oe17+geyE0OEiwmXdgzM2COXY4XC2bza9nmBmue7G3G5
   2v4m6WYBZM4qhASg+Z5rd6vZL+GM184Yo7nG9VG/B/nqcP3Qyl8DLQqCo
   W5ectCrPE+TbF5jOoxvOwE1649U43wS8T8yi5jb7B2XHhfvB5rZXCylhS
   w==;
X-CSE-ConnectionGUID: SrIB4Xz+QHKU5d3LnlqYWg==
X-CSE-MsgGUID: F41VRMK2Rz2GddkpO7pr5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="96665813"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="96665813"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 11:15:17 -0700
X-CSE-ConnectionGUID: 9+6n3pxLTLe7EgyqEgMLMw==
X-CSE-MsgGUID: cOWgOLSzSl+z/A0Dsnkg2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="232320409"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 11:15:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
 Peter Korsgaard <peter.korsgaard@barco.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 brgl@kernel.org
In-Reply-To: <20260427102459.110332-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260427102459.110332-1-bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2] platform/x86: barco-p50-gpio: attach software node
 to its target GPIO device
Message-Id: <177826410949.8043.11494785633688307149.b4-ty@linux.intel.com>
Date: Fri, 08 May 2026 21:15:09 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 27 Apr 2026 12:24:58 +0200, Bartosz Golaszewski wrote:

> The software node representing the GPIO controller to consumers is
> "dangling": it's not really attached to the device. The GPIO lookup
> relies on matching the name of the node to the chip's label. Switch to
> using platform_device_register_full() and use the swnode field of struct
> platform_device_info to attach the software node to the GPIO device.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: barco-p50-gpio: attach software node to its target GPIO device
      commit: 49133d4ae0c9ceb63fa042c0b46b34e26e1c6676

--
 i.

