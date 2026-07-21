Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3816746D556;
	Tue, 21 Jul 2026 15:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649174; cv=none; b=ltawR2Vi/kaxKJR/zkiK4ZpH4XD9Yt9omNOabJLcBYLs0zQQp4lFpY0P6KlKoXkojCfDp5NeEHVI8dFlEgQLJ81bWPYSvDVn1H7/yByoevpbogF7NAhQ4hcUn1YauehqXdd4YESvWLiis6s5ba2ka0j+uoWt3GNuwWVRNL3RmhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649174; c=relaxed/simple;
	bh=FTPJ8TAmf/KBrG67Ns833mKdBm8h7cpCyCHxiCaE7ug=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lF/xOQ8InAWgUVFzg82kJhglRIpdtFpM7HTwbqCcT3bl1bvxzm6QYlXq5aZHjK6xrvF0fB57VqrLRgxlsDT9JicJi6T2lZm35T3pH+wC8uvDbUwjYQrW4koR8RhB6bA4f24GmUlZkIdsTOepvk2+ssgZcoUHhtv3EIIk/mLUYt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKjo2i4A; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKjo2i4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784649173; x=1816185173;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FTPJ8TAmf/KBrG67Ns833mKdBm8h7cpCyCHxiCaE7ug=;
  b=FKjo2i4AirOKjazMsqz9RFubzIDmTGkfcxNj6QDZvUh/BLpbauvar3UI
   lrwtX1R2lEf98hRUrnNQkkJygbdhUoXuYqfYDDriw4OO0QY4CVrift9eT
   q4DRG8bUw7tfBWClu6EjxLDjndGUFAt1O7VAhqBcMLdbLdfo4HiGZ5hnr
   rAO6Ih4WvEqpzgFpk+fqurOhLvptGUqYHZGgloIIsFdmtjOClduU++qBR
   QbgW+g8YtVkcD/JZYAlpQOcY89ZPtAWjSVSEMV9rApwqp+KEuBANsJF1W
   ixOKlh+6X2vWEnKGk1KfrVOA7QkK8fh3+qisWHJQN+MVIqZYc9mHCfBD/
   w==;
X-CSE-ConnectionGUID: 1jDKEHLMTDWJpnCPu2o8Ag==
X-CSE-MsgGUID: BrEnvAXhRFGjqcLgGfNHKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85374225"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85374225"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 08:52:36 -0700
X-CSE-ConnectionGUID: AO+77HYwS2CquVxmeJP59Q==
X-CSE-MsgGUID: tJ0KEf5cQXqqbHR1A3e4rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="253432441"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 08:52:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 18:52:28 +0300 (EEST)
To: Emre Cecanpunar <emreleno@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, krishna.chomal108@gmail.com, 
    radheykalra901@gmail.com, edip@medip.dev, hello@kursatabayli.dev, 
    mjg59@srcf.ucam.org, akpm@linux-foundation.org, jorge.lopez2@hp.com, 
    jes965@nyu.edu, mario.limonciello@amd.com, julien.robin28@free.fr
Subject: Re: [PATCH 3/5] platform/x86: hp-wmi: handle errors in the OMEN key
 event
In-Reply-To: <80d2021166a4e71453d366012598f5f4ac2f2c34.1784195117.git.emreleno@gmail.com>
Message-ID: <55c565cc-bad2-0932-ec38-ee1f4d7628b7@linux.intel.com>
References: <cover.1784195117.git.emreleno@gmail.com> <80d2021166a4e71453d366012598f5f4ac2f2c34.1784195117.git.emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jul 2026, Emre Cecanpunar wrote:

> hp_wmi_read_int() can return a negative error code, but the
> HPWMI_OMEN_KEY handler passes it directly to
> sparse_keymap_report_event(). The value is then converted to an unsigned
> key code, causing a bogus lookup and a KEY_UNKNOWN input event.
> 
> Stop processing the event when reading the key code fails, mirroring the
> existing check in the HPWMI_BEZEL_BUTTON handler.
> 
> Fixes: f4a31a428d0d ("platform/x86: hp-wmi: Add HP Envy special key support")
> Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index e226b772ef00..29881749aae6 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -1253,10 +1253,14 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
>  		platform_profile_cycle();
>  		break;
>  	case HPWMI_OMEN_KEY:
> -		if (event_data) /* Only should be true for HP Omen */
> +		if (event_data) {
> +			/* Only should be true for HP Omen */

Moving the comment here causes it no longer make any sense because "true" 
related to the if check.

>  			key_code = event_data;
> -		else
> +		} else {
>  			key_code = hp_wmi_read_int(HPWMI_HOTKEY_QUERY);
> +			if (key_code < 0)
> +				break;
> +		}
>  
>  		if (!sparse_keymap_report_event(hp_wmi_input_dev,
>  						key_code, 1, true))
> 

-- 
 i.

