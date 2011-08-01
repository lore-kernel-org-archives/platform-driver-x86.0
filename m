From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 01/10] lis3lv02d: avoid divide by zero due to unchecked
Date: Mon, 1 Aug 2011 13:29:06 -0700
Message-ID: <20110801132906.2d4cd28e.akpm@linux-foundation.org>
References: <4E2D8858.8000900@tremplin-utc.net>
	<4E2D88C7.30409@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:43515 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753065Ab1HAU3o (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 1 Aug 2011 16:29:44 -0400
In-Reply-To: <4E2D88C7.30409@tremplin-utc.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?ISO-8859-1?Q?=C9ric?= Piel <eric.piel@tremplin-utc.net>
Cc: Matthew Garrett <mjg@redhat.com>, Christian Lamparter <chunkeey@googlemail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Mon, 25 Jul 2011 17:16:23 +0200
__ric Piel <eric.piel@tremplin-utc.net> wrote:

> +static int lis3lv02d_get_pwron_wait(struct lis3lv02d *lis3)
> +{
> +	int div = lis3lv02d_get_odr();
> +
> +	if (WARN_ONCE(div == 0, "device returned spurious data"))
> +		return -ENXIO;
> +
> +	/* LIS3 power on delay is quite long */
> +	msleep(lis3->pwron_delay / div);
> +	return 0;
> +}

The WARN_ONCE may not be very useful.  The user gets worried, might
report it (often to a distro, not to you!).  But we won't actually *do*
anything with the information?
