Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNAKnZ+/"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F135FE5;
	Mon,  4 Dec 2023 06:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701699114; x=1733235114;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1HeNEWRwAtwYmP+jZvWhZuHAj19jgWYYeZZNwN/jM6A=;
  b=YNAKnZ+/hflBMFiL5HukqIxOEQyo3qhBMAKhtq3Qt9uiQl5+vHY5etAw
   E3dr9K8vVxnPZ4U8oh24Qd4xx+bmMHQO5b2B5BzCM6tFFD9S3yYAGY7vD
   4KSrz47YFXAzntmmjlukhJh/SvwOkS/o1lXNl53sTVUKU7wBxt36NRemM
   OuzdUuWb4dTEZExIBQHexlyfyjyrJqQIdj3l5IvlU4ssTVtt2vZlP0NWi
   39Fxd5dCz4Bj/QZ0QpLCHfmTwFnQpn/fQ3NFToZL5uT/XDcEGkW5F7WbW
   A8a8J0ONvdQocGTefCE5m9heF4W8eJJEd9kdwl4o/9Q1kD1oxjkshPycA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="424902980"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="424902980"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 06:11:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="770539384"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="770539384"
Received: from malladhi-mobl.gar.corp.intel.com ([10.249.34.28])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 06:11:51 -0800
Date: Mon, 4 Dec 2023 16:11:47 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    markgross@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] platform/x86: ISST: Process read/write blocked
 feature status
In-Reply-To: <d3b0dd08-4eca-4268-8b13-e60bd3d85524@redhat.com>
Message-ID: <e64acb49-608b-a673-c145-7b6bf4c38d5a@linux.intel.com>
References: <20231130214751.3100418-1-srinivas.pandruvada@linux.intel.com> <20231130214751.3100418-5-srinivas.pandruvada@linux.intel.com> <d3b0dd08-4eca-4268-8b13-e60bd3d85524@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1301914211-1701699113=:3149"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1301914211-1701699113=:3149
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 4 Dec 2023, Hans de Goede wrote:
> On 11/30/23 22:47, Srinivas Pandruvada wrote:
> > When a feature is read blocked, don't continue to read SST information
> > and register with SST core.
> > 
> > When the feature is write blocked, continue to offer read interface for
> > SST parameters, but don't allow any operation to change state. A state
> > change results from SST level change, feature change or class of service
> > change.
> > 
> > Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > ---
> > v2
> > - Change read_blocked, write_blocked to bool
> > - Move the check for power_domain_info->write_blocked for SST-CP
> > to only write operations
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Did you drop Ilpo's Reviewed-by from v1 on purpose
> because of the changes ? Or did you forget to add it ?

No he didn't because this patch had an issue in v1 so I never gave my 
rev-by for this patch. ;-)

But here it's now for v2:

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-1301914211-1701699113=:3149--
