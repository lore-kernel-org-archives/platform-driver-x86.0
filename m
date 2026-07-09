Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D2E4A3418;
	Thu,  9 Jul 2026 17:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783619871; cv=none; b=EE2FaWKPYjgsBplUcuEmxAHNpLcmqGFPdCF5fOssgO3291z1m8Js6iVG+7KOiOoCJTLyOPZX5sIMdbRqdLhPEQpnMz8JL0DPWjKMIAUH+OXYaeafYmdSn8YBMaZXeflRYhFzZRCHb0rHMyySlhzpllrpOnUbGH06eI22oOtTvtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783619871; c=relaxed/simple;
	bh=1i+LK9fhX5O7H6uoN4oD/e7ij1fq3vSkW+Jhdwob2YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUl9xaiJUFuR9eYfgKLxiNvXwHlnjybjM0WNDOs0pLIfFk2cvz+V9ei1iCfXDUpCGDTiKgM2q6uImRab954srHeQdvlSS8dJ+/9j9rriXBwje0eQd+eTHUA7GIyBbNSVu+0evLvMdUYUDgaEm6y7wuUtt4lsMKvq1HgabBl2gYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZdnCiW1L; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdnCiW1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783619870; x=1815155870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1i+LK9fhX5O7H6uoN4oD/e7ij1fq3vSkW+Jhdwob2YA=;
  b=ZdnCiW1LPwOt5MSqWrPVZ5wL2S0PikBL2AJD9f00mxsIo6sKW0QojwUQ
   a29MwIOO5xcVdm3gsbJ0JrUWiexcm0Yadf7fScQDNt23qOCGUvv+60jIV
   HQRfbUxV0k30OX0rAR37h5RwELzxR/Y4acihqHGp8jwN++Z8G2k2YRTOb
   gK0bFIizQEky6mwL4wSEhivtA615ye4HAWRT65ebra3w75Kh1a+TkL0rx
   Qt7hjUE7DASuGkek7nNab5mcQkHXvqsGOCufkXsrbZ9mAdom1bCIZzlio
   2dpUGt9V91ULKwaU1eoTx+BMyxj6N4gokPjMOQ8/8IT6nW/7Po9xn5bz1
   A==;
X-CSE-ConnectionGUID: 7FejHrv9RwaaJe2wk1UtIg==
X-CSE-MsgGUID: s869R5pXS9iUp0avQ6qLzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84505073"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84505073"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 10:57:48 -0700
X-CSE-ConnectionGUID: P06DlQVuQ36Wxv5OzwpkoQ==
X-CSE-MsgGUID: ODYrfw7WTaS6wzpQ3UN8Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253555413"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 10:57:48 -0700
Date: Thu, 9 Jul 2026 10:57:47 -0700
From: David Box <david.e.box@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>, michael.a.bottini@intel.com
Cc: Guangshuo Li <lgs201920130244@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel/vsec: reset state before
 re-enumerating
Message-ID: <6m7fuh2na53vrylsnq52qyxzcwnnoszxtl5kvza55ayoxsojyt@g65savkjqb4e>
References: <20260708032647.712412-1-lgs201920130244@gmail.com>
 <ak4ZUw92pn_F7Z4u@wunner.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ak4ZUw92pn_F7Z4u@wunner.de>

On Wed, Jul 08, 2026 at 11:33:07AM +0200, Lukas Wunner wrote:
> On Wed, Jul 08, 2026 at 11:26:47AM +0800, Guangshuo Li wrote:
> > +++ b/drivers/platform/x86/intel/vsec.c
> > @@ -51,6 +51,13 @@ struct vsec_priv {
> >  	unsigned long found_caps;
> >  };
> >  
> > +static void intel_vsec_reset_state(struct vsec_priv *priv)
> > +{
> > +	memset(priv->suppliers, 0, sizeof(priv->suppliers));
> > +	memset(priv->state, 0, sizeof(priv->state));
> > +	priv->found_caps = 0;
> > +}
> 
> Seems fragile to selectively zero only portions of struct vsec_priv.
> If the struct is amended later on with additional fields, it's quite
> possible that nobody thinks about zeroing them here.
> 
> It's probably more robust to zero the entire struct and re-populate
> the info field.
> 
> I also don't think a separate function to reset the struct is necessary
> as I don't expect additional callers down the road.  So I suggest
> zeroing the struct inline in intel_vsec_pci_slot_reset().
> 
> @David Box:  I've asked off-list for reset recovery to be tested,
> I'm hereby renewing that request.  See section "Software error injection"
> in: Documentation/PCI/pcieaer-howto.rst

We'll do the test and let you know. Thanks.

David
