Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685B351C3D
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 10:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706697133; cv=none; b=lo6HWRQMYmivRxAOiR088Dg9MkV6/zQiVYzg3IeJ3DFF3SXSPynIg/puvBORcZOlYK9fEWGSGPMEK6l666jC1WR4ZHxqiz2DgtpA0vUho4oLDRF5FYC13Ic03TRAp3eQFuCx2QDT6crJSjoRY7y4R1blXm/IBTW2TXAs4kyKFPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706697133; c=relaxed/simple;
	bh=3GZZpu3ST4e2zBD72AYZK/QLtODQo61Q1dKNdqshRsQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GqH1zbKZljyBOuHNMbRZg26/GdFCrjJUarkRzzMifbukyyh0xVX021/zf8PfhXKcq6Vcb/lxq80iRcodb5rH6yoh5I4+KDh97wb4tfSYB1gjTKDtqnsc242N3xc+kWPGGhTUw0OOo7d7QIbdS6NMnj+PnNt9Nn5eX3UlYWlTses=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGTmn14d; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGTmn14d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706697133; x=1738233133;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=3GZZpu3ST4e2zBD72AYZK/QLtODQo61Q1dKNdqshRsQ=;
  b=BGTmn14de/cnB59np/qW35S96Egu9ccTRxNF9YiDkV0FEu8G+0JMvPg7
   bFeQvM0YJmBCO4Maug/nuHLYPlQ8p0hwTz7XPbFVkmg87KWrhuld7Fru2
   U7KpK/Ae4nGRxWA624FtHq1jJkKMDn42RqjMfHzYuLiS3xZcQ2IRhK932
   i5hd6FtkgpsE9Z13OfxQkapicf39mw83OlGmKGOi2U5N346GTk1ZlRizy
   oKmhxhEm/7TxJGnk5WUOHEsSVESswGq7S+WBLsbRucEhz76kKL11E6Zxm
   ulpKVPFddKcqQT3OMM5MOcY/JOuz68vwehIdPVc5SaFCEARUFU59D4OHT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10313968"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10313968"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 02:32:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="878754156"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="878754156"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.35.167])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 02:32:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 31 Jan 2024 12:32:02 +0200 (EET)
To: "Hegde, Suma" <Suma.Hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v5 10/11] platform/x86/amd/hsmp: Change devm_kzalloc()
 to devm_kcalloc()
In-Reply-To: <6a60fd66-64df-491e-8879-3333c8f119d5@amd.com>
Message-ID: <576a14c5-e0ad-e6d8-fc7a-0e0121f16c37@linux.intel.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com> <20240106022532.1746932-10-suma.hegde@amd.com> <8b896046-2058-805d-1998-7ae6d51edd01@linux.intel.com> <0c930967-ce51-edf9-c8c4-5e00d8ff7047@linux.intel.com>
 <6a60fd66-64df-491e-8879-3333c8f119d5@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-107551806-1706690333=:1077"
Content-ID: <f6c4c3b4-9bde-e902-6c7a-993ccb92dd1d@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-107551806-1706690333=:1077
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <518232d1-2748-372e-3e3a-c0077d4b5d73@linux.intel.com>

On Mon, 29 Jan 2024, Hegde, Suma wrote:

>=20
> On 1/29/2024 6:14 PM, Ilpo J=E4rvinen wrote:
> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >=20
> >=20
> > On Thu, 25 Jan 2024, Ilpo J=E4rvinen wrote:
> >=20
> > > On Sat, 6 Jan 2024, Suma Hegde wrote:
> > >=20
> > > > Use the standard array allocation variant of devm memory allocation
> > > > APIs.
> > > >=20
> > > > Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> > > > Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> > > I decided to apply all but this patch 10/11 into review-ilpo. I fixed=
 the
> > > parenthesis issue I mentioned in one of the patches while applying.
> > >=20
> > > Please check the comment I made against this patch and respin this on=
e.
> > >=20
> > > I also noticed while applying one other extra parenthesis case in pat=
ch 5
> > > but since it was not added, I didn't go to tweak it now myself, but j=
ust
> > > you know.
> > Hi Suma,
> >=20
> > There are number of issues and warnings due to these patches including
> > one build failure due to lack of ACPI in the config (I think), can you
> > please take a look at them.
>=20
> Hi Ilpo,
>=20
> I have pushed patch with fixes for smatch error and warnings.
>=20
> For the CONFIG_ACPI=3Dn build failure, I have added "depends on ACPI" for=
 hsmp
> driver and pushed patch for that.

Hi,

I've folded your fixes into the relevant patches now.

> But we support NON-ACPI probing also, there may be x86 platforms with ACP=
I
> disabled, is there a previous reference of how this can be handled
>=20
> without making it dependent on ACPI in Kconfig?

Given you have quite much code that relates to ACPI case, perhaps=20
creating hsmp-acpi.c wouldn't be a bad idea so you can make that file=20
depend on ACPI without polluting the hsmp.c code with #ifdefs.

--=20
 i.
--8323328-107551806-1706690333=:1077--
