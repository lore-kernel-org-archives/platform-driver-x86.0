Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AA81E4AB
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604030; cv=none; b=Ik0EGqPymd4hIfRyotPA33LlzUNoXHd+NwWw7XrioijnD5qHiW11cJ89d5wVzgDdOS+uSXjLgE21o7kp4VWj4rgFGJDrbdI9PuO3kB3zwU8hKwV1bv5ecxQ9Tsr4Mi46VUR0fRkHonqMqjaYv0+46YNHjUU/Y4QWFPmCAjpV4NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604030; c=relaxed/simple;
	bh=OaJzKzAWkcLEH1xUze3K2zfhgIvKELiD69nKQ/zaElY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AeRkwiBiSbKl8BEbtPu2L+J4sXXDeQNvw+U0aRaAmUIbbyiOgVyHNqyNVIWJcu1mz7gb4SO5mendAiaUGH9qyo3iXXKg5sROldy8e1z2FOaIU82iIErA646eyyisRcU1XC4HZbAQzIv//MVS/vJCHyWYPytojRbMT858MR57He4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ciwea2Ay; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ciwea2Ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755604029; x=1787140029;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=OaJzKzAWkcLEH1xUze3K2zfhgIvKELiD69nKQ/zaElY=;
  b=Ciwea2AyAAqJniD/jZmmtb8wWtq52w5UXQu09I5x/Pbkxf1MO8if7dUB
   q6FyEk+X0Q6kAgU5XH8txby+/qkN1oIW/t7zdD1k82OOneVAa1qLOgwAn
   JEu8IFZLBdLL5iRMdYegfiSPSz9u8/jM8tqGL0QWX0h0OKXOGIDxOAcX0
   2ugOP52EL/8ElGGYLCVTH/8eJRlphUhBvOrkTD2pgOON1OYVyM+QxmW8r
   XTStlgbwahr+GZLA4ryARU3Tl17Uv2iwLC7f87+0Ga3yxgOoTNCDuteBY
   Oo17EUQs2lS3eZZlW7zMY56IGZF2DsQAkvgrWtoPkG91ZQylb+E9mVd9d
   A==;
X-CSE-ConnectionGUID: IzfZ7Yf5SSWxP8EQCyEc6w==
X-CSE-MsgGUID: a7wGiskOTAyBNz5z4T5FYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56872478"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="56872478"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 04:47:08 -0700
X-CSE-ConnectionGUID: Hzc2AlWDShCEIR0711tobw==
X-CSE-MsgGUID: XK2ceKGgSxW8hXcxIeX+EA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 04:47:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Aug 2025 14:47:02 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
Subject: Re: [PATCH v3 8/9] platform/x86/amd/pmf: Call enact function sooner
 to process early pending requests
In-Reply-To: <47604edb-01a9-493b-ba30-bc2bc679edfb@amd.com>
Message-ID: <07e8c640-72d5-ca1c-411b-3dc2ab8444e8@linux.intel.com>
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com> <20250723064121.2051232-9-Shyam-sundar.S-k@amd.com> <ec6d6d81-a574-ee08-a62c-7672769bdfab@linux.intel.com> <47604edb-01a9-493b-ba30-bc2bc679edfb@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-696001654-1755603813=:949"
Content-ID: <197fee40-2ecf-9035-b757-752a2c40466d@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-696001654-1755603813=:949
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <5b843007-0874-ef67-bb65-a776c57641de@linux.intel.com>

On Tue, 19 Aug 2025, Shyam Sundar S K wrote:
> On 8/19/2025 16:50, Ilpo J=E4rvinen wrote:
> > On Wed, 23 Jul 2025, Shyam Sundar S K wrote:
> >=20
> >> Call the amd_pmf_invoke_cmd_enact() function to manage early pending
> >> requests and their associated custom BIOS inputs. Additionally, add a
> >> return statement for cases of failure.
> >=20
> > No return statements are added into amd_pmf_invoke_cmd_enact() ??
>=20
> Actually I meant add `return` from the
> apmf_event_handler_v1()/apmf_event_handler_v2 handler calls.

That's just replacing the implicit return as you need them after adding=20
code to the tail of the function. I'd just drop that "Additionally," part=
=20
as it's more confusing that useful.

> amd_pmf_invoke_cmd_enact() is meant to manage early pending requests.
>=20
> Did you mean, I have to rephrase the commit?

Yes, it's clearly inconsistent with the code change and has certain level=
=20
of duplication too (the first and the last paragraphs).

--=20
 i.
--8323328-696001654-1755603813=:949--
