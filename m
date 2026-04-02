Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6C42E2665
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775162621; cv=none; b=mOlVtssX8AEc2e8W8d5oHAZHBIea259sKZ6YW/C6lZxErpqxMDMA+Qa/88pbeyUqdMO9/LT0OQlZyqkNOv7NypRouS3CnJnfDOMZVVFuHiATZZKC600YfofmhdkrS/CQlhvAt7SXsmgwGE6pG+lJ6FxFfRe2UodtrtLW5Ycpn1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775162621; c=relaxed/simple;
	bh=PfOSvF+9Q9GvIApbJuER9HJI0ph9y/C4dHyB4wNs/UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwIimsbpm3Zbydm7jNkn9QKeMVsWNCd0eS7z4zvNC+PIPw8jqGBcm5GHU/qZwQ+TK4mdDSDL10DPT3iKZyO+ACEgkyf2UN1aG8l/3jWPmiDnX77V4vNY6oBUVF+blS1eqLR3Pt6nAp7UWtjKFw0K5OdFJOhd2H4oMIB3MmHMhoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXiyjDE2; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXiyjDE2"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so2911699eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2026 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775162620; x=1775767420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=21ClTGnhigH6pmJ1bdxGPTsm+cYy8Gt+rk4//h1qZck=;
        b=gXiyjDE23EjXZrk7uxkNcBB90uOw5CiHfWwnqND5xV+ZfXYwOvoki959Actdm7YRIG
         JkGCDOyqQ4vgCIsZBFfYtt8JrzFCwl+C+wz0hhnpA8CCzJqeiTmleEFdz2i3jtapa9EE
         L2fhOyB4vIj3CAC8YmbQsUvNwPsjDv9mvPjffXHOFlcaBRowboyMcjG2PfT1JIWglBUH
         aWEMWu5IkK/vHJ2VO+loA+2NQBrbvt6q5BmEztS5StTut1G7l7l4Osv3+/5SeEd4Ueb8
         /pxhVKKvn/o4XmluN2Ii16rlCd7rTdcfToOBaTXYsXqFlmMntxbJL/xdCIhKmvzC+YSl
         AB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775162620; x=1775767420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21ClTGnhigH6pmJ1bdxGPTsm+cYy8Gt+rk4//h1qZck=;
        b=GK9DsHt5f18z8KQdrSs+HSyuD4bdxtUvhPxr0zmR2Jj93wDiw4rVs7uxW1em7Csn7O
         C0A9Akh3eEP53RsyI6Wlzytw6v0N8gRywqP5MID8umrTZIiCBp4gx6oenJ10omM9Zk3V
         OLBwAhW1dWpT7LON8zSwxq21vdFQof5noViw1HTy7q2L0pSwLVKL4h/ybqU+nQ2MJsgT
         S95Roe9T5uppnOpGeZcqZ0m9lkqlyTMmzbrf1deB1ySjhF2UWLYg4MpkxJ6By7o0rSQn
         e2iZ4QMzL9aJ/xZtPsZSDvc/6H3xr7qv5moR17d86kL/yDCQLubyx+I03aMbAvE5Z0Y9
         fMsA==
X-Forwarded-Encrypted: i=1; AJvYcCXVH+JCDqzZ3+Ckfjt5fvU0MbHbAoPvwrxIo6xTplEobx+6SghIr4gMKUauvY+5UKNPBLW6uzcheMfH4UX+7emvCeSQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt8o20oLF/m/dU7EFhVf4OgU3Vw5fqXDVj27+/9yH/hwx/RWlU
	Gc6bzp81BQyAR9/fwk0VD64U57AobWjOSzHQMjbHYnMo3E3J3m4gmeSV
X-Gm-Gg: AeBDiesKNLay7OeRSzcJdHw8hZObiuBGK7Ve15j3CJvJbjeSA+Y+VKTJvpCdxom31TD
	ClPKM6jzaTQ6Nx1dxcMCrH18flEianyAVsfFZNhy7X/7oc//HhUY6M2YFly5h6Wq8YMEkRCvONs
	lFW+K/ox07ZSNHz5qXQD6J7iEOVsHWPG/PZIzSW2FHxET3bQ/ypXX7Un/GWpSJzQjnQnyxal15x
	tlY+vw3AtD9y1JwGCo83wdLR49lISkOOChiI+zZRVWXP3nwDW08STqfQQEheiSsxdeQ5NnTCcdn
	zr5Mw4RYEgmaOAjiUlt/zztee3+cs4oAkZv0n9ZcwCuZfRHWQ2+MlxaDqjiher8/ZYDRigbjjJx
	LTak3Mfemo1U566DSVwIrelE8ry+aMtzPIyb7YK/meJ6lnfCuaJnIbSuWT/HPYyby2AT4rCfXPz
	kWDrhHiChDDX//oYuhTXUnl/sonEDEZ8NB/y/H2H57JDNwMvH76qwsjQasS88s0bIR
X-Received: by 2002:a05:7301:1e87:b0:2c6:cdb3:bd8d with SMTP id 5a478bee46e88-2cbf9afd61emr347222eec.7.1775162619471;
        Thu, 02 Apr 2026 13:43:39 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:902a:cd8d:1c0d:8926])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20b195sm3280897eec.16.2026.04.02.13.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 13:43:38 -0700 (PDT)
Date: Thu, 2 Apr 2026 13:43:35 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH v2 1/4] software node: return -ENXIO when referenced
 swnode is not registered yet
Message-ID: <ac7UqTsPC8yUooAR@google.com>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <20260402-baytrail-real-swnode-v2-1-6f5054a4cc07@oss.qualcomm.com>
 <ac5wprh9vfTU5pGa@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac5wprh9vfTU5pGa@ashevche-desk.local>

On Thu, Apr 02, 2026 at 04:35:34PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 02, 2026 at 02:54:26PM +0200, Bartosz Golaszewski wrote:
> > It's possible that at the time of resolving a reference to a remote
> > software node, the node we know exists is not yet registered as a full
> > firmware node. We currently return -ENOENT in this case but the same
> > error code is also returned in some other cases, like the reference
> > property with given name not existing in the property list of the local
> > software node.
> > 
> > It makes sense to let users know that we're dealing with an unregistered
> > software node so that they can defer probe - the situation is somewhat
> > similar to there existing a firmware node to which no device is bound
> > yet - which is valid grounds for probe deferral. To that end: use -ENXIO
> > which stands for "No such device or address".
> 
> This error code is also too generic to my taste. What about alternative(s)?
> EADDRNOTAVAIL
> ENOTCONN
> 
> (The brief grep shows that the second one might suit slightly better than the
>  first one by existing use cases.)

We are in the core of the driver core. Why not simply use -EPROBE_DEFER
to which all users will resolve this error to and call it a day?

Thanks.

-- 
Dmitry
