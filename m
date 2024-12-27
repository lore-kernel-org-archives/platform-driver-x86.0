Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28955442F;
	Fri, 27 Dec 2024 04:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735273982; cv=none; b=mMzelTozgOU6hZd8qAVvsmjwEzhq9lQ76p6HqUYZf170rqzSuOPdOAuP4fLII91zP6i4YK9Ozvj8z79wcgntVHUV1yuDJgesorhlMMUfemXphWoafKjSQLY8vtRfmLyRGOgGYGBu9mZO2WG3aZlz34QMBr/9ZYeuJXcOKY04rgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735273982; c=relaxed/simple;
	bh=rXl4JXN0iLuxc5ekxS906fOdaqkeQsbe6Je0OY8Z72g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=He04nv+4yjcgS5T8tb5j+LewaYVgfSVpOH4eREtThAC2jpaWbYSMAWM1NfMq5M1y6doZs5VLGc7JMJfswkW1/UGUoY0GdVyI/mG4B28HBR9CfW7bJCSSfeKflT3UMXU1UCO4TQkvd7W6l/8mClUFtBt/HQFIRWR0xrnrr1vYYQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1YYsoVy; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1YYsoVy"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e53a91756e5so6074570276.1;
        Thu, 26 Dec 2024 20:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735273980; x=1735878780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=38kajZbQ9TjFG1vBM28iX5OVVym8n6nHsxANc6zMamA=;
        b=j1YYsoVy2I6PRhJqQAPTqS/1dNVsLwn+vu0SBtDhOqaPzTI8AVBriW3G7R1Fd9Vfiz
         STxLyYDyQLS/MTb4PvaW+KxaIgM804xFZTMDdnuFhabg5X/IzsyR8J+Igg29wHC4Af/N
         m45l5zJFy2uOXKCUs/kyxWGXs4jmgJfhqOO6T5KTIWDdPM7z+5yS7osXsScysTrxzxsb
         jo+y6kuN/cz1K+yujulAMpR+x4w4evaOlkZ8XQMpWPEng1J5dNxrue81+rrNcTtDfNx7
         fPtQU3v1ujGEJkW3AnBoyiftZZsLA0n0TuegMFkedZ8ejPwzUZPkVrUWzJG3hRWKRFMx
         14cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735273980; x=1735878780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38kajZbQ9TjFG1vBM28iX5OVVym8n6nHsxANc6zMamA=;
        b=WQ6haSHl31jmNSH/lLMDXLsVZFnDFnmjPP+gJjfGiT8LHMsOGi674bg9JnOHOqAmsa
         jtd7WCxTOUGnbzRrwPOA4APVbhZG8qeYxoR/rn8MHsvVh/X2ILVLhCyzC++sc07vEqJ0
         bvYQZh3cK3P11Bi4aInIaSA1QCg/FnOjeMMkDq1CBh5O7GzI4ZOokyNu+U4kdbhZVJoY
         pjO2Fieh6yJeu7V6ddxnKItmdUt+UOdiVzjY47UWAeom9a7Pbi7fNMovwerkObhFUX8D
         VreP/h+9OkOkzKHl1HhBAzxMv1EI/Zm8ll3JUtHSPSbd2DyKRIatEXhxnAZRjwRYFufR
         7bAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8INtWj/kyDq8JKGTYgiEjy2hWVsxs4Emd/dTXoLT3LVFc/JgR43mQRfKciUHLet6K4qiqWyc3qhFOYvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdOd0Rh//5WagJAJPXBIScwr0BZbZl5rHuFfLqpq+W+rSfHejT
	30qCA6bTVIG5L4DLPfMBPQVuZqoto38LN2xmI0cDMrYw5917KVG/
X-Gm-Gg: ASbGncsSJEpbk5Gv5VYUGX7n/+t0l12C87ud8BWU4uJXEIHO/mzT9jK/ppgCqp3T5Or
	2MvaUleYpfnu/UoAz9bZTPoeA5UrC6pGiTkQt3njuuqR8nCtbmTCAqEYFraM/8OFAyolrwnUoAO
	nmIsksd8+u8jPr2qgXguSXe5PMY3afDKcLNCfSzfnSwKhQzrXWmI6Wzi4JPO0PgCLuLG1Ht2EF2
	pfWq3gibDHuoSCz+SWnVOFoGG09ENJoJ0aYdTX3f3Y2iaw0ziXNhg==
X-Google-Smtp-Source: AGHT+IEjtuMiDVb5jFP8XOSbOn6PjWGHP922gRop5q3vboq/TOCmtzwb3Q58OU4I7SCPIFRVuuijGg==
X-Received: by 2002:a05:690c:4b8d:b0:6ef:7f34:fe08 with SMTP id 00721157ae682-6f3f812730amr178539927b3.18.1735273979868;
        Thu, 26 Dec 2024 20:32:59 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e743ff00sm40627137b3.32.2024.12.26.20.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 20:32:59 -0800 (PST)
Date: Thu, 26 Dec 2024 23:32:55 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	mario.limonciello@amd.com, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	Dell.Client.Kernel@dell.com
Subject: Re: [PATCH 02/20] alienware-wmi: Move Lighting Control State
Message-ID: <uwpyurbkr2s3r337bxe5zzisuciyaw7ergdmd66qyjhoaoxtuq@3e2ug5cc2fvh>
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-3-kuurtb@gmail.com>
 <9083aed4-5f07-4d1a-8325-67da102b6871@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9083aed4-5f07-4d1a-8325-67da102b6871@gmx.de>

On Fri, Dec 27, 2024 at 01:35:03AM +0100, Armin Wolf wrote:
> Am 21.12.24 um 06:58 schrieb Kurt Borja:
> 
> > Place Lighting Control State logic next to other attributes of the same
> > sysfs group.
> > 
> > While at it, rename:
> > 
> > store_control_state()	-> lighting_control_state_store()
> > show_control_state()	-> lighting_control_state_show()
> > 
> > Replace DEVICE_ATTR_RW() with DEVICE_ATTR() and do a general style
> > cleanup.
> 
> I think you mixed-up DEVICE_ATTR_RW() and DEVICE_ATTR() here.
> Other than that:

Fixed in v2!

> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> 
> > 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/alienware-wmi.c | 74 ++++++++++++-----------
> >   1 file changed, 39 insertions(+), 35 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index ed66720260ab..c5ad0f95c442 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > @@ -545,6 +545,45 @@ static ssize_t zone_set(struct device *dev, struct device_attribute *attr,
> >   	return ret ? ret : count;
> >   }
> > 
> > +/*
> > + * Lighting control state device attribute (Global)
> > + */
> > +static ssize_t lighting_control_state_show(struct device *dev,
> > +					   struct device_attribute *attr,
> > +					   char *buf)
> > +{
> > +	if (lighting_control_state == LEGACY_BOOTING)
> > +		return sysfs_emit(buf, "[booting] running suspend\n");
> > +	else if (lighting_control_state == LEGACY_SUSPEND)
> > +		return sysfs_emit(buf, "booting running [suspend]\n");
> > +
> > +	return sysfs_emit(buf, "booting [running] suspend\n");
> > +}
> > +
> > +static ssize_t lighting_control_state_store(struct device *dev,
> > +					    struct device_attribute *attr,
> > +					    const char *buf, size_t count)
> > +{
> > +	u8 val;
> > +
> > +	if (strcmp(buf, "booting\n") == 0)
> > +		val = LEGACY_BOOTING;
> > +	else if (strcmp(buf, "suspend\n") == 0)
> > +		val = LEGACY_SUSPEND;
> > +	else if (interface == LEGACY)
> > +		val = LEGACY_RUNNING;
> > +	else
> > +		val = WMAX_RUNNING;
> > +
> > +	lighting_control_state = val;
> > +	pr_debug("alienware-wmi: updated control state to %d\n",
> > +		 lighting_control_state);
> > +
> > +	return count;
> > +}
> > +
> > +static DEVICE_ATTR_RW(lighting_control_state);
> > +
> >   /*
> >    * LED Brightness (Global)
> >    */
> > @@ -589,41 +628,6 @@ static struct led_classdev global_led = {
> >   	.name = "alienware::global_brightness",
> >   };
> > 
> > -/*
> > - * Lighting control state device attribute (Global)
> > - */
> > -static ssize_t show_control_state(struct device *dev,
> > -				  struct device_attribute *attr, char *buf)
> > -{
> > -	if (lighting_control_state == LEGACY_BOOTING)
> > -		return sysfs_emit(buf, "[booting] running suspend\n");
> > -	else if (lighting_control_state == LEGACY_SUSPEND)
> > -		return sysfs_emit(buf, "booting running [suspend]\n");
> > -	return sysfs_emit(buf, "booting [running] suspend\n");
> > -}
> > -
> > -static ssize_t store_control_state(struct device *dev,
> > -				   struct device_attribute *attr,
> > -				   const char *buf, size_t count)
> > -{
> > -	long unsigned int val;
> > -	if (strcmp(buf, "booting\n") == 0)
> > -		val = LEGACY_BOOTING;
> > -	else if (strcmp(buf, "suspend\n") == 0)
> > -		val = LEGACY_SUSPEND;
> > -	else if (interface == LEGACY)
> > -		val = LEGACY_RUNNING;
> > -	else
> > -		val = WMAX_RUNNING;
> > -	lighting_control_state = val;
> > -	pr_debug("alienware-wmi: updated control state to %d\n",
> > -		 lighting_control_state);
> > -	return count;
> > -}
> > -
> > -static DEVICE_ATTR(lighting_control_state, 0644, show_control_state,
> > -		   store_control_state);
> > -
> >   static int alienware_zone_init(struct platform_device *dev)
> >   {
> >   	u8 zone;
