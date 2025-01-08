Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A358820B20;
	Wed,  8 Jan 2025 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342180; cv=none; b=opLyc/od+MNa1QJ+VVMzGUU3R7cz15d8k1vtVe5aKwmxENMcWUfZCe3t3qrQdIhq0rRkQOYUG6FG5gwsb9A4xjEh5eNeiuLAjBiubsDUoA8Jss0d/UmTSpwCW49hK3KS6+VhTtSXUNO832PxzWvAYGpyUeyYd3hRg4VXCU0FPjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342180; c=relaxed/simple;
	bh=LUqOu6iBzj0I40lX9CFdQdJuVMOQT5vqT0qBbymppRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0An79242CgETwe8n6Xyh8XQQbMYE+guU1cIOtKvcTnE4SyeiUsp2atcm9V2SK1HjbF21CW+4090Sr46hAcQrbVOfH8GMb7oj62BZhBMOc787CQaB6+EPD3YlNrRxXPqR5ZsoWrRehb8wPI3qz1HIEhhIom/JFzw3+aKHYQNyD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvKHbYXq; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvKHbYXq"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4afdfefc6c1so5274862137.0;
        Wed, 08 Jan 2025 05:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736342177; x=1736946977; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xwckemNl+A5g0eLo8U4acqFVsrzBBxkD3lWvVkDuanI=;
        b=IvKHbYXqiMneM92AEMbe+IYozMwc52KPFS3VoQECdUf3aug8RrSHSrXGuOM5r1rO8K
         +iCww+SyEeklywAafDEWZs4Fx7kuYWUh1u9ACafyFJ0m/niddbuUC6QxpZt95fbHlAk3
         Q/oacfUww0bZhy/UWCLrikT1C+e5bThnGJXxnn66HIxl5jiqD5V8BGXWRRhPVwqAdo/q
         aaAXvUAeiARaHJgCLk7EkuPH42J4xuJjolxPOTEjnyQqHYw2cqOiaH0MqnJmEA9IKzp3
         yl2JVauDh3BSp3KhBqiTym28mX8OQjGxsFHhl4yLwjTUzpLgO7bjJB4Q+SOL3hwyZXHO
         jnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736342177; x=1736946977;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwckemNl+A5g0eLo8U4acqFVsrzBBxkD3lWvVkDuanI=;
        b=aAtC+RHF2j+624yk+jaZQ/ePfD5rm4/kOBzfax4VPxmsitEFVodffcstNVr5pf4aSi
         Yf6bKFXVIOoWjZsc6x0SwmP/R21N7TW1i9In5XQqxrC4v82d14vbAUDCGnTqX75BMxsp
         hgr2u17XQ26iU3buMxgwxgBEb13I5xOMJ2OLTB7LsSOFLdVDbVS9MOa5BeVzwvsVFlvQ
         DdBhzBEdJKNFvnk+SzMxbNRIc7hWRGtSCgI4oRLrMCZJkrkKq63XicjjDWlcXrC7XfV/
         94PMTC7yNwl6AgFfQuA6sA1i0LMcDlceubEC6B6zl9v3p+dEjlZ7Sr6irhFui4V/1vQv
         pD4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkrJ6m0I4V10uaw07HFO7jk259pNZlPv6mYr92lVErNXrrBqUptCdntH96kzRLzJAzG5sPGYHVVvzphx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOEUYNmDQzmw1mjb5u6ek0jkA/8uVv9ppouVIGwsSWA4yeNOPC
	fXSVn8W+1591bnGFGJYpFQYx9MJlmFGe0fXvoRh/OGD0JZS+NDax
X-Gm-Gg: ASbGncuCu3FeGZhSXZmNWthbiZaAi0FbcjBTNQdkKHFRJG5YeuS4hTtsTzp5FTURnuu
	MObYUlCMH2zhp4TRUpdV4FGsMkroLL/d0jzhxe9CCu8TWND7d1P49py+pU7ikQJ0/G5yxBm/zFl
	hlsZAVayWys1zDfn0JeULiY+7OcZUv4LssCIEP+GfoAOIJAhQ4/hpKxaUTYb9sE7qgC8hSLeWFh
	tURHbXwIuOL1/YWs/q9ExCds7XtomAZ68grqVFCA217ivdfPonIJQ==
X-Google-Smtp-Source: AGHT+IH2i/8TpA1nlNDGa4UO8XUScR0k7rcU0RUGo9YHZIEwUTwcngH9A9gc1cDyKURKHxkJr6SJDA==
X-Received: by 2002:a05:6102:148f:b0:4b2:4877:30bd with SMTP id ada2fe7eead31-4b3d0f979dcmr1895005137.12.1736342177471;
        Wed, 08 Jan 2025 05:16:17 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfa8d62fsm8673949137.22.2025.01.08.05.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:16:16 -0800 (PST)
Date: Wed, 8 Jan 2025 08:16:13 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Armin Wolf <w_armin@gmx.de>, 
	mario.limonciello@amd.com, Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 06/20] platform/x86: alienware_wmi: General cleanup of
 WMAX methods
Message-ID: <c7fae6w6yickufg5x7xjxbybwasm3u6imgmfyf657ouxfuuzw3@hq2shidsqaqz>
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <20250105153019.19206-8-kuurtb@gmail.com>
 <faa1620e-8626-4963-2503-847a620a6509@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <faa1620e-8626-4963-2503-847a620a6509@linux.intel.com>

On Wed, Jan 08, 2025 at 02:10:56PM +0200, Ilpo Järvinen wrote:
> On Sun, 5 Jan 2025, Kurt Borja wrote:
> 
> > Reorder variable declaration from longest to shortest. Standarize
> > show/store method names of WMAX's sysfs groups.
> > 
> > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >  drivers/platform/x86/dell/alienware-wmi.c | 67 +++++++++++------------
> >  1 file changed, 32 insertions(+), 35 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index 418abf46b593..190fee7539bf 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > @@ -725,14 +725,14 @@ static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
> >   *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
> >   *	It can toggle between standard system GPU output and HDMI input.
> >   */
> > -static ssize_t show_hdmi_cable(struct device *dev,
> > -			       struct device_attribute *attr, char *buf)
> > +static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
> > +			  char *buf)
> >  {
> > -	acpi_status status;
> > -	u32 out_data;
> >  	struct wmax_basic_args in_args = {
> >  		.arg = 0,
> >  	};
> > +	acpi_status status;
> > +	u32 out_data;
> 
> Hi Kurt,
> 
> I took patches 1-6 into review-ilpo-next as they seemed very obvious and 
> had multiple rev-bys by now.

Hi Ilpo,

Thank you very much!

> 
> Please note that I edited this patch to add the new lines after function 
> variable declarations in a few functions where they were missing.

I'll check it out, thanks.

~ Kurt

> 
> --
>  i.
> 
> >  	status =
> >  	    alienware_wmax_command(&in_args, sizeof(in_args),
> >  				   WMAX_METHOD_HDMI_CABLE, &out_data);
> > @@ -746,14 +746,14 @@ static ssize_t show_hdmi_cable(struct device *dev,
> >  	return sysfs_emit(buf, "unconnected connected [unknown]\n");
> >  }
> >  
> > -static ssize_t show_hdmi_source(struct device *dev,
> > -				struct device_attribute *attr, char *buf)
> > +static ssize_t source_show(struct device *dev, struct device_attribute *attr,
> > +			   char *buf)
> >  {
> > -	acpi_status status;
> > -	u32 out_data;
> >  	struct wmax_basic_args in_args = {
> >  		.arg = 0,
> >  	};
> > +	acpi_status status;
> > +	u32 out_data;
> >  	status =
> >  	    alienware_wmax_command(&in_args, sizeof(in_args),
> >  				   WMAX_METHOD_HDMI_STATUS, &out_data);
> > @@ -768,12 +768,11 @@ static ssize_t show_hdmi_source(struct device *dev,
> >  	return sysfs_emit(buf, "input gpu [unknown]\n");
> >  }
> >  
> > -static ssize_t toggle_hdmi_source(struct device *dev,
> > -				  struct device_attribute *attr,
> > -				  const char *buf, size_t count)
> > +static ssize_t source_store(struct device *dev, struct device_attribute *attr,
> > +			    const char *buf, size_t count)
> >  {
> > -	acpi_status status;
> >  	struct wmax_basic_args args;
> > +	acpi_status status;
> >  	if (strcmp(buf, "gpu\n") == 0)
> >  		args.arg = 1;
> >  	else if (strcmp(buf, "input\n") == 0)
> > @@ -791,9 +790,8 @@ static ssize_t toggle_hdmi_source(struct device *dev,
> >  	return count;
> >  }
> >  
> > -static DEVICE_ATTR(cable, S_IRUGO, show_hdmi_cable, NULL);
> > -static DEVICE_ATTR(source, S_IRUGO | S_IWUSR, show_hdmi_source,
> > -		   toggle_hdmi_source);
> > +static DEVICE_ATTR_RO(cable);
> > +static DEVICE_ATTR_RW(source);
> >  
> >  static bool hdmi_group_visible(struct kobject *kobj)
> >  {
> > @@ -818,14 +816,14 @@ static const struct attribute_group hdmi_attribute_group = {
> >   * - Currently supports reading cable status
> >   * - Leaving expansion room to possibly support dock/undock events later
> >   */
> > -static ssize_t show_amplifier_status(struct device *dev,
> > -				     struct device_attribute *attr, char *buf)
> > +static ssize_t status_show(struct device *dev, struct device_attribute *attr,
> > +			   char *buf)
> >  {
> > -	acpi_status status;
> > -	u32 out_data;
> >  	struct wmax_basic_args in_args = {
> >  		.arg = 0,
> >  	};
> > +	acpi_status status;
> > +	u32 out_data;
> >  	status =
> >  	    alienware_wmax_command(&in_args, sizeof(in_args),
> >  				   WMAX_METHOD_AMPLIFIER_CABLE, &out_data);
> > @@ -839,7 +837,7 @@ static ssize_t show_amplifier_status(struct device *dev,
> >  	return sysfs_emit(buf, "unconnected connected [unknown]\n");
> >  }
> >  
> > -static DEVICE_ATTR(status, S_IRUGO, show_amplifier_status, NULL);
> > +static DEVICE_ATTR_RO(status);
> >  
> >  static bool amplifier_group_visible(struct kobject *kobj)
> >  {
> > @@ -862,14 +860,14 @@ static const struct attribute_group amplifier_attribute_group = {
> >   * Deep Sleep Control support
> >   * - Modifies BIOS setting for deep sleep control allowing extra wakeup events
> >   */
> > -static ssize_t show_deepsleep_status(struct device *dev,
> > -				     struct device_attribute *attr, char *buf)
> > +static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
> > +			      char *buf)
> >  {
> > -	acpi_status status;
> > -	u32 out_data;
> >  	struct wmax_basic_args in_args = {
> >  		.arg = 0,
> >  	};
> > +	acpi_status status;
> > +	u32 out_data;
> >  	status = alienware_wmax_command(&in_args, sizeof(in_args),
> >  					WMAX_METHOD_DEEP_SLEEP_STATUS, &out_data);
> >  	if (ACPI_SUCCESS(status)) {
> > @@ -884,12 +882,11 @@ static ssize_t show_deepsleep_status(struct device *dev,
> >  	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
> >  }
> >  
> > -static ssize_t toggle_deepsleep(struct device *dev,
> > -				struct device_attribute *attr,
> > -				const char *buf, size_t count)
> > +static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
> > +			       const char *buf, size_t count)
> >  {
> > -	acpi_status status;
> >  	struct wmax_basic_args args;
> > +	acpi_status status;
> >  
> >  	if (strcmp(buf, "disabled\n") == 0)
> >  		args.arg = 0;
> > @@ -908,7 +905,7 @@ static ssize_t toggle_deepsleep(struct device *dev,
> >  	return count;
> >  }
> >  
> > -static DEVICE_ATTR(deepsleep, S_IRUGO | S_IWUSR, show_deepsleep_status, toggle_deepsleep);
> > +static DEVICE_ATTR_RW(deepsleep);
> >  
> >  static bool deepsleep_group_visible(struct kobject *kobj)
> >  {
> > @@ -956,13 +953,13 @@ static bool is_wmax_thermal_code(u32 code)
> >  
> >  static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
> >  {
> > -	acpi_status status;
> >  	struct wmax_u32_args in_args = {
> >  		.operation = operation,
> >  		.arg1 = arg,
> >  		.arg2 = 0,
> >  		.arg3 = 0,
> >  	};
> > +	acpi_status status;
> >  
> >  	status = alienware_wmax_command(&in_args, sizeof(in_args),
> >  					WMAX_METHOD_THERMAL_INFORMATION,
> > @@ -979,13 +976,13 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
> >  
> >  static int wmax_thermal_control(u8 profile)
> >  {
> > -	acpi_status status;
> >  	struct wmax_u32_args in_args = {
> >  		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
> >  		.arg1 = profile,
> >  		.arg2 = 0,
> >  		.arg3 = 0,
> >  	};
> > +	acpi_status status;
> >  	u32 out_data;
> >  
> >  	status = alienware_wmax_command(&in_args, sizeof(in_args),
> > @@ -1003,13 +1000,13 @@ static int wmax_thermal_control(u8 profile)
> >  
> >  static int wmax_game_shift_status(u8 operation, u32 *out_data)
> >  {
> > -	acpi_status status;
> >  	struct wmax_u32_args in_args = {
> >  		.operation = operation,
> >  		.arg1 = 0,
> >  		.arg2 = 0,
> >  		.arg3 = 0,
> >  	};
> > +	acpi_status status;
> >  
> >  	status = alienware_wmax_command(&in_args, sizeof(in_args),
> >  					WMAX_METHOD_GAME_SHIFT_STATUS,
> > @@ -1078,11 +1075,11 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
> >  
> >  static int create_thermal_profile(struct platform_device *platform_device)
> >  {
> > -	u32 out_data;
> > +	enum platform_profile_option profile;
> > +	enum wmax_thermal_mode mode;
> >  	u8 sys_desc[4];
> >  	u32 first_mode;
> > -	enum wmax_thermal_mode mode;
> > -	enum platform_profile_option profile;
> > +	u32 out_data;
> >  	int ret;
> >  
> >  	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
> > 
> 
> -- 
>  i.
> 
