Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E186C17E
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Apr 2024 07:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714029213; cv=none; b=MfKBqVl2v5oOAPyOVmn/HrWwBxCGEBMO404RQHrn39Awh6aXOQ2+MXpmYpBE7ofYLUKSZWLhKh4/mDQvScEs9NigIXgp220q3ej9pryTC11FTNW7XfrP84cMdT0C+gx9X4L9txME21fTj5lhsKZMRd91XVboMtgNt53jlndL26g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714029213; c=relaxed/simple;
	bh=n6VaY2HRmeyPu2afxxgffGNNwp7i6kdz2F3EfJi1P8k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ig9hRjKrKPAx02vL7XiqadCCGGM6edF7kJ+RLCMhLtj1V9timRrndRNri+8PFq7WxuMV82+OhWhGiDAc66s0YORsR5EaMYonyemcQebxELo4UY60tIhcdFNy98Mw0b4GdsyGEc5SFWuBEgFEoccwHm2sFy+FSed66tI+GHa4JTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DWAluqkt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWAluqkt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714029212; x=1745565212;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=n6VaY2HRmeyPu2afxxgffGNNwp7i6kdz2F3EfJi1P8k=;
  b=DWAluqktaaBDHrBz1+Ga2X4HdyGKDMSnklClgxKJTnSsQbsd0NNw4eHY
   bsTrKuSPfU+bDK29BTVZuqjpB+bjeQq2CpOuba5AnQFtYGZzb9hOGczRM
   fK0r0mi5F8VRiNsSGeJQtV08nOLbZa4ItdkLWZl4v+bQVof+ZmSSh8U94
   Yve3ZD+2nrMDg1l9uKKZysl9/oChLyRdhiyk6BU4bJIgrJ17AvKhznJho
   77K/Mx15RVctJjsXXFb4XAqFRlJgUCk73IYJlS2m82ccdkTBucZ5rzakv
   2fNrbuYNGmztpV0PsARfM/a88GxmSnaP2CAFmVLKZ5m4LIWiz+MsXSdGm
   A==;
X-CSE-ConnectionGUID: 0+L5BMFHTkGw1cNQdyhp5w==
X-CSE-MsgGUID: J4GjotRUSEiY9uutLpqb6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9855322"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9855322"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 00:13:31 -0700
X-CSE-ConnectionGUID: C02g2RNrTi+W5TRQgEKyHw==
X-CSE-MsgGUID: 1KPrScc1TneknUCHa9qTcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="29597333"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.42])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 00:13:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 25 Apr 2024 10:13:21 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 04/24] platform/x86: thinkpad_acpi: Drop
 ignore_acpi_ev
In-Reply-To: <20240424122834.19801-5-hdegoede@redhat.com>
Message-ID: <a8743812-0df6-e916-1272-657bbfa39892@linux.intel.com>
References: <20240424122834.19801-1-hdegoede@redhat.com> <20240424122834.19801-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Apr 2024, Hans de Goede wrote:

> Setting ignore_acpi_ev to true has the same result as setting
> send_acpi_ev to false, so there is no need to have both.
> 
> Drop ignore_acpi_ev.
> 
> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Not directly related to this patch but while reviewing it I noticed 
this which should be converted to false:

	send_acpi_ev = 0;

-- 
 i.
