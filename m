Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDAF4CEE60;
	Mon,  5 Oct 2026 18:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226379; cv=none; b=FGdLsgjawzT8thvG1kyrFZqgPgpCDpikx1jOQbjcR/SEcDnrOE1QQ0rTkqF3bjcTSEfQLoGJstbAQxJX8eMy84JsMuYONXLyJiOJLDd1ticUmRAEZQkxfmyIhjGEoahnener8P2bXcAB6e/ghSr1OOxABHS+fnfbtpAF+1iNGoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226379; c=relaxed/simple;
	bh=quiG0YBMVFVTCMcJstGGYjvS450MHbc7C9KVIAVzyp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q7xjfAT5tzsd5hoeFOdtUqhpEDOvUL3iuxlBX9qZE9ABM7gibHp0DWSn+w0twWN3ZKQy5rn2VKqDO/ljUhW4Waqm27ojhVaytyAXLWSGdqbh8sH6WmhAfKu2+lYJUixn1n2mqzc9KZRBYNVG2C1/G6d65UjB8JVxKAkpJ/f9HrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZK7ZaPG1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZK7ZaPG1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791226378; x=1822762378;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=quiG0YBMVFVTCMcJstGGYjvS450MHbc7C9KVIAVzyp0=;
  b=ZK7ZaPG1C0ieIj222aHHh+9ZMWqlWZGp97+FpHSrV/KhrLVXrvtKn/nm
   ACZJ4qtXzTUHOvR1lQVV2n5xbsHj9g2WfihxWRFFyBEmiu7TXgJ285dUA
   1Hsjrn99xuPF4fostKYLLvJzSY+FHePJ3DmqARfEsoqpBXS6plVQyMUwN
   RkcmhNEmLNm8KsjazqmEplXXh6eAjhA9Yhr+h0AVCI7r9I4kYggR8YEfH
   MsHdtp90TsPztMa3F3LuQW9hUtH5XghtNMZPl+fGeuAzZU6EvuuCWOxlc
   z43SJuYMgFwVM6n5r0GVQsY3zRQi065Qr8UsrLL+Shsev6hHOtapVHfTy
   g==;
X-CSE-ConnectionGUID: nHHu7fwnQWKcJsOl8K0r5Q==
X-CSE-MsgGUID: s+j4pXo/QCOuRGLej0GYiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94780819"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="94780819"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:52:58 -0700
X-CSE-ConnectionGUID: VhHs1AWjQ9aCZB7MzRQrzQ==
X-CSE-MsgGUID: +ZAnXje3TkizjjUg7mAEYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="276433539"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:52:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Hans de Goede <hansg@kernel.org>, 
 Zain Aboobacker <zainaboobacker33@gmail.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260926162528.25365-1-zainaboobacker33@gmail.com>
References: <20260926162528.25365-1-zainaboobacker33@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: fix typos in comments
Message-Id: <179122637037.41716.302855305053076512.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:52:50 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sat, 26 Sep 2026 12:25:28 -0400, Zain Aboobacker wrote:

> Fix various spelling mistakes in comments found by codespell.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: fix typos in comments
      commit: f37a014dc5780530673f072d8f404eb379a8fd49

--
 i.

