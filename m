Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2DD29E116;
	Tue, 18 Aug 2026 13:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058967; cv=none; b=PPjClBd4o6dl8eDj0Tg6F/XV0cOdN6Qq74gnGv8qZRhRoHKJKmujqs2RBwKZVRJDCvpQdtYlFTWf9vRdpQ6egYTZxznQLPMTRfvDzOIho7pBgnZ6hDRXN+Q/7r7k5Wux4atoCsFh8HoWeKuLL/Q6FquF7U6fd5j7TNNm1vuZdJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058967; c=relaxed/simple;
	bh=tUogCi0hZvlHQFvE4uk74gCiQtyjIxnm63D0thlbwXw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HbOVvySVYJ6KXKQ9zhHhx13qAaFcKWmd525qY5mm1ahp/Py7Bu4zj3yLeBrd6x9V6YEUoCWHWkdAotsQYtpO4Uk5ttfi+TlQEme2nOEgqPc15Uvde3uk92Xye2pOrPv7FE9OeDGS6GM5AJ9uzmAkrKLS73Yen4CUqQnZeEICyn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3JWdUD+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3JWdUD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787058966; x=1818594966;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tUogCi0hZvlHQFvE4uk74gCiQtyjIxnm63D0thlbwXw=;
  b=b3JWdUD+PJ3saTePsv1PFvDyhi5ZzEDWewrTW97NytmIrOvz2RsxEuVG
   XRi/DImqgUmHLD7h3YXuqORVMGSrB0IXAwXetwM7058M19foIdgTDPTW7
   LUD6W5C5LTdpepE8qthyezPgngfHEEh86KiK13/2siRmE0fTrKmT32Fev
   7hyub0p2ahY8uYcjl50mTqRXA5fKaOtrk1TPvVbRXS2jFIHVMwO8e3ErN
   F+HM2LQsPxtbzRC/PIh81W0ZQZbvETieHaTM8BIeZIxT4XSU7Xs6Or2F2
   ewRh21bLywMG8NR/odIWgaTcJh6wBSPpxuAEGI7LHY3aIgbT0hyN5COsp
   A==;
X-CSE-ConnectionGUID: sODtv4fhQryBHmUPL9+VGQ==
X-CSE-MsgGUID: MbG2mP1mS3CkVmGJPkZJ3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="110336267"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="110336267"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 06:16:06 -0700
X-CSE-ConnectionGUID: Af3IxYTdQ5C9VPRhc6nPGg==
X-CSE-MsgGUID: +Bp3k//oQLadDR5/IsVCTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="295153056"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 06:16:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Aug 2026 16:16:00 +0300 (EEST)
To: Korab Doroci <korabdoroci@gmail.com>
cc: josh@joshuagrisham.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Korab Doroci <korab.doroci@gmail.com>
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Add SAMB430 ACPI device
 ID
In-Reply-To: <20260806221255.40148-1-korab.doroci@gmail.com>
Message-ID: <8744b157-4064-8377-1f8a-b5c0ae2622f3@linux.intel.com>
References: <20260806221255.40148-1-korab.doroci@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Aug 2026, Korab Doroci wrote:

> Add support for the SAMB430 ACPI device found on Galaxy Book6
> laptops. Without this id the keyboard backlight device fails
> to bind to driver leaving keyboard backlight control unavailable.
> 
> Signed-off-by: Korab Doroci <korab.doroci@gmail.com>
> ---
>  drivers/platform/x86/samsung-galaxybook.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
> index 6382af0b106c..99f72b204a51 100644
> --- a/drivers/platform/x86/samsung-galaxybook.c
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -1438,6 +1438,7 @@ static const struct acpi_device_id galaxybook_device_ids[] = {
>  	{ "SAM0428" },
>  	{ "SAM0429" },
>  	{ "SAM0430" },
> +	{ "SAMB430" },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(acpi, galaxybook_device_ids);
> 

Thanks for the patch but this is already added by the commit 31e1acf15df9 
("platform/x86: samsung-galaxybook: Add SAMB430 device ID").

-- 
 i.

