Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE5D1E47C5;
	Tue, 30 Jun 2026 09:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811861; cv=none; b=pI0CfUNSlsHsinZ7W7XtI40KrmDkbDM+9ZB7KphjJhXGr0n/mP5RPTm+A5g7r8EkL+jP3F/S1tmb+djvWDl5urSdcqM4ZYNvdAZnDnDWOzOR45Bqf6tiwYDFpVzvIXUSdQcOEmgknl7Aa7WwhKzWsDo2jVxOEi9qKPFxkC8pDDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811861; c=relaxed/simple;
	bh=gBdUbsC0+OQMmHWN10NH67jQ4OypiD+SSoC1hCZfpns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cr1wJ4mVVp8OHcaM8JQ/bDVZQEdsgpQQBPZ3qpgRfhjRUnCH8YQ0fhP5wvk+drnLb7k5DPEDVwprOdtE9OzLV3JCtZbTXzOAsUKcgGasZCUw8T2FE2nMZZ9pTiKvqrVuOG4+zdpsvcQSJCEyXruYw9+EAbeatG7lG5W/Vrn3Qrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CiTPv1Et; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CiTPv1Et"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782811860; x=1814347860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gBdUbsC0+OQMmHWN10NH67jQ4OypiD+SSoC1hCZfpns=;
  b=CiTPv1EtNndFwe+g12QolydY2HVS3DKZSdt8MI8Z5kC7AlwNmQPBisaH
   O5MDDKStQTGlxOVw0CB773yfU9kUXlPBSEZKY3cDUamyQmoFKlV/yv4V2
   xgL6ni9Vof1QuFSkkrRdm0vqcZpYjYDb5PisW6S39OpktfrvUYzLSOX7+
   vVZ7N0bJPxsWj5jjYRKe7/jPZb2DvGQI/wua+w+wIC6WEfc0GmVEGpL6B
   K5y4+o3D40uRdlWGZsTj/ZIDTFs4u4q6/AodGL2q4OisbEzAViTMNcZje
   KGiTH7GRNLY4N/zcKUFk49hnX5b5Or4FjYDWKl06atOcmv4KVcV9GajLK
   Q==;
X-CSE-ConnectionGUID: CJ8nEzOLS9+ONZAR97ZdPA==
X-CSE-MsgGUID: k25iTd2MSTO2tIPI88XF5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87357446"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="87357446"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 02:30:56 -0700
X-CSE-ConnectionGUID: C2voHFwAQ7qcyjQcPztwMA==
X-CSE-MsgGUID: soVziVOnRr+/Vl5lTpVypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="282275499"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.116])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 02:30:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1651F121C13;
	Tue, 30 Jun 2026 12:30:54 +0300 (EEST)
Date: Tue, 30 Jun 2026 12:30:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: [PATCH v4 10/17] platform/x86: int3472: Add include defining
 struct dmi_system_id
Message-ID: <akOMzrIkN-kbbV7R@kekkonen.localdomain>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
 <0ba52730f67dc995d9d896b81fa6a7320bf8cb4b.1782808461.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ba52730f67dc995d9d896b81fa6a7320bf8cb4b.1782808461.git.u.kleine-koenig@baylibre.com>

On Tue, Jun 30, 2026 at 11:24:29AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Currently <linux/mod_devicetable.h> is included transitively in
> int3472.h via
> 
> 	<linux/clk-provider.h> ->
> 	<linux/of.h> ->
> 	<linux/mod_devicetable.h>
> 
> However these includes will be tightend such that only the bits relevant
> for of will be provided by <linux/of.h>. To ensure that dmi_system_id
> stays around, include the respective header explicitly.
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Link: https://patch.msgid.link/55c02bb0f0577ea1534a1969e72cb6b771b8c5c4.1782682124.git.ukleinek@kernel.org
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
