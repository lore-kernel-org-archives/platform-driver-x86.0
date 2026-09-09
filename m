Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E54492E23;
	Wed,  9 Sep 2026 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966633; cv=none; b=CWWrJWkDCa5mHHft66NlTDKQyU+RFgKM1ZnqMgctXWoGgMxlgP65Jvt4E6EZX+iNDJRDX3r3+eI46hhcstOaViNsx6XVPcZoFb/Ldstj8DL+sl8p6m+cZ9BybfLkk0UWAWUhEF6xApQbNgGZNBNb4xwbc4x92+E/YP98N6Wn/ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966633; c=relaxed/simple;
	bh=rLfcBFHL7oqhLq93KS6anMuHmLNikTPtxsnWyq3pgM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUIPLfda3Xh5Lp/q01J5EKStvN2zWF+Ym1Pcl9EoB5Vt97kJPuUsS+7aVhXUId2tfyui0nX8KKTbMn6DQUogJWxaWCslu5hWZ/LyqJwzlbNw/25vqw/SiV6KUQL+hMlqz4wQVx7F66tN1DmPRIrimS56dJuQ2I2LWYBQ71KeimY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQoxjnCg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQoxjnCg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C991F00A3A;
	Wed,  9 Sep 2026 15:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788966632;
	bh=YvepWUyOAxFv8QZXY8L0DRvv9RvPiNjDsFx72mbwYEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EQoxjnCgNDx8oqmlMvfHnibl1MShLRvGdacilFcmds5GZjDanrySF/Q26oN6zS1K6
	 W8g//o99//ilhOnkZZNxIN4rmzVTKiTRaQ1RcD8yGaBXeewKHEEPAWLbZhmE5+oVsY
	 2r2COIOhKBEGgxqW6VkzD6BGocR3tZduVcXOIlER891PBt8HOrmMwKlWEvdtp6dMEG
	 /ntfEeoCFlFOplTeYadcgjrctNGF6Leu3uo72oZyWMl2yGGYbpy86vSks/e5BXrsF3
	 dnDw8fp+kSnAVFOT0DFfaXf5Slm3Ye/lWhM9ZnD9LmC4yk3jEtokvzTZUQfdiYtxYN
	 VgMpjXtd04TTw==
Date: Wed, 9 Sep 2026 16:10:27 +0100
From: Lee Jones <lee@kernel.org>
To: "D. Manresa" <dmanresa@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Thierry Chatard <tchatard@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: add Dell Latitude 7275 to the resource
 conflict quirk
Message-ID: <20260909151027.GA2133376@google.com>
References: <20260831160754.9857-2-tchatard@gmail.com>
 <20260908161629.335223-1-dmanresa@gmail.com>
 <aqDkwTkAsvs8Escx@ashevche-desk.local>
 <20260909065104.15817-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909065104.15817-1-dmanresa@gmail.com>

On Wed, 09 Sep 2026, D. Manresa wrote:

> On Wed, 9 Sep 2026, Andy Shevchenko wrote:
> > Do not fold, just add into the series this one as patch 2, for example.
> 
> Fine by me. Thierry, please carry it as patch 2 of v11 with Hans'
> Reviewed-by; no need to change anything else.

Why can't I just apply it?

-- 
Lee Jones
