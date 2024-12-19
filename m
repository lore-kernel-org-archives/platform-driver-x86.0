Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAE6222562
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Dec 2024 12:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734610120; cv=none; b=DgVPe1l2Kn8/I9glkkRsSD8dHB3OLBEteRaMU/hwRSBrBFdv0LH85MEM3gpVBSA581VlkWXTCYLMkLOk2QwCjm2CAI+rv3GnblNxprSq9Nghg8yvZMIkXzPxYx4iqg/wHoMSOS2TzxpAIKH2UXt8xFQHDTb82eOfZk4rCo8hUQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734610120; c=relaxed/simple;
	bh=78jtZq1OoVPhcdaS0BLBVvuCp2Zg/CnyDlGUJSeqfQU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YuuUQXGJChsMD3TgNQRHUcxMi3RAaSHvqOB4HwhvwphotY+BQiixiRVy55iRTd9ieYHyVOQf30PDda/emr/xPgzlWJMjuFRe6sUeoseQZSbvHdhtK4/fYRya6UT3IwL48iz0uYHmnIlHFe9v3kBYkrpdyLD3UAAesfXtxwUf9DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYPh6Dro; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYPh6Dro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734610118; x=1766146118;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=78jtZq1OoVPhcdaS0BLBVvuCp2Zg/CnyDlGUJSeqfQU=;
  b=bYPh6DroAgdSgCt/GatXO+mgy5HbUOfGLtuSDsZx9yVyifmvbV1d5+o1
   spRbfIktk6PQGLvo9V2KUTeTTkuQOUwP4fS8+uWkOktkLAlel4RwJAcQb
   QULNRSiQzQD2MlfQ92gqU5TVwfssLNwRMUlJaLcPfziWz/FTfcvScs2rz
   KjTzvlTrFcH6xuNDxK4NQdJibhVP2Dh/wohNBJuGHgSfyl2qRGO4TjH3F
   +vMuLVIICOtQSoiEgTXTrsISl9MITZlIO53NfgXC4I/MzHO1v6wafOojx
   8jL7OsjxSg/Ca2BYUsRcXyu5JCN6ShkPLIkHGQS9SGwG4AokKZ8i3UzYy
   A==;
X-CSE-ConnectionGUID: J9ARXfeGQJqyrOR/nMf3VA==
X-CSE-MsgGUID: tIzg5pbtSdOCA5E4RJWOOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35331817"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="35331817"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 04:08:38 -0800
X-CSE-ConnectionGUID: 5/ztkzbKT5ihb8QsooqV9A==
X-CSE-MsgGUID: ETuqg7/gT3e9Zg2sS2N7vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102307722"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.7])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 04:08:35 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 19 Dec 2024 14:08:31 +0200 (EET)
To: "Antipov, Dmitriy" <Dmitriy.Antipov@softline.com>
cc: "dmantipov@yandex.ru" <dmantipov@yandex.ru>, 
    "hdegoede@redhat.com" <hdegoede@redhat.com>, 
    "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "jlee@suse.com" <jlee@suse.com>
Subject: Re: [lvc-project] [PATCH] platform/x86: acer-wmi: fix fan mode setup
 in WMID_gaming_set_fan_mode()
In-Reply-To: <f10a93f710667be330620dd550c164f0dbbd6799.camel@softline.com>
Message-ID: <e86854aa-f2d4-4bde-9fe7-a6da91c41a76@linux.intel.com>
References: <20241216132400.302003-1-dmantipov@yandex.ru>  <724c98ef-848d-ecfd-63d0-18fd2a6b89f4@linux.intel.com> <f10a93f710667be330620dd550c164f0dbbd6799.camel@softline.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1146529081-1734609305=:932"
Content-ID: <39d977ba-f109-b1d9-7206-8464dacf4279@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1146529081-1734609305=:932
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <b7e95348-ad6d-be74-51f8-ad67b74324f0@linux.intel.com>

On Thu, 19 Dec 2024, Antipov, Dmitriy wrote:
> On Tue, 2024-12-17 at 16:47 +0200, Ilpo J=E4rvinen wrote:
>=20
> > When you use an "automated" tools to find "problems", you have to read=
=A0
>=20
> Such a sentence would have much more effect if correctly rephrased.
> For example: "Since I'm paying you, you have to [whatever]" etc.

No, that's not an optional thing when it comes to problems from automated=
=20
tools. We've a special policy when it comes to contributions that=20
originate from running analysis tools such as SVACE. For details, please=20
see:

Documentation/process/researcher-guidelines.rst

In particular, please check the list after "Answer". It list among=20
other things "How could the problem be reached on a running system?". To=20
answer that, you need to understand the related code.

--=20
 i.
--8323328-1146529081-1734609305=:932--
