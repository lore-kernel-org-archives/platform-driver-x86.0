Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3433837E5D4;
	Tue, 13 Oct 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880929; cv=none; b=CJRVFkRjCoIWTOs2aFr6VMyVn/+d6b6TTvAKWtZ8VV2HkGWphvEQvETTjPE2vIM4R+h5Hmv1LSI50f7jpzdl7A4ZE5hS7LXROt0T/Q1Ik0kd2yMBaOl+0RMUnz0JlNv9Z7wZPUE/2PxRCyXSXCQvJxX+RCQeEz8BF6e/sA9TS6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880929; c=relaxed/simple;
	bh=ioXqXj9qHHUZuRd1ZaNfaD7DBkCAGpwnNskU7Up9e8g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Dpv4L+wsyDcsXCe1kMe8gUIcVt2ktRBtgdhSpAVEeTr+N4x72cAxk0rIuGK8UBUqxE0uAs16EPyXSXEzw48nYVbJ9T6vVKm/j75PPvG8Zp9WMJsjFF3LP4WcLihZ67O34p4FLT/VdLjk6l9eqP43X4pyqAjK9EipKe/xMUkfnBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d16CxHQX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d16CxHQX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791880927; x=1823416927;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ioXqXj9qHHUZuRd1ZaNfaD7DBkCAGpwnNskU7Up9e8g=;
  b=d16CxHQXStofBMHx9yWRM9bG9jxATZl0kZ+JpBiVWgdEVzLPi5oUrFSv
   S8VnxfzKlX03I7w/7L5f7JF/mNiFQHlNxPjOvnHGY0msJzqSI4L5JyUk7
   /sVldc0tQtCS5eSkp0FXucJZIAghAsFbnOOf8Vku9scS4hx6nQE28WvK0
   UimQ9d60fqC8P39NhifdFJB7nb1oFohZTtNAiOR09SL38xurUBrEbLoNF
   BCWhsvOqhkZ6A0pwE+uTd3fnrAeQT5IV29wXE4vQrpPSBrVmg7mMfXBii
   msuCxuHvdPi5quCyOG9oKobLGYBsXet4F4kstyirS8U1i1h0403I5MX2a
   A==;
X-CSE-ConnectionGUID: hSt/8MYORfeLFbERbyKqkQ==
X-CSE-MsgGUID: zEc+l3R0Q9+uL38BUljmRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="606405"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="606405"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 01:42:06 -0700
X-CSE-ConnectionGUID: zolFQM1xQ1uan/wne63aBg==
X-CSE-MsgGUID: zpmUX4WSSt2OJjWGV/WjTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1160938"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 01:42:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 13 Oct 2026 11:42:00 +0300 (EEST)
To: Andy Shevchenko <andriy.shevchenko@intel.com>
cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    Hans de Goede <hansg@kernel.org>, 
    David E Box <david.e.box@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 17/20] platform/x86/intel/tpmi: Use scnprintf() to
 build the debugfs names
In-Reply-To: <as0-s6JyjfA2zY-B@ashevche-desk.local>
Message-ID: <24aaf825-ae8b-b19d-4f7f-d5fedc5bcd44@linux.intel.com>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com> <20261006183037.1507007-18-sathyanarayanan.kuppuswamy@linux.intel.com> <as0-s6JyjfA2zY-B@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Oct 2026, Andy Shevchenko wrote:

> On Tue, Oct 06, 2026 at 11:30:34AM -0700, Kuppuswamy Sathyanarayanan wrote:
> > snprintf() is on its way out in favour of scnprintf(). Neither of the two
> > callers in tpmi_dbgfs_register() looks at the return value, so the
> > difference in what the two return does not matter here.
> 
> I believe I asked it already: Why do we care? Do you get any compilation
> warning (assuming `make W=1`)?

Hi Andy,

I do care that we've two functions for essentially the same thing and 
would prefer to have just one that remains (and obviously that would be 
the c variant).

-- 
 i.

