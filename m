Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB949282F23;
	Tue,  7 Apr 2026 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572773; cv=none; b=q81b7SiQ2L5/y52JPpcVd5htELYKRLJDOEh55SaLzh2tEBerOO0qcG/86i9O85MvraE7tLemxLHCdGZ6Du0mltcn1yR+/PpBYKSYU041jBLDYpFgJtMPNxqD5Z7Uo6RMghtJ/ITuJ8n9QIAlBiZ2SMafplT7Kmi/INCNTYkcMHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572773; c=relaxed/simple;
	bh=HBt5U4lT0rwnfX+k21fFlo3Vy3lQPBMi0aL1lP+L47E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JuWfwqS6NwL/iqR6OPDeIvLUnFlmU9dK9JzBpG52qm6zlbwG2LOe5Fhw0qDqCNQkiU4T++s3+qeCNGSJxuUVcyJUXOQe/xpg0ZRw0H7KhU10EJo21XwtdfP1dRiG3gsZIidlwRTXXUrpSRCuT18x2w53/Z1R954sr7BfLYcs4M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJbh5w83; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJbh5w83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775572773; x=1807108773;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=HBt5U4lT0rwnfX+k21fFlo3Vy3lQPBMi0aL1lP+L47E=;
  b=JJbh5w83Lg1vuYvKTHEfA0j4iST0BeNUSi6Mh31mPaBNt2q/+jK7P8Te
   zzhwYHcdPF4Pe+XDOTExvkblrd0bkEzpCKm3fSW6k77A9lmR1BQPZ7p5h
   M22znTvVR/xBWYjfy3u/UgBsFIa66/533GqaPevcoc2MJEfDN1XW4m3OJ
   Mj8KDtsWL6ZsfFFdl6CRIaFWQFcmFEmMcUSFslESTwiZnmPsDYzTXzefq
   IqLCXBSfkRumMJtafWannlM5rLQ4/j6StofOJLzhPTARpGYdTGKPdTx3x
   HEzTL3PyQLHByw7prixqTinNfGiR7DMqQPIzanZM3N7FTqanepOas04xl
   Q==;
X-CSE-ConnectionGUID: gPQo/LGsRgWroAqR73TVuA==
X-CSE-MsgGUID: ZfpPcM13SpCZmfdIh5Y4Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="86828996"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="86828996"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 07:39:27 -0700
X-CSE-ConnectionGUID: DiUElBJZRoWf23aFjuu6ug==
X-CSE-MsgGUID: ucJzOK8aQVuk64QGfj/R3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="251478320"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 07:39:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260401094318.658932-2-thorsten.blum@linux.dev>
References: <20260401094318.658932-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] platform/x86: Fix typo in function comment
Message-Id: <177557275885.18830.4715237725941075216.b4-ty@linux.intel.com>
Date: Tue, 07 Apr 2026 17:39:18 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 01 Apr 2026 11:43:19 +0200, Thorsten Blum wrote:

> s/Fress/Frees/
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: Fix typo in function comment
      commit: ec427398794bbc0e294225a094a3060cc4bff19c

--
 i.

