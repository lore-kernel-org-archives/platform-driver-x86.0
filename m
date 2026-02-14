Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE7C1CAA68
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 00:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771028978; cv=none; b=a9+sdK5HQ2agnUZRLbMh4CqyOjQZQWgmSJ3yF5I1W2GUcf/qNqtHRP7ykQNxhVvPZrDQzgQPS2l49MTubcmE2oi/dj7IZNlSWCGmYwjisIy/ad4toVNLBsTtdbVzfq9eedoilU4W375eEJQlOCR7rXafQv3rm5gPwdfohBmSKKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771028978; c=relaxed/simple;
	bh=R4bRa0bB21KgcxMV7DgcmupXdlFLgwo5oHZ08XP5lFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEFM72tyFa9qmKofgcvUlFBykD5qVeP6Z2AbXbZ7nlaIDyt0qPfpDXc6AlOcguPbeawmaTuePSWLNgbl+MoOHa91dgvWZy5LRVFUpdTlPI6ZiYl5e/DCVV0xkXxKBA/qzAmq3KdSoplUXN9wDvKerYQeXR8ROgqdn1NK3qy7iX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/eD3Uj3; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/eD3Uj3"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ba94dbf739so1648160eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 16:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771028977; x=1771633777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXIxItk08P+S/5LUIpd4Xc7r2QgptD/Cqq6UpuzfoSY=;
        b=C/eD3Uj3RwJBc4apARxW97Xl+29Q7e1Xb6Z7F5i/zNEsRkSXQYvXhiYbGyx0hDYWHn
         TwpfDdZyaMwieDS4jXxJxtixeSd4vRFDhAdi516PSKy7iLuU8li7YOSp9K1EevONlcoH
         9qL+KmHEyiBzMta9Ecl8BLERy/gYWgtnBY2PU+qJPH7uJ+AX1+gKUSXvZJKGOFbQpPCR
         f+zHvXsyUtI7BI7XoDP642aSAFV3vbQoO19uqc6vkRY9/kzcIy1lA7ZK46XGs+GhOhNP
         qy2tyF+L/HdFU6DJaCtZOTO0jbkq16iqXUP1tMrEt9Hohi233XGaUEXXbuaWVlUHB/80
         U0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771028977; x=1771633777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXIxItk08P+S/5LUIpd4Xc7r2QgptD/Cqq6UpuzfoSY=;
        b=fMoBJnAakePSMuIaPXuxthVtsH30Y02PomeNl6KLDP6jOKeQvFI2c6S4WBEYDmQjEf
         aMu/xjNWmD5VM+bDgNVDC7A9jPVTLSl2JyoXv0qaKeb9s+aM8aSHkDfTmSy66UV2lg3Y
         bLWs1huann/6PNFvSDx5ec2/3ppGGjIboBTfQy+a//Vb3zm2V2q3nW49bq5r5Q0g5cm5
         zCwdD/5Z45utJVswFppSUSKjJhISateAddBJ2m3D9aTckWl9OxWQ87KlI4rP05GW4Evu
         KGSFsYHv9IwFQ5npvt1NffQLehdyaiJRBj/piKLBieNbERM7z9nOY31eFEjxUv+2JVPm
         XdLA==
X-Forwarded-Encrypted: i=1; AJvYcCUp4VX0dfSCJKd20U/3aaqKGMNDMLFCSy9ZXE0yoAfxecq6Eboo9w7oiAOV21egkcQZMm7HHqh9MLdvAedSI58ULyMM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1hOGnhzMQnCfpUxdThs1v33MIHFWgy4+RfiuLefhdpCGUNVRB
	U3ePMC8nl74YESOVPJrPMQEUrqdWzOE/yaB3XKhwa7/6LC7VTZP8lQlF
X-Gm-Gg: AZuq6aJBqFzD5QUGULfk31lrpK8Mm1ZEwWcug7hftVzfABsy2HpV3CT2/XnQtjdcTpG
	6+AiJjwT9d2WxuQFXpMLa64t0W/QTACu+NwbD4mxzpXmAqXZG3Aeg76dxtVnFzd9TB2t8JY2Gu8
	f9nakkhP48YM6xJurliZ9bi9XSBJBQ3tqd3/404Fidy18z0Fci8Z+Dnb9GCD6zcVmxOPUjZazCe
	VzRHDO1e5k72/TkLEreowiUBuqLDtUmWfY1tDrEtptB9nB6qQVrd/+Y0+CZEBo3soXQydrBxrBh
	osd+TdcW2Z9aQg9dvbL0F/jnYvEx8ZJrBYaYaNkgDhHOM7F0s2z0Yv1hHDZHg9vY33ZAr8UVlGa
	WJC/UTCkPLSfXmZvqBnftoxLYE/FiEZ6ouyURk7ifF9UroDv63wpCO74IhaGLSlECwZ4JmBuO+K
	TNvIFB4fqGftHCor+/vVmsLg4Tylrm7pOBC6ZuSbM9FaKBHFDQOWbRqZ0YZojzJ+eu
X-Received: by 2002:a05:7300:1910:b0:2ba:a075:5423 with SMTP id 5a478bee46e88-2babc486a8fmr1090844eec.30.1771028976531;
        Fri, 13 Feb 2026 16:29:36 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:b713:5e7b:5963:d2ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb658fb9sm325058eec.20.2026.02.13.16.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 16:29:36 -0800 (PST)
Date: Fri, 13 Feb 2026 16:29:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	platform-driver-x86@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aY-5ZVPD8C1B2nth@google.com>
References: <20250920200713.20193-1-hansg@kernel.org>
 <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev>
 <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
 <aYnqY4KPq2Gqj3Dv@google.com>
 <a38ad0ec-e72b-4667-bd5b-f12bf147016e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a38ad0ec-e72b-4667-bd5b-f12bf147016e@app.fastmail.com>

On Mon, Feb 09, 2026 at 04:13:26PM +0100, Arnd Bergmann wrote:
> On Mon, Feb 9, 2026, at 15:41, Dmitry Torokhov wrote:
> > On Mon, Feb 09, 2026 at 03:00:40PM +0100, Hans de Goede wrote:
> >> On 9-Feb-26 12:52, Bartosz Golaszewski wrote:
> >> > On Mon, 9 Feb 2026 09:08:04 +0100, Andy Shevchenko <andriy.shevchenko@intel.com> said:
> >
> > I think the hardest breakages are here:
> >
> > arch/arm/mach-omap1/board-nokia770.c
> > arch/arm/mach-pxa/gumstix.c
> > arch/arm/mach-pxa/spitz.c
> > arch/arm/mach-tegra/board-paz00.c
> >
> > If we check out at nokia, it uses drivers/gpio/gpio-omap.c. As far as I
> > can see it does not even have a fwnode assigned: it either does not have
> > parent or its parent is a platform device instantiated by the driver
> > itself and does not have a firmware node associated with it.
> 
> I've been meaning to drop support for mach-pxa board files including
> gumstix and spitz for a while, I should probably just do it sooner
> than later.

Arnd, what is the timeline for this?

Thanks.

-- 
Dmitry
