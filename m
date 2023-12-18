Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C8874E05
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D22NH2v3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702904468; x=1734440468;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KAMxYdDqUV+wJtCKausFjJHBf7OkLdUcumsjkolOFZM=;
  b=D22NH2v3hazwfIa/RWsykQnVDFxNG0SQcUmGO7Dm84kfbzG8n93K1nlO
   /CfrrlawCdM6L0w+u0h/iJW0AaEFX4Z5ltGMHrB7gSblpg/oOM8hZXV1C
   nHgvyDD0Ioz+HYMHSv4qyHTxZZG+sJCS/Wz3ZH8mSlJY+i0BgTPOlwCz9
   ACouz+tlxjGyEht4QWstPOrZiHFdwHeqF8AgMoV9ovxvPYdQcOL96hZGS
   gWBQEowlMzU/ydoW5M8GRnacqurXnGaWTuQKPJ17++2T8Sr2Xnei/j1/h
   sMfYco7DokE4DU184F6hK0fUfYCPqSrFAcuA0ikTKDuApPuaIBf0ArnMb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="375000819"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="375000819"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:01:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="845944998"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="845944998"
Received: from gmarin-mobl1.ger.corp.intel.com ([10.252.34.78])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:01:05 -0800
Date: Mon, 18 Dec 2023 15:01:02 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, 
    "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Goswami Sanket <Sanket.Goswami@amd.com>
Subject: Re: [PATCH 2/4] platform/x86/amd/pmc: Only run IRQ1 firmware version
 check on Cezanne
In-Reply-To: <b341cde-aafe-b676-f018-1ee9cf26913a@linux.intel.com>
Message-ID: <eda8ae4c-112f-bcc4-71c9-a21bc75992b7@linux.intel.com>
References: <20231212045006.97581-1-mario.limonciello@amd.com> <20231212045006.97581-3-mario.limonciello@amd.com> <b341cde-aafe-b676-f018-1ee9cf26913a@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-706224192-1702904466=:2348"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-706224192-1702904466=:2348
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Mon, 18 Dec 2023, Ilpo Järvinen wrote:

> On Mon, 11 Dec 2023, Mario Limonciello wrote:
> 
> > amd_pmc_wa_czn_irq1() only runs on Cezanne platforms currently but
> > may be extended to other platforms in the future.  Rename the function
> > and only check platform firmware version when it's called for a Cezanne
> > based platform.
> > 
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > ---
> >  drivers/platform/x86/amd/pmc/pmc.c | 21 ++++++++++++---------
> >  1 file changed, 12 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> > index 666cc6e98267..824673a8673e 100644
> > --- a/drivers/platform/x86/amd/pmc/pmc.c
> > +++ b/drivers/platform/x86/amd/pmc/pmc.c
> > @@ -756,19 +756,22 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
> >  	return -EINVAL;
> >  }
> >  
> > -static int amd_pmc_czn_wa_irq1(struct amd_pmc_dev *pdev)
> > +static int amd_pmc_wa_irq1(struct amd_pmc_dev *pdev)
> >  {
> >  	struct device *d;
> >  	int rc;
> >  
> > -	if (!pdev->major) {
> > -		rc = amd_pmc_get_smu_version(pdev);
> > -		if (rc)
> > -			return rc;
> > -	}
> > +	/* cezanne platform firmware has a fix in 64.66.0 */
> > +	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
> > +		if (!pdev->major) {
> > +			rc = amd_pmc_get_smu_version(pdev);
> > +			if (rc)
> > +				return rc;
> > +		}
> >  
> > -	if (pdev->major > 64 || (pdev->major == 64 && pdev->minor > 65))
> > -		return 0;
> > +		if (pdev->major > 64 || (pdev->major == 64 && pdev->minor > 65))
> > +			return 0;
> > +	}
> >  
> >  	d = bus_find_device_by_name(&serio_bus, NULL, "serio0");
> >  	if (!d)
> > @@ -928,7 +931,7 @@ static int amd_pmc_suspend_handler(struct device *dev)
> >  	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
> >  
> >  	if (pdev->cpu_id == AMD_CPU_ID_CZN && !disable_workarounds) {
> > -		int rc = amd_pmc_czn_wa_irq1(pdev);
> > +		int rc = amd_pmc_wa_irq1(pdev);
> >  
> >  		if (rc) {
> >  			dev_err(pdev->dev, "failed to adjust keyboard wakeup: %d\n", rc);
> > 
> 
> Hi Mario,
> 
> This doesn't look necessary for the fix in this series, right?
> 
> I'd prefer to leave it to next and only take 1,3-4 to fixes.

Nevermind, I was just blind. :-/

-- 
 i.

--8323329-706224192-1702904466=:2348--
