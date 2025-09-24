Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6502D2417C2
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Sep 2025 12:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758718691; cv=none; b=UqTVSJ5RPdf3j+WXVwdIu8aNi+0ZZZG4/9v3oh1tZwxDT+Lmdw29zOuR9a+DYztP7R7ZuSsfDVD7ok4XWCnQzSCr43Kob1GuwFjXiySaZywuPi1PdpfhNRLgoZTXpGuDFapgH/T4R0ln4dfz2sqd7qMx+yxxSSEX+gw7hsqdoT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758718691; c=relaxed/simple;
	bh=7C9XIpDRduZIL8egsg1yNcrX4vd/VDAa2MiMWvwcvKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=joQwMbtUHR2vRV/1nvN9VWFwuTox80hSlgsXNFNsDx96eLGhWX34jK3zFxmsmTBeY8+Ji4RvYDQ4uaxhcbGphW9vwZjx4GCuCtExqy6rP7vkPx2bq++4KC4vLcXuJYdAF/jhMguqNo83cFcjzk9Nqsl9Uq7lJJR7mkyQoIJ1Ifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7H959UX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7H959UX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758718689; x=1790254689;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=7C9XIpDRduZIL8egsg1yNcrX4vd/VDAa2MiMWvwcvKw=;
  b=F7H959UXppjLpNVYlTsrPuqEykNOViwb/TAc5TUwp3eKcc8grOrk2+SK
   HZgbDl2vbRB5u07VT6sgiiUpQbLhh5sIts4ftrEEq0/hKuTplk1ElhNET
   QBKkushoB6mZFVQDho3zjfW2SyAKHVQe8xjYZ2oS6NpmPbKkvwKlrVkCS
   k/sx5X3IxOn4EmF5Q1PV8lNrQNv3VfHsOzMR4dJvzRyh1IVjA0lTcQoKs
   9a5F0r+3+Jd2HT+z8RUs/K6UkovlANf88+POcFTPjPfDwX36jGI8yQpwD
   2xw6lDyAYz6Un/EKH3f7hsfXrSafE2BA7/BZ/stRuGDbjnrFdYnGe4nm0
   w==;
X-CSE-ConnectionGUID: VG2gUxLaTW6FfCj+w39pfA==
X-CSE-MsgGUID: QDmpr56BRAyFoN7JubsfNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="71691165"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="71691165"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 05:58:08 -0700
X-CSE-ConnectionGUID: GDD8DG+2SkWDrvoF1n77BA==
X-CSE-MsgGUID: 1ejfjuwqRCmCg7WACYgtPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="177799075"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.210])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 05:58:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20250920200713.20193-1-hansg@kernel.org>
References: <20250920200713.20193-1-hansg@kernel.org>
Subject: Re: [PATCH v4 00/20] x86-android-tablets: convert to use GPIO
 references + Acer A1-840 support
Message-Id: <175871868070.14395.6462707674732594498.b4-ty@linux.intel.com>
Date: Wed, 24 Sep 2025 15:58:00 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 20 Sep 2025 22:06:53 +0200, Hans de Goede wrote:

> Original cover-letter from Dmitry's v2 posting:
> 
> "This series came about because now software nodes can be used to
> describe GPIOs (via PROPERTY_ENTRY_GPIO() macros) and I would like to
> eventually get rid of gpio_keys_platform_data structure.
> 
> So while I was doing the conversions from GPIO_LOOKUP() tables for
> gpio_keys devices I decided to convert the rest of them as well. Maybe
> some time in the future we can drop support for GPIO_LOOKUP() and rely
> on device properties exclusively."
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[01/20] platform/x86: x86-android-tablets: convert Goodix devices to GPIO references
        commit: 18410aa9a7eb0d14e356938dd3731d80fbc63a9b
[02/20] platform/x86: x86-android-tablets: convert Wacom devices to GPIO references
        commit: da63c8c7efc659b43e41c17cf36f86fb3b1528df
[03/20] platform/x86: x86-android-tablets: convert HiDeep devices to GPIO references
        commit: b395bd659d69a2c541e1d29139c152820186da04
[04/20] platform/x86: x86-android-tablets: convert Novatek devices to GPIO references
        commit: b02961cfb5db0c8f3bae2e8a2ecd733bb7a80351
[05/20] platform/x86: x86-android-tablets: convert EDT devices to GPIO references
        commit: 390d5ea98d52c48d76a6698fecd76979d9486869
[06/20] platform/x86: x86-android-tablets: convert int3496 devices to GPIO references
        commit: 59c4c7c35fc0608e9d1950bac312ad468f2b13f4
[07/20] platform/x86: x86-android-tablets: convert wm1502 devices to GPIO references
        commit: 21b4d30ffb105b959937c997d66b9a9640e8faac
[08/20] platform/x86: x86-android-tablets: convert HID-I2C devices to GPIO references
        commit: baa146abe2e931dba74f77216bcb7d51ffb90fec
[09/20] platform/x86: x86-android-tablets: convert Yoga Tab2 fast charger to GPIO references
        commit: 2a20809592c230a0398bb49754b9ccd480efd2ad
[10/20] platform/x86: x86-android-tablets: remove support for GPIO lookup tables
        commit: 8aba782e0dd9480d593170c04a1382891f13a7df
[11/20] platform/x86: x86-android-tablets: convert gpio_keys devices to GPIO references
        commit: 0cf7267b7fc08506a408b666d32a3a7d34409412
[12/20] platform/x86: x86-android-tablets: replace bat_swnode with swnode_group
        commit: a4808b2cea16d3f00891f059c824e8efb02eb79e
[13/20] platform/x86: x86-android-tablets: use swnode_group instead of manual registering
        commit: 3ac7425599611213f7a6a3f4b15d677da1b36eac
[14/20] platform/x86: x86-android-tablets: Simplify node-group [un]registration
        commit: e79c3a11e2ec9b350464c02a2649214deef53399
[15/20] platform/x86: x86-android-tablets: Update my email address
        commit: 982733083fd9c596d83a2a80b4b07e79e574d028
[16/20] platform/x86: x86-android-tablets: Move Acer info to its own file
        commit: 13ebe111502e6bd2b80f601ef04b9eeb32b3e7fe
[17/20] platform/x86: x86-android-tablets: Add support for Acer A1-840 tablet
        commit: 3aa776857ffb3430a4bec67a384277ee49f8d298
[18/20] platform/x86: x86-android-tablets: Simplify lenovo_yoga_tab2_830_1050_exit()
        commit: f6e9dcdf47c47d29bf5958f463ffc69afe2f3f7c
[19/20] platform/x86: x86-android-tablets: Fix modules lists for Lenovo devices
        commit: 973a8cce1bcb3af7cb1be57f71eb0363645edede
[20/20] platform/x86: x86-android-tablets: Stop using EPROBE_DEFER
        commit: cbeab8fbf4dc51e9050892402ba44b35db6f2bd7

--
 i.

