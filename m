Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D960E17BB20
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jul 2024 11:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720609425; cv=none; b=HIhIJDFDR9nNnwzqxyuc3gGTY5mK+Sk+VPn2HMX0hdohYJbqg5mOJQXv8xxQU0Nt7YPfqpm3x4JZzkFyrd+0v6gHeegItIKOw98BQphnFuCs4FXSDkbRPHSpqUBj4JPu7fVVpROsR1KcuVXWyp4t/v7CU+RoPrNlJxVHVA1M8vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720609425; c=relaxed/simple;
	bh=g9i8gyMW5rRosiPBeFPaqkr5F+CugmIOEh1gDZfmItA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TvC5PhTbcDw7mcxovhZn5iSXuiFLAwnF9h75l9OnkRYARDwidAxfyhemxcIxKe7fH7ShjohuoPgc3eglb2mmdEIWJdSdT6I30ztKzpJsM7YxQPP/d7ASsE+QkbgXTa8sWWHRVj7K4GX85T3Srvxg+duMgzVIE6Wskf8E4TS8s7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImfBZUY9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImfBZUY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720609424; x=1752145424;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=g9i8gyMW5rRosiPBeFPaqkr5F+CugmIOEh1gDZfmItA=;
  b=ImfBZUY9+H2ysgvA/b5Bp/NTUsOVoByhtR8r+2TpEuv0T7OQwcMVNTHY
   TuhrZ0UuXu6REUmCzql873sT83jZDFF8J8QMPGdBxKgG6RqqE/tufbaIo
   64pr53rv/hqH0qN7VIEqM1LQlkIj2P26u0dHUzXbJ6g7etKcoPfuWojej
   Vcmug3yzrCJcM87ImOa7/nq/mH6CCS4aeoa1X8PP1ojkfdwL5J0a12PkU
   sglKVopHOqsyR9NzNeIY+CDFucmUD6Ket4PWNP4Pr1uPgvA+OBmveVMWd
   WZXeCaiJrz/y4/0yvnxuj7VMo6vnVgCZMPgQt2DGmRH9NyDJt1XQFu/65
   w==;
X-CSE-ConnectionGUID: KEligFDZRM6HcoEf0CLOAQ==
X-CSE-MsgGUID: 7KBwTkTsQLuzASqK6oJ92Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="18126853"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="18126853"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 04:03:43 -0700
X-CSE-ConnectionGUID: VilpyYJCRkasxkCp9zTSgg==
X-CSE-MsgGUID: XFlvW71ERAK7RItcu7u/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="85698013"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 04:03:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jul 2024 14:03:37 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com, 
    mario.limonciello@amd.com
Subject: Re: [PATCH v1 1/2] platform/x86/amd/pmf: Use existing input event
 codes to update system states
In-Reply-To: <a08a9721-7aa0-4c3b-95b0-a7695a2f6d80@redhat.com>
Message-ID: <64907eb0-7c69-7615-27f6-521d149b3b0c@linux.intel.com>
References: <20240702080626.2902171-1-Shyam-sundar.S-k@amd.com> <531d4d0a-9ba0-e67f-6f84-d11de1a0156e@linux.intel.com> <a08a9721-7aa0-4c3b-95b0-a7695a2f6d80@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1417664016-1720607191=:1017"
Content-ID: <d3835d22-8cd0-b8f0-6037-a0dda017f2c8@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1417664016-1720607191=:1017
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <0d44e522-e020-2e53-d03e-15d32bc60bfe@linux.intel.com>

On Wed, 10 Jul 2024, Hans de Goede wrote:
> On 7/6/24 3:09 PM, Ilpo J=E4rvinen wrote:
> > On Tue, 2 Jul 2024, Shyam Sundar S K wrote:
> >=20
> >> At present, the PMF driver employs custom system state codes to update
> >> system states. It is recommended to replace these with existing input
> >=20
> > This change entirely removes the way userspace worked before this chang=
e?
> > We cannot take userspace functionality away like this.
>=20
> I completely agree with you that we cannot just go and remove existing
> userspace API.
>=20
> But AFAICT in this case no known userspace code has ever actually started
> relying on these custom udev events. The docs suggest creating a custom
> udev rules files which I don't believe any distributions have actually
> done, not has this been made part of the default udev rules shipped
> with systemd.
>=20
> So I think in this case we can get away with removing the udev event
> generation and the sooner we do so, the smaller the chance something
> does actually start depending on it.
>=20
> And if I'm wrong it should be easy to add back the udev event generation
> and send both the udev events and the key-presses.

Okay, thanks for chimming in.

--=20
 i.
--8323328-1417664016-1720607191=:1017--
