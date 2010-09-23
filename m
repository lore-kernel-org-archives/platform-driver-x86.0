From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH] intel_ips: quieten "power or thermal limit exceeded"
 messages
Date: Thu, 23 Sep 2010 13:50:23 -0700
Message-ID: <20100923135023.39febc7e@jbarnes-desktop>
References: <Pine.LNX.4.30.1008261631410.13713-100000@mail.perches.com>
	<4C770299.6000708@cesarb.net>
	<1282869660.1836.5.camel@Joe-Laptop>
	<4C77171E.6060008@cesarb.net>
	<1282894751.1836.41.camel@Joe-Laptop>
	<4C784650.2030200@cesarb.net>
	<1282962104.1946.179.camel@Joe-Laptop>
	<20100923133132.3faae5b3@jbarnes-desktop>
	<1285274825.25928.19.camel@Joe-Laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy3-pub.bluehost.com ([67.222.54.6]:55344 "HELO
	cpoproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751833Ab0IWUu0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Sep 2010 16:50:26 -0400
In-Reply-To: <1285274825.25928.19.camel@Joe-Laptop>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Cesar Eduardo Barros <cesarb@cesarb.net>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 23 Sep 2010 13:47:05 -0700
Joe Perches <joe@perches.com> wrote:

> On Thu, 2010-09-23 at 13:31 -0700, Jesse Barnes wrote:
> > I think the programmed limits are valid if they're nonzero and less
> > than one of the available default limits.  If they're not valid, we
> > should just use the default values.  I was thinking something like the
> > below for MCP, but Joe you may want to just update your patch instead
> > since it's more complete.
> 
> You have my patch yes?
> 
> You can probably integrate and validate it
> better than I can with your proposed change.
> 
> I don't have any of the hardware to test.
> If I can otherwise help somehow, let me know.

Ah ok, I'll fix it up and respin then, thanks.

-- 
Jesse Barnes, Intel Open Source Technology Center
