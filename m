Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ECA2D594A;
	Tue, 18 Nov 2025 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763462880; cv=none; b=a1N4If0F8ioaq9oD5atIEw2NDo0LYKf4bJJABLnujg5FJK4BVPcAZmDZTdGvn4Aif59fNDK/9wbFRNDEMTw4jFoJaftz/p4842zQsqKW2p2WbDo8hXo3pCTQ4EQ0wit+INvgW96KBmmnnbmk7gRdspjQJAcET2axEreOfXqlXd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763462880; c=relaxed/simple;
	bh=PGEftokQR5hA76T/FWnPGnS+eHqAV/vx6DV5hCR0a4Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ljvoc5wEXMqiJN5m6ghlgDhcm7EITAmfC5rXrIFeIN2y/yDzWZyGLMcfcaJwOlWBo/PG1Ct42Vm70j6aRF7l+YWFKGjW1C0U3NO6Qxw6LQEgXju/tF8DaywYfjwgSRoC4eRsnba5BwxslmX+YNjsTMi0t28maCGIVidIJrznAA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crP+PcHJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crP+PcHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763462879; x=1794998879;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PGEftokQR5hA76T/FWnPGnS+eHqAV/vx6DV5hCR0a4Y=;
  b=crP+PcHJlw0gKIFOm2ebPf0MVnCpcZqQep4ssOg/nkhP7pWG4rovy1pu
   tYQhPq7/ZZK5e/l7HhMybbIPo9OCoPoWlx2nbhihNXIdNk+2jgIvPeApq
   +tOfoA0g1TZ4/feRQIdPWhZ9NGrrDUTc4qmKM+d+VhHosbP0UlZgigjXC
   XJgboloE/TZmxBcNDIe+q562GzbaxvUU4F0mFkg+JO8k/kv/M+vDHoCmB
   NO33KljWkKK9dbhSuTP01MGRvLv+Yj8o9RnMCN/k3bmIq83c29cymHhDF
   IMBiBTARUXCX6ZNi0Hcnz6E7HtVWp+g4nHUQaKpe2bXcSQxi4OV5RmyyF
   g==;
X-CSE-ConnectionGUID: RFqvVWVaQ3OQS0g6cE7Qzg==
X-CSE-MsgGUID: eRI4eDrhSyOAPNzUUXOhVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="64680467"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64680467"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 02:47:58 -0800
X-CSE-ConnectionGUID: dBI2P6c1QA+Y5CnvZodF3A==
X-CSE-MsgGUID: Zh9jS38JTgeRYMP9qGy1uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190749294"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 02:47:55 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 12:47:51 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: jlee@suse.com, Bugaddr@protonmail.com, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: acer-wmi: Ignore backlight event
In-Reply-To: <d4ce47e0-cae6-4410-a9b2-e2fce571d019@gmx.de>
Message-ID: <904d27a8-fcfc-35fd-153e-7cb48cc1fe4c@linux.intel.com>
References: <20251117155938.3030-1-W_Armin@gmx.de> <176345348327.8636.1554023632757663812.b4-ty@linux.intel.com> <d4ce47e0-cae6-4410-a9b2-e2fce571d019@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1111993719-1763462871=:1205"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1111993719-1763462871=:1205
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 18 Nov 2025, Armin Wolf wrote:

> Am 18.11.25 um 09:11 schrieb Ilpo J=C3=A4rvinen:
>=20
> > On Mon, 17 Nov 2025 16:59:38 +0100, Armin Wolf wrote:
> >=20
> > > On the Acer Nitro AN515-58, the event 4 - 0 is send by the ACPI
> > > firmware when the backlight up/down keys are pressed. Ignore this
> > > event to avoid spamming the kernel log with error messages, as the
> > > acpi-video driver already handles brightness up/down events.
> > >=20
> > >=20
> >=20
> > Thank you for your contribution, it has been applied to my local
> > review-ilpo-fixes branch. Note it will show up in the public
> > platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
> > local branch there, which might take a while.
>=20
> Thank you. I just noticed that i made a slight error inside the patch
> description:
> Tested-by: Reported-by: Bugaddr<Bugaddr@protonmail.com>
>=20
> Could you fix that up inside your branch?

Hi,

Hmm, I didn't notice it myself but think b4 did change it as this is=20
what I've in the commit 444a9256f8d106e08a6bc2dc8ef28a8699e4b3ba:

    Reported-by: Bugaddr <Bugaddr@protonmail.com>
    Closes: https://bugaddr.tech/posts/2025-11-16-debugging-the-acer-nitro-=
5-an515-58-fn-f10-keyboard-backlight-bug-on-linux/#wmi-interface-issues
    Tested-by: Bugaddr <Bugaddr@protonmail.com>
    Signed-off-by: Armin Wolf <W_Armin@gmx.de>
    Link: https://patch.msgid.link/20251117155938.3030-1-W_Armin@gmx.de
    Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
    Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

?

--=20
 i.

--8323328-1111993719-1763462871=:1205--
