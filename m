Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56DF20ED
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 12:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723406; cv=none; b=niHbnB7Xg/c3ppFTvzCn6nekpZzZEENkdYIRo+R8sKDux0ixUNklBMtlXOtc33Jenlt5TfdiYLgmZn3WFa0MkqzIa35xCHY9jZ+iyhG4bqODb9jJRaJ10IljDOPFELgRQEvqm5pW4gDprt0+TjtZhARPR/mOqtH2BPNOWaZ9TKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723406; c=relaxed/simple;
	bh=BooafILlnjF998xYENEBdxSUzBMaDrD5lrcr1MjucJM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=K87GHQJS/wn2LmHN6UIGo1YrEC/F5SQFrN0SDh5XHCgej8Cdr9SEhScaFKEBmk2ErDZbEmh8945Zgdrnl89w9LVIIhz7XVqyoGlad2bR8HaZr5gCZuiXWCuVbBo4jdY6JwfVeTCPFqcmn+1R93lauobRWTWLj+XUqAkpmWUlfU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMebf9mc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMebf9mc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737723405; x=1769259405;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BooafILlnjF998xYENEBdxSUzBMaDrD5lrcr1MjucJM=;
  b=TMebf9mcDkzgFgp4owLojRGVMJ9NGF/SVF4ueZ0e9pBjyQgK6/F/xJ1L
   g74WY+0GluNcw94wW57KOeiqJVpJqLoJJ8ZYeyn7hcSDhqEwI0wHap3u+
   QdNSURgTvTVQdP4oA+NoVhC64WuLfAQg2gMRPZaKQoPb/+nF1o8PzsXy7
   YDsoiROOOIQf60lXkwdwE0SUiFTs1eOpkzeDFKRuIa6s+VxfIJIM+5+v6
   hb6fCJ/Qvl1pUCzBOw4zz6hE/wohJNri4fBlVNLr/3pO1M/VUWOKVecu0
   mirR753qARireNfdWu+8ghmfF6bpW0U7TMZS9RA/GhFySgu1+LlB8XNhG
   A==;
X-CSE-ConnectionGUID: vDYi1JBsRUCP+iiH9uiRqQ==
X-CSE-MsgGUID: mMWK4ZTXTA2WWX4Vs79KbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38420578"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="38420578"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 04:56:44 -0800
X-CSE-ConnectionGUID: jWzwrrm8Q2SvSWNjec0cPA==
X-CSE-MsgGUID: aJIZRCNaQTSixVRb/TLEcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108659940"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.158])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 04:56:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Jan 2025 14:56:38 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, Michael Shych <michaelsh@nvidia.com>, 
    Ciju Rajan K <crajank@nvidia.com>, Felix Radensky <fradensky@nvidia.com>, 
    Oleksandr Shamray <oleksandrs@nvidia.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v4 06/12] platform/mellanox: Rename field to improve code
 readability
In-Reply-To: <PH7PR12MB66682C75F25A1CE281ABD82CAFE32@PH7PR12MB6668.namprd12.prod.outlook.com>
Message-ID: <65b929db-aece-a788-df95-5eba0ca5b612@linux.intel.com>
References: <20250123190818.3834-1-vadimp@nvidia.com> <20250123190818.3834-7-vadimp@nvidia.com> <3d7206a6-ad2d-6946-3da9-5de68b8e9408@linux.intel.com> <PH7PR12MB66682C75F25A1CE281ABD82CAFE32@PH7PR12MB6668.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-138717783-1737723398=:931"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-138717783-1737723398=:931
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 24 Jan 2025, Vadim Pasternak wrote:
>=20
> > -----Original Message-----
> > From: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > Sent: Friday, 24 January 2025 10:14
> > To: Vadim Pasternak <vadimp@nvidia.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>; Michael Shych
> > <michaelsh@nvidia.com>; Ciju Rajan K <crajank@nvidia.com>; Felix Radens=
ky
> > <fradensky@nvidia.com>; Oleksandr Shamray <oleksandrs@nvidia.com>;
> > platform-driver-x86@vger.kernel.org
> > Subject: Re: [PATCH v4 06/12] platform/mellanox: Rename field to improv=
e
> > code readability
> >=20
> > On Thu, 23 Jan 2025, Vadim Pasternak wrote:
> >=20
> > > Rename filed 'item' in structure 'mlxreg_core_item' to 'item_count'.
> >=20
> > field -> field
> >=20
> > 'item' -> 'count'
> >=20
> > However, this did not rename 'counter' (that's in the other struct) whi=
ch was
> > what I suggested you should consider changing.
> >=20
> > Also in mlxreg_core_item, 'count' field seems to be the number of eleme=
nts in
> > 'data' so 'item_count' doesn't sound so good name in this particular ca=
se (in
> > the other case 'counter' counts the number of items in 'item', thus my
> > suggestion to use 'item_count').
>=20
> Hi Ilpo,
>=20
> I think better to rename counter filed in 'mlxreg_core_item' to same 'cou=
nter' name as in=20
> 'mlxreg_core_platform_data'.
> Thus, 'item->counter' will be number of 'data' elements (struct 'mlxreg_c=
ore_item')and=20
> 'pdata->counter' will be like it is now number of 'item' elements: 'item-=
>counter'=20
> (struct 'mlxreg_core_platform_data').

No. "Counter" means something that is counting something which is not=20
really the case here. Just use "count" if you want have them the same.

--
 i.
--8323328-138717783-1737723398=:931--
