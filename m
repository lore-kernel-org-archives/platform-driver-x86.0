Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D2F134CCF;
	Tue, 18 Aug 2026 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063612; cv=none; b=hy3OVQQNNpzqauJRcaVuQE3ucDr5rjw2PDCfqfiXnuPj5LmCgtRyrZG/mpNeZyMMPTU6HJ2J6rKnL9bOqVW/p3fK8Mu8c/Q0F6TOnVIPfjHpIwd1DBLZfSqcwy16oFuFMHuCD6CA37oYAV7tvj78G6FPNNlencHLJ+UmjrZgV+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063612; c=relaxed/simple;
	bh=4UZei1/u1eLgDMH58dBLsJpGzm4+B5v06AmAV9pWch0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bVWdryjg0oIb48gShBrPdU0vS4IZ8takHcsfUuk+2pGgzok8xSsLIu1v0+iUtTmUqdM454FlRf+yMtledmfsx3W/ry5dwxS9uK54FtVl9qTl49MJkA7PHeDnO2TQ/NI70OG7fw7VRJK54XRE+JSNru6BXAmXo22TNjE8gRKR2Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8QDpFaH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8QDpFaH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787063610; x=1818599610;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=4UZei1/u1eLgDMH58dBLsJpGzm4+B5v06AmAV9pWch0=;
  b=U8QDpFaHA34TBhEMslt+PgMmKjMM5WmxhB5C+CqQ21xwzH2vdZs2MZd1
   /n0ezEdZ7mVvoWB2YUTZR7Bbg/w0XuNfcZ9qcjCqUpgRn3/yRrBE0wUJS
   J3NHA1jzBx6szbPA5cdr55Idky44jAAtno2FgQ+DVxYKpn9t9FDsoIsBZ
   fFzIHQ3uQwE9I8erS5YInZGTnDfcmjBH0v8cCfMNarBD4oErYK8srn4u3
   JzuG1YqpIHvWq49Ky8pSc01GZZ17WwBWRWomahzZAEFR0VILQMdI5slm/
   618ctYUXyd/8O5ebVnXSfXlQWjrpGPNXUxxQ9BoLpnKd9aikmDITUsnUX
   g==;
X-CSE-ConnectionGUID: D8K1ufuWSFKMtKYi2yJzEg==
X-CSE-MsgGUID: MCivNw8jSTqyabZ0m1x/Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="75086846"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="75086846"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:33:29 -0700
X-CSE-ConnectionGUID: d9m8jMdhRNa3bU6NGDJB5w==
X-CSE-MsgGUID: D/X0xRWWSN+auX5XTlWYqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="263511790"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:33:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: david.e.box@intel.com, xi.pardee@linux.intel.com, 
 "David E. Box" <david.e.box@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260730210546.3936101-1-david.e.box@linux.intel.com>
References: <20260730210546.3936101-1-david.e.box@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: update Intel PMC Core maintainer contact
Message-Id: <178706360217.21379.16541034700372251693.b4-ty@b4>
Date: Tue, 18 Aug 2026 17:33:22 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 30 Jul 2026 14:05:41 -0700, David E. Box wrote:

> Replace the Intel PMC Core Driver maintainer entry with the current
> maintainer email contact.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] MAINTAINERS: update Intel PMC Core maintainer contact
      commit: 08ce055a42446b2796e1b12e645eefa673b74af9

--
 i.

