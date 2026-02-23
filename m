Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571E237F8DC
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 23:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771890078; cv=none; b=ex4z6jnGR6SIFoY5xPZQZaw+d8CHMBv+HOZXw2NN+bzTjOVRKBpTw37Lzwvo6VYJRo1BZJXsLEDJ4v2gtoPxzNGDZuIZ2vBw79wPuhnSRuN8+d1d9UiBnAoVy0i3JPQ0kO2OE6MQhMB7aoweR3aAgC2ZI/OarqAheC8ofgFfTHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771890078; c=relaxed/simple;
	bh=5dyQAM6IPulAUhrvclETJjiYmTwjjWw3Y1o1DldlJaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpy7e+bUY41xvdNm/b0UjM9WPmkUIiBqcayCI64lgCuvsBxG519i7Z2JaQ3beVGg4g570VT78MqTfiCIcSRKqwpfWzhPOaa8rDcwUhO4jI9+pGNqUWN1cIeShWSVC70K73Xv/Gvud3Xiq/CIZBAoaDj17h9D62GKOQcskOjAVqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUTxeLLn; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUTxeLLn"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65a2fea1a1eso9418453a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 15:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771890074; x=1772494874; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ajc9uru2ZAYEp7H15z+ZpBl2mnUqL3fUnLNpXdHs2Xc=;
        b=FUTxeLLnA5bTMY2nnhqNG53tFYie+ooiOUPem+mifxV3fy58AhgjZONzGJQPjJgH8z
         2cLZpoPpUND9xeIHNgDfrlsT2ukx1yR91E83Sv6ITJdr1ImBXGht7P+iKlEvoIWgRcST
         KIE71T3h8YAqvNcxRfgcMB+wypKIwR3JAaEtBWRLNUnFbfzj/vp9u+JFA49n44s6k5AJ
         vhv6iAwvAzMVS3uyqHY7AwrUOhtAVvydXRz0Vlv7k1CYTycaubSwuBAIxsB2/TzYLQFH
         nOOorDb3fqY77Y5ONVhHBKP14DGWBwinVdYJewthyzsdCNbsgVIksZKg5D67nLS+WYvS
         Z7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771890074; x=1772494874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ajc9uru2ZAYEp7H15z+ZpBl2mnUqL3fUnLNpXdHs2Xc=;
        b=bZjb2TroSmyRSVRWqc14mTsftQCbfwjvREOQsNCQhXpKZv3Ni+Vgrd0UmMrWPhvuqd
         GOyULUmkR46tUAC8/SkDyYmVa0z5XQ7CTckFRbjzOxs+PyXTKF3Z0bTQ3fsGHq9tSUjL
         YPnnweVmMSgJYv9yjloVq4BObcmY0FefUCWzDXGqWbCzdFuHX5boEwGZog4OFu1/udAw
         JkcPYFWoKm/ZigU0z3sNaMrKLInM+yqKL8hprgVCvIh26Xx5jJA/sLGa1lgw2/y7cihV
         4EM7CTb/r7Dut/73laq6lBBkNca4fPG2rRqccvnEw0ujQtnNIT8MZb8dJI2cCzl2FjLi
         8/Vg==
X-Gm-Message-State: AOJu0YziX3LzN9plclXwkYky7NG4juKbP/95ykQOeGTAJXiXnIC+0JGJ
	t7R1BZJz/+B5SniQvkETd8+7kt5JFSp0J7SEYVIdUMP/QKuQsRDPu6+i
X-Gm-Gg: AZuq6aK/l+wfr2kv9f1V9pAXKadvUrm2mbS1pg195vUqwX2M/aS7Pj0K45ntAsRVygD
	vbS0ewcvQOhJSm+u25RbEyrX2hXOqnN10oHa/qqesknCaYkRo42zZv9PG2CdnUn2gwlGoX0U8s3
	ls6Af7lj7uy8GrrRksvOpn5eiglRjGiCN1Lyr15gR3SuiTPKaGF3N7bNvBQ7hSegJBTPaqInm/T
	j/jaJUDRteCr+v9W/xh6wklgTxL0B4oJVTPEdDyKYOxOUGtw05SG1sv5AAzT3G7nYtMEiaoaKT3
	nSlCxCJAn4QmAPiExpnf4D1is9Vxg1Ds9vk8PB2tGjalcVLiaG2nUZ4hRbtgzgP8g6PsZhOezkm
	HU0J+uUrgCqfqV2x3xZMoPLQEIUMtQHXXrqO0QQjyAZwFLZckUmclT64UMC23aH1zxhd/FZK30K
	UvmCl0itKcppCMDQ==
X-Received: by 2002:a17:907:7ba0:b0:b84:3fab:4251 with SMTP id a640c23a62f3a-b9081089408mr696042166b.15.1771890073435;
        Mon, 23 Feb 2026 15:41:13 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e8cb3fsm380362766b.48.2026.02.23.15.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 15:41:12 -0800 (PST)
Date: Tue, 24 Feb 2026 01:41:12 +0200
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] platform: x86-android-tablets: lenovo: Add Yoga
 Book haptics entries
Message-ID: <aZzlQWTkm0RaPaXV@jekhomev>
References: <20260217233618.1324550-1-jekhor@gmail.com>
 <20260217233618.1324550-2-jekhor@gmail.com>
 <181e4409-7bbf-e207-0c54-1f817c1c35ed@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <181e4409-7bbf-e207-0c54-1f817c1c35ed@linux.intel.com>

On Mon, Feb 23, 2026 at 04:26:25PM +0200, Ilpo Järvinen wrote:
> On Wed, 18 Feb 2026, Yauhen Kharuzhy wrote:
> 
> > Add drv2604l i2c_board_info for drv2604l haptics drivers present in
> > Lenovo Yoga Book YB1-X90 and YB1-X91. Set properties required for device
> > initialization and self-calibration.
> > 
> > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> > ---
> >  .../platform/x86/x86-android-tablets/lenovo.c | 96 +++++++++++++++++++
> >  1 file changed, 96 insertions(+)
> > 
> >  
> > +#define YB1_X91_DRV2604L_0_DEVICE "i2c-DRV2604:00"
> > +#define YB1_X91_DRV2604L_1_DEVICE "i2c-DRV2604:01"
> > +
> > +static int __init lenovo_yb1_x91_init(struct device *dev)
> > +{
> > +	struct device *drv2604l_0_dev = NULL, *drv2604l_1_dev = NULL;
> > +	int ret = 0;
> > +
> > +	drv2604l_0_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
> > +						 YB1_X91_DRV2604L_0_DEVICE);
> > +	if (!drv2604l_0_dev) {
> > +		pr_err("error: cannot find %s device\n",
> > +		       YB1_X91_DRV2604L_0_DEVICE);
> > +		return -ENODEV;
> > +	}
> > +
> > +	ret = device_create_managed_software_node(drv2604l_0_dev,
> > +					lenovo_yb1_x9x_drv2604l_0_props, NULL);
> > +	if (ret) {
> > +		pr_err("error: cannot create software node for %s: %d\n",
> > +		       YB1_X91_DRV2604L_0_DEVICE, ret);
> > +		goto put_drv2604l_0;
> > +	}
> > +
> > +	drv2604l_1_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
> > +						 YB1_X91_DRV2604L_1_DEVICE);
> > +	if (!drv2604l_1_dev) {
> > +		pr_err("error: cannot find %s device\n",
> > +		       YB1_X91_DRV2604L_1_DEVICE);
> > +		ret = -ENODEV;
> > +		goto put_drv2604l_0;
> > +	}
> > +
> > +	ret = device_create_managed_software_node(drv2604l_1_dev,
> > +					lenovo_yb1_x9x_drv2604l_1_props, NULL);
> > +	if (ret) {
> > +		pr_err("error: cannot create software node for %s\n",
> > +		       YB1_X91_DRV2604L_1_DEVICE);
> > +		ret = -EINVAL;
> > +		goto put_drv2604l_1;
> > +	}
> > +
> > +put_drv2604l_0:
> > +	put_device(drv2604l_0_dev);
> > +put_drv2604l_1:
> > +	put_device(drv2604l_1_dev);
> 
> This looks like a case that would benefit from using cleanup.h 
> (__free(put_device)).
> 
> Remember to declare variables that use __free() mid-function as per the 
> usage pattern in documented cleanup.h.
> 
> Please also make sure you have all necessary includes for using it (not 
> through some obscure indirect include path).

A good point, thanks!

-- 
Yauhen Kharuzhy
