Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D805612D145
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Feb 2024 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707210258; cv=none; b=lehcht/N5eL7ZApvK6DZlWPgkND5z1JZPxwWQo1L5F1D6csmS0iXTrEtBkaCndbuGKvcWDBhDwDkexsav3eB+h+vm7uYCaRGncMUwV26GZ8VY7CY8weM+kvedmmJBsbsxNpjogjAI6A8zk24MKZNuHkWksf1AaKdUqmhJiETdqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707210258; c=relaxed/simple;
	bh=s9pnt3XkheiUEfGVB3CN0cH5z2Y69cNZz5uG+wOvxyo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SIRk4mLPdOismbZoFNvoxFzVQ0lBSDocrxonVFNUuQDjo2FlN+B4voo+G12vsIE4L+uFFCSNGWbgX2ZeBuIC8wgP6tZVb8eoXgd2RnDdy7sYBv+Ex0h3G7jWiF59BDTG6uoV3Q0q1rCLTQh9/gVRMM9wL0e7RB0Uw0HgUhNcmrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C316BIO2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C316BIO2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707210257; x=1738746257;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=s9pnt3XkheiUEfGVB3CN0cH5z2Y69cNZz5uG+wOvxyo=;
  b=C316BIO2mvif18AQsgChxVsE+AAb5hU7GNG+PYGOQhxhGSNzP6uhFlWX
   JDeRRYrOidNSW/QQTrklQvUT3Ma+I3NJd4M559FTp2dumte9eykNcRpif
   g+fhqyKx+iug8ovrPmfZoRtIkZiSe7rqKh/qvguc78s6uPaa932K7WnHm
   HGkr5XXL68HTMNe9AJ5wStp/abCAMKtvpfFEzhJNGHmn8SYQ3AxlflMzw
   FwF0PsgILxhvFomMTy0m0yPFOi/j+pUOBiKqiLQ4VOgRQDoPO0bS09Hy6
   wzKZ3w7IZu7FIUuZfG3EmEr1grh0+w2mawu4wn3IlfuFfr5EnMs33VuAp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11290269"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="11290269"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 01:04:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="909569782"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="909569782"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.36.139])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 01:04:13 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 Feb 2024 11:04:09 +0200 (EET)
To: "Hegde, Suma" <Suma.Hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v5 10/11] platform/x86/amd/hsmp: Change devm_kzalloc()
 to devm_kcalloc()
In-Reply-To: <4b97ff14-dbd7-4c07-9bf6-5f17cd5c93eb@amd.com>
Message-ID: <1600919a-6475-1b68-0b7c-49f80913fda8@linux.intel.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com> <20240106022532.1746932-10-suma.hegde@amd.com> <8b896046-2058-805d-1998-7ae6d51edd01@linux.intel.com> <0c930967-ce51-edf9-c8c4-5e00d8ff7047@linux.intel.com> <6a60fd66-64df-491e-8879-3333c8f119d5@amd.com>
 <576a14c5-e0ad-e6d8-fc7a-0e0121f16c37@linux.intel.com> <4b97ff14-dbd7-4c07-9bf6-5f17cd5c93eb@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1302712386-1707210249=:1141"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1302712386-1707210249=:1141
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 6 Feb 2024, Hegde, Suma wrote:

>=20
> On 1/31/2024 4:02 PM, Ilpo J=C3=A4rvinen wrote:
> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >=20
> >=20
> > On Mon, 29 Jan 2024, Hegde, Suma wrote:
> >=20
> > > On 1/29/2024 6:14 PM, Ilpo J=C3=A4rvinen wrote:
> > > > Caution: This message originated from an External Source. Use prope=
r
> > > > caution
> > > > when opening attachments, clicking links, or responding.
> > > >=20
> > > >=20
> > > > On Thu, 25 Jan 2024, Ilpo J=C3=A4rvinen wrote:
> > > >=20
> > > > > On Sat, 6 Jan 2024, Suma Hegde wrote:
> > > > >=20
> > > > > > Use the standard array allocation variant of devm memory alloca=
tion
> > > > > > APIs.
> > > > > >=20
> > > > > > Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> > > > > > Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> > > > > I decided to apply all but this patch 10/11 into review-ilpo. I f=
ixed
> > > > > the
> > > > > parenthesis issue I mentioned in one of the patches while applyin=
g.
> > > > >=20
> > > > > Please check the comment I made against this patch and respin thi=
s
> > > > > one.
> > > > >=20
> > > > > I also noticed while applying one other extra parenthesis case in
> > > > > patch 5
> > > > > but since it was not added, I didn't go to tweak it now myself, b=
ut
> > > > > just
> > > > > you know.
> > > > Hi Suma,
> > > >=20
> > > > There are number of issues and warnings due to these patches includ=
ing
> > > > one build failure due to lack of ACPI in the config (I think), can =
you
> > > > please take a look at them.
> > > Hi Ilpo,
> > >=20
> > > I have pushed patch with fixes for smatch error and warnings.
> > >=20
> > > For the CONFIG_ACPI=3Dn build failure, I have added "depends on ACPI"=
 for
> > > hsmp
> > > driver and pushed patch for that.
> > Hi,
> >=20
> > I've folded your fixes into the relevant patches now.
> >=20
> > > But we support NON-ACPI probing also, there may be x86 platforms with=
 ACPI
> > > disabled, is there a previous reference of how this can be handled
> > >=20
> > > without making it dependent on ACPI in Kconfig?
> > Given you have quite much code that relates to ACPI case, perhaps
> > creating hsmp-acpi.c wouldn't be a bad idea so you can make that file
> > depend on ACPI without polluting the hsmp.c code with #ifdefs.
>=20
> Thanks Ilpo for the suggestion. I will address Han's and Greg's comments =
and
> later will work on splitting the ACPI code into separate file.

Okay, thanks.

Mario also raised concerns besides those from Hans and Greg so could you=20
also take a look at them as well.


--=20
 i.

--8323328-1302712386-1707210249=:1141--
