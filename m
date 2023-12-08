Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4oU5yFo"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0849F10C2
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Dec 2023 03:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702034400; x=1733570400;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=EWkH9YOh7LsERrjcLWWYFVR2PopgTO6ogy/5zbinxng=;
  b=c4oU5yFoLpfCKzZALaNUSuuZG9oDm2YgYx+PbEG9jIzTlkqF3kvTHriv
   vTOhLto/YIzIDzCqlkqc0VfTm1oV9GgL1EuyC9wi1GRI7CIKGc6C0+3ys
   TPgROo9aPy6A9W02Ukvm5bwjYORQYsUQEsHUzZTzn2s5LEBpgOe1MoalA
   YvKAMn007aG1zpDs8oiQSrvi2Jhy0cP0KdoIJWI0gyKJ+w/C1APaZFGXI
   EHEMHHBREfZkfZjsx82vx0pHgJXCGczTfdNNuw3ikbx8RFpRKQDkkM6mO
   NZYGAHimIlS+QOJwC9qUHMKuXtp1lUOWCoectmK/94rJPBPFvmZQY7TRQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1472895"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="1472895"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 03:19:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721841282"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="721841282"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.49.180])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 03:19:56 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Arnold Gozum <arngozum@gmail.com>
In-Reply-To: <20231204150601.46976-1-hdegoede@redhat.com>
References: <20231204150601.46976-1-hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: intel-vbtn: Fix missing
 tablet-mode-switch events
Message-Id: <170203439059.2193.2525789605771540472.b4-ty@linux.intel.com>
Date: Fri, 08 Dec 2023 13:19:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Mon, 04 Dec 2023 16:06:01 +0100, Hans de Goede wrote:

> 2 issues have been reported on the Dell Inspiron 7352:
> 
> 1. Sometimes the tablet-mode-switch stops reporting tablet-mode
>    change events.
> 
>    Add a "VBDL" call to notify_handler() to work around this.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel-vbtn: Fix missing tablet-mode-switch events
      commit: 14c200b7ca46b9a9f4af9e81d258a58274320b6f

--
 i.

