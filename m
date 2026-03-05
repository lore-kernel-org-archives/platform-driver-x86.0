Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D48381AEA;
	Thu,  5 Mar 2026 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772716239; cv=none; b=h3j0PZFp46lGXegcArIy4Esqjk7RSnJBbxAoLgrZF5WyqpR6AEoAzGN2ZFLAfDBx1uuNpx6TDaBRzOJ4LfQ2Gi/i7iKko8zCBnkDzx1bgF7oOb6UsSw3d1tbIY1ap4ARKVLP9dW/93lpDBvU+0U35mnDsdFsmylwGmP8n8N9Yr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772716239; c=relaxed/simple;
	bh=938UgiRjVjSww9PSkYTrwGgyDmQ3Talf2qLSG6e30JM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HCva60xoeoG+/adisFfl0GMAcLstzHX/Khg0s4cfc5TJgaHTOoqxveC3TLBRvFZ91zOpHbrqoI7Hx0/OzdOVkLBVQOdMc9xOfVIZQ8GrIgGkLLqpAlvdyYJDspMhEr43kS/30edBJJmNli1jpcknyFqlz4teOKHCdAKLBLWh8Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVvGuFkJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVvGuFkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772716237; x=1804252237;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=938UgiRjVjSww9PSkYTrwGgyDmQ3Talf2qLSG6e30JM=;
  b=LVvGuFkJdb3gRo5k2Al7Hn9zUuzmJ4P0PIZ4YzSCAdjzIo9C77W5VuIU
   KniXL1ixa81sk7NfzGlPj2DacXKe7cKv16kGsd3c7zWL+NzXfLLC91P5w
   Lg84SmSI4Z+sp06X7hMuJtiq1mF1B3Ejxa2iwiQZafmXceubqwTv5m6Up
   asy0oy1a2it7uz+H/OkvqvERdskD9dEzGnhdVsSM3BqJVJrXm+59BrmL5
   r3zQxEcQJ//vFL5MTs1IR968l4Xno3UHqcXe5fPz3WR7DgzQyxEVFd0SZ
   yD1SlHaB/IHWSPr4bxmChaytjGn4BkyegJoVStJksrqutrxrtSrzmhWh9
   w==;
X-CSE-ConnectionGUID: 1cnM0aGXRXm/P9bPuseYUg==
X-CSE-MsgGUID: cq6QOW+uQrGRmDVUrSnZaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73500743"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73500743"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 05:10:37 -0800
X-CSE-ConnectionGUID: PUSyjNhDRp2C3/9oKMVcgQ==
X-CSE-MsgGUID: LE/ldSunSk2pM2P8xm/TMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218812883"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.93])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 05:10:34 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 5 Mar 2026 15:10:30 +0200 (EET)
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
    Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: Use sysfs_emit{_at} in
 show functions
In-Reply-To: <27DCD6B0-3DDC-4FDB-BE29-873465FAD236@linux.dev>
Message-ID: <abe982e5-d64d-ac60-babf-91ea81bd748b@linux.intel.com>
References: <20260305124126.255026-2-thorsten.blum@linux.dev> <77f08627-cb28-8c0e-112b-f7ebef5a9a74@linux.intel.com> <27DCD6B0-3DDC-4FDB-BE29-873465FAD236@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-712496739-1772716230=:1083"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-712496739-1772716230=:1083
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 5 Mar 2026, Thorsten Blum wrote:
> On 5. Mar 2026, at 13:48, Ilpo J=C3=A4rvinen wrote:
> > On Thu, 5 Mar 2026, Thorsten Blum wrote:
> >> Replace sprintf() with sysfs_emit() and sysfs_emit_at() in sysfs show
> >> functions. sysfs_emit() and sysfs_emit_at() are preferred for formatti=
ng
> >> sysfs output because they provide safer bounds checking.
> >>=20
> >> In reset_bios_show(), use sysfs_emit_at() to avoid manual buffer size
> >> accounting.
> >>=20
> >> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> >> ---
> >> .../platform/x86/dell/dell-wmi-sysman/sysman.c | 18 ++++++++----------
> >> 1 file changed, 8 insertions(+), 10 deletions(-)
> >> [...]
> >> +=09for (i =3D 0; i < MAX_TYPES; i++)
> >> +=09=09len +=3D sysfs_emit_at(buf, len, i =3D=3D reset_option ? "[%s] =
" : "%s ",
> >=20
> > Are all checkers okay with this construct? IIRC something doesn't=20
> > like having such logic in where only a formatting string is expected.
>=20
> You mean checkpatch? No warnings, but I can split it again if needed.

Unfortunately, I don't recall what it was anymore (I didn't expect it=20
to be checkpatch) and couldn't locate the change either but I'm pretty=20
sure somebody did split a similar elvis operator.

--=20
 i.

--8323328-712496739-1772716230=:1083--
