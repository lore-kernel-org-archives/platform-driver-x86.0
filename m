Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE95612EC
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 12:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706532288; cv=none; b=IiFrBpAsDbypAv8OlOoZvC5pbrvSMErsETd5CEfUX6qWqpVFm8nafLrv6wItOeLYSIE3TlXCIXOIsp6l/jjW/o1E52lzhOiCOOOyQmctoR2EF0iJ+fCrqqmlNN8MEM+RPdWzDnXtQGfAy6GBONXyoQdlzVp8j3GUrxXW+rIegKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706532288; c=relaxed/simple;
	bh=65v4fe2J6nerp1uTkvuFTLIjV8Txgu5ps4mxqAyMGdo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NLz3pINjYgg26AQAE7yKNAJmetjVz8vA8XOsma26GpgT3IUpkZni2bn74zMP2WblbdUYMkUy8qn3F/1FDZeUtuq1TNCxX2sadMM6E2JPDj7JJ9lxGngu++S7GVpdmTT+n32SXZhIIDYPco2MIFwthRvvmITuIBYP+8RQs/yeXqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbOalry4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbOalry4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706532287; x=1738068287;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=65v4fe2J6nerp1uTkvuFTLIjV8Txgu5ps4mxqAyMGdo=;
  b=WbOalry4mF7JjQ8y/iD9XUQyiS6fpS2yAUYXWKztjuqbvv47jZkw5fi/
   haoyNUj/7jj/Hw3kDf5Z/5+ql3wXBaDp+IqseHXvewuxR0I/ZUXwWAIcW
   8Td31hJLn5rJF4lAsdrOQC038Rr2k0/J1QAocMBDzY1LsHzYTVH3c03Q2
   /ROsvQnp9jeQuKbj2fEkACsaFlGagnADjRlQ7+7U4ho66IxrohlR7ybgG
   bGknCXtjLuGZsFRZghdHWtz4/MzCUUUdTVRmxs5cle/NSs641AuOIkYf1
   pMXOTY0UEpnG8iPOcsft+5nuF6A3HRSyq5SLB+sGwqfjuXXqZk56FHGD8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="2801977"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="2801977"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 04:44:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="931079436"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="931079436"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.94.253.213])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 04:44:43 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jan 2024 14:44:30 +0200 (EET)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v5 10/11] platform/x86/amd/hsmp: Change devm_kzalloc()
 to devm_kcalloc()
In-Reply-To: <8b896046-2058-805d-1998-7ae6d51edd01@linux.intel.com>
Message-ID: <0c930967-ce51-edf9-c8c4-5e00d8ff7047@linux.intel.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com> <20240106022532.1746932-10-suma.hegde@amd.com> <8b896046-2058-805d-1998-7ae6d51edd01@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-347282070-1706532270=:1439"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-347282070-1706532270=:1439
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 25 Jan 2024, Ilpo J=E4rvinen wrote:

> On Sat, 6 Jan 2024, Suma Hegde wrote:
>=20
> > Use the standard array allocation variant of devm memory allocation
> > APIs.
> >=20
> > Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> > Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>=20
> I decided to apply all but this patch 10/11 into review-ilpo. I fixed the=
=20
> parenthesis issue I mentioned in one of the patches while applying.
>=20
> Please check the comment I made against this patch and respin this one.
>=20
> I also noticed while applying one other extra parenthesis case in patch 5=
=20
> but since it was not added, I didn't go to tweak it now myself, but just=
=20
> you know.

Hi Suma,

There are number of issues and warnings due to these patches including=20
one build failure due to lack of ACPI in the config (I think), can you=20
please take a look at them.

--=20
 i.

--8323328-347282070-1706532270=:1439--
