Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E4F405F0
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 17:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnGSaQFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703091660; x=1734627660;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=f0GiPSPuaBOdRHS5dCEM62PYNO34WxK+c6K+8GUgEAk=;
  b=bnGSaQFNFVDbh4eOSKbDweFICQLuhy3nh16SSzk4cspty3ez+iv8GoYd
   dHmgsCdMMZv3eShN0lJn8lsycrMrxIrwGJNOIKJvOHBPijhEmfaOh1tHM
   P6MlJl/9XfPzPLOSVnd7u716PTtNhfQ1n4w2o4iwexsClhuk6clwiypE3
   j1k/7kmwkUNLbePV/3LfB23EhUY54Cm2kNtIovtmX8Kg6i9pP98YeMhma
   M0Vml+jfL92ls5lZf8sFXcoHfjQJ7RGHgQNN7EHlxWYG5skTjs50leSpq
   jlxBNnJo0U4nnBKFlqmZkNs9QoLZScQ1s/u6xmct9m3jLKtvnJoR/Avyw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="426983254"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="426983254"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:00:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="779905752"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="779905752"
Received: from alobakin-mobl.ger.corp.intel.com ([10.252.50.56])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:00:36 -0800
Date: Wed, 20 Dec 2023 19:00:34 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v2 2/7] platform/x86: Cache pci_dev in struct
 hsmp_socket
In-Reply-To: <20231220165528.1351200-3-suma.hegde@amd.com>
Message-ID: <b96c36ec-c794-8134-6786-d18dbb953893@linux.intel.com>
References: <20231220165528.1351200-1-suma.hegde@amd.com> <20231220165528.1351200-3-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-511058314-1703091637=:1807"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-511058314-1703091637=:1807
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 20 Dec 2023, Suma Hegde wrote:

> Cache pci_dev obj during probe as part of struct hsmp_socket
> and use in amd_hsmp_rdwr(). This change will make it easier to
> support both non-ACPI and ACPI devices.
> 
> Also add a check for sock_index agsint number of sockets
> in the hsmp_send_message().
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Changes since v1:
> 1. Remove !sock check in hsmp_send_message()
> 2. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-511058314-1703091637=:1807--
