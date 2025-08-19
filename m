Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F71634575C
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 13:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609441; cv=none; b=SNum5laatgEAdla5i3wrtI0Z89pUWzi5YZaII7S9xEjSg1+WxrbfgfT6UisWfUS5p4wFVuGC2YnhEpzVeTQPLuOiWVSs5AJRh5QK5ER/474UCzjStx3tjWwh5YDKzv6nAqocHg1rGo0m6FIW7N1KhJxEiow5l2yxDr8zoNmus1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609441; c=relaxed/simple;
	bh=urJ892AZ/8xvcRrmb0+EqkHYQbyXKL/fvY4kLQ1ykiY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VtjXQ+RBCxzjA2yrSzPUqp+rr+b08OhYf/Js2kicjuk5GITgcVejyUD7U/ImUaK6VYRtF7XyT5GpO0WSpHH9EamZLDw9aTLA6fKqwVcRBkTD9uArAZTYHKBYt7FkSxYa0pxA4UkdcbxQnk5HdFckHG0GMO462D8x9aaKUr3N1RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j84R6GBh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j84R6GBh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755609440; x=1787145440;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=urJ892AZ/8xvcRrmb0+EqkHYQbyXKL/fvY4kLQ1ykiY=;
  b=j84R6GBhCZyPo1J97LcY4jVC9kxjwp9mFwVWVdMkSzRToiJWbHwyHepK
   EE44dKnhApgpvLxn/7Cc0JJquAJLgwNczgTMoA+hbPhLRJ+aqvlL5cv17
   R4HasE34hDC12srawML8xbfR7Qw2/gAnmg4KhGSCF2bAwrVjNeJE1t1s6
   5xcoyd8VeiXobzKhF3SCWjkrlolrWQ5etgHvPPJgjC98TXTdUIWiSo34f
   4fpkTcQt5LS8X1LCjBXUP5Wo7JVmAZRdi3Bj7DNL+BueDdTMeWxiVNond
   oKldzR2QsZjwgiqSy+xgZ2pPwYRJp7easRftdlqYCYTnnBv6Qk8Lv/Fs9
   A==;
X-CSE-ConnectionGUID: rSKDsSooSQix67Zpmpy0lQ==
X-CSE-MsgGUID: 67x4RWuWTDqSaacQ88G3Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57919329"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57919329"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 06:17:18 -0700
X-CSE-ConnectionGUID: Rq75ee3dQNiWJkghLkNcmg==
X-CSE-MsgGUID: tfu/62CYRLa1qqWMLGJh8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="198858651"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 06:17:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Aug 2025 16:17:12 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
Subject: Re: [PATCH v3 4/9] platform/x86/amd/pmf: Update ta_pmf_action
 structure member
In-Reply-To: <9ec2e048-a14c-4235-9bfd-4d08ef039476@amd.com>
Message-ID: <90dc44f2-eed6-6de0-d662-a0816753c68b@linux.intel.com>
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com> <20250723064121.2051232-5-Shyam-sundar.S-k@amd.com> <0c6a6c0d-9abe-eb64-7902-b9f1045835f5@linux.intel.com> <3d800301-526a-40fc-be67-ae067de03bfe@amd.com> <4a3310d1-0da5-e31f-f25d-5d255fec3d98@linux.intel.com>
 <9ec2e048-a14c-4235-9bfd-4d08ef039476@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-451965885-1755609432=:949"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-451965885-1755609432=:949
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 19 Aug 2025, Shyam Sundar S K wrote:
> On 8/19/2025 17:50, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 19 Aug 2025, Shyam Sundar S K wrote:
> >> On 8/19/2025 16:44, Ilpo J=C3=A4rvinen wrote:
> >>> On Wed, 23 Jul 2025, Shyam Sundar S K wrote:
> >>>
> >>>> The latest PMF TA has been updated with the additional structure mem=
bers
> >>>> for internal evaluation. Since this same structure is utilized in th=
e
> >>>> driver, it also needs to be updated on the driver side. Otherwise, t=
here
> >>>> will be a mismatch in the byte sizes when copying data from shared m=
emory.
> >>>
> >>> How is it known if "latest" is in use or not?
> >>
> >> it is based on the GUID
> >> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/platform/x86/amd/pmf/tee-if.c?h=3Dv6.17-rc2#n30)
> >>
> >> We start of with the latest TA and do a fallback to older TA; if the
> >> TA load fails.
> >=20
> > Yes but how is that reflected to handle the mismatch in sizes "latest" =
vs=20
> > "older" TA? I don't see anything to that effect in the patch.
> >=20
>=20
> In older versions of TA, there wasn=E2=80=99t a spl_arg field (a 32-bit
> integer used to track certain failures and debug features internal to
> the TA firmware). However, in the newer TA, this new member spl_arg
> has been added to the ta_pmf_enact_table structure.
>=20
> If the driver does not adapt to this change in the structure, the
> memory layout becomes misaligned, resulting in reading incorrect
> values from the TA.
>=20
> The ta_pmf_enact_table structure is an output from the TA firmware,
> specifying which actions the PMF driver should take if certain input
> conditions are met.
>=20
> > Is this patch causing breakage with the older TA?
> >=20
>=20
> No. It has been tested for majority of the platforms.

This is contradicting what you said above.

So what layout the older TA has, is it with or without spl_arg? If=20
without, why wouldn't the memory layout be misaligned with the older=20
TA after you add spl_arg to the struct?

--=20
 i.

--8323328-451965885-1755609432=:949--
