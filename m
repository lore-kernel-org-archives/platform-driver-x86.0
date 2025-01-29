Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45563C38;
	Wed, 29 Jan 2025 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738158431; cv=none; b=jJ3HaSPlOLAxWdX0elzDln2MG8ZhpsfrYAjg3jkCApO7OxJec6U83ty7TDdwLTrIUYb9pO9NbgRs9C8oTxuTQLaaBcA2xOOyKo1L/3JOEzgE/fnr7AtQWeNRU4huS6P6xnuep5wbWFHr8PMhwLHHYKrC0WCr7yatHVctsN0Bagg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738158431; c=relaxed/simple;
	bh=8SYv6mtEgfjDqz5gzDxWvuKmmngjVuTcnORh0azYyCw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=toCbtC96ab9WhbrBouNGxOjA2l+zZ36bcpiNUQpvR849oAvKiMUlaXaBKc74WP6zEhFz8ArN0Y5WmwiW6acnsEjK56RqndWeyuwhzsQpUHHkKLllLZdlncPVgTUOqgPinCQyl3hTzq6EQcWju8q+1i6IVhoEq81tvWvJfpbCYRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3snAP8j; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3snAP8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738158430; x=1769694430;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8SYv6mtEgfjDqz5gzDxWvuKmmngjVuTcnORh0azYyCw=;
  b=i3snAP8jXIHeErsz9hJRa50aBmKa0EBcqsFnqHkvbyuxoZUnBOixTqrU
   AgipEZY20PBc1Higrt7SJB7acCKEKse5CHxE34i0NszSEi5CTi5AQ0YiP
   B8p5NpoZE6TrZrACr2ueJ+5GCKRGQW0CmI+Bz1qkr+TFKKB/hOV1V2XJO
   cCmH6t3bC0R/NGCUjNR02xcZOWs+IBJwrSnnIdf9MZMUDuxoUkkxsVMqT
   a3gsj+on1xb4yvCS+CVYHFLDGm4bG37Z3nO+cXYHehE+u6WZF+AMpbaA0
   LjQPQW5CHWxtXUCRKUcIaDCFGLd8HXiXYW0uA7oQl+LxUbF5Pacg3dwiJ
   Q==;
X-CSE-ConnectionGUID: 0ZnC+eFcRoejaeOzJc2yMg==
X-CSE-MsgGUID: xI5XCawBTYqS3xpGnboHZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38927513"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="38927513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 05:47:09 -0800
X-CSE-ConnectionGUID: 7X8MdfXsRCmVWPRvxOmlEA==
X-CSE-MsgGUID: v6aCDIzBQm6RtZKAc5ESAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="139926940"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 05:47:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 29 Jan 2025 15:47:02 +0200 (EET)
To: Joshua Grisham <josh@joshuagrisham.com>
cc: Kurt Borja <kuurtb@gmail.com>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    W_Armin@gmx.de, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8] platform/x86: samsung-galaxybook: Add samsung-galaxybook
 driver
In-Reply-To: <CAMF+Kebx4sU+0p+pFaH1Lz4q1xApM8iS9UAYP=sZnE2GDa32ww@mail.gmail.com>
Message-ID: <7e968d58-4c9b-59de-ee2b-15086d6c918f@linux.intel.com>
References: <20250118202632.8352-1-josh@joshuagrisham.com> <e67bf708-be8a-4331-b250-d2f31e38536b@t-8ch.de> <CAMF+Keb5UzEUeim=33JR=Vv8qK7xqGn_jjNdtZMQTFtrpKrgSA@mail.gmail.com> <D7B8WVUD7F4B.1BL2WE2BNRCX6@gmail.com>
 <CAMF+Kebx4sU+0p+pFaH1Lz4q1xApM8iS9UAYP=sZnE2GDa32ww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2083116426-1738158422=:933"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2083116426-1738158422=:933
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 28 Jan 2025, Joshua Grisham wrote:

> Thank you Kurt!
>=20
> Den l=C3=B6r 25 jan. 2025 kl 16:06 skrev Kurt Borja <kuurtb@gmail.com>:
> >
> > Now I understand the original problem better. I didn't consider this
> > possibility when designing the callback.
> >
> > While this is a fine solution I believe Thomas' EOPNOTSUPP solution is
> > the way to go. I think positive err value would be the safest but you
> > should wait for the advice of someone with more experience.
> >
> > Aside from that I really like how the whole platform profile sections
> > works now. Good design choices :)
> >
> > ~ Kurt
> >
> > > <snip>
>=20
> Regarding using this positive error code internally within the module,
> I thought about maybe adding a comment to galaxybook_probe() before
> all of the inits which describe this a bit -- do you all think this
> will be helpful or is it clear enough / does not matter and can be
> skipped?
>=20
> I also realized that maybe it is worth to describe that a specific
> sequence is needed for doing these "enable feature" + init calls to
> the ACPI methods otherwise some devices were reported as starting to
> reject the payloads if the sequence was not followed.
>=20
> Based on these two then I have drafted a comment sort of like this to
> put in galaxybook_probe() before the init() calls:
>=20
> /*
> * Features must be enabled and initialized in the following order to
> * avoid failures seen on certain devices:
> * - GB_SASB_POWER_MANAGEMENT (including performance mode)
> * - GB_SASB_KBD_BACKLIGHT
> * - GB_SASB_BLOCK_RECORDING (as part of fw_attrs init)
> *
> * The init function for features which are not supported on all devices
> * will return EOPNOTSUPP (positive to differentiate it from upstream
> * error codes) if the feature is not working and should be ignored.
> */
>=20
> Does adding something like this seem like it would help make
> everything more clear (especially thinking when new refactoring comes
> by other maintainers in X months/years/decades, it would probably help
> them to know these subtleties, right?)?
>=20
> If this comment (you all are welcome to suggest wording tweaks as
> well, of course!) plus the few other small tweaks make sense then I
> can prep this to send as a new version. But I am holding a bit in
> hopes that the 6.14 stuff gets merged to pdx86 for-next so that I can
> go ahead with implementing Thomas's new power supply extension
> interface at the same time.

Hi Joshua,

In general, you don't need to wait for me to act because any commit in=20
Linus' tree during merge window will be fast-forwardable to 6.14-rc1 which=
=20
is the commit I'll be basing for-next for 6.15. So you can just pick the=20
latest commit on Linus' tree and rebase on top of it.

If there ever are some commits applied already during the merge window=20
into for-next, those would get rebased on top of rc1 once it's released.

> Because there are multiple variations to these devices, and there were
> some small issues that users with other devices found, I was
> thinking/hoping once all looks good for all reviewers, including
> implementing the power supply extension, that this could be merged in
> to for-next and then I can ask a few people with other supported
> devices to test this revamped (and in some ways completely refactored)
> driver directly from the branch so that we can try to catch any other
> issues that I did not see on my device before it is proposed as a
> candidate for mainline -- does that sound reasonable?
>=20
> Thanks again!
>=20
> Best regards,
> Joshua
>=20

--=20
 i.

--8323328-2083116426-1738158422=:933--
