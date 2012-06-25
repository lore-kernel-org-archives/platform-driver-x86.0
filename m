From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH] intel_ips: blacklist HP ProBook laptops
Date: Mon, 25 Jun 2012 09:15:42 -0700
Message-ID: <20120625091542.7ad5e594@jbarnes-x220>
References: <s5h1ul3a6be.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:42898 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1756996Ab2FYQPW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Jun 2012 12:15:22 -0400
In-Reply-To: <s5h1ul3a6be.wl%tiwai@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 25 Jun 2012 15:07:17 +0200
Takashi Iwai <tiwai@suse.de> wrote:

> intel_ips driver spews the warning message
>   "ME failed to update for more than 1s, likely hung"
> at each second endlessly on HP ProBook laptops with IronLake.
> 
> As this has never worked, better to blacklist the driver for now.

Sounds like this ME doesn't support the feature.  It would be nice to
have a better way of detecting this, but unless we hear a bunch more
noise like this a one off is fine with me.

Acked-by: Jesse Barnes <jbarnes@virtuousgeek.org>
