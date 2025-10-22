Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E328A2D47E1
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Oct 2025 17:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761155683; cv=none; b=psO3KVBbqZIGY90cHRXoKgBGfbUmxZGac1oYKqhcKnmeeoI1e0VZaM784xZiE8YtSUpu2UM14EuhH1GsNvkbnLE4VroPTyPuRkPORNzR0SIQpwvUe5aES/CXVp1Yio7wRRVn72iyRGjJLv1a6B//owvpM6I73vO+vY1ytFSkkuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761155683; c=relaxed/simple;
	bh=B1AUVikLodwQzq7iTiyB+43RNcbtAThA47OKW3pcpus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKsmerjlyfI3BBs6zvgxlGmS5yMi9x2Nzte1YQFiv9qH4ODn+mr+OxLnaqp5WQmVdlv6qmGzKg7SGPMclHgL0l9TynPcpP/0EiYOiJY0huLQnBoYYeo/kesh9iZSF/eFnuhcilNXQuR4fouSeeuOHz/nqNvV89LIAyojyeHo3Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6GFqhoo; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6GFqhoo"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27ee41e0798so112590885ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Oct 2025 10:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761155681; x=1761760481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x478lQk2DxPizTI77gXgyAfctUUWFoIyeH8cqYHygmA=;
        b=e6GFqhooWSHA8JPt+KCn7IXb0ra9KZAqHkmGtruuXFUXBbZYC4Ko1SBH4X9ydLqnxa
         3ptSr0OxNCN5cIOsa64E/thsMB3f3yMCzcLCzBdJY4XpPF+NfNVmcycmbO8C4hva/i25
         3jRAF0XsfcdEoTurYpbWxOFOUTUnPquCmpoPfhXZo8XryRT6x0sQdrMncxbKff7bRQPx
         Z4l8IByosoeEr5w95+uRoAysGlZVzq117ZjfNzRE0VyuiwdkXVw7IQVsOYClWq2bkMz6
         v26PbTOY2z1xsZDbOnUssOxpJJq9mP1BxcGxvIy47cFEVEVh4SgQ5ERe26S7Jo6tzKnI
         2W+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761155681; x=1761760481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x478lQk2DxPizTI77gXgyAfctUUWFoIyeH8cqYHygmA=;
        b=rkLQ+m92FnELClZDiAonyjiph+GfvTnKDIvWrP3f90lLjo9GZ9MaxLarBCo+TYWwU/
         b1OQMHjUNomD2oJETbIl6Nda5ad9HBimUM1ru+YAonb5TEbJWFkNABwx18tAh08AHAM0
         w6S02mwgnn2mZjvUdjvqf6DuG4k9wZqSN1zzoO8GXd/zkOo8EXzVC6N1iLg2ANHnvX34
         FUt+vwl/ssSZTjp7zGYXPg8l+otUL07sSsgYijfTas6LBL1Ce767yG+JvkC9E84Gtv5o
         SYxnnGBloC6ockimNvaaDQRC6e4oHD3WQnwNmoTNvqSbJpHty570RES9//Bu7XEA8xCO
         bHOg==
X-Forwarded-Encrypted: i=1; AJvYcCUE0/sKDZ6/Kq3g1SG/MLUXRbp239B4P0RVnf99JEwHncvZdT4HK/iKNG4Diy4MqIwKsmAyy8HbPQdDi7xpudywaBtA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/iwnK6RInUhquIMqC8z6iPHQSeIxZOtJsijOqSHQP11EzSZGN
	gDAeL8oThNEE/9SYe6gDWTSwkuZptnPSHjGeC3lwrgPZK1yioG/06zUd
X-Gm-Gg: ASbGncvp/V+/NwPTvVeY0dyYnuVNK610LgF9L/scb8qhlhW7l2/fCbK0OLugif1e7hx
	PuRQ25dKdmjEPzyAXQMlYjGnhpU/TecgDIGV5mFO3zZfBMsd3neujZ48OvuqLFFoEA/xqXzuwDQ
	6enQ/QkPc05H2QyJtA4+7+yq3ERm/eeo9Z/6cOzMgp3+hSBCeATckPGmR1j02k4Qk61FxvhLhD2
	ewokD1G2xwSewbK6xf8pvjjITrjHwmnEqjYMg5T2EBr2/i/T/jVCqWD7KjZvqgSUNGffLUukMZO
	kIfisxx/Dbph2ds4snjwpCTM/d64isWxg/ej6jSsbJ0+ksweh9JK4u1XG//WQKrmxeaj7AzzIXF
	URau9AFKIAfjjeFiiAqXbUKlIZaefcwBOi/f5fAcGlwYXZtXXQo2tmpf575jL0lso7Or17GNqig
	oYymTEdLLX1LSJdcDxxwyC2U+AZNLbfsymdYSwX6+nxFiy3LjflQ==
X-Google-Smtp-Source: AGHT+IFzOHo/RMYqhcqswj+hl6niGwcGNYYYyzF2qwE5VOSZ6yskOvLvhqKzp4jJuFDjqUzcg0pA5g==
X-Received: by 2002:a17:902:f64c:b0:28e:cb51:1232 with SMTP id d9443c01a7336-290c9cf8a6amr285299295ad.3.1761155680885;
        Wed, 22 Oct 2025 10:54:40 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:53a9:459c:bdc:6273])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec0847sm144704115ad.22.2025.10.22.10.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:54:40 -0700 (PDT)
Date: Wed, 22 Oct 2025 10:54:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: Add keycodes for electronic privacy screen
 on/off an use these in dell-wmi
Message-ID: <wcrbaqheqhzpjcg3au2c5xshwwed5bjyvl5u5pske6ru7lggjs@yjpnfdbkogba>
References: <20251020152331.52870-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020152331.52870-1-hansg@kernel.org>

Hi Hans,

On Mon, Oct 20, 2025 at 05:23:29PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is a patch series for adding support for the electronic privacy screen
> on/off events send on e.g. Dell Latitude 7300 models.
> 
> On these laptops the firmware does not allow querying the presence nor
> the status of the eprivacy screen at boot. This makes it impossible to
> implement the drm connector eprivacy properties API (1) since drm objects
> do not allow adding new properties after creation and the presence of
> the eprivacy cannot be detected at boot.
> 
> So instead this series adds 2 evdev keycodes for eprivacy screen on + off
> and modifies the dell-wmi driver to use these, so that we can still
> propagate these events to userspace for e.g. a DE to show an OSD.
> 
> Dmitry, can we get your ack for the addition of the 2 new keycodes?
> I think it will be easiest if Ilpo merges the entire series through
> the pdx86 tree with your ack for the keycodes.

Yes, that should be fine, although I wonder if this is best modeled as a
pair of keys or a single switch? I know we have touchpad on/off but I
wonder if it was the best option... Probably more convenient at some
point if it was done through the atkbd.

Thanks.

-- 
Dmitry
