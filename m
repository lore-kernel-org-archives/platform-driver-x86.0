Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOT7Qzoo"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E56AD1;
	Mon, 11 Dec 2023 01:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702287855; x=1733823855;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=e9UzSq7u1+T3BYIBBw3mpsXLdJcC9xa15mmoGy5LqpE=;
  b=WOT7Qzoot4znoqzAuxe23yOBIwk2dxAVz/rVKsUG95I8NNtxRoLUkKSz
   WMIuMmqPG1KbC0gkK5hfI0Ep1q/wGwLJ2q59yZGgICNvEuE+5MAgb1gLd
   bURikV4AnlC9nQs0vdyqhHlvNBz8DcEeudCBCGnAZ/TzpAFtDeoaWSjCZ
   EOZ0+SU7GS95+/l6g8Nk8m+KlDVdqmJzY7NM6uC+KA1lhAz5iqmVPFv2Q
   WRa0FuyF8IqCUnRCqTiCeflzkkQk6+tHGOa2wyShw0LZTSRH9MvLrL/uD
   CPXE0wIw3kXctNO2uTHzxokyqRc90QGMyXX6iioUGE9Rdfcnu2pQYrbso
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="16172824"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="16172824"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 01:44:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="838963603"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="838963603"
Received: from lmckeon-mobl.ger.corp.intel.com ([10.252.48.111])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 01:44:12 -0800
Date: Mon, 11 Dec 2023 11:44:01 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 1/1] clk: x86: lpss-atom: Drop unneeded 'extern' in
 the header
In-Reply-To: <20231208165238.3309058-1-andriy.shevchenko@linux.intel.com>
Message-ID: <2fd750c3-1f57-3d71-386b-9e6e57d5133@linux.intel.com>
References: <20231208165238.3309058-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2115513837-1702287853=:1867"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2115513837-1702287853=:1867
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Fri, 8 Dec 2023, Andy Shevchenko wrote:

> 'extern' for the functions is not needed, drop it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/platform_data/x86/clk-lpss.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/platform_data/x86/clk-lpss.h b/include/linux/platform_data/x86/clk-lpss.h
> index 41df326583f9..7f132029316a 100644
> --- a/include/linux/platform_data/x86/clk-lpss.h
> +++ b/include/linux/platform_data/x86/clk-lpss.h
> @@ -15,6 +15,6 @@ struct lpss_clk_data {
>  	struct clk *clk;
>  };
>  
> -extern int lpss_atom_clk_init(void);
> +int lpss_atom_clk_init(void);

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>


-- 
 i.

--8323329-2115513837-1702287853=:1867--
