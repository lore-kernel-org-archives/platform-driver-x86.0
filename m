From: Andres Salomon <dilinger@queued.net>
Subject: Re: [PATCH v4 1/1] alix2: supplement driver to include GPIO button
 support
Date: Thu, 26 Jan 2012 17:57:41 -0800
Message-ID: <20120126175741.6aa4a9cd@queued.net>
References: <1327627902-18417-1-git-send-email-philipp@redfish-solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lunge.queued.net ([173.255.254.236]:56876 "EHLO
	lunge.queued.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751645Ab2A0B5o (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Jan 2012 20:57:44 -0500
In-Reply-To: <1327627902-18417-1-git-send-email-philipp@redfish-solutions.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Philip Prindeville <philipp@redfish-solutions.com>
Cc: platform-driver-x86@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Richard Purdie <rpurdie@rpsys.net>, Ed Wildgoose <kernel@wildgooses.com>, David Woodhouse <dwmw2@infradead.org>, Andrew Morton <akpm@linux-foundation.org>

On Thu, 26 Jan 2012 18:31:42 -0700
Philip Prindeville <philipp@redfish-solutions.com> wrote:

> From: "Philip A. Prindeville" <philipp@redfish-solutions.com>
> 
> GPIO 24 is used in reference designs as a soft-reset button, and
> the alix2 is no exception. Add it as a gpio-button.
> 
> Use symbolic values to describe BIOS addresses.
> 
> Record the model number.
> 
> Changes v2 and v3 per Andres:
> Use DMI to detect the board instead of proposed coreboot library;
> Don't make including <linux/dmi.h> conditional on CONFIG_DMI;
> Ditto for calling dmi_get_system_info() in alix_present_dmi();
> Make alix_present() and alix_present_dmi() return bool;
> 
> Changes v4 per Andrew:
> Remove alix_model as this can be patched downstream where it's needed
>   anyway (ultimately, RFFILL will be supported by a new generic gpio
>   class);
> 
> Signed-off-by: Philip A. Prindeville <philipp@redfish-solutions.com>
> Acked-by: Ed Wildgoose <kernel@wildgooses.com>
> Acked-by: Andres Salomon <dilinger@queued.net>
> Cc: Andrew Morton <akpm@linux-foundation.org>
[...]
>  }
>  
> -static int __init alix_init(void)
> +static int  __init alix_init(void)

What's this about?
