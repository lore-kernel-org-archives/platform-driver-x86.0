Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ov+fHzpt"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D76D18B;
	Mon, 11 Dec 2023 02:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702289377; x=1733825377;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TQRhBF4KvDlaLwm69w1dNBqRhLLQ2db1I6CDDBLiMnU=;
  b=Ov+fHzptOLrmK8PBYWd4RO3QEfa7JAJyVYm4mHlLwualsstRpy3SkgmF
   HiwiQZDnsD6tIi9WcBMrETYpN2I+kRHCqXEe0G5u6R9Ku0GpCcasdGpzz
   7uJ27LKm7LomQTVhQCFOgJ1v9Vs4ppRl0na4+WKlfzAwdhcbXG8l5xFTT
   txnLGUP68n6y+UsHkGSOkPj+Rd6INo+gDCX7+oCs7JNgyKeV72D8b5g8X
   BUiLfdmekkiIRX2GjVJojkQvdnGG7oegVGtVPg4RHB8ARe8qK8XqP5sOI
   vFioMx2vxUWTn00AHIZkHi6bjZ0EPatMvOlSe3+la7RwckOcjogyPimik
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1740762"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="1740762"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 02:09:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="21023237"
Received: from lmckeon-mobl.ger.corp.intel.com (HELO iboscu-mobl2.ger.corp.intel.com) ([10.252.48.111])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 02:08:58 -0800
Date: Mon, 11 Dec 2023 12:08:56 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hdegoede@redhat.com>, corbet@lwn.net, 
    Dell.Client.Kernel@dell.com, linux-doc@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] platform/x86: dell-smbios-wmi: Use
 devm_get_free_pages()
In-Reply-To: <20231210202443.646427-4-W_Armin@gmx.de>
Message-ID: <a0cd5b8-304d-1e8-7923-fe5ad9f7c469@linux.intel.com>
References: <20231210202443.646427-1-W_Armin@gmx.de> <20231210202443.646427-4-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-471716995-1702289340=:1867"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-471716995-1702289340=:1867
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Sun, 10 Dec 2023, Armin Wolf wrote:

> Use devres version of __get_free_pages() to simplify the
> error handling code.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-471716995-1702289340=:1867--
