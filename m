Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnCFSqoR"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8438172B;
	Fri,  8 Dec 2023 05:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702043008; x=1733579008;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=dokXxTgyGtPuhjl0x3PnNuEf+Q6HC66XteJbDXhIC2s=;
  b=cnCFSqoRGvNhWZN1S9ZGBzEANlCOZkHyCGG8meqaOvI6UvSO1Dj1pMtx
   kSZHOeeUJKTOE6UotGlcXuVm5tl5Ze3d2svX/PUag2Q+dtwMRfsn4MRKQ
   /t46Pky+Vi0IF9t3+l4u1gnvdBCbGjWknl2Fx+tN54IaguC9pkY3RTEw+
   Las7lqTQTt6CQS0JgS+/rVUXWUsnL+tb4sgmK/y7ZHHviOFzaRxoeuZ+4
   U7SrQlU/BU4H+INnG+3mMzm3HT24pXWEf4pwpO9ccHJB/dwYRp6rdYLy/
   tBWy/3ccJd7VXuPkXStKTIsLoEy9XvRd1NiP8e9wG1YOdifdn1Y9F8USL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="398272108"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="398272108"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 05:43:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895542733"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="895542733"
Received: from smatua-mobl.ger.corp.intel.com ([10.251.223.110])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 05:43:26 -0800
Date: Fri, 8 Dec 2023 15:43:23 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hdegoede@redhat.com>, corbet@lwn.net, 
    Dell.Client.Kernel@dell.com, linux-doc@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] platform/x86: wmi: Remove chardev interface
In-Reply-To: <20231207222623.232074-5-W_Armin@gmx.de>
Message-ID: <92e2d5f-77cd-30b0-64e5-28f767baf776@linux.intel.com>
References: <20231207222623.232074-1-W_Armin@gmx.de> <20231207222623.232074-5-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1850445610-1702043008=:1875"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1850445610-1702043008=:1875
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Thu, 7 Dec 2023, Armin Wolf wrote:

> The design of the WMI chardev interface is broken:
> - it assumes that WMI drivers are not instantiated twice
> - it offers next to no abstractions, the WMI driver gets
> a raw byte buffer
> - it is only used by a single driver, something which is
> unlikely to change
> 
> Since the only user (dell-smbios-wmi) has been migrated
> to his own ioctl interface, remove it.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-1850445610-1702043008=:1875--
