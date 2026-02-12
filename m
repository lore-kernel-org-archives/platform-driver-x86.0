Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395FE12CDBE
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770916740; cv=none; b=bxbb9fYGaDWWaCCC/4/6LNnUqFCuClOXhlogRp9tepkGxXHQFVjsuNVHaoHn3cNRQsNlQvsVTb4kijMbxbAUvIwoSYz61XZKDov8zN3GFl/K3FZBwPM+EP7BPbR0MrQcdmvWzNLL1qpUehk0NFHKw687Cfx5QtHtSIabGyJmoUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770916740; c=relaxed/simple;
	bh=rQmpHrN2wV/CvRjzJIVwU/yGaAlirmaOXRoYjUY7xVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmuxJCaE+x4SvCk69OgWL2i7D95lPrgOs/tAjlpQOIz6Yv3odL0ZGRLD6GHAqoK/m7k1aIAqtt9cJCLUE08Rg2A8hgxlzK0e0rrY7GKAC2Zj9S9micSLIbBdpjQBbK03wPlPiHDC7OYIQqWd/Q/cSM07EQvjevNdcrasLrvAYgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1WXkeIK; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1WXkeIK"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-126ea4e9694so123253c88.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 09:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770916738; x=1771521538; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yYpAiJv8s1qXkcZFeF2KVoCh1GpktphkQ+HvnKHEMzM=;
        b=V1WXkeIKQW2pNiMYoIDhlVcneeKsRXsknrftH0C6aynq8UC9aTVnANfyyhxcfikbbt
         VaLcWgGoC/gjCnpnmDW/BoUN5TYN4fw74PElIOky2O07tJSFLA/VdHZLbqLM6P3SDPDe
         taBbKLupq40T112kCHsSuRX7zITMYegLKmLfo30FCkapLGJUEzXSC8JrVzOkz94FxJyX
         u/UCFExuzjErcO4DRDGSq6MgOa7HBuGwU5eu4Szyczwv98nRbOvwixlLerkmzDYgcq+x
         Hioqp4p/dPiD64vfNQpIfass3oorpvsHuif71OTris7F1vU71cArDMYcdJSWFOuONfwm
         QlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770916738; x=1771521538;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYpAiJv8s1qXkcZFeF2KVoCh1GpktphkQ+HvnKHEMzM=;
        b=OGVJDqACdnqLQ/16Yqm5rF4N2LnCvD5lF3/RwSUQHV739bOUrmLEOQ3G64ZsmRLTM8
         Bmzw7Kd31kIV+49XZ0yec4PLALpowFiPED8iiTYEMfUT1+GsIbacAwHIQitZZr/O9xeK
         uzmcIMCn+MIwCsYEjYOutQZ6rzQbywJz6E/XQE2RaupVB0/rEVGy8Z5mi+5c5XnCpdIv
         fVAgIEVFI4Mkej6SsvR4mCifMr6FY/8j+rfMi8HDI81akhsZ3U+86yXvA5E3ozb5qJTC
         H8xXF66Fe0ogQtKqMZEja1I58gojwY3xXH7PWcr71T4pSFwnasgHy2qAqyZt6YBmsy5N
         y4VA==
X-Forwarded-Encrypted: i=1; AJvYcCXps/448ugijkXFp4LUD3t99DQ1VVcnuxjQu3bE2RGFYoNbtt17WnSVCAuQ+MwC8Nc7w+/MlMBY/cQ5S1AcuG7ORUMJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+b/PHaQc9+r2iasWzc0ZYIlEOP/QJ8I7TxsUQZ9o5Hb9gtJKs
	cFrAdp+BVltPFafwcxEJzQ+9nSdxXn2v6ee2brym9xQgO98YVoupPPPS
X-Gm-Gg: AZuq6aJK8VXV105+50H/yKHU6ki7F4W/GOPdZYcXrT5fvNMVjgOM2e01kNhnjcECSKj
	5LNm7P6FP/3AJf9Oea0kFIcn6sDlyhLTJQC+bCxWM1WpgR46BSy7k5DmJFM2HGpBDneXyKFxYaP
	tyfnII3nwz9vlsi09o/cziy185kuDPhZBL81UPvsOgY59hf07zVf6uN18jU93UTBNFP83Y4CfmN
	EnBAgYvGYILE5ALUjKfCyytHGkecw5QPuVdB5hAhZk4+dB3Bfw+bTThp2aKAVWjpl2f3SnNMsJ9
	J1a5l7Xxgj7y8t7zptRrYvzXaydU2Adfy+SgnsT9Gv0MnNtLEuU9gD26lpciHaS5XHFeQVWJPCO
	bQBz7sw8YyaWNklz3vvhqvexFrxADlI6jk0LLEW6WgusjDh5iXSaNTqswgDn+qn6zAjakBFdkyU
	Q2lJylbBU3cqxCNjhOLO5Sj4TlmVZMccQsH4t5ztf+xu5aT3+XVKGAP7XcYa96yzRPaQqGcczi0
	Q==
X-Received: by 2002:a05:7022:221b:b0:127:33e0:ea33 with SMTP id a92af1059eb24-12738607b83mr75883c88.22.1770916738146;
        Thu, 12 Feb 2026 09:18:58 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f5e:c935:ddee:63d0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a6942ccsm5587600c88.3.2026.02.12.09.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 09:18:57 -0800 (PST)
Date: Thu, 12 Feb 2026 09:18:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	platform-driver-x86@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aY4K2qbxNmsotwu3@google.com>
References: <aYpC_XWNXiRmEdzo@google.com>
 <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
 <aY1K7z5oYFmwMy2b@google.com>
 <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
 <aY2rWc4bfeWqw1Zu@smile.fi.intel.com>
 <aY318Dg9gMU1KFvx@google.com>
 <aY38A8MbctpAgDqS@smile.fi.intel.com>
 <aY38ZBTfbf9a7Unw@smile.fi.intel.com>
 <aY4EqvRduJnlg3iC@google.com>
 <CAMRc=MfmYw0oSkc7Td=Pzwb97DzA4ym23gcqZPSKxHuQQhAx_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfmYw0oSkc7Td=Pzwb97DzA4ym23gcqZPSKxHuQQhAx_A@mail.gmail.com>

On Thu, Feb 12, 2026 at 06:07:32PM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 12, 2026 at 5:50 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Thu, Feb 12, 2026 at 06:14:28PM +0200, Andy Shevchenko wrote:
> > > On Thu, Feb 12, 2026 at 06:12:56PM +0200, Andy Shevchenko wrote:
> > > > On Thu, Feb 12, 2026 at 07:49:31AM -0800, Dmitry Torokhov wrote:
> > > > > On Thu, Feb 12, 2026 at 12:28:41PM +0200, Andy Shevchenko wrote:
> > > > > > On Thu, Feb 12, 2026 at 02:01:02AM -0800, Bartosz Golaszewski wrote:
> > > > > > > On Thu, 12 Feb 2026 04:44:05 +0100, Dmitry Torokhov
> > > > > > > <dmitry.torokhov@gmail.com> said:
> > >
> > > ...
> > >
> > > > > > > +const struct software_node lpc_ich_gpio_swnode = { };
> > > > > >
> > > > > > (With name, please!)
> > > > >
> > > > > That we could match against... /duck
> > > >
> > > > :-)
> > > > No, it's for the /sys/kernel/software_nodes/ to help with debugging, et cetera.
> > >
> > > OTOH, if there are more than one of a such controllers in the system...
> > > And it can be found by reading the links that one of them related to
> > > a certain GPIO device. So no insisting on this.
> >
> > If there are multiple such controllers we cannot use a static software
> > node anyway as it should not be shared between them.
> >
> 
> In such case they should do what OF nodes do (and I'm sure ACPI too):
> use some ID to tell them apart.

You are missing the point. You will not be able to use a static node and
export it. You will need to create a dedicated software node per
instance and the provide a lookup mechanism for whoever wants to use
them to locate the right one.

That is inherent weakness in identity matching - the rigid coupling -
and that is why I originally implemented name matching which allows for
weak references.

Thanks.

-- 
Dmitry
