Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AE48494;
	Mon, 12 Feb 2024 07:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707723632; cv=none; b=tRp6RS+lbpZFLgIN6Vw2YtiJkRhOUTUVXhttiEo/NxuFA6RVaekDbEhNxENjGhGWwV4LON1gQpX8Yx9UARB2SbNqQTUJx8WauvcgEIZOm0rvp1I63DQSsdkg+Mdoev2LR6JAmPr48HHXY5jh7zoVwq0HN7RF3eokopNgN5lB+D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707723632; c=relaxed/simple;
	bh=4vOsl1S2llpIgzNaDaFyi0kDq3TgZrc8iP0zhrvC+qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAV0yJJRLG3jvinfiR+NJEJcBzVejoD7JoxdBtbJNdcQYop4HJPMdQdfU533HCs0cdR6NJSiThHUzKPQlr1THFFBeUFaMm+d7+YZSUt3YtruN4BTM5SPU1zjkk5zrpcVsae0g742kZl819G9SnPIDpYY0eTpebfoX0/7dx//tAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=thhB1pSl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="thhB1pSl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972CCC433C7;
	Mon, 12 Feb 2024 07:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707723632;
	bh=4vOsl1S2llpIgzNaDaFyi0kDq3TgZrc8iP0zhrvC+qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=thhB1pSlS+/uF/c2D0hz352HFkR7dBF+aq6M20PeYGUAUBjIQ8RO6/vhWXRJP6CX6
	 Z5vwGMcdGTlvslt2cOA6YBO3f6cSxSPzqfanuV+LRFdXSEF+GgagpQM8ZWtFAhKKe2
	 UWH6qFXy7f7w6U+SpILeJTPZWQXYzTwt4j0HpLoY=
Date: Sun, 11 Feb 2024 21:06:54 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] platform/x86: Add new MeeGoPad ANX7428 Type-C Cross
 Switch driver
Message-ID: <2024021126-extended-plot-95bb@gregkh>
References: <20240211195307.158956-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240211195307.158956-1-hdegoede@redhat.com>

On Sun, Feb 11, 2024 at 08:53:07PM +0100, Hans de Goede wrote:
> +	dev_info(dev, "Powered on ANX7428 id %04x:%04x\n", vendor, ret);
> +	return 0;

When drivers work properly, they should be quiet, right?  Otherwise we
get a lot of kernel log spam for working systems :(

thanks,

greg k-h
