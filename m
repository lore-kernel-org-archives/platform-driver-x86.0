Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4D64014A0;
	Thu,  9 Jul 2026 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593206; cv=none; b=tG0YaqxE8W3D6swOHQd1yGp4nmjZW2dhH3o1coZctwRNShYTZoDSQw2JSWkxoXsMx0DfPqgjqeihWFvsOXHXR90ZgYHefS+8iqWdPIeWE0k99BxgP/f5+8ABkTfzSCk4XsuEsjP37gDVR5+6jF1OYb3AmnM5IkI/WeT9wP7rUmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593206; c=relaxed/simple;
	bh=NzC0KK0S4W9KNfMpmtp8LDTcauuHrJO6BtxCGluJTME=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=c5w8JcXWIeVS+c1U3pds3gNGo5DD6x06WB8yT1g4URuAb2rB3NYXfXlNHq0GkXn6IZY2Ca0qTUdjViuteRiJr49fd9UulncFySIU4UsGKFmvV8yDY8c86ZCAklElUDyi7QEFEHdPgUtp/3wyT4k7/aFn08FCXZMEYnrsEJo7DVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BH2sFns9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BH2sFns9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783593204; x=1815129204;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NzC0KK0S4W9KNfMpmtp8LDTcauuHrJO6BtxCGluJTME=;
  b=BH2sFns9hX3Jsq7cHdGoqZZsFmCRpXp4lq/byZVf9p8xvQkkUpeg3fxa
   OZqXkxuhDlj6XqDhj/3jVIWoEKo6lb0vXk+X0tkpSrbKY9FskiIGSLYRE
   qtHLXft5oGapVLmpXRkLX+EuQ1LN0UQevx87gTlpT+qkQ/LxHSPbgoz9E
   3wiqrG7rIQ7rRGlp7T5Hlrcwg2s47NUzlTKFXHWiS3DLBZeBN4dye+mKQ
   U07ACB3MX01Hkc+3tOuNOeVEXV81oyAYeIo8ScIgZLOzMSkNBa4j7E2Y+
   SBTj5FvmpNLrHAkGwmeLI5iEkYxNuj6JxsG3dg2g7b2jGx95BvWcAgBMp
   g==;
X-CSE-ConnectionGUID: P+ViiSXPSreCiCi0/pqh1Q==
X-CSE-MsgGUID: yGnVdzoJRQugaAFxCbscAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84148849"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84148849"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:33:24 -0700
X-CSE-ConnectionGUID: CaMs6pyjTfKGXIFh5hY0MA==
X-CSE-MsgGUID: mzbW4K7tSm6twJs2Ip1kEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="256469330"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:33:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Jul 2026 13:33:16 +0300 (EEST)
To: Dave Carey <carvsdriver@gmail.com>
cc: platform-driver-x86@vger.kernel.org, W_Armin@gmx.de, 
    johannes.goede@oss.qualcomm.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 0/2] Lenovo Yoga Book 9 keyboard dock detection
In-Reply-To: <20260708150909.23404-1-carvsdriver@gmail.com>
Message-ID: <67a391a0-4bfa-f2f5-10eb-0a7f57e7ebea@linux.intel.com>
References: <20260623125914.833063-1-carvsdriver@gmail.com> <20260708150909.23404-1-carvsdriver@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1595905653-1783593196=:1261"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1595905653-1783593196=:1261
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 8 Jul 2026, Dave Carey wrote:

> Changes in v12 (addressing Ilpo J=C3=A4rvinen's v11 review of patch 2/2):
>=20
>   - Add #include <linux/sysfs.h> (for sysfs_emit)
>   - Add #include <linux/types.h> (for __le32 and __packed)
>=20
> Changes in v11 (addressing Armin Wolf's v10 review of patch 2/2):
>=20
>   - ABI doc: correct Date to "June 2027" and KernelVersion to "7.3";
>     these fields should reflect when the ABI lands in the kernel, not
>     the submission date.
>=20
> Patch 1/2 (lenovo-ymc) is unchanged from v10.
>=20
> Changes in v10 (addressing Armin Wolf's v9 review of patch 2/2):
>=20
>   - Update ABI doc: Date: June 2026, KernelVersion: 6.16
>   - Add #include <linux/compiler_attributes.h> and <linux/types.h>
>   - yb9_kbdock_query(): change return to pointer-out u32 *bkbd to avoid
>     a 0xFFFFFFFF status value being misread as -EPERM
>   - struct yb9_kbdock_data: add spinlock_t lock
>   - yb9_kbdock_report(): hold lock across input_report_switch + input_syn=
c
>   - yb9_kbdock_sync(): return int, propagate query error to callers
>   - yb9_kbdock_resume(), yb9_kbdock_block_probe(): propagate sync error
>   - struct wmi_buffer out: remove zero-initializer (not needed)
>   - yb9_kbdock_notify_new(): drop manual length check; use
>     .min_event_size =3D sizeof(__le32) in struct wmi_driver instead
>=20
> Patch 1/2 (lenovo-ymc) is unchanged from v9.
>=20
> Dave Carey (2):
>   platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
>   platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver
>=20
>  Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock |  19 ++
>  MAINTAINERS                                               |   7 +
>  drivers/platform/x86/lenovo/Kconfig                       |  14 +
>  drivers/platform/x86/lenovo/Makefile                      |   1 +
>  drivers/platform/x86/lenovo/yb9-kbdock.c                  | 322 ++++++++=
++++
>  drivers/platform/x86/lenovo/ymc.c                         |  19 ++
>  6 files changed, 382 insertions(+)

Please resend this series into a separate thread (you can reuse the=20
version number as long as there are no other changes).

In future, always send new versions of a series into own thread so that=20
our tools can better distinguish which patches belong to which version.

--=20
 i.

--8323328-1595905653-1783593196=:1261--
