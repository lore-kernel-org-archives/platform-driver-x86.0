Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F261C369999
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481712; cv=none; b=eldnAyu5TzxUtkKoc0f+lkDUvCpybgSnDOZlLQp78429kc5mQvnDAuEQSg2gFEVmeBz5f2mA0EoSYt2ZETl9vNL+3WFS7C8RbBW1Gdrq3eHkKcBfB+XTDePcsP5vun+v9a9aItLuSsEkDFF5ofZB/KLl193+UbzyHMAoamhjhJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481712; c=relaxed/simple;
	bh=dbNxYUl4uZaoLAPsZueTgijgSWWATTQqzfC8dRyOK/g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Vx52V4mr7V6NQOWcM/bLdbml9DfxZOaiQ2tScF/pwZGwwdIqRum1wgaAkVyg5va0ZcPRGWfcoUMGJgyoesbAgSKr+l1a2Ee8bu0VmX2nv9n/yhaw5fnTRaS+pPAn6VuNK9HD2z/NYmD2zjVta65qLg/OHyp71AkydJSJYcnjOws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jouzfW6t; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jouzfW6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763481711; x=1795017711;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=dbNxYUl4uZaoLAPsZueTgijgSWWATTQqzfC8dRyOK/g=;
  b=jouzfW6tCyK34/UwE9KlFCTV0QU0rIa7CYksq3yBVrZH22sEWRw1PtGO
   R+WWCDVkNdVlPWg709gXKj/c7XTSy2PZip6hauH2tid3mINZCDbEjaKVS
   r9Oa7ZgGdyn7ilL2+W9AXU283DGNP4/QVz+lrjogY9zoVNaBthlLjCMB6
   /FsQ9KxX9pQ/C7mOZY+2D5M5WYI+tl8nCXS1jQor8GPU3iHLiHyEGCfJ6
   K4/qBLeAdf0ybfLfNbb54FMEnWJ+ohgrKQiea3Ni2t6fiDfA7bNhpxKU5
   eQ6F3/89SRVqKN508KCRifeltrZ5sk1l7sZtgNdYTxvXuoPHNLN5Ou6+S
   Q==;
X-CSE-ConnectionGUID: i6qvk6ctRtqoOKskak2oSw==
X-CSE-MsgGUID: rmPPLPhARfqkf0Wa5jUSiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76110954"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76110954"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:01:50 -0800
X-CSE-ConnectionGUID: 66fd1a+sSwOgZqq2MUBSjQ==
X-CSE-MsgGUID: a1Ylh6nEQXCVBoDd5AqIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221452035"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:01:47 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 18:01:43 +0200 (EET)
To: Mario Limonciello <mario.limonciello@amd.com>, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, lizhi.hou@amd.com, 
    VinitKumar Shukla <VinitKumar.Shukla@amd.com>
Subject: Re: [PATCH v2 5/5] accel/amdxdna: Provide real-time NPU power estimate
 via AMD PMF
In-Reply-To: <8349468a-79ac-dc1c-d484-b9c9dd340e1e@linux.intel.com>
Message-ID: <09397827-4233-77d6-ab17-dfe0ae5f1cfe@linux.intel.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com> <20251111063737.4156385-6-Shyam-sundar.S-k@amd.com> <7034fae1-4096-4cdb-a46f-5e23e7accfa0@amd.com> <b8f2d8a0-3131-45cc-8c55-8fbf4ca06cfc@amd.com> <e6551b53-cb89-46e6-9c3c-545d14d79642@amd.com>
 <8349468a-79ac-dc1c-d484-b9c9dd340e1e@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1430563800-1763481703=:1205"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1430563800-1763481703=:1205
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 18 Nov 2025, Ilpo J=C3=A4rvinen wrote:

> On Fri, 14 Nov 2025, Mario Limonciello wrote:
> > On 11/13/2025 1:33 AM, Shyam Sundar S K wrote:
> > > On 11/12/2025 23:33, Mario Limonciello wrote:
> > > > On 11/11/25 12:37 AM, Shyam Sundar S K wrote:
> > > > > From: VinitKumar Shukla <VinitKumar.Shukla@amd.com>
> > > > >=20
> > > > > Add aie2_smu_get_power_estimate() to obtain NPU power readings fr=
om the
> > > > > AMD PMF driver. This xdna interface enables user space to reflect
> > > > > current
> > > > > workload power consumption in real time.
> > > >=20
> > > > But.. it doesn't.=C2=A0 It just adds a new function that could pote=
ntially
> > > > do this job.=C2=A0 The actual gluing it to userspace in some way to=
 use
> > > > this function will be another patch.
> > >=20
> > > For now, yes.. that's right. XDNA team will add more support on it
> > > that goes via the accel tree. But this patch is meant to have a
> > > minimal change on the xdna side so that there is a  consumer of the
> > > pmf symbol that is getting exported to the kernel.
> > >=20
> > > So, there is more support coming on the way. If you think, its worth
> > > to rephrase the commit?
> >=20
> > Yes; that other support isn't happening this kernel cycle.  So the comm=
it
> > message should be accurate to what it's actually doing (laying ground w=
ork).
>=20
> To me it looks this and patch 4 should be submitted with the actual user=
=20
> instead of trying to justify things with far in the future changes. I've=
=20
> no problem with creating immutable branch if necessary when multiple tree=
s=20
> are involved.

In case it wasn't obvious, I'm fine with taking patches 1-3 in earlier.

--=20
 i.

--8323328-1430563800-1763481703=:1205--
