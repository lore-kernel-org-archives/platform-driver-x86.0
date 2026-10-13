Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0613A543A;
	Tue, 13 Oct 2026 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882794; cv=none; b=nxtbKOWBZxzIF19bTnO97O1EkIKdeNj6h+vst+dHX5K1T+9nHu9TB8csoONoAqCVsRld7AnPW0rqxDJWiGbrY58Bjd+nayvZCyKtpacAbZW/73WKkA+wwpSQYsDF1rxtqJBeK7upG/ro25iIsxbp14R4FDjXBmWTiBMRkvLMgr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882794; c=relaxed/simple;
	bh=xdKCKHnE+HjehhErt/0TiLE1C2dWiEwZprXSxT03iQ4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=N1ZaSi2HhLkSVxE7SQ+qwtOw+O4X14n0QJQDCI5rzgAGG3uaX5oWhIup92lmWRiZn/d1zrTlTGC3jMmarbHDhx1LF2SE4jUHB1su4Sntuc+HLSedHqkqfA+eyxzjPqb6XHSyVTMRA+KThJ+/XRR164Y+AD0yyk9h1VjOPn2v9c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLfVHC2d; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLfVHC2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791882793; x=1823418793;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xdKCKHnE+HjehhErt/0TiLE1C2dWiEwZprXSxT03iQ4=;
  b=iLfVHC2dl7neB69G63ocnSHG/o2mGps5Zkb8b58UwtzdP+BzKg6iFsiR
   pwF6lyCA87YBV+WfH/jIdkV7cwZoRGuou52epEB/md5XbKFqLU7ReaivD
   M2lt8FuUQ13knXpOkHoP5YbjlEG8+qGn4b16v66KddVXIjwp6pZ9r1+dD
   GnZmSMYLRdFk11ckwcsSYo12HYSCYK5MgHuFr5DM8ArZ+lcloQk4vGmVn
   Ab5yo6dUQQINyM9P1vPv0RzQRSzOhgaNb6Dl2tla7SFZWgPTK/heozawS
   DOsCszdqoEFLnkUrScfUEBN4mm1jZqYCxuagEMmnrAtaRo1V/ObBZzrmJ
   A==;
X-CSE-ConnectionGUID: e5hOlfZqSnS2eVFHczTIVQ==
X-CSE-MsgGUID: 2RjelnXeSL6c0DQWJIkfMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="610069"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="610069"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 02:13:12 -0700
X-CSE-ConnectionGUID: rtPMb2auT4WcX2Qt4aKNOQ==
X-CSE-MsgGUID: u3tn8y16QJ66mkf+jZiCFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1213842"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 02:13:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 13 Oct 2026 12:13:01 +0300 (EEST)
To: ShaunV334 <shaunvarghese43@gmail.com>
cc: krishna.chomal108@gmail.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: hp-wmi: add Omen Transcend 14 8C58
 support
In-Reply-To: <178975596627.29716.16369572610260910575.b4-ty@b4>
Message-ID: <06e6bbd9-dc5d-e05c-8a3b-2e21de408a6f@linux.intel.com>
References: <20260906130114.139261-1-shaunvarghese43@gmail.com> <178975596627.29716.16369572610260910575.b4-ty@b4>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2062008638-1791882781=:1237"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2062008638-1791882781=:1237
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 18 Sep 2026, Ilpo J=C3=A4rvinen wrote:

> On Sun, 06 Sep 2026 18:31:14 +0530, ShaunV334 wrote:
>=20
> > Thanks for the information, I've currently added 8C58 to hp_wmi_feature=
_boards[]
> > and removed it from omen_thermal_profile_boards[] as suggested. Manual =
PWM fan control
> > is confirmed to be working but the GPU is still missing that additional=
 +15w from 'Smart Performance Gain'.
> > That will require further investigation.
> >=20
> > Add the HP Omen Transcend 14 board name 8C58 to the hp_wmi feature
> > board table using the existing omen_v1_legacy_board_params.
> >=20
> > [...]
>=20
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>=20
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
>=20
> The list of commits applied:
> [1/1] platform/x86: hp-wmi: add Omen Transcend 14 8C58 support
>       commit: 4dabecbb202e872dc8cd4c4b5ee7076b75e23162

I had to dropped this patch because it's lacking a proper Signed-off-by=20
tag.
=20
Please see Documentation/process/submitting-patches.rst for more=20
information on what is required and send a new version with the problem=20
corrected.


--=20
 i.

--8323328-2062008638-1791882781=:1237--
