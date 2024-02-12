Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1537AF51B;
	Mon, 12 Feb 2024 07:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707723641; cv=none; b=CvrcXv1k7axbMdhd2YF9L7om4nrDQnyQxysHmxGmM8Hsm8Vj9+nwe19Y6xNz49YaYXiGCskH2cHVK72pcviL6Z/tOzMYKbXl5B/0XYPYLQOz60VT/Iz/ph4aJf3QCBEFpNz9zjopywcaB1IRmExuJyNI9Jlzj+aszbtH6urBdFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707723641; c=relaxed/simple;
	bh=y76+zm0uH9DwwAwyEXm2lKvhgeyX1OCVrGD1RchTZyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsWwoX61lHwPyS5k9dftz7e1j0gdKjvgBrdRGyK8hP6q65QTGulfKdrzeRqcwBhdTr2+WTy0aswhqsi9VFc0srqJMeeHbO8zOIIjoYXu5WUwmsSxeBNQcYuh4oH8EiRFwkJ4OQgbpe7eJu/dcV7H/BrG1TtmJ0sS3clv12+mIO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=omWZyBlH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="omWZyBlH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CAA8C433C7;
	Mon, 12 Feb 2024 07:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707723640;
	bh=y76+zm0uH9DwwAwyEXm2lKvhgeyX1OCVrGD1RchTZyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=omWZyBlHaKDDKmVJ1957r8ws/vT9OqgHQWzeqaAaKfTpHXyL92atQMQ2nGGY2X6JN
	 IyDKNI66KTyRzUwJ25pSrScruEtYYfeeAv+Um6Da2wkzCch8uUOi5PWItIBFjnkvtb
	 YpgXexP1ohbewEIJXhTLMiZKWnMQVWqQAUNqDOsc=
Date: Mon, 12 Feb 2024 07:35:32 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] platform/x86: Add new MeeGoPad ANX7428 Type-C Cross
 Switch driver
Message-ID: <2024021256-retry-moonrise-15d8@gregkh>
References: <20240211195307.158956-1-hdegoede@redhat.com>
 <CAHp75VdSWwntsEh5xBz3jzXGi_QRuaRhcSs1-MwG3QYHW=wMtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdSWwntsEh5xBz3jzXGi_QRuaRhcSs1-MwG3QYHW=wMtQ@mail.gmail.com>

On Sun, Feb 11, 2024 at 10:50:59PM +0200, Andy Shevchenko wrote:
> > +static struct i2c_driver anx7428_driver = {
> > +       .driver = {
> > +               .name = KBUILD_MODNAME,
> 
> Strictly speaking this is an ABI and we don't want it to be changed in
> case of filename change. Personally I _always_ prefer it be open
> coded.

No, it's not an abi, driver names can, and do, change, nothing should
ever rely on this.  So using KBUILD_MODNAME is fine.

thanks,

greg k-h
