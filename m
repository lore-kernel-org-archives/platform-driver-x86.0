From: Anssi Hannula <anssi.hannula@iki.fi>
Subject: Re: [PATCH 2/2] IPS driver: disable CPU turbo
Date: Mon, 28 Feb 2011 21:01:44 +0200
Message-ID: <4D6BF118.9070003@iki.fi>
References: <1286303183-26744-1-git-send-email-jbarnes@virtuousgeek.org> <1286303183-26744-2-git-send-email-jbarnes@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from sypressi.dnainternet.net ([83.102.40.135]:51610 "EHLO
	sypressi.dnainternet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752577Ab1B1TBt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Feb 2011 14:01:49 -0500
In-Reply-To: <1286303183-26744-2-git-send-email-jbarnes@virtuousgeek.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: platform-driver-x86@vger.kernel.org, mjg@redhat.com

On 05.10.2010 21:26, Jesse Barnes wrote:
> The undocumented interface we're using for reading CPU power seems to be
> overreporting power.  Until we figure out how to correct it, disable CPU
> turbo and power reporting to be safe.  This will keep the CPU within default
> limits and still allow us to increase GPU frequency as needed.

Any news on this one, or is it expected to be disabled indefinitely?

-- 
Anssi Hannula
