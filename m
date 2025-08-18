Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3005261B70
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Aug 2025 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755517867; cv=none; b=MFdtHRDlqt9WXPzrg8DaceKDDA2Zi6u/M8IA+O2gwFkSZhsiiokwrnmJL/j9of3HtJWT1ZoMjsdHg6Cn8HJ4JNDuhsp3eZH5ebs5PHtzIf6plJi/0Pkw97upyZxAR/eoSNrG7KAWaJL5XZXRkXkrs/qFiVyRvqdp/jH1CcrBqHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755517867; c=relaxed/simple;
	bh=O/7JmsmF6TDMBLu3k7CYOhiafDuDc4I37X5HEsR+VGU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uEgG0biu9mpF73FZE3gxi/UtGxRKnQVdMqcfZ+bzgqLZtzQ294iiSglsedBKSJU5Ob+RuCNc+k8/4VEaJg+zBKW4aK3lCmIzl3SeqfpHFqrY9XYTGVQTFhQ86vIuJU37NqPHyR7iUXoJVHXIR+8j2y0I5YacVVQXmdt/hv+7T5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJeofDaD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJeofDaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755517865; x=1787053865;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=O/7JmsmF6TDMBLu3k7CYOhiafDuDc4I37X5HEsR+VGU=;
  b=NJeofDaDywEIvvW5Gy3EmuvQTNLoV9qn39Y48KOEw2Q2j+LRJiv29DFi
   XrbKn2FrEhcordmlyVnVo7PxJmQEq60Ae+nBplkWw3ilYRT7vtUMoKn9e
   YLumFa6J7J2I3c3LzWzTg4CODzRt3SNZXhP/89kWDqI9pOnJzRhRIXnD7
   /DCUH5DTv3IyCtiB83IyTX730ZCE78LmUlDKTyPMO6fIQG7IvQtKg/deq
   Pu6JSHi+DVLwY0h8k2utTttUR553FsXH2RleMbPPMTKZ+OLSydlRNrjUb
   RuKBdEqocm4nveOXoGWSaQFG5rnI2IGAgCDqxrSsKAn0nQxEeHUPHTBfE
   A==;
X-CSE-ConnectionGUID: SVrKY+Y/S2qHCL5+QhnaSw==
X-CSE-MsgGUID: Yln9LJerSgmWane3nPc4SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="80318892"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="80318892"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 04:51:05 -0700
X-CSE-ConnectionGUID: 9UYBTajuTqiFfwkkVi18Mw==
X-CSE-MsgGUID: Kn7cXZciSEqcw+3vu8P37Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166732988"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 04:51:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 18 Aug 2025 14:50:59 +0300 (EEST)
To: Yen-Chi Huang <jesse.huang@portwell.com.tw>
cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
    platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v2] platform/x86: portwell-ec: don't print superfluous
 errors
In-Reply-To: <ac110365-e631-4182-9936-c346d5c05f1c@portwell.com.tw>
Message-ID: <85b8b88c-de22-737e-0fa1-827376116d06@linux.intel.com>
References: <20250813191416.6860-2-wsa+renesas@sang-engineering.com> <ac110365-e631-4182-9936-c346d5c05f1c@portwell.com.tw>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Aug 2025, Yen-Chi Huang wrote:

> Hi Wolfram,
> 
> Thanks for your cleanup.
> 
> Yen-Chi

Hi Yen-Chi,

Since you're relatively new you might not know this:

The usual custom is to include your Reviewed-by tag into the reply if you 
think the patch is fine and useful. That being said, it is not mandatory 
to provide tag for anything nor should it be used as a rubber stamp for 
everything, there could well be patches which need more work or should be 
rejected, obviously don't give your tag for those (but reply with your 
concerns instead if that's the case).

The Reviewed-by tags will be recorded into the commits and it's also a 
way to credit the reviewers for their work.

-- 
 i.

