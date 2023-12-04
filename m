Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A60BBB0
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 07:21:21 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="384156788"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="384156788"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 07:21:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="836616739"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="836616739"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 07:21:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rAAl3-00000001mup-0wCl;
	Mon, 04 Dec 2023 17:21:17 +0200
Date: Mon, 4 Dec 2023 17:21:16 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Arnold Gozum <arngozum@gmail.com>
Subject: Re: [PATCH] platform/x86: intel-vbtn: Fix missing tablet-mode-switch
 events
Message-ID: <ZW3ubLNWHbgSwaIK@smile.fi.intel.com>
References: <20231204150601.46976-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204150601.46976-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 04, 2023 at 04:06:01PM +0100, Hans de Goede wrote:
> 2 issues have been reported on the Dell Inspiron 7352:
> 
> 1. Sometimes the tablet-mode-switch stops reporting tablet-mode
>    change events.
> 
>    Add a "VBDL" call to notify_handler() to work around this.
> 
> 2. Sometimes the tablet-mode is incorrect after suspend/resume
> 
>    Add a detect_tablet_mode() to resume() to fix this.

LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


