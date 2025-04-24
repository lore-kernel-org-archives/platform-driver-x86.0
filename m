Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7175E27FD79
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Apr 2025 17:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745517164; cv=none; b=o9zy+38y8IgOzA6t1h8ZIPlmqY/K9GA8SBwxj+2746YtSPivWwM65bvtoarvfNS0JG1K7xPODdQVfpNauQek9LRXCHZ0mDXrja+JEHW80sO20egaoS2o+ufkLxeYvn49PXpAdTdnsUoRFZjjHFL2aRP9EXyuc0odGRbMZkvcwsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745517164; c=relaxed/simple;
	bh=in/uL8u7VhAKZDPtqN8K+nas84ARnIndg6yHmqotLB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulR67K33nCXhP2tEAta2bgpl9TUvKsYtnLFepT0KfOphzYTrh4hnkt2Ezmr4aiE6BYFfYooVwiYvf/svR2flGiE6IUJUN/8Sy42ugW2OGS9mWLEmxDV69jrtwBdy0mU+JCwb0EWUHk406iNMsOwyb2Ay8NT7ZCFJKWxelrIQr4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=aaoxEOyw; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="aaoxEOyw"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso13668666d6.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Apr 2025 10:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745517161; x=1746121961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YlaX2v98AuQ5nYcPvQ53Jj+P2vIqITznNn40IIDGwq0=;
        b=aaoxEOyw2HxqcNxknTLH/7Es2baH08WfU3HIJork6C9EvvCLNyWbnrn0DmiOVYMfcm
         Ly8ayPOoGjPfpvslDMJd1Md2eFJJ8ETYI1KGqyp99B2otQQvVlJEKczJRzZMuRUy4n69
         EiIC63BelEeaPukHXQMvBnT0x4HtUrcHkfXZeXsUPPiAzzvnR5DFzGrJ1PlqE8LNAAB6
         ta2IETThyIVObpkwZs3Wd1yT0eXVO32XsLrH46/JPQYHetzTxIGkLMIHpTUXlCsouwEq
         j0UYXki6PAFR9AByxCdNSEMkVJwpZAKnTIYVJqoo2PrF7SSnNjli40qIqMLnZYON4bfT
         TGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745517161; x=1746121961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlaX2v98AuQ5nYcPvQ53Jj+P2vIqITznNn40IIDGwq0=;
        b=rq+ClTJRZBViGe+iQ+esvQQ29G/Av+jpTcLwcOavu3py5bez3+7WCj3u7k/RoiCxWU
         3KoI0zhUzEi8w2JQyxjpD8WTKfzZEXZK4DpH82vIszEu8VuolQXiS+qxaPR7rMcnCrv9
         RFyyb6MeerdWvhZHFB4scWWgAsz7/Bu8NX5MGRHF109jT8n5CMnb3zv09EgTLLAV9Z6D
         zTVhf06pyE4nPLt8HJo9kSWFsN1yg+ihKvKhAuAwo5Vmaj1100HqlwRD9ShP08c/Zv4P
         usbX0mEzWFAwNiQCgh4fiiDQA2fV0VJDwQBUKug+R2AILLAsjVXEx7Ec2tTK1iESflWi
         GYEg==
X-Gm-Message-State: AOJu0YyuZNXUyA3hFE2TlCIl/md2/ELKOcLS7SeUQI6zurW0Zfo+MHL6
	v4uOqdsy1X6mhUzkC/jT6EgOH8boHbpc5VZwlOO8ELPz4kd/vtk0OZXxL/3kfH4=
X-Gm-Gg: ASbGncvN+KX3jruqtQ2uEbg6hxEldcZojAW6ZW+NXBvSvdH4wq7D7jwhNSmapiqAvyJ
	MVtBoNuF23Er7T7BdL0XcYNnWDjmvSBQLvNYrjRq5VIAEafjG45NsJkYJ7Fvt0u/PJlNFIG63lI
	TSJeCgCkY1KW7D0EzqJP8xa8vymzcdURsQ6XJVEgIRPlq+i3lGyakB3Or+mwmDm5KUPaPxhR6HG
	fqzfOMLYjPHw2AaZwTffiX8ONyYQRvHeeey6dPyOLq/rNT1yTfpoUSzSlmY1w13D846XXXw3Qn6
	wg1UJLK1kSQkd4YeIxsOGPkSxGcXpJGbOEv+wNk0TeB21EqtNWeXrzhiIpEmlDN8tmhC2eTfTxr
	gsTkgUZYC+CPPEqoqPnYS3eE=
X-Google-Smtp-Source: AGHT+IEZ0TpKaljlTc0VwYKHGwhfQ8N9tuGicg3cmH+p+sFuBIGn+wLBiXXHQWBPhhiDsY/Q5YhxWg==
X-Received: by 2002:a05:6214:21c6:b0:6e8:9086:261 with SMTP id 6a1803df08f44-6f4c94a6feamr9081566d6.3.1745517161167;
        Thu, 24 Apr 2025 10:52:41 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0aaf5e9sm11818086d6.99.2025.04.24.10.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:52:40 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:52:39 -0400
From: Gregory Price <gourry@gourry.net>
To: Suma Hegde <suma.hegde@amd.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Check for hsmp ACPI device
Message-ID: <aAp6Z2DLJdqcLoYE@gourry-fedora-PF4VCD3F>
References: <20250424062544.4122901-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424062544.4122901-1-suma.hegde@amd.com>

On Thu, Apr 24, 2025 at 06:25:44AM +0000, Suma Hegde wrote:
> If the hsmp ACPI device entry exists, allow the hsmp_acpi driver to manage
> the hsmp and return error from plat.c.
> 
> amd_hsmp and hsmp_acpi are intended to be mutually exclusive drivers and
> this check for availability of hsmp ACPI device is necessary to ensure
> this.
> 
> Also, support both platform device-based and ACPI-based probing for
> family 0x1A models 0x00 to 0x0F, implement only ACPI-based probing
> for family 0x1A, models 0x10 to 0x1F. Return false from
> legacy_hsmp_support() for this platform.
> This aligns with the condition check in is_f1a_m0h().
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> This patch should be rebased on below patch by Gregory Price.
> https://lore.kernel.org/platform-driver-x86/60715d85-48b4-4066-8a9a-c8d2b62ebb45@redhat.com/T/#t

Just roll my patch into this and add

Link: https://lore.kernel.org/platform-driver-x86/aALZxvHWmphNL1wa@gourry-fedora-PF4VCD3F/
Fixes: 7d3135d163 ("platform/x86/amd/hsmp: Create separate ACPI, plat and common drivers")
Co-developed-by: Gregory Price <gourry@gourry.net>
Signed-off-by: Gregory Price <gourry@gourry.net>

should make the pick up easier, and they both deal with the same patch.



> 
>  drivers/platform/x86/amd/hsmp/acpi.c | 1 -
>  drivers/platform/x86/amd/hsmp/hsmp.h | 1 +
>  drivers/platform/x86/amd/hsmp/plat.c | 6 +++++-
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 088cb2416d7e..eaae044e4f82 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -29,7 +29,6 @@
>  
>  #define DRIVER_NAME		"hsmp_acpi"
>  #define DRIVER_VERSION		"2.3"
> -#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
>  
>  /* These are the strings specified in ACPI table */
>  #define MSG_IDOFF_STR		"MsgIdOffset"
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index af8b21f821d6..d58d4f0c20d5 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -23,6 +23,7 @@
>  
>  #define HSMP_CDEV_NAME		"hsmp_cdev"
>  #define HSMP_DEVNODE_NAME	"hsmp"
> +#define ACPI_HSMP_DEVICE_HID    "AMDI0097"
>  
>  struct hsmp_mbaddr_info {
>  	u32 base_addr;
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index b9782a078dbd..81931e808bbc 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -11,6 +11,7 @@
>  
>  #include <asm/amd_hsmp.h>
>  
> +#include <linux/acpi.h>
>  #include <linux/build_bug.h>
>  #include <linux/device.h>
>  #include <linux/module.h>
> @@ -266,7 +267,7 @@ static bool legacy_hsmp_support(void)
>  		}
>  	case 0x1A:
>  		switch (boot_cpu_data.x86_model) {
> -		case 0x00 ... 0x1F:
> +		case 0x00 ... 0x0F:
>  			return true;
>  		default:
>  			return false;
> @@ -288,6 +289,9 @@ static int __init hsmp_plt_init(void)
>  		return ret;
>  	}
>  
> +	if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1))
> +		return -ENODEV;
> +
>  	hsmp_pdev = get_hsmp_pdev();
>  	if (!hsmp_pdev)
>  		return -ENOMEM;
> -- 
> 2.25.1
> 
