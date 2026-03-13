Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261ED35E920
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 18:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773426814; cv=none; b=H+f6jZvGtXWW5oKF1U1NRkGqCpFlwcDsQs7esRHYnBGgOfX/LtUqSYoh9ErwThTd4nn3NXC5O7QkO2Y/GyGZD0wghVoP2hwZvdQUawQx9GqDujPGtppJP4enyoe2DqK4Ve3/3ge/xqgInk99AeqYv0nuPFMlMqsweaZg1aruR+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773426814; c=relaxed/simple;
	bh=EE4YMURcnrFeXffKfUY2x3rohd0IOOyU+TBMAgB6P6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtuegZKbpZeKZsWynxCWTyYglOMHTxh0cbwlailYrtnAXbjzgF5VtaceghWtG+ktT5MVKSbKKFEkfPieael9+atBQ3snGcoXatTa0uuQMtXRoX/f3sA5MPiYz3XopwWSknP8VXpe1TqQYjt1jkFCTJrf0lUeTraNTjEYCpG7eiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSjbmovz; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSjbmovz"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bdfc4b191fso2891341eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 11:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773426812; x=1774031612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pzcme6Fc7jwKa30DLKkBMP5J+l0OEb6h4cy20gevLw=;
        b=CSjbmovzMcmIoIBVtN08uajLpziVXK0YujT0jX6y1h1tenKNsNrO0Fp7J3fpHH+n+J
         xhaFVSYMrjB3fPsFrE8qQGRKgFu9jbzo2WHhThclX9W6RVBvufVS7XltQwZcdibhcBhH
         w600R1DXCJvLcCjAUN5A/xHQWsnySIfYIqgpCTup/q4HdGnPQ3XLQmXz0JRGWZh5+jqI
         6HESLjQHc9m9uOTTQ15pV1GxsZRH2aOunJT67Xlv7hL/CmmDgbWQiPIxNDrBOKN5OIXk
         PWrYhHIhJe2ogLy007K6jz87EygVSkb8PHF22hNyjXQj/YAZhLBxpbwykr2rVyI4URq0
         FZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773426812; x=1774031612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4pzcme6Fc7jwKa30DLKkBMP5J+l0OEb6h4cy20gevLw=;
        b=cI88gdp8O15P1F9artIhLsEaNkV9RstpTF6WM4Olc9qZVAzAed5uabrjU+bMC4FC5/
         +KkSBWvJzYO3er7ovgI416j+CcBh/q/5+TjOCXy8+W/WYnbuTnplBdSFNbrNUGhoiqG1
         bG8045NiMbRP/JxTmzUD7H3a7cDY+aALAsq08xWwtXYnzF+fJl/rnVlaXDfGyf2yxyhj
         Qg6poid059mkjPHagICw4PwhzqT3UvNsLQDub4d3HB5Qz1xA2HU/e1SkzSj9e/4na29g
         uRMW+XRAxPctITL9wnRmf3hEt0vGLnI3e5D+8LO+X+DKmOyfE1wLr4tp3OMKEjS1dEK0
         yQGA==
X-Forwarded-Encrypted: i=1; AJvYcCUr/TKOjuOBd5G2PX/D36cVkX6evMOk4KTccCwnzntqigJw/KkgUM5Zx7maqaKWAL4feKgb9SlpZaH8G90f8I3SCR4B@vger.kernel.org
X-Gm-Message-State: AOJu0YwfAYKaS4VFTo+pPjB7prJcWmX8g7bdSaz1bv/JpsAHOq9dBehF
	nYoykTO7JZM1FB3Xu0vcvZj7fkZLgmiK5fSfwFMPNZXEfZVNaGX0x9fq
X-Gm-Gg: ATEYQzzBgOAttWWaIGVzXrzWadLiVApfQQPoP43SD2d/ZZsElEg/iPGsCXGuwHWtV2P
	r8nfHudGzCKzpCDnquUjWSyB9ILDi8j90eexUg9p1UIVaWx+uD/C1qWfd9npp1YNnxmxRcoewWK
	7rhe6293va5l7+eAW3+J9NclypYXBM4S/DWoCK4V8S4pJNisU1rFPbPZaSb6zSbHkkevPdDIwBM
	HNKQNGrekXtIYE0AxiGUPW7NFl6aA4L52HEgrtoKlFiyRlNTcyCK30kKyGqEjdup8xb5zxr78jl
	yd93frp2VfhyfGkLe0xFW10XXv0p6CMvJQbMBI7yPnVjoLPKJ0xR+o6xB5EKN1SxZUUdfrt4kus
	P77VgqHubzVkZwtoPbNF+m9JSnIgpxxdrgujeKZhBw6TsXSouoCc9Kpr+HMq+oSSzLJhmKc2SwD
	M1XcUSq6ARnkYBaogCo4AVx7qR4HeOdbuWQcjT
X-Received: by 2002:a05:7300:8b83:b0:2be:2964:44c3 with SMTP id 5a478bee46e88-2bea547ccb8mr1887830eec.10.1773426812206;
        Fri, 13 Mar 2026 11:33:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3ea2cfsm4170626eec.11.2026.03.13.11.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 11:33:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 13 Mar 2026 11:33:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org,
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
Message-ID: <07346e6f-8764-43f8-b63c-31dfa9c65add@roeck-us.net>
References: <20260308200155.118950-1-W_Armin@gmx.de>
 <20260308200155.118950-7-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308200155.118950-7-W_Armin@gmx.de>

On Sun, Mar 08, 2026 at 09:01:52PM +0100, Armin Wolf wrote:
> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for returning the
> results of a SMM call.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>
