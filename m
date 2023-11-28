Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSr4Szj6"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E55010D7;
	Tue, 28 Nov 2023 05:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701177263; x=1732713263;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GgzACGSPeQe5ZPsf1HOwOLllMfyh95jYV52WCf4dJ+0=;
  b=HSr4Szj6pX7OYolhFVhSTzYZkLuI3IhQtNXRVFY2pdkiWwfeLt5pC9h7
   dyboA3qJbv2jzBFROtoIGtufWWMAmMzupgWDhcF4eoTecAtzi3kP7ak+L
   F5vu2w2g0NdscIUFq0ig8fQ1onozvMDcQ/q+SrFqZtWoya41qhTHYiT5i
   TOJ3AQJz193sLWC9pqBiBj10NaVOeXSo9stD4rekd0ms1ub7UoL4hDhI2
   rP/0KTIot12ZloPs0IiANyLGmZESfb/9HoQrpCU3Y7TXmSeNA4ka1tC7D
   WSbtMIHoAxXfwC0Nm63q8Hwkd/+OZMnqwY2VM+MCCqRB3QAWajIloy7Zj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372294279"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="372294279"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 05:14:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="912428650"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="912428650"
Received: from haslam-mobl1.ger.corp.intel.com ([10.252.43.79])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 05:14:21 -0800
Date: Tue, 28 Nov 2023 15:14:18 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: wmi: Skip blocks with zero instances
In-Reply-To: <20231127222242.115507-1-W_Armin@gmx.de>
Message-ID: <72248066-9c23-1850-b9c2-4a8e4d9c4385@linux.intel.com>
References: <20231127222242.115507-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Nov 2023, Armin Wolf wrote:

> Some machines like the HP Omen 17 ck2000nf contain WMI blocks
> with zero instances, so any WMI driver which tries to handle the
> associated WMI device will fail.
> Skip such WMI blocks to avoid confusing any WMI drivers.
> 
> Reported-by: Alexis Belmonte <alexbelm48@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218188
> Tested-by: Alexis Belmonte <alexbelm48@gmail.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thanks for the patch. Should this have a Fixes tag?

-- 
 i.


> ---
>  drivers/platform/x86/wmi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index cb7e74f2b009..4f94e4b117f1 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1346,6 +1346,11 @@ static int parse_wdg(struct device *wmi_bus_dev, struct platform_device *pdev)
>  		if (debug_dump_wdg)
>  			wmi_dump_wdg(&gblock[i]);
> 
> +		if (!gblock[i].instance_count) {
> +			dev_info(wmi_bus_dev, FW_INFO "%pUL has zero instances\n", &gblock[i].guid);
> +			continue;
> +		}
> +
>  		if (guid_already_parsed_for_legacy(device, &gblock[i].guid))
>  			continue;
> 
> --
> 2.39.2
> 
