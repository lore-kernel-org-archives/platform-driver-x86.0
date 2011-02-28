From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH 2/2] IPS driver: disable CPU turbo
Date: Mon, 28 Feb 2011 11:06:18 -0800
Message-ID: <20110228110618.0cb19205@jbarnes-desktop>
References: <1286303183-26744-1-git-send-email-jbarnes@virtuousgeek.org>
	<1286303183-26744-2-git-send-email-jbarnes@virtuousgeek.org>
	<4D6BF118.9070003@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy2-pub.bluehost.com ([67.222.39.38]:33144 "HELO
	cpoproxy2-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753963Ab1B1TGY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Feb 2011 14:06:24 -0500
In-Reply-To: <4D6BF118.9070003@iki.fi>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Anssi Hannula <anssi.hannula@iki.fi>
Cc: platform-driver-x86@vger.kernel.org, mjg@redhat.com

On Mon, 28 Feb 2011 21:01:44 +0200
Anssi Hannula <anssi.hannula@iki.fi> wrote:

> On 05.10.2010 21:26, Jesse Barnes wrote:
> > The undocumented interface we're using for reading CPU power seems to be
> > overreporting power.  Until we figure out how to correct it, disable CPU
> > turbo and power reporting to be safe.  This will keep the CPU within default
> > limits and still allow us to increase GPU frequency as needed.
> 
> Any news on this one, or is it expected to be disabled indefinitely?

No news, you could add a module param to force it on or revert this
patch, then run some comparisons and see what kind of perf difference
you see between enabled/disabled.

-- 
Jesse Barnes, Intel Open Source Technology Center
