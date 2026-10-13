Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00FE47DFB6;
	Tue, 13 Oct 2026 17:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911106; cv=none; b=e2z2dBiR+MrhA2Vy3SBEHscDUrkZILVhGo754j/boUr5GzT01SptjGo8WCyaP+4tWlLbwuZm9VDmg029VOC9/imcFP23GLcP6v0xo4/0+iaNpBzz+z2kmDQGKhsX5INfhdP8/WBDpxvYw03VKho9g0qA9bAXmw7NJdFrtbnkLG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911106; c=relaxed/simple;
	bh=92drK7jz+SywmNxwotJEbtvrDNMt2XY1u9v/L9slB7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZXNnhkc24GhR+KZs1otLriQBGDg3p+gYKEOLt/DdGU1fYt8RsQL+PqH2NxaC5dGG03Y7IXGX28Avp/GRf2yXxi7QsJzs74ZthyBPXaeiN27oXIFNd/WK78FlpIHZ/Db7QHnHFjWjGs7nx0OsIAOdDrK80OWm0kO4H+6S3UutVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/WUPSNw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/WUPSNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791911104; x=1823447104;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=92drK7jz+SywmNxwotJEbtvrDNMt2XY1u9v/L9slB7I=;
  b=S/WUPSNwzCpAjnqjH2hPcMGqAhb9hTC6giO9LaxNB3MjG943+kPlFyF5
   h4M211fTD/gtTTeeAd9KJcyluIwf/eMwy8IljIALPJzVgncH6dx5Rz+mQ
   /tfz2NhWCt8/rqUUjxQeGqAHi8wa+G5kW75ZmMeF2DgQUXxOhco2p604i
   B0YVleetK62NwJqkSKt83rkR185A6RblfLt7vX2XfHXtu60Mc3Qummiam
   HbE/aClObTLpAqfPTRk0/U0+V+hzT/5DYl6cF+76ZioJoACGes4t+HxU4
   L1asPG1YH7OqEwRJnA+nTcat4NwlzDOHnOGtMstNwREXECGAUeCefxvDW
   g==;
X-CSE-ConnectionGUID: XaTws6E1QQGygVqRViiTpA==
X-CSE-MsgGUID: C9d9OowPT5W7MhlKj1fXVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="649114"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="649114"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:05:03 -0700
X-CSE-ConnectionGUID: N4ymLR1oR66ZsFmbrytp8Q==
X-CSE-MsgGUID: JIvp9S3KR6yz0TydkyuMug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1132515"
Received: from soc-pf446t5c.clients.intel.com (HELO [10.24.80.90]) ([10.24.80.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:05:03 -0700
Message-ID: <cefad53c-3bc5-4c1e-9fed-9e6eae3bac41@linux.intel.com>
Date: Tue, 13 Oct 2026 10:05:02 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/20] platform/x86/intel/tpmi: Use scnprintf() to
 build the debugfs names
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, David E Box <david.e.box@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20261006183037.1507007-18-sathyanarayanan.kuppuswamy@linux.intel.com>
 <as0-s6JyjfA2zY-B@ashevche-desk.local>
 <24aaf825-ae8b-b19d-4f7f-d5fedc5bcd44@linux.intel.com>
 <as32iyeK1okylcYI@ashevche-desk.local>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <as32iyeK1okylcYI@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/13/2026 2:14 AM, Andy Shevchenko wrote:
> On Tue, Oct 13, 2026 at 11:42:00AM +0300, Ilpo Järvinen wrote:
>> On Mon, 12 Oct 2026, Andy Shevchenko wrote:
>>> On Tue, Oct 06, 2026 at 11:30:34AM -0700, Kuppuswamy Sathyanarayanan wrote:
>>>> snprintf() is on its way out in favour of scnprintf(). Neither of the two
>>>> callers in tpmi_dbgfs_register() looks at the return value, so the
>>>> difference in what the two return does not matter here.
>>>
>>> I believe I asked it already: Why do we care? Do you get any compilation
>>> warning (assuming `make W=1`)?
>>
>> I do care that we've two functions for essentially the same thing and 
>> would prefer to have just one that remains (and obviously that would be 
>> the c variant).
> 
> I see, thanks for the hint, but it's not clear from the commit message.

Agreed. There is no W=1 warning behind this. It is only about converging
on scnprintf(), as Ilpo explained. Below is a reworded commit message
that says so directly.

Ilpo, would you prefer that I send a v5 with this change, or are you
fine with updating the commit message when you apply the series?

---
platform/x86/intel/tpmi: Use scnprintf() to build the debugfs names

The kernel has both snprintf() and scnprintf() for formatting into a
fixed size buffer. The preference is to settle on scnprintf() and stop
adding snprintf() users, so that only one of the two remains in use.

Convert the two callers in tpmi_dbgfs_register(). Neither of them looks
at the return value, so the difference in what the two functions return
does not matter here. 

No functional change intended.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com

> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

