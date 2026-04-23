Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5EF3E3DAD;
	Thu, 23 Apr 2026 11:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943780; cv=none; b=UcgPZvaUJDvtHg2U1AwwL5ZkHZdvYZaa7f5cmHwNXJFgjhuvXX7KPCs38t5sfn+FAsbIFiDeGkkExY+fxlCTj2wg7scvvgfxv+Rlke3oPjnABEO9hM8381SVsItb9ZzDxnei2yVGkXXGBx/RH4sDwCorEYO2cEsj3q3V62393tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943780; c=relaxed/simple;
	bh=CN1BKnB1Hy7WR+Xsrl6evq+bcnkpS1kYMg7aNvDn2UA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ft4Dg22sjU/MCO8AKrNjz0YgaeFWtTYOCE+xPvp9f8T9meN88bm1311Kaomm8q1QaPBswYlTUcp92dm8LZFjNRA3aCbwpr8Waw3hnpIOPxMeGRt3NVolnQqL6fOVnTwdcno9T7sP6i2GuH5riDHlfM/6z2ty7HSoQMT2gau1WgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nybLea5l; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nybLea5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776943779; x=1808479779;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CN1BKnB1Hy7WR+Xsrl6evq+bcnkpS1kYMg7aNvDn2UA=;
  b=nybLea5lCjARIn1A0OThdH3ReuKcJth+ugoYIYM9Qq+quYkKk+cCFVsS
   cvPVn6wNhfaTDLFFsGQb4XQzn5bKD9aWuzLH+PkbyYBcPfzA8ku/K2QMK
   LBAvZZotANry01KMLc0J/RwIf6NxQyYoYf/AW28Oxtu1nhQmhYMzEjNBZ
   skZsqAEScqqgvD59UZVr7J1x+f8mps+8Dcw/cOIx1a54E6SrpN0apsdXA
   vrn8n4oI5zviRd1VAbokKbYREnftCxtJM9c8rw4ZnODwo4VD6M7TVSF6Z
   Li5b6Ontwql+8vMLfbxCDPXPvhgvlTuiNjLcf8Dx/dhIPom3AeSZ9YDFC
   w==;
X-CSE-ConnectionGUID: S7ujnNJmQd2nTJn9BsaF8A==
X-CSE-MsgGUID: gz2xM7dQTTuM1NCVcqH7xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="103371539"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="103371539"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 04:29:39 -0700
X-CSE-ConnectionGUID: c6Qq+sF9TiKsfYBOHVv66g==
X-CSE-MsgGUID: YUzyXKqhQiCcnQl39/7PbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="236622080"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.212])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 04:29:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 23 Apr 2026 14:29:32 +0300 (EEST)
To: =?ISO-8859-15?Q?Jos=E9_Guilherme_de_Castro_Rodrigues?= <jose.guilherme.cr.bh@gmail.com>
cc: Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Denis Benato <benato.denis96@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: asus-wmi: fix camera key led on Zenbook
 S14
In-Reply-To: <aelV0GZ8n5s9lXOf@djouze-zen>
Message-ID: <88b55672-8cdb-7aa9-634b-da8d59d03bf7@linux.intel.com>
References: <acxSW8FgXbnFiqIL@djouze-zen> <ac6xgsMxzpnU_8FA@djouze-zen> <7db8d74a-e250-d790-aaca-d02a08a7c091@linux.intel.com> <aelV0GZ8n5s9lXOf@djouze-zen>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-827257177-1776943772=:955"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-827257177-1776943772=:955
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 22 Apr 2026, Jos=E9 Guilherme de Castro Rodrigues wrote:

> On Thu, Apr 09, 2026 at 03:45:29PM +0300, Ilpo J=E4rvinen wrote:
> >=20
> > Please just send a new version. It will be much easier for me when I do=
n't=20
> > need to hunt down odd spaces or do multi-line code edits.
>=20
> Sure, I sent the PATCH v2 a few days ago. I look forward for any
> feedback. Here is the link in case something went wrong and it did not
> arrive correctly, or if it just got lost amidst this rather busy list:
>=20
> https://lore.kernel.org/platform-driver-x86/adg6GzkykThAB_4u@djouze-zen/
>=20
> Thank you for your time, and sorry for any inconvenience.

Okay. The patch seems to be sitting in the queue like it should be.=20
Pending patches can always be viewed from there (MAINTAINERS file also=20
has this link):

https://patchwork.kernel.org/project/platform-driver-x86/list/

I (as the maintainer) won't forget any patch that appears on that list.

I admit though catching myself a few times accidently closing a patch as=20
"accepted" when I did not do the last apply step of my workflow. If a=20
patch ever happens to suffer from such an unfortunate fate, it does=20
not appear in either review-ilpo-* branch nor in the patchwork anymore,=20
pinging is definitely useful (after a few days, there may be small=20
delays in pushing review-ilpo-* branches out).

--=20
 i.

--8323328-827257177-1776943772=:955--
