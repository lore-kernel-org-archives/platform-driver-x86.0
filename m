Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A8747A42
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 17:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNmFqI4x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703092354; x=1734628354;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wwQ9NAQLSQmjULHG4XY8NdNhssIHpu462DOZSexrkoA=;
  b=lNmFqI4xKycNuKVTC8y9Qq3n2p3BBDMwHdbJAjqSFRVaWXQ5/FHWK14H
   nanXgv3GvPKVfC3FpCeq+ToorkrIaS2YGYO9TY2YMY4NGM1VsfyDhzLca
   nrnJpp9x9yMOHkNzqJDqG+SdSExUkYcA60UJwfBwHNr38pjIHL+crABAp
   R+3n2VEMSy4/Nptc6CiX/KjWxgWcAXwQni2tUnO1aFRGINc4wV/Gpnp2y
   A7Q/kW8VYIcK+9fHfvD/MZyUYR4PNnyd6c79y7BurywM8P8XKjGuQubSh
   4UXcPL7QqsMX8EY2askSizGK9+9wj0eHyToALjgop1PG/T3NysX7FJ5JM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="17399569"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="17399569"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:12:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="899779936"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="899779936"
Received: from alobakin-mobl.ger.corp.intel.com ([10.252.50.56])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:12:31 -0800
Date: Wed, 20 Dec 2023 19:12:29 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v2 4/7] platform/x86: Define a struct to hold mailbox
 regs
In-Reply-To: <20231220165528.1351200-5-suma.hegde@amd.com>
Message-ID: <f748156-18ed-4c7-c682-8af4563143b@linux.intel.com>
References: <20231220165528.1351200-1-suma.hegde@amd.com> <20231220165528.1351200-5-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1417032317-1703092352=:1807"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1417032317-1703092352=:1807
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 20 Dec 2023, Suma Hegde wrote:

> Define struct hsmp_mbaddr_info with register offsets and populate
> them during probe, which avoids the usage of macros in core functions.
> 
> During ACPI probe, the same fields can be populated from ACPI table.
> 
> Also move plat dev init to a static function.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> 
> Changes since v1:
> Move hsmp_test() to initialize_platdev()
> 
> ---
>  drivers/platform/x86/amd/hsmp.c | 72 +++++++++++++++++++++++----------
>  1 file changed, 50 insertions(+), 22 deletions(-)
> 

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-1417032317-1703092352=:1807--
