Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E69FBE1;
	Thu, 11 Jun 2026 15:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190183; cv=none; b=SqR/hqauPitaHnk6SQf+cn0mqfSF3EGwAB1gqSKFOldz/HcitJdXhPjWtySCCNPHuFJbAZrN9eyC48mEmmxEnZeX1OPwSCZnr9cSZ+WHXnisqlMy+SzYC53dqSB0hrCldtcJRm1hkaNyPWEAWCnF4ITqstaUaLTcIjvL/RkXq9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190183; c=relaxed/simple;
	bh=SaJfpUFwy5duD9c1Bl0DeXmXHGdV9btGaZAxfqCLtx0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mcDPBUam6eCqQNPqqTGir4mEDeziwigWJFbbq6Hwp7jkNwGCE2uuqlWdVjR6CNJEqvL1P7utt3DTZvp6nDDJLEtH1OABLb0WPErSpB/ZOlsZNt4K/PO4wrq0/XtHfiHyhfNXZsx7IjkH/hZ8/Ggg0ccF87mXt0DhjK2jWpRRcJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHEEUUXh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHEEUUXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781190182; x=1812726182;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=SaJfpUFwy5duD9c1Bl0DeXmXHGdV9btGaZAxfqCLtx0=;
  b=NHEEUUXh1VF2OTppfxyn0y5PHKMfEAMfWD8JuJ5JzNeJchfIIIU/dqCR
   IEzAbyHaphsHgblHvN247ADzLeRVkcrKx7kPtzdQ+r3yEHgUNksaKQd/w
   V7mVvk5lr6+ASWPObaqN55w/IBOH30zHuLiCXS/0oofHILdiYSjRz0df0
   34VW7w/joGmAHAxkCRoxsgb5Pt0bHb/AZ+gEzirTlTCaQhdta63qsPHLq
   NZmf1ZV0t1PEgrbaOh6kEfeMmnm6NDbUy27ODAm/oaXc5Z7y+hkl5sUPX
   YBbFZ5bW2dqPS3QP3XRz6zL05VjHw2snggcDHJAgNuPp7pMViRsg/PLoY
   w==;
X-CSE-ConnectionGUID: 4FfDYOeUQkuUZReg4meNTw==
X-CSE-MsgGUID: FZv69H1PSbCKJ1/MFLuHuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69550330"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="69550330"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:02:55 -0700
X-CSE-ConnectionGUID: e04dKFzCTSO7eu8vuHYRLQ==
X-CSE-MsgGUID: 1pGuUw1eSf6qrLAmkN5fyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="284588900"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:02:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "Luke D . Jones" <luke@ljones.dev>, 
 Denis Benato <denis.benato@linux.dev>, 
 Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 Marco Scardovi <scardracs@disroot.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260610152130.25892-1-scardracs@disroot.org>
References: <20260610152130.25892-1-scardracs@disroot.org>
Subject: Re: [PATCH] platform/x86: asus-armoury: add support for G614PR
Message-Id: <178119015973.12014.6231948241278781864.b4-ty@b4>
Date: Thu, 11 Jun 2026 18:02:39 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 10 Jun 2026 17:21:30 +0200, Marco Scardovi wrote:

> Add TDP power limits and fan curve requirements for the ASUS ROG Strix
> G16 G614PR laptop model.
> 
> The ASUS ROG Strix G16 G614PR requires specific AC/DC power limits
> (PPT PL1/PL2/PL3, dynamic boost, and NV TGP targets) to function
> correctly under various power profiles. Without these limits, the Asus
> Armoury driver cannot configure the correct power envelopes or enable custom
> fan curves, leading to suboptimal performance or noise management.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-armoury: add support for G614PR
      commit: 6b3bbe770f4ca0439710b7c42f88b9f6eeebabd0

--
 i.

